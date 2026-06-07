*====================================================================
* load_ERP_Environment.prg
* Loads SQL profile (server/database) and company paths from XML.
* Sets public: gERPProfile, gGlobalServer, gGlobalDatabase, gERPSignaturesRoot
*====================================================================

FUNCTION load_ERP_Environment
LPARAMETERS tlForceReload

IF VARTYPE(tlForceReload) # "L"
	tlForceReload = .F.
ENDIF

IF VARTYPE(gERPProfile) = "C" AND NOT tlForceReload AND NOT EMPTY(gGlobalServer) ;
		AND ERP_Environment_IsValidDatabase(gGlobalDatabase)
	RETURN .T.
ENDIF

PUBLIC gERPProfile, gGlobalServer, gGlobalDatabase, gGlobalReportServer, gERPSignaturesRoot, GlobalTable

LOCAL lcRoot, lcBaseFile, lcLocalFile, lcXml, lcProfile
LOCAL lcServer, lcDatabase, lcReportServer, lcSigs, laLocal[4]
LOCAL lcSrv, lcDb, lcRpt, lcName
LOCAL i, nPos, lcChunk, lcAttr

lcRoot = ERP_Environment_GetRoot()
lcBaseFile = lcRoot + "ERP_Environment.xml"
lcLocalFile = lcRoot + "ERP_Environment.local.xml"
IF !FILE(lcLocalFile)
	lcTry = ERP_Environment_RootFromThisPrg()
	IF !EMPTY(lcTry) AND FILE(lcTry + "ERP_Environment.local.xml")
		lcLocalFile = lcTry + "ERP_Environment.local.xml"
		IF !FILE(lcBaseFile) AND FILE(lcTry + "ERP_Environment.xml")
			lcRoot = lcTry
			lcBaseFile = lcRoot + "ERP_Environment.xml"
		ENDIF
	ENDIF
ENDIF

IF NOT FILE(lcBaseFile)
	* Fallback: legacy DFS ERPdata.xml (Windfall server name only)
	ERP_Environment_LoadLegacyDFS()
	IF EMPTY(gGlobalServer)
		gGlobalServer = "SuperMicro"
		gGlobalDatabase = "ERP_1"
		gERPProfile = "Development"
	ENDIF
	RETURN .F.
ENDIF

lcXml = FILETOSTR(lcBaseFile)
lcProfile = ALLTRIM(ERP_XmlElement(lcXml, "ActiveProfile"))
lcSigs = ALLTRIM(ERP_XmlElement(lcXml, "SignaturesRoot"))

lcServer = ""
lcDatabase = ""
lcReportServer = ""

* Local overrides (ERP_Environment.local.xml) are the canonical saved SQL target
IF FILE(lcLocalFile)
	ERP_Environment_ReadLocalXml(@laLocal, lcLocalFile)
	IF !EMPTY(laLocal[1])
		lcProfile = ERP_Environment_ResolveSavedProfile(laLocal[1], laLocal[2])
	ENDIF
	IF !EMPTY(laLocal[2])
		lcServer = laLocal[2]
	ENDIF
	IF ERP_Environment_IsValidDatabase(laLocal[3])
		lcDatabase = laLocal[3]
	ENDIF
	IF !EMPTY(laLocal[4])
		lcSigs = laLocal[4]
	ENDIF
ENDIF

IF EMPTY(lcProfile)
	lcProfile = "Development"
ENDIF

* Profile preset supplies server + reportServer; database default only if not in local.xml
lcSrv = ""
lcDb = "ERP_1"
lcRpt = ""
ERP_Environment_ParseProfiles(lcBaseFile, lcProfile, @lcSrv, @lcDb, @lcRpt)
IF EMPTY(lcServer) AND !EMPTY(lcSrv)
	lcServer = lcSrv
ENDIF
IF EMPTY(lcReportServer) AND !EMPTY(lcRpt)
	lcReportServer = lcRpt
ENDIF
IF EMPTY(lcDatabase) AND !EMPTY(lcDb)
	lcDatabase = lcDb
ENDIF

* Re-apply local overrides (canonical saved server + database)
IF FILE(lcLocalFile)
	ERP_Environment_ReadLocalXml(@laLocal, lcLocalFile)
	IF !EMPTY(laLocal[1]) AND ERP_Environment_IsKnownProfile(laLocal[1])
		lcProfile = laLocal[1]
	ENDIF
	IF !EMPTY(laLocal[2])
		lcServer = laLocal[2]
	ENDIF
	IF ERP_Environment_IsValidDatabase(laLocal[3])
		lcDatabase = laLocal[3]
	ENDIF
	IF !EMPTY(laLocal[4])
		lcSigs = laLocal[4]
	ENDIF
