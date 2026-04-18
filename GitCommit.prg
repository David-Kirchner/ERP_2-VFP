*====================================================================
* GitCommit.prg
* Wrapper: FoxBin2Prg + git add + git commit (+ optional push)
* Usage: DO GitCommit WITH "Your commit message here"
*====================================================================

LPARAMETERS tcMessage

LOCAL lcProjectPath, lcFoxBin2Prg, lcGitCmd, lcFullMessage, llSuccess

* ==============================================
* Configuration - Change only if needed
* ==============================================
lcProjectPath   = "E:\VFP\ERP_1"                     && Your project root
lcFoxBin2Prg    = "E:\VFP\ERP_1\tools\FoxBin2Prg.prg" && Path to FoxBin2Prg

* Optional: change to .F. if you don't want to push automatically
LOCAL llPushAfterCommit
llPushAfterCommit = .T.

* ==============================================
IF EMPTY(tcMessage)
   tcMessage = INPUTBOX("Enter commit message:", "Git Commit", "Updated ERP sources")
   IF EMPTY(tcMessage)
      MESSAGEBOX("Commit cancelled - no message provided.", 48, "GitCommit")
      RETURN
   ENDIF
ENDIF

lcFullMessage = ALLTRIM(tcMessage) + " - " + TRANSFORM(DATETIME())

* Change to project directory
CD (lcProjectPath)

? "=== Starting Git Commit Process ==="
? "Project path :", lcProjectPath
? "Message      :", lcFullMessage
?

* Step 1: Run FoxBin2Prg to update all text versions
? "1. Running FoxBin2Prg (BIN → Text) ..."
DO (lcFoxBin2Prg) WITH lcProjectPath, "BIN2PRG"   && No SHOWMSG for cleaner output

* Optional: Use this line instead if you want the progress window
* DO (lcFoxBin2Prg) WITH lcProjectPath, "BIN2PRG-SHOWMSG"

? "   FoxBin2Prg completed."
?

* Step 2: Git add everything
? "2. Running git add . ..."
lcGitCmd = "git add ."
RUN /N &lcGitCmd

? "   git add completed."
?

* Step 3: Git commit
? "3. Running git commit ..."
lcGitCmd = 'git commit -m "' + lcFullMessage + '"'
RUN /N &lcGitCmd

? "   Commit finished."
?

* Step 4: Optional push to GitHub
IF llPushAfterCommit
   ? "4. Pushing to remote (git push) ..."
   lcGitCmd = "git push"
   RUN /N &lcGitCmd
   ? "   Push completed."
ELSE
   ? "   (Push skipped - set llPushAfterCommit = .T. to enable)"
ENDIF

? 
? "=== Git Commit Process Finished Successfully ==="
? "Commit message: " + lcFullMessage
?

MESSAGEBOX("Git commit completed!" + CHR(13) + ;
           "Message: " + lcFullMessage, 64, "Success")

RETURN