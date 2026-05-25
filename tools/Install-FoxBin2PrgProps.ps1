# Copy FoxBin2Prg props_*.txt support files into tools\ (required by FoxBin2Prg.FXP / .prg)
# Run once after clone, or if you see "props_all.txt" / "File does not exist" from FoxBin2Prg.

$ErrorActionPreference = 'Stop'

$destTools = Split-Path -Parent $MyInvocation.MyCommand.Path
$destSub   = Join-Path $destTools 'foxbin2prg'

$candidates = @(
    "$env:LOCALAPPDATA\VirtualStore\Program Files (x86)\Microsoft Visual FoxPro 9\Thor\Thor\Tools\Components\FoxBin2PRG"
    'C:\Program Files (x86)\Microsoft Visual FoxPro 9\Thor\Thor\Tools\Components\FoxBin2PRG'
)

$src = $null
foreach ($c in $candidates) {
    if (Test-Path (Join-Path $c 'props_all.txt')) {
        $src = $c
        break
    }
}

if (-not $src) {
    Write-Error "Could not find Thor FoxBin2PRG folder with props_all.txt. Install FoxBin2Prg via Thor, or copy props_*.txt from https://github.com/fdbozzo/foxbin2prg"
}

Copy-Item -Path (Join-Path $src 'props_*.txt') -Destination $destTools -Force
Copy-Item -Path (Join-Path $src 'props_*.txt') -Destination $destSub -Force

$n = (Get-ChildItem (Join-Path $destTools 'props_*.txt')).Count
Write-Host "Installed $n props_*.txt file(s) to $destTools and $destSub"