ENDIF

* Server must be SQL host name, not catalog name (ERP_1 / ERP_2)
IF !EMPTY(lcDatabase) AND (EMPTY(lcServer) OR UPPER(ALLTRIM(lcServer)) == UPPER(ALLTRIM(lcDatabase)))
	lcSrv = ""
	lcDb = ""
	lcRpt = ""
	IF !EMPTY(lcProfile)
		ERP_Environment_ParseProfiles(lcBaseFile, lcProfile, @lcSrv, @lcDb, @lcRpt)
	ENDIF
	IF !EMPTY(lcSrv)
		lcServer = lcSrv
	ENDIF
ENDIF

* Profile name = server preset (Production / Development), not database
lcName = ERP_FindProfileForServer(lcServer)
IF !EMPTY(lcName)
	lcProfile = lcName
ENDIF
IF !EMPTY(lcProfile)
	ERP_Environment_ParseProfiles(lcBaseFile, lcProfile, @lcSrv, @lcDb, @lcRpt)
	IF !EMPTY(lcRpt)
		lcReportServer = lcRpt
	ENDIF
ENDIF

IF EMPTY(lcServer)
	ERP_Environment_LoadLegacyDFS()
ENDIF

IF EMPTY(lcServer)
	lcServer = "SuperMicro"
	lcDatabase = "ERP_1"
ENDIF

IF EMPTY(lcDatabase) OR !ERP_Environment_IsValidDatabase(lcDatabase)
	IF FILE(lcLocalFile)
		ERP_Environment_ReadLocalXml(@laLocal, lcLocalFile)
		IF ERP_Environment_IsValidDatabase(laLocal[3])
			lcDatabase = laLocal[3]
		ENDIF
	ENDIF
ENDIF
IF EMPTY(lcDatabase) OR !ERP_Environment_IsValidDatabase(lcDatabase)
	lcDatabase = "ERP_1"
ENDIF

IF EMPTY(lcReportServer)
	lcReportServer = lcServer
ENDIF

gERPProfile = lcProfile
gGlobalServer = lcServer
gGlobalDatabase = lcDatabase
gGlobalReportServer = lcReportServer
gERPSignaturesRoot = lcSigs
GlobalTable = gGlobalDatabase

RETURN .T.
ENDFUNC

*--------------------------------------------------------------------
FUNCTION ERP_Environment_GetRoot
LOCAL lcRoot, lcTry, ln
IF VARTYPE(gERPAppHome) = "C" AND !EMPTY(gERPAppHome)
	lcTry = ERP_Environment_NormalizeRoot(gERPAppHome)
	IF FILE(lcTry + "ERP_Environment.xml")
		RETURN lcTry
	ENDIF
ENDIF
IF VARTYPE(LoginAppHome) = "C" AND !EMPTY(LoginAppHome)
	lcTry = ERP_Environment_NormalizeRoot(LoginAppHome)
	IF FILE(lcTry + "ERP_Environment.xml")
		RETURN lcTry
	ENDIF
ENDIF
IF VARTYPE(LoginHome) = "C" AND !EMPTY(LoginHome)
	lcTry = ERP_Environment_NormalizeRoot(LoginHome)
	IF FILE(lcTry + "ERP_Environment.xml")
		RETURN lcTry
	ENDIF
ENDIF
* Folder that contains PROGS\load_ERP_Environment.prg (works when SET PROCEDURE is used)
lcTry = ERP_Environment_RootFromThisPrg()
IF !EMPTY(lcTry)
	RETURN lcTry
ENDIF
lcRoot = ERP_Environment_NormalizeRoot(SYS(5) + SYS(2003))
IF FILE(lcRoot + "ERP_Environment.xml")
	RETURN lcRoot
ENDIF
FOR ln = 1 TO 8
	IF LEN(lcRoot) <= 3
		EXIT
	ENDIF
	lcRoot = ADDBS(JUSTPATH(lcRoot))
	IF FILE(lcRoot + "ERP_Environment.xml")
		RETURN lcRoot
	ENDIF
