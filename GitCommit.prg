*====================================================================
* GitCommit.prg
* Close VFP projects, FoxBin2Prg (ERP.pjx → text), git add, commit, push
* Usage from E:\VFP\ERP_2:  DO GitCommit WITH "Your commit message"
*====================================================================

LPARAMETERS tcMessage

LOCAL lcProjectPath, lcFoxBin2Prg, lcPjx, lcGitCmd, lcFullMessage
LOCAL lcMsgFile, lcErrLog, llPushAfterCommit, loP

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

? "=== GitCommit (ERP_2 → GitHub ERP_2-VFP) ==="
? "Project path :", lcProjectPath
? "Message      :", lcFullMessage
?

*--- 0. Save and close projects so ERP.PJT / ERP.pjx are not locked
? "0. Closing open VFP projects (releases ERP.PJT lock) ..."
FOR EACH loP IN _VFP.Projects FOXOBJECT
	loP.Save()
	loP.Close()
ENDFOR
? "   Projects closed."
?

*--- 1. FoxBin2Prg: binary → text (.sc2, .pj2, etc.) for files in ERP.pjx
? "1. FoxBin2Prg (BIN → Text) ..."
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
	MESSAGEBOX("FoxBin2Prg reported errors. See:" + CHR(13) + lcErrLog + CHR(13) + CHR(13) + ;
		"Fix errors before committing, or continue with caution.", 48, "GitCommit")
ENDIF
? "   FoxBin2Prg finished."
?

*--- 2. git add (RUN /C waits; do not use RUN /N or git may run before FoxBin2Prg finishes)
? "2. git add . ..."
RUN /C git add .
IF _VFP.LastError # 0
	MESSAGEBOX("git add failed (code " + TRANSFORM(_VFP.LastError) + ")." + CHR(13) + ;
		"Close any app still locking ERP.PJT, or run from PowerShell after closing VFP.", 16, "GitCommit")
	RETURN
ENDIF
? "   git add finished."
?

*--- 3. git commit
? "3. git commit ..."
STRTOFILE(lcFullMessage, lcMsgFile)
lcGitCmd = 'git commit -F "' + lcMsgFile + '"'
RUN /C &lcGitCmd
IF FILE(lcMsgFile)
	DELETE FILE (lcMsgFile)
ENDIF
? "   git commit finished."
?

IF llPushAfterCommit
	? "4. git push ..."
	RUN /C git push -u origin main
	? "   git push finished."
ENDIF

MESSAGEBOX("GitCommit finished." + CHR(13) + "Message: " + lcFullMessage + CHR(13) + CHR(13) + ;
	"Reopen ERP.pjx in Project Manager if needed.", 64, "GitCommit")

RETURN
