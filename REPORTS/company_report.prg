*====================================================================
* REPORTS\company_report.prg — CompanyProfile / CompanyPlant UDFs for FRX expressions
* Design reference: Reports\certs11.frx
* Expression guide: REPORTS\COMPANY_REPORTS.md
*====================================================================

*--------------------------------------------------------------------
FUNCTION CompanyReport_EnsureData
	LOCAL lcHome, lcProf, lcPlant

	lcHome = ""
	IF TYPE("gERPAppHome") = "C" AND !EMPTY(gERPAppHome)
		lcHome = ADDBS(gERPAppHome)
	ENDIF

	IF VARTYPE(goCompany) # "O"
		lcProf = "PROGS\load_CompanyProfile.prg"
		IF !FILE(lcProf) AND !EMPTY(lcHome) AND FILE(lcHome + lcProf)
			lcProf = lcHome + "PROGS\load_CompanyProfile.prg"
		ENDIF
		IF FILE(lcProf)
			DO (lcProf)
		ENDIF
	ENDIF
	IF VARTYPE(goCompanyPlants) # "O"
		lcPlant = "PROGS\load_CompanyPlants.prg"
		IF !FILE(lcPlant) AND !EMPTY(lcHome) AND FILE(lcHome + lcPlant)
			lcPlant = lcHome + "PROGS\load_CompanyPlants.prg"
		ENDIF
		IF FILE(lcPlant)
			DO (lcPlant)
		ENDIF
	ENDIF
	RETURN

*--------------------------------------------------------------------
* Strip VFP/SQL nulls and the literal ".NULL." / "NULL" that TRANSFORM/ALLTRIM produce.
FUNCTION CompanyReport_NzText
	LPARAMETERS tuVal
	LOCAL lc

	IF VARTYPE(tuVal) = "U" OR ISNULL(tuVal)
		RETURN ""
	ENDIF
	IF VARTYPE(tuVal) = "C" OR VARTYPE(tuVal) = "M"
		lc = ALLTRIM(tuVal)
	ELSE
		lc = ALLTRIM(TRANSFORM(tuVal))
	ENDIF
	IF EMPTY(lc)
		RETURN ""
	ENDIF
	IF UPPER(lc) == "NULL" OR UPPER(lc) == ".NULL." OR lc == ".NULL."
		RETURN ""
	ENDIF
	RETURN lc

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
		lc = CompanyReport_NzText(goCompany.ShortName)
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
		lc = CompanyReport_NzText(goCompany.LegalName)
	ENDIF
	RETURN EVL(lc, "Space Alloys USA")

*--------------------------------------------------------------------
FUNCTION CompanyReport_Name
	LOCAL lc

	= CompanyReport_EnsureData()
	lc = ""
	IF VARTYPE(goCompany) = "O"
		lc = EVL(CompanyReport_NzText(goCompany.LegalName), CompanyReport_NzText(goCompany.DBAName))
	ENDIF
	RETURN EVL(lc, CompanyReport_LegalName())

*--------------------------------------------------------------------
FUNCTION CompanyReport_ResaleCertEmail
	LOCAL lc

	= CompanyReport_EnsureData()
	lc = ""
	IF VARTYPE(goCompany) = "O"
		IF PEMSTATUS(goCompany, "QualityEmail", 5)
			lc = CompanyReport_NzText(goCompany.QualityEmail)
		ENDIF
		IF EMPTY(lc) AND PEMSTATUS(goCompany, "SalesEmail", 5)
			lc = CompanyReport_NzText(goCompany.SalesEmail)
		ENDIF
	ENDIF
	RETURN lc

*--------------------------------------------------------------------
FUNCTION CompanyReport_Tagline
	LOCAL lc

	= CompanyReport_EnsureData()
	lc = ""
	IF VARTYPE(goCompany) = "O" AND PEMSTATUS(goCompany, "Tagline", 5)
		lc = CompanyReport_NzText(goCompany.Tagline)
	ENDIF
	RETURN lc

