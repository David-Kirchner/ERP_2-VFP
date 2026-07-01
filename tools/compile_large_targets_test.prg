* COMPILE largest project targets one-by-one to find C0000005 culprit.
LOCAL lcRoot, lcLog, i, lcTarget, llOk
lcRoot = "E:\VFP\ERP_2\"
lcLog  = lcRoot + "tools\compile_large_targets_test.log"
SET DEFAULT TO (lcRoot)
CD (lcRoot)
STRTOFILE("Compile large targets " + TTOC(DATETIME()) + CHR(13) + CHR(10), lcLog, .F.)

_SCREEN.Visible = .F.
IF TYPE("_VFP") = "O"
	_VFP.Visible = .F.
ENDIF
SET TALK OFF
SET SAFETY OFF
SET NOTIFY OFF
SET STATUS BAR OFF
SET CONFIRM OFF
CLOSE ALL

LOCAL ARRAY aTarget[12]
aTarget[1]  = "FORM Forms\quotes"
aTarget[2]  = "FORM Forms\editsalesorder"
aTarget[3]  = "FORM Forms\workorder"
aTarget[4]  = "CLASSLIBS libs\purchaseorder"
aTarget[5]  = "FORM Forms\receive_edit_fs"
aTarget[6]  = "FORM Forms\receive_edit"
aTarget[7]  = "FORM Forms\shop_stocklst_edit"
aTarget[8]  = "FORM Forms\po_correct"
aTarget[9]  = "FORM Forms\modify_stock4order"
aTarget[10] = "CLASSLIBS libs\hpa"
aTarget[11] = "FORM Forms\sql_certs"
aTarget[12] = "FORM Forms\sql_alloy"

FOR i = 1 TO ALEN(aTarget)
	lcTarget = aTarget[i]
	STRTOFILE("TRY " + lcTarget + " ... ", lcLog, 1)
	llOk = .T.
	TRY
		&lcTarget
	CATCH TO oErr
		llOk = .F.
		STRTOFILE("FAIL " + lcTarget + " " + oErr.Message + CHR(13) + CHR(10), lcLog, 1)
	ENDTRY
	IF llOk
		STRTOFILE("OK" + CHR(13) + CHR(10), lcLog, 1)
	ENDIF
ENDFOR
STRTOFILE("DONE" + CHR(13) + CHR(10), lcLog, 1)
QUIT
