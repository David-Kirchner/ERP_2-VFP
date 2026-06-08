*====================================================================
* company_report.prg — CompanyProfile / CompanyPlant fields for FRX expressions
* Design reference: Reports\certs11.frx
*====================================================================

*--------------------------------------------------------------------
FUNCTION CompanyReport_EnsureData
	IF VARTYPE(goCompany) # "O"
		IF FILE("PROGS\load_CompanyProfile.prg")
			DO load_CompanyProfile
		ENDIF
	ENDIF
	IF VARTYPE(goCompanyPlants) # "O"
		IF FILE("PROGS\load_CompanyPlants.prg")
			DO load_CompanyPlants
		ENDIF
	ENDIF
	RETURN

*--------------------------------------------------------------------
FUNCTION CompanyReport_GetPlant
	LPARAMETERS tcPlantCode
	LOCAL lcKey, loPlant

	= CompanyReport_EnsureData()
	lcKey = UPPER(ALLTRIM(EVL(tcPlantCode, "")))
	IF EMPTY(lcKey) OR VARTYPE(goCompanyPlants) # "O"
		RETURN .NULL.
	ENDIF
	loPlant = .NULL.
	TRY
		loPlant = goCompanyPlants.Item(lcKey)
	CATCH
		loPlant = .NULL.
	ENDTRY
	RETURN loPlant

*--------------------------------------------------------------------
FUNCTION CompanyReport_ShortName
	LOCAL lc

	= CompanyReport_EnsureData()
	lc = ""
	IF VARTYPE(goCompany) = "O" AND PEMSTATUS(goCompany, "ShortName", 5)
		lc = ALLTRIM(goCompany.ShortName)
	ENDIF
	IF EMPTY(lc)
		lc = CompanyReport_LegalName()
	ENDIF
	RETURN lc

*--------------------------------------------------------------------
FUNCTION CompanyReport_LegalName
	LOCAL lc

	= CompanyReport_EnsureData()
	lc = ""
	IF VARTYPE(goCompany) = "O" AND PEMSTATUS(goCompany, "LegalName", 5)
		lc = ALLTRIM(goCompany.LegalName)
	ENDIF
	RETURN EVL(lc, "Space Alloys USA")

*--------------------------------------------------------------------
FUNCTION CompanyReport_Name
	LOCAL lc

	= CompanyReport_EnsureData()
	lc = ""
	IF VARTYPE(goCompany) = "O"
		lc = EVL(ALLTRIM(goCompany.LegalName), ALLTRIM(goCompany.DBAName))
	ENDIF
	RETURN EVL(lc, CompanyReport_LegalName())

*--------------------------------------------------------------------
FUNCTION CompanyReport_ResaleCertEmail
	LOCAL lc

	= CompanyReport_EnsureData()
	lc = ""
	IF VARTYPE(goCompany) = "O"
		IF PEMSTATUS(goCompany, "QualityEmail", 5)
			lc = ALLTRIM(goCompany.QualityEmail)
		ENDIF
		IF EMPTY(lc) AND PEMSTATUS(goCompany, "SalesEmail", 5)
			lc = ALLTRIM(goCompany.SalesEmail)
		ENDIF
	ENDIF
	RETURN lc

*--------------------------------------------------------------------
FUNCTION CompanyReport_Tagline
	LOCAL lc

	= CompanyReport_EnsureData()
	lc = ""
	IF VARTYPE(goCompany) = "O" AND PEMSTATUS(goCompany, "Tagline", 5)
		lc = ALLTRIM(goCompany.Tagline)
	ENDIF
	RETURN lc

*--------------------------------------------------------------------
FUNCTION CompanyReport_CertTitle
	LOCAL lc

	= CompanyReport_EnsureData()
	lc = ""
	IF VARTYPE(goCompany) = "O" AND PEMSTATUS(goCompany, "CertHeaderText", 5)
		lc = ALLTRIM(goCompany.CertHeaderText)
	ENDIF
	RETURN EVL(lc, "Material Certification Report")

