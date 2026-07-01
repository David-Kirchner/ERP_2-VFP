# Extract frmSpaceX from SQL_certs formset into standalone form + PRG helpers
$ErrorActionPreference = 'Stop'
$root = 'E:\VFP\ERP_2'
$sc2  = Join-Path $root 'Forms\SQL_certs.sc2'
$bak  = Join-Path $root 'Forms\SQL_certs.sc2.bak_before_frmSpaceX_split'
$outForm = Join-Path $root 'Forms\sql_certs_frmSpaceX.sc2'
$outLib  = Join-Path $root 'PROGS\sql_certs_spacex_form.prg'

Copy-Item $sc2 $bak -Force
$lines = [System.IO.File]::ReadAllLines($sc2)

function Strip-FrmSpaceXPrefix([string]$s) {
    $s = $s -replace "ObjPath=`"frmSpaceX\.", 'ObjPath="'
    $s = $s -replace "ObjPath=`"frmSpaceX`"", 'ObjPath="frmSpaceX"'
    $s = $s -replace "ADD OBJECT 'frmSpaceX\.", "ADD OBJECT '"
    $s = $s -replace "ADD OBJECT 'frmSpaceX' AS form", "ADD OBJECT 'frmSpaceX' AS form"
    $s = $s -replace 'ThisFormSet\.', 'toFormSet.'
    $s = $s -replace 'ThisFormSet\.frmSpaceX', 'loFrmSpaceX'
    $s = $s -replace 'toFormSet\.frmSpaceX', 'loFrmSpaceX'
    return $s
}

# 1-based line ranges in SQL_certs.sc2
$objDataStart = 281; $objDataEnd = 413
$addStart = 5505; $addEnd = 7150
$procEditStart = 14114; $procEditEnd = 14144
$enableStart = 7931; $enableEnd = 8085
$showStart = 11119; $showEnd = 11396

# --- Build standalone form SC2 ---
$header = @(
'*--------------------------------------------------------------------------------------------------------------------------------------------------------',
'* sql_certs_frmSpaceX - SpaceX hardness profile (split from SQL_certs formset)',
'*--------------------------------------------------------------------------------------------------------------------------------------------------------',
'*< FOXBIN2PRG: Version="1.21" SourceFile="sql_certs_frmSpaceX.scx" CPID="1252" />',
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
'DEFINE CLASS sql_certs_frmSpaceX AS form',
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
    $formLines.Add((Strip-FrmSpaceXPrefix $lines[$i-1]))
}

$formLines.Add('')
$formLines.Add('	*<PropValue>')
$formLines.Add('		Caption = "SpaceX required Hardness profile"')
$formLines.Add('		Closable = .F.')
$formLines.Add('		ControlBox = .F.')
$formLines.Add('		DoCreate = .T.')
$formLines.Add('		HalfHeightCaption = .T.')
$formLines.Add('		Height = 245')
$formLines.Add('		Left = 657')
$formLines.Add('		Name = "frmSpaceX"')
$formLines.Add('		ShowTips = .T.')
$formLines.Add('		Top = 11')
$formLines.Add('		Visible = .F.')
$formLines.Add('		Width = 620')
$formLines.Add('		WindowState = 0')
$formLines.Add('	*</PropValue>')
$formLines.Add('')

for ($i = $addStart; $i -le $addEnd; $i++) {
    $line = $lines[$i-1]
    if ($line -match "ADD OBJECT 'frmSpaceX' AS form") { continue }
    $formLines.Add((Strip-FrmSpaceXPrefix $line))
}

$formLines.Add('')
$formLines.Add('	PROCEDURE Init')
$formLines.Add('		LPARAMETERS toFormSet')
$formLines.Add('		IF VARTYPE(toFormSet) = "O"')
$formLines.Add('			ThisForm.oCertFormSet = toFormSet')
$formLines.Add('		ENDIF')
$formLines.Add('	ENDPROC')
$formLines.Add('')

# Button handlers from formset (rewritten)
$formLines.Add('	PROCEDURE cmdSpaceXEdit.Click')
$formLines.Add('		IF This.Caption = "Edit"')
$formLines.Add('			ThisForm.oCertFormSet.EnableSpaceXHardness(.T.)')
$formLines.Add('			ThisForm.cmdSpaceXExit.Caption = "Abort"')
$formLines.Add('			This.Caption = "Save"')
$formLines.Add('			ThisForm.txt0000.SetFocus')
$formLines.Add('		ELSE')
$formLines.Add('			IF This.Caption = "Save"')
$formLines.Add('				IF ThisForm.oCertFormSet.SaveSpacexHardness()')
$formLines.Add('					ThisForm.oCertFormSet.EnableSpaceXHardness(.F.)')
$formLines.Add('					ThisForm.cmdSpaceXExit.Caption = "Exit"')
$formLines.Add('					This.Caption = "Edit"')
$formLines.Add('				ENDIF')
$formLines.Add('			ENDIF')
$formLines.Add('		ENDIF')
$formLines.Add('	ENDPROC')
$formLines.Add('')
$formLines.Add('	PROCEDURE cmdSpaceXExit.Click')
$formLines.Add('		IF This.Caption = "Exit"')
$formLines.Add('			ThisForm.Visible = .F.')
$formLines.Add('		ELSE')
$formLines.Add('			IF This.Caption = "Abort"')
$formLines.Add('				ThisForm.oCertFormSet.EnableSpaceXHardness(.F.)')
$formLines.Add('				ThisForm.oCertFormSet.ShowSpaceXHardness()')
$formLines.Add('				This.Caption = "Exit"')
$formLines.Add('				ThisForm.cmdSpaceXEdit.Caption = "Edit"')
$formLines.Add('			ENDIF')
$formLines.Add('		ENDIF')
$formLines.Add('	ENDPROC')
$formLines.Add('')
$formLines.Add('ENDDEFINE')

[System.IO.File]::WriteAllLines($outForm, $formLines)

# --- Build spacex helper PRG (show + enable + get/release) ---
function Get-ProcBody($start, $end) {
    $body = New-Object System.Collections.Generic.List[string]
    for ($i = $start + 1; $i -lt $end; $i++) {
        $line = $lines[$i-1]
        if ($line -match '^\s*PROCEDURE ') { continue }
        if ($line -match '^\s*ENDPROC\s*$') { continue }
        if ($line -match '^\s*PARAMETERS ') { continue }
        if ($line -match '^\s*\*ThisFormSet\.') { continue }
        $body.Add($line)
    }
    return $body
}

$lib = New-Object System.Collections.Generic.List[string]
$lib.Add('* sql_certs_spacex_form.prg - runtime frmSpaceX launcher + show/enable helpers')
$lib.Add('')
$lib.Add('FUNCTION SqlCerts_GetFrmSpaceX')
$lib.Add('	LPARAMETERS toFormSet')
$lib.Add('	LOCAL loFrm')
$lib.Add('	IF VARTYPE(toFormSet.oFrmSpaceX) = "O" AND !ISNULL(toFormSet.oFrmSpaceX)')
$lib.Add('		IF TYPE("toFormSet.oFrmSpaceX.Name") = "C"')
$lib.Add('			RETURN toFormSet.oFrmSpaceX')
$lib.Add('		ENDIF')
$lib.Add('	ENDIF')
$lib.Add('	DO FORM Forms\sql_certs_frmSpaceX WITH toFormSet NAME loFrm LINK NOSHOW')
$lib.Add('	toFormSet.oFrmSpaceX = loFrm')
$lib.Add('	RETURN loFrm')
$lib.Add('ENDFUNC')
$lib.Add('')
$lib.Add('PROCEDURE SqlCerts_ReleaseFrmSpaceX')
$lib.Add('	LPARAMETERS toFormSet')
$lib.Add('	IF VARTYPE(toFormSet.oFrmSpaceX) = "O"')
$lib.Add('		toFormSet.oFrmSpaceX.Release')
$lib.Add('		toFormSet.oFrmSpaceX = .NULL.')
$lib.Add('	ENDIF')
$lib.Add('ENDPROC')
$lib.Add('')
$lib.Add('PROCEDURE SqlCerts_EnableSpaceXHardness')
$lib.Add('	LPARAMETERS toFormSet, lEnable')
$lib.Add('	LOCAL loFrmSpaceX')
$lib.Add('	loFrmSpaceX = SqlCerts_GetFrmSpaceX(toFormSet)')
foreach ($line in (Get-ProcBody $enableStart $enableEnd)) {
    $lib.Add((Strip-FrmSpaceXPrefix $line))
}
$lib.Add('ENDPROC')
$lib.Add('')
$lib.Add('PROCEDURE SqlCerts_ShowSpaceXHardness')
$lib.Add('	LPARAMETERS toFormSet')
$lib.Add('	LOCAL loFrmSpaceX')
$lib.Add('	loFrmSpaceX = SqlCerts_GetFrmSpaceX(toFormSet)')
foreach ($line in (Get-ProcBody $showStart $showEnd)) {
    $lib.Add((Strip-FrmSpaceXPrefix $line))
}
$lib.Add('ENDPROC')

[System.IO.File]::WriteAllLines($outLib, $lib)

# --- Strip frmSpaceX from main SC2 ---
$keep = New-Object System.Collections.Generic.List[string]
for ($i = 1; $i -le $lines.Count; $i++) {
    if ($i -ge $objDataStart -and $i -le $objDataEnd) { continue }
    if ($i -ge $addStart -and $i -le $addEnd) { continue }
    if ($i -ge $procEditStart -and $i -le $procEditEnd) { continue }

    if ($i -eq $enableStart) {
        $keep.Add('	PROCEDURE enablespacexhardness')
        $keep.Add('		LPARAMETERS lEnable')
        $keep.Add('		DO SqlCerts_EnableSpaceXHardness IN PROGS\sql_certs_spacex_form.prg WITH ThisFormSet, lEnable')
        $keep.Add('	ENDPROC')
        continue
    }
    if ($i -ge $enableStart -and $i -le $enableEnd) { continue }

    if ($i -eq $showStart) {
        $keep.Add('	PROCEDURE showspacexhardness')
        $keep.Add('		DO SqlCerts_ShowSpaceXHardness IN PROGS\sql_certs_spacex_form.prg WITH ThisFormSet')
        $keep.Add('	ENDPROC')
        continue
    }
    if ($i -ge $showStart -and $i -le $showEnd) { continue }

    $line = $lines[$i-1]
    if ($line -match 'IF VARTYPE\(ThisFormSet\.frmSpaceX\)') {
        $keep.Add('		DO SqlCerts_ReleaseFrmSpaceX IN PROGS\sql_certs_spacex_form.prg WITH ThisFormSet')
        continue
    }
    if ($line -match 'ThisFormSet\.frmSpaceX\.Release') { continue }
    $keep.Add($line)
}

# Add oFrmSpaceX property to DefinedPropArrayMethod
$newKeep = New-Object System.Collections.Generic.List[string]
foreach ($line in $keep) {
    $newKeep.Add($line)
    if ($line -match '\*p: isediting_co') {
        $newKeep.Add('		*p: ofrmspacex')
    }
}

[System.IO.File]::WriteAllLines($sc2, $newKeep)

# Patch savespacexhardness.prg
$savePrg = Join-Path $root 'PROGS\sql_certs_savespacexhardness.prg'
if (Test-Path $savePrg) {
    $saveText = [System.IO.File]::ReadAllText($savePrg)
    if ($saveText -notmatch 'SqlCerts_GetFrmSpaceX') {
        $saveText = $saveText -replace '(?m)^LPARAMETERS toFormSet\r?\n', "LPARAMETERS toFormSet`r`nLOCAL loFrmSpaceX`r`nloFrmSpaceX = SqlCerts_GetFrmSpaceX(toFormSet)`r`n"
        $saveText = $saveText -replace 'toFormSet\.frmSpaceX', 'loFrmSpaceX'
        $insert = "* Ensure spacex form helper is available`r`nIF TYPE('SqlCerts_GetFrmSpaceX') = 'U'`r`n`tSET PROCEDURE TO PROGS\sql_certs_spacex_form ADDITIVE`r`nENDIF`r`n`r`n"
        $saveText = $insert + $saveText
        [System.IO.File]::WriteAllText($savePrg, $saveText)
    }
}

Write-Host "OK: $outForm"
Write-Host "OK: $outLib"
Write-Host "OK: patched $sc2 (backup $bak)"
Write-Host "Lines removed from formset: $($objDataEnd-$objDataStart+1 + $addEnd-$addStart+1) object lines approx"
