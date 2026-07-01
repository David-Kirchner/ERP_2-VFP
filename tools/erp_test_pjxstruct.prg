LOCAL lcLog, i, lcSample
lcLog = "E:\VFP\ERP_2\tools\erp_test_harness.log"
SET DEFAULT TO "E:\VFP\ERP_2"
USE erp-test.pjx IN 0 SHARED
STRTOFILE("FIELDS:" + CHR(13)+CHR(10), lcLog, 1)
FOR i = 1 TO FCOUNT()
	STRTOFILE("  " + FIELD(i) + CHR(13)+CHR(10), lcLog, 1)
NEXT
GO TOP
lcSample = ALLTRIM(name)
STRTOFILE("sample name=[" + lcSample + "] len=" + TRANSFORM(LEN(name)) + CHR(13)+CHR(10), lcLog, 1)
USE IN erp-test.pjx
QUIT
