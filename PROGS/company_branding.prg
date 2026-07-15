*====================================================================
* company_branding.prg — Company logo + icon cache (ERP)
*
* Logo source: dbo.CompanyProfile.LogoImage (cached to MEM\company_logo.*)
* Icon source: dbo.CompanyProfile.IconImage (cached to MEM\Company_Icon.ico)
* Report Logo: MEM\Company_Rpt_Logo.bmp (SQL source); FRX: graphics\Company_Rpt_Logo.bmp
* (avoid ..\MEM\ — VFP resolves that from CURDIR and prompts Open when missing)
* Forms/ERP:  GetCompanyIconPath() -> MEM\Company_Icon.ico (default ICO\earth-globe.ico)
*
* DO InitCompanyBranding   && called from main.prg after load_CompanyProfile
*====================================================================

#DEFINE BRANDING_LOGO_DIR        "MEM"
#DEFINE BRANDING_LOGO_BASENAME   "company_logo"
#DEFINE BRANDING_ICON_FILENAME   "Company_Icon.ico"
#DEFINE BRANDING_FALLBACK_JPG    "graphics\spacealloysusa-logo-nbhrz.jpg"
#DEFINE BRANDING_FALLBACK_JPG2   "graphics\spacealloysusa-logo-nb.jpg"
#DEFINE BRANDING_FALLBACK_ICON   "ICO\earth-globe.ico"
#DEFINE BRANDING_REPORT_LOGO_FILE  "Company_Rpt_Logo.bmp"
#DEFINE BRANDING_REPORT_LOGO_FILE_LEGACY1 "Report_Logo.bmp"
#DEFINE BRANDING_REPORT_LOGO_FILE_LEGACY2 "Company_BMP.bmp"
#DEFINE BRANDING_GRAPHICS_BMP_LEGACY "graphics\erphead.bmp"
#DEFINE BRANDING_PLACEHOLDER_LOGO  "graphics\company_logo_placeholder.png"
#DEFINE BRANDING_GRAPHICS_ICON   "graphics\earth-globe.ico"
#DEFINE BRANDING_GRAPHICS_BMP    "graphics\Company_Rpt_Logo.bmp"
#DEFINE BRANDING_REPORT_LOGO_FRX "graphics\Company_Rpt_Logo.bmp"

PUBLIC gCompanyLogoPath
PUBLIC gCompanyIconPath
PUBLIC gCompanyReportBmpPath

gCompanyLogoPath = ""
gCompanyIconPath = ""
gCompanyReportBmpPath = ""

*--------------------------------------------------------------------
FUNCTION CompanyBranding_PsSingleQuotedPath
	LPARAMETERS tcPath
	LOCAL lcQ
	lcQ = CHR(39)
	RETURN lcQ + STRTRAN(ALLTRIM(EVL(tcPath, "")), lcQ, lcQ + lcQ) + lcQ

*--------------------------------------------------------------------
* data:image/png;base64,... from Branding Report Logo (for HTML email <img src>).
FUNCTION CompanyBranding_ReportLogoDataUri
	LOCAL lcBmp, lcOut, lcPs1, lcCmd, lcUri, lcScript, lcCache, lcB64

	= CompanyBranding_EnsureReportBmpPublic()
	= CacheCompanyReportBmpFile(0, .F.)
	lcBmp = GetCompanyReportBmpPath()
	IF EMPTY(lcBmp) OR !FILE(lcBmp)
		RETURN ""
	ENDIF

	* Cache beside the BMP so HTML email generation does not depend on RUN/PowerShell.
	lcCache = FORCEEXT(lcBmp, "datauri")
	IF FILE(lcCache)
		lcUri = ALLTRIM(FILETOSTR(lcCache))
		IF LEFT(LOWER(lcUri), 11) = "data:image/"
			RETURN lcUri
		ENDIF
	ENDIF

	lcOut = ADDBS(SYS(2023)) + "erp_rpt_logo_uri.txt"
	lcPs1 = ADDBS(SYS(2023)) + "erp_rpt_logo_uri.ps1"
	IF FILE(lcOut)
		ERASE (lcOut)
	ENDIF
	IF FILE(lcPs1)
		ERASE (lcPs1)
	ENDIF

	* Prefer PNG data-URI via PowerShell (matches email clients better).
	lcScript = "Add-Type -AssemblyName System.Drawing" + CHR(13)+CHR(10)
	lcScript = lcScript + "$i=[System.Drawing.Image]::FromFile(" + CompanyBranding_PsSingleQuotedPath(lcBmp) + ")" + CHR(13)+CHR(10)
	lcScript = lcScript + "$ms=New-Object System.IO.MemoryStream" + CHR(13)+CHR(10)
	lcScript = lcScript + "$i.Save($ms,[System.Drawing.Imaging.ImageFormat]::Png)" + CHR(13)+CHR(10)
	lcScript = lcScript + "$i.Dispose()" + CHR(13)+CHR(10)
	lcScript = lcScript + "$b64=[Convert]::ToBase64String($ms.ToArray())" + CHR(13)+CHR(10)
	lcScript = lcScript + "$ms.Dispose()" + CHR(13)+CHR(10)
	lcScript = lcScript + "[IO.File]::WriteAllText(" + CompanyBranding_PsSingleQuotedPath(lcOut) + ",('data:image/png;base64,'+$b64))" + CHR(13)+CHR(10)
	STRTOFILE(lcScript, lcPs1, 0)

	lcCmd = "powershell -NoProfile -ExecutionPolicy Bypass -File " + CompanyBranding_PsSingleQuotedPath(lcPs1)
	RUN /W &lcCmd

	IF FILE(lcPs1)
		ERASE (lcPs1)
	ENDIF
	IF FILE(lcOut)
		lcUri = ALLTRIM(FILETOSTR(lcOut))
		ERASE (lcOut)
		IF LEFT(LOWER(lcUri), 22) = "data:image/png;base64,"
			STRTOFILE(lcUri, lcCache, 0)
			RETURN lcUri
		ENDIF
	ENDIF

	* Fallback: embed BMP via MSXML bin.base64 (no PowerShell).
	lcB64 = CompanyBranding_FileToBase64(lcBmp)
	IF EMPTY(lcB64)
		RETURN ""
	ENDIF
	lcUri = "data:image/bmp;base64," + lcB64
	STRTOFILE(lcUri, lcCache, 0)
	RETURN lcUri

