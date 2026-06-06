*====================================================================
* load_CompanyPlants.prg — load dbo.CompanyPlant rows for report header
* PUBLIC goCompanyPlants (Collection keyed by PlantCode)
*====================================================================

LPARAMETERS tlForceReload

IF VARTYPE(tlForceReload) # "L"
	tlForceReload = .F.
ENDIF

IF VARTYPE(goCompanyPlants) = "O" AND !tlForceReload
	RETURN .T.
ENDIF

LOCAL nConn, nRet, lcSQL, lcCode, loPlant

nConn = get_SQLSTRINGCONNECT()
IF nConn < 1
	RETURN .F.
ENDIF

lcSQL = "SELECT PlantId, PlantCode, PlantName, Addr1, Addr2, City, StateCode, PostalCode, "
lcSQL = lcSQL + "Phone, Fax, CageCode, CertReportLine "
lcSQL = lcSQL + "FROM dbo.CompanyPlant WITH (NOLOCK) WHERE IsActive = 1 ORDER BY SortOrder"
nRet = SQLEXEC(nConn, lcSQL, "curCoPlant")
IF nRet < 1
	SQLDISCONNECT(nConn)
	RETURN .F.
ENDIF

PUBLIC goCompanyPlants
goCompanyPlants = CREATEOBJECT("Collection")

IF USED("curCoPlant")
	SELECT curCoPlant
	SCAN
		lcCode = UPPER(ALLTRIM(curCoPlant.PlantCode))
		loPlant = CREATEOBJECT("Empty")
		ADDPROPERTY(loPlant, "PlantId", curCoPlant.PlantId)
		ADDPROPERTY(loPlant, "PlantCode", lcCode)
		ADDPROPERTY(loPlant, "PlantName", TRANSFORM(curCoPlant.PlantName))
		ADDPROPERTY(loPlant, "Addr1", TRANSFORM(curCoPlant.Addr1))
		ADDPROPERTY(loPlant, "Addr2", TRANSFORM(curCoPlant.Addr2))
		ADDPROPERTY(loPlant, "City", TRANSFORM(curCoPlant.City))
		ADDPROPERTY(loPlant, "StateCode", TRANSFORM(curCoPlant.StateCode))
		ADDPROPERTY(loPlant, "PostalCode", TRANSFORM(curCoPlant.PostalCode))
		ADDPROPERTY(loPlant, "Phone", TRANSFORM(curCoPlant.Phone))
		ADDPROPERTY(loPlant, "Fax", TRANSFORM(curCoPlant.Fax))
		ADDPROPERTY(loPlant, "CageCode", TRANSFORM(curCoPlant.CageCode))
		IF TYPE("curCoPlant.CertReportLine") = "M"
			ADDPROPERTY(loPlant, "CertReportLine", curCoPlant.CertReportLine)
		ELSE
			ADDPROPERTY(loPlant, "CertReportLine", TRANSFORM(curCoPlant.CertReportLine))
		ENDIF
		goCompanyPlants.Add(loPlant, lcCode)
	ENDSCAN
	USE IN curCoPlant
ENDIF

SQLDISCONNECT(nConn)
RETURN .T.
