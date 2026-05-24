*====================================================================
* GitCommit.prg
* Wrapper: FoxBin2Prg + git add + git commit (+ optional push)
* Usage: DO GitCommit WITH "Your commit message here"
*====================================================================

LPARAMETERS tcMessage

LOCAL lcProjectPath, lcFoxBin2Prg, lcGitCmd, lcFullMessage, llSuccess

lcProjectPath   = SYS(5) + SYS(2003)
lcFoxBin2Prg    = lcProjectPath + "tools\FoxBin2Prg.prg"

LOCAL llPushAfterCommit
llPushAfterCommit = .T.

IF EMPTY(tcMessage)
   tcMessage = INPUTBOX("Enter commit message:", "Git Commit", "Updated ERP sources")
   IF EMPTY(tcMessage)
      MESSAGEBOX("Commit cancelled - no message provided.", 48, "GitCommit")
      RETURN
   ENDIF
ENDIF

lcFullMessage = ALLTRIM(tcMessage) + " - " + TRANSFORM(DATETIME())

CD (lcProjectPath)

? "=== Starting Git Commit Process ==="
? "Project path :", lcProjectPath
? "Message      :", lcFullMessage
?

? "1. Running FoxBin2Prg (BIN → Text) ..."
IF FILE(lcFoxBin2Prg)
	DO (lcFoxBin2Prg) WITH lcProjectPath, "BIN2PRG"
ENDIF
? "   FoxBin2Prg completed."
?

? "2. Running git add . ..."
lcGitCmd = "git add ."
RUN /N &lcGitCmd
? "   git add completed."
?

? "3. Running git commit ..."
lcGitCmd = 'git commit -m "' + lcFullMessage + '"'
RUN /N &lcGitCmd
? "   Commit finished."
?

IF llPushAfterCommit
   ? "4. Pushing to remote (git push) ..."
   lcGitCmd = "git push"
   RUN /N &lcGitCmd
   ? "   Push completed."
ENDIF

MESSAGEBOX("Git commit completed!" + CHR(13) + ;
           "Message: " + lcFullMessage, 64, "Success")

RETURN
