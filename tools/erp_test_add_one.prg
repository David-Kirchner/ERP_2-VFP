* Add one form to erp_test.pjx (no BUILD - avoids crash before bat can continue)
LOCAL lcRoot, lcForm, lcLog, lcModeFile, laM[1]
lcRoot = "E:\VFP\ERP_2\"
lcLog  = lcRoot + "tools\erp_test_harness.log"
lcModeFile = lcRoot + "tools\erp_test_mode.txt"
lcForm = ""
SET DEFAULT TO (lcRoot)
CD (lcRoot)
_SCREEN.Visible = .F.
SET TALK OFF
SET SAFETY OFF
SYS(2335, 0)
CLOSE ALL
IF FILE(lcModeFile)
	IF ALINES(laM, FILETOSTR(lcModeFile)) >= 2
		lcForm = ALLTRIM(laM[2])
	ENDIF
ENDIF
IF EMPTY(lcForm)
	STRTOFILE("ADD_ONE FAIL no form" + CHR(13)+CHR(10), lcLog, 1)
	QUIT
ENDIF
DO (lcRoot + "tools\erp_test_harness.prg") WITH "PREP", lcForm
QUIT
