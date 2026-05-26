*IF NOT "PROC_SETUP" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
*	SET PROCEDURE TO Progs\Proc_Setup ADDITIVE
*ENDIF 
*IF NOT "PROC_QUOTES" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
*	SET PROCEDURE TO Progs\Proc_Quotes ADDITIVE
*ENDIF 

*get_SQLSTRINGCONNECT get_SQL_ServerName 
*GetSQLServers CheckSQLConnection SetPrinterTo
*AppSetup_Login AppSetup_SalesP_Exists AppSetup_ActiveSales_SalesP AppSetup_Login_SalesP AppSetup_Get_UserName 
*AppSetup_Get_SalesP AppSetup_Get_SalesRep_SalesP
*AppSetup_Get_UserName_from_Machine AppSetup_Is_UserName_IN_Table_for_Machine
*AppSetup_Get_Machine, AppSetup_Get_Machine_Version AppSetup_10Min
*AppSetup_Get_ServerDir, AppSetup_Get_HomeDir, AppSetup_HomeDir, AppSetup_Get_Email 
*AppSetup_Get_UN_From_PRP_ANSF
*Machine_Text  Machine_Name_Init  Machine_Name
*AppSetup_Get_Active_Sales  get_Email_ServerDir get_Server_Email get_Report_Server 
*get_SQL_Path get_SQL_SendPDF_Path 
*-AppSetup_Get_DSN 
*AppSetup_TableofSalesP AppSetup_TopTableofSalesP
*ERPAppLoad Set_ERPVersion Get_ERPVersion 
*AllowERP_Version 
*AppSetup_get_LatestVersion AppSetup_get_MinVersion 
*AppSetup_Get_AutoName 
*AppSetup_Insert 
*AppSetup_Update_Ans AppSetup_Update_Version 
*AppSetup_Delete 
*AppSetup_Update_Profile_Names 
*HavePermission 

*HaveVendorApprovedPermission AllowFinalizeQuantity AllowFinalizeMoney
*AllowAdminPODelete AllowAdminPOCancel AllowAdmin AllowCertDelete 
*HaveSODeletePermission HaveSOCompletePermission HaveSOCancelPermission 
*RedundantServer getSOitemfromInvoiceDescription getHeatfromInvoiceDescription
*CollectErrors ShortSalesP

*UN_from_PRP_ANS
*ANS_from_UN_PRP


*********************************
PROCEDURE get_SQLSTRINGCONNECT 
* Found in Proc_Setup and Proc_SQL
* Return connection handle; sets gGlobalServer via load_ERP_Environment

PRIVATE nReturn, cServer, cDatabaseTable, cAlias
nReturn = 0
cAlias = ALIAS()

IF NOT FILE(SYS(5)+SYS(2003)+"PROGS\load_ERP_Environment.prg")
	SET PROCEDURE TO PROGS\load_ERP_Environment ADDITIVE
ENDIF
DO load_ERP_Environment

cServer = gGlobalServer
cDatabaseTable = gGlobalDatabase

IF VARTYPE(GlobalTable) = "C" AND NOT EMPTY(GlobalTable)
	cDatabaseTable = GlobalTable
	gGlobalDatabase = GlobalTable
ENDIF

IF EMPTY(cServer)
	MESSAGEBOX("Could not locate the SQL Server."+CHR(13)+"Check ERP_Environment.xml.",16,"SQL Error")
	TrackError("Could not locate the SQL Server.","Error.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(1),LINENO())
	nReturn = -1
ELSE
	nReturn = SQLStringConnect("Driver={SQL Server};Server="+cServer+";Database="+cDatabaseTable+";Trusted_Connection=yes;",.T.)
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ENDIF
ENDIF

IF nReturn < 0
	QUIT
ENDIF

RETURN nReturn
ENDPROC

*!*	*******
*\\Dl380pg8-2\sql\ERPdata.xml
*!*	<?xml version = "1.0" encoding="Windows-1252" standalone="yes"?>
*!*	<VFPData>
*!*		<xsd:schema id="VFPData" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:msdata="urn:schemas-microsoft-com:xml-msdata">
*!*			<xsd:element name="VFPData" msdata:IsDataSet="true">
*!*				<xsd:complexType>
*!*					<xsd:choice maxOccurs="unbounded">
*!*						<xsd:element name="ERPdata" minOccurs="0" maxOccurs="unbounded">
*!*							<xsd:complexType>
*!*								<xsd:sequence>
*!*									<xsd:element name="windfallserver">
*!*										<xsd:simpleType>
*!*											<xsd:restriction base="xsd:string">
*!*												<xsd:maxLength value="20"/>
*!*											</xsd:restriction>
*!*										</xsd:simpleType>
*!*									</xsd:element>
*!*									<xsd:element name="tiptonserver">
*!*										<xsd:simpleType>
*!*											<xsd:restriction base="xsd:string">
*!*												<xsd:maxLength value="20"/>
*!*											</xsd:restriction>
*!*										</xsd:simpleType>
*!*									</xsd:element>
*!*								</xsd:sequence>
*!*							</xsd:complexType>
*!*						</xsd:element>
*!*					</xsd:choice>
*!*					<xsd:anyAttribute namespace="http://www.w3.org/XML/1998/namespace" processContents="lax"/>
*!*				</xsd:complexType>
*!*			</xsd:element>
*!*		</xsd:schema>
*!*		<ERPdata>
*!*			<windfallserver>RAPTOR</windfallserver>
*!*			<tiptonserver>PEREGRINE</tiptonserver>
*!*		</ERPdata>
*!*	</VFPData>
*!*	****
*********************************
PROCEDURE get_SQL_ServerName 
* returns the "ServerName"
*cSQLServer = get_SQL_ServerName()
* get_SQLSTRINGCONNECT SETS gGlobalServer  
*IF VARTYPE(gGlobalServer)="C"
* "ServerName" = gGlobalServer 

PRIVATE lInWindfall,lInTipton
lInWindfall = .F.
lInTipton	= .F.

PRIVATE lFoundWindfall, lFoundWindfall2, lFoundTipton
lFoundWindfall	= .F.
lFoundWindfall2 = .F.
lFoundTipton	= .F.

PRIVATE cWindfallServer1, cTiptonServer1, cWindfallServer2, cTiptonServer2, cBackUpServer 
cWindfallServer1	= ""
cTiptonServer1		= ""
cWindfallServer2	= ""
cTiptonServer2		= ""
cBackUpServer 		= ""

**********************
*Populate SQL Server names
**********************
IF VARTYPE(gGlobalServer) != "C"
	PUBLIC gGlobalServer
	gGlobalServer = "-"
	
	*Read XML files only once	
	IF FILE( "SQL_Server.xml" )
		*READ file
		TRY
			XMLTOCURSOR( "SQL_Server.xml", 'ERPdata', 512)
			
			IF USED('ERPdata')
				IF VARTYPE( ERPdata.Server ) = "C"
					cWindfallServer1 = RTRIM(ERPdata.Server)
					gGlobalServer = cWindfallServer1 
					lFoundWindfall = .T.
				ENDIF
			ENDIF
		CATCH
			CATCH
			MESSAGEBOX("Tell IT department."+CHR(13)+CHR(13)+"ERROR Reading XML file."+CHR(13)+"Cannot write error without database!"+CHR(13)+[XMLTOCURSOR( ]+CHR(13)+["\\RAPTOR\SQL\ERPdata.xml"]+CHR(13)+[, 'ERPdata', 512)],16,"Could not get DFS file")
			*cannot write error witout database
		ENDTRY
	ENDIF

				
*!*		IF FILE( "\\RAPTOR\SQL\ERPdata.xml" )
*!*			*READ file
*!*			TRY
*!*				XMLTOCURSOR( "\\RAPTOR\SQL\ERPdata.xml", 'ERPdata', 512)
*!*				
*!*				IF USED('ERPdata')
*!*					IF VARTYPE( ERPdata.WindfallServer ) = "C"
*!*						cWindfallServer1 = RTRIM(ERPdata.WindfallServer)
*!*						gGlobalServer = cWindfallServer1 
*!*						lFoundWindfall = .T.
*!*					ENDIF
*!*					
*!*					IF VARTYPE( ERPdata.TiptonServer ) = "C"
*!*						cTiptonServer1 = RTRIM(ERPdata.TiptonServer)
*!*					ENDIF

*!*					IF VARTYPE( ERPdata.BackUpServer ) = "C"
*!*						cBackUpServer = RTRIM(ERPdata.BackUpServer)
*!*					ENDIF
*!*					
*!*					USE IN ERPdata
*!*				ENDIF
*!*			CATCH
*!*				CATCH
*!*				MESSAGEBOX("Tell IT department."+CHR(13)+CHR(13)+"ERROR Reading XML file."+CHR(13)+"Cannot write error without database!"+CHR(13)+[XMLTOCURSOR( ]+CHR(13)+["\\RAPTOR\SQL\ERPdata.xml"]+CHR(13)+[, 'ERPdata', 512)],16,"Could not get DFS file")
*!*				*cannot write error witout database!
*!*			ENDTRY
*!*		ELSE
*!*			
*!*			IF FILE( "\\Vulcan\SQL\ERPdata.xml" )
*!*				*READ file
*!*				TRY
*!*					XMLTOCURSOR( "\\Vulcan\SQL\ERPdata.xml", 'ERPdata', 512)
*!*					
*!*					IF USED('ERPdata')
*!*						IF VARTYPE( ERPdata.WindfallServer ) = "C"
*!*							cWindfallServer1 = RTRIM(ERPdata.WindfallServer)
*!*							gGlobalServer = cWindfallServer1 
*!*							lFoundWindfall = .T.
*!*						ENDIF
*!*						
*!*						
*!*						IF VARTYPE( ERPdata.TiptonServer ) = "C"
*!*							cTiptonServer1 = RTRIM(ERPdata.TiptonServer)
*!*						ENDIF

*!*						IF VARTYPE( ERPdata.BackUpServer ) = "C"
*!*							cBackUpServer = RTRIM(ERPdata.BackUpServer)
*!*						ENDIF
*!*						
*!*						USE IN HPAdata
*!*					ENDIF
*!*				CATCH
*!*					MESSAGEBOX("Tell IT department."+CHR(13)+CHR(13)+"ERROR Reading XML file."+CHR(13)+"Cannot write error without database!"+CHR(13)+[XMLTOCURSOR( ]+CHR(13)+["\\Vulcan\SQL\ERPdata.xml"]+CHR(13)+[, 'ERPdata', 512)],16,"Could not get DFS file")
*!*					*cannot write error witout database!
*!*				ENDTRY
*!*			ENDIF
*!*		ENDIF
*!*		
	*Save to MEM
	IF FILE(SYS(5)+SYS(2003) +"\SQLserver1.MEM")
		IF NOT "\MEM" $ SYS(2003)
			DELETE FILE (SYS(5)+SYS(2003) +"\SQLserver1.MEM")
			SAVE ALL LIKE cWindfallServer? TO ( SYS(5)+SYS(2003) +"\MEM\SQLserver1.MEM" )
		ENDIF
	ENDIF
	
	
	IF FILE(SYS(5)+SYS(2003) +"\SQLserver2.MEM")
		IF NOT "\MEM" $ SYS(2003)
			DELETE FILE (SYS(5)+SYS(2003) +"\SQLserver2.MEM")
			SAVE ALL LIKE cTiptonServer? TO ( SYS(5)+SYS(2003) +"\MEM\SQLserver2.MEM" )
		ENDIF
	ENDIF
	
	
ELSE
	IF FILE( SYS(5)+SYS(2003) +"\SQLserver1.MEM" )
		RESTORE FROM ( SYS(5)+SYS(2003) +"\SQLserver1.MEM" ) ADDITIVE
	ELSE
		IF FILE(SYS(5)+SYS(2003) +"\MEM\SQLserver1.MEM")
			RESTORE FROM ( SYS(5)+SYS(2003) +"\MEM\SQLserver1.MEM" ) ADDITIVE
		ENDIF
	ENDIF
	IF VARTYPE(cWindfallServer1) = "C"
		lFoundWindfall = .T.
	ENDIF
	
	IF FILE( SYS(5)+SYS(2003) +"\SQLserver2.MEM" )
		RESTORE FROM ( SYS(5)+SYS(2003) +"\SQLserver2.MEM" ) ADDITIVE
	ELSE
		IF FILE(SYS(5)+SYS(2003) +"\MEM\SQLserver2.MEM")
			RESTORE FROM ( SYS(5)+SYS(2003) +"\MEM\SQLserver2.MEM" ) ADDITIVE
		ENDIF
	ENDIF
		
	
	IF VARTYPE(cTiptonServer1) = "C"
		lFoundTipton= .T.
	ENDIF
ENDIF

***********************
*Choose Server
************************
PRIVATE cServer
cServer = ""

*gGlobalServer, gGlobalTable are init in Main.prg, Values are set in ERP menu
IF VARTYPE(gGlobalServer) = "C"
	IF NOT ( EMPTY(gGlobalServer) )
		*USE the gGlobalServer -Force -Skip the next 2 checks
		lInWindfall = .F.
		lInTipton	= .F.
	ENDIF
ENDIF

IF lInWindfall
	*Try to use the Windfall Server
	IF lFoundWindfall
		IF VARTYPE(cWindfallServer1) = "C"
			cServer = cWindfallServer1
			gGlobalServer = cServer
		ENDIF
	ELSE
		IF VARTYPE(cWindfallServer2) = "C"
			cServer = cWindfallServer2
			gGlobalServer = cServer
		ELSE
			cServer = cBackUpServer 
			gGlobalServer = cServer
		ENDIF
	ENDIF
ELSE
	IF lInTipton
		*Try to use the Tipton Server
		IF lFoundTipton
			IF VARTYPE(cTiptonServer1) = "C"
				*cServer = cTiptonServer1 
				cServer = cWindfallServer1  &&Use Windfall untill testing is done
				gGlobalServer = cServer
			ELSE
				cServer = cBackUpServer 
				gGlobalServer = cServer
			ENDIF
		ELSE
			IF VARTYPE(cTiptonServer2) = "C"
				*cServer = cTiptonServer2
				cServer = cWindfallServer1 &&Use Windfall untill testing is done
				gGlobalServer = cServer
			ELSE
				cServer = cBackUpServer 
				gGlobalServer = cServer
			ENDIF
		ENDIF
	ELSE
		*Use the Global gGlobalServer create on first run.
		IF gGlobalServer != "-"
			cServer = gGlobalServer
		ELSE
			MESSAGEBOX("Did not get SQL Server name."+CHR(13)+"\\RAPTOR --\\Vulcan\SQL\ERPdata.xml",0,"Error")
			TrackError("Did not get SQL Server name."+CHR(13)+"\\RAPTOR --\\Vulcan\SQL\ERPdata.xml","Error.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(1),LINENO())
		ENDIF
		
		IF VARTYPE(gGlobalServer) = "C"
			IF NOT ( EMPTY(gGlobalServer) )
				*USE the gGlobalServer - Skip the next 2 checks
				cServer = gGlobalServer
			ENDIF
		ENDIF
		
	ENDIF
ENDIF

IF ( EMPTY(cServer) ) AND NOT EMPTY(gGlobalServer)
	cServer = gGlobalServer
ENDIF



IF RIGHT( SYS(0), LEN(SYS(0))-AT("#",SYS(0))-1 ) = "TalkT"  &&"David Kirchner"
*	cServer = "SQLdev"
*	cServer = "BOBWHITE"
*	cServer = "PEREGRINE"
*	cServer = "SUPERMICRO\SQLEXPRESS"	
	WAIT WINDOW "Server="+cServer NOWAIT
ENDIF

RETURN cServer

ENDPROC


***********************************************************************************************
 PROCEDURE GetSQLServers
* creates cursor sqlservers - available SQL Servers on network
*DO GetSQLServers

* define constants (from sql.h, sqlext.h, odbcss.h header files)  
#DEFINE SQL_SUCCESS 0
#DEFINE MAX_STRING 128
#define SQL_HANDLE_DBC 2 
#define SQL_NTS (-3)

* DECLARE functions in WinAPI DLLs 
DECLARE SHORT SQLAllocHandle IN odbc32; 
      INTEGER   HandleType,; 
      INTEGER   InputHandle,; 
      INTEGER @ OutputHandlePtr  

DECLARE SHORT SQLBrowseConnect IN odbc32; 
      INTEGER   ConnectionHandle,; 
      STRING    InConnectionString,; 
      INTEGER   StringLength1,; 
      STRING  @ OutConnectionString,; 
      INTEGER   BufferLength,; 
      INTEGER @ StringLength2Ptr  

DECLARE SHORT SQLDisconnect IN odbc32; 
      AS SQLDisconnect32; 
      INTEGER ConnectionHandle

* initialize memvars
hdbc = 0
lnretval = 0
* get henv (ODBC environment handle) from VFP
hEnv = INT(VAL(SYS(3053)))

* call the SQLAllocHandle() function to get a connection handle
* and update memvar hdbc with this value
lnRetVal = SQLAllocHandle(2, henv, @hdbc)

* more initialization
browseresult = SPACE(128)
sizeofBrowseResult = 128
BrowseResultLen = 0

* create result cursor to hold returned server names
CREATE CURSOR sqlservers (server c(40))

* call the SQLBrowseConnect() function to get list of servers
lnRetVal2 = SQLBrowseConnect(;
      hdbc, ;
      "DRIVER={SQL Server};", ;
      SQL_NTS, ;
      @BrowseResult, ;
      sizeofBrowseResult, ;
      @BrowseResultLen)

* now parse result string and insert each server into cursor
* servers as a group are delimited in result string by curly braces: {}
* here we identify the positions of the the curly brace
* characters and put the included group of characters (the 
* list of servers) in a substring for further processing.

lnPos1 = AT('{',browseresult)
lnPos2 = AT('}',browseresult)
servstring = SUBSTR(browseresult,lnPos1+1,lnPos2-lnpos1-1)

* individual servers are separated by commas in the result string
* iterate thru servstring by "," position

DO WHILE AT(',',servstring)>0
      lnCommaPos = AT(',',servstring)
      m.Server = LEFT(servstring,lnCommaPos-1)
      IF m.server <> '.'
            INSERT INTO sqlservers FROM memvar
      ENDIF 

      * remove leftmost server name from list
      servstring = RIGHT(servstring,LEN(servstring)-lnCommaPos)

ENDDO 

* add last server in list (no more commas)
m.server = servstring
INSERT INTO sqlservers FROM memvar

* drop connection
lnretval0 = sqldisconnect32(hdbc)

* examine the results
SELECT sqlservers
BROWSE

RETURN
ENDPROC

*********************************
PROCEDURE CheckSQLConnection 
PARAMETERS pConnHandle
*nConn = CheckSQLConnection(pConnHandle)

*This is a common 'Bad SQL Connetion' initiation point
*ThisForm.nConnHandle = CheckSQLConnection(ThisForm.nConnHandle)

PRIVATE nConn

*Make sure pConnHandle is a number greater than 0
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
	ENDIF
ELSE
	nConn = get_SQLSTRINGCONNECT()
ENDIF


PRIVATE cSource
cSource = ''
TRY
	cSource = SQLGETPROP(nConn, "datasource")
CATCH
	nConn = get_SQLSTRINGCONNECT()
ENDTRY

*When SQLEXEC Fails on a connection, nSQLEXEC is FALSE!
IF VARTYPE(cSource) != "C"
	*Bad Connection
	nConn = get_SQLSTRINGCONNECT()
	IF nConn < 1
	
		*Write as Connection Error to a local dbf.
		IF !USED('Errors')
			IF "\MEM" $ SYS(2003)
				cErrorsFile =  SYS(5)+SYS(2003)+"\Errors.DBF"
			ELSE
				cErrorsFile =  SYS(5)+SYS(2003)+"\MEM\Errors.DBF"
			ENDIF
				
			IF FILE(cErrorsFile)
				SELECT 0
				USE (cErrorsFile) SHARED IN 0 ALIAS Errors
			ENDIF
		ELSE
			SELECT Errors
			*Do not try to keep Errors open, Only Open and close in same same Proc.
		ENDIF
		
		IF USED('Errors')
			PRIVATE Pnerror, Pmess1h2, Pcprogram, Pnlineno, cLastVersion, pMessMemo
			Pnerror		= 0
			Pmess1h2	= "Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1)
			Pcprogram 	= "Proc_Setup:"+PROGRAM()
			Pnlineno	= LINENO()
			cLastVersion = 'NA'
			pMessMemo	= 'Could not make SQL connection.'
			
			INSERT INTO Errors ( nerror, mess1, cprogram, nlineno, errordate, MACHINE, Revision, Memo1 );
				 VALUES ( Pnerror, Pmess1h2, Pcprogram, Pnlineno, DATETIME(), SYS(0), cLastVersion, pMessMemo)
			 
			 USE IN Errors
			 
		ENDIF
		
		MESSAGEBOX("You are not Connected to the SQL Server."+CHR(13)+"Your program will not work untill you can connet to Server."+CHR(13)+CHR(13)+"     You may have to wait for the SQL Server to restart."+CHR(13)+"     You may have lost network connection."+CHR(13)+CHR(13)+"Let the IT staff know you are not connected, "+CHR(13)+"when you cannot make a connection after repeated tries."+CHR(13)+CHR(13)+"     Your ERP cannot recover from this."+CHR(13)+"You will need to end the ERP App Process runing in Windows.",16," Not Connected.    Do not continue.    Close the program.")
	ENDIF
ENDIF

RETURN nConn
ENDPROC

********************************
PROC SetPrinterTo 
PARAMETER pPrinter

*SetPrinterTo("TIPTONSHOP")
IF VARTYPE(pPrinter) != "C"
	RETURN
ENDIF

DO CASE 
CASE pPrinter = "TIPTONSHOP"

	PRIVATE nPrinters
	nPrinters = APRINTERS(aaPrinters)
	IF nPrinters > 0

		PRIVATE lTipton
		lTipton = .F.
		FOR CT = 1 TO nPrinters
			IF "TIPTON " $ UPPER(aaPrinters(ct,1))
				TRY
					SET PRINTER TO &aaPrinters(ct,1)
					lTipton = .T.
					EXIT
				CATCH
					MESSAGEBOX("Tell David Printer '"+ALLTRIM(aaPrinters(ct,1))+"' caused an Error."+CHR(13)+"Default printer will be used.",0+48,"Printer Error")		
				FINALLY
					SET PRINTER TO DEFAULT
				ENDTRY
			ENDIF
			
		NEXT CT

		IF lTipton 
			RETURN
		ENDIF
	ENDIF


	*Otherwise use the shared Server printer

	PRIVATE lNewConn, nConn
	lNewConn  =.F.
	nConn = get_SQLSTRINGCONNECT()
	lNewConn = .T.

	PRIVATE cAlias 
	cAlias = ALIAS()

	IF USED("tmpPSp_Setup")
		USE IN tmpPSp_Setup
	ENDIF
	PRIVATE cSQL, nSQLEXEC 
	cSQL = "SELECT ANS FROM dbo.AppSetup WITH(NOLOCK) WHERE "
	cSQL = cSQL + " PRP='TIPTONSHOP' "
	SELECT 0
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSp_Setup')
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSp_Setup')
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSp_Setup")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSp_Setup")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSp_Setup')
		RecordError(nSQLEXEC,"SQL Error","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
	
	IF USED("tmpPSp_Setup")
		IF VARTYPE(tmpPSp_Setup.ANS)='C'
		
			PRIVATE cPrinterName
			cPrinterName = ALLTRIM(tmpPSp_Setup.ANS)
			cPrinterName  = PrepareSQLtxt(cPrinterName,"PrinterName",100)
			
			TRY
				SET PRINTER TO NAME &cPrinterName
			CATCH
				
				MESSAGEBOX("Tell David Printer '"+ALLTRIM(cPrinterName)+"' caused an Error."+CHR(13)+"Default printer will be used.",0+48,"Printer Error")		
			FINALLY
				SET PRINTER TO DEFAULT
			ENDTRY

			USE IN tmpPSp_Setup
		ENDIF
	ENDIF

	IF NOT EMPTY(cAlias)
		IF USED(cAlias)
			SELECT (cAlias)
		ELSE
			RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
		ENDIF
	ENDIF

	IF lNewConn 
		SQLDISCONNECT(nConn )
	ENDIF

	
	
OTHERWISE
	SET PRINTER TO DEFAULT
ENDCASE


ENDPROC

*********************************

PROCEDURE AppSetup_Login
PARAMETER pLoginUN,pLoginPC,pLoginHome,pLoginServer
*AppSetup_Login(LoginUN,LoginPC,LoginHome,LoginServer)
*See if LoginUN is in Setup App and Update table with last connect.

PRIVATE pConn

IF VARTYPE(pLoginUN) != "C"
	pLoginUN = " "
ENDIF
IF VARTYPE(pLoginPC) != "C"
	pLoginPC = " "
ENDIF
IF VARTYPE(pLoginHome) != "C"
	pLoginHome = " "
ENDIF
IF VARTYPE(pLoginServer) != "C"
	pLoginServer = " "
ENDIF

PRIVATE lReturn
lReturn = .T.

PRIVATE nConn, lNewConn
lNewConn = .F.
IF VARTYPE(pConn) = "N"
	IF pConn > 0
		nConn = pConn
	ELSE
		nConn = get_SQLSTRINGCONNECT()
		lNewConn = .T.
	ENDIF
ELSE
	nConn = get_SQLSTRINGCONNECT()
	lNewConn = .T.
ENDIF

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPSp_SQL')
	USE IN tmpPSp_SQL
ENDIF
SELECT 0

IF nConn > 0
	*See if LoginUN is in Setup App
	cSQL = "SELECT COUNT(*) AS Cntd FROM dbo.AppSetup WITH(NOLOCK) WHERE UN = '"+pLoginUN+"'"
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSp_SQL' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSp_SQL' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSp_SQL")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSp_SQL")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPSp_SQL')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
	
	IF USED('tmpPSp_SQL')
		IF tmpPSp_SQL.Cntd = 0
		
			*AppSetup_Update_Ans( (DTOC(DATE())+" "+TIME()),pLoginUN,"STABLE",nConn )
			AppSetup_Update_Ans( (DTOC(DATE())+" "+TIME()),pLoginUN,"BETA",nConn )

		ENDIF

		USE IN tmpPSp_SQL
	ENDIF
	
	*AppSetup_Update_Ans(cAns, cUN, cPRP, nConn) - Updates/Inserts Ans
	AppSetup_Update_Ans( pLoginPC,pLoginUN,"Machine",nConn  )		
	AppSetup_Update_Ans( pLoginHome,pLoginUN,"Home",nConn  )
	AppSetup_Update_Ans( pLoginServer,pLoginUN,"Server",nConn  )
	*update LoginUN with 'Last Connect'
	AppSetup_Update_Ans( DTOC(DATE())+" "+TIME(),pLoginUN,"Last Connect",nConn  )
	
	IF lNewConn 
		SQLDISCONNECT( nConn )
	ENDIF
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lReturn 
ENDPROC

*********************************

PROCEDURE AppSetup_SalesP_Exists 
PARAMETERS pSalesP
*AppSetup_SalesP_Exists(cSalesP)

IF VARTYPE(pSalesP) != "C"
	pSalesP = " "
	RETURN .F.
ENDIF

PRIVATE lReturn
lReturn = .F.

PRIVATE nConn
nConn = get_SQLSTRINGCONNECT()

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPSP_SQL2')
	USE IN tmpPSP_SQL2
ENDIF
SELECT 0

IF nConn > 0
	*See if LoginUN is in Setup App
	cSQL = "SELECT COUNT(*) AS Cntd FROM dbo.AppSetup WITH(NOLOCK) WHERE [Prp] = 'SalesP' AND [ANS] = '"+pSalesP+"'"
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL2' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL2' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL2")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL2")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPSP_SQL2')
		RecordError(nSQLEXEC,"LoginUN is NOT in Setup App" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),"LoginUN is NOT in Setup App."+CHR(13)+cSQL )
	ENDIF
	
	IF USED('tmpPSP_SQL2')
		IF tmpPSP_SQL2.Cntd > 0
			lReturn = .T.
		ELSE
			RecordError( 0, 'Error Title', "Proc_SQL:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"VFP message: No nSoldCode Parameter" )
		ENDIF

		USE IN tmpPSP_SQL2
	ENDIF
	
	SQLDISCONNECT( nConn )
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

IF pSalesP = "*"
	lReturn  = .T.
ENDIF

IF NOT lReturn 
	TrackError("Did not find SalesP '"+pSalesP+"'",cSQL,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

RETURN lReturn 
ENDPROC

*********************************

PROCEDURE AppSetup_ActiveSales_SalesP 
PARAMETERS pSalesP
*AppSetup_ActiveSales_SalesP(cSalesP)

IF VARTYPE(pSalesP) != "C"
	RETURN .F.
ENDIF
IF EMPTY(pSalesP)
	RETURN .F.
ENDIF

PRIVATE lReturn
lReturn = .F.

PRIVATE nConn
nConn = get_SQLSTRINGCONNECT()

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPSP_SQL3')
	USE IN tmpPSP_SQL3
ENDIF
SELECT 0

IF nConn > 0
	*See if LoginUN is in Setup App
	cSQL = "SELECT COUNT(*) AS Cntd FROM dbo.AppSetup WITH(NOLOCK) WHERE [Prp] = 'ActiveSales' AND [ANS] = '"+pSalesP+"'"
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL3' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL3' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL3")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL3")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPSP_SQL3')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
	
	IF USED('tmpPSP_SQL3')
		IF tmpPSP_SQL3.Cntd > 0
			lReturn = .T.
		ENDIF

		USE IN tmpPSP_SQL3
	ENDIF
	
	SQLDISCONNECT( nConn )
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

IF NOT lReturn 
*	TrackError("Did not find SalesP '"+pSalesP+"'",cSQL,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

RETURN lReturn 
ENDPROC

********************************* Check FILE \Progs\PCUser.prg
*!*	PROCEDURE PCUser
*!*	PARAMETERS cSYS0
*!*	 *cUser = PCUser( SYS(0) )
*!*	 *Strips Machine out
*!*	 *returns User name logged in 
*!*	 *Check FILE \Progs\PCUser.prg
*!*	 
*!*	IF VARTYPE(cSYS0) != "C"
*!*		cSYS0 = SYS(0)
*!*	ENDIF
*!*	 
*!*	PRIVATE cReturnUser 
*!*	cReturnUser = RIGHT( cSYS0, LEN(cSYS0)-AT("#",cSYS0)-1 )	&& 2019-01-10
*!*	 
*!*	RETURN cReturnUser 

*********************************
PROCEDURE AppSetup_Login_SalesP 
*cSalesP=AppSetup_Login_SalesP()
*Returns SalesP that logged in

PRIVATE cReturn
cReturn = ''

PRIVATE nConn
nConn = get_SQLSTRINGCONNECT()

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPSP_SQL4')
	USE IN tmpPSP_SQL4
ENDIF
SELECT 0

*suser_sname() = "WINDFALL\"+RIGHT( SYS(0), LEN(SYS(0))-AT("#",SYS(0))-1 )
PRIVATE cUserLogin 
cUserLogin = RIGHT( SYS(0), LEN(SYS(0))-AT("#",SYS(0))-1 )

IF nConn > 0
	*See if LoginUN is in Setup App
	cSQL = "SELECT ANS FROM dbo.AppSetup WITH(NOLOCK) WHERE [Prp] = 'SalesP' AND [UN] =  RIGHT( suser_sname(), LEN(suser_sname())-CHARINDEX ('\',suser_sname()) )"
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL4' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL4' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL4")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL4")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPSP_SQL4')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
	
	IF USED('tmpPSP_SQL4')
		IF RECCOUNT('tmpPSP_SQL4') > 0
			IF VARTYPE(tmpPSP_SQL4.ANS)='C'
				cReturn = ALLTRIM(tmpPSP_SQL4.ANS)
			ENDIF
		ENDIF

		USE IN tmpPSP_SQL4
	ENDIF
	
	SQLDISCONNECT( nConn )
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cReturn
ENDPROC
*********************************

PROCEDURE AppSetup_Get_UserName 
PARAMETERS pSalesP,nConn
*AppSetup_Get_UserName(pSalesP)
*returns UN from SalesP
*cSalesPerson

IF VARTYPE(pSalesP) != "C"
	RETURN ' '
ENDIF
IF LEN(pSalesP)=0
	RETURN ' '
ENDIF

PRIVATE lCloseConn
lCloseConn = .F.

PRIVATE cReturn
cReturn = pSalesP 

IF VARTYPE(nConn) != "N"
	nConn = 0 
ENDIF
IF nConn < 1
	nConn = get_SQLSTRINGCONNECT() 
	lCloseConn = .T.
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPSP_SQL5')
	USE IN tmpPSP_SQL5
ENDIF
SELECT 0

IF nConn > 0
	*Un = cUserName AND SETUP.Prp = "Machine"
	cSQL = "SELECT [UN] FROM dbo.AppSetup WITH(NOLOCK) WHERE [Prp] = 'SalesP' AND [ANS] = '"+pSalesP+"'"
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL5' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL5' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL5")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL5")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPSP_SQL5')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
	
	IF USED('tmpPSP_SQL5')
		IF RECCOUNT('tmpPSP_SQL5') > 0
			IF VARTYPE(tmpPSP_SQL5.UN) = "C"
				cReturn = ALLTRIM(tmpPSP_SQL5.UN)
			ENDIF
		ENDIF
		USE IN tmpPSP_SQL5
	ENDIF
	
	IF lCloseConn
		SQLDISCONNECT( nConn )
	ENDIF
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cReturn 
ENDPROC

