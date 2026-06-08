# Fix legacy [AR.TableName] and dbo.Ar.TableName references to dbo.Ar_TableName (ERP_2 archive schema).
$ErrorActionPreference = 'Stop'
$root = 'E:\VFP\ERP_2'

# Canonical targets keyed by case-insensitive legacy fragment (after AR.)
$canonicalByLegacy = @{
    'StockLst_Process_GS_History'      = 'Ar_StockLst_Process_GS_History'
    'BrokerLst_Process_GS_History'     = 'Ar_BrokerLst_Process_GS_History'
    'WIPLst_Process_GS_History'        = 'Ar_WIPLst_Process_GS_History'
    'StockLst_Process_Detail_History'  = 'Ar_StockLst_Process_Detail_History'
    'BrokerLst_Process_Detail_History' = 'Ar_BrokerLst_Process_Detail_History'
    'WIPLst_Process_Detail_History'    = 'Ar_WIPLst_Process_Detail_History'
    'StockLst_Process_History'         = 'Ar_StockLst_Process_History'
    'BrokerLst_Process_History'        = 'Ar_BrokerLst_Process_History'
    'WIPLst_Process_History'           = 'Ar_WIPLst_Process_History'
    'StockLst_Master_History'          = 'Ar_Stocklst_Master_History'
    'BrokerLst_Master_History'           = 'Ar_BrokerLst_Master_history'
    'WIPLst_Master_History'            = 'Ar_WIPLst_Master_History'
    'StockLst_Detail_History'          = 'Ar_Stocklst_Detail_History'
    'BrokerLst_Detail_History'         = 'Ar_BrokerLst_Detail_History'
    'WIPLst_Detail_History'            = 'Ar_WIPlst_Detail_History'
    'Sales_No_History'                 = 'Ar_Sales_No_History'
    'Sales_History'                    = 'Ar_Sales_History'
    'SalesP_Customer_History'          = 'Ar_SalesP_Customer_History'
    'AllQuotes_History'                = 'Ar_AllQuotes_History'
    'AlloySurcharge_History'           = 'Ar_AlloySurcharge_History'
    'Cert_History'                     = 'Ar_Cert_History'
    'PackingSlip_No'                   = 'Ar_PackingSlip_No'
    'PackingSlip'                      = 'Ar_PackingSlip'
    'PurchaseOrder_hist'               = 'Ar_PurchaseOrder_hist'
    'Receiving_Hist'                   = 'Ar_Receiving_Hist'
    'GFMlog_hist'                      = 'Ar_GFMlog_hist'
    'LakeErie_log_hist'                = 'Ar_LakeErie_log_hist'
    'Roll_log_hist'                    = 'Ar_Roll_log_hist'
    'pricetable_hist'                  = 'Ar_PriceTable_hist'
    'ShipAddr_History'                 = 'Ar_ShipAddr_History'
}

$extensions = @('*.SC2','*.VC2','*.prg','*.txt','*.sql','*.md')
$files = @()
foreach ($ext in $extensions) {
    $files += Get-ChildItem -Path $root -Recurse -Filter $ext -File -ErrorAction SilentlyContinue |
        Where-Object {
            $_.FullName -notmatch '\\tools\\' -and
            $_.FullName -notmatch '\\node_modules\\'
        }
}

function Fix-ArReferences([string]$text) {
    # Case-insensitive [AR.<legacy>] or [AR.<legacy> (unclosed)
    $text = [regex]::Replace($text, '\[AR\.([A-Za-z0-9_]+)\]?', {
        param($m)
        $frag = $m.Groups[1].Value
        $key = $canonicalByLegacy.Keys | Where-Object { $_ -ieq $frag } | Select-Object -First 1
        if ($key) { return $canonicalByLegacy[$key] }
        return $m.Value
    })
    # dbo.Ar.TableName -> dbo.Ar_TableName (SQL triggers/procs)
    $text = [regex]::Replace($text, '(?i)(?<!\w)dbo\.Ar\.', 'dbo.Ar_')
    # stray control chars after ] from bad edits
    $text = $text -replace '\]\x1d', ']'
    $text = $text -replace '\]\x1d ', ' '
    return $text
}

$changed = @()
foreach ($f in $files) {
    $raw = [System.IO.File]::ReadAllText($f.FullName)
    $new = Fix-ArReferences $raw
    if ($new -ne $raw) {
        [System.IO.File]::WriteAllText($f.FullName, $new)
        $changed += $f.FullName.Substring($root.Length + 1)
    }
}

# Security grant scripts: match Ar_* not AR.*
$grantFiles = @(
    "$root\MEM\SQL\Security\03_GrantArchiveAndNR_Permissions.sql",
    "$root\MEM\SQL\Create ERP_new\19_GrantArchiveAndNR_Permissions.sql",
    "$root\MEM\SQL\Security\README-Permissions.md"
)
foreach ($gf in $grantFiles) {
    if (-not (Test-Path $gf)) { continue }
    $raw = [System.IO.File]::ReadAllText($gf)
    $new = $raw
    $new = $new.Replace("t.name LIKE N'AR.%' ESCAPE N'\';", "t.name LIKE N'Ar[_]%' ESCAPE N'\';")
    $new = $new.Replace('[AR.*]', 'Ar_*')
    $new = $new.Replace('AR.*', 'Ar_*')
    $new = $new.Replace('AR./NR_', 'Ar_/NR_')
    if ($new -ne $raw) {
        [System.IO.File]::WriteAllText($gf, $new)
        $changed += $gf.Substring($root.Length + 1)
    }
}

Write-Host "Updated $($changed.Count) files:"
$changed | ForEach-Object { Write-Host "  $_" }

# Verify no [AR. left in app/sql (excluding this script)
$remaining = Select-String -Path (Join-Path $root 'Forms\*'), (Join-Path $root 'PROGS\*'), (Join-Path $root 'LIBS\*'), (Join-Path $root 'INCLUDE\*'), (Join-Path $root 'MEM\SQL\*') -Pattern '\[AR\.' -ErrorAction SilentlyContinue
if ($remaining) {
    Write-Host "`nWARNING: remaining [AR. references:"
    $remaining | ForEach-Object { Write-Host "  $($_.Path):$($_.LineNumber)" }
    exit 1
}
Write-Host "`nNo [AR. references remain in Forms/PROGS/LIBS/INCLUDE/MEM/SQL."
