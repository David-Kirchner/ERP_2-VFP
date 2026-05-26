*====================================================================
* GitCommit.prg - Fixed for VFP 9
*====================================================================

LPARAMETERS tcMessage

LOCAL lcProjectPath, lcFoxBin2Prg, lcPjx, lcFullMessage
LOCAL lcMsgFile, lcErrLog, llPushAfterCommit, loProj, lnProj

lcProjectPath   = ADDBS(SYS(5) + SYS(2003))
lcFoxBin2Prg    = lcProjectPath + "tools\FoxBin2Prg.prg"
lcPjx           = lcProjectPath + "ERP.pjx"
llPushAfterCommit = .T.

IF EMPTY(tcMessage)
	tcMessage = INPUTBOX("Enter commit message:", "Git Commit", "Updated ERP_2 sources")
	IF EMPTY(tcMessage)
		MESSAGEBOX("Commit cancelled - no message provided.", 48, "GitCommit")
		RETURN
	ENDIF
ENDIF

lcFullMessage = ALLTRIM(tcMessage) + " - " + TRANSFORM(DATETIME())
lcMsgFile = lcProjectPath + "tools\_gitcommit_msg.txt"

CD (lcProjectPath)

? "=== GitCommit (ERP_2 -> GitHub ERP_2-VFP) ==="
? "Project path :", lcProjectPath
? "Message      :", lcFullMessage
?

*--- 0. Close open projects
? "0. Closing open VFP projects..."
FOR lnProj = _VFP.Projects.Count TO 1 STEP -1
	loProj = _VFP.Projects(lnProj)
	IF VARTYPE(loProj) = "O" AND PEMSTATUS(loProj, "Close", 5)
		loProj.Close()
	ENDIF
ENDFOR
? "   Projects closed."
?

*--- 1. FoxBin2Prg
? "1. FoxBin2Prg (BIN -> Text) ..."
IF NOT FILE(lcFoxBin2Prg)
	MESSAGEBOX("FoxBin2Prg not found:" + CHR(13) + lcFoxBin2Prg, 16, "GitCommit")
	RETURN
ENDIF

IF FILE(lcPjx)
	DO (lcFoxBin2Prg) WITH lcPjx, "*"
ELSE
	DO (lcFoxBin2Prg) WITH lcProjectPath, "BIN2PRG"
ENDIF

lcErrLog = lcProjectPath + "tools\FoxBin2Prg_Error.LOG"
IF FILE(lcErrLog)
	MESSAGEBOX("FoxBin2Prg reported errors. See:" + CHR(13) + lcErrLog + CHR(13)+CHR(13)+ ;
		"Fix errors before committing.", 48, "GitCommit")
ENDIF
? "   FoxBin2Prg finished."
?

*--- 2. git add
? "2. git add . ..."
*GitCommit_RunCmd(lcProjectPath, "git add .")
RUN /N cmd /c "git add ."
? "   git add finished."
?

*--- 3. git commit
? "3. git commit ..."
STRTOFILE(lcFullMessage, lcMsgFile, 0)   && 0 = overwrite
*GitCommit_RunCmd(lcProjectPath, ;
*	"git commit -F tools\_gitcommit_msg.txt && del tools\_gitcommit_msg.txt")
	
RUN /N cmd /c "git commit -F tools\_gitcommit_msg.txt && del tools\_gitcommit_msg.txt"

? "   git commit finished."
?

IF llPushAfterCommit
	? "4. git push ..."
	RUN /N cmd /c "git push -u origin main"
	? "   git push finished."
ENDIF

MESSAGEBOX("Git commit workflow finished." + CHR(13) + ;
	"Message: " + lcFullMessage + CHR(13) + CHR(13) + ;
	"Check the VFP window for FoxBin2Prg / git output.", 64, "GitCommit")

RETURN