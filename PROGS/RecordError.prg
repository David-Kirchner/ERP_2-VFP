PARAMETERS Pnerror, Pmess1, Pcprogram, Pnlineno, pMessMemo
*Found in RecordError.prg and Proc_ERP
*? RecordError(1, 'mess1', 'program', 1, 'Long Message')
* RecordError(Pnerror, Pmess1, Pcprogram, Pnlineno, pMessMemo)
* Pmess1 is now 254+254+254 = 762max
IF NOT "PROC_SETUP" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
	SET PROCEDURE TO Progs\Proc_Setup ADDITIVE
ENDIF 

IF VARTYPE(Pnerror) !="N"
	Pnerror = 0
ENDIF
IF VARTYPE(Pmess1) != "C"
	Pmess1 = ''
ENDIF
IF VARTYPE(Pcprogram) != "C"
	Pcprogram = ''
ENDIF
IF VARTYPE(Pnlineno) !="N"
	Pnlineno = 0
ENDIF 
IF VARTYPE(pMessMemo) != "C"
	pMessMemo = ''
ENDIF

PRIVATE cLastVersion
TRY
	cLastVersion = Get_HPAVersion(.F.)
CATCH
	cLastVersion = ''
ENDTRY
* Dev (.APP): no compiled SAUSA-ERP.EXE revision — use date for dbo.Errors.Revision
IF EMPTY(ALLTRIM(cLastVersion))
	cLastVersion = "DEV " + DTOC(DATE())
ENDIF

*!*	IF VARTYPE(cLastVersion) = "C"
*!*		nLastVersion = VAL(RIGHT( LEFT(cLastVersion,AT(".",cLastVersion)-1), LEN(LEFT(cLastVersion,AT(".",cLastVersion)-1))-8))*10000000 +VAL(RIGHT(cLastVersion,LEN(cLastVersion)-AT(".",cLastVersion)))*10000
*!*	ELSE
*!*		nLastVersion = 0
*!*	ENDIF

PRIVATE cAlias 
cAlias = ALIAS()
SELECT 0