*--------------------------------------------------------------------
FUNCTION CompanyReport_CertTitle
	LOCAL lc

	= CompanyReport_EnsureData()
	lc = ""
	IF VARTYPE(goCompany) = "O" AND PEMSTATUS(goCompany, "CertHeaderText", 5)
		lc = CompanyReport_NzText(goCompany.CertHeaderText)
	ENDIF
	RETURN EVL(lc, "Material Certification Report")

*--------------------------------------------------------------------
FUNCTION CompanyReport_CertifyText
	LOCAL lc

	= CompanyReport_EnsureData()
	lc = ""
	IF VARTYPE(goCompany) = "O" AND PEMSTATUS(goCompany, "CertCertifyText", 5)
		lc = CompanyReport_NzText(goCompany.CertCertifyText)
	ENDIF
	RETURN lc

*--------------------------------------------------------------------
FUNCTION CompanyReport_FooterText
	LOCAL lc

	= CompanyReport_EnsureData()
	lc = ""
	IF VARTYPE(goCompany) = "O" AND PEMSTATUS(goCompany, "CertFooterText", 5)
		lc = CompanyReport_NzText(goCompany.CertFooterText)
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
	lc = CompanyReport_NzText(lo.CertReportLine)
	IF !EMPTY(lc)
		RETURN lc
	ENDIF
	lc = CompanyReport_NzText(lo.Addr1)
	IF !EMPTY(CompanyReport_NzText(lo.Addr2))
		lc = lc + ", " + CompanyReport_NzText(lo.Addr2)
	ENDIF
	IF !EMPTY(CompanyReport_NzText(lo.City))
		lc = lc + ", " + CompanyReport_NzText(lo.City)
		IF !EMPTY(CompanyReport_NzText(lo.StateCode))
			lc = lc + ", " + CompanyReport_NzText(lo.StateCode)
		ENDIF
		IF !EMPTY(CompanyReport_NzText(lo.PostalCode))
			lc = lc + " " + CompanyReport_NzText(lo.PostalCode)
		ENDIF
	ENDIF
	RETURN lc

*--------------------------------------------------------------------
FUNCTION CompanyReport_Phone
	LPARAMETERS tcPlantCode
	LOCAL lo, lc

	lo = CompanyReport_GetPlant(EVL(tcPlantCode, "WINDFALL"))
	IF VARTYPE(lo) = "O"
		lc = CompanyReport_NzText(lo.Phone)
		IF !EMPTY(lc)
			RETURN IIF(LEFT(UPPER(lc), 3) = "PH:", lc, "PH: " + lc)
		ENDIF
	ENDIF
	RETURN ""

*--------------------------------------------------------------------
FUNCTION CompanyReport_Fax
	LPARAMETERS tcPlantCode
	LOCAL lo, lc

	lo = CompanyReport_GetPlant(EVL(tcPlantCode, "WINDFALL"))
	IF VARTYPE(lo) = "O"
		lc = CompanyReport_NzText(lo.Fax)
		IF !EMPTY(lc)
			RETURN IIF(LEFT(UPPER(lc), 3) = "FX:", lc, "FX: " + lc)
		ENDIF
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
	lc = CompanyReport_NzText(lo.CageCode)
	IF EMPTY(lc) AND VARTYPE(goCompany) = "O" AND PEMSTATUS(goCompany, "CageCode", 5)
		lc = CompanyReport_NzText(goCompany.CageCode)
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
	LOCAL lcVal, xVal

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
			xVal = EVALUATE("goCompany.BillTo" + tcField)
		ENDIF
	CASE tcWhich == "SHIP"
		IF PEMSTATUS(goCompany, "ShipTo" + tcField, 5)
			xVal = EVALUATE("goCompany.ShipTo" + tcField)
		ENDIF
	ENDCASE
	IF TYPE("xVal") = "U" OR ISNULL(xVal)
		RETURN ""
	ENDIF
	RETURN CompanyReport_NzText(xVal)

