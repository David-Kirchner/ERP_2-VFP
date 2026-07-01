* Test COMPILE FORM sql_certs (active cert screen)
LOCAL lcLog, lnErr
lcLog = "E:\VFP\ERP_2\tools\compile_sql_certs.log"
SET DEFAULT TO "E:\VFP\ERP_2"
CD "E:\VFP\ERP_2"
lnErr = 0
STRTOFILE("COMPILE FORM sql_certs " + TTOC(DATETIME()) + CHR(13)+CHR(10), lcLog, .F.)
ON ERROR lnErr = ERROR()
COMPILE FORM Forms\sql_certs
ON ERROR
IF lnErr = 0
	STRTOFILE("PASS COMPILE FORM sql_certs" + CHR(13)+CHR(10), lcLog, 1)
	IF FILE("Forms\sql_certs.FXP")
		STRTOFILE("OK sql_certs.FXP created" + CHR(13)+CHR(10), lcLog, 1)
	ENDIF
ELSE
	STRTOFILE("FAIL error " + TRANSFORM(lnErr) + CHR(13)+CHR(10), lcLog, 1)
ENDIF
QUIT