ENDFOR
RETURN ERP_Environment_NormalizeRoot(SYS(5) + SYS(2003))

*--------------------------------------------------------------------
FUNCTION ERP_Environment_NormalizeRoot
LPARAMETERS tcPath
LOCAL lcRoot
lcRoot = ADDBS(ALLTRIM(tcPath))
DO CASE
CASE LOWER(JUSTFNAME(lcRoot)) == "forms"
	lcRoot = ADDBS(JUSTPATH(lcRoot))
CASE LOWER(JUSTFNAME(lcRoot)) == "libs"
	lcRoot = ADDBS(JUSTPATH(lcRoot))
CASE LOWER(JUSTFNAME(lcRoot)) == "mem"
	lcRoot = ADDBS(JUSTPATH(lcRoot))
CASE LOWER(JUSTFNAME(lcRoot)) == "menus"
	lcRoot = ADDBS(JUSTPATH(lcRoot))
CASE LOWER(JUSTFNAME(lcRoot)) == "progs"
	lcRoot = ADDBS(JUSTPATH(lcRoot))
CASE LOWER(JUSTFNAME(lcRoot)) == "reports"
	lcRoot = ADDBS(JUSTPATH(lcRoot))
CASE LOWER(JUSTFNAME(lcRoot)) == "tools"
	lcRoot = ADDBS(JUSTPATH(lcRoot))
ENDCASE
IF "\MEM\" $ UPPER(lcRoot) OR RIGHT(UPPER(lcRoot), 4) == "\MEM"
	lcRoot = ADDBS(JUSTPATH(lcRoot))
ENDIF
RETURN lcRoot

*--------------------------------------------------------------------
FUNCTION ERP_Environment_RootFromThisPrg
LOCAL lcPrg, lcRoot
lcPrg = LOWER(ALLTRIM(SYS(16,1)))
IF EMPTY(lcPrg) OR !(".PRG" $ lcPrg)
	RETURN ""
ENDIF
IF !("LOAD_ERP_ENVIRONMENT.PRG" $ lcPrg)
	RETURN ""
ENDIF
lcRoot = ADDBS(JUSTPATH(lcPrg))
IF LOWER(JUSTFNAME(lcRoot)) == "progs"
	lcRoot = ADDBS(JUSTPATH(lcRoot))
ENDIF
IF FILE(lcRoot + "ERP_Environment.xml")
	RETURN lcRoot
ENDIF
RETURN ""

*--------------------------------------------------------------------
PROCEDURE ERP_Environment_ReadLocalXml
LPARAMETERS taOut, tcLocalFile
LOCAL lcXml
DIMENSION taOut[4]
taOut[1] = ""
taOut[2] = ""
taOut[3] = ""
taOut[4] = ""
IF VARTYPE(tcLocalFile) # "C" OR EMPTY(tcLocalFile) OR NOT FILE(tcLocalFile)
	RETURN
ENDIF
lcXml = FILETOSTR(tcLocalFile)
IF EMPTY(lcXml)
	RETURN
ENDIF
taOut[1] = ALLTRIM(ERP_XmlElement(lcXml, "ActiveProfile"))
taOut[2] = ALLTRIM(ERP_XmlElement(lcXml, "Server"))
taOut[3] = ALLTRIM(ERP_XmlElement(lcXml, "Database"))
taOut[4] = ALLTRIM(ERP_XmlElement(lcXml, "SignaturesRoot"))

*--------------------------------------------------------------------
FUNCTION ERP_Environment_DebugLoad
LOCAL lcRoot, lcLocal, lcXml, lcProf, lcSrv, lcDb
lcRoot = ERP_Environment_GetRoot()
lcLocal = lcRoot + "ERP_Environment.local.xml"
lcProf = ""
lcSrv = ""
lcDb = ""
IF FILE(lcLocal)
	lcXml = FILETOSTR(lcLocal)
	lcProf = ERP_XmlElement(lcXml, "ActiveProfile")
	lcSrv = ERP_XmlElement(lcXml, "Server")
	lcDb = ERP_XmlElement(lcXml, "Database")
ENDIF
MESSAGEBOX("Root: " + lcRoot + CHR(13) ;
	+ "Local: " + lcLocal + CHR(13) ;
	+ "Local file exists: " + IIF(FILE(lcLocal), "Yes", "No") + CHR(13) ;
	+ "ActiveProfile: " + lcProf + CHR(13) ;
	+ "Server: " + lcSrv + CHR(13) ;
	+ "Database: " + lcDb, 64, "ERP Environment Debug")
