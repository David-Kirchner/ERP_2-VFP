* Patch PurchaseOrder14 labels inside renamed FRX memo EXPR fields
LOCAL i, lcFile, nChanged, lcLog
lcLog = "E:\VFP\ERP_2\TEMP\po26_rename_expr.log"
_SCREEN.Visible = .F.
IF TYPE("_VFP") = "O"
	_VFP.Visible = .F.
ENDIF
SET TALK OFF
SET SAFETY OFF
SET EXCLUSIVE ON
SET DELETED ON
CLOSE ALL
SYS(2335, 0)
ON ERROR DO Po26Err

STRTOFILE("start "+TTOC(DATETIME())+CHR(13)+CHR(10), lcLog, .F.)

DIMENSION laF[4]
laF[1] = "E:\VFP\ERP_2\REPORTS\purchaseorder26.frx"
laF[2] = "E:\VFP\ERP_2\REPORTS\purchaseorder26nc.frx"
laF[3] = "E:\VFP\ERP_2\REPORTS\purchaseorder26_sheet.frx"
laF[4] = "E:\VFP\ERP_2\REPORTS\purchaseorder26_sheetnc.frx"

FOR i = 1 TO 4
	lcFile = laF[i]
	STRTOFILE("open "+JUSTFNAME(lcFile)+CHR(13)+CHR(10), lcLog, 1)
	IF !FILE(lcFile)
		STRTOFILE("MISS"+CHR(13)+CHR(10), lcLog, 1)
		LOOP
	ENDIF
	USE (lcFile) EXCLUSIVE ALIAS fr
	nChanged = 0
	SCAN FOR ("PurchaseOrder14" $ EXPR) OR ("purchaseorder14" $ LOWER(EXPR))
		REPLACE EXPR WITH STRTRAN(STRTRAN(EXPR, "PurchaseOrder14", "PurchaseOrder26"), "purchaseorder14", "purchaseorder26")
		nChanged = nChanged + 1
	ENDSCAN
	USE IN SELECT("fr")
	STRTOFILE("changed="+TRANSFORM(nChanged)+CHR(13)+CHR(10), lcLog, 1)
ENDFOR

USE ("E:\VFP\ERP_2\REPORTS\purchaseorder26.frx") SHARED NOUPDATE ALIAS frv
STRTOFILE("base_ok recs="+TRANSFORM(RECCOUNT("frv"))+CHR(13)+CHR(10), lcLog, 1)
USE IN SELECT("frv")
SYS(2335, 1)
QUIT

PROCEDURE Po26Err
	STRTOFILE("ERR "+MESSAGE()+" line "+TRANSFORM(LINENO())+" "+PROGRAM()+CHR(13)+CHR(10), ;
		"E:\VFP\ERP_2\TEMP\po26_rename_expr.log", 1)
	RETURN
