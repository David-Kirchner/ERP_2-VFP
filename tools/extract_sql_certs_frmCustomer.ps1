# Extract frmCustomer from SQL_certs formset into standalone form + PRG launcher
$ErrorActionPreference = 'Stop'
$root = 'E:\VFP\ERP_2'
$sc2  = Join-Path $root 'Forms\SQL_certs.sc2'
$bak  = Join-Path $root 'Forms\SQL_certs.sc2.bak_before_frmCustomer_split'
$outForm = Join-Path $root 'Forms\sql_certs_frmCustomer.sc2'
$outLib  = Join-Path $root 'PROGS\sql_certs_customer_form.prg'

Copy-Item $sc2 $bak -Force
$lines = [System.IO.File]::ReadAllLines($sc2)

function Strip-FrmCustomerPrefix([string]$s) {
    if ($s -match 'ObjPath="frmCustomer"') { return $null }
    $s = $s -replace 'ObjPath="frmCustomer\.', 'ObjPath="'
    $s = $s -replace "ADD OBJECT 'frmCustomer\.", "ADD OBJECT '"
    return $s
}

function Rewrite-CustomerProcLine([string]$s) {
    $s = $s -replace 'ThisFormSet\.', 'ThisForm.oCertFormSet.'
    $s = $s -replace 'ThisFormset\.', 'ThisForm.oCertFormSet.'
    return $s
}

$objDataStart = 244; $objDataEnd = 273
$addStart = 4741; $addEnd = 5169
$procStart = 11438; $procEnd = 11820

# --- standalone form SC2 ---
$header = @(
'*--------------------------------------------------------------------------------------------------------------------------------------------------------',
'* sql_certs_frmCustomer - Customer CO editor (split from SQL_certs formset)',
'*--------------------------------------------------------------------------------------------------------------------------------------------------------',
'*< FOXBIN2PRG: Version="1.21" SourceFile="sql_certs_frmCustomer.scx" CPID="1252" />',
'*',
'DEFINE CLASS dataenvironment AS dataenvironment',
' 	*< CLASSDATA: Baseclass="dataenvironment" Timestamp="" Scale="" Uniqueid="" ClassIcon="2" />',
'	*<PropValue>',
'		DataSource = .NULL.',
'		Height = 200',
'		Left = 1',
'		Name = "Dataenvironment"',
'		Top = 220',
'		Width = 520',
'	*</PropValue>',
'ENDDEFINE',
'',
'DEFINE CLASS sql_certs_frmCustomer AS form',
' 	*< CLASSDATA: Baseclass="form" Timestamp="" Scale="" Uniqueid="" />',
'',
'	*<DefinedPropArrayMethod>',
'		*p: oCertFormSet',
'	*</DefinedPropArrayMethod>',
''
)

$formLines = New-Object System.Collections.Generic.List[string]
foreach ($h in $header) { $formLines.Add($h) }

for ($i = $objDataStart; $i -le $objDataEnd; $i++) {
    $stripped = Strip-FrmCustomerPrefix $lines[$i-1]
    if ($null -ne $stripped) { $formLines.Add($stripped) }
}

$formLines.Add('')
$formLines.Add('	*<PropValue>')
$formLines.Add('		Caption = "Customer specific - Be sure to have correct company before printing!"')
$formLines.Add('		Closable = .F.')
$formLines.Add('		ControlBox = .F.')
$formLines.Add('		DoCreate = .T.')
$formLines.Add('		HalfHeightCaption = .T.')
$formLines.Add('		Height = 215')
$formLines.Add('		Left = 647')
$formLines.Add('		MaxButton = .T.')
$formLines.Add('		MDIForm = .T.')
$formLines.Add('		MinButton = .F.')
$formLines.Add('		MinHeight = 172')
$formLines.Add('		MinWidth = 484')
$formLines.Add('		Name = "frmCustomer"')
$formLines.Add('		ShowTips = .T.')
$formLines.Add('		Top = 311')
$formLines.Add('		Width = 484')
$formLines.Add('	*</PropValue>')
$formLines.Add('')

$skipFormTail = $false
for ($i = $addStart; $i -le $addEnd; $i++) {
    $line = $lines[$i-1]
    if ($line -match "ADD OBJECT 'frmCustomer' AS form") {
        $skipFormTail = $true
        continue
    }
    if ($skipFormTail) {
        if ($line -match '\*< END OBJECT: BaseClass="form"') { $skipFormTail = $false }
        continue
    }
    $formLines.Add((Strip-FrmCustomerPrefix $line))
}

$formLines.Add('')
$formLines.Add('	PROCEDURE Init')
$formLines.Add('		LPARAMETERS toFormSet')
$formLines.Add('		IF VARTYPE(toFormSet) = "O"')
$formLines.Add('			ThisForm.oCertFormSet = toFormSet')
$formLines.Add('		ENDIF')
$formLines.Add('	ENDPROC')
$formLines.Add('')

