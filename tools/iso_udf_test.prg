_SCREEN.Visible=.F.
SET DEFAULT TO E:\VFP\ERP_2
SET PROCEDURE TO PROGS\proc_setup ADDITIVE
SET PROCEDURE TO REPORTS\company_report ADDITIVE
PUBLIC gERPAppHome
gERPAppHome="E:\VFP\ERP_2\"
STRTOFILE("iso=["+CompanyReport_IsoDoc("PurchaseOrder26")+"]"+CHR(13)+CHR(10),"E:\VFP\ERP_2\TEMP\iso_udf_test.log")
QUIT
