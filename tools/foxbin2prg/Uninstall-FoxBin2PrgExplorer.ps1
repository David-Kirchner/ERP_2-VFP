# Remove FoxBin2Prg Explorer integration
# Run: powershell -ExecutionPolicy Bypass -File Uninstall-FoxBin2PrgExplorer.ps1

$ErrorActionPreference = 'Stop'
$SendTo = Join-Path $env:APPDATA 'Microsoft\Windows\SendTo'

foreach ($name in @('FoxBin2Prg - Binary to Text.lnk', 'FoxBin2Prg - Text to Binary.lnk')) {
    $lnk = Join-Path $SendTo $name
    if (Test-Path $lnk) {
        Remove-Item $lnk -Force
        Write-Host "Removed Send To: $name"
    }
}

$menuKeys = @('FoxBin2Prg_BIN2PRG', 'FoxBin2Prg_PRG2BIN')
$binExts = @('.scx','.vcx','.vct','.frx','.mnx','.pjx','.lbx','.dbc','.dbf','.app','.mpr')
$txtExts = @('.sc2','.vc2','.fr2','.mn2','.pj2','.lb2','.dbc2','.dbf2','.mpr2','.pj2')

foreach ($ext in ($binExts + $txtExts)) {
    foreach ($key in $menuKeys) {
        $path = "HKCU:\Software\Classes\SystemFileAssociations\$ext\shell\$key"
        if (Test-Path $path) {
            Remove-Item $path -Recurse -Force
            Write-Host "Removed context: $ext\$key"
        }
    }
}

foreach ($key in $menuKeys) {
    $path = "HKCU:\Software\Classes\Directory\shell\$key"
    if (Test-Path $path) {
        Remove-Item $path -Recurse -Force
        Write-Host "Removed folder context: $key"
    }
}

$marker = Join-Path $PSScriptRoot '.explorer-installed'
if (Test-Path $marker) { Remove-Item $marker -Force }

Write-Host "FoxBin2Prg Explorer integration removed."
