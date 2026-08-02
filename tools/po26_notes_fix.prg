* Apply printed-note fixes to purchaseorder26.frx
LOCAL lcFrx, lcLog, nInv, nMat, nSup, nLab
lcFrx = "E:\VFP\ERP_2\REPORTS\purchaseorder26.frx"
lcLog = "E:\VFP\ERP_2\TEMP\po26_notes_fix.log"
_SCREEN.Visible = .F.
IF TYPE("_VFP") = "O"
	_VFP.Visible = .F.
ENDIF
SET TALK OFF
SET SAFETY OFF
SET EXCLUSIVE ON
CLOSE ALL
SYS(2335, 0)
ON ERROR DO PoNotesErr
STRTOFILE("start "+TTOC(DATETIME())+CHR(13)+CHR(10), lcLog, .F.)

USE (lcFrx) EXCLUSIVE ALIAS fr
nInv = 0
nMat = 0
nSup = 0
nLab = 0

SCAN
	DO CASE
	CASE "ompanyReport_InvoiceSendLine" $ EXPR OR EXPR = ["ompanyReport_InvoiceSendLine("]
		REPLACE EXPR WITH [CompanyReport_InvoiceSendLine()]
		nInv = nInv + 1
	CASE "ompanyReport_MaterialCertSendLine" $ EXPR OR EXPR = ["ompanyReport_MaterialCertSendLine("]
		REPLACE EXPR WITH [CompanyReport_MaterialCertSendLine()]
		nMat = nMat + 1
	CASE ATC("Send Bill", EXPR) > 0 AND OBJTYPE = 5
		REPLACE EXPR WITH ["Bill to:"]
		IF !EMPTY(ALLTRIM(SUPEXPR))
			REPLACE SUPEXPR WITH ""
		ENDIF
		nLab = nLab + 1
	CASE (ATC([AddressField("BILL"], EXPR) > 0 OR ATC([CityStZip("BILL"], EXPR) > 0) ;
			AND ATC(["SHIP"], SUPEXPR) > 0
		REPLACE SUPEXPR WITH STRTRAN(SUPEXPR, ["SHIP"], ["BILL"])
		nSup = nSup + 1
	ENDCASE
ENDSCAN

STRTOFILE("inv="+TRANSFORM(nInv)+" mat="+TRANSFORM(nMat)+" supexpr="+TRANSFORM(nSup)+" label="+TRANSFORM(nLab)+CHR(13)+CHR(10), lcLog, 1)

GO TOP
SCAN FOR ATC("InvoiceSend", EXPR) > 0 OR ATC("MaterialCert", EXPR) > 0 ;
		OR ATC("Bill to", EXPR) > 0 OR ATC("Send Bill", EXPR) > 0 ;
		OR ATC([AddressField("BILL"], EXPR) > 0
	STRTOFILE("rec="+TRANSFORM(RECNO())+" ot="+TRANSFORM(OBJTYPE)+" expr=["+LEFT(CHRTRAN(EXPR,CHR(13)+CHR(10)," "),100)+"]"+ ;
		" sup=["+LEFT(CHRTRAN(EVL(SUPEXPR,""),CHR(13)+CHR(10)," "),60)+"]"+CHR(13)+CHR(10), lcLog, 1)
ENDSCAN

USE IN SELECT("fr")
SYS(2335, 1)
QUIT

PROCEDURE PoNotesErr
	STRTOFILE("ERR "+MESSAGE()+" L"+TRANSFORM(LINENO())+CHR(13)+CHR(10), ;
		"E:\VFP\ERP_2\TEMP\po26_notes_fix.log", 1)
	RETURN
