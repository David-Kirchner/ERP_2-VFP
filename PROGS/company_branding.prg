*====================================================================
* company_branding.prg — Company logo + icon cache (ERP)
*
* Logo source: dbo.CompanyProfile.LogoImage (cached to MEM\company_logo.*)
* Icon source: dbo.CompanyProfile.IconImage (cached to MEM\Company_Icon.ico)
* Reports:    CompanyReport_Bmp() -> MEM\Company_BMP.bmp (upload via Company Profile)
*             FRX picture: graphics\erphead.bmp (synced from MEM cache on upload)
* Forms/ERP:  GetCompanyIconPath() -> MEM\Company_Icon.ico (default ICO\EARTH.ICO)
*
* DO InitCompanyBranding   && called from main.prg after load_CompanyProfile
*====================================================================

#DEFINE BRANDING_LOGO_DIR        "MEM"
#DEFINE BRANDING_LOGO_BASENAME   "company_logo"
#DEFINE BRANDING_ICON_FILENAME   "Company_Icon.ico"
#DEFINE BRANDING_FALLBACK_JPG    "graphics\spacealloysusa-logo-nbhrz.jpg"
#DEFINE BRANDING_FALLBACK_JPG2   "graphics\spacealloysusa-logo-nb.jpg"
#DEFINE BRANDING_FALLBACK_ICON   "ICO\EARTH.ICO"
#DEFINE BRANDING_COMPANY_BMP     "Company_BMP.bmp"
#DEFINE BRANDING_GRAPHICS_ICON   "graphics\earth.ico"
#DEFINE BRANDING_GRAPHICS_BMP    "graphics\erphead.bmp"

PUBLIC gCompanyLogoPath
PUBLIC gCompanyIconPath
PUBLIC gCompanyReportBmpPath

gCompanyLogoPath = ""
gCompanyIconPath = ""
gCompanyReportBmpPath = ""

*--------------------------------------------------------------------
FUNCTION CompanyBranding_EnsurePublic
	IF VARTYPE(gCompanyLogoPath) # "C"
		PUBLIC gCompanyLogoPath
		gCompanyLogoPath = ""
	ENDIF
	RETURN

*--------------------------------------------------------------------
FUNCTION CompanyBranding_EnsureIconPublic
	IF VARTYPE(gCompanyIconPath) # "C"
		PUBLIC gCompanyIconPath
		gCompanyIconPath = ""
	ENDIF
	RETURN

*--------------------------------------------------------------------
FUNCTION CompanyBranding_EnsureReportBmpPublic
	IF VARTYPE(gCompanyReportBmpPath) # "C"
		PUBLIC gCompanyReportBmpPath
		gCompanyReportBmpPath = ""
	ENDIF
	RETURN

*--------------------------------------------------------------------
FUNCTION CompanyBranding_AppHome
	RETURN ADDBS(IIF(VARTYPE(gERPAppHome) = "C" AND !EMPTY(gERPAppHome), gERPAppHome, ;
		IIF(VARTYPE(LoginAppHome) = "C" AND !EMPTY(LoginAppHome), LoginAppHome, SYS(5) + SYS(2003))))

*--------------------------------------------------------------------
FUNCTION InitCompanyBranding
	LOCAL llOkLogo, llOkIcon, llOkReport

	= CompanyBranding_EnsurePublic()
	= CompanyBranding_EnsureIconPublic()
	= CompanyBranding_EnsureReportBmpPublic()
	llOkLogo = CacheCompanyLogoFile()
	gCompanyLogoPath = GetCompanyLogoPath()
	llOkReport = CacheCompanyReportBmpFile()
	gCompanyReportBmpPath = GetCompanyReportBmpPath()
	llOkIcon = CacheCompanyIconFile()
	= CompanyBranding_EnsureDefaultIcon()
	gCompanyIconPath = GetCompanyIconPath()
	= SetERPAppCaption()
	RETURN (llOkLogo OR llOkIcon OR llOkReport OR !EMPTY(gCompanyIconPath))