*!*	IF Pmess1<>'Record Test Data.'
*!*		*Record Error on Screen
*!*		TRY
*!*		*	cRun = "ErrorCapture.EXE " +["Progs\RecordError.PRG: ]+SYS(0)+[" VFP@SpaceAlloysUSA.com ]
*!*		*	cRun = "ErrorCapture.EXE " +[""Progs\RecordError.PRG: ]+SYS(0)+[" David.Kirchner@Windfall.HPA.local ]
*!*			cRun = "ErrorCapture.EXE " +["Proc_ERP:RecordError: ]+SYS(0)+[" VFP@SpaceAlloysUSA.com ]
*!*			
*!*			RUN /N &cRun
*!*			
*!*		ENDTRY
*!*	ENDIF
*RecordError
PRIVATE lCloseErrors 
lCloseErrors = .T.  &&Not sure why Errors should be open
PRIVATE lFoundErrorFile
lFoundErrorFile = .F.

IF !USED('Errors')
	IF "\MEM" $ SYS(2003)
		cErrorsFile =  SYS(5)+SYS(2003)+"\Errors.DBF"
	ELSE
		cErrorsFile =  SYS(5)+SYS(2003)+"\MEM\Errors.DBF"
	ENDIF

	IF FILE(cErrorsFile )
		USE (cErrorsFile) SHARED IN 0 ALIAS Errors
	ELSE
		SELECT 0
		*FoxPro is easier to use as C254, combine back the the SQL unlimited text.
		CREATE TABLE (cErrorsFile) FREE ( nerror INT, mess1 C(254), cprogram c(254), nlineno int, errordate DateTime, MACHINE c(254), Revision c(254), Memo1 MEMO)
		*USE (cErrorsFile) SHARED IN 0 ALIAS Errors
	ENDIF
	
	IF USED('Errors')
		lCloseErrors = .T.
	ENDIF
ENDIF

IF "create cursor HPAdata from array" $ mess1
	mess1 = " "
ENDIF

*****************
IF USED('Errors')
	IF AFIELDS(aTableFields) > 0
		IF ASCAN(aTableFields,"MESS3") = 0
			*Not the latest version
			
			USE (cErrorsFile) SHARED IN 0 ALIAS Errors
			CREATE TABLE (cErrorsFile) FREE ( nerror INT, mess1 C(254), cprogram c(254), nlineno int, errordate DateTime, MACHINE c(254), Revision c(254), Memo1 MEMO)
			
		ENDIF
	ENDIF
ENDIF

*****************
IF !USED('Errors')
	SELECT 0
	
	*WAIT WINDOW "Need to find File "+SYS(5)+SYS(2003)+"\Errors.DBF" NOWAIT
	*USE ? SHARED IN 0 ALIAS Errors
	USE GETFILE("DBF", "errors.dbf", "Open", 0, "Locate the 'errors.dbf' in HPA\MEM\" ) SHARED
	
	IF USED('Errors')
		IF AFIELDS(aTableFields) > 0
			IF ASCAN(aTableFields,"MESS3") = 0
				*Not the latest version
				
				IF "\MEM" $ SYS(2003)
					cErrorsFile =  SYS(5)+SYS(2003)+"\Errors.DBF"
				ELSE
					cErrorsFile =  SYS(5)+SYS(2003)+"\MEM\Errors.DBF"
				ENDIF
					
				USE (cErrorsFile) SHARED IN 0 ALIAS Errors
				CREATE TABLE (cErrorsFile) FREE ( nerror INT, mess1 C(254), cProgram C(254), nlineno int, errordate DateTime, MACHINE c(254), Revision c(254), Memo1 MEMO)
				
				IF USED('Errors')
				
				ENDIF
			ENDIF
		ENDIF
	ENDIF

	lCloseErrors = .T.
ENDIF


*****************
IF USED('Errors')
	lFoundErrorFile = .T.
ENDIF
	


*****************
IF lFoundErrorFile 

	INSERT INTO Errors ( nerror, mess1, cprogram, nlineno, errordate, MACHINE, Revision, Memo1 );
		 VALUES ( Pnerror, cMess1, cMess2, cMess3, Pcprogram, Pnlineno, DATETIME(), SYS(0), cLastVersion, pMessMemo)
	*cSQL = "INSERT INTO dbo.Errors ([nerror],[mess1],[cprogram],[nlineno],[errordate],[MACHINE],[Revision],[Memo1]) VALUES ("
	 
ENDIF

IF USED('Errors')
	*try to save to SQL now, but pack later
	
	TRY	
		IF NOT "PROC_SETUP" $ SET("PROCEDURE") 
			SET PROCEDURE TO Progs\Proc_Setup ADDITIVE
		ENDIF
		
		*CollectErrors(.T.)
		*MESSAGEBOX("RecordError.prg will not be run to Email this message.",0,"Skipping Email!")
		*********************************************************
*!*			
*!*		ALTER TRIGGER [dbo].[Errors_INSERT]
*!*		   ON [dbo].[Errors] 
*!*		   AFTER INSERT 
*!*		   NOT FOR REPLICATION
*!*		AS 
*!*		BEGIN
*!*		IF @@NESTLEVEL>1 RETURN 
*!*	
*!*		SET NOCOUNT ON;
*!*	
*!*		DECLARE @Body varchar(4000)
*!*	*!*		SELECT TOP 1 @Body = ('Errors table has a new entry!'+CHAR(13)+CHAR(13)
*!*			+'Error: '+RTRIM( CAST(nError AS CHAR(10)) )+'.'+CHAR(13)
*!*			+'Mess1: '+RTRIM(inserted.Mess1)+CHAR(13)
*!*			+'Program: '+RTRIM(inserted.cProgram)+'.'+CHAR(13)
*!*			+'Line: '+RTRIM( CAST(nLineNo AS CHAR(9)) )+'.'+CHAR(13)
*!*			+'Date: '+RTRIM( CAST(ErrorDate AS VARCHAR(20)) )+'.'+CHAR(13)
*!*			+'Machine: '+RTRIM(inserted.Machine)+'.'+CHAR(13)
*!*			--+'sUser_sName: '+RTRIM(suser_sname())+CHAR(13)
*!*			+'Revision: '+RTRIM(inserted.Revision)+'.'+CHAR(13)+CHAR(13)
*!*			+'Memo1: '+RTRIM(inserted.Memo1)+'.'+CHAR(13)
*!*			+@@SERVERNAME+' TRIGGER dbo.Errors_INSERT ' )
*!*			FROM inserted 
*!*	
*!*		DECLARE @cEmailFrom VARCHAR(30) = dbo.f_GetSQL_Server_Email()
*!*	
*!*		EXEC dbo.p_eMail_Send
*!*			@FromEmail = @cEmailFrom, 
*!*			@ToEmail = 'David.Kirchner@SpaceAlloysUSA.com', 
*!*			@SubjectEmail = 'New dbo.Errors entry.',
*!*			@BodyEmail = @Body,
*!*			@BodyType = 'TEXT'
*!*	
*!*		END
			
				
		PRIVATE m.cMachine, m.dDateT
		m.cMachine = SYS(0)
		m.dDateT = DATETIME()

		PRIVATE nConn
		nConn = get_SQLSTRINGCONNECT()

		PRIVATE cSQL, nSQLEXEC

		IF nConn > 0

		*	INSERT INTO Errors ( nerror, mess1, cprogram, nlineno, errordate, MACHINE, Revision, Memo1 );
		*		 VALUES ( Pnerror, Pmess1h2, Pcprogram, Pnlineno, DATETIME(),SYS(0), cLastVersion, pMessMemo)
		* m.nError, m.cMess, m.cProgram, m.nLineNo, m.cMessMemo
			SELECT Errors
			SCAN
			
				IF DELETED('Errors')
					SKIP
				ENDIF
				
				* nerror, mess1, cprogram, nlineno, errordate, MACHINE, Revision, Memo1 
				*Errors Insert trigger sends out SubjectEmail = 'New Error entry.'
				cSQL = "INSERT INTO dbo.Errors ([nerror],[mess1],[cprogram],[nlineno],[errordate],[MACHINE],[Revision],[Memo1]) VALUES ("
				cSQL = cSQL  + ""+STR(PrepareSQLnum(	Errors.nError	,'nError',-3))+""
				cSQL = cSQL  + ",'"+PrepareSQLtxt(		Errors.Mess1		,'Mess1',254,.F.,.T.)+"'"
				cSQL = cSQL  + ",'"+PrepareSQLtxt(		Errors.cProgram	,'cProgram',254,.F.,.T.)+"'"
				cSQL = cSQL  + ","+STR(PrepareSQLnum(	Errors.nLineNo	,'nLineo',-3))
				cSQL = cSQL  + ",'"+TTOC(PrepareSQLdateTime(Errors.ErrorDate,'ErrorDate'))+"'"
				*cSQL = cSQL  + ",'"+TTOC(DATETIME())+"'"
				cSQL = cSQL  + ",'"+PrepareSQLtxt(		Errors.Machine	,'Machine',254,.F.,.T.)+"'"
				cSQL = cSQL  + ",'"+PrepareSQLtxt(		Errors.Revision	,'Revision',254,.F.,.T.)+"'"
				cSQL = cSQL  + ",'"+PrepareSQLtxt(		Errors.Memo1	,'Memo',-1,.F.,.T.)+"'"
				cSQL = cSQL  + ")"
				
				*PrepareSQLtxt(Text,'Name',nLEN, lPad, lQuite
				*TRIGGER dbo.Errors_INSERT Mess1: Memo1: 
				
				*WAIT WINDOW "Proc_Setup:CollectErrors() "+SUBSTR(cSQL,110,100)
				
				*MESSAGEBOX(cSQL,0,"SQL Error")
				
				nSQLEXEC = SQLEXEC(nConn, cSQL )
				DO WHILE nSQLEXEC = 0
					WAIT WINDOW 'SQL' TIMEOUT 1
					nSQLEXEC = SQLEXEC(nConn, cSQL )
				ENDDO
				IF nSQLEXEC < 0
					*SQLEXECError(cSQL, nConn, nSQLEXEC)
					*RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(1),LINENO(),cSQL )
				ELSE
					DELETE IN Errors
				ENDIF
				
			ENDSCAN
		ENDIF				
		

		*****************************************
	
	*CATCH TO mem
	
	ENDTRY
	
ENDIF

IF USED('Errors')
	IF lCloseErrors
		USE IN Errors
	ENDIF
ENDIF		 

*IF NOT EMPTY(cAlias)
IF LEN(cAlias) > 0
	IF USED(cAlias)
		SELECT (cAlias)
	ENDIF
ENDIF