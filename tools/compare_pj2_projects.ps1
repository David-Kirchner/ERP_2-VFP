# Compare .ADD() lines from PJ2 project text files
$root = 'E:\VFP\ERP_2'
$erpOrig = 'E:\VFP\ERP\ERP.PJ2'
$files = @(
    @{ Label = 'ERP_2\ERP.PJ2 (current text)'; Path = Join-Path $root 'ERP.PJ2' },
    @{ Label = 'ERP_2\ERP-crash'; Path = Join-Path $root 'ERP-crash.PJ2' },
    @{ Label = 'ERP_2\erp_2'; Path = Join-Path $root 'erp_2.PJ2' },
    @{ Label = 'ERP_2\erp_test'; Path = Join-Path $root 'erp_test.PJ2' },
    @{ Label = 'E:\VFP\ERP (original)'; Path = $erpOrig }
)
function Get-AddLines($path) {
    if (-not (Test-Path $path)) { return @() }
    $lines = Get-Content $path -ErrorAction SilentlyContinue
    $adds = @()
    foreach ($line in $lines) {
        if ($line -match "\.ADD\('([^']+)'\)") {
            $adds += $matches[1].ToLower()
        }
    }
    return $adds | Sort-Object -Unique
}
$sets = @{}
foreach ($f in $files) {
    $sets[$f.Label] = Get-AddLines $f.Path
}
$out = Join-Path $root 'MEM\ERP2_vs_ERP-crash_files.txt'
$crash = $sets['ERP_2\ERP-crash']
$e2 = $sets['ERP_2\erp_2']

@"
ERP_2 vs ERP-crash project comparison
Generated: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')

PJT sizes (bytes):
  ERP-crash.pjt: $((Get-Item (Join-Path $root 'ERP-crash.pjt') -ErrorAction SilentlyContinue).Length)
  erp_2.pjt:     $((Get-Item (Join-Path $root 'erp_2.pjt') -ErrorAction SilentlyContinue).Length)
  erp_test.pjt:  $((Get-Item (Join-Path $root 'erp_test.pjt') -ErrorAction SilentlyContinue).Length)

Member counts (.ADD lines in PJ2 text):
"@ | Set-Content $out -Encoding UTF8
foreach ($f in $files) {
    $c = $sets[$f.Label].Count
    $exists = Test-Path $f.Path
    Add-Content $out "$($f.Label): $c members (pj2 exists=$exists)"
}
Add-Content $out ''
Add-Content $out '--- ONLY in ERP-crash (not in erp_2) ---'
$onlyCrash = $crash | Where-Object { $_ -notin $e2 }
$onlyCrash | ForEach-Object { Add-Content $out "  $_" }
Add-Content $out "Count: $($onlyCrash.Count)"
Add-Content $out ''
Add-Content $out '--- ONLY in erp_2 (not in ERP-crash) ---'
$onlyE2 = $e2 | Where-Object { $_ -notin $crash }
$onlyE2 | ForEach-Object { Add-Content $out "  $_" }
Add-Content $out "Count: $($onlyE2.Count)"
Add-Content $out ''
Add-Content $out '--- ERP.PJ2 vs ERP-crash (should match) ---'
$erp2text = $sets['ERP_2\ERP.PJ2 (current text)']
$onlyPj2vsCrash = $erp2text | Where-Object { $_ -notin $crash }
Add-Content $out "ERP.PJ2 not in crash: $($onlyPj2vsCrash.Count)"
$onlyCrashVsPj2 = $crash | Where-Object { $_ -notin $erp2text }
Add-Content $out "Crash not in ERP.PJ2: $($onlyCrashVsPj2.Count)"
Write-Output "Wrote $out"