RETURN lcRoot

*--------------------------------------------------------------------
FUNCTION ERP_Environment_ServerForDatabase
LPARAMETERS tcBaseFile, tcDatabase
LOCAL laProf[1], laSrv[1], laDb[1], ln, i
ln = 0
IF EMPTY(tcDatabase) OR NOT FILE(tcBaseFile)
	RETURN ""
ENDIF
ERP_Environment_ListProfiles(tcBaseFile, @laProf, @ln, @laSrv, @laDb)
FOR i = 1 TO ln
	IF UPPER(ALLTRIM(laDb[i])) == UPPER(ALLTRIM(tcDatabase)) AND !EMPTY(laSrv[i])
		RETURN laSrv[i]
	ENDIF
ENDFOR
RETURN ""

*--------------------------------------------------------------------
FUNCTION ERP_XmlElement
LPARAMETERS tcXml, tcTag
LOCAL lcOpen, lcClose, lcChunk, lcBefore, n1, n2, nPos
lcOpen = "<" + tcTag + ">"
lcClose = "</" + tcTag + ">"
n1 = 1
DO WHILE .T.
	nPos = AT(lcOpen, SUBSTR(tcXml, n1))
	IF nPos = 0
		EXIT
	ENDIF
	n1 = n1 + nPos - 1
	lcBefore = IIF(n1 > 1, SUBSTR(tcXml, n1 - 1, 1), "")
	IF lcBefore $ "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_"
		n1 = n1 + 1
		LOOP
	ENDIF
	lcChunk = SUBSTR(tcXml, n1 + LEN(lcOpen))
	n2 = AT(lcClose, lcChunk)
	IF n2 > 0
		RETURN ALLTRIM(SUBSTR(lcChunk, 1, n2 - 1))
	ENDIF
	n1 = n1 + LEN(lcOpen)
ENDDO
RETURN ""

*--------------------------------------------------------------------
PROCEDURE ERP_Environment_ParseProfiles
LPARAMETERS tcFile, tcProfile, tcServer, tcDatabase, tcReportServer
LOCAL lcXml, lcChunk, nStart, nEnd, lcName, lcSrv, lcDb, lcRpt

IF VARTYPE(tcReportServer) # "C"
	tcReportServer = ""
ENDIF

IF EMPTY(tcFile) OR NOT FILE(tcFile)
	RETURN
ENDIF

lcXml = FILETOSTR(tcFile)
nStart = 1
DO WHILE .T.
	nPos = AT('<Profile', SUBSTR(lcXml, nStart))
	IF nPos = 0
		EXIT
	ENDIF
	nStart = nStart + nPos - 1
	lcChunk = SUBSTR(lcXml, nStart)
	nEnd = AT('/>', lcChunk)
	IF nEnd = 0
		nEnd = AT('</Profile>', lcChunk)
		IF nEnd = 0
			EXIT
		ENDIF
		lcChunk = SUBSTR(lcChunk, 1, nEnd + LEN('</Profile>') - 1)
	ELSE
		lcChunk = SUBSTR(lcChunk, 1, nEnd + 1)
	ENDIF
	lcName = ERP_XmlAttr(lcChunk, "name")
	lcSrv = ERP_XmlAttr(lcChunk, "server")
	lcDb = ERP_XmlAttr(lcChunk, "database")
	lcRpt = ERP_XmlAttr(lcChunk, "reportServer")
	IF UPPER(ALLTRIM(lcName)) == UPPER(ALLTRIM(tcProfile))
		tcServer = lcSrv
		tcDatabase = lcDb
		IF !EMPTY(lcRpt)
			tcReportServer = lcRpt
		ENDIF
		RETURN
	ENDIF
	nStart = nStart + LEN(lcChunk)
ENDDO

*--------------------------------------------------------------------
FUNCTION ERP_XmlAttr
LPARAMETERS tcChunk, tcAttr
LOCAL lcPat, lcVal, n1, n2
lcPat = tcAttr + '="'
n1 = AT(lcPat, tcChunk)
IF n1 = 0
	RETURN ""
ENDIF
lcVal = SUBSTR(tcChunk, n1 + LEN(lcPat))
n2 = AT('"', lcVal)
IF n2 = 0
	RETURN ""
