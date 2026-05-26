* Paste into GitCommit.prg — replace git RUN lines and add function at bottom.

*--- 2-4. git via cmd.exe (RUN /C waits — do NOT use RUN /N)
? "2. git add . ..."
lnGitErr = GitCommit_RunGit(lcProjectPath, "add .")

FUNCTION GitCommit_RunGit
LPARAMETERS tcRepoPath, tcGitArgs
LOCAL lcPath, lcShell
lcPath = ALLTRIM(tcRepoPath)
IF RIGHT(lcPath, 1) = "\"
	lcPath = LEFT(lcPath, LEN(lcPath) - 1)
ENDIF
lcShell = 'cmd /c "cd /d "' + lcPath + '" && git ' + tcGitArgs + '"'
RUN /C &lcShell
RETURN _VFP.LastError
ENDFUNC
