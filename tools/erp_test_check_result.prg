* Log EXE_PASS/FAIL after BUILD (fresh erp_test.app must exist)
LOCAL lcRoot, lcForm, lnT0, lcApp, lcCsv, lcLast, lcLog, lcT0File, lcErr, lcDetail
LOCAL laF[1], llOk, lcModeFile, laM[1]
lcRoot = "E:\VFP\ERP_2\"
lcApp  = lcRoot + "erp_test.app"
lcCsv  = lcRoot + "tools\erp_test_results.csv"
lcLast = lcRoot + "tools\erp_test_last.txt"
lcLog  = lcRoot + "tools\erp_test_harness.log"
lcT0File = lcRoot + "tools\erp_test_t0.txt"
lcErr  = lcRoot + "erp_test.err"
lcForm = ""
lnT0 = 0
lcDetail = ""
SET DEFAULT TO (lcRoot)
_SCREEN.Visible = .F.
SET TALK OFF
IF FILE(lcRoot + "tools\erp_test_mode.txt")
	IF ALINES(laM, FILETOSTR(lcRoot + "tools\erp_test_mode.txt")) >= 2
		lcForm = ALLTRIM(laM[2])
	ENDIF
ENDIF
IF FILE(lcT0File)
	lnT0 = VAL(ALLTRIM(FILETOSTR(lcT0File)))
ENDIF
llOk = .F.
IF FILE(lcApp) .AND. ADIR(laF, lcApp) > 0
	lcDetail = "bytes=" + TRANSFORM(laF[1, 2])
	IF laF[1, 2] > 40000000
		IF lnT0 = 0 .OR. (SECONDS() - lnT0) < 900
			llOk = .T.
		ELSE
			lcDetail = lcDetail + " timeout"
		ENDIF
	ENDIF
ENDIF
IF FILE(lcErr)
	lcDetail = lcDetail + " " + LEFT(FILETOSTR(lcErr), 150)
ENDIF
IF llOk
	STRTOFILE(TTOC(DATETIME())+","+lcForm+",EXE_PASS,PASS,"+STRTRAN(lcDetail,",",";")+",0"+CHR(13)+CHR(10), lcCsv, 1)
	STRTOFILE(lcForm+",EXE_PASS,PASS", lcLast, .F.)
	STRTOFILE("CHECK EXE_PASS " + lcForm + CHR(13)+CHR(10), lcLog, 1)
ELSE
	STRTOFILE(TTOC(DATETIME())+","+lcForm+",EXE_FAIL,FAIL,"+STRTRAN(lcDetail,",",";")+",0"+CHR(13)+CHR(10), lcCsv, 1)
	STRTOFILE(lcForm+",EXE_FAIL,FAIL", lcLast, .F.)
	STRTOFILE("CHECK EXE_FAIL " + lcForm + CHR(13)+CHR(10), lcLog, 1)
ENDIF
QUIT