*--------------------------------------------------------------------
* Binary file -> base64 (ADODB.Stream + MSXML). Used when PowerShell convert fails.
FUNCTION CompanyBranding_FileToBase64
	LPARAMETERS tcFile
	LOCAL loStream, loXml, loNode, lcB64

	IF EMPTY(tcFile) OR !FILE(tcFile)
		RETURN ""
	ENDIF
	lcB64 = ""
	TRY
		loStream = CREATEOBJECT("ADODB.Stream")
		loStream.Type = 1
		loStream.Open()
		loStream.LoadFromFile(tcFile)
		TRY
			loXml = CREATEOBJECT("MSXML2.DOMDocument.6.0")
		CATCH
			loXml = CREATEOBJECT("MSXML2.DOMDocument")
		ENDTRY
		loNode = loXml.createElement("b64")
		loNode.dataType = "bin.base64"
		loNode.nodeTypedValue = loStream.Read()
		loStream.Close()
		lcB64 = STRTRAN(STRTRAN(ALLTRIM(loNode.Text), CHR(13), ""), CHR(10), "")
	CATCH
		lcB64 = ""
		TRY
			IF VARTYPE(loStream) = "O"
				loStream.Close()
			ENDIF
		CATCH
		ENDTRY
	ENDTRY
	RETURN lcB64