*--------------------------------------------------------------------
FUNCTION CompanyReport_BillToLine
	LPARAMETERS tnLine
	RETURN CompanyReport_AddressLine("BILL", tnLine)

*--------------------------------------------------------------------
* City, ST ZIP Country on one line (matches purchaseorder14 ShipAddr city field).
FUNCTION CompanyReport_CityStZip
	LPARAMETERS tcWhich
	LOCAL lcCityLine, lcWhich

	lcWhich = UPPER(ALLTRIM(EVL(tcWhich, "BILL")))
	= CompanyReport_EnsureData()
	lcCityLine = ALLTRIM(CompanyReport_AddressField(lcWhich, "City"))
	IF !EMPTY(CompanyReport_AddressField(lcWhich, "State"))
		lcCityLine = ALLTRIM(lcCityLine + IIF(EMPTY(lcCityLine), "", ", ") + CompanyReport_AddressField(lcWhich, "State"))
	ENDIF
	IF !EMPTY(CompanyReport_AddressField(lcWhich, "Postal"))
		lcCityLine = ALLTRIM(lcCityLine + IIF(EMPTY(lcCityLine), "", " ") + CompanyReport_AddressField(lcWhich, "Postal"))
	ENDIF
	IF !EMPTY(CompanyReport_AddressField(lcWhich, "Country"))
		lcCityLine = ALLTRIM(lcCityLine + IIF(EMPTY(lcCityLine), "", " ") + CompanyReport_AddressField(lcWhich, "Country"))
	ENDIF
	RETURN lcCityLine

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
		lc = CompanyReport_NzText(goCompany.Fax)
		IF !EMPTY(lc)
			RETURN lc
		ENDIF
	ENDIF
	lo = CompanyReport_GetPlant("WINDFALL")
	IF VARTYPE(lo) = "O"
		lc = CompanyReport_NzText(lo.Fax)
		IF !EMPTY(lc)
			RETURN lc
		ENDIF
	ENDIF
	RETURN ""

*--------------------------------------------------------------------
FUNCTION CompanyReport_Website
	LOCAL lc, lcHref

	= CompanyReport_EnsureData()
	lc = ""
	IF VARTYPE(goCompany) = "O" AND PEMSTATUS(goCompany, "Website", 5)
		lc = CompanyReport_NzText(goCompany.Website)
	ENDIF
	RETURN lc

*--------------------------------------------------------------------
FUNCTION CompanyReport_SalesEmail
	LOCAL lc
	= CompanyReport_EnsureData()
	lc = ""
	IF VARTYPE(goCompany) = "O" AND PEMSTATUS(goCompany, "SalesEmail", 5)
		lc = CompanyReport_NzText(goCompany.SalesEmail)
	ENDIF
	RETURN lc

*--------------------------------------------------------------------
* PO header: "PHONE …" from Company Profile Addresses (Bill), else plant.
FUNCTION CompanyReport_PoHeaderPhone
	LOCAL lc
	lc = CompanyReport_NzText(CompanyReport_AddrPhone("BILL"))
	IF EMPTY(lc)
		lc = CompanyReport_NzText(CompanyReport_AddrPhone("SHIP"))
	ENDIF
	IF EMPTY(lc)
		lc = STRTRAN(CompanyReport_Phone(""), "PH: ", "")
		lc = CompanyReport_NzText(STRTRAN(lc, "PH:", ""))
	ENDIF
	IF EMPTY(lc)
		RETURN ""
	ENDIF
	lc = CompanyReport_PhoneMask(lc)
	IF LEFT(UPPER(lc), 5) = "PHONE"
		RETURN lc
	ENDIF
	RETURN "PHONE " + lc

