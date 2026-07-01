* ERP_Test incremental EXE build harness (VFP 9.2) - headless PJX edits only
* EXE phase skips COMPILE FORM (run compile-all first). Restores PJT/PJX after each BUILD.
PARAMETERS tcMode, tcForm
PRIVATE lcRoot, lcLog, lcCsv, lcList, lcPjxTest, lcPjtTest, lcPjxErp, lcPjtErp, lcArchPjt
PRIVATE lcExe, lcApp, lcErr, tcForm, tcMode, laF, lcArchPjx, lcLast

lcRoot = "E:\VFP\ERP_2\"
lcLog  = lcRoot + "tools\erp_test_harness.log"
lcCsv  = lcRoot + "tools\erp_test_results.csv"
lcList = lcRoot + "tools\erp_test_form_list.txt"
lcLast = lcRoot + "tools\erp_test_last.txt"
lcPjxTest = lcRoot + "erp_test.pjx"
lcPjtTest = lcRoot + "erp_test.pjt"
lcPjxErp  = lcRoot + "ERP.PJX"
lcPjtErp  = lcRoot + "ERP.PJT"
lcArchPjt = lcRoot + "tools\project_bak_archive\erp.pjt.bak.20260610"
lcArchPjx = lcRoot + "tools\project_bak_archive\erp.pjx.bak.20260610"
lcExe  = lcRoot + "erp_test.exe"
lcApp  = lcRoot + "erp_test.app"
lcErr  = lcRoot + "erp_test.err"
tcMode = UPPER(ALLTRIM(EVL(tcMode, "STATUS")))
tcForm = ALLTRIM(EVL(tcForm, ""))

SET DEFAULT TO (lcRoot)
CD (lcRoot)
_SCREEN.Visible = .F.
IF TYPE("_VFP") = "O"
	_VFP.Visible = .F.
ENDIF
SET TALK OFF
SET SAFETY OFF
SET NOTIFY OFF
SET STATUS BAR OFF
SET CONFIRM OFF
SET DELETED ON
CLOSE ALL
SYS(2335, 0)
SET PATH TO (lcRoot + "PROGS") ADDITIVE
ON ERROR DO HarnessErr

IF !FILE(lcRoot + "MEM\Company_Icon.ico") .AND. FILE(lcRoot + "ICO\earth-globe.ico")
	COPY FILE (lcRoot + "ICO\earth-globe.ico") TO (lcRoot + "MEM\Company_Icon.ico")
ENDIF
IF !FILE(lcLog)
	STRTOFILE("ERP_Test harness " + TTOC(DATETIME()) + CHR(13)+CHR(10), lcLog, .F.)
ENDIF
IF !FILE(lcCsv)
	STRTOFILE("timestamp,form,phase,result,detail,sct_bytes"+CHR(13)+CHR(10), lcCsv, .F.)
ENDIF

DO CASE
CASE tcMode == "INIT"
	DO ResetErpTestBase
CASE tcMode == "PREP"
	IF EMPTY(tcForm)
		STRTOFILE("FAIL PREP needs form" + CHR(13)+CHR(10), lcLog, 1)
	ELSE
		DO PrepOneForm
	ENDIF
CASE tcMode == "ONE"
	IF EMPTY(tcForm)
		STRTOFILE("FAIL ONE needs form" + CHR(13)+CHR(10), lcLog, 1)
	ELSE
		DO TestOneForm
	ENDIF
CASE tcMode == "COMPILE_ALL"
	DO CompileAllForms
OTHERWISE
	STRTOFILE("MODE " + tcMode + CHR(13)+CHR(10), lcLog, 1)
ENDCASE
DO ShutdownHarness
QUIT

*------------------------------------------------------------------------------
PROCEDURE HarnessErr
	STRTOFILE("ERR " + MESSAGE() + " line " + TRANSFORM(LINENO()) + " " + PROGRAM() + CHR(13)+CHR(10), lcLog, 1)
	RETURN

*------------------------------------------------------------------------------
PROCEDURE RestoreErpTestProject
	IF TYPE("_VFP.ActiveProject") = "O"
		CLOSE PROJECT NOSAVE
	ENDIF
	CLOSE ALL
	IF FILE(lcArchPjt)
		COPY FILE (lcArchPjt) TO (lcPjtTest)
	ENDIF
	IF FILE(lcArchPjx)
		COPY FILE (lcArchPjx) TO (lcPjxTest)
	ENDIF
	STRTOFILE("RESTORE pjx+pjt from archive" + CHR(13)+CHR(10), lcLog, 1)
	RETURN

