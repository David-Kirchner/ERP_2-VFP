# Install FoxBin2Prg Explorer integration (Send To + right-click context menu)
# Run: powershell -ExecutionPolicy Bypass -File Install-FoxBin2PrgExplorer.ps1
# Requires: VFP 9 registered (VisualFoxPro.Application.9), files in this folder

$ErrorActionPreference = 'Stop'
$ToolDir = $PSScriptRoot
$VbsBin2Prg = Join-Path $ToolDir 'Convert_VFP9_BIN_2_PRG.vbs'
$VbsPrg2Bin = Join-Path $ToolDir 'Convert_VFP9_PRG_2_BIN.vbs'
$SendTo = Join-Path $env:APPDATA 'Microsoft\Windows\SendTo'

foreach ($f in @($VbsBin2Prg, $VbsPrg2Bin, (Join-Path $ToolDir 'foxbin2prg.prg'))) {
    if (-not (Test-Path $f)) { throw "Missing required file: $f" }
}

# --- Send To (official FoxBin2Prg / VFPx method) ---
function New-SendToShortcut {
    param([string]$Name, [string]$VbsPath)
    $lnk = Join-Path $SendTo "$Name.lnk"
    $shell = New-Object -ComObject WScript.Shell
    $sc = $shell.CreateShortcut($lnk)
    $sc.TargetPath = "$env:SystemRoot\System32\wscript.exe"
    $sc.Arguments = "//Nologo `"$VbsPath`""
    $sc.WorkingDirectory = $ToolDir
    $sc.IconLocation = "$env:SystemRoot\System32\imageres.dll,104"
    $sc.Description = "FoxBin2Prg batch conversion via VFP 9"
    $sc.Save()
    Write-Host "Send To: $Name"
}

New-SendToShortcut -Name 'FoxBin2Prg - Binary to Text' -VbsPath $VbsBin2Prg
New-SendToShortcut -Name 'FoxBin2Prg - Text to Binary' -VbsPath $VbsPrg2Bin

# --- Right-click context menu (per user, HKCU) ---
function Register-FileContext {
    param(
        [string[]]$Extensions,
        [string]$MenuKey,
        [string]$MenuLabel,
        [string]$VbsPath
    )
    $cmd = "`"$env:SystemRoot\System32\wscript.exe`" //Nologo `"$VbsPath`" `"%1`""
    foreach ($ext in $Extensions) {
        $base = "HKCU:\Software\Classes\SystemFileAssociations\$ext\shell\$MenuKey"
        New-Item -Path $base -Force | Out-Null
        Set-ItemProperty -Path $base -Name '(default)' -Value $MenuLabel
        New-Item -Path "$base\command" -Force | Out-Null
        Set-ItemProperty -Path "$base\command" -Name '(default)' -Value $cmd
        Write-Host "Context menu: $ext -> $MenuLabel"
    }
}

function Register-FolderContext {
    param(
        [string]$MenuKey,
        [string]$MenuLabel,
        [string]$VbsPath
    )
    $cmd = "`"$env:SystemRoot\System32\wscript.exe`" //Nologo `"$VbsPath`" `"%1`""
    $base = "HKCU:\Software\Classes\Directory\shell\$MenuKey"
    New-Item -Path $base -Force | Out-Null
    Set-ItemProperty -Path $base -Name '(default)' -Value $MenuLabel
    New-Item -Path "$base\command" -Force | Out-Null
    Set-ItemProperty -Path "$base\command" -Name '(default)' -Value $cmd
    Write-Host "Folder context: $MenuLabel"
}

$binExts = @('.scx','.vcx','.vct','.frx','.mnx','.pjx','.lbx','.dbc','.dbf','.app','.mpr')
$txtExts = @('.sc2','.vc2','.fr2','.mn2','.pj2','.lb2','.dbc2','.dbf2','.mpr2','.pj2')

Register-FileContext -Extensions $binExts -MenuKey 'FoxBin2Prg_BIN2PRG' `
    -MenuLabel "FoxBin2Prg: Binary to Text" -VbsPath $VbsBin2Prg
Register-FileContext -Extensions $txtExts -MenuKey 'FoxBin2Prg_PRG2BIN' `
    -MenuLabel "FoxBin2Prg: Text to Binary" -VbsPath $VbsPrg2Bin

Register-FolderContext -MenuKey 'FoxBin2Prg_BIN2PRG' `
    -MenuLabel "FoxBin2Prg: Binary to Text (folder)" -VbsPath $VbsBin2Prg
Register-FolderContext -MenuKey 'FoxBin2Prg_PRG2BIN' `
    -MenuLabel "FoxBin2Prg: Text to Binary (folder)" -VbsPath $VbsPrg2Bin

# Marker for uninstall
$marker = Join-Path $ToolDir '.explorer-installed'
@{
    InstalledAt = (Get-Date).ToString('o')
    ToolDir = $ToolDir
    SendTo = @('FoxBin2Prg - Binary to Text.lnk', 'FoxBin2Prg - Text to Binary.lnk')
} | ConvertTo-Json | Set-Content $marker -Encoding UTF8

Write-Host ""
Write-Host "Done. Restart Explorer or sign out/in if menus do not appear immediately."
Write-Host "Usage:"
Write-Host "  - Right-click .scx/.vcx/... -> FoxBin2Prg: Binary to Text"
Write-Host "  - Right-click .sc2/.vc2/... -> FoxBin2Prg: Text to Binary"
Write-Host "  - Right-click folder -> batch convert"
Write-Host "  - Right-click file(s) -> Send to -> FoxBin2Prg ..."