*--------------------------------------------------------------------
FUNCTION SetERPAppCaption
	LPARAMETERS tcShortName
	LOCAL lcTitle, lcShort

	lcShort = ""
	IF VARTYPE(tcShortName) = "C"
		lcShort = ALLTRIM(tcShortName)
	ENDIF
	IF EMPTY(lcShort)
		IF TYPE("CompanyReport_ShortName") = "F"
			lcShort = CompanyReport_ShortName()
		ENDIF
		IF EMPTY(lcShort) AND VARTYPE(goCompany) = "O" AND PEMSTATUS(goCompany, "ShortName", 5)
			lcShort = ALLTRIM(goCompany.ShortName)
		ENDIF
	ENDIF
	IF EMPTY(lcShort) AND TYPE("CompanyReport_LegalName") = "F"
		lcShort = CompanyReport_LegalName()
	ENDIF
	lcTitle = EVL(lcShort, "ERP")
	IF VARTYPE(gGlobalServer) = "C" AND !EMPTY(gGlobalServer)
		lcTitle = lcTitle + " [" + ALLTRIM(gGlobalServer)
		IF VARTYPE(gGlobalDatabase) = "C" AND !EMPTY(gGlobalDatabase)
			lcTitle = lcTitle + " / " + ALLTRIM(gGlobalDatabase)
		ENDIF
		lcTitle = lcTitle + "]"
	ENDIF
	_SCREEN.Caption = lcTitle
	RETURN lcTitle

*--------------------------------------------------------------------
FUNCTION CacheCompanyLogoFile
	LPARAMETERS tnConnHandle, tlForce

	LOCAL lcRoot, lcDir, lcExt, lcPath, lcMime, lcSQL, nRet, nConn, llOwn
	LOCAL xData

	= CompanyBranding_EnsurePublic()
	IF VARTYPE(tlForce) # "L"
		tlForce = .F.
	ENDIF

	lcRoot = CompanyBranding_AppHome()
	lcDir  = lcRoot + BRANDING_LOGO_DIR
	IF !DIRECTORY(lcDir)
		MKDIR (lcDir)
	ENDIF

	*--- Prefer blob already on goCompany
	IF !tlForce AND VARTYPE(goCompany) = "O" AND PEMSTATUS(goCompany, "LogoImage", 5)
		xData = goCompany.LogoImage
		lcMime = IIF(PEMSTATUS(goCompany, "LogoMime", 5), TRANSFORM(goCompany.LogoMime), "")
		IF !EMPTY(xData)
			lcExt  = CompanyBranding_MimeToExt(lcMime)
			lcPath = lcDir + "\" + BRANDING_LOGO_BASENAME + lcExt
			= CompanyBranding_WriteBlob(xData, lcPath)
			gCompanyLogoPath = lcPath
			RETURN .T.
		ENDIF
	ENDIF

	*--- Load from SQL
	llOwn = .F.
	nConn = tnConnHandle
	IF VARTYPE(nConn) # "N" OR nConn < 1
		nConn = get_SQLSTRINGCONNECT()
		llOwn = (nConn > 0)
	ENDIF
	IF nConn < 1
		RETURN .F.
	ENDIF

	CURSORSETPROP("MapBinary", .T., 0)
	lcSQL = "SELECT LogoImage, LogoMime FROM dbo.CompanyProfile WITH (NOLOCK) WHERE CompanyId = 1"
	nRet = SQLEXEC(nConn, lcSQL, "curCoLogo")
	IF nRet < 1 OR !USED("curCoLogo") OR RECCOUNT("curCoLogo") < 1
		IF llOwn
			SQLDISCONNECT(nConn)
		ENDIF
		RETURN .F.
	ENDIF

	SELECT curCoLogo
	xData  = curCoLogo.LogoImage
	lcMime = TRANSFORM(curCoLogo.LogoMime)
	USE IN curCoLogo
	IF llOwn
		SQLDISCONNECT(nConn)
	ENDIF

	IF EMPTY(xData)
		RETURN .F.
	ENDIF

	lcExt  = CompanyBranding_MimeToExt(lcMime)
	lcPath = lcDir + "\" + BRANDING_LOGO_BASENAME + lcExt
	= CompanyBranding_WriteBlob(xData, lcPath)
	gCompanyLogoPath = lcPath
	RETURN .T.

