* Ensure FoxBin2Prg text (SC2/VC2/FR2/...) is current before editing.
* This PRG only CHECKS timestamps and writes a status file. It never calls
* foxbin2prg in-process and never RUN /W a nested vfp9 (both hung / Error 202).
*
* Batch driver (tools\run_ensure_text_current.bat):
*   1) runs this PRG
*   2) if status = NEED_BIN2PRG, launches foxbin2prg_b2p.prg separately (with timeout)
*
* Heartbeat: tools\_foxbin_ensure_status.txt overwritten each step.
* Delete tools\ensure_foxbin_text_current.fxp after editing this PRG.
PARAMETERS tcPath
SET DEVELOPMENT ON
SET STATUS BAR OFF
SET TALK OFF
SET SAFETY OFF
SET EXCLUSIVE OFF

LOCAL lcRoot, lcRootCD, lcText, lcBin, lcExt, lcLog, lcStatus, lcAction
LOCAL laB[1], laT[1], lnB, lnT
LOCAL lcOldOnError

lcOldOnError = ON("ERROR")
ON ERROR DO FoxBin_OnError

lcRoot = FoxBin_ErpRoot()
lcRootCD = FoxBin_NoTrail(lcRoot)
lcLog = FoxBin_Join(lcRoot, "tools\foxbin_sync.log")
lcStatus = FoxBin_Join(lcRoot, "tools\_foxbin_ensure_status.txt")
lcAction = FoxBin_Join(lcRoot, "tools\_foxbin_ensure_action.txt")
PUBLIC gFoxBinLog, gFoxBinStatus
gFoxBinLog = lcLog
gFoxBinStatus = lcStatus

* Clear previous action so bat does not re-run a stale BIN2PRG
IF FILE(lcAction)
	DELETE FILE (lcAction)
ENDIF

= FoxBin_Step("START", "arg=[" + IIF(VARTYPE(tcPath)="C", tcPath, TRANSFORM(tcPath)) + ;
	"] root=[" + lcRoot + "] cwd=[" + SYS(5)+SYS(2003) + "]")

IF VARTYPE(tcPath) # "C" OR EMPTY(ALLTRIM(tcPath))
	= FoxBin_Die("ENSURE FAIL: no path passed (PARAMETERS empty).")
ENDIF

