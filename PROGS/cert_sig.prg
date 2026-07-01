*====================================================================
* cert_sig.prg — Cert_Sig blob cache + lookup helpers (ERP)
*
* Cached files: graphics\sig-{Sig_ID}.bmp  (mirrored to REPORTS\graphics)
* Blank unsigned: graphics\sig-Blank.bmp
*
* DO Cert_Sig_EnsureLibraries   && optional; main.prg loads this file
* DO Cert_Sig_EnsureBlankGraphics   && create graphics\sig-Blank.bmp on disk (unsigned certs)
*====================================================================

#DEFINE CERTSIG_BLANK_FILE     "sig-Blank.bmp"
#DEFINE CERTSIG_CACHE_PREFIX   "sig-"
#DEFINE CERTSIG_GRAPHICS_DIR   "graphics\"

*--------------------------------------------------------------------
FUNCTION Cert_Sig_EnsureLibraries
	IF !"COMPANY_BRANDING" $ UPPER(SET("PROCEDURE"))
		IF FILE("PROGS\company_branding.prg")
			SET PROCEDURE TO PROGS\company_branding.prg ADDITIVE
		ENDIF
	ENDIF
	RETURN .T.

*--------------------------------------------------------------------
FUNCTION Cert_Sig_AppHome
	= Cert_Sig_EnsureLibraries()
	IF TYPE("CompanyBranding_AppHome") = "F"
		RETURN CompanyBranding_AppHome()
	ENDIF
	RETURN ADDBS(IIF(VARTYPE(gERPAppHome) = "C" AND !EMPTY(gERPAppHome), gERPAppHome, ;
		IIF(VARTYPE(LoginAppHome) = "C" AND !EMPTY(LoginAppHome), LoginAppHome, SYS(5) + SYS(2003))))

*--------------------------------------------------------------------
FUNCTION Cert_Sig_CurrentUser
	LOCAL lcMachine, lcUser
	lcMachine = ID()
	lcUser = RIGHT(lcMachine, LEN(lcMachine) - AT("#", lcMachine) - 1)
	RETURN ALLTRIM(lcUser)

*--------------------------------------------------------------------
FUNCTION Cert_Sig_LegacyCodeForUser
	LPARAMETERS tcUser
	LOCAL lcUser
	lcUser = ALLTRIM(EVL(tcUser, Cert_Sig_CurrentUser()))
	DO CASE
	CASE lcUser = "Russell Kirchner"
		RETURN "rustykirch"
	CASE lcUser = "Russ Kirchner"
		RETURN "rustykirch"
	CASE lcUser = "Russ Kirchner 3rd"
		RETURN "rustykirch"
	CASE lcUser = "Russell Kirchner 3rd"
		RETURN "rustykirch"
	CASE lcUser = "John Corra"
		RETURN "JohnCorra"
	CASE lcUser = "Alnita Galloway"
		RETURN "AlnitaGall"
	CASE lcUser = "Dave Morrow"
		RETURN "DaveMorrow"
	OTHERWISE
		RETURN ""
	ENDCASE

*--------------------------------------------------------------------
FUNCTION Cert_Sig_LegacyGraphicsFile
	LPARAMETERS tcLegacyCode
	LOCAL lcRoot, laFiles[4], i, lcPath
	lcRoot = Cert_Sig_AppHome()
	DO CASE
	CASE ALLTRIM(EVL(tcLegacyCode, "")) == "rustykirch"
		laFiles[1] = "sig-Russ_Kirchner_3.bmp"
		laFiles[2] = "sig-Russ_Kirchner_Jr.BMP"
		laFiles[3] = "sig-russ_kirchner_3.bmp"
	CASE ALLTRIM(tcLegacyCode) == "JohnCorra"
		laFiles[1] = "sig-John_Corra.bmp"
	CASE ALLTRIM(tcLegacyCode) == "AlnitaGall"
		laFiles[1] = "sig-AlnitaGall.png"
		laFiles[2] = "sig-Alnita.png"
	CASE ALLTRIM(tcLegacyCode) == "DaveMorrow"
		laFiles[1] = "sig-Dave_Morrow.bmp"
		laFiles[2] = "sig-dave_morrow.bmp"
	OTHERWISE
		RETURN ""
	ENDCASE
	FOR i = 1 TO ALEN(laFiles)
		IF EMPTY(laFiles[i])
			LOOP
		ENDIF
		lcPath = lcRoot + CERTSIG_GRAPHICS_DIR + laFiles[i]
		IF FILE(lcPath)
			RETURN lcPath
		ENDIF
	ENDFOR
	RETURN ""