*--------------------------------------------------------------------
FUNCTION GetCompanyLogoPath
	LOCAL lcRoot, lcPath, lcExt, laExt[4], i

	= CompanyBranding_EnsurePublic()
	IF !EMPTY(gCompanyLogoPath) AND FILE(gCompanyLogoPath)
		RETURN gCompanyLogoPath
	ENDIF

	lcRoot = CompanyBranding_AppHome()
	laExt[1] = ".jpg"
	laExt[2] = ".png"
	laExt[3] = ".gif"
	laExt[4] = ".bmp"
	FOR i = 1 TO ALEN(laExt)
		lcPath = lcRoot + BRANDING_LOGO_DIR + "\" + BRANDING_LOGO_BASENAME + laExt[i]
		IF FILE(lcPath)
			gCompanyLogoPath = lcPath
			RETURN lcPath
		ENDIF
	ENDFOR

	lcPath = lcRoot + BRANDING_FALLBACK_JPG
	IF FILE(lcPath)
		RETURN lcPath
	ENDIF
	lcPath = lcRoot + BRANDING_FALLBACK_JPG2
	IF FILE(lcPath)
		RETURN lcPath
	ENDIF

	RETURN ""

*--------------------------------------------------------------------
FUNCTION CompanyBranding_SaveLogoFile
	LPARAMETERS tcSourceFile, tnConnHandle

	LOCAL nConn, llOwn, nRet, lcMime, lcSQL, lcExt
	LOCAL xBlob

	= CompanyBranding_EnsurePublic()
	IF EMPTY(tcSourceFile) OR !FILE(tcSourceFile)
		RETURN .F.
	ENDIF

	xBlob = CREATEBINARY(FILETOSTR(tcSourceFile))
	lcMime = CompanyBranding_ExtToMime(JUSTEXT(tcSourceFile))
	nConn = tnConnHandle
	llOwn = .F.
	IF VARTYPE(nConn) # "N" OR nConn < 1
		nConn = get_SQLSTRINGCONNECT()
		llOwn = (nConn > 0)
	ENDIF
	IF nConn < 1
		RETURN .F.
	ENDIF

	lcSQL = "UPDATE dbo.CompanyProfile SET LogoImage = ?xBlob, LogoMime = ?lcMime, ModifiedDate = SYSDATETIME() WHERE CompanyId = 1"
	nRet = SQLEXEC(nConn, lcSQL)
	IF nRet < 1
		IF llOwn
			SQLDISCONNECT(nConn)
		ENDIF
		RETURN .F.
	ENDIF

	IF llOwn
		SQLDISCONNECT(nConn)
	ENDIF

	IF FILE("PROGS\load_CompanyProfile.prg")
		DO load_CompanyProfile WITH .T.
	ENDIF
	= CacheCompanyLogoFile(nConn, .T.)
	gCompanyLogoPath = GetCompanyLogoPath()
	RETURN .T.

*--------------------------------------------------------------------
FUNCTION CompanyBranding_ClearLogo
	LPARAMETERS tnConnHandle

	LOCAL nConn, llOwn, nRet, lcSQL, lcRoot, i, laExt[4], lcPath

	= CompanyBranding_EnsurePublic()
	nConn = tnConnHandle
	llOwn = .F.
	IF VARTYPE(nConn) # "N" OR nConn < 1
		nConn = get_SQLSTRINGCONNECT()
		llOwn = (nConn > 0)
	ENDIF
	IF nConn < 1
		RETURN .F.
	ENDIF

	lcSQL = "UPDATE dbo.CompanyProfile SET LogoImage = NULL, LogoMime = NULL, ModifiedDate = SYSDATETIME() WHERE CompanyId = 1"
	nRet = SQLEXEC(nConn, lcSQL)
	IF llOwn
		SQLDISCONNECT(nConn)
	ENDIF

	lcRoot = CompanyBranding_AppHome()
	laExt[1] = ".jpg"
	laExt[2] = ".png"
	laExt[3] = ".gif"
	laExt[4] = ".bmp"
	FOR i = 1 TO ALEN(laExt)
		lcPath = lcRoot + BRANDING_LOGO_DIR + "\" + BRANDING_LOGO_BASENAME + laExt[i]
		IF FILE(lcPath)
			DELETE FILE (lcPath)
		ENDIF
	ENDFOR

	gCompanyLogoPath = ""
	IF FILE("PROGS\load_CompanyProfile.prg")
		DO load_CompanyProfile WITH .T.
	ENDIF
	RETURN (nRet > 0)