$inProc = $false
for ($i = $procStart; $i -le $procEnd; $i++) {
    $line = $lines[$i-1]
    if ($line -match '^\s*PROCEDURE frmCustomer\.') {
        $inProc = $true
        $newName = ($line -replace 'PROCEDURE frmCustomer\.', 'PROCEDURE ')
        $formLines.Add($newName)
        continue
    }
    if ($line -match '^\s*ENDPROC\s*$' -and $inProc) {
        $formLines.Add($line)
        $inProc = $false
        $formLines.Add('')
        continue
    }
    if ($inProc) {
        $formLines.Add((Rewrite-CustomerProcLine $line))
    }
}

$formLines.Add('ENDDEFINE')
[System.IO.File]::WriteAllLines($outForm, $formLines)

# --- customer helper PRG ---
$lib = @(
'* sql_certs_customer_form.prg - runtime frmCustomer launcher',
'',
'FUNCTION SqlCerts_GetFrmCustomer',
'	LPARAMETERS toFormSet',
'	LOCAL loFrm',
'	IF VARTYPE(toFormSet.oFrmCustomer) = "O" AND !ISNULL(toFormSet.oFrmCustomer)',
'		IF TYPE("toFormSet.oFrmCustomer.Name") = "C"',
'			RETURN toFormSet.oFrmCustomer',
'		ENDIF',
'	ENDIF',
'	DO FORM Forms\sql_certs_frmCustomer WITH toFormSet NAME loFrm LINK NOSHOW',
'	toFormSet.oFrmCustomer = loFrm',
'	RETURN loFrm',
'ENDFUNC',
'',
'PROCEDURE SqlCerts_ShowFrmCustomer',
'	LPARAMETERS toFormSet',
'	LOCAL loFrm',
'	loFrm = SqlCerts_GetFrmCustomer(toFormSet)',
'	loFrm.Visible = .T.',
'	loFrm.Show',
'ENDPROC',
'',
'PROCEDURE SqlCerts_ReleaseFrmCustomer',
'	LPARAMETERS toFormSet',
'	IF VARTYPE(toFormSet.oFrmCustomer) = "O"',
'		toFormSet.oFrmCustomer.Release',
'		toFormSet.oFrmCustomer = .NULL.',
'	ENDIF',
'ENDPROC'
)
[System.IO.File]::WriteAllLines($outLib, $lib)

# --- strip from main SC2 ---
$keep = New-Object System.Collections.Generic.List[string]
$skipCustomerEndIf = $false
for ($i = 1; $i -le $lines.Count; $i++) {
    if ($i -ge $objDataStart -and $i -le $objDataEnd) { continue }
    if ($i -ge $addStart -and $i -le $addEnd) { continue }
    if ($i -ge $procStart -and $i -le $procEnd) { continue }
    $line = $lines[$i-1]

    if ($line -match '^\s*IF VARTYPE\(ThisFormSet\.frmCustomer\)') {
        $keep.Add('		DO SqlCerts_ReleaseFrmCustomer IN PROGS\sql_certs_customer_form.prg WITH ThisFormSet')
        $skipCustomerEndIf = $true
        continue
    }
    if ($skipCustomerEndIf -and $line -match '^\s*ENDIF\s*$') {
        $skipCustomerEndIf = $false
        continue
    }
    if ($line -match 'ThisFormSet\.frmCustomer\.Release') { continue }

    $keep.Add($line)
}

$final = New-Object System.Collections.Generic.List[string]
foreach ($line in $keep) {
    $final.Add($line)
    if ($line -match '\*p: ofrmspacex') {
        $final.Add('		*p: ofrmcustomer')
    }
}

$text = ($final -join "`r`n") + "`r`n"
$text = $text -replace 'ThisFormset\.frmCustomer', 'ThisFormSet.GetFrmCustomer()'
$text = $text -replace 'ThisFormSet\.frmCustomer', 'ThisFormSet.GetFrmCustomer()'

# Show customer form when main cert form loads
$loadMarker = "PROCEDURE ERPCert.Load`r`n`t`t"
if ($text -notmatch 'SqlCerts_ShowFrmCustomer') {
    $text = $text -replace '(PROCEDURE ERPCert\.Load\r?\n)(\s*PUBLIC gaChemistry)', "`$1`t`tDO SqlCerts_ShowFrmCustomer IN PROGS\sql_certs_customer_form.prg WITH ThisFormSet`r`n`r`n`$2"
}

[System.IO.File]::WriteAllText($sc2, $text)

Write-Host "OK: $outForm"
Write-Host "OK: $outLib"
Write-Host "OK: patched $sc2"
