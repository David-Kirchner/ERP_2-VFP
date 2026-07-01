* Launcher - reads tools\erp_test_mode.txt; harness is in same folder as this PRG
LOCAL lcMode, lcForm, lcModeFile, lcHarness, lcRoot, laM[1]
lcRoot = "E:\VFP\ERP_2\"
lcModeFile = lcRoot + "tools\erp_test_mode.txt"
lcHarness = JUSTPATH(SYS(16)) + "\erp_test_harness.prg"
IF !FILE(lcHarness)
	lcHarness = lcRoot + "tools\erp_test_harness.prg"
ENDIF
lcMode = "INIT"
lcForm = ""
SET DEFAULT TO (lcRoot)
CD (lcRoot)
IF FILE(lcModeFile)
	IF ALINES(laM, FILETOSTR(lcModeFile)) >= 1
		lcMode = ALLTRIM(laM[1])
	ENDIF
	IF ALINES(laM, FILETOSTR(lcModeFile)) >= 2
		lcForm = ALLTRIM(laM[2])
	ENDIF
ENDIF
DO (lcHarness) WITH lcMode, lcForm
