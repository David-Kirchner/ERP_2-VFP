*=================================================================
* erp_build_test.prg
* Cumulative VFP build tester. Reads erp_idx.txt (= N), builds a
* FRESH erp_test project containing forms #1..#N from erp_forms.txt
* plus a stub main, then BUILD APP and BUILD EXE.
*
* Every step is written to erp_test_results.log BEFORE it is
* attempted, so a hard crash (vfp9.exe dies) during the EXE build
* still leaves a breadcrumb identifying the offending form:
*   - "PASS"            -> forms 1..N built the EXE cleanly
*   - "TRAPPED ERROR"   -> a normal, recoverable compile/build error
*   - last line is "building EXE ..." with no "EXE OK" / "PASS"
*                       -> VFP crashed building the EXE for form #N
*=================================================================
PUBLIC glcLog
LOCAL lcBase, lnIdx, lnCount, lnF, lcForm, lcStem, lcStub, oProj, lcStubCode

lcBase = "e:\vfp\erp_2\"
glcLog = lcBase + "erp_test_results.log"

SET TALK OFF
SET SAFETY OFF
SET DEFAULT TO (lcBase)
ON ERROR DO HandleErr WITH ERROR(), MESSAGE(), LINENO(), SYS(16)

lnIdx = INT(VAL(FILETOSTR(lcBase + "erp_idx.txt")))

LOCAL ARRAY laForms[1]
lnCount = ALINES(laForms, FILETOSTR(lcBase + "erp_forms.txt"))

IF lnIdx < 1 OR lnIdx > lnCount
   =LogLine("[#" + TRANSFORM(lnIdx) + "] INDEX OUT OF RANGE (have " + TRANSFORM(lnCount) + " forms)")
   QUIT
ENDIF

lcForm = ALLTRIM(laForms[lnIdx])
=LogLine("[#" + TRANSFORM(lnIdx) + "] START cumulative build, forms 1.." + TRANSFORM(lnIdx) + "  | newest = " + lcForm)

* --- wipe previous test artifacts so each run is clean ---
lcStem = lcBase + "erp_test"
LOCAL ARRAY laExt[6]
laExt[1] = ".pjx"
laExt[2] = ".pjt"
laExt[3] = ".app"
laExt[4] = ".exe"
laExt[5] = ".err"
laExt[6] = ".dbg"
FOR lnF = 1 TO 6
   IF FILE(lcStem + laExt[lnF])
      DELETE FILE (lcStem + laExt[lnF])
   ENDIF
ENDFOR

* --- generate a stub main so an EXE can be produced ---
lcStub = lcBase + "erp_main.prg"
TEXT TO lcStubCode NOSHOW
* Auto-generated stub main for build-testing only. Do not run.
RETURN
ENDTEXT
STRTOFILE(lcStubCode, lcStub)

* --- assemble the test project ---
CREATE PROJECT (lcStem) NOWAIT
oProj = _VFP.ActiveProject
oProj.Files.Add(lcStub)
oProj.SetMain("erp_main.prg")
FOR lnF = 1 TO lnIdx
   oProj.Files.Add(ALLTRIM(laForms[lnF]))
ENDFOR

* --- BUILD APP ---
=LogLine("[#" + TRANSFORM(lnIdx) + "] building APP ...")
oProj.Build(lcStem + ".app", 2, .T., .F.)
=LogLine("[#" + TRANSFORM(lnIdx) + "] APP OK")

* --- BUILD EXE  (this is where the crash is expected) ---
=LogLine("[#" + TRANSFORM(lnIdx) + "] building EXE ...")
oProj.Build(lcStem + ".exe", 3, .T., .F.)
=LogLine("[#" + TRANSFORM(lnIdx) + "] EXE OK")

oProj.Close()
=LogLine("[#" + TRANSFORM(lnIdx) + "] PASS  (forms 1.." + TRANSFORM(lnIdx) + " built EXE cleanly)")
=LogLine(REPLICATE("-", 64))
QUIT

*-----------------------------------------------------------------
PROCEDURE LogLine
LPARAMETERS tcMsg
STRTOFILE(TTOC(DATETIME()) + "  " + tcMsg + CHR(13) + CHR(10), glcLog, .T.)
ENDPROC

*-----------------------------------------------------------------
PROCEDURE HandleErr
LPARAMETERS tnErr, tcMsg, tnLine, tcProg
=LogLine("TRAPPED ERROR " + TRANSFORM(tnErr) + " : " + tcMsg + " (line " + TRANSFORM(tnLine) + " in " + tcProg + ")")
=LogLine(REPLICATE("-", 64))
QUIT
ENDPROC