*--------------------------------------------------------------------
FUNCTION CompanyBranding_MimeToExt
	LPARAMETERS tcMime
	LOCAL lc

	lc = LOWER(ALLTRIM(EVL(tcMime, "")))
	DO CASE
		CASE "png" $ lc
			RETURN ".png"
		CASE "gif" $ lc
			RETURN ".gif"
		CASE "bmp" $ lc
			RETURN ".bmp"
		CASE "icon" $ lc OR "ico" $ lc
			RETURN ".ico"
		OTHERWISE
			RETURN ".jpg"
	ENDCASE

*--------------------------------------------------------------------
FUNCTION CompanyBranding_ExtToMime
	LPARAMETERS tcExt
	LOCAL lc

	lc = LOWER(ALLTRIM(EVL(tcExt, "")))
	DO CASE
		CASE lc == "png"
			RETURN "image/png"
		CASE lc == "gif"
			RETURN "image/gif"
		CASE lc == "bmp"
			RETURN "image/bmp"
		CASE lc == "ico"
			RETURN "image/x-icon"
		OTHERWISE
			RETURN "image/jpeg"
	ENDCASE

*--------------------------------------------------------------------
FUNCTION CompanyBranding_WriteBlob
	LPARAMETERS xData, tcPath

	LOCAL nH

	IF EMPTY(xData) OR EMPTY(tcPath)
		RETURN .F.
	ENDIF

	DO CASE
		CASE TYPE("xData") = "M"
			STRTOFILE(xData, tcPath, 0)
			RETURN FILE(tcPath)
		CASE TYPE("xData") = "C"
			STRTOFILE(xData, tcPath, 0)
			RETURN FILE(tcPath)
		CASE TYPE("xData") = "Q"
			nH = FCREATE(tcPath)
			IF nH < 0
				RETURN .F.
			ENDIF
			FWRITE(nH, xData)
			FCLOSE(nH)
			RETURN FILE(tcPath)
		OTHERWISE
			RETURN .F.
	ENDCASE

*--------------------------------------------------------------------
FUNCTION CacheCompanyIconFile
	LPARAMETERS tnConnHandle, tlForce

	LOCAL lcRoot, lcDir, lcPath, lcMime, lcSQL, nRet, nConn, llOwn
	LOCAL xData

	= CompanyBranding_EnsureIconPublic()
	IF VARTYPE(tlForce) # "L"
		tlForce = .F.
	ENDIF

	lcRoot = CompanyBranding_AppHome()
	lcDir  = lcRoot + BRANDING_LOGO_DIR
	IF !DIRECTORY(lcDir)
		MKDIR (lcDir)
	ENDIF
	lcPath = lcDir + "\" + BRANDING_ICON_FILENAME

	IF !tlForce AND VARTYPE(goCompany) = "O" AND PEMSTATUS(goCompany, "IconImage", 5)
		xData = goCompany.IconImage
		lcMime = IIF(PEMSTATUS(goCompany, "IconMime", 5), TRANSFORM(goCompany.IconMime), "")
		IF !EMPTY(xData)
			= CompanyBranding_WriteBlob(xData, lcPath)
			gCompanyIconPath = lcPath
			= CompanyBranding_SyncGraphicsIcon(lcPath)
			RETURN .T.
		ENDIF
	ENDIF

	llOwn = .F.
	nConn = tnConnHandle
	IF VARTYPE(nConn) # "N" OR nConn < 1
		nConn = get_SQLSTRINGCONNECT()
		llOwn = (nConn > 0)
	ENDIF
	IF nConn < 1
		RETURN .F.
	ENDIF

	CURSORSETPROP("MapBinary", .T., 0)
	lcSQL = "SELECT IconImage, IconMime FROM dbo.CompanyProfile WITH (NOLOCK) WHERE CompanyId = 1"
	nRet = SQLEXEC(nConn, lcSQL, "curCoIcon")
	IF nRet < 1 OR !USED("curCoIcon") OR RECCOUNT("curCoIcon") < 1
		IF llOwn
			SQLDISCONNECT(nConn)
		ENDIF
		RETURN .F.
	ENDIF

	SELECT curCoIcon
	xData  = curCoIcon.IconImage
	lcMime = TRANSFORM(curCoIcon.IconMime)
	USE IN curCoIcon
	IF llOwn
		SQLDISCONNECT(nConn)
	ENDIF

	IF EMPTY(xData)
		RETURN .F.
	ENDIF

	= CompanyBranding_WriteBlob(xData, lcPath)
	gCompanyIconPath = lcPath
	= CompanyBranding_SyncGraphicsIcon(lcPath)
	RETURN .T.

