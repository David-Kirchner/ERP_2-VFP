* erp_2_slow_add.prg - add ONE project member at a time; restore clean PJT after BUILD
* Usage (VFP command window):
*   DO tools\erp_2_slow_add WITH "STATUS"
*   DO tools\erp_2_slow_add WITH "RESTORE_PJT"
*   DO tools\erp_2_slow_add WITH "CLEAN_JUNK"
*   DO tools\erp_2_slow_add WITH "NEXT"
*   DO tools\erp_2_slow_add WITH "SKIP"
PARAMETERS tcMode
PRIVATE lcRoot, lcPjx, lcPjt, lcArchPjt, lcLog, lcCsv, lcQueue, lcState, lcJunk
PRIVATE lcExe, lcApp, lcErr, tcMode, llHeadless

lcRoot  = "E:\VFP\ERP_2\"
lcPjx   = lcRoot + "erp_2.pjx"
lcPjt   = lcRoot + "erp_2.pjt"
lcArchPjt = lcRoot + "tools\project_bak_archive\erp.pjt.bak.20260610"
lcLog   = lcRoot + "tools\erp_2_slow_add.log"
lcCsv   = lcRoot + "tools\erp_2_slow_add_results.csv"
lcQueue = lcRoot + "tools\erp_2_add_queue.txt"
lcState = lcRoot + "tools\erp_2_slow_add_state.txt"
lcJunk  = lcRoot + "tools\erp_2_remove_junk.txt"
lcExe   = lcRoot + "erp_2.exe"
lcApp   = lcRoot + "erp_2.app"
lcErr   = lcRoot + "erp_2.err"
tcMode  = UPPER(ALLTRIM(EVL(tcMode, "STATUS")))
llHeadless = !_SCREEN.Visible
IF llHeadless
	SET TALK OFF
	_SCREEN.Visible = .F.
ELSE
	SET TALK ON
ENDIF
SET SAFETY OFF
SET CONFIRM OFF
SET NOTIFY OFF
CLOSE ALL

SET DEFAULT TO (lcRoot)
CD (lcRoot)

IF !FILE(lcLog)
	STRTOFILE("erp_2 slow add " + TTOC(DATETIME()) + CHR(13)+CHR(10), lcLog, .F.)
ENDIF
IF !FILE(lcCsv)
	STRTOFILE("timestamp,member,phase,result,detail,pjt_bytes"+CHR(13)+CHR(10), lcCsv, .F.)
ENDIF

DO CASE
CASE tcMode == "STATUS"
	DO ShowStatus
CASE tcMode == "RESTORE_PJT"
	DO RestoreCleanPjt
	? "Restored clean erp_2.pjt from archive (" + TRANSFORM(FILE(lcArchPjt)) + " bytes)"
CASE tcMode == "CLEAN_JUNK"
	DO RemoveJunkRows
CASE tcMode == "SKIP"
	DO AdvanceState
	? "Skipped. Next index: " + TRANSFORM(ValState())
CASE tcMode == "NEXT"
	DO DoNext
OTHERWISE
	IF !llHeadless
		? "Modes: STATUS, RESTORE_PJT, CLEAN_JUNK, NEXT, SKIP"
	ENDIF
ENDCASE
IF llHeadless
	QUIT
ENDIF
RETURN

*------------------------------------------------------------------------------
PROCEDURE ShowStatus
	LOCAL lnIdx, lnTot, lcNext, lnPjt, lnPjx
	lnIdx = ValState()
	lnTot = QueueCount()
	lcNext = QueueLine(lnIdx + 1)
	lnPjt = FILE(lcPjt)
	lnPjx = MemberCount()
	? "=== erp_2 slow add ==="
	? "Project: " + lcPjx
	? "PJT bytes: " + TRANSFORM(lnPjt) + "  (good archive = 2419565)"
	? "Members in erp_2.pjx: " + TRANSFORM(lnPjx)
	? "Queue progress: " + TRANSFORM(lnIdx) + " / " + TRANSFORM(lnTot) + " added-or-tested"
	IF !EMPTY(lcNext)
		? "Next queued: " + lcNext
	ELSE
		? "Queue complete."
	ENDIF
	? "Log: " + lcLog
	? "CSV: " + lcCsv
	STRTOFILE("STATUS idx=" + TRANSFORM(lnIdx) + " members=" + TRANSFORM(lnPjx) + " pjt=" + TRANSFORM(lnPjt) + CHR(13)+CHR(10), lcLog, 1)
	RETURN