*--------------------------------------------------------------------
* PO header: "FAX …" from Company Profile (Bill/Ship/Fax), else blank.
FUNCTION CompanyReport_PoHeaderFax
	LOCAL lc
	lc = CompanyReport_NzText(CompanyReport_AddrFax("BILL"))
	IF EMPTY(lc)
		lc = CompanyReport_NzText(CompanyReport_AddrFax("SHIP"))
	ENDIF
	IF EMPTY(lc)
		RETURN ""
	ENDIF
	lc = CompanyReport_PhoneMask(lc)
	IF LEFT(UPPER(lc), 3) = "FAX"
		RETURN lc
	ENDIF
	RETURN "FAX " + lc

*--------------------------------------------------------------------
* PO header: "Email …" from Company Profile SalesEmail (then QualityEmail).
FUNCTION CompanyReport_PoHeaderEmail
	LOCAL lc
	lc = CompanyReport_NzText(CompanyReport_SalesEmail())
	IF EMPTY(lc)
		lc = CompanyReport_NzText(CompanyReport_ResaleCertEmail())
	ENDIF
	IF EMPTY(lc)
		RETURN ""
	ENDIF
	IF LEFT(UPPER(lc), 5) = "EMAIL"
		RETURN lc
	ENDIF
	RETURN "Email " + lc

*--------------------------------------------------------------------
* Digits-only phone/fax for storage (10 US digits preferred). Strip formatting.
FUNCTION CompanyReport_PhoneDigits
	LPARAMETERS tcPhone
	LOCAL lc, i, ch, lcOut
	lc = ALLTRIM(EVL(tcPhone, ""))
	IF EMPTY(lc) OR UPPER(lc) == "NULL" OR lc == ".NULL."
		RETURN ""
	ENDIF
	* Avoid float/decimal leftovers like "5022978686.00"
	IF LEFT(lc, 1) $ "0123456789" AND ATC(".", lc) > 0 AND ATC("@", lc) = 0
		IF VAL(lc) > 0 AND ATC("E", UPPER(lc)) = 0
			lc = ALLTRIM(STR(INT(VAL(STRTRAN(lc, ",", ""))), 18, 0))
		ENDIF
	ENDIF
	lcOut = ""
	FOR i = 1 TO LEN(lc)
		ch = SUBSTR(lc, i, 1)
		IF ch $ "0123456789"
			lcOut = lcOut + ch
		ENDIF
	ENDFOR
	RETURN lcOut

*--------------------------------------------------------------------
* Display mask (123) 456-7890 when 10 digits; else return cleaned original.
FUNCTION CompanyReport_PhoneMask
	LPARAMETERS tcPhone
	LOCAL lc
	lc = CompanyReport_PhoneDigits(tcPhone)
	IF LEN(lc) = 10
		RETURN "(" + LEFT(lc, 3) + ") " + SUBSTR(lc, 4, 3) + "-" + RIGHT(lc, 4)
	ENDIF
	IF LEN(lc) = 11 AND LEFT(lc, 1) = "1"
		RETURN "(" + SUBSTR(lc, 2, 3) + ") " + SUBSTR(lc, 5, 3) + "-" + RIGHT(lc, 4)
	ENDIF
	RETURN CompanyReport_NzText(tcPhone)

*--------------------------------------------------------------------
* PO footer legal line — was hard-coded "Verification on-site by HPA …"
FUNCTION CompanyReport_PoSiteVerifyLine
	LOCAL lcName
	lcName = CompanyReport_ShortName()
	IF EMPTY(lcName)
		lcName = CompanyReport_LegalName()
	ENDIF
	RETURN "accordance with Federal Statutes.  Verification on-site by " + ;
		lcName + " or its customer may be necessary"

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
* Base Confirm-PO web URL from Company Profile (Identity). Blank = no HTML link.
FUNCTION CompanyReport_ConfirmPOUrl
	LOCAL lc
	= CompanyReport_EnsureData()
	lc = ""
	IF VARTYPE(goCompany) = "O" AND PEMSTATUS(goCompany, "ConfirmPOUrl", 5)
		lc = CompanyReport_NzText(goCompany.ConfirmPOUrl)
	ENDIF
	RETURN lc