*--------------------------------------------------------------------
FUNCTION CompanyBranding_ReportLogoHtmlImg
	LPARAMETERS tnHeight
	LOCAL lcUri, lcAlt, lnH, lcName

	IF VARTYPE(tnHeight) # "N" OR tnHeight < 1
		lnH = 69
	ELSE
		lnH = tnHeight
	ENDIF

	lcUri = CompanyBranding_ReportLogoDataUri()
	IF EMPTY(lcUri)
		RETURN ""
	ENDIF

	lcAlt = "Company Logo"
	IF !"COMPANY_REPORT" $ UPPER(SET("PROCEDURE"))
		IF FILE("REPORTS\company_report.prg")
			SET PROCEDURE TO REPORTS\company_report.prg ADDITIVE
		ENDIF
	ENDIF
	IF TYPE("CompanyReport_Name()") = "U"
		* leave default alt
	ELSE
		lcName = ALLTRIM(CompanyReport_Name())
		IF !EMPTY(lcName)
			lcAlt = STRTRAN(lcName, ["], [])
		ENDIF
	ENDIF

	RETURN [<img alt="] + lcAlt + [" src="] + lcUri + [" height="] + ALLTRIM(STR(lnH)) + [" />]

*--------------------------------------------------------------------
FUNCTION CompanyBranding_ReportLogoMemPath
	LOCAL lcRoot, lcPath, laLegacy[2], i

	lcRoot = CompanyBranding_AppHome()
	lcPath = lcRoot + BRANDING_LOGO_DIR + "\" + BRANDING_REPORT_LOGO_FILE
	IF FILE(lcPath)
		RETURN lcPath
	ENDIF
	laLegacy[1] = BRANDING_REPORT_LOGO_FILE_LEGACY1
	laLegacy[2] = BRANDING_REPORT_LOGO_FILE_LEGACY2
	FOR i = 1 TO ALEN(laLegacy)
		lcPath = lcRoot + BRANDING_LOGO_DIR + "\" + laLegacy[i]
		IF FILE(lcPath)
			RETURN lcPath
		ENDIF
	ENDFOR
	RETURN lcRoot + BRANDING_LOGO_DIR + "\" + BRANDING_REPORT_LOGO_FILE

*--------------------------------------------------------------------
* One-time copy from older report-logo filenames (erphead, Report_Logo, etc.).
FUNCTION CompanyBranding_MigrateReportLogoFiles
	LOCAL lcRoot, lcNewGfx, lcOldGfx, lcNewMem, lcPath, laLegacy[2], i

	lcRoot = CompanyBranding_AppHome()
	lcNewGfx = lcRoot + BRANDING_GRAPHICS_BMP
	IF !FILE(lcNewGfx)
		lcOldGfx = lcRoot + BRANDING_GRAPHICS_BMP_LEGACY
		IF FILE(lcOldGfx)
			= CompanyBranding_CopyFile(lcOldGfx, lcNewGfx)
		ENDIF
	ENDIF

	lcNewMem = CompanyBranding_ReportLogoMemPath()
	IF !FILE(lcNewMem)
		laLegacy[1] = lcRoot + BRANDING_LOGO_DIR + "\" + BRANDING_REPORT_LOGO_FILE_LEGACY1
		laLegacy[2] = lcRoot + BRANDING_LOGO_DIR + "\" + BRANDING_REPORT_LOGO_FILE_LEGACY2
		FOR i = 1 TO ALEN(laLegacy)
			lcPath = laLegacy[i]
			IF FILE(lcPath)
				= CompanyBranding_CopyFile(lcPath, lcRoot + BRANDING_LOGO_DIR + "\" + BRANDING_REPORT_LOGO_FILE)
				EXIT
			ENDIF
		ENDFOR
	ENDIF

	IF FILE(lcNewGfx)
		lcPath = lcRoot + "REPORTS\" + BRANDING_GRAPHICS_BMP
		IF !FILE(lcPath)
			IF !DIRECTORY(lcRoot + "REPORTS\graphics")
				MKDIR (lcRoot + "REPORTS\graphics")
			ENDIF
			= CompanyBranding_CopyFile(lcNewGfx, lcPath)
		ENDIF
	ENDIF
	RETURN FILE(lcNewGfx)

*--------------------------------------------------------------------
FUNCTION CompanyBranding_EnsureMapBinary
	CURSORSETPROP("MapBinary", .T., 0)
	RETURN .T.

*--------------------------------------------------------------------
FUNCTION CompanyBranding_BlobHasData
	LPARAMETERS xData
	IF ISNULL(xData)
		RETURN .F.
	ENDIF
	DO CASE
	CASE TYPE("xData") = "Q"
		RETURN LEN(xData) > 0
	CASE TYPE("xData") = "M" OR TYPE("xData") = "C"
		RETURN !EMPTY(xData)
	OTHERWISE
		RETURN !EMPTY(xData)
	ENDCASE

*--------------------------------------------------------------------
FUNCTION CompanyBranding_ReadBinaryFile
	LPARAMETERS tcPath
	LOCAL nH, nSize, cData

	IF EMPTY(tcPath) OR !FILE(tcPath)
		RETURN ""
	ENDIF
	nH = FOPEN(tcPath, 0)
	IF nH < 0
		RETURN ""
	ENDIF
	nSize = FSEEK(nH, 0, 2)
	FSEEK(nH, 0, 0)
	cData = SPACE(nSize)
	= FREAD(nH, @cData)
	FCLOSE(nH)
	RETURN cData

*--------------------------------------------------------------------
FUNCTION CompanyBranding_BlobMatchesFile
	LPARAMETERS xData, tcPath
	LOCAL cFile

	IF !CompanyBranding_BlobHasData(xData) OR EMPTY(tcPath) OR !FILE(tcPath)
		RETURN .F.
	ENDIF
	IF TYPE("xData") # "Q"
		RETURN .F.
	ENDIF
	IF LEN(xData) # CompanyBranding_FileSize(tcPath)
		RETURN .F.
	ENDIF
	cFile = CompanyBranding_ReadBinaryFile(tcPath)
	RETURN (LEN(cFile) = LEN(xData) AND cFile == xData)

*--------------------------------------------------------------------
FUNCTION CompanyBranding_FileSize
	LPARAMETERS tcPath
	LOCAL la[1]

	IF EMPTY(tcPath) OR !FILE(tcPath)
		RETURN 0
	ENDIF
	IF ADIR(la, tcPath) < 1
		RETURN 0
	ENDIF
	RETURN la[1, 2]

*--------------------------------------------------------------------
* Ship / first-run blank graphics; overwritten when Report Logo is uploaded.
FUNCTION CompanyBranding_EnsurePlaceholderGraphics
	LPARAMETERS tlForce
	LOCAL lcRoot, lcGfx, lcMem, lcPs, llForce

	llForce = (VARTYPE(tlForce) = "L" AND tlForce)
	lcRoot = CompanyBranding_AppHome()
	IF !DIRECTORY(lcRoot + "graphics")
		MKDIR (lcRoot + "graphics")
	ENDIF
	IF !DIRECTORY(lcRoot + BRANDING_LOGO_DIR)
		MKDIR (lcRoot + BRANDING_LOGO_DIR)
	ENDIF

	lcGfx = lcRoot + BRANDING_PLACEHOLDER_LOGO
	IF llForce OR !FILE(lcGfx)
		lcPs = 'powershell -NoProfile -Command "Add-Type -AssemblyName System.Drawing; ' + ;
			'$b=New-Object System.Drawing.Bitmap 320,120; $g=[System.Drawing.Graphics]::FromImage($b); ' + ;
			'$g.Clear([System.Drawing.Color]::FromArgb(245,245,245)); ' + ;
			'$p=New-Object System.Drawing.Pen([System.Drawing.Color]::LightGray); ' + ;
			'$g.DrawRectangle($p,0,0,319,119); $g.Dispose(); ' + ;
			'$b.Save(' + CompanyBranding_PsSingleQuotedPath(lcGfx) + ',[System.Drawing.Imaging.ImageFormat]::Png); $b.Dispose()"'
		RUN /N /HIDDEN &lcPs
	ENDIF

	lcGfx = lcRoot + BRANDING_GRAPHICS_BMP
	IF llForce OR !FILE(lcGfx)
		lcPs = 'powershell -NoProfile -Command "Add-Type -AssemblyName System.Drawing; ' + ;
			'$b=New-Object System.Drawing.Bitmap 800,150; $g=[System.Drawing.Graphics]::FromImage($b); ' + ;
			'$g.Clear([System.Drawing.Color]::White); ' + ;
			'$p=New-Object System.Drawing.Pen([System.Drawing.Color]::Gainsboro); ' + ;
			'$g.DrawRectangle($p,0,0,799,149); $g.Dispose(); ' + ;
			'$b.Save(' + CompanyBranding_PsSingleQuotedPath(lcGfx) + ',[System.Drawing.Imaging.ImageFormat]::Bmp); $b.Dispose()"'
		RUN /N /HIDDEN &lcPs
	ENDIF

	= CompanyBranding_EnsureDefaultIcon()
	= CompanyBranding_SyncDefaultIconGraphics()
	= ErpEnsureReportsGraphicsLink()
	RETURN FILE(lcRoot + BRANDING_GRAPHICS_BMP)

*--------------------------------------------------------------------
FUNCTION CompanyBranding_RefreshCacheFromSql
	LPARAMETERS tnConnHandle
	LOCAL nConn

	nConn = tnConnHandle
	IF VARTYPE(nConn) # "N" OR nConn < 1
		nConn = 0
	ENDIF
	= CacheCompanyLogoFile(nConn, .T.)
	gCompanyLogoPath = GetCompanyLogoPath()
	= CacheCompanyIconFile(nConn, .T.)
	gCompanyIconPath = GetCompanyIconPath()
	= CacheCompanyReportBmpFile(nConn, .T.)
	IF !FILE(GetCompanyReportBmpPath())
		= CompanyBranding_EnsureReportHeaderFromLogo(nConn)
	ENDIF
	gCompanyReportBmpPath = GetCompanyReportBmpPath()
	= ErpEnsureReportsGraphicsLink()
	RETURN .T.

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
* Resolve graphics\file.bmp to full path under ERP home (toolbar icons).
FUNCTION ErpGraphic
	LPARAMETERS tcFile
	LOCAL lcFile, lcPath, lcRoot

	IF EMPTY(tcFile)
		RETURN ""
	ENDIF
	lcFile = STRTRAN(ALLTRIM(tcFile), "/", "\")
	IF (":" $ lcFile OR LEFT(lcFile, 2) == "\\") AND FILE(lcFile)
		RETURN lcFile
	ENDIF
	DO WHILE LEFT(lcFile, 1) == "\"
		lcFile = SUBSTR(lcFile, 2)
	ENDDO
	DO WHILE LEFT(lcFile, 3) == "..\"
		lcFile = SUBSTR(lcFile, 4)
	ENDDO
	IF LEFT(UPPER(lcFile), 9) == "GRAPHICS\"
		lcFile = SUBSTR(lcFile, 10)
	ENDIF
	lcRoot = CompanyBranding_AppHome()
	lcPath = lcRoot + "graphics\" + lcFile
	IF FILE(lcPath)
		RETURN lcPath
	ENDIF
	lcPath = lcRoot + "Forms\graphics\" + lcFile
	IF FILE(lcPath)
		RETURN lcPath
	ENDIF
	RETURN lcRoot + "graphics\" + lcFile

*--------------------------------------------------------------------
* Forms in Forms\ resolve GRAPHICS\ relative to the form folder — mirror once.
FUNCTION ErpEnsureFormsGraphicsLink
	LOCAL lcRoot, lcSrc, lcDst, lcLibsDst, lcProbe

	lcRoot = CompanyBranding_AppHome()
	lcSrc = lcRoot + "graphics"
	lcDst = lcRoot + "Forms\graphics"
	lcLibsDst = lcRoot + "LIBS\graphics"
	lcProbe = lcDst + "\spell.bmp"
	IF FILE(lcProbe)
		RETURN .T.
	ENDIF
	IF !DIRECTORY(lcSrc)
		RETURN .F.
	ENDIF
	IF !DIRECTORY(lcDst)
		MKDIR (lcDst)
	ENDIF
	RUN /N /HIDDEN robocopy "&lcSrc" "&lcDst" /E /XO /NFL /NDL /NJH /NJS
	IF !DIRECTORY(lcLibsDst)
		MKDIR (lcLibsDst)
	ENDIF
	RUN /N /HIDDEN robocopy "&lcSrc" "&lcLibsDst" /E /XO /NFL /NDL /NJH /NJS
	RETURN FILE(lcProbe)

*--------------------------------------------------------------------
* Reports in REPORTS\ resolve graphics\ relative to the report folder.
FUNCTION ErpEnsureReportsGraphicsLink
	LOCAL lcRoot, lcSrc, lcDst, lcProbe

	lcRoot = CompanyBranding_AppHome()
	lcSrc = lcRoot + "graphics"
	lcDst = lcRoot + "REPORTS\graphics"
	lcProbe = lcDst + "\" + BRANDING_REPORT_LOGO_FILE
	IF FILE(lcProbe)
		RETURN .T.
	ENDIF
	IF !DIRECTORY(lcSrc)
		RETURN .F.
	ENDIF
	IF !DIRECTORY(lcRoot + "REPORTS")
		RETURN .F.
	ENDIF
	IF !DIRECTORY(lcDst)
		MKDIR (lcDst)
	ENDIF
	RUN /N /HIDDEN robocopy "&lcSrc" "&lcDst" /E /XO /NFL /NDL /NJH /NJS
	RETURN FILE(lcProbe) OR FILE(lcDst + "\spell.bmp")

*--------------------------------------------------------------------
FUNCTION CompanyBranding_ConvertImageToBmp
	LPARAMETERS tcSource, tcDestBmp
	LOCAL lcSrc, lcDst, lcPs

	lcSrc = ALLTRIM(EVL(tcSource, ""))
	lcDst = ALLTRIM(EVL(tcDestBmp, ""))
	IF EMPTY(lcSrc) OR !FILE(lcSrc) OR EMPTY(lcDst)
		RETURN .F.
	ENDIF
	IF LOWER(JUSTEXT(lcSrc)) == "bmp"
		RETURN CompanyBranding_CopyFile(lcSrc, lcDst)
	ENDIF
	lcPs = 'powershell -NoProfile -Command "Add-Type -AssemblyName System.Drawing; ' + ;
		'$i=[System.Drawing.Image]::FromFile(' + CompanyBranding_PsSingleQuotedPath(lcSrc) + '); ' + ;
		'$i.Save(' + CompanyBranding_PsSingleQuotedPath(lcDst) + ',[System.Drawing.Imaging.ImageFormat]::Bmp); ' + ;
		'$i.Dispose()"'
	RUN /N /HIDDEN &lcPs
	RETURN FILE(lcDst)

*--------------------------------------------------------------------
FUNCTION CompanyBranding_PublishReportHeaderBmp
	LPARAMETERS tcSourceFile, tnConnHandle, tlSaveSql
	LOCAL lcBmp, lcRoot, lcMemBmp, llSaveSql, nConn, llOwn, nRet, lcSQL, xBlob

	= CompanyBranding_EnsureReportBmpPublic()
	IF EMPTY(tcSourceFile) OR !FILE(tcSourceFile)
		RETURN .F.
	ENDIF
	IF VARTYPE(tlSaveSql) # "L"
		llSaveSql = .T.
	ELSE
		llSaveSql = tlSaveSql
	ENDIF

	lcRoot = CompanyBranding_AppHome()
	lcBmp = lcRoot + "MEM\_report_header_tmp.bmp"
	IF !CompanyBranding_ConvertImageToBmp(tcSourceFile, lcBmp)
		RETURN .F.
	ENDIF

	lcMemBmp = lcRoot + BRANDING_LOGO_DIR + "\" + BRANDING_REPORT_LOGO_FILE
	IF !DIRECTORY(lcRoot + BRANDING_LOGO_DIR)
		MKDIR (lcRoot + BRANDING_LOGO_DIR)
	ENDIF
	= CompanyBranding_CopyFile(lcBmp, lcMemBmp)
	gCompanyReportBmpPath = lcMemBmp
	= CompanyBranding_SyncGraphicsReportBmp(lcMemBmp)
	= ErpEnsureReportsGraphicsLink()

	IF llSaveSql
		xBlob = CREATEBINARY(FILETOSTR(lcBmp))
		nConn = tnConnHandle
		llOwn = .F.
		IF VARTYPE(nConn) # "N" OR nConn < 1
			nConn = get_SQLSTRINGCONNECT()
			llOwn = (nConn > 0)
		ENDIF
		IF nConn > 0
			= CompanyBranding_EnsureMapBinary()
			lcSQL = "UPDATE dbo.CompanyProfile SET ReportImage = ?xBlob, ReportMime = 'image/bmp', ModifiedDate = SYSDATETIME() WHERE CompanyId = 1"
			nRet = SQLEXEC(nConn, lcSQL)
			IF llOwn
				SQLDISCONNECT(nConn)
			ENDIF
			IF nRet > 0 AND FILE("PROGS\load_CompanyProfile.prg")
				DO load_CompanyProfile WITH .T.
			ENDIF
		ENDIF
	ENDIF

	IF FILE(lcBmp)
		DELETE FILE (lcBmp)
	ENDIF
	RETURN .T.

*--------------------------------------------------------------------
* When no Report Logo exists, build Company_Rpt_Logo.bmp from the company logo.
FUNCTION CompanyBranding_EnsureReportHeaderFromLogo
	LPARAMETERS tnConnHandle
	LOCAL lcLogo, lcRoot, lcRptLogo

	lcRoot = CompanyBranding_AppHome()
	lcRptLogo = lcRoot + BRANDING_GRAPHICS_BMP
	IF FILE(lcRptLogo) AND FILE(lcRoot + "REPORTS\" + BRANDING_GRAPHICS_BMP)
		RETURN .T.
	ENDIF

	lcLogo = GetCompanyLogoPath()
	IF EMPTY(lcLogo) OR !FILE(lcLogo)
		RETURN .F.
	ENDIF

	IF VARTYPE(goCompany) = "O" AND PEMSTATUS(goCompany, "ReportImage", 5) AND CompanyBranding_BlobHasData(goCompany.ReportImage)
		RETURN CacheCompanyReportBmpFile(tnConnHandle, .F.)
	ENDIF

	RETURN CompanyBranding_PublishReportHeaderBmp(lcLogo, tnConnHandle, .T.)

*--------------------------------------------------------------------
FUNCTION CompanyBranding_SyncLogoToReportIfNeeded
	LPARAMETERS tcLogoFile, tnConnHandle
	LOCAL llHasReport

	llHasReport = .F.
	IF VARTYPE(goCompany) = "O" AND PEMSTATUS(goCompany, "ReportImage", 5)
		llHasReport = CompanyBranding_BlobHasData(goCompany.ReportImage)
	ENDIF
	IF llHasReport
		RETURN .T.
	ENDIF
	RETURN CompanyBranding_PublishReportHeaderBmp(tcLogoFile, tnConnHandle, .T.)

*--------------------------------------------------------------------
FUNCTION FixErpContainerPictures
	LPARAMETERS toContainer
	LOCAL i, o, lcPic, lcIcon

	IF VARTYPE(toContainer) # "O"
		RETURN 0
	ENDIF
	FOR i = 1 TO toContainer.ControlCount
		o = toContainer.Controls(i)
		IF PEMSTATUS(o, "Picture", 5) AND !EMPTY(o.Picture) AND !(":" $ o.Picture)
			lcPic = ErpGraphic(o.Picture)
			IF FILE(lcPic)
				o.Picture = lcPic
			ENDIF
		ENDIF
		IF PEMSTATUS(o, "Icon", 5) AND !EMPTY(o.Icon) AND !(":" $ o.Icon)
			lcIcon = ErpGraphic(o.Icon)
			IF FILE(lcIcon)
				o.Icon = lcIcon
			ENDIF
		ENDIF
		IF PEMSTATUS(o, "ControlCount", 5) AND o.ControlCount > 0
			= FixErpContainerPictures(o)
		ENDIF
	ENDFOR
	RETURN 1

*--------------------------------------------------------------------
* Show where a branding asset appears before the file picker (Choose buttons).
FUNCTION CompanyBranding_ConfirmChoose
	LPARAMETERS tcKind
	LOCAL lcMsg, lcTitle

	lcTitle = "Before you choose a file"
	DO CASE
	CASE UPPER(ALLTRIM(tcKind)) == "LOGO"
		lcMsg = "Company logo (JPG, PNG, GIF, or BMP)" + CHR(13) + CHR(13) + ;
			"Where it shows:" + CHR(13) + ;
			"  - Preview on this Branding tab" + CHR(13) + ;
			"  - Stored in SQL and MEM\company_logo.*" + CHR(13) + ;
			"  - If you have not chosen a Report Logo yet, this logo is also" + CHR(13) + ;
			"    converted to graphics\Company_Rpt_Logo.bmp for certs and other reports" + CHR(13) + CHR(13) + ;
			"For a custom letterhead strip, use Report Logo below." + CHR(13) + CHR(13) + ;
			"Practical tips:" + CHR(13) + ;
			"  - Landscape image, about 400-800 px wide" + CHR(13) + ;
			"  - Keep file size under 1 MB" + CHR(13) + CHR(13) + ;
			"Choose a file now?"
	CASE UPPER(ALLTRIM(tcKind)) == "ICON"
		lcMsg = "Company icon (.ICO file only)" + CHR(13) + CHR(13) + ;
			"Where it shows:" + CHR(13) + ;
			"  - Windows taskbar and ERP main window title bar" + CHR(13) + ;
			"  - Forms that apply company branding (menu, setup, quotes, etc.)" + CHR(13) + ;
			"  - Built ERP.EXE icon (MEM\Company_Icon.ico)" + CHR(13) + CHR(13) + ;
			"Practical tips:" + CHR(13) + ;
			"  - Use a true Windows .ico file" + CHR(13) + ;
			"  - Include 16x16, 32x32, and 48x48 sizes in the .ico" + CHR(13) + ;
			"  - Simple, high-contrast art (reads small)" + CHR(13) + CHR(13) + ;
			"Choose a file now?"
	CASE INLIST(UPPER(ALLTRIM(tcKind)), "BMP", "REPORTLOGO")
		lcMsg = "Report Logo (JPG, PNG, GIF, or BMP)" + CHR(13) + CHR(13) + ;
			"Where it shows:" + CHR(13) + ;
			"  - Report letterheads (PO, sales order, certs, logs, etc.)" + CHR(13) + ;
			"  - Saved to MEM\Company_Rpt_Logo.bmp (canonical report header file)" + CHR(13) + ;
			"  - Synced from SQL on ERP startup when the file differs" + CHR(13) + ;
			"  - Reports use picture expression: graphics\Company_Rpt_Logo.bmp" + CHR(13) + CHR(13) + ;
			"Practical tips:" + CHR(13) + ;
			"  - Landscape letterhead strip (logo left, address block right)" + CHR(13) + ;
			"  - About 600-1200 px wide, 150-250 px tall" + CHR(13) + ;
			"  - White or light background" + CHR(13) + CHR(13) + ;
			"Choose a file now?"
	OTHERWISE
		RETURN .T.
	ENDCASE
	RETURN (MESSAGEBOX(lcMsg, 4+64, lcTitle) = 6)

*--------------------------------------------------------------------
FUNCTION InitCompanyBranding
	LOCAL llOkLogo, llOkIcon, llOkReport

	= CompanyBranding_EnsurePublic()
	= CompanyBranding_EnsureIconPublic()
	= CompanyBranding_EnsureReportBmpPublic()
	= CompanyBranding_EnsurePlaceholderGraphics()
	= CompanyBranding_MigrateReportLogoFiles()
	IF FILE("PROGS\load_CompanyProfile.prg")
		DO load_CompanyProfile WITH .T.
	ENDIF
	= CompanyBranding_RefreshCacheFromSql(0)
	llOkLogo = !EMPTY(gCompanyLogoPath)
	llOkIcon = !EMPTY(gCompanyIconPath)
	llOkReport = !EMPTY(gCompanyReportBmpPath)
	= ErpEnsureFormsGraphicsLink()
	= SetERPAppCaption()
	RETURN (llOkLogo OR llOkIcon OR llOkReport)

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
		IF CompanyBranding_BlobHasData(xData)
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

	IF !CompanyBranding_BlobHasData(xData)
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

	lcPath = lcRoot + BRANDING_PLACEHOLDER_LOGO
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

	= CompanyBranding_EnsureMapBinary()
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
		nConn = 0
	ENDIF

	IF FILE("PROGS\load_CompanyProfile.prg")
		DO load_CompanyProfile WITH .T.
	ENDIF
	= CacheCompanyLogoFile(nConn, .T.)
	gCompanyLogoPath = GetCompanyLogoPath()
	= CompanyBranding_SyncLogoToReportIfNeeded(tcSourceFile, nConn)
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
*--------------------------------------------------------------------
FUNCTION CompanyBranding_FileLooksLikeBmp
	LPARAMETERS tcPath
	LOCAL nH, lcSig

	IF EMPTY(tcPath) OR !FILE(tcPath)
		RETURN .F.
	ENDIF
	nH = FOPEN(tcPath, 0)
	IF nH < 0
		RETURN .F.
	ENDIF
	lcSig = FREAD(nH, 2)
	FCLOSE(nH)
	RETURN lcSig == "BM"

*--------------------------------------------------------------------
FUNCTION CompanyBranding_WriteBlob
	LPARAMETERS xData, tcPath

	LOCAL nH, lcHex, lcBin, i

	IF EMPTY(xData) OR EMPTY(tcPath)
		RETURN .F.
	ENDIF

	* Character/memo that is hex text of a BMP ("424D...") — decode to binary first
	IF TYPE("xData") $ "CM"
		lcHex = UPPER(CHRTRAN(ALLTRIM(xData), CHR(13) + CHR(10) + " " + CHR(9), ""))
		IF LEN(lcHex) >= 4 AND LEFT(lcHex, 4) == "424D" ;
				AND MOD(LEN(lcHex), 2) = 0 ;
				AND LEN(CHRTRAN(lcHex, "0123456789ABCDEF", "")) = 0
			lcBin = ""
			FOR i = 1 TO LEN(lcHex) STEP 2
				lcBin = lcBin + CHR(EVALUATE("0x" + SUBSTR(lcHex, i, 2)))
			ENDFOR
			IF LEFT(lcBin, 2) == "BM"
				xData = CREATEBINARY(lcBin)
			ENDIF
		ENDIF
	ENDIF

	DO CASE
		CASE TYPE("xData") = "Q"
			nH = FCREATE(tcPath)
			IF nH < 0
				RETURN .F.
			ENDIF
			FWRITE(nH, xData)
			FCLOSE(nH)
			RETURN FILE(tcPath)
		CASE TYPE("xData") = "M"
			STRTOFILE(xData, tcPath, 0)
			RETURN FILE(tcPath)
		CASE TYPE("xData") = "C"
			STRTOFILE(xData, tcPath, 0)
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
		IF CompanyBranding_BlobHasData(xData)
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

	IF !CompanyBranding_BlobHasData(xData)
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
		lcDefault = lcRoot + "ICO\earth-globe.ico"
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
	RETURN BRANDING_GRAPHICS_ICON

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

	= CompanyBranding_EnsureMapBinary()
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
		nConn = 0
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
	lcPath = lcDir + "\" + BRANDING_REPORT_LOGO_FILE
	xData = .NULL.

	IF VARTYPE(goCompany) = "O" AND PEMSTATUS(goCompany, "ReportImage", 5)
		xData = goCompany.ReportImage
		lcMime = IIF(PEMSTATUS(goCompany, "ReportMime", 5), TRANSFORM(goCompany.ReportMime), "")
	ENDIF

	IF !CompanyBranding_BlobHasData(xData)
		llOwn = .F.
		nConn = tnConnHandle
		IF VARTYPE(nConn) # "N" OR nConn < 1
			nConn = get_SQLSTRINGCONNECT()
			llOwn = (nConn > 0)
		ENDIF
		IF nConn > 0
			CURSORSETPROP("MapBinary", .T., 0)
			lcSQL = "SELECT ReportImage, ReportMime FROM dbo.CompanyProfile WITH (NOLOCK) WHERE CompanyId = 1"
			nRet = SQLEXEC(nConn, lcSQL, "curCoReportBmp")
			IF nRet > 0 AND USED("curCoReportBmp") AND RECCOUNT("curCoReportBmp") > 0
				SELECT curCoReportBmp
				xData  = curCoReportBmp.ReportImage
				lcMime = TRANSFORM(curCoReportBmp.ReportMime)
				USE IN curCoReportBmp
			ENDIF
			IF llOwn
				SQLDISCONNECT(nConn)
			ENDIF
		ENDIF
	ENDIF

	IF CompanyBranding_BlobHasData(xData)
		IF FILE(lcPath) AND CompanyBranding_BlobMatchesFile(xData, lcPath) ;
				AND CompanyBranding_FileLooksLikeBmp(lcPath)
			gCompanyReportBmpPath = lcPath
			= CompanyBranding_SyncGraphicsReportBmp(lcPath)
			= ErpEnsureReportsGraphicsLink()
			RETURN .T.
		ENDIF
		= CompanyBranding_WriteBlob(xData, lcPath)
		gCompanyReportBmpPath = lcPath
		= CompanyBranding_SyncGraphicsReportBmp(lcPath)
		= ErpEnsureReportsGraphicsLink()
		RETURN FILE(lcPath)
	ENDIF

	IF FILE(lcPath) AND CompanyBranding_FileLooksLikeBmp(lcPath)
		gCompanyReportBmpPath = lcPath
		= ErpEnsureReportsGraphicsLink()
		RETURN .T.
	ENDIF
	RETURN .F.

*--------------------------------------------------------------------
FUNCTION GetCompanyReportBmpPath
	LOCAL lcRoot, lcPath

	= CompanyBranding_EnsureReportBmpPublic()
	lcPath = CompanyBranding_ReportLogoMemPath()
	IF FILE(lcPath)
		gCompanyReportBmpPath = lcPath
		RETURN lcPath
	ENDIF
	IF !EMPTY(gCompanyReportBmpPath) AND FILE(gCompanyReportBmpPath)
		RETURN gCompanyReportBmpPath
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
		RETURN CompanyBranding_PublishReportHeaderBmp(tcSourceFile, tnConnHandle, .T.)
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

	= CompanyBranding_EnsureMapBinary()
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
		nConn = 0
	ENDIF

	lcPath = CompanyBranding_AppHome() + BRANDING_LOGO_DIR + "\" + BRANDING_REPORT_LOGO_FILE
	IF !DIRECTORY(CompanyBranding_AppHome() + BRANDING_LOGO_DIR)
		MKDIR (CompanyBranding_AppHome() + BRANDING_LOGO_DIR)
	ENDIF
	= CompanyBranding_CopyFile(tcSourceFile, lcPath)
	gCompanyReportBmpPath = lcPath
	= CompanyBranding_SyncGraphicsReportBmp(lcPath)
	= ErpEnsureReportsGraphicsLink()

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
	lcPath = lcRoot + BRANDING_LOGO_DIR + "\" + BRANDING_REPORT_LOGO_FILE
	IF FILE(lcPath)
		DELETE FILE (lcPath)
	ENDIF
	lcPath = lcRoot + BRANDING_LOGO_DIR + "\" + BRANDING_REPORT_LOGO_FILE_LEGACY1
	IF FILE(lcPath)
		DELETE FILE (lcPath)
	ENDIF
	lcPath = lcRoot + BRANDING_LOGO_DIR + "\" + BRANDING_REPORT_LOGO_FILE_LEGACY2
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
	IF !CompanyBranding_BlobHasData(xData)
		RETURN .F.
	ENDIF

	RETURN STRTOFILE(xData, tcTarget, 0) > 0 AND FILE(tcTarget)

*--------------------------------------------------------------------
FUNCTION CompanyBranding_SyncDefaultIconGraphics
	LOCAL lcRoot, lcSrc, lcDst

	lcRoot = CompanyBranding_AppHome()
	lcSrc = lcRoot + BRANDING_FALLBACK_ICON
	IF !FILE(lcSrc)
		lcSrc = lcRoot + "ICO\earth-globe.ico"
	ENDIF
	IF !FILE(lcSrc)
		RETURN .F.
	ENDIF
	lcDst = lcRoot + BRANDING_GRAPHICS_ICON
	RETURN CompanyBranding_CopyFile(lcSrc, lcDst)

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
	LOCAL llOk, lcRoot, lcDst

	IF EMPTY(tcSource) OR !FILE(tcSource)
		RETURN .F.
	ENDIF
	lcRoot = CompanyBranding_AppHome()
	llOk = CompanyBranding_CopyFile(tcSource, lcRoot + BRANDING_GRAPHICS_BMP)
	lcDst = lcRoot + "REPORTS\" + BRANDING_GRAPHICS_BMP
	IF !DIRECTORY(lcRoot + "REPORTS\graphics")
		MKDIR (lcRoot + "REPORTS\graphics")
	ENDIF
	llOk = CompanyBranding_CopyFile(tcSource, lcDst) OR llOk
	= ErpEnsureReportsGraphicsLink()
	RETURN llOk
