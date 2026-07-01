# Extract formset methods >64KB from SQL_certs.sc2 into PROGS/*.prg
$root = "E:\VFP\ERP_2"
$sc2Path = Join-Path $root "Forms\SQL_certs.sc2"
$progsDir = Join-Path $root "PROGS"

if (-not (Test-Path $sc2Path)) {
    throw "Form not found: $sc2Path"
}

$lines = [System.Collections.Generic.List[string]]::new()
$lines.AddRange([System.IO.File]::ReadAllLines($sc2Path))

function Extract-And-Replace {
    param(
        [string]$ProcName,
        [string]$OutPrg,
        [string]$LauncherLine,
        [string[]]$ParamLines,
        [switch]$ReplaceThisForm
    )
    $start = -1
    for ($i = 0; $i -lt $lines.Count; $i++) {
        if ($lines[$i] -match "^\s*PROCEDURE\s+$([regex]::Escape($ProcName))\s*`$") {
            $start = $i
            break
        }
    }
    if ($start -lt 0) { throw "PROCEDURE $ProcName not found" }
    $end = $start
    for ($j = $start + 1; $j -lt $lines.Count; $j++) {
        if ($lines[$j] -match '^\s*ENDPROC\s*$') { $end = $j; break }
    }
    $body = New-Object System.Collections.Generic.List[string]
    for ($j = $start + 1; $j -lt $end; $j++) {
        $line = $lines[$j]
        $line = $line -replace 'ThisFormset', 'toFormSet'
        $line = $line -replace 'ThisFormSet', 'toFormSet'
        if ($ReplaceThisForm) {
            $line = $line -replace 'ThisForm\.', 'toForm.'
            $line = $line -replace '\bThisForm\b', 'toForm'
        }
        $body.Add($line)
    }
    $prg = New-Object System.Collections.Generic.List[string]
    $prg.Add("* $OutPrg - extracted from sql_certs ($ProcName); was >64KB in .sct memo")
    foreach ($pl in $ParamLines) { $prg.Add($pl) }
    $prg.Add("")
    $prg.AddRange($body)
    $outPath = Join-Path $progsDir $OutPrg
    [System.IO.File]::WriteAllLines($outPath, $prg)

    $replacement = @(
        "`tPROCEDURE $ProcName",
        "`t`t$LauncherLine",
        "`tENDPROC"
    )
    for ($k = $end; $k -ge $start; $k--) { $lines.RemoveAt($k) }
    for ($k = $replacement.Count - 1; $k -ge 0; $k--) { $lines.Insert($start, $replacement[$k]) }
    Write-Host "OK $ProcName -> PROGS\$OutPrg ($($body.Count) lines)"
}

Extract-And-Replace -ProcName 'frmCheckSpec.cmdCheck.Click' -OutPrg 'sql_certs_check_spec.prg' `
    -LauncherLine 'DO PROGS\sql_certs_check_spec WITH ThisForm, ThisFormSet' `
    -ParamLines @('LPARAMETERS toForm, toFormSet') `
    -ReplaceThisForm

Extract-And-Replace -ProcName 'addnewcert' -OutPrg 'sql_certs_addnewcert.prg' `
    -LauncherLine 'DO PROGS\sql_certs_addnewcert WITH ThisFormSet' `
    -ParamLines @('LPARAMETERS toFormSet')

Extract-And-Replace -ProcName 'savespacexhardness' -OutPrg 'sql_certs_savespacexhardness.prg' `
    -LauncherLine 'DO PROGS\sql_certs_savespacexhardness WITH ThisFormSet' `
    -ParamLines @('LPARAMETERS toFormSet')

[System.IO.File]::WriteAllLines($sc2Path, $lines)
Write-Host "Updated $sc2Path; lines now $($lines.Count)"
