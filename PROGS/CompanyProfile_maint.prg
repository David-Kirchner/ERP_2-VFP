*====================================================================
* CompanyProfile_maint.prg — Company Profile maintenance (Admin)
* DO CompanyProfile_maint
*====================================================================

IF NOT "PROC_SETUP" $ UPPER(SET("PROCEDURE"))
	SET PROCEDURE TO PROGS\proc_setup ADDITIVE
ENDIF
IF NOT FILE("PROGS\load_CompanyProfile.prg")
	SET PROCEDURE TO PROGS\load_CompanyProfile ADDITIVE
ENDIF

IF NOT HavePermission("Admin", .T.)
	MESSAGEBOX("Admin permission required to edit Company Profile.", 48, "Company Profile")
	RETURN
ENDIF

DO load_CompanyProfile

PUBLIC oCompanyMaint
oCompanyMaint = CREATEOBJECT("CompanyProfileMaintForm")
oCompanyMaint.Show(1)
RELEASE oCompanyMaint

RETURN

*====================================================================
DEFINE CLASS CompanyProfileMaintForm AS FORM

	AutoCenter = .T.
	Caption = "Company Profile"
	Height = 420
	Width = 520
	WindowType = 1
	nConnHandle = 0

	ADD OBJECT pgf1 AS PageFrame WITH ;
		Top = 10, Left = 10, Height = 360, Width = 500, ;
		ErasePage = .T., PageCount = 3, Name = "pgf1"

	ADD OBJECT cmdSave AS CommandButton WITH ;
		Caption = "Save", Top = 380, Left = 280, Height = 27, Width = 84
	ADD OBJECT cmdReload AS CommandButton WITH ;
		Caption = "Reload", Top = 380, Left = 120, Height = 27, Width = 84
	ADD OBJECT cmdClose AS CommandButton WITH ;
		Caption = "Close", Top = 380, Left = 400, Height = 27, Width = 84, ;
		Cancel = .T.

	PROCEDURE Init
		This.nConnHandle = get_SQLSTRINGCONNECT()
		This.BuildPages()
		This.LoadData()
	ENDPROC

	PROCEDURE BuildPages
	LOCAL oPg, oLbl, oTxt, nTop, nL
	This.pgf1.Page1.Caption = "Identity"
	This.pgf1.Page2.Caption = "Contact / Web"
	This.pgf1.Page3.Caption = "Cert text"
	nTop = 20
	FOR EACH oPg IN This.pgf1.Pages
		nTop = 20
		DO CASE
		CASE oPg.PageOrder = 1
			This.AddField(oPg, "LegalName", "Legal name", nTop, 20)
			nTop = nTop + 30
			This.AddField(oPg, "DBAName", "DBA", nTop, 20)
			nTop = nTop + 30
			This.AddField(oPg, "ShortName", "Short name", nTop, 20)
			nTop = nTop + 30
			This.AddField(oPg, "Tagline", "Tagline", nTop, 20)
		CASE oPg.PageOrder = 2
			This.AddField(oPg, "SalesEmail", "Sales email", nTop, 20)
			nTop = nTop + 30
			This.AddField(oPg, "QualityEmail", "Quality email", nTop, 20)
			nTop = nTop + 30
			This.AddField(oPg, "Website", "Website", nTop, 20)
			nTop = nTop + 30
			This.AddField(oPg, "CageCode", "CAGE", nTop, 20)
		CASE oPg.PageOrder = 3
			This.AddMemo(oPg, "CertHeaderText", "Header", 20, 20)
			This.AddMemo(oPg, "CertCertifyText", "Certify body", 120, 20)
			This.AddMemo(oPg, "CertFooterText", "Footer", 220, 20)
		ENDCASE
	ENDFOR
	ENDPROC

	PROCEDURE AddField
	LPARAMETERS toPg, tcProp, tcLbl, tnTop, tnLeft
	LOCAL oL, oT
	oL = toPg.ADDOBJECT("lbl"+tcProp, "Label")
	oL.Caption = tcLbl
	oL.Top = tnTop
	oL.Left = tnLeft
	oL.Width = 90
	oT = toPg.ADDOBJECT("txt"+tcProp, "TextBox")
	oT.Top = tnTop
	oT.Left = tnLeft + 95
	oT.Width = 350
	oT.ControlSource = "ThisForm.c"+tcProp
	oT.Name = "txt"+tcProp
	This.AddProperty("c"+tcProp, "")
	ENDPROC

	PROCEDURE AddMemo
	LPARAMETERS toPg, tcProp, tcLbl, tnTop, tnLeft
	LOCAL oL, oM
	oL = toPg.ADDOBJECT("lbl"+tcProp, "Label")
	oL.Caption = tcLbl
	oL.Top = tnTop
	oL.Left = tnLeft
	oM = toPg.ADDOBJECT("edt"+tcProp, "EditBox")
	oM.Top = tnTop + 18
	oM.Left = tnLeft
	oM.Width = 450
	oM.Height = 70
	oM.ControlSource = "ThisForm.c"+tcProp
	This.AddProperty("c"+tcProp, "")
	ENDPROC

	PROCEDURE LoadData
	LOCAL lcP, laP[1], i
	IF VARTYPE(goCompany) # "O"
		DO load_CompanyProfile
	ENDIF
	IF VARTYPE(goCompany) # "O"
		RETURN
	ENDIF
	laP[1] = "LegalName"
	DIMENSION laP[11]
	laP[1] = "LegalName"
	laP[2] = "DBAName"
	laP[3] = "ShortName"
	laP[4] = "Tagline"
	laP[5] = "SalesEmail"
	laP[6] = "QualityEmail"
	laP[7] = "Website"
	laP[8] = "CageCode"
	laP[9] = "CertHeaderText"
	laP[10] = "CertCertifyText"
	laP[11] = "CertFooterText"
	FOR i = 1 TO ALEN(laP)
		lcP = laP[i]
		IF PEMSTATUS(goCompany, lcP, 5)
			This.SetProperty("c"+lcP, TRANSFORM(EVALUATE("goCompany."+lcP)))
		ENDIF
	ENDFOR
	ENDPROC

	PROCEDURE cmdReload.Click
	This.LoadData()
	ENDPROC

	PROCEDURE cmdClose.Click
	Thisform.Release()
	ENDPROC

	PROCEDURE cmdSave.Click
	LOCAL lcSQL, nRet
	IF This.nConnHandle < 1
		This.nConnHandle = get_SQLSTRINGCONNECT()
	ENDIF
	lcSQL = "UPDATE dbo.CompanyProfile SET "
	lcSQL = lcSQL + "LegalName = "+CompanyProfile_SQLQuote(This.cLegalName)+", "
	lcSQL = lcSQL + "DBAName = "+CompanyProfile_SQLQuote(This.cDBAName)+", "
	lcSQL = lcSQL + "ShortName = "+CompanyProfile_SQLQuote(This.cShortName)+", "
	lcSQL = lcSQL + "Tagline = "+CompanyProfile_SQLQuote(This.cTagline)+", "
	lcSQL = lcSQL + "SalesEmail = "+CompanyProfile_SQLQuote(This.cSalesEmail)+", "
	lcSQL = lcSQL + "QualityEmail = "+CompanyProfile_SQLQuote(This.cQualityEmail)+", "
	lcSQL = lcSQL + "Website = "+CompanyProfile_SQLQuote(This.cWebsite)+", "
	lcSQL = lcSQL + "CageCode = "+CompanyProfile_SQLQuote(This.cCageCode)+", "
	lcSQL = lcSQL + "CertHeaderText = "+CompanyProfile_SQLQuote(This.cCertHeaderText)+", "
	lcSQL = lcSQL + "CertCertifyText = "+CompanyProfile_SQLQuote(This.cCertCertifyText)+", "
	lcSQL = lcSQL + "CertFooterText = "+CompanyProfile_SQLQuote(This.cCertFooterText)+", "
	lcSQL = lcSQL + "ModifiedDate = SYSDATETIME() "
	lcSQL = lcSQL + "WHERE CompanyId = 1"
	nRet = SQLEXEC(This.nConnHandle, lcSQL)
	IF nRet < 1
		MESSAGEBOX("Save failed. Check SQL connection and CompanyProfile table.", 16, "Company Profile")
		RETURN
	ENDIF
	DO load_CompanyProfile WITH .T.
	MESSAGEBOX("Company profile saved.", 64, "Company Profile")
	ENDPROC

ENDDEFINE

*--------------------------------------------------------------------
FUNCTION CompanyProfile_SQLQuote
LPARAMETERS tcVal
IF VARTYPE(tcVal) # "C"
	tcVal = TRANSFORM(tcVal)
ENDIF
RETURN "'" + STRTRAN(ALLTRIM(tcVal), "'", "''") + "'"
