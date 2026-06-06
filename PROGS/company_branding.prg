*====================================================================
* company_branding.prg — Company logo on forms and reports (ERP_1)
*
* Logo source: dbo.CompanyProfile.LogoImage (cached to MEM\company_logo.*)
* Reports:    picture paths -> ..\MEM\company_logo.<ext>
* Forms:      timer applies imgCompanyLogo (top-right) on visible forms
*
* DO InitCompanyBranding   && called from main.prg after load_CompanyProfile
*====================================================================

#DEFINE BRANDING_LOGO_DIR        "MEM"
#DEFINE BRANDING_LOGO_BASENAME   "company_logo"
#DEFINE BRANDING_FALLBACK_JPG    "graphics\spacealloysusa-logo-nbhrz.jpg"
#DEFINE BRANDING_FALLBACK_JPG2   "graphics\spacealloysusa-logo-nb.jpg"
#DEFINE BRANDING_IMG_WIDTH       88
#DEFINE BRANDING_IMG_HEIGHT      40
#DEFINE BRANDING_IMG_MARGIN      6

PUBLIC gCompanyLogoPath, gCompanyBrandingEnabled, gCompanyBrandingTimer

gCompanyLogoPath = ""
gCompanyBrandingEnabled = .T.
gCompanyBrandingTimer = .NULL.

*--------------------------------------------------------------------
FUNCTION CompanyBranding_EnsurePublic
	* SET PROCEDURE does not run module-level PUBLIC; ensure vars exist.
	IF VARTYPE(gCompanyLogoPath) # "C"
		PUBLIC gCompanyLogoPath
		gCompanyLogoPath = ""
	ENDIF
	IF VARTYPE(gCompanyBrandingEnabled) # "L"
		PUBLIC gCompanyBrandingEnabled
		gCompanyBrandingEnabled = .T.
	ENDIF
	IF VARTYPE(gCompanyBrandingTimer) # "O"
		PUBLIC gCompanyBrandingTimer
		gCompanyBrandingTimer = .NULL.
	ENDIF
	RETURN

*--------------------------------------------------------------------
FUNCTION InitCompanyBranding
	LOCAL llOk

	= CompanyBranding_EnsurePublic()

	llOk = CacheCompanyLogoFile()
	gCompanyLogoPath = GetCompanyLogoPath()
	StartCompanyFormBranding()
	RETURN llOk

*--------------------------------------------------------------------
FUNCTION CacheCompanyLogoFile
	LPARAMETERS tnConnHandle, tlForce

	LOCAL lcRoot, lcDir, lcExt, lcPath, lcMime, lcSQL, nRet, nConn, llOwn
	LOCAL laFld[1], i, lcFld, lcType, xData

	= CompanyBranding_EnsurePublic()
	IF VARTYPE(tlForce) # "L"
		tlForce = .F.
	ENDIF

	lcRoot = ADDBS(SYS(5) + SYS(2003))
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

	lcRoot = ADDBS(SYS(5) + SYS(2003))
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
FUNCTION ApplyCompanyLogoToForm
	LPARAMETERS toForm

	LOCAL lcPic, loImg, lnLeft

	IF VARTYPE(toForm) # "O" OR UPPER(toForm.BaseClass) # "FORM"
		RETURN .F.
	ENDIF
	IF PEMSTATUS(toForm, "lSkipCompanyBranding", 5) AND toForm.lSkipCompanyBranding
		RETURN .F.
	ENDIF
	IF PEMSTATUS(toForm, "lCompanyBrandingApplied", 5) AND toForm.lCompanyBrandingApplied
		RETURN .F.
	ENDIF

	lcPic = GetCompanyLogoPath()
	IF EMPTY(lcPic)
		RETURN .F.
	ENDIF

	IF PEMSTATUS(toForm, "imgCompanyLogo", 5)
		toForm.imgCompanyLogo.Picture = lcPic
		toForm.imgCompanyLogo.Visible = .T.
	ELSE
		loImg = toForm.ADDOBJECT("imgCompanyLogo", "Image")
		loImg.Picture = lcPic
		loImg.BorderStyle = 0
		loImg.BackStyle = 0
		loImg.Stretch = 1
		loImg.Height = BRANDING_IMG_HEIGHT
		loImg.Width  = BRANDING_IMG_WIDTH
		loImg.Anchor = 9
		lnLeft = MAX(toForm.Width - loImg.Width - BRANDING_IMG_MARGIN, BRANDING_IMG_MARGIN)
		loImg.Left = lnLeft
		loImg.Top  = BRANDING_IMG_MARGIN
		loImg.ZOrder(0)
		loImg.Visible = .T.
	ENDIF

	toForm.AddProperty("lCompanyBrandingApplied", .T.)
	RETURN .T.