*--------------------------------------------------------------------
FUNCTION CompanyBranding_EnsureDefaultIcon
	LOCAL lcRoot, lcDir, lcCache, lcDefault

	= CompanyBranding_EnsureIconPublic()
	lcRoot = CompanyBranding_AppHome()
	lcDir  = lcRoot + BRANDING_LOGO_DIR
	IF !DIRECTORY(lcDir)
		MKDIR (lcDir)
	ENDIF
	lcCache = lcDir + "\" + BRANDING_ICON_FILENAME
	IF FILE(lcCache)
		gCompanyIconPath = lcCache
		= CompanyBranding_SyncGraphicsIcon(lcCache)
		RETURN .T.
	ENDIF

	lcDefault = lcRoot + BRANDING_FALLBACK_ICON
	IF !FILE(lcDefault)
		lcDefault = lcRoot + "ICO\earth.ico"
	ENDIF
	IF FILE(lcDefault)
		= CompanyBranding_CopyFile(lcDefault, lcCache)
		gCompanyIconPath = lcCache
		= CompanyBranding_SyncGraphicsIcon(lcCache)
		RETURN FILE(lcCache)
	ENDIF

	RETURN .F.

*--------------------------------------------------------------------
FUNCTION GetCompanyIconPath
	LOCAL lcRoot, lcPath

	= CompanyBranding_EnsureIconPublic()
	IF !EMPTY(gCompanyIconPath) AND FILE(gCompanyIconPath)
		RETURN gCompanyIconPath
	ENDIF

	lcRoot = CompanyBranding_AppHome()
	lcPath = lcRoot + BRANDING_LOGO_DIR + "\" + BRANDING_ICON_FILENAME
	IF FILE(lcPath)
		gCompanyIconPath = lcPath
		RETURN lcPath
	ENDIF

	= CompanyBranding_EnsureDefaultIcon()
	IF !EMPTY(gCompanyIconPath) AND FILE(gCompanyIconPath)
		RETURN gCompanyIconPath
	ENDIF

	lcPath = lcRoot + BRANDING_FALLBACK_ICON
	IF FILE(lcPath)
		RETURN lcPath
	ENDIF

	RETURN ""

*--------------------------------------------------------------------
FUNCTION GetCompanyIconFormPath
	RETURN "graphics\earth.ico"

*--------------------------------------------------------------------
FUNCTION ApplyCompanyIconToForm
	LPARAMETERS toForm

	LOCAL lcIcon

	IF VARTYPE(toForm) # "O"
		RETURN .F.
	ENDIF

	lcIcon = GetCompanyIconPath()
	IF EMPTY(lcIcon) OR !FILE(lcIcon)
		lcIcon = CompanyBranding_AppHome() + BRANDING_LOGO_DIR + "\" + BRANDING_ICON_FILENAME
		IF !FILE(lcIcon)
			= CompanyBranding_EnsureDefaultIcon()
			lcIcon = GetCompanyIconPath()
		ENDIF
	ENDIF
	IF EMPTY(lcIcon) OR !FILE(lcIcon)
		RETURN .F.
	ENDIF

	toForm.Icon = lcIcon
	RETURN .T.