*------------------------------------------------------------------------------
PROCEDURE ShutdownHarness
	IF tcMode == "PREP"
		IF TYPE("_VFP.ActiveProject") = "O"
			CLOSE PROJECT NOSAVE
		ENDIF
	ELSE
		DO RestoreErpTestProject
	ENDIF
	SYS(2335, 1)
	RETURN

*------------------------------------------------------------------------------
PROCEDURE ResetErpTestBase
	STRTOFILE("RESET " + TTOC(DATETIME()) + CHR(13)+CHR(10), lcLog, 1)
	DO RestoreErpTestProject
	USE (lcPjxTest) IN 0 EXCLUSIVE ALIAS pjrst
	DELETE ALL FOR RIGHT(LOWER(ALLTRIM(name)), 4) == ".scx"
	DELETE ALL FOR INLIST(LOWER(JUSTFNAME(name)), "erp_certs.scx", "sql_certs21.scx", "erp_certs_addnewcert.prg", "erp_certs_check_spec.prg")
	USE IN pjrst
	STRTOFILE("RESET stripped forms from ERP_Test.pjx" + CHR(13)+CHR(10), lcLog, 1)
	RETURN

*------------------------------------------------------------------------------
PROCEDURE PrepareFormCompile
	LPARAMETERS tcFormName
	LOCAL lcPrg
	SET PATH TO (lcRoot + "PROGS") ADDITIVE
	IF LOWER(JUSTFNAME(tcFormName)) == "sql_certs.scx"
		lcPrg = lcRoot + "PROGS\sql_certs_spacex_form.prg"
		IF FILE(lcPrg)
			SET PROCEDURE TO (lcPrg) ADDITIVE
		ENDIF
		lcPrg = lcRoot + "PROGS\sql_certs_customer_form.prg"
		IF FILE(lcPrg)
			SET PROCEDURE TO (lcPrg) ADDITIVE
		ENDIF
	ENDIF
	RETURN

*------------------------------------------------------------------------------
FUNCTION AddRowToPjx
	LPARAMETERS tcRelPath
	LOCAL lcPjxName, lcTpl
	lcPjxName = LOWER(ALLTRIM(tcRelPath))
	IF EMPTY(lcPjxName)
		RETURN .F.
	ENDIF
	USE (lcPjxTest) IN 0 ALIAS pjrow EXCLUSIVE
	LOCATE FOR LOWER(ALLTRIM(name)) == lcPjxName
	IF FOUND()
		REPLACE exclude WITH .F. IN pjrow
		USE IN pjrow
		RETURN .T.
	ENDIF
	lcTpl = "main.prg"
	LOCATE FOR LOWER(JUSTFNAME(name)) == "sql_certs.scx"
	IF !FOUND()
		LOCATE FOR LOWER(JUSTFNAME(name)) == "sql_alloy.scx"
	ENDIF
	IF !FOUND()
		LOCATE FOR LOWER(JUSTFNAME(name)) == lcTpl
	ENDIF
	IF !FOUND()
		USE IN pjrow
		RETURN .F.
	ENDIF
	SCATTER MEMVAR
	APPEND BLANK
	GATHER MEMVAR
	REPLACE name WITH lcPjxName, exclude WITH .F. IN pjrow
	USE IN pjrow
	RETURN .T.