*********************************

PROCEDURE AppSetup_Get_SalesP 
PARAMETERS pSalesRep 
*AppSetup_Get_SalesP(pSalesRep)
*Returns SalesP from SalesRep

IF VARTYPE(pSalesRep) != "C"
	*cUserName = LEFT(SYS(0),AT("#",SYS(0))-2)
	cUserName = ALLTRIM(  RIGHT( SYS(0) ,LEN(SYS(0))-AT("#",SYS(0))-1 )  )
ELSE
	IF EMPTY(pSalesRep)
		*cUserName = LEFT(SYS(0),AT("#",SYS(0))-2)
		cUserName = ALLTRIM(  RIGHT( SYS(0) ,LEN(SYS(0))-AT("#",SYS(0))-1 )  )
	ELSE
		cUserName = ALLTRIM( pSalesRep )
	ENDIF
ENDIF

PRIVATE cReturn
cReturn = '0'

PRIVATE nConn
nConn = get_SQLSTRINGCONNECT()

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPSP_SQL6')
	USE IN tmpPSP_SQL6
ENDIF
SELECT 0

IF nConn > 0

	*cSQL = "SELECT ANS FROM AppSetup WHERE UN = REPLACE(suser_sname(),'WINDFALL\','') AND prp = 'SalesP'"
	cSQL = "SELECT ANS FROM dbo.AppSetup WITH(NOLOCK) WHERE UN = '"+cUserName+"' AND prp = 'SalesP'"
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL6' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL6' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL6")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL6")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPSP_SQL6')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
	
	IF USED('tmpPSP_SQL6')
		IF RECCOUNT('tmpPSP_SQL6') > 0
			IF VARTYPE(tmpPSP_SQL6.ANS) = "C"
				cReturn = ALLTRIM(tmpPSP_SQL6.ANS)
			ENDIF
		ENDIF
		
		USE IN tmpPSP_SQL6
	ENDIF
	
	SQLDISCONNECT( nConn )
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN ALLTRIM(cReturn)
ENDPROC

**************************************
PROCEDURE AppSetup_Get_SalesRep_SalesP  
PARAMETERS pSalesP
*AppSetup_Get_SalesRep_SalesP(pSalesP)
*Returns SalesRep from AppSetup Table for SalesP

IF VARTYPE(pSalesP) != "C"
	RETURN ''
ENDIF

PRIVATE cReturn
cReturn = ''

PRIVATE nConn
nConn = get_SQLSTRINGCONNECT()

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPSP_SQL7')
	USE IN tmpPSP_SQL7
ENDIF
SELECT 0

IF nConn > 0

	cSQL = "SELECT UN FROM dbo.AppSetup WITH(NOLOCK) WHERE ANS = '"+pSalesP+"' AND prp = 'SalesP'"
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL7' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL7' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL7")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL7")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPSP_SQL7')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
	
	IF USED('tmpPSP_SQL7')
		IF RECCOUNT('tmpPSP_SQL7') > 0
			IF VARTYPE(tmpPSP_SQL7.UN) = "C"
				cReturn = tmpPSP_SQL7.UN
			ENDIF
		ENDIF
		
		USE IN tmpPSP_SQL7
	ENDIF
	
	SQLDISCONNECT( nConn )
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cReturn 
ENDPROC

**************************************
PROCEDURE AppSetup_Get_UserName_from_Machine 
PARAMETERS pMachine 
*AppSetup_Get_UserName_from_Machine()

*IF VARTYPE(pMachine) != "C"
*	UserName = ALLTRIM(  RIGHT( SYS(0) ,LEN(SYS(0))-AT("#",SYS(0))-1 )  )
*ENDIF
PRIVATE cMach
cMach = LEFT( SYS(0), AT("#",SYS(0))-2 )

IF VARTYPE(pMachine) = "C"
	cMach = pMachine
*	RETURN ' '
ENDIF

PRIVATE cReturn
cReturn = ''

PRIVATE nConn
nConn = get_SQLSTRINGCONNECT()

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPSP_SQL8')
	USE IN tmpPSP_SQL8
ENDIF
SELECT 0

IF nConn > 0
	*Un = cUserName AND SETUP.Prp = "Machine"
	cSQL = "SELECT [UN] FROM dbo.AppSetup WITH(NOLOCK) WHERE [Prp] = 'Machine' AND [ANS] = '"+cMach+"'"
	     
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL8' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL8' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL8")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL8")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPSP_SQL8')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
	
	IF USED('tmpPSP_SQL8')
		IF RECCOUNT('tmpPSP_SQL8') > 0
			IF VARTYPE(tmpPSP_SQL8.UN) = "C"
				cReturn = ALLTRIM(tmpPSP_SQL8.UN)
			ENDIF
		ENDIF
		
		USE IN tmpPSP_SQL8
	ENDIF
	
	SQLDISCONNECT( nConn )
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cReturn 
ENDPROC

**************************************
PROCEDURE AppSetup_Is_UserName_IN_Table_for_Machine 
PARAMETERS pMachine 
*AppSetup_Is_UserName_IN_Table_for_Machine(pMachine)

IF VARTYPE(pMachine) != "C"
	RETURN .F.
ENDIF

PRIVATE lReturn
lReturn = .F.

PRIVATE nConn
nConn = get_SQLSTRINGCONNECT()

PRIVATE cSQL, nSQLEXEC

IF USED('tmpUserNameTable')
	USE IN tmpUserNameTable 
ENDIF
SELECT 0

IF nConn > 0
	*Un = cUserName AND SETUP.Prp = "Machine"
	cSQL = "SELECT [UN] FROM dbo.AppSetup WITH(NOLOCK) WHERE [Prp] = 'Machine' AND [ANS] = '"+pMachine+"'"
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpUserNameTable' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpUserNameTable' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpUserNameTable")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpUserNameTable")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpUserNameTable')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
	
	IF USED('tmpUserNameTable')
		IF VARTYPE(tmpUserNameTable.UN) = "C"
			lReturn = .T.
		ENDIF
	ENDIF
	
	SQLDISCONNECT( nConn )
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF


RETURN lReturn
ENDPROC
*********************************

PROCEDURE AppSetup_Get_Machine 
PARAMETERS pUserName 
*AppSetup_Get_Machine(cUserName )

IF VARTYPE(pUserName) != "C"
	RETURN ' '
ENDIF
PRIVATE cUserName
cUserName = ALLTRIM(pUserName)

PRIVATE cReturn
cReturn = ''

PRIVATE nConn
nConn = get_SQLSTRINGCONNECT()

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPSP_SQL9')
	USE IN tmpPSP_SQL9
ENDIF
SELECT 0

IF nConn > 0
	*Un = cUserName AND SETUP.Prp = "Machine"
	cSQL = "SELECT [ANS] FROM dbo.AppSetup WITH(NOLOCK) WHERE [Prp] = 'Machine' AND [UN] = '"+cUserName+"'"
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL9' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL9' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL9")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL9")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPSP_SQL9')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
	
	IF USED('tmpPSP_SQL9')
		IF RECCOUNT('tmpPSP_SQL9') > 0
			IF VARTYPE(tmpPSP_SQL9.ANS) = "C"
				cReturn = ALLTRIM(tmpPSP_SQL9.ANS)
			ENDIF
		ENDIF
		
		USE IN tmpPSP_SQL9
	ENDIF
	
	SQLDISCONNECT( nConn )
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cReturn 
ENDPROC
*********************************

PROCEDURE AppSetup_Get_Machine_Version 
PARAMETERS pMachine
*AppSetup_Get_Machine_Version(cMachine)

PRIVATE cMach 
IF VARTYPE(pMachine) = "C"
	cMach = pMachine
ELSE
	cMach = LEFT( SYS(0), AT("#",SYS(0))-2 )
ENDIF

PRIVATE cReturn
cReturn = ''

PRIVATE nConn, lNewConn
nConn = get_SQLSTRINGCONNECT()

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPSP_SQL10')
	USE IN tmpPSP_SQL10
ENDIF
SELECT 0

IF nConn > 0
	*Un = cUserName AND SETUP.Prp = "Machine"
	*IF VAL(SUBSTR(pcANS,3,1)) > 3
	cSQL = "SELECT [ANS] FROM dbo.AppSetup WITH(NOLOCK) WHERE ( [PRP] = 'Version' or [PRP] = 'VersionNew' )  AND [UN] = '"+cMach+"'"
	cSQL = cSQL + " Order BY [ANS] DESC "
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL10' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL10' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL10")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL10")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPSP_SQL10')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
	
	IF USED('tmpPSP_SQL10')
		IF RECCOUNT('tmpPSP_SQL10') > 0
			IF VARTYPE(tmpPSP_SQL10.ANS) = "C"
				cReturn = ALLTRIM(tmpPSP_SQL10.ANS)
			ENDIF
		ENDIF
		
		USE IN tmpPSP_SQL10
	ENDIF
	
	SQLDISCONNECT( nConn )
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cReturn 
ENDPROC

********************************
PROCEDURE AppSetup_10Min 
PARAMETERS nConn
*has this ran in last Ten minutes on this machine? AppSetup_10Min(nConn)


PRIVATE lCloseConn 
lCloseConn =.F.

IF VARTYPE(nConn) != "N"
	nConn = 0 
ENDIF
IF nConn < 1
	nConn = get_SQLSTRINGCONNECT() 
	lCloseConn = .T.
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE cMach 
*cLoginMachUser30 = LEFT(SYS(0),30)
cMach = LEFT( SYS(0), AT("#",SYS(0))-2 )
cMach = LEFT(cMach ,20)  &&20 Char Max

PRIVATE lReturn, lInsertTime
lReturn = .F.
lInsertTime = .F.

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPSP_SQL11')
	USE IN tmpPSP_SQL11
ENDIF
SELECT 0

IF nConn > 0
	cSQL = "SELECT TOP 1 [ANS] FROM dbo.AppSetup WITH(NOLOCK) WHERE [Prp] = 'Timer10' AND [UN] = '"+cMach+"'"
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL11' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL11' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL11")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL11")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPSP_SQL11')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		lInsertTime = .T.
	ENDIF
	
	IF USED('tmpPSP_SQL11')
		IF RECCOUNT('tmpPSP_SQL11') > 0
			IF VARTYPE(tmpPSP_SQL11.ANS) = "C"
				*IF SYS(2)+600 > VAL(tmpPSP_SQL11.ANS)
				IF DATETIME() + 600 < CTOT(tmpPSP_SQL11.ANS) 
					lReturn =.T.
				ENDIF
			ENDIF
		ENDIF
		
		USE IN tmpPSP_SQL11
	ENDIF
	cSQL = ''
	IF lInsertTime
		IF ALLTRIM(cMach) > 1
			cSQL =        "DELETE FROM dbo.AppSetup WHERE [PRP]='Timer10' AND [UN]='"+cMach+"'; "
			cSQL = cSQL + "INSERT INTO dbo.AppSetup ([ANS],[PRP],[UN]) VALUES ('"+TTOC(DateTime())+"','Timer10','"+cMach+"'); "
		ENDIF
	ELSE
		IF lReturn 
			cSQL = "UPDATE [ANS] FROM dbo.AppSetup SET [ANS]='"+TTOC(DateTime())+"' WHERE [Prp] = 'Timer10' AND [UN] = '"+cMach+"'"
		ENDIF
	ENDIF
	
	IF LEN(cSQL) > 0
	
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL11' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL11' )
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL11")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL11")

				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPSP_SQL11')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
			lReturn = .F.
		ENDIF
	ENDIF
	
	IF lCloseConn
		SQLDISCONNECT( nConn )
	ENDIF
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lReturn 
ENDPROC

********************************
PROCEDURE AppSetup_Get_ServerDir 
*AppSetup_Get_ServerDir()

PRIVATE cLoginMachUser20
cLoginMachUser20 = LEFT(SYS(0),20)

PRIVATE cReturn
cReturn = ''

PRIVATE nConn, lNewConn
nConn = get_SQLSTRINGCONNECT()
lNewConn = .T.


PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPSP_SQL12')
	USE IN tmpPSP_SQL12
ENDIF
SELECT 0

IF nConn > 0
	*Un = cUserName AND SETUP.Prp = "Machine"
	cSQL = "SELECT DISTINCT [ANS] FROM dbo.AppSetup WITH(NOLOCK) WHERE [Prp] = 'Server' AND [UN] = '"+cLoginMachUser20+"'"
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL12' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL12' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL12")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL12")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPSP_SQL12')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
	
	IF USED('tmpPSP_SQL12')
		IF RECCOUNT('tmpPSP_SQL12') > 0
			IF VARTYPE(tmpPSP_SQL12.ANS) = "C"
				cReturn = ALLTRIM(tmpPSP_SQL12.ANS)
			ENDIF
		ENDIF
		
		USE IN tmpPSP_SQL12
	ENDIF
	
	IF lNewConn 
		SQLDISCONNECT( nConn )
	ENDIF
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cReturn 
ENDPROC

