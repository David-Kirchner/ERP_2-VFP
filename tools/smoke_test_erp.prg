* smoke_test_erp.prg - headless ERP smoke tests (no forms/event loop)
LOCAL lcRoot, i, nConn, cSQL, nRes, lcCap, lcPrg, lcErr, laAE[7]
LOCAL ARRAY laPrg[7]
PUBLIC LoginAppHome, gERPAppHome, lnPass, lnFail, lcLog, lcLastSmokeErr

lcRoot = "E:\VFP\ERP_2\"
lcLog = lcRoot + "tools\smoke_test_results.txt"
STRTOFILE("=== VFP headless smoke ===" + CHR(13) + CHR(10), lcLog, 1)
STRTOFILE("Started: " + TTOC(DATETIME()) + CHR(13) + CHR(10), lcLog, 1)

_SCREEN.Visible = .F.
IF TYPE("_VFP") = "O"
	_VFP.Visible = .F.
ENDIF
SET TALK OFF
SET SAFETY OFF
SET CENTURY ON
SET NOTIFY OFF
SET DEFAULT TO (lcRoot)
CD (lcRoot)

LoginAppHome = lcRoot
gERPAppHome  = lcRoot
lnPass = 0
lnFail = 0
lcLastSmokeErr = ""

SET PROCEDURE TO (lcRoot + "tools\smoke_test_lib.prg") ADDITIVE
ON ERROR DO SmokeErr WITH ERROR(), MESSAGE()

laPrg[1] = "PROGS\company_branding.prg"
laPrg[2] = "REPORTS\company_report.prg"
laPrg[3] = "PROGS\RecordError.prg"
laPrg[4] = "PROGS\load_ERP_Environment.prg"
laPrg[5] = "PROGS\load_CompanyProfile.prg"
laPrg[6] = "PROGS\CompanyProfile_maint.prg"
laPrg[7] = "PROGS\CompanyBranding_maint.prg"

FOR i = 1 TO ALEN(laPrg)
	lcPrg = laPrg[i]
	lcErr = ""
	lcLastSmokeErr = ""
	COMPILE (lcRoot + lcPrg)
	IF !EMPTY(lcLastSmokeErr)
		lcErr = lcLastSmokeErr
	ENDIF
	IF EMPTY(lcErr)
		= SmokeAdd("PASS", "COMPILE " + lcPrg, "")
	ELSE
		= SmokeAdd("FAIL", "COMPILE " + lcPrg, lcErr)
	ENDIF
ENDFOR

SET PROCEDURE TO (lcRoot + "PROGS\Proc_Setup.prg") ADDITIVE
SET PROCEDURE TO (lcRoot + "PROGS\Proc_SQL.prg") ADDITIVE
SET PROCEDURE TO (lcRoot + "PROGS\load_ERP_Environment.prg") ADDITIVE
SET PROCEDURE TO (lcRoot + "PROGS\load_CompanyProfile.prg") ADDITIVE
SET PROCEDURE TO (lcRoot + "REPORTS\company_report.prg") ADDITIVE
SET PROCEDURE TO (lcRoot + "PROGS\company_branding.prg") ADDITIVE
SET PROCEDURE TO (lcRoot + "PROGS\RecordError.prg") ADDITIVE
= SmokeAdd("PASS", "SET PROCEDURE core libs", "")

= load_ERP_Environment(.T.)
gGlobalDatabase = "ERP_2"
GlobalTable = "ERP_2"

nConn = SQLSTRINGCONNECT("Driver={SQL Server};Server="+gGlobalServer+";Database=ERP_2;Trusted_Connection=yes;", .T.)
IF nConn > 0
	= SmokeAdd("PASS", "SQL connect ERP_2", gGlobalServer)
ELSE
	=AERROR(laAE)
	= SmokeAdd("FAIL", "SQL connect ERP_2", laAE[2])
ENDIF