*------------------------------------------------------------------------------
PROCEDURE AddFormBundleDeps
	LPARAMETERS tcFormName
	LOCAL i, lcDep
	LOCAL ARRAY laDeps[8]
	IF LOWER(JUSTFNAME(tcFormName)) <> "sql_certs.scx"
		RETURN
	ENDIF
	laDeps[1] = "forms\sql_certs_frmCustomer.scx"
	laDeps[2] = "forms\sql_certs_frmSpaceX.scx"
	laDeps[3] = "progs\sql_certs.prg"
	laDeps[4] = "progs\sql_certs_addnewcert.prg"
	laDeps[5] = "progs\sql_certs_check_spec.prg"
	laDeps[6] = "progs\sql_certs_savespacexhardness.prg"
	laDeps[7] = "progs\sql_certs_customer_form.prg"
	laDeps[8] = "progs\sql_certs_spacex_form.prg"
	FOR i = 1 TO ALEN(laDeps)
		lcDep = laDeps[i]
		IF FILE(lcRoot + STRTRAN(lcDep, "/", "\"))
			AddRowToPjx(lcDep)
		ENDIF
	ENDFOR
	RETURN

*------------------------------------------------------------------------------
FUNCTION AddFormToPjx
	LPARAMETERS tcFormName
	LOCAL lcPjxName
	lcPjxName = LOWER("forms\" + ALLTRIM(tcFormName))
	RETURN AddRowToPjx(lcPjxName)

*------------------------------------------------------------------------------
PROCEDURE PrepOneForm
	LOCAL lcPath, lnSct
	lcPath = lcRoot + "forms\" + tcForm
	STRTOFILE("PREP " + tcForm + " " + TTOC(DATETIME()) + CHR(13)+CHR(10), lcLog, 1)
	IF !FILE(lcPath)
		lcPath = lcRoot + "Forms\" + tcForm
	ENDIF
	IF !FILE(lcPath)
		STRTOFILE("PREP FAIL missing " + tcForm + CHR(13)+CHR(10), lcLog, 1)
		RETURN
	ENDIF
	DO ResetErpTestBase
	DO PrepareFormCompile WITH tcForm
	IF !AddFormToPjx(tcForm)
		STRTOFILE("PREP FAIL pjx " + tcForm + CHR(13)+CHR(10), lcLog, 1)
		RETURN
	ENDIF
	DO AddFormBundleDeps WITH tcForm
	STRTOFILE("PREP OK " + tcForm + CHR(13)+CHR(10), lcLog, 1)
	RETURN

*------------------------------------------------------------------------------
PROCEDURE TestOneForm
	LOCAL lcPath, lnErr, llOk, lcStart, lcDetail, lnSct, lnRound, lcErrTxt, ldApp
	lcPath = lcRoot + "forms\" + tcForm
	lcStart = DATETIME()
	STRTOFILE("ONE " + tcForm + " " + TTOC(lcStart) + CHR(13)+CHR(10), lcLog, 1)
	STRTOFILE(tcForm + ",RUNNING," + TTOC(lcStart), lcLast, .F.)
	IF !FILE(lcPath)
		lcPath = lcRoot + "Forms\" + tcForm
	ENDIF
	IF !FILE(lcPath)
		DO LogResult WITH tcForm, "MISSING", "file not on disk", 0
		RETURN
	ENDIF
	lnSct = 0
	IF ADIR(laF, FORCEEXT(lcPath, "sct")) > 0
		lnSct = laF[1, 2]
	ENDIF
	DO ResetErpTestBase
	DO PrepareFormCompile WITH tcForm
	* COMPILE FORM skipped here - run tools\run_erp_test_compile_all.bat first
	IF !AddFormToPjx(tcForm)
		DO LogResult WITH tcForm, "PJX_FAIL", "could not add to ERP_Test.pjx", lnSct
		RETURN
	ENDIF
	DO AddFormBundleDeps WITH tcForm
	IF FILE(lcErr)
		ERASE (lcErr)
	ENDIF
	lnErr = 0
	ON ERROR lnErr = ERROR()
	BUILD EXE erp_test FROM erp_test
	ON ERROR DO HarnessErr
	lcDetail = "err=" + TRANSFORM(lnErr)
	IF lnErr # 0
		lcDetail = lcDetail + " " + MESSAGE()
	ENDIF
	lcErrTxt = ""
	FOR lnRound = 1 TO 3
		IF !FILE(lcErr)
			EXIT
		ENDIF
		lcErrTxt = FILETOSTR(lcErr)
		lcDetail = lcDetail + " " + LEFT(lcErrTxt, 300)
		IF !AddDepsFromErr(lcErrTxt)
			EXIT
		ENDIF
		IF FILE(lcErr)
			ERASE (lcErr)
		ENDIF
		lnErr = 0
		ON ERROR lnErr = ERROR()
		BUILD EXE erp_test FROM erp_test
		ON ERROR DO HarnessErr
		IF lnErr # 0
			lcDetail = lcDetail + " retry" + TRANSFORM(lnRound) + "=" + MESSAGE()
		ENDIF
	ENDFOR
	llOk = .F.
	IF FILE(lcApp)
		IF ADIR(laF, lcApp) > 0
			ldApp = DATETIME(laF[1, 3], laF[1, 4])
			llOk = (ldApp >= lcStart)
		ENDIF
	ENDIF
	IF llOk
		DO LogResult WITH tcForm, "EXE_PASS", lcDetail, lnSct
	ELSE
		IF !EMPTY(lcErrTxt)
			lcDetail = lcDetail + " " + LEFT(lcErrTxt, 200)
		ENDIF
		IF EMPTY(lcDetail) .OR. lcDetail == "err=0"
			lcDetail = "build did not produce fresh app"
		ENDIF
		DO LogResult WITH tcForm, "EXE_FAIL", lcDetail, lnSct
	ENDIF
	DO RestoreErpTestProject
	RETURN

*------------------------------------------------------------------------------
FUNCTION AddDepsFromErr
	LPARAMETERS tcErrTxt
	LOCAL lnAdded, lcNeed, lcLowErr, i
	LOCAL ARRAY laMap[8, 2]
	lnAdded = 0
	lcLowErr = LOWER(tcErrTxt)
	laMap[1, 1] = "sqlcerts_enablespacexhardness"
	laMap[1, 2] = "progs\sql_certs_spacex_form.prg"
	laMap[2, 1] = "sqlcerts_showfrmcustomer"
	laMap[2, 2] = "progs\sql_certs_customer_form.prg"
	laMap[3, 1] = "sqlcerts_showspacexhardness"
	laMap[3, 2] = "progs\sql_certs_spacex_form.prg"
	laMap[4, 1] = "sqlcerts_releasefrmcustomer"
	laMap[4, 2] = "progs\sql_certs_customer_form.prg"
	laMap[5, 1] = "sqlcerts_releasefrmspacex"
	laMap[5, 2] = "progs\sql_certs_spacex_form.prg"
	laMap[6, 1] = "sql_certs_addnewcert"
	laMap[6, 2] = "progs\sql_certs_addnewcert.prg"
	laMap[7, 1] = "sql_certs_check_spec"
	laMap[7, 2] = "progs\sql_certs_check_spec.prg"
	laMap[8, 1] = "sql_certs_savespacexhardness"
	laMap[8, 2] = "progs\sql_certs_savespacexhardness.prg"
	FOR i = 1 TO ALEN(laMap, 1)
		IF laMap[i, 1] $ lcLowErr
			IF AddRowToPjx(laMap[i, 2])
				lnAdded = lnAdded + 1
			ENDIF
		ENDIF
	ENDFOR
	USE (lcPjxErp) IN 0 SHARED ALIAS pjdep
	SELECT pjdep
	SCAN
		lcNeed = LOWER(ALLTRIM(name))
		IF !EMPTY(lcNeed) AND lcNeed $ lcLowErr
			IF AddRowToPjx(lcNeed)
				lnAdded = lnAdded + 1
			ENDIF
		ENDIF
	ENDSCAN
	USE IN pjdep
	RETURN (lnAdded > 0)

*------------------------------------------------------------------------------
PROCEDURE CompileAllForms
	LOCAL lcPath, lnErr, lnSct, lnLine, i, lcForm
	LOCAL ARRAY laForms[1]
	STRTOFILE("COMPILE_ALL " + TTOC(DATETIME()) + CHR(13)+CHR(10), lcLog, 1)
	IF !FILE(lcList)
		RETURN
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
			DO LogResult WITH lcForm, "MISSING", "", 0
			LOOP
		ENDIF
		DO PrepareFormCompile WITH lcForm
		lnErr = 0
		ON ERROR lnErr = ERROR()
		COMPILE FORM (lcPath)
		ON ERROR DO HarnessErr
		IF lnErr = 0
			DO LogResult WITH lcForm, "COMPILE_PASS", "", lnSct
		ELSE
			DO LogResult WITH lcForm, "COMPILE_FAIL", MESSAGE(), lnSct
		ENDIF
	ENDFOR
	STRTOFILE("COMPILE_ALL DONE " + TRANSFORM(lnLine) + " forms" + CHR(13)+CHR(10), lcLog, 1)
	RETURN

*------------------------------------------------------------------------------
PROCEDURE LogResult
	LPARAMETERS tcFormName, tcPhase, tcDetail, tnSct
	LOCAL lcRow, lcRes
	lcDetail = STRTRAN(STRTRAN(ALLTRIM(tcDetail), CHR(13), " "), CHR(10), " ")
	lcDetail = STRTRAN(lcDetail, ",", ";")
	lcRes = IIF(tcPhase $ "EXE_PASS,COMPILE_PASS", "PASS", "FAIL")
	lcRow = TTOC(DATETIME()) + "," + tcFormName + "," + tcPhase + "," + lcRes + "," + lcDetail + "," + TRANSFORM(tnSct)
	STRTOFILE(lcRow + CHR(13)+CHR(10), lcCsv, 1)
	STRTOFILE(lcRow + CHR(13)+CHR(10), lcLog, 1)
	STRTOFILE(tcFormName + "," + tcPhase + "," + lcRes, lcLast, .F.)
	RETURN
