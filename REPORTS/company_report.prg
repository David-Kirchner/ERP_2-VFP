*====================================================================
* REPORTS\company_report.prg — CompanyProfile / CompanyPlant UDFs for FRX expressions
* Design reference: Reports\certs11.frx
* Expression guide: REPORTS\COMPANY_REPORTS.md
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
	lcPath = GetCompanyReportBmpPath()
	IF !EMPTY(lcPath) AND FILE(lcPath)
		RETURN lcPath
	ENDIF
	IF TYPE("CompanyBranding_ReportLogoMemPath") = "F"
		lcPath = CompanyBranding_ReportLogoMemPath()
		IF FILE(lcPath)
			RETURN lcPath
		ENDIF
	ENDIF
	RETURN ""

*--------------------------------------------------------------------
FUNCTION CompanyReport_Logo
	* Legacy name — reports should use CompanyReport_Bmp()
	RETURN CompanyReport_Bmp()

*--------------------------------------------------------------------
* BillTo* / ShipTo* = dbo.CompanyProfile (company defaults via goCompany).
* dbo.ShipAddr = customer ship-to addresses (sales orders, POs, etc.).
*--------------------------------------------------------------------
FUNCTION CompanyReport_AddressField
	LPARAMETERS tcWhich, tcField
	LOCAL lcVal

	= CompanyReport_EnsureData()
	lcVal = ""
	IF VARTYPE(goCompany) # "O"
		RETURN ""
	ENDIF
	tcWhich = UPPER(ALLTRIM(EVL(tcWhich, "")))
	tcField = ALLTRIM(EVL(tcField, ""))
	DO CASE
	CASE tcWhich == "BILL"
		IF PEMSTATUS(goCompany, "BillTo" + tcField, 5)
			lcVal = ALLTRIM(EVALUATE("goCompany.BillTo" + tcField))
		ENDIF
	CASE tcWhich == "SHIP"
		IF PEMSTATUS(goCompany, "ShipTo" + tcField, 5)
			lcVal = ALLTRIM(EVALUATE("goCompany.ShipTo" + tcField))
		ENDIF
	ENDCASE
	RETURN lcVal

*--------------------------------------------------------------------
FUNCTION CompanyReport_BillToLine
	LPARAMETERS tnLine
	RETURN CompanyReport_AddressLine("BILL", tnLine)

*--------------------------------------------------------------------
FUNCTION CompanyReport_ShipToLine
	LPARAMETERS tnLine
	RETURN CompanyReport_AddressLine("SHIP", tnLine)

*--------------------------------------------------------------------
* BILL vs SHIP from PO ShipWhere (1=Billing, 5=Profile Ship) or seeded POShipAddr (1/2).
FUNCTION CompanyReport_WhichFromPO
	LPARAMETERS tnShipWhere, tnPOShipAddr
	LOCAL lnWhere, lnAddr

	lnWhere = IIF(VARTYPE(tnShipWhere) = "N", tnShipWhere, 0)
	lnAddr = IIF(VARTYPE(tnPOShipAddr) = "N", tnPOShipAddr, 0)
	DO CASE
	CASE lnWhere = 1
		RETURN "BILL"
	CASE lnWhere = 5
		RETURN "SHIP"
	CASE lnAddr = 1
		RETURN "BILL"
	CASE lnAddr = 2
		RETURN "SHIP"
	OTHERWISE
		RETURN "SHIP"
	ENDCASE

*--------------------------------------------------------------------
* Company Profile Addresses tab Phone for BILL/SHIP (or PO ShipWhere/POShipAddr).
FUNCTION CompanyReport_AddrPhone
	LPARAMETERS tcWhich
	RETURN CompanyReport_AddressField(EVL(tcWhich, "SHIP"), "Phone")

*--------------------------------------------------------------------
* Prefer BillToFax/ShipToFax when present; else CompanyProfile.Fax; else plant Fax.
FUNCTION CompanyReport_AddrFax
	LPARAMETERS tcWhich
	LOCAL lc, lcWhich, lo

	lcWhich = UPPER(ALLTRIM(EVL(tcWhich, "SHIP")))
	lc = CompanyReport_AddressField(lcWhich, "Fax")
	IF !EMPTY(lc)
		RETURN lc
	ENDIF
	= CompanyReport_EnsureData()
	IF VARTYPE(goCompany) = "O" AND PEMSTATUS(goCompany, "Fax", 5)
		lc = ALLTRIM(goCompany.Fax)
		IF !EMPTY(lc)
			RETURN lc
		ENDIF
	ENDIF
	lo = CompanyReport_GetPlant("WINDFALL")
	IF VARTYPE(lo) = "O" AND !EMPTY(lo.Fax)
		RETURN ALLTRIM(lo.Fax)
	ENDIF
	RETURN ""

