LOCAL lcRoot, lcPjx, lcPjt, lcLog, nErr
lcRoot = "E:\VFP\ERP_2\"
lcPjx = lcRoot + "ERP.PJX"
lcPjt = lcRoot + "ERP.PJT"
lcLog = lcRoot + "tools\verify_erp_project.log"
nErr = 0
SET DEFAULT TO (lcRoot)
CD (lcRoot)
STRTOFILE("Verify " + TTOC(DATETIME()) + CHR(13)+CHR(10), lcLog, .F.)
STRTOFILE("PJX " + TRANSFORM(FILE(lcPjx)) + " size " + TRANSFORM(FSIZE(lcPjx)) + CHR(13)+CHR(10), lcLog, .T.)
STRTOFILE("PJT " + TRANSFORM(FILE(lcPjt)) + " size " + TRANSFORM(FSIZE(lcPjt)) + CHR(13)+CHR(10), lcLog, .T.)
ON ERROR nErr = ERROR()
MODIFY PROJECT (lcPjx) NOWAIT NOSHOW NOPROJECTHOOK
IF nErr # 0
	STRTOFILE("FAIL MODIFY PROJECT err " + TRANSFORM(nErr) + CHR(13)+CHR(10), lcLog, .T.)
ELSE
	STRTOFILE("PASS MODIFY PROJECT opened" + CHR(13)+CHR(10), lcLog, .T.)
ENDIF
ON ERROR
FOR EACH lo IN _VFP.Projects FOXOBJECT
	lo.Close()
ENDFOR
QUIT