*--------------------------------------------------------------------
FUNCTION CompanyBranding_SaveIconFile
	LPARAMETERS tcSourceFile, tnConnHandle

	LOCAL nConn, llOwn, nRet, lcMime, lcSQL, lcPath
	LOCAL xBlob

	= CompanyBranding_EnsureIconPublic()
	IF EMPTY(tcSourceFile) OR !FILE(tcSourceFile)
		RETURN .F.
	ENDIF
	IF LOWER(JUSTEXT(tcSourceFile)) # "ico"
		RETURN .F.
	ENDIF

	xBlob = CREATEBINARY(FILETOSTR(tcSourceFile))
	lcMime = "image/x-icon"
	nConn = tnConnHandle
	llOwn = .F.
	IF VARTYPE(nConn) # "N" OR nConn < 1
		nConn = get_SQLSTRINGCONNECT()
		llOwn = (nConn > 0)
	ENDIF
	IF nConn < 1
		RETURN .F.
	ENDIF

	lcSQL = "UPDATE dbo.CompanyProfile SET IconImage = ?xBlob, IconMime = ?lcMime, ModifiedDate = SYSDATETIME() WHERE CompanyId = 1"
	nRet = SQLEXEC(nConn, lcSQL)
	IF nRet < 1
		IF llOwn
			SQLDISCONNECT(nConn)
		ENDIF
		RETURN .F.
	ENDIF

	IF llOwn
		SQLDISCONNECT(nConn)
	ENDIF

	lcPath = CompanyBranding_AppHome() + BRANDING_LOGO_DIR + "\" + BRANDING_ICON_FILENAME
	IF !DIRECTORY(CompanyBranding_AppHome() + BRANDING_LOGO_DIR)
		MKDIR (CompanyBranding_AppHome() + BRANDING_LOGO_DIR)
	ENDIF
	= CompanyBranding_CopyFile(tcSourceFile, lcPath)
	gCompanyIconPath = lcPath
	= CompanyBranding_SyncGraphicsIcon(lcPath)

	IF FILE("PROGS\load_CompanyProfile.prg")
		DO load_CompanyProfile WITH .T.
	ENDIF
	= CacheCompanyIconFile(nConn, .T.)
	gCompanyIconPath = GetCompanyIconPath()
	RETURN .T.

*--------------------------------------------------------------------
FUNCTION CompanyBranding_ClearIcon
	LPARAMETERS tnConnHandle

	LOCAL nConn, llOwn, nRet, lcSQL, lcRoot, lcPath

	= CompanyBranding_EnsureIconPublic()
	nConn = tnConnHandle
	llOwn = .F.
	IF VARTYPE(nConn) # "N" OR nConn < 1
		nConn = get_SQLSTRINGCONNECT()
		llOwn = (nConn > 0)
	ENDIF
	IF nConn < 1
		RETURN .F.
	ENDIF

	lcSQL = "UPDATE dbo.CompanyProfile SET IconImage = NULL, IconMime = NULL, ModifiedDate = SYSDATETIME() WHERE CompanyId = 1"
	nRet = SQLEXEC(nConn, lcSQL)
	IF llOwn
		SQLDISCONNECT(nConn)
	ENDIF

	lcRoot = CompanyBranding_AppHome()
	lcPath = lcRoot + BRANDING_LOGO_DIR + "\" + BRANDING_ICON_FILENAME
	IF FILE(lcPath)
		DELETE FILE (lcPath)
	ENDIF

	gCompanyIconPath = ""
	IF FILE("PROGS\load_CompanyProfile.prg")
		DO load_CompanyProfile WITH .T.
	ENDIF
	= CompanyBranding_EnsureDefaultIcon()
	gCompanyIconPath = GetCompanyIconPath()
	RETURN (nRet > 0)