ENDIF
RETURN SUBSTR(lcVal, 1, n2 - 1)

*--------------------------------------------------------------------
PROCEDURE ERP_Environment_LoadLegacyDFS
LOCAL lcDFS
PUBLIC gGlobalServer, gGlobalDatabase, gERPProfile
IF VARTYPE(gGlobalServer) # "C"
	PUBLIC gGlobalServer
ENDIF
gGlobalServer = ""
gGlobalDatabase = "ERP_1"
gERPProfile = "Windfall"

RETURN

*--------------------------------------------------------------------
FUNCTION save_ERP_ActiveProfile
LPARAMETERS tcProfile, tcSignaturesRoot
LOCAL lcRoot, lcFile, lcSrv, lcDb, lcRpt, lcDatabase, lcServer, laLocal[4]
IF EMPTY(tcProfile) OR !ERP_Environment_IsKnownProfile(tcProfile)
	RETURN .F.
ENDIF
lcRoot = ERP_Environment_GetRoot()
lcFile = lcRoot + "ERP_Environment.local.xml"
lcDatabase = ""
lcServer = ""
IF FILE(lcFile)
	ERP_Environment_ReadLocalXml(@laLocal, lcFile)
	IF ERP_Environment_IsValidDatabase(laLocal[3])
		lcDatabase = laLocal[3]
	ENDIF
	lcServer = laLocal[2]
ENDIF
IF (EMPTY(lcDatabase) OR !ERP_Environment_IsValidDatabase(lcDatabase)) AND VARTYPE(gGlobalDatabase) = "C"
	lcDatabase = gGlobalDatabase
ENDIF
IF EMPTY(lcDatabase) OR !ERP_Environment_IsValidDatabase(lcDatabase)
	lcDatabase = "ERP_1"
ENDIF
lcSrv = ""
lcDb = ""
lcRpt = ""
ERP_Environment_ParseProfiles(lcRoot + "ERP_Environment.xml", tcProfile, @lcSrv, @lcDb, @lcRpt)
IF !EMPTY(lcSrv)
	lcServer = lcSrv
ENDIF
RETURN save_ERP_ServerDatabase(lcServer, lcDatabase, tcProfile)

*--------------------------------------------------------------------
FUNCTION ERP_ShowProfilePicker
LOCAL laProf[1], laSrv[1], laDb[1], laPickProf[1], laPickSrv[1]
LOCAL ln, lnPick, lcPick, i, lcFile
ln = 0
lnPick = 0
lcFile = ERP_Environment_GetRoot() + "ERP_Environment.xml"
IF FILE(lcFile)
	ERP_Environment_ListProfiles(lcFile, @laProf, @ln, @laSrv, @laDb)
ENDIF
IF ln < 1
	RETURN ""
ENDIF
lcPick = ""
FOR i = 1 TO ln
	IF ERP_Environment_IsKnownProfile(laProf[i])
		lnPick = lnPick + 1
		DIMENSION laPickProf[lnPick], laPickSrv[lnPick]
		laPickProf[lnPick] = laProf[i]
		laPickSrv[lnPick] = laSrv[i]
		lcPick = lcPick + IIF(lnPick = 1, "", CHR(13)) ;
			+ "(" + TRANSFORM(lnPick) + ") " + laPickProf[lnPick] ;
			+ "  —  " + ALLTRIM(laPickSrv[lnPick])
	ENDIF
ENDFOR
IF lnPick < 1
	RETURN ""
ENDIF
i = VAL(INPUTBOX("Select server preset (database stays as chosen):" + CHR(13) + CHR(13) + lcPick + CHR(13) + CHR(13) + "Enter number:", "ERP Server Preset", "1"))
IF i < 1 OR i > lnPick
	RETURN ""
ENDIF
RETURN laPickProf[i]

*--------------------------------------------------------------------
FUNCTION ERP_ShowServerPicker
LOCAL laList[1], ln, lcPick, i
ln = 0
ERP_Environment_ListUniqueServers(@laList, @ln)
IF ln < 1
	RETURN ""
ENDIF
lcPick = ""
FOR i = 1 TO ln
	lcPick = lcPick + IIF(i = 1, "", CHR(13)) + "(" + TRANSFORM(i) + ") " + laList[i]
ENDFOR
i = VAL(INPUTBOX("Select SQL Server:" + CHR(13) + CHR(13) + lcPick + CHR(13) + CHR(13) + "Enter number:", "ERP SQL Server", "1"))
IF i < 1 OR i > ln
	RETURN ""
