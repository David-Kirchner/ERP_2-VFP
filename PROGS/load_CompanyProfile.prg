*====================================================================
* load_CompanyProfile.prg — load dbo.CompanyProfile into goCompany
*====================================================================

LPARAMETERS tlForceReload

IF VARTYPE(tlForceReload) # "L"
	tlForceReload = .F.
ENDIF

IF VARTYPE(goCompany) = "O" AND !tlForceReload
	RETURN .T.
ENDIF

LOCAL nConn, nRet, lcSQL, i, laFld[1], lcFld

nConn = get_SQLSTRINGCONNECT()
IF nConn < 1
	RETURN .F.
ENDIF

lcSQL = "SELECT TOP 1 * FROM dbo.CompanyProfile WITH (NOLOCK) WHERE CompanyId = 1"
nRet = SQLEXEC(nConn, lcSQL, "curCompany")
IF nRet < 1
	SQLDISCONNECT(nConn)
	IF MESSAGEBOX("CompanyProfile table missing or empty. Run MEM\SQL\Config scripts in SSMS.", 48+4, "Company Profile") = 6
		* continue without goCompany
	ENDIF
	RETURN .F.
ENDIF

IF !USED("curCompany") OR RECCOUNT("curCompany") < 1
	SQLDISCONNECT(nConn)
	RETURN .F.
ENDIF

PUBLIC goCompany
goCompany = CREATEOBJECT("Empty")
SELECT curCompany
= AFIELDS(laFld, "curCompany")
FOR i = 1 TO ALEN(laFld, 1)
	lcFld = laFld[i, 1]
	ADDPROPERTY(goCompany, lcFld, EVALUATE("curCompany." + lcFld))
ENDFOR
USE IN curCompany
SQLDISCONNECT(nConn)

RETURN .T.
