*-- Setup
*SET RESOURCE TO ["]+SYS(5)+SYS(2003)+"\MEM\FoxUser.DBF"+["]


*-- Save and configure environment.
lcLastSetClassLib=SET("CLASSLIB")
lcLastSetTalk=SET("TALK")
SET TALK OFF
lcLastSetSafety=SET("SAFETY")
SET SAFETY OFF
lcLastSetDeleted=SET("DELETED")
SET DELETED OFF
lcLastSetPath=SET("PATH")
lcLastSetCentury=SET("CENTURY")	&&Century was not in QuotesSet untill 3-2009
SET CENTURY ON

lcAppPath = JUSTPATH(SYS(16, 0))

*Strip lcAppPath to ERP_2
DO CASE
    CASE LOWER(JUSTFNAME(lcAppPath)) == "forms"
        lcAppPath = JUSTPATH(lcAppPath)
    CASE LOWER(JUSTFNAME(lcAppPath)) == "libs"
        lcAppPath = JUSTPATH(lcAppPath)
    CASE LOWER(JUSTFNAME(lcAppPath)) == "mem"
        lcAppPath = JUSTPATH(lcAppPath)
    CASE LOWER(JUSTFNAME(lcAppPath)) == "menus"
        lcAppPath = JUSTPATH(lcAppPath)
    CASE LOWER(JUSTFNAME(lcAppPath)) == "progs"
        lcAppPath = JUSTPATH(lcAppPath)
    CASE LOWER(JUSTFNAME(lcAppPath)) == "reports"
        lcAppPath = JUSTPATH(lcAppPath)
    CASE LOWER(JUSTFNAME(lcAppPath)) == "tools"
        lcAppPath = JUSTPATH(lcAppPath)
ENDCASE

SET DEFAULT TO (lcAppPath)

*SET DEFAULT TO "E:\VFP\ERP_2"

*!*	*? "Save 'Last Set'" 
*!*	IF "\MEM" $ SYS(2003)
*!*		SAVE ALL LIKE lcLastSet* TO ( SYS(5)+SYS(2003)+"\QuotesSet.Mem" )
*!*	ELSE
*!*		SAVE ALL LIKE lcLastSet* TO ( SYS(5)+SYS(2003)+"\MEM\QuotesSet.Mem" )
*!*	ENDIF

*!*	RELEASE ALL LIKE lcLastSet*

