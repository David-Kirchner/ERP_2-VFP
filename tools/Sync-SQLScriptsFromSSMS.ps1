# Copy SQL build scripts from SSMS OneDrive folder into ERP_2 git repo
# Run after editing scripts in SSMS, before GitCommit.

$ErrorActionPreference = 'Stop'

$src = "$env:USERPROFILE\OneDrive\Documents\SQL Server Management Studio 22\Create ERP_new"
$dst = "E:\VFP\ERP_2\MEM\Create ERP_new"

if (-not (Test-Path $src)) {
    Write-Error "SSMS folder not found: $src"
}

New-Item -ItemType Directory -Path $dst -Force | Out-Null
Copy-Item -Path (Join-Path $src '*') -Destination $dst -Force

Write-Host "Synced to $dst :"
Get-ChildItem $dst -File | Sort-Object Name | ForEach-Object {
    Write-Host ("  {0,-40} {1}" -f $_.Name, $_.LastWriteTime)
}

Write-Host ""
Write-Host "Next: add incremental changes under MEM\SQL\Migrations\ if needed, then DO GitCommit or git commit."
