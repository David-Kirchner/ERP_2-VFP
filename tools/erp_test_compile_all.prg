* COMPILE FORM every screen in tools\erp_test_form_list.txt
LOCAL lcRoot, lcLog, lcCsv, lcList, lcPath, lnErr, lnSct, laF[1], laForms[1], i, lnLine, lcForm
lcRoot = "E:\VFP\ERP_2\"
lcLog  = lcRoot + "tools\erp_test_harness.log"
lcCsv  = lcRoot + "tools\erp_test_results.csv"
lcList = lcRoot + "tools\erp_test_form_list.txt"
SET DEFAULT TO (lcRoot)
CD (lcRoot)
_SCREEN.Visible = .F.
SET TALK OFF
SET SAFETY OFF
SET CONFIRM OFF
STRTOFILE("COMPILE_ALL " + TTOC(DATETIME()) + CHR(13)+CHR(10), lcLog, 1)
STRTOFILE("timestamp,form,phase,result,detail,sct_bytes"+CHR(13)+CHR(10), lcCsv, .F.)
IF !FILE(lcList)
	STRTOFILE("FAIL missing form list" + CHR(13)+CHR(10), lcLog, 1)
	QUIT
ENDIF
lnLine = ALINES(laForms, FILETOSTR(lcList))
FOR i = 1 TO lnLine
	lcForm = ALLTRIM(laForms[i])
	IF EMPTY(lcForm)
		LOOP
	ENDIF
	lcPath = lcRoot + "forms\" + lcForm
	IF !FILE(lcPath)
		lcPath = lcRoot + "Forms\" + lcForm
	ENDIF
	lnSct = 0
	IF FILE(FORCEEXT(lcPath, "sct"))
		IF ADIR(laF, FORCEEXT(lcPath, "sct")) > 0
			lnSct = laF[1, 2]
		ENDIF
	ENDIF
	IF !FILE(lcPath)
		STRTOFILE(TTOC(DATETIME())+","+lcForm+",MISSING,FAIL,file not on disk,"+TRANSFORM(lnSct)+CHR(13)+CHR(10), lcCsv, 1)
		LOOP
	ENDIF
	lnErr = 0
	ON ERROR lnErr = ERROR()
	COMPILE FORM (lcPath)
	ON ERROR
	IF lnErr = 0
		STRTOFILE(TTOC(DATETIME())+","+lcForm+",COMPILE_PASS,PASS,,"+TRANSFORM(lnSct)+CHR(13)+CHR(10), lcCsv, 1)
	ELSE
		STRTOFILE(TTOC(DATETIME())+","+lcForm+",COMPILE_FAIL,FAIL,"+STRTRAN(MESSAGE(),",",";")+","+TRANSFORM(lnSct)+CHR(13)+CHR(10), lcCsv, 1)
	ENDIF
ENDFOR
STRTOFILE("COMPILE_ALL DONE rows=" + TRANSFORM(lnLine) + CHR(13)+CHR(10), lcLog, 1)
QUIT