*--------------------------------------------------------------------
FUNCTION StartCompanyFormBranding
	= CompanyBranding_EnsurePublic()
	IF !gCompanyBrandingEnabled
		RETURN
	ENDIF
	IF VARTYPE(gCompanyBrandingTimer) = "O" AND !ISNULL(gCompanyBrandingTimer)
		RETURN
	ENDIF
	gCompanyBrandingTimer = CREATEOBJECT("CompanyBrandingTimer")
	gCompanyBrandingTimer.Start()
	RETURN

*--------------------------------------------------------------------
FUNCTION StopCompanyFormBranding
	= CompanyBranding_EnsurePublic()
	IF VARTYPE(gCompanyBrandingTimer) = "O" AND !ISNULL(gCompanyBrandingTimer)
		gCompanyBrandingTimer.Stop()
		gCompanyBrandingTimer = .NULL.
	ENDIF
	RETURN

*--------------------------------------------------------------------
FUNCTION CompanyBranding_SaveLogoFile
	LPARAMETERS tcSourceFile, tnConnHandle

	LOCAL nConn, llOwn, nRet, lcMime, lcSQL, lcExt
	LOCAL xBlob

	= CompanyBranding_EnsurePublic()
	IF EMPTY(tcSourceFile) OR !FILE(tcSourceFile)
		RETURN .F.
	ENDIF

	CREATE CURSOR csrLogoBlob (img M)
	APPEND BLANK
	APPEND MEMO img FROM (tcSourceFile)
	xBlob = csrLogoBlob.img
	USE IN csrLogoBlob

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

	lcSQL = "UPDATE dbo.CompanyProfile SET LogoImage = ?, LogoMime = ?, ModifiedDate = SYSDATETIME() WHERE CompanyId = 1"
	nRet = SQLEXEC(nConn, lcSQL, xBlob, lcMime)
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

	lcRoot = ADDBS(SYS(5) + SYS(2003))
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
		OTHERWISE
			RETURN "image/jpeg"
	ENDCASE

*--------------------------------------------------------------------
FUNCTION CompanyBranding_WriteBlob
	LPARAMETERS xData, tcPath

	LOCAL nH, lcType

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

*====================================================================
DEFINE CLASS CompanyBrandingTimer AS Custom

	Hidden = .T.
	oTimer = .NULL.

	PROCEDURE Start
		IF VARTYPE(This.oTimer) = "O" AND !ISNULL(This.oTimer)
			This.oTimer.Enabled = .T.
			RETURN
		ENDIF
		This.oTimer = CREATEOBJECT("Timer")
		This.oTimer.Interval = 350
		This.oTimer.Enabled = .T.
		BINDEVENT(This.oTimer, "Timer", This, "OnTimer")
	ENDPROC

	PROCEDURE Stop
		IF VARTYPE(This.oTimer) = "O" AND !ISNULL(This.oTimer)
			This.oTimer.Enabled = .F.
			UNBINDEVENT(This.oTimer)
			This.oTimer = .NULL.
		ENDIF
	ENDPROC

	PROCEDURE OnTimer
		LOCAL i, loF

		IF !gCompanyBrandingEnabled
			RETURN
		ENDIF

		FOR i = 1 TO _SCREEN.FormCount
			loF = _SCREEN.Forms(i)
			IF VARTYPE(loF) = "O" AND UPPER(loF.BaseClass) = "FORM" AND loF.Visible
				ApplyCompanyLogoToForm(loF)
			ENDIF
		ENDFOR
	ENDPROC

ENDDEFINE
