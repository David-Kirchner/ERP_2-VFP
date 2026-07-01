* Headless BUILD EXE - restore PJX/PJT, BUILD EXE FROM ERP, restore PJT again, QUIT
LOCAL lcRoot, lcLog, lcExe, lcApp, lcErr, lcPjx, lcPjt, lcArchPjx, lcArchPjt, lcIcon, lcStart
LOCAL laF[1], lnPjt, lnErr, lnCnt, llOk, lnExeTime
lcRoot = "E:\VFP\ERP_2\"
lcPjx  = lcRoot + "ERP.PJX"
lcPjt  = lcRoot + "ERP.PJT"
lcExe  = lcRoot + "erp.exe"
lcApp  = lcRoot + "erp.app"
lcErr  = lcRoot + "erp.err"
lcLog  = lcRoot + "tools\build_erp_exe.log"
lcArchPjx = lcRoot + "tools\project_bak_archive\erp.pjx.bak.20260610"
lcArchPjt = lcRoot + "tools\project_bak_archive\erp.pjt.bak.20260610"
lcIcon = lcRoot + "MEM\Company_Icon.ico"
lcStart = DATETIME()
SET DEFAULT TO (lcRoot)
CD (lcRoot)
STRTOFILE("Build EXE " + TTOC(lcStart) + CHR(13) + CHR(10), lcLog, .F.)

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

IF FILE(lcArchPjt) .AND. FILE(lcArchPjx)
	COPY FILE (lcArchPjt) TO (lcPjt)
	COPY FILE (lcArchPjx) TO (lcPjx)
	STRTOFILE("Restored PJX/PJT from archive before build" + CHR(13) + CHR(10), lcLog, 1)
ENDIF

IF !FILE(lcIcon) .AND. FILE(lcRoot + "ICO\earth-globe.ico")
	COPY FILE (lcRoot + "ICO\earth-globe.ico") TO (lcIcon)
ENDIF

lnCnt = 0
USE (lcPjx) IN 0 ALIAS pjbuild EXCLUSIVE
SCAN FOR AT("certs", LOWER(name)) > 0
	DO CASE
	CASE LOWER(JUSTFNAME(name)) == "erp_certs.scx" ;
			.OR. LOWER(JUSTFNAME(name)) == "sql_certs21.scx"
		REPLACE exclude WITH .T. IN pjbuild
		lnCnt = lnCnt + 1
	CASE LOWER(JUSTFNAME(name)) == "sql_certs.scx"
		REPLACE exclude WITH .F. IN pjbuild
		lnCnt = lnCnt + 1
	ENDCASE
ENDSCAN
USE IN pjbuild
CLOSE ALL
STRTOFILE("Cert EXCLUDE: retired=T, sql_certs=F (" + TRANSFORM(lnCnt) + " rows)" + CHR(13) + CHR(10), lcLog, 1)

IF FILE(lcErr)
	ERASE (lcErr)
ENDIF

STRTOFILE("Starting BUILD EXE erp FROM ERP..." + CHR(13) + CHR(10), lcLog, 1)
lnErr = 0
ON ERROR lnErr = ERROR()
BUILD EXE erp FROM ERP
ON ERROR
STRTOFILE("BUILD finished err=" + TRANSFORM(lnErr) + " " + MESSAGE() + CHR(13) + CHR(10), lcLog, 1)

* Restore known-good project memos immediately (IDE crash pattern: save after successful build)
IF FILE(lcArchPjt) .AND. FILE(lcArchPjx)
	COPY FILE (lcArchPjt) TO (lcPjt)
	COPY FILE (lcArchPjx) TO (lcPjx)
	STRTOFILE("Restored PJX/PJT from archive immediately after BUILD" + CHR(13) + CHR(10), lcLog, 1)
ENDIF

llOk = .F.
IF FILE(lcExe) .AND. FILE(lcApp)
	lnExeTime = 0
	IF ADIR(laF, lcExe) > 0
		lnExeTime = laF[1, 3]
	ENDIF
	llOk = (lnExeTime >= lcStart)
ENDIF

IF llOk
	STRTOFILE("OK erp.exe + erp.app built this run" + CHR(13) + CHR(10), lcLog, 1)
	STRTOFILE("PASS headless build" + CHR(13) + CHR(10), lcLog, 1)
ELSE
	STRTOFILE("FAIL build did not produce fresh exe/app" + CHR(13) + CHR(10), lcLog, 1)
ENDIF

QUIT
