* PRG2BIN one FoxBin2Prg text file (SC2/VC2/FR2/...) — run after editing text.
* In-process FoxBin2Prg (no nested vfp9.exe / RUN /W — that hangs + Error 202).
*
* CLI / batch (always exits VFP):
*   tools\run_prg2bin_one.bat Forms\CompanyProfile_Maint.SC2
*
* Delete tools\prg2bin_one.fxp after editing this PRG.
PARAMETERS tcPath
SET DEVELOPMENT ON
SET STATUS BAR OFF
SET TALK OFF
SET SAFETY OFF

LOCAL lcRoot, lcRootCD, lcFbDir, lcText, lcBin, lcExt, lcLog, lcStatus
LOCAL lcPrg, lcSaveCd, oFb, nResult, xRet, lcOldOnError

lcOldOnError = ON("ERROR")
ON ERROR DO FoxBinP2_OnError

lcRoot = "E:\VFP\ERP_2"
IF !DIRECTORY(lcRoot)
	lcRoot = JUSTPATH(JUSTPATH(SYS(16,0)))
ENDIF
lcRootCD = FoxBinP2_NoTrail(lcRoot)
lcFbDir = lcRootCD + "\tools\foxbin2prg"
lcLog = lcRootCD + "\tools\foxbin_sync.log"
lcStatus = lcRootCD + "\tools\_foxbin_prg2bin_status.txt"
PUBLIC gFoxBinP2Log, gFoxBinP2Status
gFoxBinP2Log = lcLog
gFoxBinP2Status = lcStatus

= FoxBinP2_Step("START", "arg=[" + IIF(VARTYPE(tcPath)="C", tcPath, TRANSFORM(tcPath)) + "]")

IF VARTYPE(tcPath) # "C" OR EMPTY(ALLTRIM(tcPath))
	= FoxBinP2_Die("PRG2BIN FAIL: no path passed.")
ENDIF