*--------------------------------------------------------------------
FUNCTION Cert_Sig_EnsureBlankBmp
	LOCAL lcRoot, lcBlank, lcPs, lcSrc

	lcRoot = Cert_Sig_AppHome()
	IF !DIRECTORY(lcRoot + "graphics")
		MKDIR (lcRoot + "graphics")
	ENDIF
	lcBlank = lcRoot + CERTSIG_GRAPHICS_DIR + CERTSIG_BLANK_FILE
	IF FILE(lcBlank)
		RETURN lcBlank
	ENDIF

	lcSrc = Cert_Sig_LegacyGraphicsFile("DaveMorrow")
	IF !EMPTY(lcSrc) AND FILE(lcSrc)
		IF TYPE("CompanyBranding_CopyFile") = "F"
			= CompanyBranding_CopyFile(lcSrc, lcBlank)
		ELSE
			STRTOFILE(FILETOSTR(lcSrc), lcBlank, 0)
		ENDIF
		IF FILE(lcBlank)
			RETURN lcBlank
		ENDIF
	ENDIF

	= Cert_Sig_EnsureLibraries()
	IF TYPE("CompanyBranding_PsSingleQuotedPath") # "F"
		IF FILE("PROGS\company_branding.prg")
			SET PROCEDURE TO PROGS\company_branding.prg ADDITIVE
		ENDIF
	ENDIF

	lcPs = 'powershell -NoProfile -Command "Add-Type -AssemblyName System.Drawing; ' + ;
		'$b=New-Object System.Drawing.Bitmap 320,80; $g=[System.Drawing.Graphics]::FromImage($b); ' + ;
		'$g.Clear([System.Drawing.Color]::White); $g.Dispose(); ' + ;
		'$b.Save(' + CompanyBranding_PsSingleQuotedPath(lcBlank) + ',[System.Drawing.Imaging.ImageFormat]::Bmp); $b.Dispose()"'
	RUN /N /HIDDEN &lcPs
	RETURN IIF(FILE(lcBlank), lcBlank, lcRoot + CERTSIG_GRAPHICS_DIR + CERTSIG_BLANK_FILE)

*--------------------------------------------------------------------
FUNCTION Cert_Sig_CachePath
	LPARAMETERS tnSig_ID
	LOCAL lcRoot, lcFile
	lcRoot = Cert_Sig_AppHome()
	IF VARTYPE(tnSig_ID) # "N" OR tnSig_ID < 1
		RETURN Cert_Sig_EnsureBlankBmp()
	ENDIF
	lcFile = lcRoot + CERTSIG_GRAPHICS_DIR + CERTSIG_CACHE_PREFIX + ALLTRIM(STR(tnSig_ID)) + ".bmp"
	RETURN lcFile

*--------------------------------------------------------------------
FUNCTION Cert_Sig_SyncReportsGraphics
	LPARAMETERS tcSourceBmp
	LOCAL lcRoot, lcDst
	IF EMPTY(tcSourceBmp) OR !FILE(tcSourceBmp)
		RETURN .F.
	ENDIF
	lcRoot = Cert_Sig_AppHome()
	lcDst = lcRoot + "REPORTS\" + CERTSIG_GRAPHICS_DIR + JUSTFNAME(tcSourceBmp)
	IF !DIRECTORY(lcRoot + "REPORTS\graphics")
		MKDIR (lcRoot + "REPORTS\graphics")
	ENDIF
	IF TYPE("CompanyBranding_CopyFile") = "F"
		RETURN CompanyBranding_CopyFile(tcSourceBmp, lcDst)
	ENDIF
	RETURN STRTOFILE(FILETOSTR(tcSourceBmp), lcDst, 0) > 0