*--------------------------------------------------------------------
* Full Confirm PO href with query params, or "" when ConfirmPOUrl is blank.
FUNCTION CompanyReport_ConfirmPOHref
	LPARAMETERS tnHPAPO, tnOrderInt, tnVendCode, tnContactID
	LOCAL lcBase, lcQ

	lcBase = ALLTRIM(CompanyReport_ConfirmPOUrl())
	IF EMPTY(lcBase)
		RETURN ""
	ENDIF
	* Strip trailing ? or & so we can append query cleanly
	DO WHILE RIGHT(lcBase, 1) $ "?&"
		lcBase = LEFT(lcBase, LEN(lcBase) - 1)
	ENDDO
	lcQ = "p1=" + ALLTRIM(STR(IIF(VARTYPE(tnHPAPO) = "N", tnHPAPO, 0)))
	lcQ = lcQ + "&p2=" + ALLTRIM(STR(IIF(VARTYPE(tnOrderInt) = "N", tnOrderInt, 0)))
	lcQ = lcQ + "&p3=" + ALLTRIM(STR(IIF(VARTYPE(tnVendCode) = "N", tnVendCode, 0)))
	lcQ = lcQ + "&p4=" + ALLTRIM(STR(IIF(VARTYPE(tnContactID) = "N", tnContactID, 0)))
	IF ATC("?", lcBase) > 0
		RETURN lcBase + "&" + lcQ
	ENDIF
	RETURN lcBase + "?" + lcQ