IF nConn > 0
	cSQL = "SELECT CASE WHEN OBJECT_DEFINITION(OBJECT_ID('dbo.Sales_Update')) LIKE '%dbo.Ar_Sales_History%' THEN 1 ELSE 0 END AS ok"
	nRes = SQLEXEC(nConn, cSQL, "tmpSmoke")
	IF nRes > 0 AND USED("tmpSmoke") AND tmpSmoke.ok = 1
		= SmokeAdd("PASS", "Sales_Update uses Ar_Sales_History", "")
	ELSE
		= SmokeAdd("FAIL", "Sales_Update uses Ar_Sales_History", "")
	ENDIF
	IF USED("tmpSmoke")
		USE IN tmpSmoke
	ENDIF

	cSQL = "SELECT COL_LENGTH('dbo.PriceTable','CWCnt') AS cwcol"
	nRes = SQLEXEC(nConn, cSQL, "tmpSmoke")
	IF nRes > 0 AND USED("tmpSmoke") AND (ISNULL(tmpSmoke.cwcol) OR tmpSmoke.cwcol = 0)
		= SmokeAdd("PASS", "PriceTable has no CWCnt column", "")
	ELSE
		= SmokeAdd("FAIL", "PriceTable has no CWCnt column", "")
	ENDIF
	IF USED("tmpSmoke")
		USE IN tmpSmoke
	ENDIF

	cSQL = "SELECT TOP 1 SP.ID "
	cSQL = cSQL + ",ISNULL(dbo.f_CC_CL_Cnt(SP.Alloy,SP.CC,SP.CL,SP.Thck),0) AS CWCnt "
	cSQL = cSQL + ",ISNULL(dbo.f_CC_CL_Start(SP.Alloy,SP.CC,SP.CL,SP.Thck),0) AS StartDia "
	cSQL = cSQL + " FROM dbo.Stock_Projected SP "
	nRes = SQLEXEC(nConn, cSQL, "tmpSmoke")
	IF nRes > 0
		= SmokeAdd("PASS", "InitProjStock CW function SQL", "")
	ELSE
		=AERROR(laAE)
		= SmokeAdd("FAIL", "InitProjStock CW function SQL", laAE[2])
	ENDIF
	IF USED("tmpSmoke")
		USE IN tmpSmoke
	ENDIF

	cSQL = "SELECT COUNT(*) AS n FROM sys.sql_modules m INNER JOIN sys.objects o ON m.object_id=o.object_id "
	cSQL = cSQL + "WHERE m.definition LIKE '%dbo.Ar.%' AND o.is_ms_shipped=0"
	nRes = SQLEXEC(nConn, cSQL, "tmpSmoke")
	IF nRes > 0 AND USED("tmpSmoke") AND tmpSmoke.n = 0
		= SmokeAdd("PASS", "No dbo.Ar. in SQL modules", "")
	ELSE
		= SmokeAdd("FAIL", "No dbo.Ar. in SQL modules", IIF(USED("tmpSmoke"), TRANSFORM(tmpSmoke.n), "?"))
	ENDIF
	IF USED("tmpSmoke")
		USE IN tmpSmoke
	ENDIF

	SQLDISCONNECT(nConn)
ENDIF

lcCap = SetERPAppCaption()
IF VARTYPE(lcCap) = "C" AND !EMPTY(lcCap)
	= SmokeAdd("PASS", "SetERPAppCaption()", lcCap)
ELSE
	= SmokeAdd("FAIL", "SetERPAppCaption()", "empty")
ENDIF

IF TYPE("goCompany") = "O"
	= SmokeAdd("PASS", "goCompany already loaded", "")
ELSE
	= SmokeAdd("SKIP", "load_CompanyProfile", "headless - run manually in ERP")
ENDIF

STRTOFILE(REPLICATE("-", 60) + CHR(13) + CHR(10), lcLog, 1)
STRTOFILE("PASS: " + TRANSFORM(lnPass) + "  FAIL: " + TRANSFORM(lnFail) + CHR(13) + CHR(10), lcLog, 1)
STRTOFILE("Finished: " + TTOC(DATETIME()) + CHR(13) + CHR(10), lcLog, 1)

ON ERROR
QUIT