ENDIF
RETURN laList[i]

*--------------------------------------------------------------------
FUNCTION ERP_ShowDatabasePicker
LOCAL laList[1], ln, lcPick, i
ln = 0
ERP_Environment_ListUniqueDatabases(@laList, @ln)
IF ln < 1
	RETURN ""
ENDIF
lcPick = ""
FOR i = 1 TO ln
	lcPick = lcPick + IIF(i = 1, "", CHR(13)) + "(" + TRANSFORM(i) + ") " + laList[i]
ENDFOR
i = VAL(INPUTBOX("Select SQL Database:" + CHR(13) + CHR(13) + lcPick + CHR(13) + CHR(13) + "Enter number:", "ERP SQL Database", "1"))
IF i < 1 OR i > ln
	RETURN ""
ENDIF
RETURN laList[i]

*--------------------------------------------------------------------
PROCEDURE ERP_Environment_ListUniqueServers
LPARAMETERS laList, lnCount
LOCAL laProf[1], laSrv[1], laDb[1], ln, i, lcSrv
lnCount = 0
DIMENSION laList[1]
laList[1] = ""
ERP_Environment_ListProfiles(ERP_Environment_GetRoot() + "ERP_Environment.xml", @laProf, @ln, @laSrv, @laDb)
FOR i = 1 TO ln
	lcSrv = ALLTRIM(laSrv[i])
	IF !EMPTY(lcSrv) AND !ERP_ListContains(@laList, lnCount, lcSrv)
		lnCount = lnCount + 1
		DIMENSION laList[lnCount]
		laList[lnCount] = lcSrv
	ENDIF
ENDFOR

*--------------------------------------------------------------------
PROCEDURE ERP_Environment_ListUniqueDatabases
LPARAMETERS laList, lnCount
ERP_Environment_ListDatabases(ERP_Environment_GetRoot() + "ERP_Environment.xml", @laList, @lnCount)

*--------------------------------------------------------------------
PROCEDURE ERP_Environment_ListDatabases
LPARAMETERS tcFile, laList, lnCount
LOCAL lcXml, n1, nPos, lcDb
lnCount = 0
DIMENSION laList[1]
laList[1] = ""
IF EMPTY(tcFile) OR NOT FILE(tcFile)
	RETURN
ENDIF
lcXml = FILETOSTR(tcFile)
n1 = 1
DO WHILE .T.
	nPos = AT("<Database>", SUBSTR(lcXml, n1))
	IF nPos = 0
		EXIT
	ENDIF
	n1 = n1 + nPos - 1
	lcDb = ALLTRIM(ERP_XmlElement(SUBSTR(lcXml, n1), "Database"))
	IF !EMPTY(lcDb) AND !ERP_ListContains(@laList, lnCount, lcDb)
		lnCount = lnCount + 1
		DIMENSION laList[lnCount]
		laList[lnCount] = lcDb
	ENDIF
	n1 = n1 + 10
ENDDO
IF lnCount < 1
	laList[1] = "ERP_1"
	laList[2] = "ERP_2"
	lnCount = 2
ENDIF

*--------------------------------------------------------------------
FUNCTION ERP_ListContains
LPARAMETERS laList, lnCount, tcValue
LOCAL i
FOR i = 1 TO lnCount
	IF UPPER(ALLTRIM(laList[i])) == UPPER(ALLTRIM(tcValue))
		RETURN .T.
	ENDIF
ENDFOR
RETURN .F.

*--------------------------------------------------------------------
FUNCTION ERP_FindProfileForServer
PARAMETERS tcServer
LOCAL laProf[1], laSrv[1], laDb[1], ln, i
ln = 0
ERP_Environment_ListProfiles(ERP_Environment_GetRoot() + "ERP_Environment.xml", @laProf, @ln, @laSrv, @laDb)
FOR i = 1 TO ln
	IF ERP_Environment_IsKnownProfile(laProf[i]) ;
			AND ERP_ServerMatches(laSrv[i], tcServer)
		RETURN laProf[i]
	ENDIF
ENDFOR
RETURN ""

*--------------------------------------------------------------------
FUNCTION ERP_ServerMatches
PARAMETERS tcProfileServer, tcServer
LOCAL lcA, lcB
lcA = UPPER(ALLTRIM(ERP_Environment_NormalizeServerName(tcProfileServer)))
lcB = UPPER(ALLTRIM(ERP_Environment_NormalizeServerName(tcServer)))
RETURN lcA == lcB