*SYS(2003) = "\Users\TalkT\One
IF NOT "\MEM" $ SYS(2003)
	IF NOT DIRECTORY(SYS(5)+SYS(2003)+"\MEM\")
		TRY
			MKDIR (SYS(5)+SYS(2003)+"\MEM\")
			MESSAGEBOX("FoxPro needs \MEM\ folder set to have permission for user to be alowed to create to temp files."+CHR(13)+"Things will not work.!"+CHR(13)+"Have IT Set Permissions.",16,"Warning")
		CATCH
			MESSAGEBOX("FoxPro needs a \MEM\ folder created and its permission changed to allow user to create temp files."+CHR(13)+"Things will not work.!",16,"Warning")
		ENDTRY
	ENDIF
ENDIF

*TMPFILES SYS(5)+SYS(2003)+"\MEM\"

? "Get 'ERPSetup.mem'"
IF FILE(SYS(5)+SYS(2003) +"\MEM\ERPSetup.MEM")
	RESTORE FROM (SYS(5)+SYS(2003) +"\MEM\ERPSetup.MEM") ADDITIVE
ELSE
	IF FILE("\MEM\ERPSetup.MEM")
		RESTORE FROM ("\MEM\ERPSetup.MEM") ADDITIVE
	ELSE

		IF FILE(SYS(5)+SYS(2003) +"\ERPSetup.MEM")
			RESTORE FROM (SYS(5)+SYS(2003) +"\ERPSetup.MEM") ADDITIVE
			*DELETE FILE (SYS(5)+SYS(2003) +"\ERPSetup.MEM") 
		ELSE
		
			*MESSAGEBOX("Run the ERP Setup to set defaults."+CHR(13)+"SetupERP"+CHR(13)+"Line A "+CHR(13)+STR(LINENO(1)),48,"Set Defaults")
			WAIT WINDOW "Running the ERP Setup to set defaults." TIMEOUT 1
			
			IF FILE("\Forms\setuperp.scx")
				DO FORM (SYS(5)+SYS(2003) +"\Forms\setuperp")
			ELSE
				*STOP
			ENDIF
			
			**********************************************
			IF FILE( SYS(5)+SYS(2003)+"\MEM\ERPSetup.MEM")
				RESTORE FROM SYS(5)+SYS(2003)+"\MEM\ERPSetup.MEM" ADDITIVE
			ELSE
				IF FILE(SYS(5)+SYS(2003)+"\ERPSetup.MEM")
					RESTORE FROM SYS(5)+SYS(2003)+"\ERPSetup.MEM" ADDITIVE
				ENDIF
			ENDIF
		ENDIF
	ENDIF
ENDIF

***
***
 
IF TYPE("LoginAppHome") != "C"
	LoginAppHome = SYS(5)+SYS(2003)+"\ERP"
	IF FILE(LoginAppHome+"ERP Home.txt")
		IF NOT "\MEM" $ SYS(2003)
			SAVE ALL LIKE Login* TO (SYS(5)+SYS(2003) +"\ERPSetup.MEM")
		ELSE
			SAVE ALL LIKE Login* TO (SYS(5)+SYS(2003) +"\MEM\ERPSetup.MEM")
		ENDIF
	ELSE
		IF FILE(SYS(5)+SYS(2003)+"ERP Home.txt")
			LoginAppHome = SYS(5)+SYS(2003)
			IF NOT "\MEM" $ SYS(2003)
				SAVE ALL LIKE Login* TO (SYS(5)+SYS(2003) +"\ERPSetup.MEM")
			ELSE
				SAVE ALL LIKE Login* TO (SYS(5)+SYS(2003) +"\MEM\ERPSetup.MEM")
			ENDIF
		ELSE

		ENDIF
	ENDIF
ENDIF

IF NOT (FILE(LoginAppHome+"ERP Home.txt") OR FILE(LoginAppHome+"ERP.APP"))
	? "Retry for LoginAppHome"
	IF ( FILE( SYS(5)+SYS(2003)+"ERP Home.txt") OR FILE(SYS(5)+SYS(2003)+"ERP.APP")  )
		LoginAppHome = SYS(5)+SYS(2003)
		SAVE ALL LIKE Login* TO (SYS(5)+SYS(2003) +"\MEM\ERPSetup.MEM")
	ELSE
		IF FILE("E:\VFP\ERP_2\"+"ERP Home.txt")

			LoginAppHome = "E:\VFP\ERP_2\"

			IF NOT "\MEM" $ SYS(2003)
				SAVE ALL LIKE Login* TO (SYS(5)+SYS(2003) +"\ERPSetup.MEM")
			ELSE
				SAVE ALL LIKE Login* TO (SYS(5)+SYS(2003) +"\MEM\ERPSetup.MEM")
			ENDIF

		ENDIF
	ENDIF
ENDIF

IF NOT ( FILE(LoginAppHome+"ERP Home.txt") OR FILE(LoginAppHome+"ERP.APP")  )
	IF VARTYPE(LoginAppHome) != "C"
		LoginAppHome = ""
	ENDIF
	MESSAGEBOX("Run the ERP Setup to set defaults."+CHR(13)+"Main.prg"+CHR(13)+CHR(13)+"SYS(5)="+SYS(5)+CHR(13)+"SYS(2003)="+SYS(2003)+CHR(13)+"Line B "+STR(LINENO(1))+CHR(13)+"LoginAppHome="+LoginAppHome,48,"Home Directory not found!")

	DO FORM LOCFILE("E:\VFP\ERP_2\Forms\setuperp.scx","SCX","Select the setuperp.scx")
	*RESTORE FROM (SYS(5)+SYS(2003) +"\MEM\ERPSetup.MEM") ADDITIVE
ENDIF


IF VARTYPE(LoginAppHome) = "C"
*	IF VARTYPE(LoginServer) = "C"
*		*Found 2 ERPSetup memvars with characters.
*		IF LEFT(LoginServer,2) = "\\"
*			*needs to be fixed.
*			
*			LoginServer = "BOBWHITE"
			IF "\MEM" $ SYS(2003)
				SAVE ALL LIKE Login* TO (SYS(5)+SYS(2003) +"\ERPSetup.MEM")
			ELSE
				SAVE ALL LIKE Login* TO (SYS(5)+SYS(2003) +"\MEM\ERPSetup.MEM")
			ENDIF
			
*		ENDIF
*	ELSE
*		LoginServer = "BOBWHITE"
*	ENDIF
ENDIF

IF FILE(LoginAppHome+"ERP Home.txt") OR FILE(LoginAppHome+"ERP.APP")
	*SET DEFAULT - Specifies the default drive and directory. 
	*If you create a file and do not specify where to place it, the file is placed in the default Visual FoxPro directory.
	

		SET DEFAULT TO (LoginAppHome)
		*SET DEFAULT TO (LoginAppHome+"MEM\") Do not add the MEM hear so the SYS(2003) works with SET PROC code block.
		*This Changes the SYS(2003)!!

	*PROGWORK - 
ENDIF

PUBLIC gERPAppHome
gERPAppHome = ADDBS(LoginAppHome)

*?(LoginAppHome)
*SET PATH - Specifies a path for file searches
SET PATH TO &&Empty to Clear out
SET PATH TO (LoginAppHome)
SET PATH TO (LoginAppHome)+"PROGS\" ADDITIVE
SET PATH TO (LoginAppHome)+"MEM\" ADDITIVE 

SET PATH TO (LoginAppHome)+"FORMS\" ADDITIVE 
SET PATH TO (LoginAppHome)+"GRAPHICS\" ADDITIVE 
SET PATH TO (LoginAppHome)+"HELP\" ADDITIVE 
SET PATH TO (LoginAppHome)+"ICO\" ADDITIVE 
SET PATH TO (LoginAppHome)+"INCLUDE\" ADDITIVE 
SET PATH TO (LoginAppHome)+"LIBS\" ADDITIVE 

SET PATH TO (LoginAppHome)+"MENUS\" ADDITIVE 

SET PATH TO (LoginAppHome)+"REPORTS\" ADDITIVE 
************************************************

IF NOT "PROC_ERP" $ SET("PROCEDURE")
	SET PROCEDURE TO (gERPAppHome + "PROGS\Proc_ERP.prg") ADDITIVE
ENDIF
IF NOT "PROC_QUOTES" $ SET("PROCEDURE")
	SET PROCEDURE TO (gERPAppHome + "PROGS\Proc_Quotes.prg") ADDITIVE
ENDIF
IF NOT "PROC_SETUP" $ SET("PROCEDURE")
	SET PROCEDURE TO (gERPAppHome + "PROGS\Proc_Setup.prg") ADDITIVE
ENDIF
IF NOT "PROC_SQL" $ SET("PROCEDURE")
	SET PROCEDURE TO (gERPAppHome + "PROGS\Proc_SQL.prg") ADDITIVE
ENDIF
IF NOT "PROC_STOCKLST" $ SET("PROCEDURE")
	SET PROCEDURE TO (gERPAppHome + "PROGS\Proc_StockLst.prg") ADDITIVE
ENDIF
IF NOT "PROC_WO" $ SET("PROCEDURE")
	SET PROCEDURE TO (gERPAppHome + "PROGS\Proc_WO.prg") ADDITIVE
ENDIF

*SET PROCEDURE TO (SYS(5)+SYS(2003)+"\PROGS\utilityReportListener.prg") ADDITIVE
*SET CLASSLIB TO (SYS(5)+SYS(2003)+"\LIBS\_reportlistener")


*!*	*******************
*!*	**Delete old Errors table versions
*!*	*******************
*!*	PRIVATE cErrorsFile 
*!*	cErrorsFile =  SYS(5)+SYS(2003)+"\MEM\Errors.DBF"
*!*	IF FILE(cErrorsFile)
*!*		IF USED('Errors')
*!*			SELECT Errors
*!*		ELSE
*!*			SELECT 0
*!*		ENDIF
*!*		
*!*		USE (cErrorsFile) SHARED 
*!*		IF VARTYPE(ErrorDate) = "D"
*!*			SELECT Errors
*!*			USE IN Errors
*!*			DELETE FILE (cErrorsFile)
*!*		ENDIF
*!*	ENDIF

************************

SET DECIMALS TO 4  &&Greatest precision is Thick with 4 Decimals.
WAIT CLEAR

* Establish a global error handler.
* The error events associated with objects
* take precedence over ON ERROR routines.

ON SHUTDOWN DO myShutDown

cOldError = ON("ERROR")
*ON ERROR DO SolutionErrHandle
*ON ERROR \Progs\ErrorHandlerLog(ERROR(),MESSAGE(),MESSAGE(1),PROGRAM(),LINENO())
*ON ERROR DO Progs\ErrorHandlerLog WITH ERROR(),MESSAGE(),MESSAGE(1),PROGRAM(),LINENO()

* SYS(2003) later points at \MEM\ — use gERPAppHome so the handler file is always found
IF NOT "ERRORHANDLERLOG" $ UPPER(SET("PROCEDURE"))
	SET PROCEDURE TO (gERPAppHome + "PROGS\errorhandlerlog.prg") ADDITIVE
ENDIF
ON ERROR DO errorhandlerlog WITH ERROR(),MESSAGE(1),MESSAGE(),PROGRAM(),LINENO()

*SET PROCEDURE TO Progs\Proc_Setup ADDITIVE
AppSetup_HomeDir(LoginAppHome)

ON KEY LABEL F2 DO (gERPAppHome + "PROGS\f2Math")

_SCREEN.Caption="ERP App"

*? "Set Screen"
Local oldScreenLeft
Local oldScreenTop
Local oldScreenHeight, newScreenHeight
Local oldScreenWidth, newScreenWidth

oldScreenLeft	=_SCREEN.Left       
oldScreenTop	=_SCREEN.Top
oldScreenHeight=_SCREEN.Height
oldScreenWidth	=_SCREEN.Width

*WAIT WINDOW "oldScreenLeft"+STR(oldScreenLeft)+" oldScreenTop"+STR(oldScreenTop)+" oldScreenHeight"+STR(oldScreenHeight)+" oldScreenWidth"+STR(oldScreenWidth)

IF oldScreenHeight < 380
	newScreenHeight = 490
	newScreenWidth	= 640
	_SCREEN.Left	= oldScreenLeft     
	_SCREEN.Top		= oldScreenTop       
	_SCREEN.Height	= newScreenHeight
	_SCREEN.Width	= newScreenWidth
	
ELSE
	IF oldScreenHeight > 480
		_SCREEN.Left	= oldScreenLeft     
		_SCREEN.Top		= oldScreenTop       
		_SCREEN.Height	= oldScreenHeight
		_SCREEN.Width	= oldScreenWidth
	ENDIF
ENDIF

*!*	************************************
*!*	IF NOT "\MEM" $ SYS(2003)
*!*		SET DEFAULT TO ( SYS(5)+SYS(2003)+"\MEM\" )
*!*		SET DEFAULT TO (LoginAppHome+"MEM\") 
*!*	ENDIF
*!*	*add the MEM hear so the SYS(2003) works with SET PROC code block and ON ERROR.
*!*	*This Changes the SYS(2003)!!
*Note: keep Default to to one below \MEM\  
*When looking to save to mem, make sure MEM is added to file location.

**************************************************
* Run the main form and establish the event loop

*? "get SalesP"
IF FILE(SYS(5)+SYS(2003) +"\SalesP.MEM")
	RESTORE FROM (SYS(5)+SYS(2003) +"\SalesP.MEM") ADDITIVE
*	SAVE ALL LIKE SalesP TO (SYS(5)+SYS(2003) +"\SalesP.MEM")
*	DELETE FILE (SYS(5)+SYS(2003) +"\SalesP.MEM")
ELSE
	IF FILE(SYS(5)+SYS(2003) +"\MEM\SalesP.MEM")	&&Old Code
		RESTORE FROM (SYS(5)+SYS(2003) +"\MEM\SalesP.MEM") ADDITIVE
	ELSE
		MESSAGEBOX("Run the ERP Setup to set defaults."+CHR(13)+"Main.prg"+CHR(13)+CHR(13)+"SYS(5)="+SYS(5)+" "+CHR(13)+"SYS(2003)="+SYS(2003)+" "+CHR(13)+"Line C "+STR(LINENO()) ,48,"Set Defaults")
		DO FORM LOCFILE("E:\VFP\ERP_2\Forms\setuperp.scx","SCX","Select the setuperp.scx")
		*RESTORE FROM (SYS(5)+SYS(2003) +"\SalesP.MEM") ADDITIVE
		
*		IF NOT FILE(SYS(5)+SYS(2003) +"\MEM\SalesP.MEM")	&&Old Code
*			m.SalesP = '0'  &&Set to Internal SalesP Zero
*			SAVE ALL LIKE SalesP TO (SYS(5)+SYS(2003) +"\MEM\SalesP.MEM")
*		ENDIF
		IF NOT FILE(SYS(5)+SYS(2003) +"\SalesP.MEM")
			m.SalesP = '0'  &&Set to Internal SalesP Zero
			SAVE ALL LIKE SalesP TO (SYS(5)+SYS(2003) +"\SalesP.MEM")
		ENDIF

	ENDIF
ENDIF

PUBLIC gGlobalTable
gGlobalTable	= ""

IF FILE(gERPAppHome + "PROGS\Proc_Setup.prg")
	SET PROCEDURE TO (gERPAppHome + "PROGS\Proc_Setup.prg") ADDITIVE
	SET PROCEDURE TO (gERPAppHome + "PROGS\Proc_Quotes.prg") ADDITIVE
	IF FILE(gERPAppHome + "PROGS\load_ERP_Environment.prg")
		SET PROCEDURE TO (gERPAppHome + "PROGS\load_ERP_Environment.prg") ADDITIVE
	ENDIF
	IF FILE(gERPAppHome + "PROGS\load_CompanyProfile.prg")
		SET PROCEDURE TO (gERPAppHome + "PROGS\load_CompanyProfile.prg") ADDITIVE
	ENDIF
	IF FILE(gERPAppHome + "PROGS\company_branding.prg")
		SET PROCEDURE TO (gERPAppHome + "PROGS\company_branding.prg") ADDITIVE
	ENDIF
	= get_SQLSTRINGCONNECT()		&&Sets gGlobalServer via ERP_Environment.xml
	IF FILE(gERPAppHome + "PROGS\load_CompanyProfile.prg")
		DO load_CompanyProfile
	ENDIF
	IF FILE(gERPAppHome + "PROGS\load_CompanyPlants.prg")
		SET PROCEDURE TO (gERPAppHome + "PROGS\load_CompanyPlants.prg") ADDITIVE
		DO load_CompanyPlants
	ENDIF
	IF FILE(gERPAppHome + "REPORTS\company_report.prg")
		SET PROCEDURE TO (gERPAppHome + "REPORTS\company_report.prg") ADDITIVE
	ENDIF
	IF FILE(gERPAppHome + "PROGS\cert_sig.prg")
		SET PROCEDURE TO (gERPAppHome + "PROGS\cert_sig.prg") ADDITIVE
	ENDIF
	IF FILE(gERPAppHome + "REPORTS\cert_report.prg")
		SET PROCEDURE TO (gERPAppHome + "REPORTS\cert_report.prg") ADDITIVE
	ENDIF
	IF FILE(gERPAppHome + "PROGS\company_branding.prg")
		= InitCompanyBranding()
		lcCompanyIcon = GetCompanyIconPath()
		IF !EMPTY(lcCompanyIcon) AND FILE(lcCompanyIcon)
			_SCREEN.Icon = lcCompanyIcon
		ENDIF
	ELSE
		IF VARTYPE(gGlobalServer)="C" AND !EMPTY(gGlobalServer)
			_SCREEN.Caption = "ERP [" + ALLTRIM(gGlobalServer) ;
				+ IIF(VARTYPE(gGlobalDatabase)="C" AND !EMPTY(gGlobalDatabase), " / " + ALLTRIM(gGlobalDatabase), "") + "]"
		ENDIF
	ENDIF
ELSE
	IF "\MEM" $ SYS(2003)
		PRIVATE cFileStruct
		cFileStruct = SYS(5)+SYS(2003)
		cFileStruct = LEFT(cFileStruct, AT("\MEM",cFileStruct) )
		
		SET PROCEDURE TO cFileStruct+"Progs\Proc_Setup" ADDITIVE
		SET PROCEDURE TO cFileStruct+"Progs\Proc_Quotes" ADDITIVE
	ELSE
		MESSAGEBOX("Looking for 'Progs\Proc_Setup.prg' in "+SYS(5)+SYS(2003)+CHR(13)+"Could not set libraries.",0,"File Structure is Wrong")
	ENDIF
ENDIF



*? "Do ERP Main Menu"
DO FORM Forms\ERP_Menu
READ EVENTS			&&??Memo1: Alias 'SALESQUOTE' is not found.. 2019-01-31 2019-05-15 ??
*: Variable 'CFORMSORT' is not found.. 2019-11-06 ???

* Reset the global error handler
ON ERROR &cOldError


* Project resolution markers for API functions

Procedure MAINHWND
Procedure  _WHTOHWND
Procedure  _WONTOP
Procedure  GetFileVersion


*********************************************************
PROCEDURE myShutDown
CLEAR EVENTS
ON ShutDown
QUIT
*********************************************************