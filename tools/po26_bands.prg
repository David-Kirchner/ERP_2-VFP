* Diagnose bands / ACK / footer placement on purchaseorder26.frx
LOCAL lcFrx, lcLog, lcBand
lcFrx = "E:\VFP\ERP_2\REPORTS\purchaseorder26.frx"
lcLog = "E:\VFP\ERP_2\TEMP\po26_bands.log"
_SCREEN.Visible = .F.
SET TALK OFF
SET SAFETY OFF
CLOSE ALL
SYS(2335, 0)
STRTOFILE("bands"+CHR(13)+CHR(10), lcLog, .F.)
USE (lcFrx) SHARED NOUPDATE ALIAS fr
SCAN FOR OBJTYPE = 9
	* Band: OBJCODE 0=title 1=page header 3=col hdr 4=detail 5=group hdr? 6=group foot 7=page foot 8=summary
	STRTOFILE("BAND rec="+TRANSFORM(RECNO())+" objcode="+TRANSFORM(OBJCODE)+" height="+TRANSFORM(HEIGHT)+ ;
		" pagebreak="+TRANSFORM(PAGEBREAK)+" colbreak="+TRANSFORM(COLBREAK)+CHR(13)+CHR(10), lcLog, 1)
ENDSCAN
GO TOP
SCAN FOR ATC("ACKNOWLEDGE", EXPR) > 0 OR ATC("InvoiceSend", EXPR) > 0 OR ATC("MaterialCert", EXPR) > 0 ;
		OR ATC("Pack to fully", EXPR) > 0 OR ATC("insures", EXPR) > 0 OR ATC("Department of Energy", EXPR) > 0 ;
		OR ATC("OUR PURCHASE", EXPR) > 0 OR ATC("on-site", LOWER(EXPR)) > 0
	STRTOFILE("OBJ rec="+TRANSFORM(RECNO())+" ot="+TRANSFORM(OBJTYPE)+" vpos="+TRANSFORM(VPOS)+ ;
		" h="+TRANSFORM(HEIGHT)+" float="+TRANSFORM(FLOAT)+" stretch="+TRANSFORM(STRETCH)+ ;
		" top="+TRANSFORM(TOP)+" bottom="+TRANSFORM(BOTTOM)+ ;
		" expr=["+LEFT(CHRTRAN(EXPR,CHR(13)+CHR(10)," "),70)+"]"+CHR(13)+CHR(10), lcLog, 1)
ENDSCAN
USE IN fr
QUIT