tcPath = ALLTRIM(tcPath)
tcPath = STRTRAN(tcPath, ["], [])
tcPath = STRTRAN(tcPath, ['], [])

IF !FoxBin_IsDir(lcRootCD)
	= FoxBin_Die("ENSURE FAIL: ERP root not found: [" + lcRootCD + "]")
ENDIF

* Trailing backslash on SET DEFAULT TO causes Error 202
= FoxBin_Step("CD", "to=[" + lcRootCD + "]")
SET DEFAULT TO (lcRootCD)
CD (lcRootCD)
= FoxBin_Step("CD_OK", "cwd=[" + SYS(5)+SYS(2003) + "]")

lcText = FoxBin_ResolvePath(lcRoot, tcPath)
IF EMPTY(lcText)
	= FoxBin_Die("ENSURE FAIL: file not found: [" + tcPath + ;
		"] (searched under " + lcRootCD + ")")
ENDIF
= FoxBin_Step("RESOLVED", "text=[" + lcText + "]")

lcExt = UPPER(ALLTRIM(JUSTEXT(lcText)))
lcBin = FoxBin_PairBinary(lcText, lcExt)
IF EMPTY(lcBin)
	IF INLIST(lcExt, "SCX", "VCX", "FRX", "MNX", "LBX", "PJX")
		lcBin = lcText
		lcText = FORCEEXT(lcText, FoxBin_TextExt(lcExt))
		= FoxBin_Step("PAIR_FROM_BIN", "bin=[" + lcBin + "] text=[" + lcText + "]")
	ELSE
		= FoxBin_Die("ENSURE FAIL: unknown ext [" + lcExt + "] path=[" + lcText + "]")
	ENDIF
ENDIF

= FoxBin_Step("PAIR", "bin=[" + lcBin + "] exists=" + ;
	IIF(FILE(lcBin), "Y", "N") + " textExists=" + IIF(FILE(lcText), "Y", "N"))

IF !FILE(lcBin)
	IF FILE(lcText)
		= FoxBin_WriteAction(lcAction, "CURRENT", lcText)
		= FoxBin_Step("CURRENT", "text only, no binary " + JUSTFNAME(lcText))
		= FoxBin_QuitClean(lcOldOnError)
	ENDIF
	= FoxBin_Die("ENSURE FAIL: neither text nor binary exists for [" + tcPath + "]")
ENDIF

IF !FILE(lcText)
	= FoxBin_WriteAction(lcAction, "NEED_BIN2PRG", lcBin)
	= FoxBin_Step("NEED_BIN2PRG", "text missing; from [" + lcBin + "]")
	= FoxBin_QuitClean(lcOldOnError)
ENDIF

lnB = ADIR(laB, lcBin)
lnT = ADIR(laT, lcText)
IF lnB < 1
	= FoxBin_Die("ENSURE FAIL: ADIR binary failed: [" + lcBin + "] n=" + TRANSFORM(lnB))
ENDIF
IF lnT < 1
	= FoxBin_WriteAction(lcAction, "NEED_BIN2PRG", lcBin)
	= FoxBin_Step("NEED_BIN2PRG", "ADIR text failed; text=[" + lcText + "]")
	= FoxBin_QuitClean(lcOldOnError)
ENDIF

IF laB[1, 3] > laT[1, 3] OR (laB[1, 3] = laT[1, 3] AND laB[1, 4] > laT[1, 4])
	= FoxBin_WriteAction(lcAction, "NEED_BIN2PRG", lcBin)
	= FoxBin_Step("NEED_BIN2PRG", "binary newer: bin " + DTOC(laB[1,3]) + " " + ALLTRIM(laB[1,4]) + ;
		" > text " + DTOC(laT[1,3]) + " " + ALLTRIM(laT[1,4]) + " file=[" + lcBin + "]")
	= FoxBin_QuitClean(lcOldOnError)
ENDIF

= FoxBin_WriteAction(lcAction, "CURRENT", lcText)
= FoxBin_Step("CURRENT", JUSTFNAME(lcText))
= FoxBin_QuitClean(lcOldOnError)

*====================================================================
FUNCTION FoxBin_OnError
	LOCAL lcMsg, lcLog, lnErr
	ON ERROR
	lnErr = ERROR()
	lcLog = IIF(TYPE("gFoxBinLog")="C", gFoxBinLog, "E:\VFP\ERP_2\tools\foxbin_sync.log")
	lcMsg = "ENSURE ERROR " + TRANSFORM(lnErr) + ": " + MESSAGE() + ;
		" prog=" + PROGRAM() + " line=" + TRANSFORM(LINENO())
	TRY
		STRTOFILE(lcMsg + CHR(13)+CHR(10), lcLog, 1)
		IF TYPE("gFoxBinStatus")="C" AND !EMPTY(gFoxBinStatus)
			STRTOFILE(lcMsg + CHR(13)+CHR(10), gFoxBinStatus, 0)
		ENDIF
	CATCH
	ENDTRY
	? lcMsg
	QUIT
	RETURN

FUNCTION FoxBin_QuitClean
	LPARAMETERS tcOldOnError
	= FoxBin_Step("QUIT", "clean")
	IF VARTYPE(tcOldOnError) = "C" AND !EMPTY(tcOldOnError)
		ON ERROR &tcOldOnError
	ELSE
		ON ERROR
	ENDIF
	QUIT
	RETURN

FUNCTION FoxBin_Die
	LPARAMETERS tcMsg
	= FoxBin_Step("FAIL", EVL(tcMsg, ""))
	? EVL(tcMsg, "")
	ON ERROR
	QUIT
	RETURN .F.

FUNCTION FoxBin_WriteAction
	LPARAMETERS tcFile, tcAction, tcPath
	* One line bat can parse: ACTION|fullpath
	STRTOFILE(UPPER(ALLTRIM(EVL(tcAction,""))) + "|" + ALLTRIM(EVL(tcPath,"")) + CHR(13)+CHR(10), ;
		tcFile, 0)
	RETURN

FUNCTION FoxBin_Step
	LPARAMETERS tcStep, tcDetail
	LOCAL lcLine, lcLog, lcStatus
	lcLog = IIF(TYPE("gFoxBinLog")="C", gFoxBinLog, "E:\VFP\ERP_2\tools\foxbin_sync.log")
	lcStatus = IIF(TYPE("gFoxBinStatus")="C", gFoxBinStatus, "E:\VFP\ERP_2\tools\_foxbin_ensure_status.txt")
	lcLine = "ENSURE " + ALLTRIM(EVL(tcStep, "?")) + " " + TTOC(DATETIME()) + ;
		" " + ALLTRIM(EVL(tcDetail, ""))
	= FoxBin_Log(lcLog, lcLine)
	IF FoxBin_IsDir(JUSTPATH(lcStatus))
		STRTOFILE(lcLine + CHR(13)+CHR(10), lcStatus, 0)
	ENDIF
	RETURN

FUNCTION FoxBin_ErpRoot
	LOCAL lcRoot, lcHere, lcProbe

	lcRoot = "E:\VFP\ERP_2"
	IF FoxBin_IsDir(lcRoot) AND FoxBin_IsDir(FoxBin_Join(lcRoot, "tools"))
		RETURN FoxBin_Join(lcRoot, "")
	ENDIF

	lcHere = JUSTPATH(SYS(16, 0))
	IF FILE(FoxBin_Join(lcHere, "ensure_foxbin_text_current.prg"))
		RETURN FoxBin_Join(JUSTPATH(lcHere), "")
	ENDIF
	IF FILE(FoxBin_Join(lcHere, "foxbin2prg_b2p.prg")) OR FILE(FoxBin_Join(lcHere, "foxbin2prg.prg"))
		RETURN FoxBin_Join(JUSTPATH(JUSTPATH(lcHere)), "")
	ENDIF

	lcProbe = FoxBin_NoTrail(ADDBS(SYS(5) + SYS(2003)))
	IF FoxBin_IsDir(FoxBin_Join(lcProbe, "tools")) AND FoxBin_IsDir(FoxBin_Join(lcProbe, "Forms"))
		RETURN FoxBin_Join(lcProbe, "")
	ENDIF
	RETURN FoxBin_Join(lcProbe, "")

FUNCTION FoxBin_NoTrail
	LPARAMETERS tcPath
	LOCAL lc
	lc = ALLTRIM(EVL(tcPath, ""))
	DO WHILE RIGHT(lc, 1) = "\" OR RIGHT(lc, 1) = "/"
		lc = LEFT(lc, LEN(lc) - 1)
	ENDDO
	RETURN lc

FUNCTION FoxBin_Join
	LPARAMETERS tcBase, tcRel
	LOCAL lcBase, lcRel
	lcBase = FoxBin_NoTrail(EVL(tcBase, ""))
	lcRel = ALLTRIM(EVL(tcRel, ""))
	lcRel = STRTRAN(lcRel, "/", "\")
	DO WHILE LEFT(lcRel, 1) = "\"
		lcRel = SUBSTR(lcRel, 2)
	ENDDO
	IF EMPTY(lcRel)
		RETURN lcBase + "\"
	ENDIF
	RETURN lcBase + "\" + lcRel

FUNCTION FoxBin_IsDir
	LPARAMETERS tcPath
	LOCAL lc
	lc = FoxBin_NoTrail(EVL(tcPath, ""))
	IF EMPTY(lc)
		RETURN .F.
	ENDIF
	RETURN DIRECTORY(lc)

FUNCTION FoxBin_PairBinary
	LPARAMETERS tcText, tcExt
	DO CASE
	CASE tcExt == "SC2"
		RETURN FORCEEXT(tcText, "scx")
	CASE tcExt == "VC2"
		RETURN FORCEEXT(tcText, "vcx")
	CASE tcExt == "FR2"
		RETURN FORCEEXT(tcText, "frx")
	CASE tcExt == "MN2"
		RETURN FORCEEXT(tcText, "mnx")
	CASE tcExt == "LB2"
		RETURN FORCEEXT(tcText, "lbx")
	CASE tcExt == "PJ2"
		RETURN FORCEEXT(tcText, "pjx")
	OTHERWISE
		RETURN ""
	ENDCASE

FUNCTION FoxBin_TextExt
	LPARAMETERS tcBinExt
	DO CASE
	CASE tcBinExt == "SCX"
		RETURN "sc2"
	CASE tcBinExt == "VCX"
		RETURN "vc2"
	CASE tcBinExt == "FRX"
		RETURN "fr2"
	CASE tcBinExt == "MNX"
		RETURN "mn2"
	CASE tcBinExt == "LBX"
		RETURN "lb2"
	CASE tcBinExt == "PJX"
		RETURN "pj2"
	OTHERWISE
		RETURN "sc2"
	ENDCASE

FUNCTION FoxBin_ResolvePath
	LPARAMETERS tcRoot, tcPath
	LOCAL lcRoot, lcPath, lcTry, i, laDir[4]

	lcRoot = FoxBin_Join(EVL(tcRoot, ""), "")
	lcPath = ALLTRIM(EVL(tcPath, ""))
	IF EMPTY(lcPath)
		RETURN ""
	ENDIF
	lcPath = STRTRAN(lcPath, "/", "\")
	lcPath = STRTRAN(lcPath, ["], [])
	lcPath = STRTRAN(lcPath, ['], [])

	IF (LEN(lcPath) > 2 AND SUBSTR(lcPath, 2, 1) = ":") OR LEFT(lcPath, 2) = "\\"
		IF FILE(lcPath)
			RETURN FULLPATH(lcPath)
		ENDIF
		RETURN ""
	ENDIF

	lcTry = FoxBin_Join(FoxBin_NoTrail(lcRoot), lcPath)
	IF FILE(lcTry)
		RETURN FULLPATH(lcTry)
	ENDIF

	IF ATC(":\", lcPath) = 0 AND LEFT(lcPath, 2) # "\\"
		lcTry = FoxBin_Join(SYS(5)+SYS(2003), lcPath)
		IF FILE(lcTry)
			RETURN FULLPATH(lcTry)
		ENDIF
	ENDIF

	IF ATC("\", lcPath) = 0
		laDir[1] = "Forms"
		laDir[2] = "LIBS"
		laDir[3] = "REPORTS"
		laDir[4] = "PROGS"
		FOR i = 1 TO 4
			lcTry = FoxBin_Join(FoxBin_NoTrail(lcRoot), laDir[i] + "\" + lcPath)
			IF FILE(lcTry)
				RETURN FULLPATH(lcTry)
			ENDIF
		ENDFOR
	ENDIF
	RETURN ""

FUNCTION FoxBin_Log
	LPARAMETERS tcLog, tcMsg
	LOCAL lcFile, lcLine
	lcFile = EVL(tcLog, "")
	IF EMPTY(lcFile)
		RETURN
	ENDIF
	lcLine = ALLTRIM(EVL(tcMsg, "")) + CHR(13) + CHR(10)
	IF !FoxBin_IsDir(JUSTPATH(lcFile))
		RETURN
	ENDIF
	STRTOFILE(lcLine, lcFile, 1)
	RETURN