*--------------------------------------------------------------------
FUNCTION CompanyReport_Website
	LOCAL lc, lcHref

	= CompanyReport_EnsureData()
	lc = ""
	IF VARTYPE(goCompany) = "O" AND PEMSTATUS(goCompany, "Website", 5)
		lc = ALLTRIM(goCompany.Website)
	ENDIF
	RETURN lc

*--------------------------------------------------------------------
* HTML-safe website link (or plain text) for email banners.
FUNCTION CompanyReport_WebsiteHtml
	LOCAL lc, lcHref, lcDisp

	lc = CompanyReport_Website()
	IF EMPTY(lc)
		RETURN ""
	ENDIF
	lcDisp = STRTRAN(lc, ["], [])
	lcHref = lcDisp
	IF ATC("://", lcHref) = 0
		lcHref = "https://" + STRTRAN(lcHref, "\", "/")
	ENDIF
	RETURN [<a href="] + lcHref + [">] + lcDisp + [</a>]

*--------------------------------------------------------------------
* PO footer: where vendors send invoices (Company Profile Identity).
FUNCTION CompanyReport_InvoiceSendLine
	LOCAL lc
	= CompanyReport_EnsureData()
	lc = ""
	IF VARTYPE(goCompany) = "O" AND PEMSTATUS(goCompany, "InvoiceSendLine", 5)
		lc = ALLTRIM(NVL(goCompany.InvoiceSendLine, ""))
	ENDIF
	IF EMPTY(lc)
		lc = "Send invoices to AP@SpaceAlloysUSA.com or mail to POBox 40 Tipton, IN 46072"
	ENDIF
	RETURN lc

*--------------------------------------------------------------------
* PO footer: where vendors send material certifications (Company Profile Identity).
FUNCTION CompanyReport_MaterialCertSendLine
	LOCAL lc
	= CompanyReport_EnsureData()
	lc = ""
	IF VARTYPE(goCompany) = "O" AND PEMSTATUS(goCompany, "MaterialCertSendLine", 5)
		lc = ALLTRIM(NVL(goCompany.MaterialCertSendLine, ""))
	ENDIF
	IF EMPTY(lc)
		lc = "Please send all material certifications to MTR@SpaceAlloysUSA.com"
	ENDIF
	RETURN lc

*--------------------------------------------------------------------
FUNCTION CompanyReport_AddressLine
	LPARAMETERS tcWhich, tnLine
	LOCAL laLines[6], i, lcCityLine, lcPhone, lnWant, lnGot

	IF VARTYPE(tnLine) # "N" OR tnLine < 1
		RETURN ""
	ENDIF
	= CompanyReport_EnsureData()
	laLines[1] = CompanyReport_AddressField(tcWhich, "Company")
	laLines[2] = CompanyReport_AddressField(tcWhich, "Addr1")
	laLines[3] = CompanyReport_AddressField(tcWhich, "Addr2")
	lcCityLine = ALLTRIM(CompanyReport_AddressField(tcWhich, "City"))
	IF !EMPTY(CompanyReport_AddressField(tcWhich, "State"))
		lcCityLine = ALLTRIM(lcCityLine + IIF(EMPTY(lcCityLine), "", ", ") + CompanyReport_AddressField(tcWhich, "State"))
	ENDIF
	IF !EMPTY(CompanyReport_AddressField(tcWhich, "Postal"))
		lcCityLine = ALLTRIM(lcCityLine + IIF(EMPTY(lcCityLine), "", " ") + CompanyReport_AddressField(tcWhich, "Postal"))
	ENDIF
	laLines[4] = lcCityLine
	laLines[5] = CompanyReport_AddressField(tcWhich, "Country")
	lcPhone = CompanyReport_AddressField(tcWhich, "Phone")
	laLines[6] = IIF(EMPTY(lcPhone), "", IIF(LEFT(UPPER(lcPhone), 3) = "PH:", lcPhone, "PH: " + lcPhone))
	lnWant = tnLine
	lnGot = 0
	FOR i = 1 TO ALEN(laLines)
		IF !EMPTY(laLines[i])
			lnGot = lnGot + 1
			IF lnGot = lnWant
				RETURN laLines[i]
			ENDIF
		ENDIF
	ENDFOR
	RETURN ""