*--------------------------------------------------------------------
FUNCTION CacheCertSigFile
	LPARAMETERS tnSig_ID, tnConnHandle, tlForce
	LOCAL nConn, llOwn, llForce, lcPath, lcSQL, nRet, xData, lcMime, lcTmp

	IF VARTYPE(tnSig_ID) # "N" OR tnSig_ID < 1
		RETURN Cert_Sig_EnsureBlankBmp()
	ENDIF
	llForce = (VARTYPE(tlForce) = "L" AND tlForce)
	lcPath = Cert_Sig_CachePath(tnSig_ID)
	IF !llForce AND FILE(lcPath)
		RETURN lcPath
	ENDIF

	nConn = tnConnHandle
	llOwn = .F.
	IF VARTYPE(nConn) # "N" OR nConn < 1
		nConn = get_SQLSTRINGCONNECT()
		llOwn = (nConn > 0)
	ENDIF
	IF nConn < 1
		RETURN IIF(FILE(lcPath), lcPath, Cert_Sig_EnsureBlankBmp())
	ENDIF

	IF TYPE("CompanyBranding_EnsureMapBinary") = "F"
		= CompanyBranding_EnsureMapBinary()
	ELSE
		CURSORSETPROP("MapBinary", .T., 0)
	ENDIF

	lcSQL = "SELECT SigImage, SigMime FROM dbo.Cert_Sig WITH (NOLOCK) WHERE Sig_ID = " + STR(tnSig_ID) + " AND IsActive = 1"
	nRet = SQLEXEC(nConn, lcSQL, "curCertSig")
	IF llOwn
		SQLDISCONNECT(nConn)
	ENDIF
	IF nRet < 1 OR !USED("curCertSig") OR RECCOUNT("curCertSig") < 1
		USE IN SELECT("curCertSig")
		RETURN Cert_Sig_EnsureBlankBmp()
	ENDIF

	SELECT curCertSig
	xData = curCertSig.SigImage
	lcMime = TRANSFORM(curCertSig.SigMime)
	USE IN curCertSig

	IF TYPE("CompanyBranding_BlobHasData") = "F"
		IF !CompanyBranding_BlobHasData(xData)
			RETURN Cert_Sig_EnsureBlankBmp()
		ENDIF
	ELSE
		IF EMPTY(xData)
			RETURN Cert_Sig_EnsureBlankBmp()
		ENDIF
	ENDIF

	lcTmp = Cert_Sig_AppHome() + "MEM\_certsig_tmp.bmp"
	IF TYPE("CompanyBranding_WriteBlob") = "F"
		= CompanyBranding_WriteBlob(xData, lcTmp)
	ELSE
		STRTOFILE(xData, lcTmp, 0)
	ENDIF
	IF FILE(lcTmp)
		IF TYPE("CompanyBranding_ConvertImageToBmp") = "F" ;
				AND TYPE("CompanyBranding_MimeToExt") = "F" ;
				AND LOWER(JUSTEXT(lcTmp)) # "bmp" AND "bmp" $ LOWER(lcMime)
			= CompanyBranding_ConvertImageToBmp(lcTmp, lcPath)
		ELSE
			IF TYPE("CompanyBranding_CopyFile") = "F"
				= CompanyBranding_CopyFile(lcTmp, lcPath)
			ELSE
				STRTOFILE(FILETOSTR(lcTmp), lcPath, 0)
			ENDIF
		ENDIF
		DELETE FILE (lcTmp)
	ENDIF
	IF FILE(lcPath)
		= Cert_Sig_SyncReportsGraphics(lcPath)
		RETURN lcPath
	ENDIF
	RETURN Cert_Sig_EnsureBlankBmp()

*--------------------------------------------------------------------
FUNCTION CertSig_ReportBmpPath
	LPARAMETERS tnSig_ID
	LOCAL lcPath
	IF VARTYPE(tnSig_ID) # "N" OR tnSig_ID < 1
		RETURN Cert_Sig_EnsureBlankBmp()
	ENDIF
	lcPath = CacheCertSigFile(tnSig_ID, 0, .F.)
	IF FILE(lcPath)
		RETURN lcPath
	ENDIF
	RETURN Cert_Sig_EnsureBlankBmp()

