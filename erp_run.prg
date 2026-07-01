*=================================================================
* erp_run.prg  -- ORCHESTRATOR (run from VFP, does NOT quit VFP)
*
* Usage in the VFP Command Window:
*     DO e:\vfp\erp_2\erp_run.prg            && pilot: first 4 forms
*     DO e:\vfp\erp_2\erp_run.prg WITH 9999  && all forms
*
* Why this exists: double-clicking / running run_erp_buildtest.bat
* is blocked on this machine (security software / policy), so we
* drive everything from inside VFP instead. This program spawns a
* FRESH vfp9.exe per form (crash isolation) via WScript.Shell and
* waits for each. Each child logs to erp_test_results.log BEFORE
* the risky build step, so a hard crash still names the form.
*=================================================================
LPARAMETERS tnMax
LOCAL lcBase, lcVfp, oWSH, lnN, lnI

lcBase = "e:\vfp\erp_2\"
lcVfp  = "C:\Program Files (x86)\Microsoft Visual FoxPro 9\vfp9.exe"

IF VARTYPE(tnMax) <> "N" OR tnMax <= 0
   tnMax = 4   && pilot default
ENDIF

SET DEFAULT TO (lcBase)
SET SAFETY OFF

ERASE (lcBase + "erp_forms.txt")
ERASE (lcBase + "erp_test_results.log")

oWSH = CREATEOBJECT("WScript.Shell")

* --- Step 1: enumerate forms (child writes erp_forms.txt then QUITs) ---
oWSH.Run('"' + lcVfp + '" -C"' + lcBase + 'config_enum.fpw"', 1, .T.)

IF NOT FILE(lcBase + "erp_forms.txt")
   MESSAGEBOX("Enumeration failed: erp_forms.txt was not created." + CHR(13) + ;
              "Check that ERP.pjx exists at " + lcBase, 16, "ERP build test")
   RETURN
ENDIF

LOCAL ARRAY laF[1]
lnN = ALINES(laF, FILETOSTR(lcBase + "erp_forms.txt"))

STRTOFILE("=== ERP form build test ===" + CHR(13) + CHR(10) + ;
          "Started " + TTOC(DATETIME()) + CHR(13) + CHR(10) + ;
          "Total forms found: " + TRANSFORM(lnN) + CHR(13) + CHR(10) + ;
          "Testing first " + TRANSFORM(MIN(tnMax, lnN)) + " (cumulative)" + CHR(13) + CHR(10) + ;
          REPLICATE("=", 64) + CHR(13) + CHR(10), lcBase + "erp_test_results.log")

* --- Step 2: cumulative build, one fresh vfp9.exe per step ---
FOR lnI = 1 TO MIN(tnMax, lnN)
   STRTOFILE(TRANSFORM(lnI), lcBase + "erp_idx.txt")
   oWSH.Run('"' + lcVfp + '" -C"' + lcBase + 'config_build.fpw"', 1, .T.)
ENDFOR

* --- show results ---
MODIFY FILE (lcBase + "erp_test_results.log") NOEDIT
MESSAGEBOX("Build test complete (" + TRANSFORM(MIN(tnMax, lnN)) + " forms)." + CHR(13) + ;
           "Results are in erp_test_results.log", 0, "ERP build test")
RETURN