*--------------------------------------------------------------------
FUNCTION ERP_Environment_NormalizeServerName
PARAMETERS tcServer
LOCAL lcSrv
lcSrv = ALLTRIM(tcServer)
IF UPPER(lcSrv) == "SERVER26" OR UPPER(lcSrv) == "SERVER26\SERVER26"
	RETURN "Server26"
ENDIF
RETURN lcSrv

*--------------------------------------------------------------------
FUNCTION ERP_Environment_IsKnownProfile
PARAMETERS tcProfile
LOCAL lcProf
lcProf = UPPER(ALLTRIM(tcProfile))
RETURN lcProf == "PRODUCTION" OR lcProf == "DEVELOPMENT"

*--------------------------------------------------------------------
FUNCTION ERP_Environment_IsValidDatabase
PARAMETERS tcDatabase
LOCAL lcDb, laList[1], ln, i
lcDb = ALLTRIM(tcDatabase)
IF EMPTY(lcDb)
	RETURN .F.
ENDIF
IF ERP_Environment_IsKnownProfile(lcDb)
	RETURN .F.
ENDIF
ln = 0
ERP_Environment_ListDatabases(ERP_Environment_GetRoot() + "ERP_Environment.xml", @laList, @ln)
FOR i = 1 TO ln
	IF UPPER(ALLTRIM(laList[i])) == UPPER(lcDb)
		RETURN .T.
	ENDIF
ENDFOR
RETURN LEFT(UPPER(lcDb), 4) == "ERP_"

*--------------------------------------------------------------------
FUNCTION ERP_Environment_ResolveSavedProfile
PARAMETERS tcProfile, tcServer
LOCAL lcProf, lcSrv
lcProf = ALLTRIM(tcProfile)
IF ERP_Environment_IsKnownProfile(lcProf)
	RETURN lcProf
ENDIF
lcSrv = ERP_Environment_NormalizeServerName(tcServer)
IF !EMPTY(lcSrv)
	lcProf = ERP_FindProfileForServer(lcSrv)
	IF !EMPTY(lcProf)
		RETURN lcProf
	ENDIF
ENDIF
lcProf = UPPER(ALLTRIM(tcProfile))
DO CASE
CASE lcProf == "ERP_2" OR lcProf == "WINDFALL"
	RETURN "Development"
CASE lcProf == "ERP_1"
	RETURN "Production"
ENDCASE
RETURN "Development"

*--------------------------------------------------------------------
FUNCTION ERP_Environment_SqlTargetCaption
PARAMETERS tcServer, tcDatabase
LOCAL lcSrv, lcDb
lcSrv = ALLTRIM(IIF(VARTYPE(tcServer)="C", tcServer, gGlobalServer))
lcDb = ALLTRIM(IIF(VARTYPE(tcDatabase)="C", tcDatabase, gGlobalDatabase))
IF EMPTY(lcSrv) AND EMPTY(lcDb)
	RETURN ""
ENDIF
RETURN ALLTRIM(lcSrv + IIF(!EMPTY(lcDb), " / " + lcDb, ""))

*--------------------------------------------------------------------
FUNCTION save_ERP_ServerDatabase
LPARAMETERS tcServer, tcDatabase, tcProfile
LOCAL lcProf, lcRoot, lcFile, lcXml, lcSigs
IF EMPTY(tcServer) OR EMPTY(tcDatabase) OR !ERP_Environment_IsValidDatabase(tcDatabase)
	RETURN .F.
ENDIF
IF VARTYPE(tcProfile) = "C" AND !EMPTY(tcProfile) AND ERP_Environment_IsKnownProfile(tcProfile)
	lcProf = tcProfile
ELSE
	lcProf = ERP_FindProfileForServer(tcServer)
ENDIF
IF EMPTY(lcProf) AND VARTYPE(gERPProfile) = "C" AND ERP_Environment_IsKnownProfile(gERPProfile)
	lcProf = gERPProfile
ENDIF
lcRoot = ERP_Environment_GetRoot()
lcFile = lcRoot + "ERP_Environment.local.xml"
lcSigs = ""
IF VARTYPE(gERPSignaturesRoot) = "C"
	lcSigs = STRTRAN(gERPSignaturesRoot, "&", "&amp;")
