LOCAL lcLog, lnForms, lcLow
lcLog = "E:\VFP\ERP_2\tools\erp_test_harness.log"
SET DEFAULT TO "E:\VFP\ERP_2"
STRTOFILE("COUNT " + TTOC(DATETIME()) + CHR(13)+CHR(10), lcLog, 1)
USE erp-test.pjx IN 0 SHARED ALIAS pjc
lnForms = 0
SCAN
	lcLow = LOWER(ALLTRIM(name))
	IF "forms" $ lcLow AND ".scx" $ lcLow
		lnForms = lnForms + 1
		STRTOFILE("  " + ALLTRIM(name) + CHR(13)+CHR(10), lcLog, 1)
	ENDIF
ENDSCAN
STRTOFILE("forms in erp-test.pjx=" + TRANSFORM(lnForms) + CHR(13)+CHR(10), lcLog, 1)
USE IN pjc
QUIT