********************************
PROCEDURE AppSetup_ServerDir 
PARAMETERS cServerDir
*AppSetup_ServerDir(cServerDir)

IF VARTYPE(cServerDir) != "C"
	RETURN ' '
ENDIF
IF EMPTY(ALLTRIM(cServerDir))
	RETURN ' '
ENDIF
cServerDir= LEFT(cServerDir,30)

PRIVATE cLoginMachUser20
cLoginMachUser20 = LEFT(SYS(0),20)

PRIVATE cReturn
cReturn = ''

PRIVATE nConn, lNewConn
nConn = get_SQLSTRINGCONNECT()
lNewConn = .T.

PRIVATE cSQL, nSQLEXEC

IF nConn > 0
	cSQL = "UPDATE dbo.AppSetup SET [ANS] = '"+cServerDir+"' WHERE [Prp] = 'Server' AND [UN] = '"+cLoginMachUser20+"'"
	
	nSQLEXEC = SQLEXEC(nConn, cSQL )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL ,nConn, nSQLEXEC )
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
	
	IF lNewConn 
		SQLDISCONNECT( nConn )
	ENDIF
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

RETURN 
ENDPROC

*********************************
PROCEDURE AppSetup_Get_HomeDir 
*AppSetup_Get_HomeDir()

PRIVATE cLoginMachUser20
cLoginMachUser20 = LEFT(SYS(0),20)

PRIVATE cReturn
cReturn = ''

PRIVATE nConn, lNewConn
nConn = get_SQLSTRINGCONNECT()
lNewConn = .T.


PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPSP_SQL13')
	USE IN tmpPSP_SQL13
ENDIF
SELECT 0

IF nConn > 0
	cSQL = "SELECT [ANS] FROM dbo.AppSetup WITH(NOLOCK) WHERE [Prp] = 'Home' AND [UN] = '"+cLoginMachUser20+"'"
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL13' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL13' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL13")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL13")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPSP_SQL13')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
	
	IF USED('tmpPSP_SQL13')
		IF RECCOUNT('tmpPSP_SQL13') > 0
			IF VARTYPE(tmpPSP_SQL13.ANS) = "C"
				cReturn = ALLTRIM(tmpPSP_SQL13.ANS)
			ENDIF
		ENDIF
		
		USE IN tmpPSP_SQL13
	ENDIF
	
	IF lNewConn 
		SQLDISCONNECT( nConn )
	ENDIF
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cReturn 
ENDPROC

*********************************
PROCEDURE AppSetup_HomeDir 
PARAMETERS cHomeDir
*AppSetup_HomeDir(cHomeDir)

IF VARTYPE(cHomeDir) != "C"
	RETURN ' '
ENDIF
IF EMPTY(ALLTRIM(cHomeDir))
	RETURN ' '
ENDIF
cHomeDir = LEFT(cHomeDir,30)

PRIVATE cLoginMachUser20
cLoginMachUser20 = LEFT(SYS(0),20)

PRIVATE cReturn
cReturn = ''

PRIVATE nConn, lNewConn
*? "nConn = get_SQLSTRINGCONNECT()"
nConn = get_SQLSTRINGCONNECT()
lNewConn = .T.


PRIVATE cSQL, nSQLEXEC


IF nConn > 0
	cSQL = "UPDATE dbo.AppSetup SET [ANS] = '"+cHomeDir+"' WHERE [Prp] = 'Home' AND [UN] = '"+cLoginMachUser20+"'"
	*? cSQL 
	
	nSQLEXEC = SQLEXEC(nConn, cSQL )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn,  cSQL )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL ,nConn, nSQLEXEC )
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
	
	IF lNewConn 
		SQLDISCONNECT( nConn )
	ENDIF
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

RETURN 
ENDPROC

*********************************
PROCEDURE AppSetup_Get_Email 
PARAMETERS pUserName 
*cEmailAddress = AppSetup_Get_Email(cUserName)
* HPAlloy.[dbo].[Profile_Names] needs the Email address being used so it can get the SQL Email Profile name

PRIVATE cUserName
IF VARTYPE(pUserName) = "C"
	pUserName = ALLTRIM(pUserName)
ENDIF

IF NOT EMPTY(pUserName)
	cUserName = pUserName
	*cUserName = RIGHT( SYS(0) ,LEN(SYS(0))-AT("#",SYS(0))-1 )
ELSE
	*Somewhere the '#' is being sent in!!!!
	cUserName = RIGHT( SYS(0) ,LEN(SYS(0))-AT("#",SYS(0))-1 )
ENDIF

cUserName = ALLTRIM( cUserName )

IF AT('#',cUserName) > 0		&&Double check
	cUserName = RIGHT( cUserName, LEN(cUserName)-AT("#",cUserName)-1 )
	cUserName = ALLTRIM( cUserName )
ENDIF

PRIVATE cReturn
cReturn = ''

PRIVATE nConn, lNewConn
nConn = get_SQLSTRINGCONNECT()
lNewConn = .T.


PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPSP_SQL14')
	USE IN tmpPSP_SQL14
ENDIF
SELECT 0

IF nConn > 0
	IF UPPER(ALLTRIM(cUserName)) = 'ICK JENKINS'
		cUserName = 'Rick Jenkins'  &&WTF
	ENDIF
	IF UPPER(ALLTRIM(cUserName)) = 'NDA NICHOLAS'
		*HOUSTON-VM # Glenda Nicholas
		cUserName = 'Glenda Nicholas'  &&WTF
	ENDIF

	cSQL = "SELECT [ANS] FROM dbo.AppSetup WITH(NOLOCK) WHERE [Prp] = 'E-mail' AND [UN] = '"+cUserName+"'"
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL14' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL14' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL14")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL14")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPSP_SQL14')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
	
	IF USED('tmpPSP_SQL14')
		IF RECCOUNT('tmpPSP_SQL14') > 0
			IF VARTYPE(tmpPSP_SQL14.ANS) = "C"
				cReturn = ALLTRIM(tmpPSP_SQL14.ANS)
			ENDIF
		ELSE
*	removed 			
*!*				*not Found, Count UserName and write Error 
*!*				cSQL = "SELECT COUNT(*) AS CNTD FROM dbo.AppSetup WITH(NOLOCK) WHERE [UN] = '"+cUserName+"'"
*!*				
*!*				nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL14' )
*!*				DO WHILE nSQLEXEC = 0
*!*					WAIT WINDOW 'SQL' TIMEOUT 1
*!*					nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL14' )
*!*				ENDDO
*!*				IF nSQLEXEC < 0 &&Try again!
*!*					nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL14")
*!*					DO WHILE nSQLEXEC = 0
*!*						WAIT WINDOW 'SQL 2' TIMEOUT 1
*!*						nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL14")