tcPath = ALLTRIM(STRTRAN(STRTRAN(tcPath, ["], []), ['], []))

IF !DIRECTORY(lcRootCD)
	= FoxBinP2_Die("PRG2BIN FAIL: ERP root not found: [" + lcRootCD + "]")
ENDIF

* Trailing "\" on SET DEFAULT causes Error 202
= FoxBinP2_Step("CD", "to=[" + lcRootCD + "]")
SET DEFAULT TO (lcRootCD)
CD (lcRootCD)

lcText = FoxBinP2_Resolve(lcRootCD, tcPath)
IF EMPTY(lcText)
	= FoxBinP2_Die("PRG2BIN FAIL: file not found: [" + tcPath + "]")
ENDIF
= FoxBinP2_Step("RESOLVED", "[" + lcText + "]")

lcExt = UPPER(ALLTRIM(JUSTEXT(lcText)))
DO CASE
CASE lcExt == "SC2"
	lcBin = FORCEEXT(lcText, "scx")
CASE lcExt == "VC2"
	lcBin = FORCEEXT(lcText, "vcx")
CASE lcExt == "FR2"
	lcBin = FORCEEXT(lcText, "frx")
CASE lcExt == "MN2"
	lcBin = FORCEEXT(lcText, "mnx")
CASE lcExt == "LB2"
	lcBin = FORCEEXT(lcText, "lbx")
CASE lcExt == "PJ2"
	lcBin = FORCEEXT(lcText, "pjx")
OTHERWISE
	= FoxBinP2_Die("PRG2BIN FAIL: unknown ext [" + lcExt + "] " + lcText)
ENDCASE

IF !FILE(lcText)
	= FoxBinP2_Die("PRG2BIN FAIL: MISSING text [" + lcText + "]")
ENDIF

lcPrg = lcFbDir + "\foxbin2prg.prg"
IF !FILE(lcPrg)
	= FoxBinP2_Die("PRG2BIN FAIL: missing [" + lcPrg + "]")
ENDIF

= FoxBinP2_Step("PRG2BIN_BEGIN", "in-process [" + lcText + "]")
lcSaveCd = FoxBinP2_NoTrail(SYS(5) + SYS(2003))
STRTOFILE(lcSaveCd, "E:\VFP\ERP_2\tools\_foxbin_prg2bin_cd.txt", 0)
CD (lcFbDir)
SET PROCEDURE TO (lcPrg) ADDITIVE
= FoxBinP2_Step("CREATE", "c_foxbin2prg")
oFb = CREATEOBJECT("c_foxbin2prg")
IF VARTYPE(oFb) # "O"
	CD (FoxBinP2_NoTrail(lcSaveCd))
	= FoxBinP2_Die("PRG2BIN FAIL: CREATEOBJECT c_foxbin2prg failed")
ENDIF

= FoxBinP2_Step("EXEC", "PRG2BIN [" + lcText + "]")
nResult = 0
ON ERROR
oFb.execute(lcText, "PRG2BIN", "0", "0", "1", "1", "1", "", "", .F., "", "0", "1")
IF TYPE("oFb") = "O" AND PEMSTATUS(oFb, "l_Error", 5) AND oFb.l_Error
	nResult = 1
	= FoxBinP2_Step("OBJ_ERR", "l_Error=.T.")
ENDIF
IF TYPE("oFb") = "O" AND PEMSTATUS(oFb, "unloadProgressbarForm", 5)
	oFb.unloadProgressbarForm(.T.)
ENDIF
oFb = .NULL.
ON ERROR DO FoxBinP2_OnError
CD (FoxBinP2_NoTrail(IIF(FILE("E:\VFP\ERP_2\tools\_foxbin_prg2bin_cd.txt"), ;
	ALLTRIM(FILETOSTR("E:\VFP\ERP_2\tools\_foxbin_prg2bin_cd.txt")), lcSaveCd)))
= FoxBinP2_Step("PRG2BIN_END", "rc=" + TRANSFORM(nResult))

IF FILE(lcBin)
	= FoxBinP2_Step("OK", lcBin)
	ON ERROR
	QUIT
ENDIF

= FoxBinP2_Die("PRG2BIN FAIL: binary not created for [" + lcText + "] rc=" + TRANSFORM(nResult))

FUNCTION FoxBinP2_OnError
	LOCAL lcMsg, lcLog, lnErr
	ON ERROR
	lnErr = ERROR()
	lcLog = IIF(TYPE("gFoxBinP2Log")="C", gFoxBinP2Log, "E:\VFP\ERP_2\tools\foxbin_sync.log")
	lcMsg = "PRG2BIN ERROR " + TRANSFORM(lnErr) + ": " + MESSAGE() + ;
		" prog=" + PROGRAM() + " line=" + TRANSFORM(LINENO())
	TRY
		STRTOFILE(lcMsg + CHR(13)+CHR(10), lcLog, 1)
		IF TYPE("gFoxBinP2Status")="C" AND !EMPTY(gFoxBinP2Status)
			STRTOFILE(lcMsg + CHR(13)+CHR(10), gFoxBinP2Status, 0)
		ENDIF
	CATCH
	ENDTRY
	? lcMsg
	QUIT
	RETURN

FUNCTION FoxBinP2_Die
	LPARAMETERS tcMsg
	= FoxBinP2_Step("FAIL", EVL(tcMsg, ""))
	? EVL(tcMsg, "")
	ON ERROR
	QUIT
	RETURN .F.

FUNCTION FoxBinP2_Step
	LPARAMETERS tcStep, tcDetail
	LOCAL lcLine, lcLog, lcStatus
	lcLog = IIF(TYPE("gFoxBinP2Log")="C", gFoxBinP2Log, "E:\VFP\ERP_2\tools\foxbin_sync.log")
	lcStatus = IIF(TYPE("gFoxBinP2Status")="C", gFoxBinP2Status, "E:\VFP\ERP_2\tools\_foxbin_prg2bin_status.txt")
	lcLine = "PRG2BIN " + ALLTRIM(EVL(tcStep, "?")) + " " + TTOC(DATETIME()) + ;
		" " + ALLTRIM(EVL(tcDetail, ""))
	= FoxBinP2_Log(lcLog, lcLine)
	IF DIRECTORY(JUSTPATH(lcStatus)) OR DIRECTORY("E:\VFP\ERP_2\tools")
		STRTOFILE(lcLine + CHR(13)+CHR(10), lcStatus, 0)
	ENDIF
	RETURN

FUNCTION FoxBinP2_NoTrail
	LPARAMETERS tcPath
	LOCAL lc
	lc = ALLTRIM(EVL(tcPath, ""))
	DO WHILE RIGHT(lc, 1) = "\" OR RIGHT(lc, 1) = "/"
		lc = LEFT(lc, LEN(lc) - 1)
	ENDDO
	RETURN lc

FUNCTION FoxBinP2_Resolve
	LPARAMETERS tcRoot, tcPath
	LOCAL lcRoot, lcPath, lcTry, i, laDir[4]
	lcRoot = FoxBinP2_NoTrail(tcRoot) + "\"
	lcPath = ALLTRIM(STRTRAN(EVL(tcPath,""), "/", "\"))
	IF (LEN(lcPath) > 2 AND SUBSTR(lcPath, 2, 1) = ":") OR LEFT(lcPath, 2) = "\\"
		RETURN IIF(FILE(lcPath), FULLPATH(lcPath), "")
	ENDIF
	lcTry = lcRoot + lcPath
	IF FILE(lcTry)
		RETURN FULLPATH(lcTry)
	ENDIF
	IF ATC("\", lcPath) = 0
		laDir[1] = "Forms\"
		laDir[2] = "LIBS\"
		laDir[3] = "REPORTS\"
		laDir[4] = "PROGS\"
		FOR i = 1 TO 4
			lcTry = lcRoot + laDir[i] + lcPath
			IF FILE(lcTry)
				RETURN FULLPATH(lcTry)
			ENDIF
		ENDFOR
	ENDIF
	RETURN ""

FUNCTION FoxBinP2_Log
	LPARAMETERS tcLog, tcMsg
	IF !EMPTY(tcLog)
		STRTOFILE(ALLTRIM(EVL(tcMsg,"")) + CHR(13)+CHR(10), tcLog, 1)
	ENDIF
	RETURN
