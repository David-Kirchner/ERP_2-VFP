<#
.SYNOPSIS
  Stage SAUSA-ERP payload and build a per-machine MSI for GPO.

.EXAMPLE
  powershell -ExecutionPolicy Bypass -File E:\VFP\ERP_2\installer\Build-SAUSA-ERP-MSI.ps1
  powershell -ExecutionPolicy Bypass -File E:\VFP\ERP_2\installer\Build-SAUSA-ERP-MSI.ps1 -PublishShare
#>
[CmdletBinding()]
param(
  [string]$RepoRoot = "E:\VFP\ERP_2",
  [string]$ProductVersion = "",
  [switch]$PublishShare,
  [string]$SharePath = "\\192.168.5.3\Share\SAUSA-ERP"
)

$ErrorActionPreference = "Stop"
$installer = Join-Path $RepoRoot "installer"
$payload = Join-Path $installer "payload"
$runtime = Join-Path $payload "runtime"
$outDir = Join-Path $installer "out"
$vfpShared = "C:\Program Files (x86)\Common Files\Microsoft Shared\VFP"
$exeSrc = Join-Path $RepoRoot "SAUSA-ERP.exe"

if (-not (Test-Path $exeSrc)) {
  throw "Missing $exeSrc - build SAUSA-ERP.exe in VFP first."
}
if (-not (Get-Command wix -ErrorAction SilentlyContinue)) {
  throw "WiX CLI not found. Run: dotnet tool install --global wix   then: wix eula accept wix7"
}

if ([string]::IsNullOrWhiteSpace($ProductVersion)) {
  $vi = [Diagnostics.FileVersionInfo]::GetVersionInfo($exeSrc)
  $ProductVersion = $vi.FileVersion
  if ([string]::IsNullOrWhiteSpace($ProductVersion)) { $ProductVersion = "0.2.2" }
}
$parts = @($ProductVersion -split '[^\d]+' | Where-Object { $_ -ne '' })
while ($parts.Count -lt 3) { $parts += '0' }
$ProductVersion = ($parts[0..2] -join '.')
Write-Host "ProductVersion=$ProductVersion"

foreach ($d in @($payload, $runtime, (Join-Path $payload "MEM"), (Join-Path $payload "GRAPHICS"), $outDir)) {
  New-Item -ItemType Directory -Force -Path $d | Out-Null
}

Copy-Item $exeSrc (Join-Path $payload "SAUSA-ERP.exe") -Force
Copy-Item (Join-Path $installer "ERP_Environment.Production.xml") (Join-Path $payload "ERP_Environment.xml") -Force

$cfg = Join-Path $RepoRoot "config.fpw"
if (Test-Path $cfg) { Copy-Item $cfg (Join-Path $payload "config.fpw") -Force }
else { Copy-Item (Join-Path $vfpShared "config.fpw") (Join-Path $payload "config.fpw") -Force }

$iconCandidates = @(
  (Join-Path $RepoRoot "ICO\SpaceAlloysUSA.ico"),
  (Join-Path $RepoRoot "Forms\Graphics\ERP_Company.ico"),
  (Join-Path $RepoRoot "MEM\Company_Icon.ico")
)
$icon = $iconCandidates | Where-Object { Test-Path $_ } | Select-Object -First 1
if (-not $icon) { throw "No app icon (.ico) found." }
Write-Host "App icon: $icon"
Copy-Item $icon (Join-Path $payload "AppIcon.ico") -Force
Copy-Item $icon (Join-Path $payload "GRAPHICS\ERP_Company.ico") -Force
Copy-Item (Join-Path $RepoRoot "MEM\Company_Icon.ico") (Join-Path $payload "MEM\Company_Icon.ico") -Force

$runtimeFiles = @(
  "vfp9r.dll", "VFP9RENU.DLL", "vfp9t.dll",
  "msvcr71.dll", "msvcp71.dll",
  "ReportBuilder.app", "ReportOutput.app", "ReportPreview.app"
)
foreach ($f in $runtimeFiles) {
  $src = Join-Path $vfpShared $f
  if (-not (Test-Path $src)) { throw "Missing VFP runtime file: $src" }
  Copy-Item $src (Join-Path $runtime $f) -Force
}

$msiName = "SAUSA-ERP-$ProductVersion.msi"
$msiOut = Join-Path $outDir $msiName

Push-Location $installer
try {
  & wix build "SAUSA-ERP.wxs" `
    -ext WixToolset.Util.wixext `
    -arch x86 `
    -d "ProductVersion=$ProductVersion" `
    -o $msiOut
  if ($LASTEXITCODE -ne 0) { throw "wix build failed (exit $LASTEXITCODE)" }
}
finally {
  Pop-Location
}

$mb = [math]::Round((Get-Item $msiOut).Length / 1MB, 1)
Write-Host ("Built: {0} ({1} MB)" -f $msiOut, $mb)

$latest = Join-Path $outDir "SAUSA-ERP.msi"
Copy-Item $msiOut $latest -Force
Write-Host "Also: $latest"

if ($PublishShare) {
  if (-not (Test-Path $SharePath)) {
    New-Item -ItemType Directory -Force -Path $SharePath | Out-Null
  }
  Copy-Item $msiOut (Join-Path $SharePath $msiName) -Force
  Copy-Item $latest (Join-Path $SharePath "SAUSA-ERP.msi") -Force
  $readme = Join-Path $installer "README-GPO.md"
  if (Test-Path $readme) {
    Copy-Item $readme (Join-Path $SharePath "README-GPO.md") -Force
  }
  Write-Host "Published to $SharePath"
  Get-ChildItem $SharePath | Format-Table Name, Length, LastWriteTime -AutoSize
}

Write-Host "Done."