*--------------------------------------------------------------------
FUNCTION CacheCompanyReportBmpFile
	LPARAMETERS tnConnHandle, tlForce

	LOCAL lcRoot, lcDir, lcPath, lcMime, lcSQL, nRet, nConn, llOwn
	LOCAL xData

	= CompanyBranding_EnsureReportBmpPublic()
	IF VARTYPE(tlForce) # "L"
		tlForce = .F.
	ENDIF

	lcRoot = CompanyBranding_AppHome()
	lcDir  = lcRoot + BRANDING_LOGO_DIR
	IF !DIRECTORY(lcDir)
		MKDIR (lcDir)
	ENDIF
	lcPath = lcDir + "\" + BRANDING_COMPANY_BMP

	IF !tlForce AND VARTYPE(goCompany) = "O" AND PEMSTATUS(goCompany, "ReportImage", 5)
		xData = goCompany.ReportImage
		lcMime = IIF(PEMSTATUS(goCompany, "ReportMime", 5), TRANSFORM(goCompany.ReportMime), "")
		IF !EMPTY(xData)
			= CompanyBranding_WriteBlob(xData, lcPath)
			gCompanyReportBmpPath = lcPath
			= CompanyBranding_SyncGraphicsReportBmp(lcPath)
			RETURN .T.
		ENDIF
	ENDIF

	llOwn = .F.
	nConn = tnConnHandle
	IF VARTYPE(nConn) # "N" OR nConn < 1
		nConn = get_SQLSTRINGCONNECT()
		llOwn = (nConn > 0)
	ENDIF
	IF nConn < 1
		RETURN .F.
	ENDIF

	CURSORSETPROP("MapBinary", .T., 0)
	lcSQL = "SELECT ReportImage, ReportMime FROM dbo.CompanyProfile WITH (NOLOCK) WHERE CompanyId = 1"
	nRet = SQLEXEC(nConn, lcSQL, "curCoReportBmp")
	IF nRet < 1 OR !USED("curCoReportBmp") OR RECCOUNT("curCoReportBmp") < 1
		IF llOwn
			SQLDISCONNECT(nConn)
		ENDIF
		RETURN .F.
	ENDIF

	SELECT curCoReportBmp
	xData  = curCoReportBmp.ReportImage
	lcMime = TRANSFORM(curCoReportBmp.ReportMime)
	USE IN curCoReportBmp
	IF llOwn
		SQLDISCONNECT(nConn)
	ENDIF

	IF EMPTY(xData)
		RETURN .F.
	ENDIF

	= CompanyBranding_WriteBlob(xData, lcPath)
	gCompanyReportBmpPath = lcPath
	= CompanyBranding_SyncGraphicsReportBmp(lcPath)
	RETURN .T.

*--------------------------------------------------------------------
FUNCTION GetCompanyReportBmpPath
	LOCAL lcRoot, lcPath

	= CompanyBranding_EnsureReportBmpPublic()
	IF !EMPTY(gCompanyReportBmpPath) AND FILE(gCompanyReportBmpPath)
		RETURN gCompanyReportBmpPath
	ENDIF

	lcRoot = CompanyBranding_AppHome()
	lcPath = lcRoot + BRANDING_LOGO_DIR + "\" + BRANDING_COMPANY_BMP
	IF FILE(lcPath)
		gCompanyReportBmpPath = lcPath
		RETURN lcPath
	ENDIF

	RETURN ""

*--------------------------------------------------------------------
FUNCTION GetCompanyBmpPath
	RETURN GetCompanyReportBmpPath()