*--------------------------------------------------------------------
FUNCTION CompanyReport_CertifyText
	LOCAL lc

	= CompanyReport_EnsureData()
	lc = ""
	IF VARTYPE(goCompany) = "O" AND PEMSTATUS(goCompany, "CertCertifyText", 5)
		lc = ALLTRIM(goCompany.CertCertifyText)
	ENDIF
	RETURN lc

*--------------------------------------------------------------------
FUNCTION CompanyReport_FooterText
	LOCAL lc

	= CompanyReport_EnsureData()
	lc = ""
	IF VARTYPE(goCompany) = "O" AND PEMSTATUS(goCompany, "CertFooterText", 5)
		lc = ALLTRIM(goCompany.CertFooterText)
	ENDIF
	RETURN lc

*--------------------------------------------------------------------
FUNCTION CompanyReport_PlantLine
	LPARAMETERS tcPlantCode
	LOCAL lo, lc

	lo = CompanyReport_GetPlant(tcPlantCode)
	IF VARTYPE(lo) # "O"
		RETURN ""
	ENDIF
	lc = ALLTRIM(lo.CertReportLine)
	IF !EMPTY(lc)
		RETURN lc
	ENDIF
	lc = ALLTRIM(lo.Addr1)
	IF !EMPTY(lo.Addr2)
		lc = lc + ", " + ALLTRIM(lo.Addr2)
	ENDIF
	IF !EMPTY(lo.City)
		lc = lc + ", " + ALLTRIM(lo.City)
		IF !EMPTY(lo.StateCode)
			lc = lc + ", " + ALLTRIM(lo.StateCode)
		ENDIF
		IF !EMPTY(lo.PostalCode)
			lc = lc + " " + ALLTRIM(lo.PostalCode)
		ENDIF
	ENDIF
	RETURN lc

*--------------------------------------------------------------------
FUNCTION CompanyReport_Phone
	LPARAMETERS tcPlantCode
	LOCAL lo, lc

	lo = CompanyReport_GetPlant(EVL(tcPlantCode, "WINDFALL"))
	IF VARTYPE(lo) = "O" AND !EMPTY(lo.Phone)
		lc = ALLTRIM(lo.Phone)
		RETURN IIF(LEFT(UPPER(lc), 3) = "PH:", lc, "PH: " + lc)
	ENDIF
	RETURN ""

*--------------------------------------------------------------------
FUNCTION CompanyReport_Fax
	LPARAMETERS tcPlantCode
	LOCAL lo, lc

	lo = CompanyReport_GetPlant(EVL(tcPlantCode, "WINDFALL"))
	IF VARTYPE(lo) = "O" AND !EMPTY(lo.Fax)
		lc = ALLTRIM(lo.Fax)
		RETURN IIF(LEFT(UPPER(lc), 3) = "FX:", lc, "FX: " + lc)
	ENDIF
	RETURN ""

*--------------------------------------------------------------------
FUNCTION CompanyReport_Cage
	LPARAMETERS tcPlantCode
	LOCAL lo, lc

	lo = CompanyReport_GetPlant(tcPlantCode)
	IF VARTYPE(lo) # "O"
		RETURN ""
	ENDIF
	lc = ALLTRIM(lo.CageCode)
	IF EMPTY(lc) AND VARTYPE(goCompany) = "O" AND PEMSTATUS(goCompany, "CageCode", 5)
		lc = ALLTRIM(goCompany.CageCode)
	ENDIF
	IF EMPTY(lc)
		RETURN ""
	ENDIF
	RETURN IIF(UPPER(LEFT(lc, 5)) = "CAGE ", lc, "CAGE " + lc)

*--------------------------------------------------------------------
FUNCTION CompanyReport_Bmp
	LOCAL lcPath

	IF !"COMPANY_BRANDING" $ UPPER(SET("PROCEDURE"))
		IF FILE("PROGS\company_branding.prg")
			SET PROCEDURE TO PROGS\company_branding.prg ADDITIVE
		ENDIF
	ENDIF
	lcPath = GetCompanyBmpPath()
	IF !EMPTY(lcPath) AND FILE(lcPath)
		RETURN lcPath
	ENDIF
	RETURN ""

*--------------------------------------------------------------------
FUNCTION CompanyReport_Logo
	* Legacy name — reports should use CompanyReport_Bmp()
	RETURN CompanyReport_Bmp()