*------------------------------------------------------------------------------
PROCEDURE DoNext
	LOCAL lnIdx, lcMember, lcPath, lnErr, lcDetail, llOk, lcStart, laF[1], ldApp
	lnIdx = ValState() + 1
	lcMember = QueueLine(lnIdx)
	IF EMPTY(lcMember)
		? "Queue complete. Nothing to add."
		RETURN
	ENDIF
	lcPath = lcRoot + STRTRAN(lcMember, "/", "\")
	IF !FILE(lcPath)
		lcDetail = "missing on disk"
		? "SKIP missing: " + lcMember
		DO LogRow WITH lcMember, "MISSING", "FAIL", lcDetail
		DO SaveState WITH lnIdx
		RETURN
	ENDIF
	DO RestoreCleanPjt
	IF !AddMember(lcMember)
		? "FAIL could not add to erp_2.pjx: " + lcMember
		DO LogRow WITH lcMember, "PJX_FAIL", "FAIL", "add row failed"
		RETURN
	ENDIF
	? "Added to project: " + lcMember
	? "Building erp_2.exe (Recompile all should be OFF)..."
	lcStart = DATETIME()
	IF FILE(lcErr)
		ERASE (lcErr)
	ENDIF
	lnErr = 0
	ON ERROR lnErr = ERROR()
	BUILD EXE erp_2 FROM erp_2
	ON ERROR
	lcDetail = "err=" + TRANSFORM(lnErr)
	IF lnErr # 0
		lcDetail = lcDetail + " " + MESSAGE()
	ENDIF
	IF FILE(lcErr)
		lcDetail = lcDetail + " " + LEFT(FILETOSTR(lcErr), 200)
	ENDIF
	llOk = .F.
	IF FILE(lcApp)
		IF ADIR(laF, lcApp) > 0
			ldApp = DATETIME(laF[1, 3], laF[1, 4])
			llOk = (ldApp >= lcStart)
		ENDIF
	ENDIF
	DO RestoreCleanPjt
	IF TYPE("_VFP.ActiveProject") = "O"
		CLOSE PROJECT NOSAVE
	ENDIF
	CLOSE ALL
	IF llOk
		? "BUILD PASS: " + lcMember
		DO LogRow WITH lcMember, "BUILD_PASS", "PASS", lcDetail
		DO SaveState WITH lnIdx
	ELSE
		? "BUILD FAIL - removing " + lcMember + " from erp_2.pjx"
		DO RemoveMember WITH lcMember
		DO LogRow WITH lcMember, "BUILD_FAIL", "FAIL", lcDetail
		DO SaveState WITH lnIdx
		? "Marked tested. Fix file or exclude manually, then NEXT again."
	ENDIF
	? "PJT restored to archive size. PJX kept if PASS."
	RETURN

*------------------------------------------------------------------------------
PROCEDURE RestoreCleanPjt
	IF TYPE("_VFP.ActiveProject") = "O"
		CLOSE PROJECT NOSAVE
	ENDIF
	CLOSE ALL
	IF FILE(lcArchPjt)
		COPY FILE (lcArchPjt) TO (lcPjt)
		STRTOFILE("RESTORE_PJT " + TTOC(DATETIME()) + CHR(13)+CHR(10), lcLog, 1)
	ENDIF
	RETURN

*------------------------------------------------------------------------------
PROCEDURE RemoveJunkRows
	LOCAL laJ[1], ln, i, lcRow, lnDel
	lnDel = 0
	IF !FILE(lcJunk)
		? "No junk list: " + lcJunk
		RETURN
	ENDIF
	ALINES(laJ, FILETOSTR(lcJunk))
	FOR i = 1 TO ALEN(laJ)
		lcRow = LOWER(ALLTRIM(laJ[i]))
		IF !EMPTY(lcRow)
			IF RemoveMember(lcRow)
				lnDel = lnDel + 1
				? "Removed: " + lcRow
			ENDIF
		ENDIF
	ENDFOR
	? "Removed " + TRANSFORM(lnDel) + " junk rows from erp_2.pjx"
	RETURN

*------------------------------------------------------------------------------
FUNCTION AddMember
	LPARAMETERS tcRel
	LOCAL lcLow
	lcLow = LOWER(ALLTRIM(tcRel))
	IF EMPTY(lcLow)
		RETURN .F.
	ENDIF
	USE (lcPjx) IN 0 ALIAS pja EXCLUSIVE
	LOCATE FOR LOWER(ALLTRIM(name)) == lcLow
	IF FOUND()
		REPLACE exclude WITH .F. IN pja
		USE IN pja
		RETURN .T.
	ENDIF
	LOCATE FOR LOWER(JUSTFNAME(name)) == "main.prg"
	IF !FOUND()
		GO TOP
	ENDIF
	IF EOF()
		USE IN pja
		RETURN .F.
	ENDIF
	SCATTER MEMVAR
	APPEND BLANK
	GATHER MEMVAR
	REPLACE name WITH lcLow, exclude WITH .F. IN pja
	USE IN pja
	RETURN .T.

*------------------------------------------------------------------------------
FUNCTION RemoveMember
	LPARAMETERS tcRel
	LOCAL lcLow, ll
	lcLow = LOWER(ALLTRIM(tcRel))
	USE (lcPjx) IN 0 ALIAS pjr EXCLUSIVE
	LOCATE FOR LOWER(ALLTRIM(name)) == lcLow
	ll = FOUND()
	IF ll
		DELETE IN pjr
	ENDIF
	USE IN pjr
	RETURN ll

*------------------------------------------------------------------------------
FUNCTION MemberCount
	LOCAL ln
	USE (lcPjx) IN 0 SHARED ALIAS pjc
	COUNT TO ln FOR !EMPTY(ALLTRIM(name)) .AND. !DELETED()
	USE IN pjc
	RETURN ln

*------------------------------------------------------------------------------
FUNCTION ValState
	LOCAL ln
	ln = 0
	IF FILE(lcState)
		ln = VAL(ALLTRIM(FILETOSTR(lcState)))
	ENDIF
	RETURN ln

*------------------------------------------------------------------------------
PROCEDURE SaveState
	LPARAMETERS tnIdx
	STRTOFILE(TRANSFORM(tnIdx), lcState, .F.)
	RETURN

*------------------------------------------------------------------------------
PROCEDURE AdvanceState
	DO SaveState WITH ValState() + 1
	RETURN

*------------------------------------------------------------------------------
FUNCTION QueueCount
	LOCAL laQ[1]
	IF !FILE(lcQueue)
		RETURN 0
	ENDIF
	RETURN ALINES(laQ, FILETOSTR(lcQueue))
ENDFUNC

*------------------------------------------------------------------------------
FUNCTION QueueLine
	LPARAMETERS tnLine
	LOCAL laQ[1], ln
	ln = ALINES(laQ, FILETOSTR(lcQueue))
	IF tnLine < 1 .OR. tnLine > ln
		RETURN ""
	ENDIF
	RETURN ALLTRIM(laQ[tnLine])
ENDFUNC

*------------------------------------------------------------------------------
PROCEDURE LogRow
	LPARAMETERS tcMember, tcPhase, tcRes, tcDetail
	LOCAL lcRow
	tcDetail = STRTRAN(STRTRAN(ALLTRIM(tcDetail), CHR(13), " "), CHR(10), " ")
	tcDetail = STRTRAN(tcDetail, ",", ";")
	lcRow = TTOC(DATETIME()) + "," + tcMember + "," + tcPhase + "," + tcRes + "," + tcDetail + "," + TRANSFORM(FILE(lcPjt))
	STRTOFILE(lcRow + CHR(13)+CHR(10), lcCsv, 1)
	STRTOFILE(lcRow + CHR(13)+CHR(10), lcLog, 1)
	RETURN
