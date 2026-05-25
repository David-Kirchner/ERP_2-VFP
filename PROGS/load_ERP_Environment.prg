*====================================================================
* load_ERP_Environment.prg
* Loads SQL profile (server/database) and company paths from XML.
* Sets public: gERPProfile, gGlobalServer, gGlobalDatabase, gERPSignaturesRoot
*====================================================================

LPARAMETERS tlForceReload

IF VARTYPE(tlForceReload) # "L"
	tlForceReload = .F.
ENDIF

IF VARTYPE(gERPProfile) = "C" AND NOT tlForceReload AND NOT EMPTY(gGlobalServer)
	RETURN .T.
ENDIF

LOCAL lcRoot, lcBaseFile, lcLocalFile, lcXml, lcProfile
LOCAL lcServer, lcDatabase, lcReportServer, lcSigs, i, nPos, lcChunk, lcName, lcAttr

lcRoot = ADDBS(SYS(5) + SYS(2003))
lcBaseFile = lcRoot + "ERP_Environment.xml"
lcLocalFile = lcRoot + "ERP_Environment.local.xml"

IF NOT FILE(lcBaseFile)
	* Fallback: legacy DFS ERPdata.xml (Windfall server name only)
	ERP_Environment_LoadLegacyDFS()
	IF EMPTY(gGlobalServer)
		gGlobalServer = "SuperMicro"
		gGlobalDatabase = "ERP_1"
		gERPProfile = "Production"
	ENDIF
	RETURN .F.
ENDIF

lcXml = FILETOSTR(lcBaseFile)
lcProfile = ALLTRIM(ERP_XmlElement(lcXml, "ActiveProfile"))
lcSigs = ALLTRIM(ERP_XmlElement(lcXml, "SignaturesRoot"))

IF FILE(lcLocalFile)
	lcXml = FILETOSTR(lcLocalFile)
	IF !EMPTY(ERP_XmlElement(lcXml, "ActiveProfile"))
		lcProfile = ALLTRIM(ERP_XmlElement(lcXml, "ActiveProfile"))
	ENDIF
	IF !EMPTY(ERP_XmlElement(lcXml, "SignaturesRoot"))
		lcSigs = ALLTRIM(ERP_XmlElement(lcXml, "SignaturesRoot"))
	ENDIF
ENDIF

IF EMPTY(lcProfile)
	lcProfile = "Development"
ENDIF

lcServer = ""
lcDatabase = "ERP_1"
lcReportServer = ""
ERP_Environment_ParseProfiles(lcBaseFile, lcProfile, @lcServer, @lcDatabase, @lcReportServer)

IF FILE(lcLocalFile)
	ERP_Environment_ParseProfiles(lcLocalFile, lcProfile, @lcServer, @lcDatabase, @lcReportServer)
ENDIF

IF EMPTY(lcServer)
	ERP_Environment_LoadLegacyDFS()
ENDIF

IF EMPTY(lcServer)
	lcServer = "SuperMicro"
	lcDatabase = "ERP_1"
ENDIF

IF EMPTY(lcReportServer)
	lcReportServer = lcServer
ENDIF

PUBLIC gERPProfile, gGlobalServer, gGlobalDatabase, gGlobalReportServer, gERPSignaturesRoot
gERPProfile = lcProfile
gGlobalServer = lcServer
gGlobalDatabase = lcDatabase
gGlobalReportServer = lcReportServer
gERPSignaturesRoot = lcSigs

* Alias used by SetServer and legacy code
PUBLIC GlobalTable
GlobalTable = gGlobalDatabase

RETURN .T.

*--------------------------------------------------------------------
FUNCTION ERP_XmlElement
LPARAMETERS tcXml, tcTag
LOCAL lcOpen, lcClose, n1, n2
lcOpen = "<" + tcTag + ">"
lcClose = "</" + tcTag + ">"
n1 = AT(lcOpen, tcXml)
IF n1 = 0
	RETURN ""
ENDIF
n2 = AT(lcClose, tcXml, n1)
IF n2 = 0
	RETURN ""
ENDIF
RETURN SUBSTR(tcXml, n1 + LEN(lcOpen), n2 - n1 - LEN(lcOpen))

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
	nStart = AT('<Profile', lcXml, nStart)
	IF nStart = 0
		EXIT
	ENDIF
	nEnd = AT('/>', lcXml, nStart)
	IF nEnd = 0
		nEnd = AT('</Profile>', lcXml, nStart)
		IF nEnd = 0
			EXIT
		ENDIF
		lcChunk = SUBSTR(lcXml, nStart, nEnd - nStart + LEN('</Profile>'))
	ELSE
		lcChunk = SUBSTR(lcXml, nStart, nEnd - nStart + 2)
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
LOCAL lcPat, n1, n2, lcQ
lcPat = tcAttr + '="'
n1 = AT(lcPat, tcChunk)
IF n1 = 0
	RETURN ""
