# Extract formset methods >64KB from erp_certs.SC2 into PROGS/*.prg
$sc2Path = "E:\VFP\ERP_2\Forms\erp_certs.SC2"
$lines = [System.Collections.Generic.List[string]]::new()
$lines.AddRange([System.IO.File]::ReadAllLines($sc2Path))

function Extract-And-Replace {
    param(
        [string]$ProcName,
        [string]$OutPrg,
        [string]$LauncherLine,
        [string[]]$ParamLines
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
        if ($ProcName -eq 'frmCheckSpec.cmdCheck.Click') {
            $line = $line -replace 'ThisForm\.', 'toForm.'
            $line = $line -replace '\bThisForm\b', 'toForm'
        }
        $body.Add($line)
    }
    $prg = New-Object System.Collections.Generic.List[string]
    $prg.Add("* $OutPrg - extracted from erp_certs ($ProcName); was >64KB in .sct memo")
    foreach ($pl in $ParamLines) { $prg.Add($pl) }
    $prg.Add("")
    $prg.AddRange($body)
    [System.IO.File]::WriteAllLines("E:\VFP\ERP_2\PROGS\$OutPrg", $prg)

    $replacement = @(
        "`tPROCEDURE $ProcName",
        "`t`t$LauncherLine",
        "`tENDPROC"
    )
    for ($k = $end; $k -ge $start; $k--) { $lines.RemoveAt($k) }
    for ($k = $replacement.Count - 1; $k -ge 0; $k--) { $lines.Insert($start, $replacement[$k]) }
    Write-Host "OK $ProcName -> PROGS\$OutPrg ($($body.Count) lines)"
}

Extract-And-Replace -ProcName 'frmCheckSpec.cmdCheck.Click' -OutPrg 'erp_certs_check_spec.prg' `
    -LauncherLine 'DO PROGS\erp_certs_check_spec WITH ThisForm, ThisFormSet' `
    -ParamLines @('LPARAMETERS toForm, toFormSet')

Extract-And-Replace -ProcName 'addnewcert' -OutPrg 'erp_certs_addnewcert.prg' `
    -LauncherLine 'DO PROGS\erp_certs_addnewcert WITH ThisFormSet' `
    -ParamLines @('LPARAMETERS toFormSet')

[System.IO.File]::WriteAllLines($sc2Path, $lines)
Write-Host "Updated $sc2Path; lines now $($lines.Count)"
