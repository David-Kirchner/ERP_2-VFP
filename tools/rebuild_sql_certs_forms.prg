LOCAL lcRoot, lcFoxBin, lcLog
lcRoot = "E:\VFP\ERP_2\"
lcFoxBin = lcRoot + "tools\foxbin2prg\foxbin2prg.prg"
lcLog = lcRoot + "tools\rebuild_sql_certs_forms.log"
SET DEFAULT TO (lcRoot)
CD (lcRoot)
STRTOFILE("rebuild " + TTOC(DATETIME()) + CHR(13)+CHR(10), lcLog, .T.)
LOCAL ARRAY laForms[3]
laForms[1] = lcRoot + "Forms\SQL_certs.sc2"
laForms[2] = lcRoot + "Forms\sql_certs_frmSpaceX.sc2"
laForms[3] = lcRoot + "Forms\sql_certs_frmCustomer.sc2"
LOCAL i, lcSc2, lcScx
FOR i = 1 TO ALEN(laForms)
	lcSc2 = laForms[i]
	lcScx = STRTRAN(lcSc2, ".sc2", ".scx")
	DO (lcFoxBin) WITH lcSc2, "PRG2BIN"
	IF FILE(lcScx)
		STRTOFILE("OK " + lcScx + CHR(13)+CHR(10), lcLog, 1)
	ELSE
		STRTOFILE("FAIL " + lcSc2 + CHR(13)+CHR(10), lcLog, 1)
	ENDIF
ENDFOR
QUIT