*--------------------------------------------------------------------
FUNCTION CompanyReport_HtmlSafe
	LPARAMETERS tc
	LOCAL lc
	lc = CompanyReport_NzText(tc)
	IF EMPTY(lc)
		RETURN ""
	ENDIF
	RETURN STRTRAN(STRTRAN(lc, [&], [&amp;]), ["], [])

*--------------------------------------------------------------------
* One HTML <td> for a CompanyPlant (Windfall / Tipton footer columns).
FUNCTION CompanyReport_HtmlPlantColumn
	LPARAMETERS tcPlantCode, tcTitle, tnWidthPt
	LOCAL lo, lcHtml, lcCity, lnW, lcPhone, lcFax

	lnW = IIF(VARTYPE(tnWidthPt) = "N" AND tnWidthPt > 0, tnWidthPt, 138)
	lo = CompanyReport_GetPlant(tcPlantCode)
	lcHtml = [<td style="width: ] + ALLTRIM(STR(lnW)) + [pt; vertical-align: top; text-align: center;">]
	lcHtml = lcHtml + CompanyReport_HtmlSafe(EVL(tcTitle, tcPlantCode)) + [<br />]
	IF VARTYPE(lo) = "O"
		IF !EMPTY(CompanyReport_NzText(lo.Addr1))
			lcHtml = lcHtml + CompanyReport_HtmlSafe(lo.Addr1) + [<br />]
		ENDIF
		IF !EMPTY(CompanyReport_NzText(lo.Addr2))
			lcHtml = lcHtml + CompanyReport_HtmlSafe(lo.Addr2) + [<br />]
		ENDIF
		lcCity = CompanyReport_NzText(lo.City)
		IF !EMPTY(CompanyReport_NzText(lo.StateCode))
			lcCity = lcCity + IIF(EMPTY(lcCity), "", ", ") + CompanyReport_NzText(lo.StateCode)
		ENDIF
		IF !EMPTY(CompanyReport_NzText(lo.PostalCode))
			lcCity = lcCity + IIF(EMPTY(lcCity), "", " ") + CompanyReport_NzText(lo.PostalCode)
		ENDIF
		IF !EMPTY(lcCity)
			lcHtml = lcHtml + CompanyReport_HtmlSafe(lcCity) + [<br />]
		ENDIF
		lcHtml = lcHtml + [United States of America<br />]
		lcPhone = CompanyReport_NzText(lo.Phone)
		IF !EMPTY(lcPhone)
			lcHtml = lcHtml + [P ] + CompanyReport_HtmlSafe(lcPhone) + [<br />]
		ENDIF
		lcFax = CompanyReport_NzText(lo.Fax)
		IF !EMPTY(lcFax)
			lcHtml = lcHtml + [F ] + CompanyReport_HtmlSafe(lcFax)
		ENDIF
	ENDIF
	RETURN lcHtml + [</td>]

*--------------------------------------------------------------------
* Remit / bill-to column from Company Profile Addresses (BillTo*).
FUNCTION CompanyReport_HtmlBillRemitColumn
	LPARAMETERS tcTitle, tnWidthPt
	LOCAL lcHtml, lcCity, lnW, lc

	= CompanyReport_EnsureData()
	lnW = IIF(VARTYPE(tnWidthPt) = "N" AND tnWidthPt > 0, tnWidthPt, 126)
	lcHtml = [<td style="width: ] + ALLTRIM(STR(lnW)) + [pt; vertical-align: top; text-align: center;">]
	lcHtml = lcHtml + CompanyReport_HtmlSafe(EVL(tcTitle, "Remit to")) + [<br />]
	lc = CompanyReport_AddressField("BILL", "Company")
	IF !EMPTY(lc)
		lcHtml = lcHtml + CompanyReport_HtmlSafe(lc) + [<br />]
	ENDIF
	lc = CompanyReport_AddressField("BILL", "Addr1")
	IF !EMPTY(lc)
		lcHtml = lcHtml + CompanyReport_HtmlSafe(lc) + [<br />]
	ENDIF
	lc = CompanyReport_AddressField("BILL", "Addr2")
	IF !EMPTY(lc)
		lcHtml = lcHtml + CompanyReport_HtmlSafe(lc) + [<br />]
	ENDIF
	lcCity = CompanyReport_AddressField("BILL", "City")
	IF !EMPTY(CompanyReport_AddressField("BILL", "State"))
		lcCity = lcCity + IIF(EMPTY(lcCity), "", ", ") + CompanyReport_AddressField("BILL", "State")
	ENDIF
	IF !EMPTY(CompanyReport_AddressField("BILL", "Postal"))
		lcCity = lcCity + IIF(EMPTY(lcCity), "", " ") + CompanyReport_AddressField("BILL", "Postal")
	ENDIF
	IF !EMPTY(lcCity)
		lcHtml = lcHtml + CompanyReport_HtmlSafe(lcCity) + [<br />]
	ENDIF
	lc = CompanyReport_AddressField("BILL", "Country")
	IF EMPTY(lc)
		lc = "United States of America"
	ENDIF
	lcHtml = lcHtml + CompanyReport_HtmlSafe(lc) + [<br />]
	lc = CompanyReport_AddressField("BILL", "Phone")
	IF !EMPTY(lc)
		lcHtml = lcHtml + [P ] + CompanyReport_HtmlSafe(lc) + [<br />]
	ENDIF
	lc = CompanyReport_AddressField("BILL", "Fax")
	IF !EMPTY(lc)
		lcHtml = lcHtml + [F ] + CompanyReport_HtmlSafe(lc)
	ENDIF
	RETURN lcHtml + [</td>]

*--------------------------------------------------------------------
* Contact/ship block lines from Company Profile Bill/Ship — match purchaseorder14.frx
* (company / streets / city line only; never phone — AddressLine can promote PH: into lines 1-4).
FUNCTION CompanyReport_HtmlAddrBlock
	LPARAMETERS tcWhich
	LOCAL lcHtml, lcWhich, lcLine

	lcWhich = UPPER(ALLTRIM(EVL(tcWhich, "SHIP")))
	= CompanyReport_EnsureData()
	lcHtml = ""
	lcLine = CompanyReport_AddressField(lcWhich, "Company")
	IF !EMPTY(lcLine)
		lcHtml = lcHtml + CompanyReport_HtmlSafe(lcLine) + [<br />]
	ENDIF
	lcLine = CompanyReport_AddressField(lcWhich, "Addr1")
	IF !EMPTY(lcLine)
		lcHtml = lcHtml + CompanyReport_HtmlSafe(lcLine) + [<br />]
	ENDIF
	lcLine = CompanyReport_AddressField(lcWhich, "Addr2")
	IF !EMPTY(lcLine)
		lcHtml = lcHtml + CompanyReport_HtmlSafe(lcLine) + [<br />]
	ENDIF
	lcLine = CompanyReport_CityStZip(lcWhich)
	IF !EMPTY(lcLine)
		lcHtml = lcHtml + CompanyReport_HtmlSafe(lcLine) + [<br />]
	ENDIF
	RETURN lcHtml

*--------------------------------------------------------------------
* Three-column email footer: Windfall plant | Tipton plant | Remit (BillTo).
FUNCTION CompanyReport_HtmlEmailFooterAddrs
	LOCAL lcHtml, lcWeb

	lcHtml = [<tr>]
	lcHtml = lcHtml + CompanyReport_HtmlPlantColumn("WINDFALL", "Windfall Production Center", 138)
	lcHtml = lcHtml + CompanyReport_HtmlPlantColumn("TIPTON", "Tipton Production Center", 126)
	lcHtml = lcHtml + CompanyReport_HtmlBillRemitColumn("Remit to", 126)
	lcHtml = lcHtml + [</tr>]
	lcHtml = lcHtml + [<tr>]
	lcHtml = lcHtml + [<td class="styleTextAlignCenter" colspan="2">]
	lcWeb = CompanyReport_WebsiteHtml()
	IF !EMPTY(lcWeb)
		lcHtml = lcHtml + lcWeb
	ELSE
		lcHtml = lcHtml + [&nbsp;]
	ENDIF
	lcHtml = lcHtml + [</td>]
	lcHtml = lcHtml + [</tr>]
	RETURN lcHtml

*--------------------------------------------------------------------
* PO footer: where vendors send invoices (Company Profile Identity).
FUNCTION CompanyReport_InvoiceSendLine
	LOCAL lc
	= CompanyReport_EnsureData()
	lc = ""
	IF VARTYPE(goCompany) = "O" AND PEMSTATUS(goCompany, "InvoiceSendLine", 5)
		lc = CompanyReport_NzText(goCompany.InvoiceSendLine)
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
		lc = CompanyReport_NzText(goCompany.MaterialCertSendLine)
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
	* Same city line as purchaseorder14.frx: City, ST ZIP Country
	lcCityLine = ALLTRIM(CompanyReport_AddressField(tcWhich, "City"))
	IF !EMPTY(CompanyReport_AddressField(tcWhich, "State"))
		lcCityLine = ALLTRIM(lcCityLine + IIF(EMPTY(lcCityLine), "", ", ") + CompanyReport_AddressField(tcWhich, "State"))
	ENDIF
	IF !EMPTY(CompanyReport_AddressField(tcWhich, "Postal"))
		lcCityLine = ALLTRIM(lcCityLine + IIF(EMPTY(lcCityLine), "", " ") + CompanyReport_AddressField(tcWhich, "Postal"))
	ENDIF
	IF !EMPTY(CompanyReport_AddressField(tcWhich, "Country"))
		lcCityLine = ALLTRIM(lcCityLine + IIF(EMPTY(lcCityLine), "", " ") + CompanyReport_AddressField(tcWhich, "Country"))
	ENDIF
	laLines[4] = lcCityLine
	laLines[5] = ""
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
