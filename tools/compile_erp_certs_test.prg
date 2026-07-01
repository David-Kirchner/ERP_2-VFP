* Test COMPILE FORM erp_certs after downsizing
LOCAL lcLog, lcErr
lcLog = "E:\VFP\ERP_2\tools\compile_erp_certs.log"
lcErr = ""
SET DEFAULT TO E:\VFP\ERP_2\
CD E:\VFP\ERP_2\
STRTOFILE("COMPILE FORM erp_certs " + TTOC(DATETIME()) + CHR(13)+CHR(10), lcLog, .F.)
ON ERROR lcErr = TRANSFORM(ERROR()) + " " + MESSAGE()
COMPILE FORM Forms\erp_certs
ON ERROR
IF EMPTY(lcErr)
	STRTOFILE("PASS COMPILE FORM erp_certs" + CHR(13)+CHR(10), lcLog, 1)
	IF FILE("Forms\erp_certs.FXP")
		STRTOFILE("OK erp_certs.FXP created" + CHR(13)+CHR(10), lcLog, 1)
	ENDIF
ELSE
	STRTOFILE("FAIL " + lcErr + CHR(13)+CHR(10), lcLog, 1)
ENDIF
QUIT
