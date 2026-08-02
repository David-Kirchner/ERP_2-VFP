_SCREEN.Visible=.F.
SET TALK OFF
SET SAFETY OFF
SET EXCLUSIVE ON
USE E:\VFP\ERP_2\REPORTS\purchaseorder26_sheet.frx EXCLUSIVE
REPLACE EXPR WITH [CompanyReport_IsoDoc("PurchaseOrder26_sheet")] FOR "FM-74-04-03" $ EXPR
n1=_TALLY
USE
USE E:\VFP\ERP_2\REPORTS\purchaseorder26_sheetnc.frx EXCLUSIVE
REPLACE EXPR WITH [CompanyReport_IsoDoc("PurchaseOrder26_sheetnc")] FOR "FM-74-04-03" $ EXPR
n2=_TALLY
USE
STRTOFILE("sheet="+TRANSFORM(n1)+" sheetnc="+TRANSFORM(n2)+CHR(13)+CHR(10),"E:\VFP\ERP_2\TEMP\po26_iso_wire.log",1)
QUIT
