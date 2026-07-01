$sc2 = Get-Content 'E:\VFP\ERP_2\Forms\SQL_certs.sc2' -Raw -Encoding Default
$enc = [System.Text.Encoding]::GetEncoding(1252)
$procs = [regex]::Matches($sc2, '(?m)^\tPROCEDURE (.+)$')
for ($i = 0; $i -lt $procs.Count; $i++) {
    $name = $procs[$i].Groups[1].Value
    $start = $procs[$i].Index
    $end = if ($i + 1 -lt $procs.Count) { $procs[$i + 1].Index } else { $sc2.Length }
    $body = $sc2.Substring($start, $end - $start)
    $bytes = $enc.GetByteCount($body)
    if ($bytes -gt 50000) { Write-Output "$name : $bytes bytes" }
}
