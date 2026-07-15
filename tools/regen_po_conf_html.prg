* Headless: regenerate MEM\PO_Conf.HTML via CreateHTML_VendorPOConf
* Usage: vfp9.exe -cNULL E:\VFP\ERP_2\tools\regen_po_conf_html.prg [HPAPO]
PARAMETERS tnHpaPo
LOCAL lcRoot, lcLog, nConn, nPo, lcHtml

lcRoot = "E:\VFP\ERP_2\"
lcLog = lcRoot + "TEMP\regen_po_conf_html.log"
nPo = IIF(VARTYPE(tnHpaPo) = "N" AND tnHpaPo > 0, tnHpaPo, 1000)

SET DEFAULT TO (lcRoot)
CD (lcRoot)
_SCREEN.Visible = .F.
IF TYPE("_VFP") = "O"
	_VFP.Visible = .F.
ENDIF
SET TALK OFF
SET SAFETY OFF
SET ESCAPE OFF
SET DELETED ON
CLOSE ALL
SYS(2335, 0)
ON ERROR DO RegenPoConfErr

SET PATH TO (lcRoot + "PROGS;" + lcRoot + "REPORTS;" + lcRoot + "LIBS;" + lcRoot + "MEM") ADDITIVE
* Compile + load the same procedure libs main.prg uses for PO email
COMPILE (lcRoot + "PROGS\proc_setup.prg")
COMPILE (lcRoot + "PROGS\proc_sql.prg")
COMPILE (lcRoot + "PROGS\proc_quotes.prg")
SET PROCEDURE TO (lcRoot + "PROGS\proc_setup.prg") ADDITIVE
SET PROCEDURE TO (lcRoot + "PROGS\proc_sql.prg") ADDITIVE
SET PROCEDURE TO (lcRoot + "PROGS\proc_stocklst.prg") ADDITIVE
SET PROCEDURE TO (lcRoot + "PROGS\proc_quotes.prg") ADDITIVE
SET PROCEDURE TO (lcRoot + "PROGS\company_branding.prg") ADDITIVE
SET PROCEDURE TO (lcRoot + "REPORTS\company_report.prg") ADDITIVE
SET PROCEDURE TO (lcRoot + "PROGS\load_CompanyProfile.prg") ADDITIVE

PUBLIC gSkipPoConfHtmlNav
gSkipPoConfHtmlNav = .T.
PUBLIC gERPAppHome
gERPAppHome = lcRoot

STRTOFILE("START " + TTOC(DATETIME()) + " PO=" + TRANSFORM(nPo) + CHR(13)+CHR(10), lcLog, .F.)

nConn = get_SQLSTRINGCONNECT()
STRTOFILE("CONN=" + TRANSFORM(nConn) + CHR(13)+CHR(10), lcLog, 1)
IF nConn < 1
	STRTOFILE("FAIL no SQL" + CHR(13)+CHR(10), lcLog, 1)
	DO RegenPoConfQuit
ENDIF

= load_CompanyProfile(.T.)
STRTOFILE("LOGO=" + LEFT(CompanyBranding_ReportLogoHtmlImg(69), 80) + "..." + CHR(13)+CHR(10), lcLog, 1)
STRTOFILE("SHIP=" + STRTRAN(CompanyReport_HtmlAddrBlock("SHIP"), [<br />], "|") + CHR(13)+CHR(10), lcLog, 1)
STRTOFILE("BILL=" + STRTRAN(CompanyReport_HtmlAddrBlock("BILL"), [<br />], "|") + CHR(13)+CHR(10), lcLog, 1)
STRTOFILE("PHONE=" + CompanyReport_PoHeaderPhone() + CHR(13)+CHR(10), lcLog, 1)
STRTOFILE("EMAIL=" + CompanyReport_PoHeaderEmail() + CHR(13)+CHR(10), lcLog, 1)

* Re-assert procedure libs immediately before HTML build
SET PROCEDURE TO (lcRoot + "PROGS\proc_setup.prg") ADDITIVE
SET PROCEDURE TO (lcRoot + "PROGS\proc_sql.prg") ADDITIVE
SET PROCEDURE TO (lcRoot + "PROGS\proc_stocklst.prg") ADDITIVE
SET PROCEDURE TO (lcRoot + "PROGS\proc_quotes.prg") ADDITIVE
SET PROCEDURE TO (lcRoot + "PROGS\company_branding.prg") ADDITIVE
SET PROCEDURE TO (lcRoot + "REPORTS\company_report.prg") ADDITIVE
STRTOFILE("PROCS="+LEFT(SET("PROCEDURE"), 240) + CHR(13)+CHR(10), lcLog, 1)
TRY
	STRTOFILE("PrepareSQLnum="+TRANSFORM(PrepareSQLnum(0,"SalesNum",-3)) + CHR(13)+CHR(10), lcLog, 1)
CATCH TO oE
	STRTOFILE("PrepareSQLnum FAIL "+oE.Message + CHR(13)+CHR(10), lcLog, 1)
ENDTRY

= CreateHTML_VendorPOConf(nPo, nConn)
STRTOFILE("DONE html=" + IIF(FILE(lcRoot + "MEM\PO_Conf.HTML"), "yes", "no") + ;
	" bytes=" + TRANSFORM(IIF(FILE(lcRoot + "MEM\PO_Conf.HTML"), FSIZE(lcRoot + "MEM\PO_Conf.HTML"), 0)) + ;
	CHR(13)+CHR(10), lcLog, 1)

SQLDISCONNECT(nConn)
DO RegenPoConfQuit
RETURN

PROCEDURE RegenPoConfErr
	STRTOFILE("ERR " + MESSAGE() + " @" + PROGRAM() + " L" + TRANSFORM(LINENO()) + CHR(13)+CHR(10), ;
		"E:\VFP\ERP_2\TEMP\regen_po_conf_html.log", 1)
	RETURN

PROCEDURE RegenPoConfQuit
	SYS(2335, 1)
	QUIT
	RETURN
