* Replace hardcoded FM literal with CompanyReport_IsoDoc("PurchaseOrder26")
LOCAL lcFrx, lcLog, nChg, lcStem
lcLog = "E:\VFP\ERP_2\TEMP\po26_iso_wire.log"
_SCREEN.Visible = .F.
SET TALK OFF
SET SAFETY OFF
SET EXCLUSIVE ON
CLOSE ALL
SYS(2335, 0)
ON ERROR DO IsoWireErr
STRTOFILE("start"+CHR(13)+CHR(10), lcLog, .F.)

DIMENSION laF[4]
laF[1] = "E:\VFP\ERP_2\REPORTS\purchaseorder26.frx"
laF[2] = "E:\VFP\ERP_2\REPORTS\purchaseorder26nc.frx"
laF[3] = "E:\VFP\ERP_2\REPORTS\purchaseorder26_sheet.frx"
laF[4] = "E:\VFP\ERP_2\REPORTS\purchaseorder26_sheetnc.frx"

FOR i = 1 TO 4
	IF !FILE(laF[i])
		STRTOFILE("MISS "+laF[i]+CHR(13)+CHR(10), lcLog, 1)
		LOOP
	ENDIF
	lcStem = JUSTSTEM(laF[i])
	* Keep report key Pascal-ish for IsoDocument seeds
	DO CASE
	CASE LOWER(lcStem) = "purchaseorder26"
		lcStem = "PurchaseOrder26"
	CASE LOWER(lcStem) = "purchaseorder26nc"
		lcStem = "PurchaseOrder26nc"
	CASE LOWER(lcStem) = "purchaseorder26_sheet"
		lcStem = "PurchaseOrder26_sheet"
	CASE LOWER(lcStem) = "purchaseorder26_sheetnc"
		lcStem = "PurchaseOrder26_sheetnc"
	ENDCASE
	USE (laF[i]) EXCLUSIVE ALIAS fr
	nChg = 0
	SCAN FOR "FM-74-04-01" $ EXPR
		REPLACE EXPR WITH [CompanyReport_IsoDoc("] + lcStem + [")]
		nChg = nChg + 1
	ENDSCAN
	USE IN fr
	STRTOFILE(JUSTFNAME(laF[i])+" chg="+TRANSFORM(nChg)+" key="+lcStem+CHR(13)+CHR(10), lcLog, 1)
ENDFOR
QUIT

PROCEDURE IsoWireErr
	STRTOFILE("ERR "+MESSAGE()+CHR(13)+CHR(10), "E:\VFP\ERP_2\TEMP\po26_iso_wire.log", 1)
	RETURN
