* BUILD erp_test.exe only (separate VFP session; may crash on exit)
LOCAL lcRoot, lcForm, lcLog, lcStart, lcApp, lcExe, lcErr, lnErr
LOCAL lcModeFile, laM[1]
lcRoot = "E:\VFP\ERP_2\"
lcLog  = lcRoot + "tools\erp_test_harness.log"
lcApp  = lcRoot + "erp_test.app"
lcExe  = lcRoot + "erp_test.exe"
lcErr  = lcRoot + "erp_test.err"
lcForm = ""
lcModeFile = lcRoot + "tools\erp_test_mode.txt"
SET DEFAULT TO (lcRoot)
CD (lcRoot)
_SCREEN.Visible = .F.
SET TALK OFF
SET SAFETY OFF
SYS(2335, 0)
CLOSE ALL
STRTOFILE(TRANSFORM(SECONDS()), lcRoot + "tools\erp_test_t0.txt", .F.)
IF FILE(lcModeFile)
	IF ALINES(laM, FILETOSTR(lcModeFile)) >= 2
		lcForm = ALLTRIM(laM[2])
	ENDIF
ENDIF
lcStart = DATETIME()
STRTOFILE("BUILD_ONE " + lcForm + " " + TTOC(lcStart) + CHR(13)+CHR(10), lcLog, 1)
IF FILE(lcApp)
	ERASE (lcApp)
ENDIF
IF FILE(lcExe)
	ERASE (lcExe)
ENDIF
IF FILE(lcErr)
	ERASE (lcErr)
ENDIF
lnErr = 0
ON ERROR lnErr = ERROR()
BUILD EXE erp_test FROM erp_test
ON ERROR
STRTOFILE("BUILD_ONE end err=" + TRANSFORM(lnErr) + CHR(13)+CHR(10), lcLog, 1)
IF TYPE("_VFP.ActiveProject") = "O"
	CLOSE PROJECT NOSAVE
ENDIF
QUIT
