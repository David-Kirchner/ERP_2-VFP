# Create shipped blank branding graphics (run once or from InitCompanyBranding).
$ErrorActionPreference = 'Stop'
$root = 'E:\VFP\ERP_2'
Add-Type -AssemblyName System.Drawing

function Write-PlaceholderPng($path, $w, $h) {
    $dir = Split-Path $path -Parent
    if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }
    $bmp = New-Object System.Drawing.Bitmap $w, $h
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.Clear([System.Drawing.Color]::FromArgb(245, 245, 245))
    $pen = New-Object System.Drawing.Pen([System.Drawing.Color]::LightGray)
    $g.DrawRectangle($pen, 0, 0, $w - 1, $h - 1)
    $g.Dispose(); $pen.Dispose()
    $bmp.Save($path, [System.Drawing.Imaging.ImageFormat]::Png)
    $bmp.Dispose()
}

function Write-PlaceholderBmp($path, $w, $h) {
    $dir = Split-Path $path -Parent
    if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }
    $bmp = New-Object System.Drawing.Bitmap $w, $h
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.Clear([System.Drawing.Color]::White)
    $pen = New-Object System.Drawing.Pen([System.Drawing.Color]::Gainsboro)
    $g.DrawRectangle($pen, 0, 0, $w - 1, $h - 1)
    $g.Dispose(); $pen.Dispose()
    $bmp.Save($path, [System.Drawing.Imaging.ImageFormat]::Bmp)
    $bmp.Dispose()
}

Write-PlaceholderPng (Join-Path $root 'graphics\company_logo_placeholder.png') 320 120
Write-PlaceholderBmp (Join-Path $root 'graphics\Company_Rpt_Logo.bmp') 800 150
Write-PlaceholderBmp (Join-Path $root 'graphics\sig-Blank.bmp') 320 80
Write-Host 'Branding placeholders ready.'