*--------------------------------------------------------------------
FUNCTION CompanyBranding_SaveReportBmpFile
	LPARAMETERS tcSourceFile, tnConnHandle

	LOCAL nConn, llOwn, nRet, lcMime, lcSQL, lcPath
	LOCAL xBlob

	= CompanyBranding_EnsureReportBmpPublic()
	IF EMPTY(tcSourceFile) OR !FILE(tcSourceFile)
		RETURN .F.
	ENDIF
	IF LOWER(JUSTEXT(tcSourceFile)) # "bmp"
		RETURN .F.
	ENDIF

	xBlob = CREATEBINARY(FILETOSTR(tcSourceFile))
	lcMime = "image/bmp"
	nConn = tnConnHandle
	llOwn = .F.
	IF VARTYPE(nConn) # "N" OR nConn < 1
		nConn = get_SQLSTRINGCONNECT()
		llOwn = (nConn > 0)
	ENDIF
	IF nConn < 1
		RETURN .F.
	ENDIF

	lcSQL = "UPDATE dbo.CompanyProfile SET ReportImage = ?xBlob, ReportMime = ?lcMime, ModifiedDate = SYSDATETIME() WHERE CompanyId = 1"
	nRet = SQLEXEC(nConn, lcSQL)
	IF nRet < 1
		IF llOwn
			SQLDISCONNECT(nConn)
		ENDIF
		RETURN .F.
	ENDIF

	IF llOwn
		SQLDISCONNECT(nConn)
	ENDIF

	lcPath = CompanyBranding_AppHome() + BRANDING_LOGO_DIR + "\" + BRANDING_COMPANY_BMP
	IF !DIRECTORY(CompanyBranding_AppHome() + BRANDING_LOGO_DIR)
		MKDIR (CompanyBranding_AppHome() + BRANDING_LOGO_DIR)
	ENDIF
	= CompanyBranding_CopyFile(tcSourceFile, lcPath)
	gCompanyReportBmpPath = lcPath
	= CompanyBranding_SyncGraphicsReportBmp(lcPath)

	IF FILE("PROGS\load_CompanyProfile.prg")
		DO load_CompanyProfile WITH .T.
	ENDIF
	= CacheCompanyReportBmpFile(nConn, .T.)
	gCompanyReportBmpPath = GetCompanyReportBmpPath()
	RETURN .T.

*--------------------------------------------------------------------
FUNCTION CompanyBranding_ClearReportBmp
	LPARAMETERS tnConnHandle

	LOCAL nConn, llOwn, nRet, lcSQL, lcRoot, lcPath

	= CompanyBranding_EnsureReportBmpPublic()
	nConn = tnConnHandle
	llOwn = .F.
	IF VARTYPE(nConn) # "N" OR nConn < 1
		nConn = get_SQLSTRINGCONNECT()
		llOwn = (nConn > 0)
	ENDIF
	IF nConn < 1
		RETURN .F.
	ENDIF

	lcSQL = "UPDATE dbo.CompanyProfile SET ReportImage = NULL, ReportMime = NULL, ModifiedDate = SYSDATETIME() WHERE CompanyId = 1"
	nRet = SQLEXEC(nConn, lcSQL)
	IF llOwn
		SQLDISCONNECT(nConn)
	ENDIF

	lcRoot = CompanyBranding_AppHome()
	lcPath = lcRoot + BRANDING_LOGO_DIR + "\" + BRANDING_COMPANY_BMP
	IF FILE(lcPath)
		DELETE FILE (lcPath)
	ENDIF
	lcPath = lcRoot + BRANDING_LOGO_DIR + "\company_report.bmp"
	IF FILE(lcPath)
		DELETE FILE (lcPath)
	ENDIF

	gCompanyReportBmpPath = ""
	IF FILE("PROGS\load_CompanyProfile.prg")
		DO load_CompanyProfile WITH .T.
	ENDIF
	RETURN (nRet > 0)

*--------------------------------------------------------------------
FUNCTION CompanyBranding_CopyFile
	LPARAMETERS tcSource, tcTarget

	LOCAL xData

	IF EMPTY(tcSource) OR !FILE(tcSource) OR EMPTY(tcTarget)
		RETURN .F.
	ENDIF

	xData = FILETOSTR(tcSource)
	IF EMPTY(xData)
		RETURN .F.
	ENDIF

	RETURN STRTOFILE(xData, tcTarget, 0) > 0 AND FILE(tcTarget)

*--------------------------------------------------------------------
FUNCTION CompanyBranding_SyncGraphicsIcon
	LPARAMETERS tcSource

	IF EMPTY(tcSource) OR !FILE(tcSource)
		RETURN .F.
	ENDIF
	RETURN CompanyBranding_CopyFile(tcSource, CompanyBranding_AppHome() + BRANDING_GRAPHICS_ICON)

*--------------------------------------------------------------------
FUNCTION CompanyBranding_SyncGraphicsReportBmp
	LPARAMETERS tcSource

	IF EMPTY(tcSource) OR !FILE(tcSource)
		RETURN .F.
	ENDIF
	RETURN CompanyBranding_CopyFile(tcSource, CompanyBranding_AppHome() + BRANDING_GRAPHICS_BMP)