*--------------------------------------------------------------------
FUNCTION Cert_Sig_LookupByLegacy
	LPARAMETERS tcLegacyCode, tnConnHandle
	LOCAL nConn, llOwn, lcSQL, nRet, lnSig

	lnSig = 0
	IF EMPTY(ALLTRIM(EVL(tcLegacyCode, "")))
		RETURN 0
	ENDIF
	nConn = tnConnHandle
	llOwn = .F.
	IF VARTYPE(nConn) # "N" OR nConn < 1
		nConn = get_SQLSTRINGCONNECT()
		llOwn = (nConn > 0)
	ENDIF
	IF nConn < 1
		RETURN 0
	ENDIF
	lcSQL = "SELECT TOP 1 Sig_ID FROM dbo.Cert_Sig WITH (NOLOCK) WHERE IsActive = 1 AND LegacyCode = '" + ;
		STRTRAN(ALLTRIM(tcLegacyCode), "'", "''") + "'"
	nRet = SQLEXEC(nConn, lcSQL, "curSigLookup")
	IF llOwn
		SQLDISCONNECT(nConn)
	ENDIF
	IF nRet > 0 AND USED("curSigLookup") AND RECCOUNT("curSigLookup") > 0
		lnSig = curSigLookup.Sig_ID
		USE IN curSigLookup
	ENDIF
	RETURN lnSig

*--------------------------------------------------------------------
FUNCTION Cert_Sig_LookupForUser
	LPARAMETERS tcUser, tnConnHandle
	LOCAL nConn, llOwn, lcSQL, nRet, lnSig, lcUser, lcLegacy

	lcUser = ALLTRIM(EVL(tcUser, Cert_Sig_CurrentUser()))
	lnSig = 0
	nConn = tnConnHandle
	llOwn = .F.
	IF VARTYPE(nConn) # "N" OR nConn < 1
		nConn = get_SQLSTRINGCONNECT()
		llOwn = (nConn > 0)
	ENDIF
	IF nConn < 1
		RETURN 0
	ENDIF

	lcSQL = "SELECT TOP 1 Sig_ID FROM dbo.Cert_Sig WITH (NOLOCK) WHERE IsActive = 1 AND " + ;
		"(AppUserLogin = '" + STRTRAN(lcUser, "'", "''") + "' OR PersonName = '" + STRTRAN(lcUser, "'", "''") + "')"
	nRet = SQLEXEC(nConn, lcSQL, "curSigUser")
	IF nRet > 0 AND USED("curSigUser") AND RECCOUNT("curSigUser") > 0
		lnSig = curSigUser.Sig_ID
		USE IN curSigUser
	ENDIF

	IF lnSig < 1
		lcLegacy = Cert_Sig_LegacyCodeForUser(lcUser)
		IF !EMPTY(lcLegacy)
			lnSig = Cert_Sig_LookupByLegacy(lcLegacy, nConn)
		ENDIF
	ENDIF

	IF llOwn
		SQLDISCONNECT(nConn)
	ENDIF
	RETURN lnSig

*--------------------------------------------------------------------
FUNCTION Cert_Sig_LookupForCurrentUser
	LPARAMETERS tnConnHandle
	RETURN Cert_Sig_LookupForUser(Cert_Sig_CurrentUser(), tnConnHandle)

*--------------------------------------------------------------------
* Ensure unsigned placeholder file exists (not stored in dbo.Cert_Sig).
FUNCTION Cert_Sig_EnsureBlankGraphics
	LOCAL lcBlank
	lcBlank = Cert_Sig_EnsureBlankBmp()
	IF FILE(lcBlank) AND TYPE("Cert_Sig_SyncReportsGraphics") = "F"
		= Cert_Sig_SyncReportsGraphics(lcBlank)
	ENDIF
	IF TYPE("ErpEnsureReportsGraphicsLink") = "F"
		= ErpEnsureReportsGraphicsLink()
	ENDIF
	RETURN IIF(FILE(lcBlank), lcBlank, "")

*--------------------------------------------------------------------
* Back-compat alias — only ensures sig-Blank.bmp on disk; no SQL blob uploads.
FUNCTION Cert_Sig_LoadGraphicsToSql
	LPARAMETERS tnUnused
	RETURN IIF(!EMPTY(Cert_Sig_EnsureBlankGraphics()), 1, 0)