ENDIF
lcXml = '<?xml version="1.0" encoding="Windows-1252" standalone="yes"?>' + CHR(13) + CHR(10)
lcXml = lcXml + "<ERPEnvironment>" + CHR(13) + CHR(10)
IF !EMPTY(lcProf)
	lcXml = lcXml + "	<ActiveProfile>" + STRTRAN(lcProf, "&", "&amp;") + "</ActiveProfile>" + CHR(13) + CHR(10)
ENDIF
lcXml = lcXml + "	<Server>" + STRTRAN(ALLTRIM(tcServer), "&", "&amp;") + "</Server>" + CHR(13) + CHR(10)
lcXml = lcXml + "	<Database>" + STRTRAN(ALLTRIM(tcDatabase), "&", "&amp;") + "</Database>" + CHR(13) + CHR(10)
IF !EMPTY(lcSigs)
	lcXml = lcXml + "	<Company>" + CHR(13) + CHR(10)
	lcXml = lcXml + "		<SignaturesRoot>" + lcSigs + "</SignaturesRoot>" + CHR(13) + CHR(10)
	lcXml = lcXml + "	</Company>" + CHR(13) + CHR(10)
ENDIF
lcXml = lcXml + "</ERPEnvironment>" + CHR(13) + CHR(10)
STRTOFILE(lcXml, lcFile)
RETURN load_ERP_Environment(.T.)

*--------------------------------------------------------------------
PROCEDURE ERP_Environment_ListProfiles
LPARAMETERS tcFile, laProf, lnCount, laSrv, laDb
LOCAL lcXml, nStart, nEnd, lcChunk, lcName, lcSrv, lcDb
lnCount = 0
DIMENSION laProf[1], laSrv[1], laDb[1]
laProf[1] = ""
laSrv[1] = ""
laDb[1] = ""
IF NOT FILE(tcFile)
	RETURN
ENDIF
lcXml = FILETOSTR(tcFile)
nStart = 1
DO WHILE .T.
	nPos = AT('<Profile', SUBSTR(lcXml, nStart))
	IF nPos = 0
		EXIT
	ENDIF
	nStart = nStart + nPos - 1
	lcChunk = SUBSTR(lcXml, nStart)
	nEnd = AT('/>', lcChunk)
	IF nEnd = 0
		EXIT
	ENDIF
	lcChunk = SUBSTR(lcChunk, 1, nEnd + 1)
	lcName = ALLTRIM(ERP_XmlAttr(lcChunk, "name"))
	lcSrv = ALLTRIM(ERP_XmlAttr(lcChunk, "server"))
	lcDb = ALLTRIM(ERP_XmlAttr(lcChunk, "database"))
	IF !EMPTY(lcName)
		lnCount = lnCount + 1
		DIMENSION laProf[lnCount], laSrv[lnCount], laDb[lnCount]
		laProf[lnCount] = lcName
		laSrv[lnCount] = lcSrv
		laDb[lnCount] = IIF(!EMPTY(lcDb), lcDb, "ERP_1")
	ENDIF
	nStart = nStart + LEN(lcChunk)
ENDDO

*--------------------------------------------------------------------
FUNCTION test_ERP_SQL_Connection
LPARAMETERS tcServer, tcDatabase
LOCAL nH, lcConn, cSrv, cDb
cSrv = IIF(VARTYPE(tcServer)="C" AND !EMPTY(tcServer), tcServer, gGlobalServer)
cDb = IIF(VARTYPE(tcDatabase)="C" AND !EMPTY(tcDatabase), tcDatabase, gGlobalDatabase)
IF EMPTY(cSrv)
	= load_ERP_Environment(.T.)
	cSrv = gGlobalServer
	cDb = gGlobalDatabase
ENDIF
lcConn = "Driver={SQL Server};Server=" + cSrv + ";Database=" + cDb + ";Trusted_Connection=yes;"
nH = SQLSTRINGCONNECT(lcConn, .T.)
IF nH > 0
	SQLDISCONNECT(nH)
	MESSAGEBOX("Connected successfully to:" + CHR(13) + cSrv + CHR(13) + "Database: " + cDb, 64, "SQL Test")
	RETURN .T.
ENDIF
MESSAGEBOX("Connection failed to:" + CHR(13) + cSrv + CHR(13) + "Database: " + cDb, 16, "SQL Test")
RETURN .F.