ENDIF
n1 = n1 + LEN(lcPat)
n2 = AT('"', tcChunk, n1)
IF n2 = 0
	RETURN ""
ENDIF
RETURN SUBSTR(tcChunk, n1, n2 - n1)

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
LOCAL lcRoot, lcFile, lcXml, lcProf, lcSigs
IF EMPTY(tcProfile)
	RETURN .F.
ENDIF
lcRoot = ADDBS(SYS(5) + SYS(2003))
lcFile = lcRoot + "ERP_Environment.local.xml"
lcProf = STRTRAN(tcProfile, "&", "&amp;")
lcSigs = ""
IF VARTYPE(tcSignaturesRoot) = "C" AND !EMPTY(tcSignaturesRoot)
	lcSigs = STRTRAN(tcSignaturesRoot, "&", "&amp;")
ELSE
	IF VARTYPE(gERPSignaturesRoot) = "C"
		lcSigs = STRTRAN(gERPSignaturesRoot, "&", "&amp;")
	ENDIF
ENDIF
lcXml = '<?xml version="1.0" encoding="Windows-1252" standalone="yes"?>' + CHR(13) + CHR(10)
lcXml = lcXml + "<ERPEnvironment>" + CHR(13) + CHR(10)
lcXml = lcXml + "	<ActiveProfile>" + lcProf + "</ActiveProfile>" + CHR(13) + CHR(10)
IF !EMPTY(lcSigs)
	lcXml = lcXml + "	<Company>" + CHR(13) + CHR(10)
	lcXml = lcXml + "		<SignaturesRoot>" + lcSigs + "</SignaturesRoot>" + CHR(13) + CHR(10)
	lcXml = lcXml + "	</Company>" + CHR(13) + CHR(10)
ENDIF
lcXml = lcXml + "</ERPEnvironment>" + CHR(13) + CHR(10)
STRTOFILE(lcXml, lcFile)
RETURN load_ERP_Environment(.T.)

*--------------------------------------------------------------------
FUNCTION ERP_ShowProfilePicker
LOCAL laProf[1], ln, lcPick, i
ln = 0
IF FILE(ADDBS(SYS(5)+SYS(2003)) + "ERP_Environment.xml")
	ERP_Environment_ListProfiles(ADDBS(SYS(5)+SYS(2003)) + "ERP_Environment.xml", @laProf, @ln)
ENDIF
IF ln < 1
	RETURN ""
ENDIF
lcPick = ""
FOR i = 1 TO ln
	lcPick = lcPick + IIF(i=1, "", CHR(13)) + "(" + TRANSFORM(i) + ") " + laProf[i]
ENDFOR
i = VAL(INPUTBOX("Select SQL environment profile:" + CHR(13) + CHR(13) + lcPick + CHR(13) + CHR(13) + "Enter number:", "ERP SQL Profile", "1"))
IF i < 1 OR i > ln
	RETURN ""
ENDIF
RETURN laProf[i]

*--------------------------------------------------------------------
PROCEDURE ERP_Environment_ListProfiles
LPARAMETERS tcFile, laProf, lnCount
LOCAL lcXml, nStart, nEnd, lcChunk, lcName
lnCount = 0
DIMENSION laProf[1]
laProf[1] = ""
IF NOT FILE(tcFile)
	RETURN
ENDIF
lcXml = FILETOSTR(tcFile)
nStart = 1
DO WHILE .T.
	nStart = AT('<Profile', lcXml, nStart)
	IF nStart = 0
		EXIT
	ENDIF
	nEnd = AT('/>', lcXml, nStart)
	IF nEnd = 0
		EXIT
	ENDIF
	lcChunk = SUBSTR(lcXml, nStart, nEnd - nStart + 2)
	lcName = ALLTRIM(ERP_XmlAttr(lcChunk, "name"))
	IF !EMPTY(lcName)
		lnCount = lnCount + 1
		DIMENSION laProf[lnCount]
		laProf[lnCount] = lcName
	ENDIF
	nStart = nEnd + 2
ENDDO

*--------------------------------------------------------------------
FUNCTION test_ERP_SQL_Connection
LPARAMETERS tcServer, tcDatabase
LOCAL nH, lcConn, cSrv, cDb
cSrv = IIF(VARTYPE(tcServer)="C" AND !EMPTY(tcServer), tcServer, gGlobalServer)
cDb = IIF(VARTYPE(tcDatabase)="C" AND !EMPTY(tcDatabase), tcDatabase, gGlobalDatabase)
IF EMPTY(cSrv)
	DO load_ERP_Environment
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