*!*						IF nSQLEXEC < 0
*!*							IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
*!*								nSQLEXEC = 0
*!*							ENDIF
*!*						ENDIF
*!*					ENDDO
*!*				ENDIF
*!*				IF nSQLEXEC < 0
*!*					SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPSP_SQL14')
*!*					RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
*!*				ENDIF
*!*				
*!*				IF USED('tmpPSP_SQL14')
*!*					PRIVATE lFound,nCountSQL
*!*					lFound = .F.
*!*					nCountSQL = 0
*!*					IF RECCOUNT('tmpPSP_SQL14') > 0	
*!*						lFound = .T.
*!*						PRIVATE cMess
*!*						cMess = "cSQL="+cSQL +CHR(13)+ "INSERT dbo.AppSetup ([Prp],[UN],[ANS])  VALUES ('E-mail','"+cUserName+"','' ). "
*!*						cMess = cMess +CHR(13)+ "Also add person to Database Mail!"
*!*						
*!*						nCountSQL = tmpPSP_SQL14.CNTD					
*!*					ENDIF
*!*					USE IN tmpPSP_SQL14
*!*					
*!*					IF lFound
*!*						IF nCountSQL = 0
*!*							*TrackError("User not found UN='"+cUserName+"' when looking for thier Email"+CHR(13)+cMess ,"User not found.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
*!*						ELSE
*!*							*TrackError("User email not found for UN='"+cUserName+"'"+CHR(13)+cMess ,"User not found.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
*!*						ENDIF
*!*					ENDIF
*!*									
*!*				ENDIF

		ENDIF
	ENDIF
	
	IF lNewConn 
		SQLDISCONNECT( nConn )
	ENDIF
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

IF EMPTY(cReturn) 
	cReturn = "Sales@SpaceAlloysUSA.com"
*	PRIVATE cMess
*	cMess = "INSERT dbo.AppSetup ([Prp],[UN],[ANS])  VALUES ('E-mail','"+cUserName+"','"+cReturn+"' ). "
*	cMess = cMess +CHR(13)+"Also add person to Database Mail!"
*	TrackError(cSQL+CHR(13)+"Failed!","No record of [UN] = UserName"+CHR(13)+cMess,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

RETURN cReturn 
ENDPROC

*********************************
PROCEDURE AppSetup_Get_UN_From_PRP_ANS 
PARAMETERS pPRP, pANS
*AppSetup_Get_UN_From_PRP_ANS(pPRP, pANS)

PRIVATE cPRP, cANS
cPRP = PrepareSQLtxt(pPRP,'PRP',20)
cAns = PrepareSQLtxt(pANS,'ANS',30)

PRIVATE cReturn
cReturn = ''

PRIVATE nConn, lNewConn
nConn = get_SQLSTRINGCONNECT()
lNewConn = .T.


PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPSP_SQL15')
	USE IN tmpPSP_SQL15
ENDIF
SELECT 0

IF nConn > 0 
	IF NOT EMPTY(cPRP) AND NOT EMPTY(cANS)
		cSQL = "SELECT [UN] FROM dbo.AppSetup WITH(NOLOCK) WHERE [Prp] = '"+cPRP+"' AND [ANS] = '"+cANS+"'"
		
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL15' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL15' )
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL15")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL15")

				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPSP_SQL15')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
		
		IF USED('tmpPSP_SQL15')
			IF RECCOUNT('tmpPSP_SQL15') > 0
				IF VARTYPE(tmpPSP_SQL15.UN) = "C"
					cReturn = PrepareSQLtxt(tmpPSP_SQL15.UN,'UN',20)
				ENDIF
			ENDIF
			
			USE IN tmpPSP_SQL15
		ENDIF
		
		IF lNewConn 
			SQLDISCONNECT( nConn )
		ENDIF
	ELSE
		TrackError("EMPTY(cPRP) '"+cPRP +"' or EMPTY(cANS) '"+cANS+"'","Parameter Error","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	ENDIF
ELSE
	*Error on Connection String
	TrackError("Error on Connection String"+CHR(13)+"or EMPTY(cPRP) or EMPTY(cANS)","Could not Connect to SQL","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF


RETURN cReturn 
ENDPROC

*********************************
PROCEDURE Machine_Text 
PARAMETERS cMach
*Returns Table name = Machine_Text(cMach)

PRIVATE cReturn
cReturn = ''

PRIVATE nConn, lNewConn
nConn = get_SQLSTRINGCONNECT()
lNewConn = .T.


PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPSP_SQL_MT')
	USE IN tmpPSP_SQL_MT
ENDIF
SELECT 0

IF nConn > 0 
	IF NOT EMPTY(cMach)
		
		*cSQL = "SELECT ANS,UN FROM dbo.AppSetup WITH(NOLOCK) WHERE PRP = 'Production Machine'"
		cSQL = "SELECT [UN] FROM dbo.AppSetup WITH(NOLOCK) "
		IF LEN(cMach) > 1
			cSQL = cSQL + " WHERE [ANS] = '"+cMach+"'"
		ELSE
			cSQL = cSQL + " WHERE [ANS] LIKE '"+LEFT(cMach,1)+"%'"
		ENDIF
		cSQL = cSQL + " AND PRP = 'Production Machine'"
		
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL_MT' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL_MT' )
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL_MT")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL_MT")

				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPSP_SQL_MT')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
		
		IF USED('tmpPSP_SQL_MT')
			IF RECCOUNT('tmpPSP_SQL_MT') > 0
				IF VARTYPE(tmpPSP_SQL_MT.UN) = "C"
					cReturn = PrepareSQLtxt(tmpPSP_SQL_MT.UN,'UN',20)
				ENDIF
			ENDIF
			
			USE IN tmpPSP_SQL_MT
		ENDIF
		
		IF lNewConn 
			SQLDISCONNECT( nConn )
		ENDIF
	ELSE
		TrackError("pMach= '"+cMach+"'","Parameter Error","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	ENDIF
ELSE
	*Error on Connection String
	TrackError("Error on Connection String"+CHR(13)+"or EMPTY(cMach)","Could not Connect to SQL","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF


RETURN cReturn 
ENDPROC

*********************************
PROCEDURE Machine_Name_Init
PARAMETERS cMach
*Returns Machine Name from INIT
* = Machine_Name_Init(cMach)

PRIVATE cReturn
cReturn = ''

PRIVATE nConn, lNewConn
nConn = get_SQLSTRINGCONNECT()
lNewConn = .T.


PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPSP_SQL_MT')
	USE IN tmpPSP_SQL_MT
ENDIF
SELECT 0

IF nConn > 0 
	IF NOT EMPTY(cMach)
*UN						PRP						ANS
*GFMlog              	Production Machine  	GFM                           	
*G                   	Production Init     	GFM                           		

		*cSQL = "SELECT ANS,UN FROM dbo.AppSetup WITH(NOLOCK) WHERE PRP = 'Production Machine'"
		cSQL = "SELECT [UN] FROM dbo.AppSetup WITH(NOLOCK) "
		IF LEN(cMach) > 1
			cSQL = cSQL + " WHERE [ANS] = '"+cMach+"'"
		ELSE
			cSQL = cSQL + " WHERE [ANS] LIKE '"+LEFT(cMach,1)+"%'"
		ENDIF
		cSQL = cSQL + " AND PRP = 'Production Init '"
		
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL_MT' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL_MT' )
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL_MT")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL_MT")

				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPSP_SQL_MT')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
		
		IF USED('tmpPSP_SQL_MT')
			IF RECCOUNT('tmpPSP_SQL_MT') > 0
				IF VARTYPE(tmpPSP_SQL_MT.UN) = "C"
					cReturn = PrepareSQLtxt(tmpPSP_SQL_MT.UN,'UN',20)
				ENDIF
			ENDIF
			
			USE IN tmpPSP_SQL_MT
		ENDIF
		
		IF lNewConn 
			SQLDISCONNECT( nConn )
		ENDIF
	ELSE
		TrackError("pMach= '"+cMach+"'","Parameter Error","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	ENDIF
ELSE
	*Error on Connection String
	TrackError("Error on Connection String"+CHR(13)+"or EMPTY(cMach)","Could not Connect to SQL","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF


RETURN cReturn 
ENDPROC


*********************************
PROCEDURE Machine_Name
PARAMETERS cMach
*Returns Machine Name from INIT
* = Machine_Name_Init(cMach)

PRIVATE cReturn
cReturn = ''

PRIVATE nConn, lNewConn
nConn = get_SQLSTRINGCONNECT()
lNewConn = .T.


PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPSP_SQL_MT')
	USE IN tmpPSP_SQL_MT
ENDIF
SELECT 0

IF nConn > 0 
	IF NOT EMPTY(cMach)
*UN						PRP						ANS
*GFMlog              	Production Machine  	GFM                           	
*G                   	Production Init     	GFM                           		

		*cSQL = "SELECT ANS,UN FROM dbo.AppSetup WITH(NOLOCK) WHERE PRP = 'Production Machine'"
		cSQL = "SELECT [ANS] FROM dbo.AppSetup WITH(NOLOCK) "
		cSQL = cSQL + " WHERE [UN] = '"+cMach+"'"
		cSQL = cSQL + " AND PRP = 'Production Init '"
		
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL_MT' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL_MT' )
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL_MT")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL_MT")

				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPSP_SQL_MT')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
		
		IF USED('tmpPSP_SQL_MT')
			IF RECCOUNT('tmpPSP_SQL_MT') > 0
				IF VARTYPE(tmpPSP_SQL_MT.ANS) = "C"
					cReturn = PrepareSQLtxt(tmpPSP_SQL_MT.ANS,'ANS',20)
				ENDIF
			ENDIF
			
			USE IN tmpPSP_SQL_MT
		ENDIF
		
		IF lNewConn 
			SQLDISCONNECT( nConn )
		ENDIF
	ELSE
		TrackError("pMach= '"+cMach+"'","Parameter Error","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	ENDIF
ELSE
	*Error on Connection String
	TrackError("Error on Connection String"+CHR(13)+"or EMPTY(cMach)","Could not Connect to SQL","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF


RETURN cReturn 
ENDPROC

*********************************

PROCEDURE AppSetup_Get_Active_Sales 
PARAMETERS pSalesP,nConn
*lActiveSales = AppSetup_Get_Active_Sales(pSalesP)
*returns ActiveSales from SalesP

IF VARTYPE(pSalesP ) != "C"
	RETURN .F.
ENDIF

PRIVATE lCloseConn
lCloseConn = .F.

PRIVATE cReturn
cReturn = .F. 

IF VARTYPE(nConn) != "N"
	nConn = 0 
ENDIF
IF nConn < 1
	nConn = get_SQLSTRINGCONNECT() 
	lCloseConn = .T.
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPSP_SQL16')
	USE IN tmpPSP_SQL16
ENDIF
SELECT 0

IF nConn > 0
	*Un = cUserName AND SETUP.Prp = "Machine"
	cSQL = "SELECT COUNT(*) AS CTND FROM dbo.AppSetup WITH(NOLOCK) WHERE [PRP] = 'ActiveSales' AND [ANS] = '"+pSalesP+"' "
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL16' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL16' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL16")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL16")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPSP_SQL16')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
	
	IF USED('tmpPSP_SQL16')
		IF RECCOUNT('tmpPSP_SQL16') > 0
			IF tmpPSP_SQL16.CTND  > 0
				cReturn = .T.
			ENDIF
		ENDIF
		USE IN tmpPSP_SQL16
	ENDIF
	
	IF lCloseConn
		SQLDISCONNECT( nConn )
	ENDIF
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cReturn 
ENDPROC

********************************* 
PROCEDURE get_Email_ServerDir 
*get_Email_ServerDir
*Also see  get_SQL_SendPDF_Path 

PRIVATE cSQLServer 
IF VARTYPE(gGlobalServer)="C"
	cSQLServer = gGlobalServer 
ELSE
	SET PROCEDURE TO Progs\Proc_ERP ADDITIVE
	RecordTest( 'Record Test Data.', "Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),'gGlobalServer was not set!')
 	*cSQLServer = "BOBWHITE"
 	cSQLServer = get_SQL_ServerName()
ENDIF

*	"\\RAPTOR\HPAData\Quotes\SendPDF\"
*RETURN get_SQL_SendPDF_Path()
RETURN "\\" + cSQLServer + "\Email\"

ENDPROC

********************************* 
PROCEDURE get_Server_Email 
*cSQL_Server_Email = get_Server_Email()

PRIVATE cSQLServer 
IF VARTYPE(gGlobalServer)="C"
	cSQLServer = gGlobalServer 
ELSE
	SET PROCEDURE TO Progs\Proc_ERP ADDITIVE
	RecordTest( 'Record Test Data.', "Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),'gGlobalServer was not set!')
 	*cSQLServer = "BOBWHITE"
 	*cSQLServer = "PEREGRINE"
 	*cSQLServer = "Raptor"
 	cSQLServer = get_SQL_ServerName()
ENDIF

IF cSQLServer = "192.168.1.5" OR cSQLServer = "192.168.2.5"
	cSQLServer = "RAPTOR"
ELSE 
	*cSQLServer = "PEREGRINE"
ENDIF

RETURN cSQLServer+"@SpaceAlloysUSA.com"
ENDPROC

********************************* 
PROCEDURE get_Report_Server 
*get_Report_Server()

PRIVATE cSQLServer 
IF VARTYPE(gGlobalReportServer)="C" AND !EMPTY(gGlobalReportServer)
	cSQLServer = gGlobalReportServer
ELSE
	IF VARTYPE(gGlobalServer)="C"
		cSQLServer = gGlobalServer 
	ELSE
		SET PROCEDURE TO Progs\Proc_ERP ADDITIVE
		RecordTest( 'Record Test Data.', "Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),'gGlobalServer was not set!')
	 	*cSQLServer = "BOBWHITE"
	 	*cSQLServer = "PEREGRINE"
	 	*cSQLServer = "RAPTOR"
	 	cSQLServer = get_SQL_ServerName()
	ENDIF
ENDIF

IF cSQLServer = ""
	cSQLServer = "RAPTOR"
ENDIF

*May change from Default SQL machine to another Machine name.
PRIVATE cURL
cURL = "https://"+cSQLServer+"/ReportServer/Pages/ReportViewer.aspx?"
*cURL = "https://"+cSQLServer+"

RETURN cURL
ENDPROC

********************************* 
PROCEDURE get_Report_SServer 
*get_Report_SServer()

PRIVATE cSQLServer 
IF VARTYPE(gGlobalReportServer)="C" AND !EMPTY(gGlobalReportServer)
	cSQLServer = gGlobalReportServer
ELSE
	IF VARTYPE(gGlobalServer)="C"
		cSQLServer = gGlobalServer 
	ELSE
		SET PROCEDURE TO Progs\Proc_ERP ADDITIVE
		RecordTest( 'Record Test Data.', "Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),'gGlobalServer was not set!')
	 	*cSQLServer = "BOBWHITE"
	 	*cSQLServer = "PEREGRINE"
	 	*cSQLServer = "RAPTOR"
	 	cSQLServer = get_SQL_ServerName()
	ENDIF
ENDIF

IF cSQLServer = ""
	cSQLServer = "RAPTOR"
ENDIF

*May change from Default SQL machine to another Machine name.
PRIVATE cURL
cURL = "https://"+cSQLServer+"/ReportS/report/"
*cURL = "https://"+cSQLServer+"

RETURN cURL
ENDPROC

*********************************************************

*!*	PRIVATE loHyperlink
*!*	loHyperlink = CREATEOBJECT("Hyperlink")
*!*	loHyperlink.navigateto(cText)
*!*	RELEASE loHyperlink


*!*	DECLARE INTEGER ShellExecute ;
*!*	    IN SHELL32.dll ;
*!*	    INTEGER nWinHandle,;
*!*	    STRING cOperation,;
*!*	    STRING cFileName,;
*!*	    STRING cParameters,;
*!*	    STRING cDirectory,;
*!*	    INTEGER nShowWindow
*!*	 
*!*	DECLARE INTEGER FindWindow ;
*!*	   IN WIN32API STRING cNull,STRING cWinName
*!*	 
*!*	RETURN ShellExecute(FindWindow(0,_SCREEN.caption),"OPEN",tcUrl, "",  SYS(2023),1)

********************************* 
PROCEDURE get_SQL_Path 
*get_SQL_Path()

PRIVATE cSQLServer 
IF VARTYPE(gGlobalServer)="C"
	cSQLServer = gGlobalServer 
ELSE
	SET PROCEDURE TO Progs\Proc_ERP ADDITIVE
	RecordTest( 'Record Test Data.', "Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),'gGlobalServer was not set!')
 	*cSQLServer = "Raptor"
 	cSQLServer = get_SQL_ServerName()
 	PRIVATE nConn
 	nConn = get_SQLSTRINGCONNECT()
 	IF nConn > 0
		=SQLDISCONNECT(nConn )
	ENDIF
 	RELEASE nConn
  	
 	IF VARTYPE(gGlobalServer)="C"
		cSQLServer = gGlobalServer 
	ELSE
		cSQLServer = get_SQL_ServerName()
		IF LEN(cSQLServer)=0
			TrackError("Could not Connect to SQL","get_SQL_Path ","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
			RETURN ''
		ENDIF
	ENDIF
ENDIF

PRIVATE cSQL_Path
cSQL_Path = "\\"+cSQLServer+"\HPAData\Quotes\"

*WAIT WINDOW (cSQL_Path) TIMEOUT 2

RETURN cSQL_Path
ENDPROC

********************************* 
PROCEDURE get_SQL_SendPDF_Path 
*get_SQL_SendPDF_Path()

PRIVATE cSQLServer 
IF VARTYPE(gGlobalServer)="C"
	cSQLServer = gGlobalServer 
ELSE
	SET PROCEDURE TO Progs\Proc_ERP ADDITIVE
	RecordTest( 'Record Test Data.', "Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),'gGlobalServer was not set!')
 	*cSQLServer = "RAPTOR"
 	cSQLServer = get_SQL_ServerName()
 	
 	PRIVATE nConn
 	nConn = get_SQLSTRINGCONNECT()
 	IF nConn > 0
		=SQLDISCONNECT(nConn )
	ENDIF
 	RELEASE nConn
 	
 	IF VARTYPE(gGlobalServer)="C"
		cSQLServer = gGlobalServer 
	ELSE
		*second try failed
		TrackError("Could not Connect to SQL","get_SQL_SendPDF_Path ","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
		RETURN ''
	ENDIF
ENDIF

PRIVATE cSQL_Path
cSQL_Path = "\\"+cSQLServer+"\HPAData\Quotes\SendPDF\"
*+"SendPDF\"+cHomeSalesp+"\"
*\\bobwhite\HPAData\Quotes\SendPDF

RETURN cSQL_Path
ENDPROC
*********************************

PROCEDURE AppSetup_Get_DSN
*AppSetup_Get_DSN()
RETURN

*!*	PRIVATE cLoginMachUser20
*!*	cLoginMachUser20 = LEFT(SYS(0),20)

*!*	PRIVATE cReturn
*!*	cReturn = ''

*!*	PRIVATE nConn, lNewConn
*!*	nConn = get_SQLSTRINGCONNECT()
*!*	lNewConn = .T.


*!*	PRIVATE cAlias 
*!*	cAlias = ALIAS()

*!*	PRIVATE cSQL, nSQLEXEC

*!*	IF USED('tmpPSP_SQL17')
*!*		USE IN tmpPSP_SQL17
*!*	ENDIF
*!*	SELECT 0

*!*	IF nConn > 0
*!*		cSQL = "SELECT [ANS] FROM dbo.AppSetup WITH(NOLOCK) WHERE [Prp] = 'DSN' AND [UN] = '"+cLoginMachUser20+"'"
*!*		
*!*		nSQLEXEC = SQLEXEC(nConn , cSQL , 'tmpPSP_SQL17' )
*!*		DO WHILE nSQLEXEC = 0
*!*			WAIT WINDOW 'SQL' TIMEOUT 1
*!*			nSQLEXEC = SQLEXEC(nConn ,  cSQL , 'tmpPSP_SQL17' )
*!*		ENDDO
*!*	IF nSQLEXEC < 0 &&Try again!
*!*			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL17")
*!*			DO WHILE nSQLEXEC = 0
*!*				WAIT WINDOW 'SQL 2' TIMEOUT 1
*!*				nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL17")

*!*				IF nSQLEXEC < 0
*!*					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
*!*						nSQLEXEC = 0
*!*					ENDIF
*!*				ENDIF
*!*			ENDDO
*!*		ENDIF
*!*		IF nSQLEXEC < 0
*!*			SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPSP_SQL17')
*RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
*!*		ENDIF
*!*		
*!*		IF USED('tmpPSP_SQL17')
*!*			IF RECCOUNT('tmpPSP_SQL17') > 0
*!*			IF VARTYPE(tmpPSP_SQL17.ANS) = "C"
*!*				cReturn = ALLTRIM(tmpPSP_SQL17.ANS)
*!*			ENDIF
*!*			ENDIF
*!*			USE IN tmpPSP_SQL17
*!*		ENDIF
*!*		
*!*		IF lNewConn 
*!*			SQLDISCONNECT( nConn )
*!*		ENDIF
*!*	ELSE
*!*		*Error on Connection String
*!*		TrackError("Could not Connect to SQL","Error on Connection String","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
*!*	ENDIF

*!*	IF NOT EMPTY(cAlias)
*!*		IF USED(cAlias)
*!*			SELECT (cAlias)
*	ELSE
*		RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
*!*		ENDIF
*!*	ENDIF

*!*	RETURN cReturn 
ENDPROC

*********************************

PROCEDURE AppSetup_TableofSalesP 
*AppSetup_TableofSalesP

PRIVATE nConn, lReturn
nConn = get_SQLSTRINGCONNECT()
lReturn = .F.
PRIVATE cSQL, nSQLEXEC

IF USED('tmpSalesP')
	USE IN tmpSalesP
ENDIF
SELECT 0

IF nConn > 0
	cSQL = "SELECT [ANS],[UN] FROM dbo.AppSetup WITH(NOLOCK) WHERE [Prp] = 'SalesP' AND LEN([ANS])>0"
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpSalesP' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpSalesP' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpSalesP")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpSalesP")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpSalesP')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
	
	IF USED('tmpSalesP')
		IF VARTYPE(tmpSalesP.ANS) = "C"
			lReturn = .T.
		ENDIF
	ENDIF
	
	SQLDISCONNECT( nConn )
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF


RETURN lReturn 
ENDPROC
*********************************

PROCEDURE AppSetup_TopTableofSalesP 
*AppSetup_TopTableofSalesP
*returns a Table of SalesP "tmpSalesP"

PRIVATE nConn, lReturn
nConn = get_SQLSTRINGCONNECT()
lReturn = .F.
PRIVATE cSQL, nSQLEXEC

IF USED('tmpSalesP2')
	USE IN tmpSalesP2
ENDIF
IF USED('tmpSalesP')
	USE IN tmpSalesP
ENDIF

SELECT 0

IF nConn > 0
	cSQL = "SELECT [AS].[ANS],[AS].[UN],COUNT(*) as [sold] "
	cSQL = cSQL + "	FROM dbo.AppSetup [AS] WITH(NOLOCK) , dbo.AllQuotes [AQ] WITH(NOLOCK) "
	cSQL = cSQL + " WHERE [AS].[Prp] = 'SalesP' AND LEN([AS].[ANS])>0 "
	cSQL = cSQL + " AND [AS].[ANS] = [AQ].SalesP"
	cSQL = cSQL + " AND [AQ].[SaleDate] > GETDATE() - 30"
	cSQL = cSQL + " AND UN <> '0 '"
	cSQL = cSQL + " GROUP BY [AS].[ANS],[AS].[UN]"

	cSQL = cSQL + " UNION "
	
	cSQL = cSQL + " SELECT [AS].[ANS],[AS].[UN], 1 AS [Sold]"
	cSQL = cSQL + " FROM dbo.AppSetup [AS] WITH(NOLOCK) "
	cSQL = cSQL + " WHERE [AS].[Prp] = 'SalesP' AND LEN([AS].[ANS])>0 "
	cSQL = cSQL + "	AND [AS].[ANS] != [AS].[UN]"
	
	cSQL = cSQL + "	AND [AS].[ANS] NOT IN ( SELECT DISTINCT AQ.SalesP FROM dbo.AllQuotes [AQ] WITH(NOLOCK) "
	cSQL = cSQL + "	WHERE  [AQ].[SaleDate] > GETDATE() - 30 ) "

	cSQL = cSQL + " GROUP BY [AS].[ANS],[AS].[UN]"

	cSQL = cSQL + " ORDER BY [Sold] DESC, [UN] "

	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpSalesP2' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpSalesP2' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpSalesP2")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpSalesP2")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpSalesP2')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
	
	IF USED('tmpSalesP2')
		IF VARTYPE(tmpSalesP2.ANS) = "C"
			*USE tmpSalesP2 ALIAS tmpSalesP
			*PRIVATE tmpDBname
			*tmpDBname = SYS(2015)
			*
			SELECT ANS,UN FROM tmpSalesP2 INTO TABLE tmpSalesP
			*SELECT DISTINCT ANS,UN FROM tmpSalesP2 INTO TABLE tmpSalesP --Distinct is done at Querry
			USE IN tmpSalesP2
			
			*CREATE CURSOR 
			
			*SELECT (tmpDBname)
			
			lReturn = .T.
		ENDIF
	ENDIF
	
	SQLDISCONNECT( nConn )
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

*keep tmpSalesP open
RETURN lReturn 
ENDPROC

********************************* 
PROC HPAAppLoad 
PARAMETER cVersion
*Records Version, called in LOAD procedure of ERP menu.

IF VARTYPE(cVersion) != "C"
	cVersion = '0'
ENDIF

PRIVATE cMach_User, cUserName, cMach
cMach_User = SYS(0)
cUserName = ALLTRIM(  RIGHT( cMach_User, LEN(cMach_User)-AT("#",cMach_User)-1 )  )
cMach = LEFT( cMach_User, AT("#",cMach_User)-2 )

PRIVATE nArraySize, aArrayName, cHPAFile
IF FILE("C:\Program Files\HPA\ERP.EXE")
	nArraySize = aGETFILEVERSION(aArrayName, "C:\Program Files\HPA\ERP.EXE")
ELSE
	IF FILE("ERP.EXE")
		nArraySize = aGETFILEVERSION(aArrayName, "ERP.EXE")
	ELSE
		cHPAFile = ALLTRIM(HOME())+"ERP.EXE" 
		IF FILE(cHPAFile)
			nArraySize = aGETFILEVERSION(aArrayName, (cHPAFile))
		ELSE			
			cHPAFile = SYS(5)+SYS(2003)+"ERP.EXE" 
			IF FILE(cHPAFile)
				nArraySize = aGETFILEVERSION(aArrayName, (cHPAFile))
			ELSE
				nArraySize = 0
			ENDIF
		ENDIF
	ENDIF
ENDIF

IF nArraySize > 0
	*Read the EXE to get the file version
	cVersion = aArrayName(1,4)
ELSE
	cVersion = '0.0'
ENDIF


IF NOT cVersion = '0.0'
	*Version
   *AppSetup_Update_Version( pcAns,       pcUN, 'Version', pConn )
	AppSetup_Update_Version( cVersion ,cMach, 'Version', 0)
*	AppSetup_Update_Version( cVersion ,cMach, 'VersionNew', 0)
*	AppSetup_Update_Ans( cVersion ,cMach, 'Version' )



*!*		IF VAL(SUBSTR(cVersion,3,1)) > 3 && the third pos >3 was beta!
*!*			*Save the highest version number
*!*			AppSetup_Update_Version( cVersion ,cMach, 'VersionNew' )	
*!*			*AppSetup_Update_Ans( cVersion ,cMach, 'VersionNew' )	
*!*		ELSE
*!*			*Save the highest version number
*!*			Set_HPAVersion()
			*!* AppSetup_Update_Version( cVersion ,cMach, 'Version' )	
*!*			*AppSetup_Update_Ans( cVersion ,cMach, 'Version' )	
*!*		ENDIF
	*Machine
	AppSetup_Update_Ans( cMach, cUserName, 'Machine' )		
	*? "AppSetup_Update_Ans( cMach, cUserName, 'Machine' )"

ENDIF
ENDPROC

**********************************

PROC Set_HPAVersion 
PARAMETERS pWhat

*WAIT WINDOW 'Set_HPAVersion() Start' TIMEOUT 1

PRIVATE cWhat
cWhat = "STABLE" &&"BETA"
IF VARTYPE(pWhat) = "C"
	cWhat = PrepareSQLtxt(pWhat,"STABLE",10)
ENDIF

PRIVATE nConn
nConn = get_SQLSTRINGCONNECT()

PRIVATE cYourVersion, nYourVersion 
cYourVersion = ' '
nYourVersion = 0
PRIVATE cMach_User, cUserName, cMach
cMach_User = SYS(0)
cUserName = ALLTRIM(  RIGHT( cMach_User, LEN(cMach_User)-AT("#",cMach_User)-1 )  )
cMach = LEFT( cMach_User, AT("#",cMach_User)-2 )

*get EXE version into array
PRIVATE nArraySize, aArrayName, cHPAFile
IF FILE("ERP.EXE")
	nArraySize = aGETFILEVERSION(aArrayName, "ERP.EXE")
ELSE
	IF FILE("C:\Program Files (x86)\HPA\ERP.EXE")
		nArraySize = aGETFILEVERSION(aArrayName, "C:\Program Files (x86)\HPA\ERP.EXE")
	ELSE
		IF FILE("C:\Program Files\HPA\ERP.EXE")	
			nArraySize = aGETFILEVERSION(aArrayName, "ERP.EXE")
		ELSE
			
				cHPAFile = ALLTRIM(HOME())+"ERP.EXE" 
				IF FILE(cHPAFile)
					nArraySize = aGETFILEVERSION(aArrayName, (cHPAFile))
				ELSE
					LoginAppHome = SYS(5)+SYS(2003)+"\ERP"
					IF NOT FILE(LoginAppHome+"ERP Home.txt")
						MESSAGEBOX("ERP.EXE file not Found!"+CHR(13)+""+CHR(13)+"This code must be not compiled!",16,"Could not get the EXE version!" )
					ENDIF
					nArraySize = 0
				ENDIF
			
		ENDIF
	ENDIF
ENDIF

PRIVATE cLatestVersion, nLatestVersion 	
cLatestVersion = ''
nLatestVersion = 0

*create Version from Array
IF nArraySize > 0
	cYourVersion = aArrayName(1,4)
	nYourVersion  = VAL(LEFT(cYourVersion,AT(".",cYourVersion)))*10000000 +INT(VAL(RIGHT(cYourVersion,LEN(cYourVersion)-AT(".",cYourVersion))))*10000+VAL(RIGHT(cYourVersion,LEN(cYourVersion)-AT(".",cYourVersion,2 )))
	*VAL(LEFT(cYourVersion,AT(".",cYourVersion)))*10000000 +VAL(RIGHT(cYourVersion,LEN(cYourVersion)-AT(".",cYourVersion)))*10000
	
*	IF nYourVersion > 30030000 
*		cWhat = "BETA"
*	ENDIF
ENDIF

************************
IF cWhat = "STABLE"
	cLatestVersion = AppSetup_get_LatestVersion("STABLE")
	nLatestVersion= VAL(LEFT(cLatestVersion ,AT(".",cLatestVersion )))*10000000 +INT(VAL(RIGHT(cLatestVersion ,LEN(cLatestVersion )-AT(".",cLatestVersion ))))*10000+VAL(RIGHT(cLatestVersion ,LEN(cLatestVersion )-AT(".",cLatestVersion,2 )))
ELSE
	cLatestVersion = AppSetup_get_LatestVersion("BETA")
	nLatestVersion= VAL(LEFT(cLatestVersion ,AT(".",cLatestVersion )))*10000000 +INT(VAL(RIGHT(cLatestVersion ,LEN(cLatestVersion )-AT(".",cLatestVersion ))))*10000+VAL(RIGHT(cLatestVersion ,LEN(cLatestVersion )-AT(".",cLatestVersion,2 )))
	cWhat = "BETA"
ENDIF

IF nYourVersion = 0	
	nYourVersion = VAL(LEFT(cYourVersion,AT(".",cYourVersion)))*10000000 +INT(VAL(RIGHT(cYourVersion,LEN(cYourVersion)-AT(".",cYourVersion))))*10000+VAL(RIGHT(cYourVersion,LEN(cYourVersion)-AT(".",cYourVersion,2 )))
ENDIF


**********

IF nLatestVersion < nYourVersion OR nYourVersion = 0
	IF nConn > 0
		PRIVATE cSQL, nSQLEXEC 
		cSQL = "UPDATE dbo.AppSetup SET ANS = '"+cYourVersion+"'"
		cSQL = cSQL + " WHERE UN = 'Latest'"
		cSQL = cSQL + " AND PRP = 'Version'"
								
		nSQLEXEC = SQLEXEC(nConn, cSQL )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC( nConn, cSQL )
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(nConn, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(nConn, cSQL, "")

				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL,nConn, nSQLEXEC, '')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ELSE
			IF NOT "PROC_SQL" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
				SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
			ENDIF
			TrackMess( cSQL )
			lGoodSave = .T.
		ENDIF
		SQLDISCONNECT( nConn )
	ENDIF
ELSE
	*no need to Update
ENDIF


RETURN 
ENDPROC

**********************************

PROC Get_HPAVersion  
PARAMETERS lNotCaption, pWhat
*nVersion = Get_HPAVersion(lNotCapt, pWhat)
*WAIT WINDOW 'HPAVersion() Start' TIMEOUT 1
*RETURN "Version 1.2.3"

IF NOT "PROC_SQL" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
	SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
ENDIF

*lNotCaption
PRIVATE cWhat
cWhat = PrepareSQLtxt(pWhat,"STABLE",10)
*IF VARTYPE(pWhat) = "C"
*	cWhat = pWhat	&& or "BETA"
*ENDIF

PRIVATE cVersion, cCaption, nVersion 
cVersion = ' '
cCaption = ' '
nVersion = 0
PRIVATE cMach_User, cUserName, cMach
cMach_User = SYS(0)
cUserName = ALLTRIM(  RIGHT( cMach_User, LEN(cMach_User)-AT("#",cMach_User)-1 )  )
cMach = LEFT( cMach_User, AT("#",cMach_User)-2 )

*MESSAGEBOX("pWhat="+pWhat,0,"Get_HPAVersion 1")

*WAIT WINDOW 'aGETFILEVERSION' TIMEOUT 1
PRIVATE nArraySize, aArrayName, cHPAFile
IF FILE("C:\Program Files (x86)\HPA\ERP.EXE")
	nArraySize = aGETFILEVERSION(aArrayName, "C:\Program Files (x86)\HPA\ERP.EXE")
ELSE
	IF FILE("C:\Program Files\HPA\ERP.EXE")	
		nArraySize = aGETFILEVERSION(aArrayName, "ERP.EXE")
	ELSE
		IF FILE("ERP.EXE")
			nArraySize = aGETFILEVERSION(aArrayName, "ERP.EXE")
		ELSE
			cHPAFile = ALLTRIM(HOME())+"ERP.EXE" 
			IF FILE(cHPAFile)
				nArraySize = aGETFILEVERSION(aArrayName, (cHPAFile))
			ELSE
				nArraySize = 0
			ENDIF
		ENDIF
	ENDIF
ENDIF

PRIVATE cLatestVersion, nLatestVersion 	
cLatestVersion = ''
nLatestVersion = 0

*WAIT WINDOW 'nArraySize = '+STR(nArraySize) TIMEOUT 1
IF nArraySize > 0
	cVersion = aArrayName(1,4)
	nVersion  = VAL(LEFT(cVersion,AT(".",cVersion)))*10000000 +INT(VAL(RIGHT(cVersion,LEN(cVersion)-AT(".",cVersion))))*10000+VAL(RIGHT(cVersion,LEN(cVersion)-AT(".",cVersion,2 )))
	*VAL(LEFT(cVersion,AT(".",cVersion)))*10000000 +VAL(RIGHT(cVersion,LEN(cVersion)-AT(".",cVersion)))*10000
	
	*IF nVersion > 30030000 
	*	cWhat = "BETA"
	*ENDIF
ENDIF

************************
*IF cWhat = "STABLE"
*MESSAGEBOX("AppSetup_get_LatestVersion('STABLE')",0,"Get_HPAVersion STABLE")
	cLatestVersion = AppSetup_get_LatestVersion("STABLE")
	nLatestVersion= VAL(LEFT(cLatestVersion ,AT(".",cLatestVersion )))*10000000 +INT(VAL(RIGHT(cLatestVersion ,LEN(cLatestVersion )-AT(".",cLatestVersion ))))*10000+VAL(RIGHT(cLatestVersion ,LEN(cLatestVersion )-AT(".",cLatestVersion,2 )))
*ELSE
*MESSAGEBOX("AppSetup_get_LatestVersion('LATEST')",0,"Get_HPAVersion LATEST")
*	cWhat = "LATEST"
*	cLatestVersion = AppSetup_get_LatestVersion("STABLE")
	*cWhat = "BETA"
	*cLatestVersion = AppSetup_get_LatestVersion("BETA")
	
*	nLatestVersion= VAL(LEFT(cLatestVersion ,AT(".",cLatestVersion )))*10000000 +INT(VAL(RIGHT(cLatestVersion ,LEN(cLatestVersion )-AT(".",cLatestVersion ))))*10000+VAL(RIGHT(cLatestVersion ,LEN(cLatestVersion )-AT(".",cLatestVersion,2 )))
*ENDIF

IF nVersion = 0	
	nVersion = VAL(LEFT(cVersion,AT(".",cVersion)))*10000000 +INT(VAL(RIGHT(cVersion,LEN(cVersion)-AT(".",cVersion))))*10000+VAL(RIGHT(cVersion,LEN(cVersion)-AT(".",cVersion,2 )))
ENDIF
*MESSAGEBOX("nVersion = "+STR(nVersion,15,4) ,0,"Get_HPAVersion")
*MESSAGEBOX("cLatestVersion = "+cLatestVersion  ,0,"Get_HPAVersion")
IF nLatestVersion > nVersion OR nLatestVersion = 0
*	IF cWhat = "BETA" OR cWhat = "LATEST"
		IF lNotCaption
			cCaption = cVersion
		ELSE
			cCaption = "Version "+cVersion+" of new "+cLatestVersion 
		ENDIF
*	ELSE
*		IF lNotCaption
*			cCaption = cVersion
*		ELSE
*			cCaption = "Version "+cVersion+" of "+cLatestVersion 
*		ENDIF
*	ENDIF
ELSE
	*Not the latest Version
	IF nLatestVersion = nVersion 
*		IF cWhat = "BETA" OR cWhat = "LATEST"
			IF lNotCaption
				cCaption = cVersion
			ELSE
				cCaption = "Version "+cVersion+", new current!"
			ENDIF
*		ELSE
*			IF lNotCaption
*				cCaption = cVersion
*			ELSE
*				cCaption = "Version "+cVersion+", current!"
*			ENDIF
*		ENDIF
	ELSE
		*nLatestVersion <> nVersion 
		*do Set_HPAVersion
		IF nVersion > nLatestVersion 
			IF UPPER(cUserName) = "DAVID KIRCHNER"
				IF MESSAGEBOX( "Do you want to update Latest Version now (Y/N)?"+CHR(13)+cCaption,4+32,"David Kirchner - only.") = 6
					*AppSetup_Update_Ans( cVersion ,"Newest", "VersionNew"  )	
					IF Set_HPAVersion(cWhat)
						cLatestVersion = cVersion
					ENDIF
				ENDIF	
			ELSE

				************************
				* Any user with a new version.
				
				*IF Set_HPAVersion(cWhat)
				IF Set_HPAVersion("STABLE")
					cLatestVersion  = cVersion 
				ENDIF
			ENDIF

			IF lNotCaption
				cCaption = cLatestVersion 
			ELSE
				cCaption = "Version "+cVersion+" of "+cLatestVersion 
			ENDIF
		ELSE
			IF lNotCaption
				cCaption = cLatestVersion 
			ELSE
				cCaption = "Version "+cVersion+" of "+cLatestVersion 
			ENDIF		
		ENDIF		

	ENDIF
ENDIF

*MESSAGEBOX("RETURN cCaption "+cCaption ,0,"Get_HPAVersion")
RETURN cCaption
ENDPROC
**********************************

PROC AllowHPA_Version 

PRIVATE lAllowed
lAllowed = .T.

PRIVATE cLatestVersion, cMinAllowVersion, cUsersVersion
cLatestVersion   = AppSetup_get_LatestVersion("STABLE")
cMinAllowVersion = AppSetup_get_MinVersion()
cUsersVersion    = Get_HPAVersion(.T.,"STABLE")

IF EMPTY(cLatestVersion)
	RETURN .T.	&&let thru for now
ENDIF
IF EMPTY(cMinAllowVersion)
	RETURN .T.	&&let thru for now
ENDIF
IF EMPTY(cUsersVersion)
	RETURN .T.	&&let thru for now
ENDIF

*Break down the String '3.1.1'
PRIVATE nMajorCurV, nMajorAllow
nMajorCurV	= VAL(LEFT(cUsersVersion , AT(".",cUsersVersion )))
nMajorAllow	= VAL(LEFT(cMinAllowVersion, AT(".",cMinAllowVersion)))
IF nMajorCurV < nMajorAllow
	RETURN .F.
ENDIF
IF nMajorCurV >= nMajorAllow
	RETURN .T.
ENDIF

PRIVATE cMinorCurV, cMinorAllow
cMinorCurV	= SUBSTR(cUsersVersion ,AT(".",cUsersVersion )+1 )
cMinorAllow	= SUBSTR(cMinAllowVersion,AT(".",cMinAllowVersion)+1 )

PRIVATE nMinorCurV, nMinorAllow
IF AT(".",cMinorCurV) > 0
	nMinorCurV	= VAL(LEFT(cMinorCurV,AT(".",cMinorCurV)))
ELSE
	nMinorCurV	= VAL(cMinorCurV)
ENDIF
IF AT(".",cMinorAllow) > 0
	nMinorAllow	= VAL(LEFT(cMinorAllow,AT(".",cMinorAllow)))
ELSE
	nMinorAllow	= VAL(cMinorAllow)
ENDIF

IF nMinorCurV < nMinorAllow
	IF nMajorCurV = nMajorAllow
		RETURN .F.	&&Minor is only bad if Major is Same
	ENDIF
ENDIF
IF nMinorCurV > nMinorAllow
	RETURN .T.
ENDIF

PRIVATE cBuildCurV, cBuildAllow, lBuildAllow
lBuildAllow = AT(".",cMinorAllow) > 0
IF lBuildAllow 
	IF AT(".",cMinorCurV) > 0
		cBuildCurV	= SUBSTR(cMinorCurV,AT(".",cMinorCurV)+1 )
	ELSE
		cBuildCurV	= cMinorCurV
	ENDIF
	IF AT(".",cMinorAllow) > 0
		cBuildAllow	= SUBSTR(cMinorAllow,AT(".",cMinorAllow)+1 )
	ELSE
		cBuildAllow	= cMinorAllow
	ENDIF
	
	PRIVATE nBuildCurV, nBuildAllow
	nBuildCurV	= VAL(cBuildCurV)
	nBuildAllow	= VAL(cBuildAllow)

	IF nBuildCurV < nBuildAllow
		*IF nMinorCurV = nMinorAllow
		*	RETURN .F.	&&Build is only bad if Minor is Same
		*ENDIF
		
		IF NOT "Proc_ERP" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
			SET PROCEDURE TO Progs\Proc_ERP ADDITIVE
		ENDIF
		
		RecordTest("Record Test Data.", PROGRAM(), LINENO(1),"Build not Allowed")
		TrackError("UsersVersion="+ALLTRIM(cUsersVersion )+", LatestVersion="+ALLTRIM(cLatestVersion)+", MinAllowVersion="+ALLTRIM(cMinAllowVersion),"Build not Allowed to run.", PROGRAM(), LINENO(1))
		RETURN .F.
		
	ENDIF

ENDIF

RETURN lAllowed
ENDPROC

**********************************

PROCEDURE AppSetup_get_LatestVersion 
PARAMETERS pWhat
*AppSetup_get_LatestVersion('BETA')or 'STABLE'
*Returns cAns of PRP='Version' AND [UN] = 'Latest'"

PRIVATE cWhat
IF VARTYPE(pWhat) = "C"
	cWhat = pWhat		&&"BETA"
ELSE
	cWhat = ""
ENDIF

PRIVATE cReturn
cReturn = ''
*WAIT WINDOW "AppSetup_get_LatestVersion:get_SQLSTRINGCONNECT" TIMEOUT 1
PRIVATE nConn
nConn = get_SQLSTRINGCONNECT()

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPSP_SQL18')
	USE IN tmpPSP_SQL18
ENDIF
SELECT 0

IF nConn < 1
	MESSAGEBOX("Could not talk to server"+CHR(13)+"Wait 5 Min if Server is rebooting and this can work."+CHR(13)+"Just continue if you are setting up the HPA App."+CHR(13)+"If you continue before the server is back, you may need to restart the HPA App.",0+16,"Server Error - Server may be rebooting.",500000) 
	nConn = get_SQLSTRINGCONNECT()
ENDIF

IF nConn > 0
	DO CASE
	CASE cWhat = "BETA"
		cSQL = "SELECT [ANS] FROM dbo.AppSetup WITH(NOLOCK) WHERE ([Prp] = 'VersionNew' ) AND [UN] = 'Newest' "
	CASE cWhat = "STABLE"
		cSQL = "SELECT [ANS] FROM dbo.AppSetup WITH(NOLOCK) WHERE [Prp] = 'Version' AND [UN] = 'Latest'"
	OTHERWISE
		cSQL = "SELECT [ANS] FROM dbo.AppSetup WITH(NOLOCK) WHERE [Prp] = 'Version' AND [UN] = 'Latest'"
	ENDCASE
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL18' )
*	WAIT WINDOW "AppSetup_get_LatestVersion:SELECT after" TIMEOUT 1
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL18' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL18")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL18")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
*		WAIT WINDOW "AppSetup_get_LatestVersion:SELECT error" 
		SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPSP_SQL18')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
	
	IF USED('tmpPSP_SQL18')
		IF RECCOUNT('tmpPSP_SQL18') > 0
			IF VARTYPE(tmpPSP_SQL18.ANS) = "C"
				cReturn = ALLTRIM(tmpPSP_SQL18.ANS)
			ENDIF
		ENDIF
		
		USE IN tmpPSP_SQL18
	ENDIF
*	WAIT WINDOW "AppSetup_get_LatestVersion:Disconnect " TIMEOUT 1
	SQLDISCONNECT( nConn )
ELSE
	*Error on Connection String
*	WAIT WINDOW "AppSetup_get_LatestVersion:TrackError " 
*	TrackError("Could not Connect to SQL","Error on Connection String","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF
*WAIT WINDOW "AppSetup_get_LatestVersion: end proc" TIMEOUT 1
IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cReturn 
ENDPROC

**********************************

PROCEDURE AppSetup_get_MinVersion 
*AppSetup_get_MinVersion()

PRIVATE cReturn
cReturn = ''

PRIVATE nConn
nConn = get_SQLSTRINGCONNECT()

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPSP_SQL19')
	USE IN tmpPSP_SQL19
ENDIF
SELECT 0

IF nConn < 1
	MESSAGEBOX("Could not talk to server"+CHR(13)+"Wait 5 Min if Server is rebooting and this can work."+CHR(13)+"Just continue if you are setting up the HPA App."+CHR(13)+"If you continue before the server is back, you may need to restart the HPA App.",0+16,"Server Error - Server may be rebooting.",500000) 
	nConn = get_SQLSTRINGCONNECT()
ENDIF

*INSERT dbo.AppSetup (ANS,PRP,UN) VALUES ('3.1.1','Version','Minimum')
*UPDATE dbo.AppSetup Set ANS='3.4.1' WHERE PRP='Version' AND UN='Minimum'

IF nConn > 0
	cSQL = "SELECT [ANS] FROM dbo.AppSetup WITH(NOLOCK) WHERE [Prp] = 'Version' AND [UN] = 'Minimum'"
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL19' )
*	WAIT WINDOW "AppSetup_get_LatestVersion:SELECT after" TIMEOUT 1
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL19' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL19")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL19")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
*		WAIT WINDOW "AppSetup_get_LatestVersion:SELECT error" 
		SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPSP_SQL19')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
	
	IF USED('tmpPSP_SQL19')
		IF RECCOUNT('tmpPSP_SQL19') > 0
			IF VARTYPE(tmpPSP_SQL19.ANS) = "C"
				cReturn = ALLTRIM(tmpPSP_SQL19.ANS)
			ENDIF
		ENDIF
		
		USE IN tmpPSP_SQL19
	ENDIF
*	WAIT WINDOW "AppSetup_get_LatestVersion:Disconnect " TIMEOUT 1
	SQLDISCONNECT( nConn )
ELSE
	*Error on Connection String
*	WAIT WINDOW "AppSetup_get_LatestVersion:TrackError " 
*	TrackError("Could not Connect to SQL","Error on Connection String","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF
*WAIT WINDOW "AppSetup_get_LatestVersion: end proc" TIMEOUT 1
IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cReturn 
ENDPROC
*********************************

PROCEDURE AppSetup_Get_AutoName 
PARAMETERS pUserName 
*AppSetup_Get_AutoName(cUserName)

IF VARTYPE(pUserName) != "C"
	RETURN .F.
ENDIF

PRIVATE cUserName
cUserName = pUserName

IF LEN(ALLTRIM(pUserName)) = 1
	cUserName = AppSetup_Get_UserName(pUserName)
ENDIF

cUserName  = ALLTRIM(  cUserName  )

PRIVATE cReturn
cReturn = ''

PRIVATE nConn
nConn = get_SQLSTRINGCONNECT()

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPSP_SQL20')
	USE IN tmpPSP_SQL20
ENDIF
SELECT 0

IF nConn > 0
	*Un = cUserName AND SETUP.Prp = "Machine"
	cSQL = "SELECT [ANS] FROM dbo.AppSetup WITH(NOLOCK) WHERE [Prp] = 'AutoName' AND [UN] = '"+cUserName+"'"
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL20' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL20' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL20")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL20")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPSP_SQL20')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
	
	IF USED('tmpPSP_SQL20')
		IF RECCOUNT('tmpPSP_SQL20') > 0
			IF VARTYPE(tmpPSP_SQL20.ANS) = "C"
				cReturn = ALLTRIM(tmpPSP_SQL20.ANS)
			ENDIF
		ENDIF
		
		USE IN tmpPSP_SQL20
	ENDIF
	
	SQLDISCONNECT( nConn )
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN (UPPER(cReturn) = "ON") 
ENDPROC

*********************************
PROC AppSetup_Insert 
PARAMETER pcUN,pcPRP,pcANS, pConnHandle
*AppSetup_Insert(pcUN,pcPRP,pcANS, pConnHandle)
*mach, 'VersionNew', txtVer
IF VARTYPE(pcUN) != "C"
	RETURN .F.
ENDIF
IF VARTYPE(pcPRP) != "C"
	RETURN .F.
ENDIF
IF EMPTY(ALLTRIM(pcPRP))
	RETURN .F.
ENDIF
IF VARTYPE(pcANS) != "C"
	RETURN .F.
ENDIF
IF EMPTY(ALLTRIM(pcANS))
	RETURN .F.
ENDIF

IF pcPRP = "SalesP"
	IF pcUN = pcANS
		
		*RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"AppSetup_Insert has 'SalesP' where UN='"+pcUN+"' is same as ANS='"+pcANS+"'")
		RecordError( 0, "AppSetup_Insert Failed", "Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"AppSetup_Insert has PRP='SalesP' where UN='"+pcUN+"' is same as ANS='"+pcANS+"'" )
		RETURN .T.
	ENDIF
ENDIF
IF pcPRP = "Machine"
*	MESSAGEBOX("Machine="+pcANS,0,"AppSetup_Insert")
ENDIF
IF pcUN = "DKIRCHNER2022"
*	MESSAGEBOX("pcUN = DKIRCHNER2022",0,"AppSetup_Insert")
ENDIF
IF pcUN = "SalesP"
*	MESSAGEBOX("pcUN = DKIRCHNER2022",0,"AppSetup_Insert")
ENDIF

PRIVATE lGoodSave
lGoodSave = .F.

PRIVATE lNewConn, nConn
lNewConn  =.F.
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
		lNewConn = .T.
	ENDIF
ELSE
	nConn= get_SQLSTRINGCONNECT()
	lNewConn = .T.
ENDIF

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC
cSQL = ''

PRIVATE nVersion 

DO CASE
CASE pcPRP == 'Version' 
	nVersion = Get_HPAVersion(.T., 'STABLE')
	*command was sent to this Insert this Version!  
	*Insert the Version no matter how it relates to other Versions

	*IF VAL(SUBSTR(pcANS,3,1)) > 3
	*SUBSTR(nVersion,AT(".",nVersion,3)+1,3)
*	IF VAL(SUBSTR(pcANS,AT(".",pcANS,2)+1,3)) > VAL(SUBSTR(nVersion,AT(".",nVersion,2)+1,3)) ;
	  AND FLOOR(VAL(SUBSTR(pcANS,AT(".",pcANS,1)+1,3))) = FLOOR(VAL(SUBSTR(nVersion,AT(".",nVersion,1)+1,3)))
	  
		*the newest delevelopment is 3.8
		cSQL = "INSERT INTO dbo.AppSetup (UN,PRP,ANS) VALUES "
		cSQL = cSQL + "('"+pcUN+"'"  &&mach
		cSQL = cSQL + ",'Version'"	&&'Version'
		cSQL = cSQL + ",'"+pcANS+"')"	&&txtVersion
*	ENDIF
CASE pcPRP = 'VersionNew' OR pcUN = 'Newest'
	*command was sent to this Insert this Version!  
	*Insert the Version no matter how it relates to other Versions

	*the newest delevelopment is 3.8
*	MESSAGEBOX("nVersion = Get_HPAVersion(.T., 'BETA')",0,'AppSetup_Insert A')
	nVersion = Get_HPAVersion(.T., 'BETA')
*	nVersion = Get_HPAVersion(.T., 'STABLE')
*	MESSAGEBOX(ALLTRIM(STR(nVersion))+CHR(13)+"nVersion = Get_HPAVersion(.T., 'BETA')",0,'AppSetup_Insert B')
	
	*IF VAL(SUBSTR(pcANS,3,1)) > 4
	*Second decimal is the same and Third decimal is greater

*	IF ALLTRIM(  RIGHT( SYS(0), LEN(SYS(0))-AT("#",SYS(0))-1 )  ) = "David Kirchner"
		n3a = VAL(SUBSTR(pcANS,AT(".",pcANS,2) +1,3))
		n3b = VAL(SUBSTR(nVersion,AT(".",nVersion,2)+1,3))
		n2a = FLOOR(VAL(SUBSTR(pcANS,AT(".",pcANS,1)+1,3)))
		n2b = FLOOR(VAL(SUBSTR(nVersion,AT(".",nVersion,1)+1,3)))
		n1a = LEFT(pcANS,AT(".",pcANS)-1)
		n1b = LEFT(pcANS,AT(".",nVersion)-1)
		nA = ( n1a * 1000000 ) + ( n2a * 1000 ) + n3a
		nB = ( n1b * 1000000 ) + ( n2b * 1000 ) + n3b
		
*		IF nA > nB
			
			cSQL = "INSERT INTO dbo.AppSetup (UN,PRP,ANS) VALUES "
			cSQL = cSQL + "('"+pcUN+"'"		 &&mach
			cSQL = cSQL + ",'VersionNew'"
			cSQL = cSQL + ",'"+pcANS+"')"	&&txtVersion
			
*			WAIT WINDOW cSQL 
*			MESSAGEBOX( cSQL,0,'AppSetup_Insert C')
*		ENDIF
		
*	ENDIF
*!*		IF VAL(SUBSTR(pcANS,AT(".",pcANS,2) +1,3)) > VAL(SUBSTR(nVersion,AT(".",nVersion,2)+1,3)) ;
*!*		  AND FLOOR(VAL(SUBSTR(pcANS,AT(".",pcANS,1)+1,3))) = FLOOR(VAL(SUBSTR(nVersion,AT(".",nVersion,1)+1,3)))
*!*			
*!*			cSQL = "INSERT INTO dbo.AppSetup (UN,PRP,ANS) VALUES "
*!*			cSQL = cSQL + "('"+pcUN+"'"
*!*			cSQL = cSQL + ",'VersionNew'"
*!*			cSQL = cSQL + ",'"+pcANS+"')"
*!*		ENDIF
OTHERWISE
	cSQL = "INSERT INTO dbo.AppSetup (UN,PRP,ANS) VALUES "
	cSQL = cSQL + "('"+pcUN+"'"
	cSQL = cSQL + ",'"+pcPRP+"'"
	cSQL = cSQL + ",'"+pcANS+"')"
ENDCASE
*MESSAGEBOX(cSQL,0,'AppSetup_Insert 2')
IF LEN(cSQL) > 0
	nSQLEXEC = SQLEXEC(nConn, cSQL )
*	MESSAGEBOX(cSQL,0,'AppSetup_Insert 3')
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL,nConn, nSQLEXEC, '')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ELSE
		lGoodSave = .T.
		TrackMess( cSQL )
	ENDIF
ENDIF

IF lNewConn 
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF
*MESSAGEBOX("lGoodSave = "+IIF(lGoodSave,"T","F"),0,'AppSetup_Insert')
RETURN lGoodSave
ENDPROC

*********************************
PROC AppSetup_Update_Ans 
PARAMETER pcAns, pcUN, pcPRP, pConnHandle
*AppSetup_Update_Ans( pcAns, pcUN, pcPRP, pConn )
*Look for Error:AppSetup_Update_Ans( cSalesP, cSalesP, 'SalesP'

IF VARTYPE(pcUN) != "C"
	RETURN .F.
ENDIF
IF VARTYPE(pcPRP) != "C"
	RETURN .F. 
ENDIF
IF EMPTY(ALLTRIM(pcPRP))
	RETURN .F.
ENDIF

IF VARTYPE(pcANS) != "C"
	RETURN .F. 
ENDIF
IF EMPTY(ALLTRIM(pcANS))
	RETURN .F.
ENDIF

PRIVATE lGoodSave
lGoodSave = .F.

PRIVATE lNewConn, nConn
lNewConn  =.F.
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
		lNewConn = .T.
	ENDIF
ELSE
	nConn = get_SQLSTRINGCONNECT()
	lNewConn = .T.
ENDIF

PRIVATE cAlias 
cAlias = ALIAS()

IF USED("tmpPSP_SQL21")
	USE IN tmpPSP_SQL21
ENDIF

*******************************************************************************************************************************************************************
IF pcPRP = 'SalesP'
	IF pcUN = pcAns
		PRIVATE cMach_User, cUserName, cMach
		cMach_User = SYS(0)
		cUserName = ALLTRIM(  RIGHT( cMach_User, LEN(cMach_User)-AT("#",cMach_User)-1 )  )
		cMach = LEFT( cMach_User, AT("#",cMach_User)-2 )
		pcUN = cUserName 

		TrackError("Changed UN from "+pcAns+" to "+pcUN+" in AppSetup_Update_Ans()","AppSetup_Update_Ans pcUN was same as pcAns.", PROGRAM(), LINENO(1))
	ENDIF
ENDIF
PRIVATE cSQL, nSQLEXEC

SELECT 0

cSQL = "SELECT COUNT(*) AS Cntd FROM dbo.AppSetup WITH(NOLOCK) "
cSQL = cSQL + " WHERE UN = '"+pcUN+"'"
cSQL = cSQL + " AND PRP = '"+pcPRP+"'"
*cSQL = cSQL + " AND ANS = '"+pcAns+"'"

*Probaly need to Update the ANS, so do not query with
*This update is not to find if an insert is needed.
*AppSetup_Update_Ans( cYourVersion ,"Latest", "Version" )	
TRY 
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL21" )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, "tmpPSP_SQL21" )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL21")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL21")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	
	IF USED("tmpPSP_SQL21")
*		MESSAGEBOX('USED(tmpPSP_SQL21)')
		
		IF tmpPSP_SQL21.Cntd > 0 
			IF pcPRP = "SalesP" AND LEN(pcANS) = 1 AND pcAns = pcUN
				*do not update
				lGoodSave = .T.
	
			ELSE
				IF ( pcPRP = 'Version' OR pcPRP = 'VersionNew' )  AND (pcUN= 'Latest' OR pcUN = 'Newest')
					
					cSQL = "UPDATE dbo.AppSetup SET ANS =  '"+pcANS+"' "
					cSQL = cSQL + " WHERE UN = '"+pcUN+"'"
					cSQL = cSQL + " AND PRP = '"+pcPRP+"'"
					
				ELSE
					*Counted > 0
					*--Simple update, not about SalesP or Version\VersionNew
					cSQL = "UPDATE dbo.AppSetup SET ANS = '"+pcANS+"'"
					cSQL = cSQL + " WHERE UN = '"+pcUN+"'"
					cSQL = cSQL + " AND PRP = '"+pcPRP+"'"
										
				ENDIF
				
*				MESSAGEBOX(cSQL,0,"UPDATE dbo.AppSetup " )
				
				nSQLEXEC = SQLEXEC(nConn, cSQL )
				DO WHILE nSQLEXEC = 0
					WAIT WINDOW 'SQL' TIMEOUT 1
					nSQLEXEC = SQLEXEC( nConn, cSQL )
				ENDDO
				IF nSQLEXEC < 0 &&Try again!
					nSQLEXEC = SQLEXEC(nConn, cSQL, "")
					DO WHILE nSQLEXEC = 0
						WAIT WINDOW 'SQL 2' TIMEOUT 1
						nSQLEXEC = SQLEXEC(nConn, cSQL, "")

						IF nSQLEXEC < 0
							IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
								nSQLEXEC = 0
							ENDIF
						ENDIF
					ENDDO
				ENDIF
				IF nSQLEXEC < 0
					SQLEXECError(cSQL,nConn, nSQLEXEC, '')
					RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
				ELSE
					IF NOT "PROC_SQL" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
						SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
					ENDIF
					TrackMess( cSQL )
					lGoodSave = .T.
				ENDIF
			ENDIF
		ELSE
			* did NOT find WHERE UN = '"+pcUN+"' AND PRP = '"+pcPRP+"'"	
			IF ( pcPRP = 'Version' OR pcPRP = 'VersionNew' ) AND (pcUN= 'Latest' OR pcUN = 'Newest')
				
				*Use Set_HPAVersion()
				
			ELSE
*MESSAGEBOX("pcUN="+pcUN+CHR(13)+",pcPRP="+pcPRP+CHR(13)+",pcANS="+pcANS,0,"AppSetup_Insert")

				*Error:AppSetup_Insert has 'SalesP' where UN='O' is same as ANS='O'.
				IF AppSetup_Insert(pcUN,pcPRP,pcANS, nConn )
					lGoodSave = .T.
*					MESSAGEBOX('lGoodSave = .T.',0,"AppSetup_Insert")
				ELSE
*					MESSAGEBOX('lGoodSave = .F.',0,"AppSetup_Insert")
				ENDIF
			ENDIF
		ENDIF
	ELSE
		
*		MESSAGEBOX(" NOT USED(tmpPSP_SQL21)",0,"AppSetup_Insert")
		
		IF AppSetup_Insert(pcUN,pcPRP,pcANS, nConn )
			lGoodSave = .T.
		ENDIF
	ENDIF
	
CATCH TO oException
	MESSAGEBOX("Could not Select or Update table AppSetup!"+CHR(13)+CHR(13)+cSQL+CHR(13)+CHR(13)+"nConn="+ALLTRIM(STR(nConn))+CHR(13)+"Check SQL Permissions!"+CHR(13)+CHR(13)+CHR(13)+"TRY Statement Failed in Proc_Setup.AppSetup_Update_Ans()"+CHR(13)+CHR(13)+"Please screen shot this for IT department.",16,"SQL Error.")
	*nSQLEXEC = SQLEXEC(nConn, "SELECT GETDATE()", "tmpDateTime" )
ENDTRY

IF lNewConn 
	SQLDISCONNECT(nConn )
ENDIF

IF USED("tmpPSP_SQL22")
	USE IN tmpPSP_SQL22
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lGoodSave
ENDPROC

*********************************
PROC AppSetup_Update_Version 
PARAMETER pcAns, pcUN, pcPRP, pConnHandle
*AppSetup_Update_Version( pcAns,       pcUN, 'Version', pConn )
*AppSetup_Update_Version( cVersion, cPC_Name, 'Version', pConn )

IF VARTYPE(pcUN) != "C"
	RETURN .F.
ENDIF
IF VARTYPE(pcPRP) != "C"
	RETURN .F. 
ELSE
	*pcPRP = 'Version'
	*pcPRP = 'VersionNew'
ENDIF
IF EMPTY(ALLTRIM(pcPRP))
	RETURN .F.
ENDIF

IF VARTYPE(pcANS) != "C"
	RETURN .F. 
ENDIF
IF EMPTY(ALLTRIM(pcANS))
	RETURN .F.
ENDIF

PRIVATE lGoodSave
lGoodSave = .F.

PRIVATE lNewConn, nConn
lNewConn  =.F.
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
		lNewConn = .T.
	ENDIF
ELSE
	nConn = get_SQLSTRINGCONNECT()
	lNewConn = .T.
ENDIF

PRIVATE cAlias 
cAlias = ALIAS()

IF USED("tmpPSP_SQL21")
	USE IN tmpPSP_SQL21
ENDIF

PRIVATE cSQL, nSQLEXEC

SELECT 0

cSQL = "SELECT COUNT(*) AS Cntd FROM dbo.AppSetup WITH(NOLOCK) "
cSQL = cSQL + " WHERE UN = '"+pcUN+"'"
cSQL = cSQL + " AND PRP = '"+pcPRP+"'"
*cSQL = cSQL + " WHERE PRP = '"+pcPRP+"'"
*cSQL = cSQL + " AND ANS = '"+pcAns+"'"
*Probbaly need to Update the ANS

TRY 
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL21" )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, "tmpPSP_SQL21" )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL21")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL21")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	
	IF USED("tmpPSP_SQL21")
*		MESSAGEBOX('USED(tmpPSP_SQL21)')
		
		IF tmpPSP_SQL21.Cntd > 0 
*!*				DO CASE 
*!*				CASE ( pcPRP = 'Version' OR pcPRP = 'VersionNew' )  AND (pcUN= 'Latest' OR pcUN = 'Newest')
*!*						
					cSQL = "UPDATE dbo.AppSetup SET ANS =  '"+pcANS+"' "
					cSQL = cSQL + " WHERE UN = '"+pcUN+"'"
					cSQL = cSQL + " AND PRP = '"+pcPRP+"'"
					*cSQL = cSQL + " WHERE PRP = '"+pcPRP+"'"
*!*						
*!*				OTHERWISE
*!*						*Counted > 0
*!*						*--Simple update, not about SalesP or Version\VersionNew
*!*						cSQL = "UPDATE dbo.AppSetup SET ANS = '"+pcANS+"'"
*!*						cSQL = cSQL + " WHERE UN = '"+pcUN+"'"
*!*						cSQL = cSQL + " AND PRP = '"+pcPRP+"'"
*!*											
*!*				ENDCASE
				
*				MESSAGEBOX(cSQL,0,"UPDATE dbo.AppSetup " )
*			IF NOT lGoodSave

				nSQLEXEC = SQLEXEC(nConn, cSQL )
				DO WHILE nSQLEXEC = 0
					WAIT WINDOW 'SQL' TIMEOUT 1
					nSQLEXEC = SQLEXEC( nConn, cSQL )
				ENDDO
				IF nSQLEXEC < 0 &&Try again!
					nSQLEXEC = SQLEXEC(nConn, cSQL, "")
					DO WHILE nSQLEXEC = 0
						WAIT WINDOW 'SQL 2' TIMEOUT 1
						nSQLEXEC = SQLEXEC(nConn, cSQL, "")

						IF nSQLEXEC < 0
							IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
								nSQLEXEC = 0
							ENDIF
						ENDIF
					ENDDO
				ENDIF
				
				IF NOT "PROC_SQL" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
					SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
				ENDIF

				IF nSQLEXEC < 0
					SQLEXECError(cSQL,nConn, nSQLEXEC, '')
					RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
				ELSE
					TrackMess( cSQL )
					lGoodSave = .T.
				ENDIF
*			ENDIF
		
		
		ELSE
			*Cntd = 0
			* did NOT find WHERE UN = '"+pcUN+"' AND PRP = '"+pcPRP+"'"	
			IF ( pcPRP = 'Version' OR pcPRP = 'VersionNew' ) 
										*AND (pcUN= 'Latest' OR pcUN = 'Newest')
				*update with newest and greatest revision
				*		pcUN is Machine,'VersionNew',nVersion
				IF AppSetup_Insert(pcUN,pcPRP,pcANS, nConn )
					lGoodSave = .T.
				ENDIF
			ENDIF
		ENDIF

	ELSE
		*Query failed
		IF AppSetup_Insert(pcUN,pcPRP,pcANS, nConn )
			lGoodSave = .T.
		ENDIF
	ENDIF
	
CATCH TO oException
*!*		*MESSAGEBOX("Could not Select or Update table AppSetup!"+CHR(13)+CHR(13)+cSQL+CHR(13)+CHR(13)+"nConn="+ALLTRIM(STR(nConn))+CHR(13)+"Check SQL Permissions!"+CHR(13)+CHR(13)+CHR(13)+"TRY Statement Failed in Proc_Setup.AppSetup_Update_Ans()"+CHR(13)+CHR(13)+"Please screen shot this for IT department.",16,"SQL Error.")
*!*		*nSQLEXEC = SQLEXEC(nConn, "SELECT GETDATE()", "tmpDateTime" )

ENDTRY

IF lNewConn 
	SQLDISCONNECT(nConn )
ENDIF

IF USED("tmpPSP_SQL22")
	USE IN tmpPSP_SQL22
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lGoodSave
ENDPROC
*********************************


PROCEDURE AppSetup_Delete 
PARAMETER pcUN, pcPRP, pConnHandle
*AppSetup_Delete( pcUN, pcPRP, pConn )

IF VARTYPE(pcUN) != "C"
	RETURN .F.
ENDIF
IF VARTYPE(pcPRP) != "C"
	RETURN .F. 
ENDIF
IF EMPTY(ALLTRIM(pcPRP))
	RETURN .F.
ENDIF

*IF VARTYPE(pcANS) != "C"
*	RETURN .F. 
*ENDIF
*IF EMPTY(ALLTRIM(pcANS))
*	RETURN .F.
*ENDIF

PRIVATE lGoodSave
lGoodSave = .F.

PRIVATE lNewConn, nConn
lNewConn  =.F.
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
		lNewConn = .T.
	ENDIF
ELSE
	nConn = get_SQLSTRINGCONNECT()
	lNewConn = .T.
ENDIF

PRIVATE cAlias 
cAlias = ALIAS()

IF USED("tmpPSP_SQL23")
	USE IN tmpPSP_SQL23
ENDIF

PRIVATE cSQL, nSQLEXEC

SELECT 0
cSQL = "DELETE FROM dbo.AppSetup "
cSQL = cSQL + " WHERE UN = '"+pcUN+"'"
cSQL = cSQL + " AND PRP = '"+pcPRP+"'"
*cSQL = cSQL + " AND ANS = '"+pcAns+"'"


TRY 
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL23" )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, "tmpPSP_SQL23" )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL23")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL23")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ELSE
		lGoodSave = .T.
	ENDIF
	
CATCH TO oException
	MESSAGEBOX("Could not delete from table AppSetup!"+CHR(13)+cSQL+CHR(13)+"nConn="+ALLTRIM(STR(nConn))+CHR(13)+"Check SQL Permissions!"+CHR(13)+CHR(13)+CHR(13)+"TRY Statement Failed in Proc_Setup.AppSetup_Delete()"+CHR(13)+CHR(13)+"Please screen shot this for IT department."+CHR(13)+cSQL,16,"SQL Error.")
	*nSQLEXEC = SQLEXEC(nConn, "SELECT GETDATE()", "tmpDateTime" )
ENDTRY

IF lNewConn 
	SQLDISCONNECT(nConn )
ENDIF

IF USED("tmpPSP_SQL23")
	USE IN tmpPSP_SQL23
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lGoodSave
ENDPROC

*********************************
PROC AppSetup_Update_Profile_Names 
PARAMETER pProfileName, pEmail, pConnHandle
*AppSetup_Update_Profile_Names( cProfileName, cEmail, pConn )

IF VARTYPE(pProfileName) != "C"
	RETURN .F.
ENDIF
IF VARTYPE(pEmail) != "C"
	RETURN .F.
ENDIF
IF EMPTY(pProfileName)
	RETURN .F.
ENDIF
IF EMPTY(pEmail)
	RETURN .F.
ENDIF

PRIVATE lReturn
lReturn = .T.

PRIVATE lNewConn, nConn
lNewConn  =.F.

IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
		lNewConn = .T.
	ENDIF
ELSE
	nConn= get_SQLSTRINGCONNECT()
	lNewConn = .T.
ENDIF

PRIVATE cAlias 
cAlias = ALIAS()

IF USED("cntAppSetup")
	USE IN cntAppSetup
ENDIF

PRIVATE cSQL, nSQLEXEC
**Check Profile Name
SELECT 0
*cSQL = "SELECT COUNT(*) AS Cntd FROM dbo.Profile_Names "
*cSQL = cSQL + " WHERE Profile_Name = '"+pProfileName+"'"
cSQL = "SELECT COUNT(*) AS Cntd FROM dbo.AppSetup WITH(NOLOCK) "
cSQL = cSQL + " WHERE PRP='Profile_Name' AND ANS='"+pEmail+"'"


nSQLEXEC = SQLEXEC(nConn, cSQL, "cntAppSetup" )
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, "cntAppSetup" )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "cntAppSetup")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "cntAppSetup")

		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF USED("cntAppSetup")
	IF cntAppSetup.Cntd = 0 
		*Insert
		cSQL = "INSERT INTO dbo.AppSetup ([UN],[PRP],[ANS]) VALUES "
		cSQL = cSQL + "('"+pProfileName+"'"
		cSQL = cSQL + ",'Profile_Name'"
		cSQL = cSQL + ",'"+pEmail+"')"
		
		nSQLEXEC = SQLEXEC(nConn, cSQL )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC( nConn, cSQL )
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(nConn, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(nConn, cSQL, "")

				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL,nConn, nSQLEXEC, '')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
			lReturn = .F.
		ELSE
			TrackMess( cSQL )
		ENDIF
	ENDIF
ENDIF


IF lNewConn 
	SQLDISCONNECT(nConn )
ENDIF

IF USED("cntAppSetup")
	USE IN cntAppSetup
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lReturn 
ENDPROC

********************************** 
PROCEDURE HavePermission 
PARAMETERS cTask,lReportFailure
*IF HavePermission('Task')
*returns .T. or .F.

*--Select DISTINCT ANS from dbo.AppSetup WHERE PRP='YES'
*Admin AdminDeleteCert DeleteMFGlog 
*EditStockLst EditStockLstCostValue EditStockWants EditUserInfo ReReceiveSTK
*FinalizeMoney FinalizeQuantity 
*'PackingSlip Edit' 
*EditPOLate AdminCancelPO AdminDeletePO ReconcilePO 
*RMA_Approval RMA_Cancel 
*CompleteSO AdminSODelete
*VendorApproval VendorInactive  


IF VARTYPE(cTask)!="C"
	RETURN .F.
ENDIF

IF VARTYPE(lReportFailure)!="L"
	lReportFailure = .F.
ENDIF

PRIVATE lReturnApprove
lReturnApprove = .F.

PRIVATE nConn
nConn = get_SQLSTRINGCONNECT()

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cMach_User, cUserName, cMach
cMach_User = SYS(0)
cUserName = ALLTRIM(  RIGHT( cMach_User, LEN(cMach_User)-AT("#",cMach_User)-1 )  )
cMach = LEFT( cMach_User, AT("#",cMach_User)-2 )

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPSP_SQL24')
	USE IN tmpPSP_SQL24
ENDIF
SELECT 0

IF nConn > 0
	* Prefer v_AppUserEffectivePermission when deployed; else legacy AppSetup (no invalid-object error)
	IF AppPermission_ViewExists(nConn)
		cSQL = "SELECT TOP 1 PermissionCode FROM dbo.v_AppUserEffectivePermission WITH(NOLOCK) "
		cSQL = cSQL + "WHERE UserName = '"+ALLTRIM(cUserName)+"' AND PermissionCode = '"+cTask+"'"
	ELSE
		cSQL = "SELECT [PRP] FROM dbo.AppSetup WITH(NOLOCK) WHERE [UN] = '"+ALLTRIM(cUserName)+"' AND [ANS] = '"+cTask+"'"
	ENDIF
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL24' )
	IF nSQLEXEC < 0 AND AppPermission_ViewExists(nConn)
		* View query failed — legacy AppSetup path
		cSQL = "SELECT [PRP] FROM dbo.AppSetup WITH(NOLOCK) WHERE [UN] = '"+ALLTRIM(cUserName)+"' AND [ANS] = '"+cTask+"'"
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL24' )
	ENDIF
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL24' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL24")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL24")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPSP_SQL24')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
	
	IF USED('tmpPSP_SQL24')
		IF RECCOUNT('tmpPSP_SQL24') > 0
			* New view returns PermissionCode; legacy returns PRP = YES
			IF USED('tmpPSP_SQL24') AND TYPE('tmpPSP_SQL24.PermissionCode') # 'U'
				lReturnApprove = .T.
			ELSE
				IF VARTYPE(tmpPSP_SQL24.PRP) = "C"
					IF UPPER(tmpPSP_SQL24.PRP) = "YES"
						lReturnApprove = .T.
					ELSE
						IF lReportFailure
							TrackError(cUserName +" tried to "+cTask+".","No Permission ","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
						ENDIF
					ENDIF
				ENDIF
			ENDIF
		ENDIF
		USE IN tmpPSP_SQL24
	ENDIF
	
	SQLDISCONNECT( nConn )
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lReturnApprove
ENDPROC

**********************************
FUNCTION AppPermission_ViewExists
LPARAMETERS tnConn
LOCAL lnRet, lcSQL
IF VARTYPE(tnConn) # "N" OR tnConn < 1
	RETURN .F.
ENDIF
IF USED("tmpPermViewChk")
	USE IN tmpPermViewChk
ENDIF
lcSQL = "SELECT OBJECT_ID(N'dbo.v_AppUserEffectivePermission', N'V') AS Vid"
lnRet = SQLEXEC(tnConn, lcSQL, "tmpPermViewChk")
IF lnRet > 0 AND USED("tmpPermViewChk") AND !ISNULL(tmpPermViewChk.Vid)
	USE IN tmpPermViewChk
	RETURN .T.
ENDIF
IF USED("tmpPermViewChk")
	USE IN tmpPermViewChk
ENDIF
RETURN .F.

********************************** 
PROCEDURE HaveVendorApprovedPermission 
*HaveVendorApprovedPermission()

PRIVATE lReturnApprove
lReturnApprove = .F.

PRIVATE nConn
nConn = get_SQLSTRINGCONNECT()

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cMach_User, cUserName, cMach
cMach_User = SYS(0)
cUserName = ALLTRIM(  RIGHT( cMach_User, LEN(cMach_User)-AT("#",cMach_User)-1 )  )
cMach = LEFT( cMach_User, AT("#",cMach_User)-2 )

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPSP_SQL26')
	USE IN tmpPSP_SQL26
ENDIF
SELECT 0

IF nConn > 0
	*Un = cUserName AND SETUP.Prp = "Machine"
	cSQL = "SELECT [PRP] FROM dbo.AppSetup WITH(NOLOCK) WHERE [UN] = '"+ALLTRIM(cUserName)+"' AND [ANS] = 'VendorApproval'"
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL26' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL26' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL26")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL26")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPSP_SQL26')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
	
	IF USED('tmpPSP_SQL26')
		IF RECCOUNT('tmpPSP_SQL26') > 0
			IF VARTYPE(tmpPSP_SQL26.PRP) = "C"
				IF tmpPSP_SQL26.PRP = "YES"
					lReturnApprove = .T.
				ELSE
					TrackError(cUserName +" tried to Approve Vendor.","No Vendor Permission ","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
				ENDIF
			ENDIF
		ENDIF
		
		USE IN tmpPSP_SQL26
	ENDIF
	
	SQLDISCONNECT( nConn )
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lReturnApprove
ENDPROC
**********************************
PROCEDURE HaveVendorInactivePermission 
*HaveVendorInactivePermission()

PRIVATE lReturnApprove
lReturnApprove = .F.

PRIVATE nConn
nConn = get_SQLSTRINGCONNECT()

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cMach_User, cUserName, cMach
cMach_User = SYS(0)
cUserName = ALLTRIM(  RIGHT( cMach_User, LEN(cMach_User)-AT("#",cMach_User)-1 )  )
cMach = LEFT( cMach_User, AT("#",cMach_User)-2 )

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPSP_SQL27')
	USE IN tmpPSP_SQL27
ENDIF
SELECT 0

IF nConn > 0
	*Un = cUserName AND SETUP.Prp = "Machine"
	cSQL = "SELECT [PRP] FROM dbo.AppSetup WITH(NOLOCK) WHERE [UN] = '"+ALLTRIM(cUserName)+"' AND [ANS] = 'VendorInactive'"
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL27' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL27' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL27")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL27")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPSP_SQL27')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
	
	IF USED('tmpPSP_SQL27')
		IF RECCOUNT('tmpPSP_SQL27') > 0
			IF VARTYPE(tmpPSP_SQL27.PRP) = "C"
				IF tmpPSP_SQL27.PRP = "YES"
					lReturnApprove = .T.
				ELSE
					TrackError(cUserName+" tried to 'Inactive' Vendor.","No Vendor Inactive Permission ","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
				ENDIF
			ENDIF
		ENDIF
		
		USE IN tmpPSP_SQL27
	ENDIF
	
	SQLDISCONNECT( nConn )
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lReturnApprove
ENDPROC

**********************************
PROCEDURE AllowFinalizeQuantity 
*AllowFinalizeQuantity()

PRIVATE lReturnApprove
lReturnApprove = .F.

PRIVATE nConn
nConn = get_SQLSTRINGCONNECT()

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cMach_User, cUserName, cMach
cMach_User = SYS(0)
cUserName = ALLTRIM(  RIGHT( cMach_User, LEN(cMach_User)-AT("#",cMach_User)-1 )  )
cMach = LEFT( cMach_User, AT("#",cMach_User)-2 )

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPSP_SQL28')
	USE IN tmpPSP_SQL28
ENDIF
SELECT 0

IF nConn > 0
	*Un = cUserName AND SETUP.Prp = "Machine"
	cSQL = "SELECT [PRP] FROM dbo.AppSetup WITH(NOLOCK) WHERE [UN] = '"+ALLTRIM(cUserName)+"' AND [ANS] = 'FinalizeQuantity'"
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL28' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL28' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL28")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL28")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPSP_SQL28')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
	
	IF USED('tmpPSP_SQL28')
		IF RECCOUNT('tmpPSP_SQL28') > 0
			IF VARTYPE(tmpPSP_SQL28.PRP) = "C"
				IF tmpPSP_SQL28.PRP = "YES"
					lReturnApprove = .T.
				ELSE
					TrackError(cUserName+" tried Allowed Finalize Quantity.","Allow Finalize Quantity","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
				ENDIF
			ENDIF
		ENDIF
		
		USE IN tmpPSP_SQL28
	ENDIF
	
	SQLDISCONNECT( nConn )
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lReturnApprove
ENDPROC

**********************************
PROCEDURE AllowFinalizeMoney 
*AllowFinalizeMoney()

PRIVATE lReturnApprove
lReturnApprove = .F.

PRIVATE nConn
nConn = get_SQLSTRINGCONNECT()

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cMach_User, cUserName, cMach
cMach_User = SYS(0)
cUserName = ALLTRIM(  RIGHT( cMach_User, LEN(cMach_User)-AT("#",cMach_User)-1 )  )
cMach = LEFT( cMach_User, AT("#",cMach_User)-2 )

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPSP_SQL29')
	USE IN tmpPSP_SQL29
ENDIF
SELECT 0

IF nConn > 0
	*Un = cUserName AND SETUP.Prp = "Machine"
	cSQL = "SELECT [PRP] FROM dbo.AppSetup WITH(NOLOCK) WHERE [UN] = '"+ALLTRIM(cUserName)+"' AND [ANS] = 'FinalizeMoney'"
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL29' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL29' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL29")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL29")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPSP_SQL29')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
	
	IF USED('tmpPSP_SQL29')
		IF RECCOUNT('tmpPSP_SQL29') > 0
			IF VARTYPE(tmpPSP_SQL29.PRP) = "C"
				IF tmpPSP_SQL29.PRP = "YES"
					lReturnApprove = .T.
				ELSE
					TrackError(cUserName+" tried to Finalize Money.","Allow Finalize Money","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
				ENDIF
			ENDIF
		ENDIF
		
		USE IN tmpPSP_SQL29
	ENDIF
	
	SQLDISCONNECT( nConn )
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lReturnApprove
ENDPROC

**********************************
PROCEDURE AllowAdminPODelete 
*AllowAdminPODelete()

PRIVATE lReturnApprove
lReturnApprove = .F.

PRIVATE nConn
nConn = get_SQLSTRINGCONNECT()

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cMach_User, cUserName, cMach
cMach_User = SYS(0)
cUserName = ALLTRIM(  RIGHT( cMach_User, LEN(cMach_User)-AT("#",cMach_User)-1 )  )
cMach = LEFT( cMach_User, AT("#",cMach_User)-2 )

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPSP_SQL30')
	USE IN tmpPSP_SQL30
ENDIF
SELECT 0

IF nConn > 0
	*Un = cUserName AND SETUP.Prp = "Machine"
	cSQL = "SELECT [PRP] FROM dbo.AppSetup WITH(NOLOCK) WHERE [UN] = '"+ALLTRIM(cUserName)+"' AND [ANS] = 'AdminDeletePO'"
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL30' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL30' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL30")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL30")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPSP_SQL30')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
	
	IF USED('tmpPSP_SQL30')
		IF RECCOUNT('tmpPSP_SQL30') > 0
			IF VARTYPE(tmpPSP_SQL30.PRP) = "C"
				IF tmpPSP_SQL30.PRP = "YES"
					lReturnApprove = .T.
				ELSE
					*TrackError(cUserName+" tried to Admin PO Delete.","Allow Admin PO Delete","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
				ENDIF
			ENDIF
		ENDIF
		
		USE IN tmpPSP_SQL30
	ENDIF
	
	SQLDISCONNECT( nConn )
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lReturnApprove
ENDPROC

**********************************
PROCEDURE AllowAdminPOCancel 
*AllowAdminPOCancel()

*****
IF AllowAdminPODelete()
	*If user has AdminPODelete, Give AdminPOCancel
	RETURN .T.
ENDIF
****

PRIVATE lReturnApprove
lReturnApprove = .F.

PRIVATE nConn
nConn = get_SQLSTRINGCONNECT()

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cMach_User, cUserName, cMach
cMach_User = SYS(0)
cUserName = ALLTRIM(  RIGHT( cMach_User, LEN(cMach_User)-AT("#",cMach_User)-1 )  )
cMach = LEFT( cMach_User, AT("#",cMach_User)-2 )

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPSP_SQL31')
	USE IN tmpPSP_SQL31
ENDIF
SELECT 0

IF nConn > 0
	*Un = cUserName AND SETUP.Prp = "Machine"
	cSQL = "SELECT [PRP] FROM dbo.AppSetup WITH(NOLOCK) WHERE [UN] = '"+ALLTRIM(cUserName)+"' AND [ANS] = 'AdminCancelPO'"
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL31' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL31' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL31")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL31")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPSP_SQL31')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
	
	IF USED('tmpPSP_SQL31')
		IF RECCOUNT('tmpPSP_SQL31') > 0
			IF VARTYPE(tmpPSP_SQL31.PRP) = "C"
				IF tmpPSP_SQL31.PRP = "YES"
					lReturnApprove = .T.
				ELSE
					*TrackError(cUserName+" tried to Admin PO Delete.","Allow Admin PO Delete","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
				ENDIF
			ENDIF
		ENDIF
		
		USE IN tmpPSP_SQL31
	ENDIF
	
	SQLDISCONNECT( nConn )
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lReturnApprove
ENDPROC

**********************************
PROCEDURE AllowAdmin 
*lHaveAdminPermission = AllowAdmin()

PRIVATE lReturnApprove
lReturnApprove = .F.

PRIVATE nConn
nConn = get_SQLSTRINGCONNECT()

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cMach_User, cUserName, cMach
cMach_User = SYS(0)
cUserName = ALLTRIM(  RIGHT( cMach_User, LEN(cMach_User)-AT("#",cMach_User)-1 )  )
cMach = LEFT( cMach_User, AT("#",cMach_User)-2 )

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPSP_SQL32')
	USE IN tmpPSP_SQL32
ENDIF
SELECT 0

IF nConn > 0
	*Un = cUserName AND SETUP.Prp = "Machine"
	cSQL = "SELECT [PRP] FROM dbo.AppSetup WITH(NOLOCK) WHERE [UN] = '"+ALLTRIM(cUserName)+"' AND [ANS] = 'Admin'"
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL32' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL32' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL32")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL32")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPSP_SQL32')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
	
	IF USED('tmpPSP_SQL32')
		IF RECCOUNT('tmpPSP_SQL32') > 0
			IF VARTYPE(tmpPSP_SQL32.PRP) = "C"
				IF tmpPSP_SQL32.PRP = "YES"
					lReturnApprove = .T.
				ELSE
					*TrackError(cUserName+" tried to Admin PO Delete.","Allow Admin ","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
				ENDIF
			ENDIF
		ENDIF
		
		USE IN tmpPSP_SQL32
	ENDIF
	
	SQLDISCONNECT( nConn )
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lReturnApprove
ENDPROC
****************************************************

PROCEDURE AllowCertDelete 
PARAMETERS pConnHandle
*AllowCertDelete()


PRIVATE lNewConn, nConn
lNewConn  =.F.
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
		lNewConn = .T.
	ENDIF
ELSE
	nConn= get_SQLSTRINGCONNECT()
	lNewConn = .T.
ENDIF



PRIVATE lReturnApprove
lReturnApprove = .F.

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cMach_User, cUserName, cMach
cMach_User = SYS(0)
cUserName = ALLTRIM(  RIGHT( cMach_User, LEN(cMach_User)-AT("#",cMach_User)-1 )  )
cMach = LEFT( cMach_User, AT("#",cMach_User)-2 )

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPSP_SQL33')
	USE IN tmpPSP_SQL33
ENDIF
SELECT 0

IF nConn > 0
	*Un = cUserName AND SETUP.Prp = "Machine"
	*INSERT INTO dbo.AppSetup ([UN],[PRP],[ANS]) VALUES ( 'David Kirchner','YES','AdminDeleteCert')
	cSQL = "SELECT [PRP] FROM dbo.AppSetup WITH(NOLOCK) WHERE [UN] = '"+ALLTRIM(cUserName)+"' AND [ANS] = 'AdminDeleteCert'"
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL33' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL33' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL33")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL33")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPSP_SQL33')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
	
	IF USED('tmpPSP_SQL33')
		IF RECCOUNT('tmpPSP_SQL33') > 0
			IF VARTYPE(tmpPSP_SQL33.PRP) = "C"
				IF tmpPSP_SQL33.PRP = "YES"
					lReturnApprove = .T.
				ELSE
					TrackError(cUserName+" tried to Delete Cert.","Allow Cert Delete ","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
				ENDIF
			ENDIF
		ENDIF
		
		USE IN tmpPSP_SQL33
	ENDIF
	
	IF lNewConn 
		SQLDISCONNECT(nConn )
	ENDIF
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lReturnApprove
ENDPROC
**************************************************** 

PROCEDURE HaveSODeletePermission 
PARAMETERS nSalesNum
*HaveSODeletePermission(nSalesNum)

IF VARTYPE(nSalesNum) != "N"
	RETURN .F.
ENDIF

PRIVATE lReturnApprove
lReturnApprove = .F.

PRIVATE nConn
nConn = get_SQLSTRINGCONNECT()

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cMach_User, cUserName, cMach
cMach_User = SYS(0)
cUserName = ALLTRIM(  RIGHT( cMach_User, LEN(cMach_User)-AT("#",cMach_User)-1 )  )
cMach = LEFT( cMach_User, AT("#",cMach_User)-2 )

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPSP_SQL34')
	USE IN tmpPSP_SQL34
ENDIF
SELECT 0

IF nConn > 0
	*Un = cUserName AND SETUP.Prp = "Machine"
	cSQL = "SELECT [PRP] FROM dbo.AppSetup WITH(NOLOCK) WHERE [UN] = '"+ALLTRIM(cUserName)+"' AND [ANS] = 'AdminSODelete'"
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL34' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL34' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL34")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL34")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPSP_SQL34')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
	
	IF USED('tmpPSP_SQL34')
		IF RECCOUNT('tmpPSP_SQL34') > 0
			IF VARTYPE(tmpPSP_SQL34.PRP) = "C"
				IF tmpPSP_SQL34.PRP = "YES"
					lReturnApprove = .T.
				ELSE
					*Check for other rights to delete that SO
				ENDIF
			ELSE
	*			*Check for other rights to delete that SO
			ENDIF
		ENDIF
	ELSE
*		*Check for other rights to delete that SO
	ENDIF
	
	IF USED('tmpPSP_SQL34')
		USE IN tmpPSP_SQL34
	ENDIF
	
	
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT lReturnApprove 
	*Need to check User with SO
	
	IF nSalesNum < 1
		MESSAGEBOX("No Sales Number!",0,"Cannot Change")
	ELSE
		cSQL = "SELECT COUNT(*) AS cntd FROM dbo.Sales_No "
		cSQL = cSQL + " WHERE Salesnum = "+ALLTRIM(STR(nSalesNum))
		cSQL = cSQL + " AND SalesRep = '"+ALLTRIM(cUserName)+"'"
		*Does not check Cover!
		
		IF USED('tmpPSP_SQL35')
			USE IN tmpPSP_SQL35
		ENDIF
		SELECT 0
			
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL35' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL35' )
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL35")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL35")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPSP_SQL35')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
		
		IF USED('tmpPSP_SQL35')
			IF RECCOUNT('tmpPSP_SQL35') > 0
				IF VARTYPE(tmpPSP_SQL35.CNTD) = "N"
					IF tmpPSP_SQL35.CNTD > 0
						lReturnApprove = .T.
					ELSE
					**	
					ENDIF
				ENDIF
			ENDIF
			
			USE IN tmpPSP_SQL35
		ENDIF
		
		*******************
		IF NOT lReturnApprove 
			*Check for Cover
			PRIVATE cSalesP
			cSalesP = AppSetup_Login_SalesP()
			
			cSQL = "SELECT COUNT(*) AS cntd FROM dbo.AllQuotes "
			cSQL = cSQL + " WHERE Salesnum = "+ALLTRIM(STR(nSalesNum))
			cSQL = cSQL + " AND Cover = '"+ALLTRIM(cSalesP)+"'"
			
			
			IF USED('tmpPSP_SQL36')
				USE IN tmpPSP_SQL36
			ENDIF
			SELECT 0
				
			nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL36' )
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL' TIMEOUT 1
				nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL36' )
			ENDDO
			IF nSQLEXEC < 0 &&Try again!
				nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL36")
				DO WHILE nSQLEXEC = 0
					WAIT WINDOW 'SQL 2' TIMEOUT 1
					nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL36")

					IF nSQLEXEC < 0
						IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
							nSQLEXEC = 0
						ENDIF
					ENDIF
				ENDDO
			ENDIF
			IF nSQLEXEC < 0
				SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPSP_SQL36')
				RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
			ENDIF
			
			IF USED('tmpPSP_SQL36')
				IF RECCOUNT('tmpPSP_SQL36') > 0

					IF tmpPSP_SQL36.CNTD > 0
						lReturnApprove = .T.
					ENDIF

				ENDIF
				
				USE IN tmpPSP_SQL36
			ENDIF			
		ENDIF	
		
		*******************
		
		IF NOT lReturnApprove 
			*Check for Short Name!
			cUserName = ALLTRIM( ShortSalesP(cUserName) )
			
			*Un = cUserName AND SETUP.Prp = "Machine"
			cSQL = "SELECT COUNT(*) AS cntd FROM dbo.AppSetup WITH(NOLOCK) WHERE [UN] = '"+ALLTRIM(cUserName)+"' AND [PRP] = 'SalesP'"
			
			nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL36' )
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL' TIMEOUT 1
				nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL36' )
			ENDDO
			IF nSQLEXEC < 0 &&Try again!
				nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL36")
				DO WHILE nSQLEXEC = 0
					WAIT WINDOW 'SQL 2' TIMEOUT 1
					nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL36")

					IF nSQLEXEC < 0
						IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
							nSQLEXEC = 0
						ENDIF
					ENDIF
				ENDDO
			ENDIF
			IF nSQLEXEC < 0
				SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPSP_SQL36')
				RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
			ENDIF
			
			IF USED('tmpPSP_SQL36')
				IF RECCOUNT('tmpPSP_SQL36') > 0
					IF tmpPSP_SQL36.CNTD > 0
						lReturnApprove = .T.
					ENDIF
				ENDIF
			ELSE
		*		*Check for other rights to delete that SO
			ENDIF
			
			IF USED('tmpPSP_SQL36')
				USE IN tmpPSP_SQL36
			ENDIF
		ENDIF
		
		*******************
		
		IF NOT lReturnApprove 
			*State Not Apporved
			
			IF USED('tmpSOsp')
				USE IN tmpSOsp
			ENDIF
			SELECT 0

			cSQL = "SELECT SalesRep FROM dbo.Sales_No WITH(NOLOCK)"
			cSQL = cSQL + " WHERE Salesnum = "+ALLTRIM(STR(nSalesNum))			
				
			nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpSOsp' )
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL' TIMEOUT 1
				nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpSOsp' )
			ENDDO
			IF nSQLEXEC < 0 &&Try again!
				nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpSOsp")
				DO WHILE nSQLEXEC = 0
					WAIT WINDOW 'SQL 2' TIMEOUT 1
					nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpSOsp")

					IF nSQLEXEC < 0
						IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
							nSQLEXEC = 0
						ENDIF
					ENDIF
				ENDDO
			ENDIF
			IF nSQLEXEC < 0
				SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpSOsp')
				RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
			ENDIF
			
			PRIVATE cSalesRep
			cSalesRep = ""
			
			IF USED('tmpSOsp')
				IF VARTYPE(tmpSOsp.SalesRep)="C"
					cSalesRep = ALLTRIM(tmpSOsp.SalesRep)
				ENDIF
				USE IN tmpSOsp
			ENDIF
		**			
			WAIT WINDOW "User:"+cUserName+" is not allowed to Change this SO: "+ALLTRIM(STR(nSalesNum))+" as it belongs to another SalesP."
			TrackError(cUserName+" tried to Change another SalesP '"+cSalesRep+"' SO: "+ALLTRIM(STR(nSalesNum)),"Deny SO Delete ","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())

		ENDIF
		*******		
	ENDIF
	
ENDIF

SQLDISCONNECT( nConn )
	
IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lReturnApprove
ENDPROC

******************************************************

PROCEDURE HaveSOCompletePermission 
PARAMETERS nSalesNum, pConnHandle
*IF HaveSOCompletePermission(nSalesNum,nConn)

IF VARTYPE(nSalesNum) != "N"
	RETURN .F.
ENDIF

PRIVATE lNewConn, nConn
lNewConn  =.F.
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
		lNewConn = .T.
	ENDIF
ELSE
	nConn= get_SQLSTRINGCONNECT()
	lNewConn = .T.
ENDIF

PRIVATE lReturnApprove
*lReturnApprove = .F.
lReturnApprove = .T.	&&Approved for now.

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cMach_User, cUserName, cMach
cMach_User = SYS(0)
cUserName = ALLTRIM(  RIGHT( cMach_User, LEN(cMach_User)-AT("#",cMach_User)-1 )  )
cMach = LEFT( cMach_User, AT("#",cMach_User)-2 )

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPSP_SQL37')
	USE IN tmpPSP_SQL37
ENDIF
SELECT 0

IF nConn > 0
	*Un = cUserName AND SETUP.Prp = "Machine"
	cSQL = "SELECT [PRP] FROM dbo.AppSetup WITH(NOLOCK) WHERE [UN] = '"+ALLTRIM(cUserName)+"' AND [ANS] = 'AdminSOcmplt'"
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL37' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL37' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL37")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL37")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPSP_SQL37')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
	
	IF USED('tmpPSP_SQL37')
		IF RECCOUNT('tmpPSP_SQL37') > 0
			IF VARTYPE(tmpPSP_SQL37.PRP) = "C"
				IF tmpPSP_SQL37.PRP = "YES"
					lReturnApprove = .T.
				ELSE
					*Check for other rights to delete that SO
				ENDIF
			ELSE
	*			*Check for other rights to delete that SO
			ENDIF
		ENDIF
	ELSE
*		*Check for other rights to delete that SO
	ENDIF
	
	IF USED('tmpPSP_SQL37')
		USE IN tmpPSP_SQL37
	ENDIF
	
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF


IF lNewConn 
	SQLDISCONNECT(nConn )
ENDIF
	
IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lReturnApprove
ENDPROC
**************************************************** 

PROCEDURE HaveSOCancelPermission 
PARAMETERS nSalesNum
*IF HaveSOCancelPermission(nSalesNum)

IF VARTYPE(nSalesNum) != "N"
	RETURN .F.
ENDIF

PRIVATE cMach_User, cUserName, cMach
cMach_User = SYS(0)
cUserName = ALLTRIM(  RIGHT( cMach_User, LEN(cMach_User)-AT("#",cMach_User)-1 )  )
cMach = LEFT( cMach_User, AT("#",cMach_User)-2 )

PRIVATE lReturnApprove, cSalesRep 
lReturnApprove = .F.
cSalesRep = SalesRepfromSO(nSalesNum)

IF cUserName = cSalesRep 
	RETURN .T.
ELSE
	IF HaveSODeletePermission(nSalesNum)
		RETURN .T.
	ELSE
		PRIVATE nConn
		nConn = get_SQLSTRINGCONNECT()

		PRIVATE cAlias 
		cAlias = ALIAS()
		
		IF USED('tmpPSP_SQL34a')
			USE IN tmpPSP_SQL34a
		ENDIF
		SELECT 0

		IF nConn > 0
			*Un = cUserName AND SETUP.Prp = "Machine"
			cSQL = "SELECT [PRP] FROM dbo.AppSetup WITH(NOLOCK) WHERE [UN] = '"+ALLTRIM(cUserName)+"' AND [ANS] = 'AdminCancelSO'"
			
			nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL34a' )
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL' TIMEOUT 1
				nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL34a' )
			ENDDO
			IF nSQLEXEC < 0 &&Try again!
				nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL34a")
				DO WHILE nSQLEXEC = 0
					WAIT WINDOW 'SQL 2' TIMEOUT 1
					nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL34a")

					IF nSQLEXEC < 0
						IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
							nSQLEXEC = 0
						ENDIF
					ENDIF
				ENDDO
			ENDIF
			IF nSQLEXEC < 0
				SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPSP_SQL34a')
				RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
			ENDIF
			
			IF USED('tmpPSP_SQL34a')
				IF RECCOUNT('tmpPSP_SQL34a') > 0
					IF VARTYPE(tmpPSP_SQL34a.PRP) = "C"
						IF tmpPSP_SQL34a.PRP = "YES"
							lReturnApprove = .T.
						ELSE
							*Check for other rights to delete that SO
						ENDIF
					ELSE
			*			*Check for other rights to delete that SO
					ENDIF
				ENDIF
			ELSE
		*		*Check for other rights to delete that SO
			ENDIF
			
			IF USED('tmpPSP_SQL34a')
				USE IN tmpPSP_SQL34a
			ENDIF
			
			
		ELSE
			*Error on Connection String
			TrackError("Could not Connect to SQL","Error on Connection String","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
		ENDIF
		
		IF NOT EMPTY(cAlias)
			IF USED(cAlias)
				SELECT (cAlias)
			ELSE
				RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
			ENDIF
		ENDIF
		
		*HaveSOCancelPermission
		RETURN lReturnApprove 
	ENDIF
ENDIF

RETURN .F.
ENDPROC

******************************************************

PROCEDURE RedundantServer
*RedundantServer()

PRIVATE cWindfallServer, cTiptonServer,cWindfallServer2, cTiptonServer2
cWindfallServer	=""
cTiptonServer	=""
cWindfallServer2=""
cTiptonServer2	=""

WAIT WINDOW "Proc_Setup:RedundantServer() Type any key." 

*********************
* Read XML
*********************
PRIVATE lFoundWindfall, lFoundTipton
lFoundWindfall	= .F.
lFoundTipton	= .F.

IF USED('HPAdata')
	USE IN HPAdata
ENDIF

IF FILE( "\\RAPTOR\SQL\HPAdata.xml" )
	*READ file
	TRY
		XMLTOCURSOR( "\\RAPTOR\SQL\HPAdata.xml", 'HPAdata', 512)
		
		IF USED('HPAdata')
			IF VARTYPE( HPAdata.WindfallServer ) = "C"
				cWindfallServer = RTRIM(HPAdata.WindfallServer)
				lFoundWindfall = .T.
			ENDIF
			IF VARTYPE( HPAdata.TiptonServer ) = "C"
				cTiptonServer = RTRIM(HPAdata.TiptonServer)
			ENDIF
			IF VARTYPE( HPAdata.BackUpServer ) = "C"
			ENDIF
			USE IN HPAdata
		ENDIF
	CATCH
		MESSAGEBOX("Tell IT department."+CHR(13)+CHR(13)+"ERROR Reading XML file."+CHR(13)+[XMLTOCURSOR( ]+CHR(13)+["\\RAPTOR\SQL\HPAdata.xml"]+CHR(13)+[, 'HPAdata', 512)],16,"Could not get DFS file")
	ENDTRY
ELSE	
	IF FILE( "\\Vulcan\SQL\HPAdata.xml" )
		*READ file
		TRY
			XMLTOCURSOR( "\\Vulcan\SQL\HPAdata.xml", 'HPAdata', 512)
			
			IF USED('HPAdata')
				IF VARTYPE( HPAdata.WindfallServer ) = "C"
					cWindfallServer = RTRIM(HPAdata.WindfallServer)
					lFoundWindfall = .T.
				ENDIF
				IF VARTYPE( HPAdata.TiptonServer ) = "C"
					cTiptonServer = RTRIM(HPAdata.TiptonServer)
				ENDIF
				IF VARTYPE( HPAdata.BackUpServer ) = "C"
				ENDIF
				USE IN HPAdata
			ENDIF
		CATCH
		MESSAGEBOX("Tell IT department."+CHR(13)+CHR(13)+"ERROR Reading XML file."+CHR(13)+[XMLTOCURSOR( ]+CHR(13)+["\\Vulcan\SQL\HPAdata.xml"]+CHR(13)+[, 'HPAdata', 512)],16,"Could not get DFS file")
	ENDTRY
		
	ENDIF
ENDIF	

*******************	


**********************************
* Create XML
**********************************
IF !FILE( "\\RAPTOR\SQL\HPAdata.xml" )
	IF DIRECTORY( "\\RAPTOR\SQL\")
		IF MESSAGEBOX("Are you ready to Create HPAdata.xml on \\Vulcan\SQL\?",4+64+256,"New Server") = 6

			cWindfallServer	= "RAPTOR"
			cTiptonServer	= "PEREGRINE"
			cBackupserver	= "SQLdev"

			*Create file
			CREATE CURSOR HPAdata (WindfallServer C(20), TiptonServer C(20), BackUpServer C(20) )
			
			INSERT INTO HPAdata (WindfallServer,TiptonServer,BackupServer) VALUES (cWindfallServer, cTiptonServer, cBackupserver)
			
			PRIVATE nBytes 
			nBytes = 0
			nBytes = CURSORTOXML( 'HPAdata', "\\RAPTOR\SQL\HPAdata.xml", 1, 512, 0, "1" )
			IF VARTYPE( nBytes ) = 'N'
				MESSAGEBOX( "Saved \\RAPTOR\SQL\HPAdata.xml"+CHR(13)+STR(nBytes)+" bytes written.",0+64,"Saved")
			ENDIF
			
			USE IN HPAdata
		ENDIF
	ENDIF
ENDIF
IF !FILE( "\\Vulcan\SQL\HPAdata.xml" )
	IF DIRECTORY( "\\Vulcan\SQL\")
		IF MESSAGEBOX("Are you ready to Create HPAdata.xml on \\Vulcan\SQL\?",4+64+256,"New Server") = 6

			cWindfallServer	= "RAPTOR"
			cTiptonServer	= "PEREGRINE"
			cBackupserver	= "SQLdev"

			*Create file
			CREATE CURSOR HPAdata (WindfallServer C(20), TiptonServer C(20), BackUpServer C(20) )
			
			INSERT INTO HPAdata (WindfallServer,TiptonServer,BackupServer) VALUES (cWindfallServer, cTiptonServer, cBackupserver)
			
			PRIVATE nBytes 
			nBytes = 0
			nBytes = CURSORTOXML( 'HPAdata', "\\Vulcan\SQL\HPAdata.xml", 1, 512, 0, "1" )
			IF VARTYPE( nBytes ) = 'N'
				MESSAGEBOX( "Saved \\Vulcan\SQL\HPAdata.xml"+CHR(13)+STR(nBytes)+" bytes written.",0+64,"Saved")
			ENDIF
			
			USE IN HPAdata
		ENDIF
	ENDIF
ENDIF


****

**Not Programed servers!!!
IF NOT lFoundWindfall
	IF NOT ( EMPTY(cWindfallServer2) )
	
	ENDIF
ENDIf 
IF NOT lFoundTipton 
	IF NOT ( EMPTY(cTiptonServer) )
	
	ENDIF
ENDIF

************************
*Where Am I
************************
PRIVATE oAdapters, oWMI
PRIVATE lInWindfall,lInTipton
lInWindfall = .F.
lInTipton = .F.

oWMI = getobject("winmgmts:")
oAdapters = oWMI.ExecQuery("Select * from Win32_NetworkAdapterConfiguration where IPEnabled=True")
IF VARTYPE(oAdapters)="O"
	FOR EACH oAdapter in oAdapters
		IF NOT isnull(oAdapter.ipaddress)
			FOR EACH cAddress in oAdapter.ipaddress
				IF "192.168.1." $ cAddress
					lInWindfall= .T.
				ENDIF
			NEXT 
		ENDIF 
	NEXT 
ELSE
	RecordError( 0, 'oWMI Error', "Proc_SQL:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Failed at Select * from Win32_NetworkAdapterConfiguration where IPEnabled=True" )
	lInWindfall= .T.
	cAddress = "192.168.1."
ENDIF

RELEASE oAdapters 
RELEASE oWMI

***********************
*Choose Server
************************
PRIVATE cServer
cServer = ""

IF VARTYPE(gGlobalServer) = "C"
	IF NOT ( EMPTY(gGlobalServer) )
		*USE the gGlobalServer
		cServer = gGlobalServer
		lInWindfall = .F.
		lInTipton	= .F.
	ENDIF
ENDIF

IF lInWindfall
	*Try to use the Windfall Server
	IF lFoundWindfall
		cServer = cWindfallServer
	ELSE
		cServer = cWindfallServer2
	ENDIF
ENDIF
IF lInTipton
	*Try to use the Tipton Server
	IF lFoundTipton
		cServer = cTiptonServer
	ELSE
		cServer = cTiptonServer2
	ENDIF
	
ENDIF
*WAIT WINDOW "Choose SQL Server "+cServer NOWAIT

*******************
IF MESSAGEBOX("Do you want to test the Server?",4+64+256,"SQL Server") = 6
	*Test SQL Server
	*!*	WAIT WINDOW "Trying SQL Connection" NOWAIT
	PRIVATE lWindfallServer,lWindfallServer2,lTiptonServer,lTiptonServer2
	lWindfallServer	= .F.
	lWindfallServer2= .F.
	lTiptonServer	= .F.
	lTiptonServer2	= .F.

	PRIVATE nHandle
	WAIT WINDOW "Testing SQL Server "+cWindfallServer+". Possible Server Problem!  Please cancel the next 2 prompts." NOWAIT
	nHandle = SQLStringConnect("Driver={SQL Server};Server="+cWindfallServer+";Database=HPAlloy;Trusted_Connection=yes;")
	*nHandle = SQLStringConnect("Driver={SQL Server};Server="+cWindfallServer+";Trusted_Connection=yes;")
	IF nHandle <= 0
		? 'Fail '+cWindfallServer
	ELSE
		? 'Pass '+cWindfallServer
		SQLDISCONNECT(nHandle)
		lWindfallServer = .T.
	ENDIF
	*
	IF cWindfallServer != cWindfallServer2
		WAIT WINDOW "Testing SQL Server "+cWindfallServer2+". Possible Server Problem!  Please cancel the next 2 prompts." NOWAIT
		nHandle = SQLStringConnect("Driver={SQL Server};Server="+cWindfallServer2+";Database=HPAlloy;Trusted_Connection=yes;")
		*nHandle = SQLStringConnect("Driver={SQL Server};Server="+cWindfallServer2+";Trusted_Connection=yes;")
		IF nHandle <= 0
			? 'Fail '+cWindfallServer2
		ELSE
			? 'Pass '+cWindfallServer2
			SQLDISCONNECT(nHandle)
			lWindfallServer2 = .T.
		ENDIF
	ENDIF

	IF EMPTY(cServer)
		MESSAGEBOX("Could not locate the SQL Server"+CHR(13)+"cServer is Empty.",16,"Error")
		nReturn = -1
	ELSE
		WAIT WINDOW "Testing SQL Server "+cTiptonServer+". Possible Server Problem!  Please cancel the next 2 prompts." NOWAIT
		nHandle = SQLStringConnect("Driver={SQL Server};Server="+cTiptonServer+";Database=HPAlloy;Trusted_Connection=yes;")
		*nHandle = SQLStringConnect("Driver={SQL Server};Server="+cTiptonServer+";Trusted_Connection=yes;")
		IF nHandle <= 0
			? 'Fail '+cTiptonServer
		ELSE
			? 'Pass '+cTiptonServer
			SQLDISCONNECT(nHandle)
			lTiptonServer = .T.
		ENDIF
	ENDIF
ENDIF

*!*	IF cTiptonServer != cTiptonServer2
*!*		WAIT WINDOW "Testing SQL Server "+cTiptonServer2+". Possible Server Problem!  Please cancel the next 2 prompts." NOWAIT
*!*		nHandle = SQLStringConnect("Driver={SQL Server};Server="+cTiptonServer2+";Database=HPAlloy;Trusted_Connection=yes;")
*!*		IF nHandle <= 0
*!*			? 'Fail '+cTiptonServer2
*!*		ELSE
*!*			? 'Pass '+cTiptonServer2
*!*			SQLDISCONNECT(nHandle)
*!*			lTiptonServer2 = .T.
*!*		ENDIF
*!*	ENDIF

WAIT CLEAR

ENDPROC
*********************************

PROCEDURE getSOitemfromInvoiceDescription 
PARAMETERS cDesc
*getSOitemfromInvoiceDescription(cDesc)
*returns cSOitem

IF VARTYPE(cDesc) != "C"
	RETURN ' '
ENDIF

PRIVATE cSOitem 
cSOitem = '' 

PRIVATE cDesc2, cDescL, cDescLR
cDesc2	= ""
cDescL = ""
cDescLR = ""

cDesc = STRTRAN(cDesc,'"','')
cDesc = STRTRAN(cDesc,"'",'')

IF "[" $ cDesc
	cDescL = RIGHT( cDesc, LEN(cDesc)-AT("[",cDesc) )
	IF "]" $ cDescL
		cDescLR = LEFT( cDescL, AT("]",cDescL)-1 )
	ENDIF
ENDIF

IF VAL(LEFT(cDescLR,6)) > 0
	*Use the first set of []
	IF "-" $ cDescLR
		*has the dash for Items
		cSOitem = Proper_SO_Item(cDescLR)
		RETURN cSOitem 
	ENDIF
ENDIF

cDesc2 = RIGHT(cDesc,LEN(cDesc)-AT(cDescLR,cDesc)-LEN(cDescLR)-1)  &&Do again if 2 [] where used!

IF "[" $ cDesc2
	cDescL2 = RIGHT( cDesc2, LEN(cDesc2)-AT("[",cDesc2) )
	IF VAL(LEFT(cDescL2,6)) > 0
		*Use the second set of []
		cDescLR2 = LEFT( cDescL2, AT("]",cDescL2)-1 )
		IF "-" $ cDescLR2
			*has the dash for Items
			cSOitem = Proper_SO_Item(cDescLR2)
			RETURN cSOitem 
		ENDIF
	ENDIF
ELSE
	cDescLR2 = ''
ENDIF



RETURN cSOitem 
ENDPROC
*********************************

PROCEDURE getHeatfromInvoiceDescription
PARAMETERS cDesc
*getHeatfromInvoiceDescription(cDesc)
*returns cSOitem

IF VARTYPE(cDesc) != "C"
	RETURN ' '
ENDIF

PRIVATE cHeat
cHeat = '' 

PRIVATE cDesc2,cDescL, cDescLR
cDesc2	= ""
cDescL = ""
cDescLR = ""

cDesc = STRTRAN(cDesc,'"','')
cDesc = STRTRAN(cDesc,"'",'')

IF "[" $ cDesc
	cDescL = RIGHT( cDesc, LEN(cDesc)-AT("[",cDesc) )
	IF "]" $ cDescL
		cDescLR = LEFT( cDescL, AT("]",cDescL)-1 )
		
		IF LEFT(cDescLR ,3) = "HT#" 
			cHeat = RIGHT(cDescLR,LEN(cDescLR)-3)
		ELSE 
			IF LEFT(cDescLR ,5) = "HEAT#"
				cHeat = RIGHT(cDescLR,LEN(cDescLR)-5)
			ENDIF
		ENDIF
		RETURN cHeat
	ENDIF
ENDIF

IF LEFT(cDesc,3) = "HT#" OR LEFT(cDesc,5) = "HEAT#"
	cDescLR = LEFT( cDesc, AT("]",cDesc)-1 )
ENDIF
		
cDesc2 = RIGHT(cDesc,LEN(cDesc)-AT(cDescLR,cDesc)-LEN(cDescLR)-1)  &&Do again if 2 [] where used!

IF "[" $ cDesc2
	IF LEFT(cDesc2,3) = "HT#" OR LEFT(cDesc2,5) = "HEAT#"
		*Use the second set of []
		cDescLR2 = LEFT( cDesc2, AT("]",cDesc2)-1 )
	ENDIF
ELSE
	cDescLR2 = ''
ENDIF

IF NOT ( EMPTY(cDescLR2) )
	IF LEFT(cDescLR2,3) = "HT#" 
		cHeat = RIGHT(cDescLR2,LEN(cDescLR2)-3)
	ELSE 
		IF LEFT(cDescLR2,5) = "HEAT#"
			cHeat = RIGHT(cDescLR2,LEN(cDescLR2)-5)
		ENDIF
	ENDIF
ELSE
	cHeat=''
ENDIF

RETURN cHeat
ENDPROC
****************************************************

PROCEDURE CollectErrors 
PARAMETERS lSkipPackDB,lQuite
*CollectErrors()
*moves local Errors.dbf records to SQL which also triggers an email
*  DO NOT USE THE Errors.DBF!!!
*use a temp file!

*MESSAGEBOX("ERROR COLLECTION will NOT be recorded.",0,"Proc_Setup:CollectErrors")
*return

IF VARTYPE(lSkipPackDB) != "L"
	lSkipPackDB = .F.
ENDIF

IF VARTYPE(lQuite) != "L"
	lQuite = .F.
ENDIF
*WAIT WINDOW "Proc_Setup:CollectErrors() a"

PRIVATE lNewConn, nConn
nConn = get_SQLSTRINGCONNECT()
lNewConn = .T.

*WAIT WINDOW "Proc_Setup:CollectErrors() b"

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cErrorsFile,cfnLegal

IF "\MEM" $ SYS(2003)
	cErrorsFile =  SYS(5)+SYS(2003)+"\Errors.DBF"
ELSE
	cErrorsFile =  SYS(5)+SYS(2003)+"\MEM\Errors.DBF"
ENDIF
		
IF FILE(cErrorsFile )
	USE (cErrorsFile) SHARED IN 0 ALIAS Errors
ENDIF

PRIVATE cSQL, nSQLEXEC

		*SET PROCEDURE TO Progs\PROC_SQL ADDITIVE
		PRIVATE cNewMess, nRecNo 
		IF USED('Errors')
		*IF USED('fnERROR')
		
			*DELETE FOR ErrorDate < CTOT('7/14/2020') &&AND Mess1 = "Record Test Data."
			DELETE FOR ErrorDate < CTOT(DATE()-365)
			
			SELECT Errors
			GO TOP
			SCAN
				nRecNo = RECNO('Errors')
				IF NOT DELETED()
					*now that CollectError is running again, take it slow.
					*IF nRecNo  > 10
					*	EXIT
					*ENDIF
					
					IF "PROC_SQL" $ SET("PROCEDURE")
						cSQL = "INSERT INTO dbo.Errors ([nerror],[mess1],[cprogram],[nlineno],[errordate],[MACHINE],[Revision],[Memo1]) VALUES ("
						cSQL = cSQL  + ""+STR(PrepareSQLnum(	Errors.nError	,'nError',-3))+""
						cSQL = cSQL  + ",'"+PrepareSQLtxt(		Errors.mess1	,'Mess1',254,.F.,.T.)+"'"
						cSQL = cSQL  + ",'"+PrepareSQLtxt(		Errors.cprogram	,'cProgram',254,.F.,.T.)+"'"
						cSQL = cSQL  + ","+STR(PrepareSQLnum(	Errors.nlineno	,'nLineo',-3))
						cSQL = cSQL  + ",'"+TTOC(PrepareSQLdateTime(Errors.errordate,'ErrorDate'))+"'"
						cSQL = cSQL  + ",'"+PrepareSQLtxt(		Errors.MACHINE	,'Machine',254,.F.,.T.)+"'"
						cSQL = cSQL  + ",'"+PrepareSQLtxt(		Errors.Revision	,'Revision',254,.F.,.T.)+"'"
						cSQL = cSQL  + ",'"+PrepareSQLtxt(		Errors.Memo1	,'Memo',-1,.F.,.T.)+"'"
						cSQL = cSQL  + ")"
					ELSE
						*SET PROCEDURE TO Progs\Proc_SQL ADDITIVE 
						*PrepareSQLnum lives in Proc_SQL, something has gone wrong, do not complicate the error
						*just trust proper parameters where passed.
						cSQL = "INSERT INTO dbo.Errors ([nerror],[mess1],[cprogram],[nlineno],[errordate],[MACHINE],[Revision],[Memo1]) VALUES ("
						cSQL = cSQL  + ""+STR(Errors.nerror)+""
						cSQL = cSQL  + ",'"+Errors.mess1+"'"
						cSQL = cSQL  + ",'"+Errors.cprogram+"'"
						cSQL = cSQL  + ","+STR(Errors.nlineno)
						cSQL = cSQL  + ",'"+TTOC(Errors.errordate)+"'"
						cSQL = cSQL  + ",'"+Errors.MACHINE+"'"
						cSQL = cSQL  + ",'"+Errors.Revision+"'"
						cSQL = cSQL  + ",'"+STRTRAN(Errors.Memo1,"'","''")+"'" &&Escape the single quotemark so SQL does not puke.
						cSQL = cSQL  + ")"
					ENDIF
				
					
					nSQLEXEC = SQLEXEC(nConn, cSQL )
					DO WHILE nSQLEXEC = 0
						WAIT WINDOW 'SQL' TIMEOUT 1
						nSQLEXEC = SQLEXEC(nConn, cSQL )
					ENDDO
					IF nSQLEXEC < 0 &&Try again!
						nSQLEXEC = SQLEXEC(nConn, cSQL )
						DO WHILE nSQLEXEC = 0
							WAIT WINDOW 'SQL 2' TIMEOUT 1
							nSQLEXEC = SQLEXEC(nConn, cSQL )

							IF nSQLEXEC < 0
								IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
									nSQLEXEC = 0
								ENDIF
							ENDIF
						ENDDO
					ENDIF
					IF nSQLEXEC < 0
						SQLEXECError(cSQL, nConn, nSQLEXEC)
						RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
					ELSE
						DELETE IN Errors
					ENDIF
				ENDIF				
				SELECT Errors
				
			ENDSCAN
			
			USE IN Errors
			*USE IN fnERROR
			
			*WAIT WINDOW "Proc_Setup:CollectErrors() g"	
			*IF NOT lSkipPackDB 
				TRY
					
					USE (cErrorsFile) EXCL ALIAS Errors
					PACK
					USE IN Errors
					IF FILE(cErrorsFile)
						IF NOT "ERRORS.DBF" $ UPPER(cErrorsFile)
							DELETE FILE cErrorsFile
						ENDIF
					ENDIF
					
				CATCH
					*c:\program files (x86)\hpa\mem\errors.dbf was not packed!
				ENDTRY
			*ENDIF


			WAIT CLEAR

		ENDIF
*	ELSE
*		MESSAGEBOX("Could not write Error file! "+cErrorsFile,16,"Error")
*	ENDIF
	
	IF lNewConn 
		SQLDISCONNECT(nConn )
	ENDIF
*ELSE
*	*Error on Connection String
*ENDIF


IF NOT EMPTY(cAlias) 
	IF UPPER(cAlias) != 'ERRORS'
		IF USED(cAlias)
			SELECT (cAlias)
		ELSE
			** can create LOOP
			*RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
		ENDIF
	ENDIF
ENDIF
*WAIT WINDOW "Proc_Setup:CollectErrors() EndProc"
*
ENDPROC

**************************************************** 

PROCEDURE ShortSalesP 
PARAMETERS cUserName
*ShortSalesP()
*

PRIVATE lNewConn, nConn
nConn= get_SQLSTRINGCONNECT()
lNewConn = .T.

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC
PRIVATE cShortUserName
cShortUserName = ''

IF USED('tmpShortUserName')
	USE IN tmpShortUserName
ENDIF

SELECT 0
cSQL = "SELECT TOP 1 A1.UN FROM dbo.AppSetup A1 WITH(NOLOCK) "
cSQL = cSQL + " INNER JOIN dbo.AppSetup A2 WITH(NOLOCK) ON A1.Ans = A2.ans "
cSQL = cSQL + " WHERE A2.PRP = 'SalesP' "
cSQL = cSQL + " AND A2.UN = '"+ALLTRIM(cUserName)+"'"
cSQL = cSQL + " AND LEN(A1.UN) > 0 "
cSQL = cSQL + " ORDER BY LEN(A1.UN) "


nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpShortUserName')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpShortUserName' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpShortUserName")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpShortUserName")

		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpSOshipped' )
	RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
ENDIF

IF USED('tmpShortUserName')
	IF RECCOUNT('tmpShortUserName') > 0
		cShortUserName = tmpShortUserName.UN
	ENDIF
	USE IN tmpShortUserName
ENDIF

IF lNewConn 
	SQLDISCONNECT(nConn )
ENDIF


IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF


RETURN cShortUserName
ENDPROC

********************************** 
 
PROCEDURE UN_from_PRP_ANS 
PARAMETERS cPRP,cANS
*cProfile_Name = UN_from_PRP_ANS('Profile_Name','David.Kirchner@SpaceAlloysUSA.com')
*Profile is needed to match SQL email profile settings

IF VARTYPE(cPRP)!="C"
	RETURN ''
ENDIF
IF VARTYPE(cANS)!="C"
	RETURN ''
ENDIF

PRIVATE lReturnUN
lReturnUN = ''

PRIVATE nConn
nConn = get_SQLSTRINGCONNECT()

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cMach_User, cUserName, cMach
cMach_User = SYS(0)
cUserName = ALLTRIM(  RIGHT( cMach_User, LEN(cMach_User)-AT("#",cMach_User)-1 )  )
cMach = LEFT( cMach_User, AT("#",cMach_User)-2 )

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPSP_SQL38')
	USE IN tmpPSP_SQL38
ENDIF
SELECT 0

IF nConn > 0
	cSQL = "SELECT [UN] FROM dbo.AppSetup WITH(NOLOCK) WHERE [PRP] = '"+cPRP+"' AND [ANS] = '"+cANS+"'"
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL38' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL38' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL38")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL38")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPSP_SQL38')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
	
	IF USED('tmpPSP_SQL38')
		IF RECCOUNT('tmpPSP_SQL38') > 0
			IF VARTYPE(tmpPSP_SQL38.UN) = "C"
				lReturnUN = ALLTRIM(tmpPSP_SQL38.UN)
			ENDIF
		ELSE
			TrackError("No Records returned ",cUserName +" tried to get UN with  PRP= '"+cPRP+"' AND ANS='"+cANS+"'","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
		ENDIF
		USE IN tmpPSP_SQL38
	ELSE
		TrackError("No Records returned ",cUserName +" tried to get UN with  PRP= '"+cPRP+"' AND ANS='"+cANS+"'","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	ENDIF
	
	SQLDISCONNECT( nConn )
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lReturnUN 
ENDPROC

********************************** 

PROCEDURE ANS_from_UN_PRP 
PARAMETERS cUN,cPRP
*cEmail = ANS_from_UN_PRP('Derek Boruff','E-mail')

IF VARTYPE(cUN)!="C"
	RETURN ''
ENDIF
IF VARTYPE(cPRP)!="C"
	RETURN ''
ENDIF

PRIVATE lReturnANS
lReturnANS= ''

PRIVATE nConn
nConn = get_SQLSTRINGCONNECT()

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cMach_User, cUserName, cMach
cMach_User = SYS(0)
cUserName = ALLTRIM(  RIGHT( cMach_User, LEN(cMach_User)-AT("#",cMach_User)-1 )  )
cMach = LEFT( cMach_User, AT("#",cMach_User)-2 )

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPSP_SQL38')
	USE IN tmpPSP_SQL38
ENDIF
SELECT 0

IF nConn > 0
	cSQL = "SELECT [ANS] FROM dbo.AppSetup WITH(NOLOCK) WHERE [UN] = '"+cUN+"' AND [PRP] = '"+cPRP+"'" 
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL38' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSP_SQL38' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL38")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSP_SQL38")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPSP_SQL38')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
	
	IF USED('tmpPSP_SQL38')
		IF RECCOUNT('tmpPSP_SQL38') > 0
			IF VARTYPE(tmpPSP_SQL38.ANS) = "C"
				lReturnANS = ALLTRIM(tmpPSP_SQL38.ANS)
			ENDIF
		ELSE
			TrackError("No Records returned ",cUserName +" tried to get ANS with UN = '"+cUN+"' AND PRP = '"+cPRP+"'","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
		ENDIF
		
		USE IN tmpPSP_SQL38
	ELSE
		TrackError("No Records returned ",cUserName +" tried to get ANS with UN = '"+cUN+"' AND PRP = '"+cPRP+"'","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	ENDIF
	
	SQLDISCONNECT( nConn )
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Setup:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lReturnANS
ENDPROC

********************************** 