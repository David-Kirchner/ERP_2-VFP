*IF NOT "Proc_ERP" $ SET("PROCEDURE")  &&Added for when Quotes is run without HPA menu.
*	SET PROCEDURE TO Progs\Proc_ERP ADDITIVE
*ENDIF

***********************************************************************************************
*NewID(tcAlias) 
*PurchasedWriteOff 
*TrackMess 				:1 Parameter, INSERT INTO dbo.NR_UserTrack
*TrackError 			:4 Parameter, Sends to RecordError()
*SQLExecError 			:4 Parameter, Retries Query, Sends to RecordError()
*RecordError 	.prg	:5 Parameter, cRun = "ErrorCapture.EXE ", INSERT INTO Errors 
*RecordTest         	:4 Parameter, Sends to RecordError()  Pmess1, Pcprogram, Pnlineno, pMessMemo
*Track_Sales_No_Chng	:4 Parameter, Body, salesNum, ShopRecv,Ver
*Insert_Sales_Status
*FixPOitem FixSOitem
*Proper_PO_Item Proper_PO_Item_Item Proper_PO_Item_PO
*Proper_SO_Item Proper_SO_Item_Item Proper_SO_Item_SO 
*Proper_InqNumP
*Proper_Form
*Proper_Thk    
*Proper_Email
*Proper_Heat_Lot_Machine Proper_Heat_Lot_Lot
*ValPOitem
*RemoveNasties CheckUPSroute 
*Chemistry1 Chemistry2 Chemistry3 
*SQLTRANS 
*getScanStandard getScannedINT getScannedItem
*SetPrinterforPDF()
*EmailFileName
*AddMonths
*LinesToPrint
*--HPA_HTML_Header  HPA_HTML_Footer

*HTML_SOitem HTML_SO HTML_SO_Status HTML_POitem HTML_PO 
*HTML_WO HTML_WO_Detail HTML_WO_Status 
*HTML_CustomerInfo_ID HTML_CompanyInfo HTML_Quote_ID HTML_InqNumP
*HTML_ProjID HTML_MFG_Log HTML_GFM_Log HTML_GFM_fSize_CW HTML_GFM_Calc_StartSize HTML_MFG_CC_CL_Search HTML_ColdWork_Stats
*HTML_PackingSlipNo  HTML_PackingSlip_SO HTML_PackingSli_DataMatrix 
*HTML_Sales_Stock_SOitem HTML_VendCode
*HTML_ReceivingID 
*HTML_Receiving_POitem  HTML_Receiving_Stock_Detail HTML_Receiving_Broker_Detail HTML_POitem_Receiving_SELECTED_SOitem
*HTML_Receiving_SELECTED_SOitem  HTML_Receiving_WOD_SELECTED_SOitem 
*HTML_Stock_ID HTML_Stock_ID_Detail HTML_Stock_ID_Detail_Process HTML_Tracking_Mess
*HTML_Inv_Rack 
*HTML_RMA_No  HTML_RMA_Detail
*HTML_Rack_Location 

*!!HTML_Vendor_History!!

*!*		PRIVATE m.loHyperlink,m.cHyperLink
*!*		m.cHyperLink = HTML_WO(nWO,.T.)
*!*		m.loHyperlink = CREATEOBJECT("Hyperlink")
*!*		m.loHyperlink.navigateto(m.cHyperLink)
*!*		RELEASE m.loHyperlink
*!*		WAIT WINDOW "Look for a blinking Internet Explorer to see the report! - This can take time!" NOWAIT

*HTML_Escape 
*getPOStockString 
*getShipWhereString
*PU_Unit Calc_TotalValue
*DescriptionMetricReport
*Encode2D 
*Convert_Fractions_to_Numeric
*GetStreetAddress
*get_SoldTo  get_ShipTo  have_Customer_List_Notes  
*GetAlloyStandard GetFormStandard
*Alert_Receive_Check Alert_Receive_Mark
*UniqDBF UniqDBFdel 
*Calc_Feet 
*Board_Sched_Type
*EmailLog_TO
*Get_SQL_DateTime

***********************************************************************************************

*PRIVATE loHyperlink,m.cHyperLink
*m.cHyperLink = HTML_SOitem(cSOitem,.T.) &&lReturnURL --not URL is an HTML code.
*loHyperlink = CREATEOBJECT("Hyperlink")
*loHyperlink.navigateto(m.cHyperLink)
*RELEASE loHyperlink
*MESSAGEBOX("Look for Open Web Browser for this Report",0,"Report Complete")
*RELEASE loHyperlink,m.cHyperLink

**********************

PROCEDURE NewID(tcAlias)
  LOCAL lcAlias, lcID, lcOldReprocess, lnOldArea
  lnOldArea = SELECT()
  
  IF PARAMETERS() < 1
    lcAlias = UPPER(ALIAS())
  ELSE
    lcAlias = UPPER(tcAlias)
  ENDIF
        
  lcID = ""
  lcOldReprocess = SET('REPROCESS')

  PRIVATE cAlias 
  cAlias = ALIAS()
  
  *-- Lock until user presses Esc
  SET REPROCESS TO AUTOMATIC

  IF NOT USED("tmpPH_NewID")
    USE tmpPH_NewID 
  ENDIF
  SELECT tmpPH_NewID
      
  IF SEEK(lcAlias, "tmpPH_NewID", "table_name")
    IF RLOCK()
      lcID = tmpPH_NewID.ID
      REPLACE tmpPH_NewID.ID WITH ;
              STR(VAL(ALLT(lcID)) + 1, LEN(NewID.ID))
      UNLOCK
    ENDIF
  ELSE
  	lcID = "1"
    INSERT INTO tmpPH_NewID ("table_name", "ID") VALUES (lcAlias, lcID)
  ENDIF
  
  USE IN tmpPH_NewID  
  SELECT (lnOldArea)
  SET REPROCESS TO lcOldReprocess
  
  IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
		
	ENDIF
  ENDIF

  RETURN lcID
ENDPROC

********************** OLD
PROCEDURE SO_get_next 
  LOCAL nSOmaxNew, lnOldArea
  DIMENSION aSOMax(1)
  
  lnOldArea = SELECT()
  SELECT 0
  IF NOT "PROC_SQL" $ SET("PROCEDURE")  &&Added for when Quotes is run without HPA menu.
		SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
	ENDIF

	nConnHandle = get_SQLSTRINGCONNECT() 
	cSQL = "SELECT MAX(SalesNum) AS CNT FROM dbo.SOMax"

	IF USED('tmpPH_SOMax')
		USE IN tmpPH_SOMax
	ENDIF

	SELECT 0
	nSQLEXEC = SQLEXEC(nConnHandle, cSQL, 'tmpPH_SOMax')
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConnHandle, cSQL, 'tmpPH_SOMax')
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConnHandle, cSQL, "tmpPH_SOMax")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConnHandle, cSQL, "StmpPH_OMax")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		MESSAGEBOX('Data Error with SQL'+CHR(13)+"Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), 16, 'SQL Error')
		nSOmaxNew = 1000
	ELSE
		nSOmaxNew = tmpPH_SOMax.CNT
	ENDIF

	IF USED('tmpPH_SOMax')
		USE IN tmpPH_SOMax
	ENDIF

	nSOmaxNew = nSOmaxNew + 1
	
	cSQL = "UPDATE dbo.SOMax SET SalesNum = "+STR(nSOmaxNew)
	
	nSQLEXEC = SQLEXEC(nConnHandle, cSQL, 'tmpPH_SOMax' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConnHandle, cSQL, 'tmpPH_SOMax')
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConnHandle, cSQL, "tmpPH_SOMax")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConnHandle, cSQL, "tmpPH_SOMax")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		MESSAGEBOX('Data Error with SQL'+CHR(13)+"Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), 16, 'SQL Error')
	ENDIF
	
	IF USED('tmpPH_SOMax')
		USE IN tmpPH_SOMax
	ENDIF
	
	= SQLDISCONNECT(nConnHandle)
  SELECT (lnOldArea)
  RETURN nSOmaxNew 
ENDPROC

********************** New
*!*	PROCEDURE SO_get_next 

*!*	PRIVATE nSOmaxNew 
*!*	nSOmaxNew = 0
*!*	  
*!*	PRIVATE cAlias, nConnHandle, cSQL 
*!*	cAlias = ALIAS()

*!*	IF NOT "PROC_SQL" $ SET("PROCEDURE")  &&Added for when Quotes is run without HPA menu.
*!*		SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
*!*	ENDIF
*!*	nConnHandle = get_SQLSTRINGCONNECT() 

*!*	IF USED('SOMax')
*!*		USE IN SOMax
*!*	ENDIF

*!*	SELECT 0
*!*	cSQL = "EXEC p_SO_get_next "

*!*	nSQLEXEC = SQLEXEC(nConnHandle, cSQL, 'SOMax')
*!*	DO WHILE nSQLEXEC = 0
*!*		WAIT WINDOW 'SQL' TIMEOUT 1
*!*		nSQLEXEC = SQLEXEC(nConnHandle, cSQL, 'SOMax')
*!*	ENDDO
*!*	IF nSQLEXEC < 0 &&Try again!
*!*			nSQLEXEC = SQLEXEC(nConnHandle, cSQL, "SOMax")
*!*			DO WHILE nSQLEXEC = 0
*!*				WAIT WINDOW 'SQL 2' TIMEOUT 1
*!*				nSQLEXEC = SQLEXEC(nConnHandle, cSQL, "SOMax")

*!*				IF nSQLEXEC < 0
*!*					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
*!*						nSQLEXEC = 0
*!*					ENDIF
*!*				ENDIF
*!*			ENDDO
*!*		ENDIF
*!*	IF nSQLEXEC < 0
*!*		SQLEXECError(cSQL, nConnHandle, nSQLEXEC, 'SOMax')
*!*	ENDIF

*!*	IF USED('SOMax')
*!*		IF RECCOUNT('SOMax') > 0
*!*			nSOmaxNew = SOMax.SOmaxNew
*!*		ENDIF
*!*		USE IN SOMax
*!*	ENDIF

*!*	= SQLDISCONNECT(nConnHandle)

*!*	IF NOT EMPTY(cAlias)
*!*		IF USED(cAlias)
*!*			SELECT (cAlias)
*!*		ELSE
*!*			RecordTest("Record Test Data.","Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
*!*		ENDIF
*!*	ENDIF

*!*	RETURN nSOmaxNew 
*!*	ENDPROC

*****************************************************
*!*	FUNCTION PO_get_next()
*!*	  LOCAL POMaxNew, lnOldArea
*!*	  DIMENSION aPOMax(1)
*!*	  
*!*	  lnOldArea = SELECT()
*!*	  SELECT 0
*!*	  	
*!*	  SELECT MAX(PONum) FROM POMax INTO ARRAY aPOMax

*!*	  POmaxNew = aPOMax(1) + 1

*!*	  UPDATE POMax SET POnum = POmaxNew 
*!*	  
*!*	  USE IN POMax
*!*	  
*!*	  SELECT (lnOldArea)
*!*	    
*!*	  RETURN POmaxNew 
*!*	ENDFUNC

*******************************************
PROCEDURE PurchasedWriteOff 
PARAMETER pAlloy, pForm, pDim1
*PurchasedWriteOff( cAlloy, cForm, tmpDetail_details.Dim1 )

PRIVATE cProblem
cProblem = ''
IF VARTYPE(pAlloy) != "C"
	cProblem = "Problem, no Alloy Parameter passed to PurchasedWriteOff.  "
ENDIF
IF VARTYPE(pForm) != "C"
	cProblem = cProblem + "Problem, no 'Form' Parameter passed to PurchasedWriteOff.  "
ENDIF
IF VARTYPE(pDim1) != "N" AND VARTYPE(pDim1) != "Y"
	cProblem = cProblem +"Problem, no Dim Parameter passed to PurchasedWriteOff.  "
ENDIF
IF NOT EMPTY(cProblem)
	TrackError("Parameter Problem",cProblem ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(1),LINENO())
	RETURN .F.
ENDIF

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE lPurchWriteOff
lPurchWriteOff = .T.
IF NOT "PROC_SQL" $ SET("PROCEDURE")  &&Added for when Quotes is run without HPA menu.
	SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
ENDIF

PRIVATE nConnHandle,cSQL,nSQLEXEC 
nConnHandle = get_SQLSTRINGCONNECT() 

cSQL = "SELECT Stocked FROM dbo.StockLst_Writeoff "
cSQL = cSQL + " WHERE Alloy='"+pAlloy+"'"
cSQL = cSQL + " AND Form='"+pForm+"'"
cSQL = cSQL + " AND Dim1="+STR(pDim1,10,4)

IF USED('tmpPH_AcctWriteOff')
	USE IN tmpPH_AcctWriteOff
ENDIF

SELECT 0
nSQLEXEC = SQLEXEC(nConnHandle, cSQL, 'tmpPH_AcctWriteOff')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConnHandle, cSQL, 'tmpPH_AcctWriteOff')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConnHandle, cSQL, "tmpPH_AcctWriteOff")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConnHandle, cSQL, "tmpPH_AcctWriteOff")

		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	MESSAGEBOX('Data Error with SQL'+CHR(13)+"Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), 16, 'SQL Error')
	=SQLDISCONNECT(nConnHandle)
	RETURN .T.
ENDIF

IF USED('tmpPH_AcctWriteOff')
	IF VARTYPE(tmpPH_AcctWriteOff.Stocked) = "L"
		IF tmpPH_AcctWriteOff.Stocked
			*Stockable Item, do not write off!
			lPurchWriteOff = .F.
		ENDIF
	ENDIF
	
	USE IN tmpPH_AcctWriteOff 
ENDIF

=SQLDISCONNECT(nConnHandle)
	
IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lPurchWriteOff
ENDPROC

***************************************** 
PROCEDURE TrackMess 
PARAMETER pTXT
*TrackMess(cTxt)
**Also Edit Proc_ERP.prg
**Also Edit Proc_Quotes.prg
**Also Edit Proc_SQL.prg

IF TYPE('pTXT') != "C"
	pTXT = "No Parameter"
ENDIF
IF NOT "PROC_SQL" $ SET("PROCEDURE")  &&Added for when Quotes is run without HPA menu.
	SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
ENDIF

PRIVATE nConnection
nConnection = get_SQLstringCONNECT()

IF nConnection < 0
	MESSAGEBOX("Could not connect to SQL Server"+CHR(13)+"Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),16,"No Tracking")
	RETURN .F.
ENDIF

IF LEN(pTXT) > 1024
	RecordTest("Record Test Data.", "Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"TrackMess is too long. "+ALLTRIM(STR(LEN(pTXT)))+"."+CHR(13)+pTXT )
ENDIF

PRIVATE pMess1HPA, Pcprogram

*pMess1HPA = STRTRAN(pMess1HPA,[''],["],1)
*pTXT		= STRTRAN(pTXT,['],["],1)
pTXT		= ShowSQLtxt(pTXT,'TrackMess',-1)
pMess1HPA = PrepareSQLtxt(LEFT(pTXT,1024),'pTXT',1024,.F.,.T.)
Pcprogram = "HPA:Proc_ERP:TrackMess"

PRIVATE cSQL, nSQLEXEC  
*Do not INSERT into dbo.NR_UserTrack Direct, let trigger add ServerName!
cSQL = "INSERT INTO dbo.NR_UserTrack (mess1,cprogram,MACHINE)"
cSQL = cSQL + " VALUES ('"+pMess1HPA+"','"+Pcprogram+"','"+SYS(0)+"')"

nSQLEXEC = SQLEXEC(nConnection, cSQL )

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConnection, cSQL )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConnection, cSQL, "")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConnection, cSQL, "")

		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	SQLEXECError(cSQL, nConnection, nSQLEXEC, '')
	RecordError(nSQLEXEC,"SQL Error" ,"Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
ENDIF

SQLDISCONNECT( nConnection )
RETURN .T.
ENDPROC

*****************************************
PROCEDURE TrackError 
PARAMETER pProblem, pMess_Title, Pcprogram, Pnlineno
*         (   MEMO, C(254),    C(254),      INT)
*TrackError("Problem","Title","Program",nLineNum)
*TrackError("Problem","Title","Proc_ERP"+PROGRAM(),LINENO())
*TrackMess is one Parameter!

IF TYPE('pProblem') != "C"
	pProblem = "No Problem Parameter passed to TrackError"
ENDIF
IF TYPE('pMess_Title') != "C"
	pMess_Title = ""
ENDIF
IF TYPE('Pcprogram') != "C"
	Pcprogram = "TrackError(); No Program parameter passed to TrackError"
ELSE
	Pcprogram = "TrackError(); "+Pcprogram
ENDIF
	
IF TYPE('pMess_Title') != "C"
	pProblem = "No Message Title parameter passed to TrackError, pMess_Title is empty and pcProgram is Empty. "+CHR(13)+pProblem 
ENDIF

IF TYPE('Pnlineno') != "N"
	Pnlineno = 0
ENDIF

PRIVATE cAlias 
cAlias = ALIAS()


RecordError( 0, pMess_Title, Pcprogram, Pnlineno, pProblem )
*RecordError(pnError, pMess_Title, Pcprogram, Pnlineno, pMessMemo)

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		IF UPPER(cAlias) != 'ERRORS'
			*RecordTest("Record Test Data.","Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
		ENDIF
	ENDIF
ENDIF

ENDPROC


*!*	***************************************** 

*!*	PROCEDURE SQLExecError 
*!*	PARAMETER pSQL, pnConnection, nSQLEXEC, cWorkArea
*!*	* Returns lWorked
*!*	***********************************
*!*	** See Proc_SQL:SQLExecError()
*!*	***********************************

*************************************************

PROCEDURE RecordError 
PARAMETERS Pnerror, Pmess1h2, Pcprogram, Pnlineno, pcMessMemo
*         (    INT, C(254),    C(254),      INT,      MEMO)
* RecordError( nerror INT, mess1 C254,"Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(1), MessMemo)
*Found in RecordError.prg and Proc_ERP
* RecordError(1, 'Title', 'program', LINENO(1),'Long Message')
* Called from TrackError of Proc_ERP

IF NOT "PROC_SETUP" $ SET("PROCEDURE")  &&Added for when Quotes is run without HPA menu.
	SET PROCEDURE TO Progs\Proc_Setup ADDITIVE
ENDIF 

PRIVATE m.nError, m.cMess, m.cProgram, m.nLineNo, m.cMessMemo, m.cMachine, m.dDate
IF VARTYPE(Pnerror) !="N"
	m.nError = 0
ELSE
	m.nError = Pnerror
ENDIF
IF VARTYPE(Pmess1h2) != "C"
	m.cMess= ''
ELSE
	m.cMess = Pmess1h2 
ENDIF
IF VARTYPE(Pcprogram) != "C"
	m.cProgram = ''
ELSE
	m.cProgram = Pcprogram
ENDIF
IF VARTYPE(Pnlineno) !="N"
	m.nLineNo = 0
ELSE
	m.nLineNo = Pnlineno
ENDIF 
IF VARTYPE(pcMessMemo) != "C"
	m.cMessMemo = ''
ELSE
	m.cMessMemo = pcMessMemo
ENDIF

**********************
PRIVATE cLastVersion
TRY
	cLastVersion = Get_HPAVersion(.F.,"STABLE")
	*cLastVersion = Get_HPAVersion(.F.,"LATEST")
CATCH
	cLastVersion = ''
ENDTRY	

PRIVATE cAlias 
cAlias = ALIAS()
SELECT 0

IF m.cMess<>'Record Test Data.'
	*Record Error of Screen
	TRY
	*	cRun = "ErrorCapture.EXE " +["Proc_ERP:RecordError: ]+SYS(0)+[" David.Kirchner@SpaceAlloysUSA.com ]
	*	cRun = "ErrorCapture.EXE " +["Proc_ERP:RecordError: ]+SYS(0)+[" David.Kirchner@Windfall.HPA.local ]
		cRun = "ErrorCapture.EXE " +["Proc_ERP:RecordError: ]+SYS(0)+[" VFP@WSpaceAlloysUSA.com ]

		RUN /N &cRun
		
	CATCH
		MESSAGEBOX("Error Capture was not run"+CHR(13)+"Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),16,"Could not run Error Capture.")
	ENDTRY
ENDIF

*RecordError
*PRIVATE lCloseErrors 
*lCloseErrors = .T.  &&Not sure why Errors should be open

PRIVATE m.cMachine, m.dDateT
m.cMachine = SYS(0)
m.dDateT = DATETIME()

PRIVATE nConn
IF LEN(cLastVersion) = 0
	nConn = 0
ELSE
	nConn = get_SQLSTRINGCONNECT()
ENDIF

PRIVATE cSQL, nSQLEXEC

IF nConn > 0

*	INSERT INTO Errors ( nerror, mess1, cprogram, nlineno, errordate, MACHINE, Revision, Memo1 );
*		 VALUES ( Pnerror, Pmess1h2, Pcprogram, Pnlineno, DATETIME(),SYS(0), cLastVersion, pMessMemo)
* m.nError, m.cMess, m.cProgram, m.nLineNo, m.cMessMemo


	*Errors Insert trigger sends out SubjectEmail = 'New Error entry.'
	cSQL = "INSERT INTO dbo.Errors ([nerror],[mess1],[cprogram],[nlineno],[errordate],[MACHINE],[Revision],[Memo1]) VALUES ("
	
	IF "PROC_SQL" $ SET("PROCEDURE")
		cSQL = cSQL  + ""+STR(PrepareSQLnum(	m.nError	,'nError',-3))+""
		cSQL = cSQL  + ",'"+PrepareSQLtxt(		m.cMess		,'Mess1',254,.F.,.T.)+"'"
		cSQL = cSQL  + ",'"+PrepareSQLtxt(		m.cProgram	,'cProgram',254,.F.,.T.)+"'"
		cSQL = cSQL  + ","+STR(PrepareSQLnum(	m.nLineNo	,'nLineo',-3))
		cSQL = cSQL  + ",'"+TTOC(DATETIME())+"'"
		cSQL = cSQL  + ",'"+PrepareSQLtxt(		m.cMachine	,'Machine',254,.F.,.T.)+"'"
		cSQL = cSQL  + ",'"+PrepareSQLtxt(	cLastVersion	,'Revision',254,.F.,.T.)+"'"
		cSQL = cSQL  + ",'"+PrepareSQLtxt(		m.cMessMemo	,'Memo',-1,.F.,.T.)+"'"
		cSQL = cSQL  + ")"
	ELSE
		*SET PROCEDURE TO Progs\Proc_SQL ADDITIVE 
		*PrepareSQLnum live in Proc_SQL, something has gone wrong, do not complicate the error
		*just trust proper parameters where passed.
		cSQL = cSQL  + ""+STR(m.nError)+""
		cSQL = cSQL  + ",'"+m.cMess+"'"
		cSQL = cSQL  + ",'"+m.cProgram+"'"
		cSQL = cSQL  + ","+STR(nLineNo)
		cSQL = cSQL  + ",'"+TTOC(DATETIME())+"'"
		cSQL = cSQL  + ",'"+m.cMachine+"'"
		cSQL = cSQL  + ",'"+cLastVersion+"'"
		cSQL = cSQL  + ",'"+m.cMessMemo+"'"
		cSQL = cSQL  + ")"
	ENDIF
	
	*PrepareSQLtxt(Text,'Name',nLEN, lPad, lQuite
	*TRIGGER dbo.Errors_INSERT Mess1: Memo1: 
	
	*WAIT WINDOW "Proc_Setup:CollectErrors() "+SUBSTR(cSQL,110,100)
	
	*MESSAGEBOX(cSQL+CHR(13)+"Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),0,"SQL Error")
	
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
		*SQLEXECError(cSQL, nConn, nSQLEXEC)
		*RecordError(nSQLEXEC,"SQL Error" ,"Proc_Setup:"+PROGRAM()+" @"+PROGRAM(1),LINENO(),cSQL )
	ELSE
		*DELETE IN Errors
	ENDIF
ENDIF				

ENDPROC

*************************************************

PROCEDURE RecordTest 
PARAMETERS Pmess1RecordTest, Pcprogram, Pnlineno, pMessMemo
* RecordTest("Record Test Data.","Proc_ERP:",1,"Long Message")
* RecordTest( mess1 C254, cprogram C254, LINENO(1), MessMemo VarChar(MAX) )
* RecordTest( "Record Test Data.","Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(1),"Long Message")

IF NOT "PROC_SETUP" $ SET("PROCEDURE")  &&Added for when Quotes is run without HPA menu.
	SET PROCEDURE TO Progs\Proc_Setup ADDITIVE
ENDIF 

IF VARTYPE(Pmess1RecordTest) != "C"
	Pmess1RecordTest = ''
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

IF RIGHT( SYS(0), LEN(SYS(0))-AT("#",SYS(0))-1 ) = "Dave Morrow"
	*Has been having trouble with sending these Emails
	RETURN
ENDIF

IF UPPER(pMessMemo) = "LOST ALIAS 'ERRORS'"
	*Could result in Loop
	RETURN
ENDIF

IF NOT "PROC_SQL" $ SET("PROCEDURE")  &&Added for when Quotes is run without HPA menu.
	SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
ENDIF
IF NOT "PROC_SETUP" $ SET("PROCEDURE")  &&Added for when Quotes is run without HPA menu.
	SET PROCEDURE TO Progs\Proc_Setup ADDITIVE
ENDIF 


PRIVATE cLastVersion
TRY
	cLastVersion = Get_HPAVersion(.F.,"STABLE")
CATCH
	cLastVersion = ''
ENDTRY	

PRIVATE cAlias 
cAlias = ALIAS()
SELECT 0

*!*	*Record Error of Screen
*!*	TRY
*!*	*	RUN ["]+SYS(5)+SYS(2003)+[\ErrorCapture.EXE" "RecordError: ]+SYS(0)+[" David.Kirchner@Windfall.HPA.local ] /N 
*!*		cRun = "ErrorCapture.EXE " +["Proc_ERP:RecordError: ]+SYS(0)+[" David.Kirchner@Windfall.HPA.local ]
*!*		RUN /N &cRun
*!*	ENDTRY

*RecordError
PRIVATE lCloseErrors 
lCloseErrors = .T.  &&Not sure why Errors should be open

Pmess1RecordTest = LEFT(Pmess1RecordTest,254)
Pcprogram = LEFT(Pcprogram,60)

	PRIVATE pcEmailTo, pcEmailFrom, pcEmailSubject, pcEmailText, lQuiet, lNoHeadder
	*pcEmailTo	= "David.Kirchner@SpaceAlloysUSA.com"
	*pcEmailFrom	= "David.Kirchner@SpaceAlloysUSA.com"
	pcEmailTo	= "RecordTestData@SpaceAlloysUSA.com"

	pcEmailFrom	= get_SQL_ServerName()+"@SpaceAlloysUSA.com"
	pcEmailSubject = Pmess1RecordTest 
	

	PRIVATE nConn
	nConn = get_SQLSTRINGCONNECT()

	*Write to SQL
	*Errors Insert trigger sends out SubjectEmail = 'New Error entry.'
	cSQL = "INSERT INTO dbo.Errors ([nerror],[mess1],[cprogram],[nlineno],[errordate],[MACHINE],[Revision],[Memo1]) VALUES ("
	*just trust proper parameters where passed.
	cSQL = cSQL  + "0"
	cSQL = cSQL  + ",'"+Pmess1RecordTest+"'"
	cSQL = cSQL  + ",'"+Pcprogram+"'"
	cSQL = cSQL  + ","+STR(Pnlineno)
	cSQL = cSQL  + ",'"+TTOC(DATETIME())+"'"
	cSQL = cSQL  + ",'"+SYS(0)+"'"
	cSQL = cSQL  + ",'"+cLastVersion+"'"
	cSQL = cSQL  + ",'"+PrepareSQLtxt(pMessMemo,'Memo',-1)+"'"
	cSQL = cSQL  + ")"


	TRY
	nSQLEXEC = SQLEXEC(nConn, cSQL, "" )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "" )
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
	
	CATCH
	WAIT WINDOW "Did not record to dbo.Errors" NOWAIT 
	
	ENDTRY


******************	 

IF NOT EMPTY(cAlias) 
	IF UPPER(cAlias) != 'ERRORS'
		IF USED(cAlias)
			SELECT (cAlias)
		ELSE
			*-Makes LOOP !!! 
			*RecordTest("Record Test Data.","Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
		ENDIF
	ENDIF
ENDIF

SQLDISCONNECT( nConn )

ENDPROC

***************************************** 
PROCEDURE Track_Sales_No_Chng 
PARAMETER cBody,nSalesNum,lShopRecv,nVer
*Track_Sales_No_Chng(cBody,nSalesNum,lShopRecv,nVer)

IF VARTYPE(cBody) != "C"
	cBody= "No Parameter"
ENDIF
cBody = PrepareSQLtxt(cBody,'Comment',-1)
IF VARTYPE(nSalesNum) != "N"
	nSalesNum = 0
ENDIF
IF nSalesNum = 0
	RecordError( 0, 'Track_Sales_No_Chng', "Proc_SQL:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"VFP message: No SalesNum parameter" )
	RETURN .F.
ENDIF
IF VARTYPE(lShopRecv) != "L"
	lShopRecv = .F.
ENDIF
IF VARTYPE(nVer) != "N"
	nVer = 0
ENDIF

IF NOT "PROC_SQL" $ SET("PROCEDURE")  &&Added for when Quotes is run without HPA menu.
	SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
ENDIF

PRIVATE nConnection
nConnection = get_SQLstringCONNECT()

IF nConnection < 0
	MESSAGEBOX("Could not connect to SQL Server"+CHR(13)+"Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),16,"No Tracking")
	RecordError( 0, 'Could not connect to SQL Server', "Proc_SQL:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"VFP message: Could not connect to SQL Server" )
	RETURN .F.
ENDIF

PRIVATE cSQL, nSQLEXEC  
cSQL = "INSERT INTO dbo.Sales_No_Chng (Body,SalesNum "
cSQL = cSQL + ",ShopRecv "
cSQL = cSQL + ",Ver "
cSQL = cSQL + ") VALUES ("
cSQL = cSQL + "'"+cBody+"'"
cSQL = cSQL + ","+STR(nSalesNum)
cSQL = cSQL + ","+IIF(lShopRecv,'1','0') &&Should allow null
cSQL = cSQL + ","+STR(nVER)
cSQL = cSQL + ")"

nSQLEXEC = SQLEXEC(nConnection, cSQL, "" )

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConnection, cSQL, "" )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConnection, cSQL, "")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConnection, cSQL, "")

		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	SQLEXECError(cSQL, nConnection, nSQLEXEC, '')
	RecordError(nSQLEXEC,"SQL Error" ,"Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
ENDIF

SQLDISCONNECT( nConnection )

RETURN .T.
ENDPROC

***************************************** 
PROCEDURE Insert_Sales_Status
PARAMETER cSOitem, nSO, cWhat, cBody
*Insert_Sales_Status(cSOitem, nSO, cWHAT, cBody)

cSOitem = Proper_SO_item(cSOitem)

IF VARTYPE(nSalesNum) != "N"
	nSalesNum = 0
ENDIF
IF nSalesNum = 0
	RecordError( 0, 'Insert_Sales_Status', "Proc_SQL:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"VFP message: No SalesNum parameter" )
	RETURN .F.
ENDIF

IF VARTYPE(cWhat) != "C"
	cWhat = "No Parameter"
ENDIF
cWhat = PrepareSQLtxt(cWhat,'Comment',20)

IF VARTYPE(cBody) != "C"
	cBody= "No Parameter"
ENDIF
cBody = PrepareSQLtxt(cBody,'Comment',-1)


IF NOT "PROC_SQL" $ SET("PROCEDURE")  &&Added for when Quotes is run without HPA menu.
	SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
ENDIF

PRIVATE nConnection
nConnection = get_SQLstringCONNECT()

IF nConnection < 0
	MESSAGEBOX("Could not connect to SQL Server"+CHR(13)+"Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),16,"No Tracking")
	RecordError( 0, 'Could not connect to SQL Server', "Proc_SQL:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"VFP message: Could not connect to SQL Server" )
	RETURN .F.
ENDIF

PRIVATE cSQL, nSQLEXEC  
cSQL = "INSERT INTO dbo.Sales_Status (SOitem,SalesNum,[What],[Comment]) VALUES ("
cSQL = cSQL +"'"+cSOitem+"',"+STR(nSO)+"',"+cWhat+"','"+cBody+"' )"

nSQLEXEC = SQLEXEC(nConnection, cSQL, "" )

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConnection, cSQL, "" )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConnection, cSQL, "")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConnection, cSQL, "")

		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	SQLEXECError(cSQL, nConnection, nSQLEXEC, '')
	RecordError(nSQLEXEC,"SQL Error" ,"Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
ENDIF

SQLDISCONNECT( nConnection )

RETURN .T.
ENDPROC


*********************************	
PROC FixPOitem
PARAMETER pPO,pItem,pPOitem
*Used to fix data stored as PO and Item to the Standard of POitem
*dbo.f_ProperPOitem
IF VARTYPE(pPO) != "N"
	pPO= 0
ENDIF
IF VARTYPE(pItem) != "N"
	pItem = 1
ENDIF
IF pItem = 0
	pItem = 1
ENDIF
IF VARTYPE(pPOitem) != "C"
	pPOitem = ''
ENDIF

PRIVATE cPOitem
IF pPOitem = Proper_PO_Item(STR(pPO)+"-"+STR(pItem)) 
	*Good to Go!
	cPOitem	= pPOitem
ELSE
	IF Proper_PO_Item(pPOitem) <> Proper_PO_Item('')
		cPOitem = pPOitem
	ELSE
		*No good
		IF pPO > 0
			*Try to Use pPO
			cPOitem = Proper_PO_Item(STR(pPO)+"-"+STR(pItem))
		ELSE
			cPOitem = ''
		ENDIF
	ENDIF	
ENDIF

RETURN cPOitem
ENDPROC

*********************************	
PROC FixSOitem
PARAMETER pSO,pItem,pSOitem
*Used to fix data stored as SO and Item to the Standard of SOitem
*cSOitem = FixSOitem(pSO,pItem,pSOitem)

IF VARTYPE(pSO) = "C"
	pSO = VAL(pSO)
ENDIF
IF VARTYPE(pSO) != "N"
	pSO= 0
ENDIF

IF VARTYPE(pItem) = "C"
	pItem = VAL(pItem)
ENDIF
IF VARTYPE(pItem) != "N"
	pItem = 1
ENDIF
IF pItem = 0
	pItem = 1
ENDIF

IF VARTYPE(pSOitem) != "C"
	pSOitem = Proper_SO_Item('')
ENDIF

PRIVATE cSOitem
IF pSOitem = Proper_SO_Item(STR(pSO)+"-"+STR(pItem))
	*Good to Go!
	cSOitem	= pSOitem
	RecordTest("Record Test Data.", PROGRAM(), LINENO(1),"pSOitem = '"+cSOitem+"'")
ELSE
	IF Proper_SO_Item(pSOitem) <> Proper_SO_Item('')
		*Use the passed SOitem
		cSOitem = pSOitem
		RecordTest("Record Test Data.", PROGRAM(), LINENO(1),"pSOitem = '"+cSOitem+"'")
	ELSE
		IF pSO > 0
			*Try to Use pSO,Item
			cSOitem = Proper_SO_Item(STR(pSO)+"-"+STR(pItem))
			RecordTest("Record Test Data.", PROGRAM(), LINENO(1),"Proper_SO_Item(STR(pSO)+'-'+STR(pItem)) = '"+cSOitem+"'" )
		ELSE
			cSOitem = ''
			RecordTest("Record Test Data.", PROGRAM(), LINENO(1),"cSOitem = ''")
		ENDIF
	ENDIF	
ENDIF

RETURN cSOitem
ENDPROC

*********************************	
PROC Proper_PO_Item 
PARAMETER pPOitem
*cPOitem=Proper_PO_Item(POitem)
*dbo.ProperPO('"+cPOitem+"')"

PRIVATE cPO,nPO,cItem,nItem,crPOitem
crPOitem = ""
IF TYPE("pPOitem")="L"
	*TrackError("No POitem was sent to Proper_PO_Item (). ","Proc_ERP:Proper_PO_Item() has no Field","Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN '        0-00'
ENDIF

IF TYPE("pPOitem")="C"
	pPOitem = ALLTRIM(pPOitem)
	nPO = ABS(VAL( LEFT(pPOitem,9) ))
	cPO = STR( nPO, 9)
	IF '-' $ pPOitem
		nItem = ABS(VAL( RIGHT( ALLTRIM(pPOitem),2 ) ))
	ELSE
		nItem = 0
	ENDIF
	cItem = ALLTRIM( STR( nItem, 2) )
	IF nPO < 2
		crPOitem = '        0-00'
	ELSE
		IF nItem < 10
			cItem = '0'+cItem
		ENDIF
		crPOitem = cPO+"-"+cItem
	ENDIF
ENDIF

RETURN crPOitem	
ENDPROC

*********************************	
PROC Proper_PO_Item_Item
PARAMETER cPOitem
*Return Item number
*nItemPO  = Proper_PO_Item_Item(POitem)   dbo.f_ProperPOitem
IF VARTYPE(cPOitem) != "C"
	cPOitem = ''
ENDIF
IF LEN(cPOitem) < 5
	RETURN 0
ENDIF
IF AT("-",cPOitem) = 0
	RETURN 0
ENDIF

PRIVATE nItemPO
nItemPO = PrepareSQLnum( RIGHT(cPOitem, 2),'ItemPO',2)

RETURN nItemPO	
ENDPROC

*********************************	
PROC Proper_PO_Item_PO 
PARAMETER pPOitem
*nHPApo = Proper_PO_Item_PO(POitem) dbo.f_ProperPOitem(
*Returns the POnumber

PRIVATE nHPApo, cPOitem
nHPApo = 0
cPOitem = ''
IF VARTYPE(pPOitem) = "N"
	nHPAPo = pPOitem
	cPOitem = STR(pPOitem)
ENDIF

IF VARTYPE(pPOitem) = "C"
	cPOitem = pPOitem
ENDIF
IF LEN(cPOitem) < 5
	RETURN 0
ENDIF
IF nHPAPo = 0
	nHPAPo = VAL(cPOitem)
ENDIF

IF nHPAPo = 0 AND AT("-",cPOitem) = 0
	RETURN 0
ENDIF

IF nHPAPo = 0 
	nHpaPo	= PrepareSQLnum( LEFT(cPOitem,9),'HPAPO',9)
ENDIF

RETURN nHpaPo	
ENDPROC

*********************************	
PROC Proper_PO 
PARAMETER pPOitem
*nHPApo = Proper_PO(POitem) dbo.f_ProperPO(
*Returns the PO number from POitem or PO

PRIVATE cPOitem 
IF VARTYPE(pPOitem) != "C"
	cPOitem = ''
ENDIF
IF LEN(pPOitem) < 5
	RETURN 0
ENDIF
IF VARTYPE(pPOitem) = "C"
	IF AT("-",pPOitem) = 0
		*RETURN 0
		pPOitem = VAL(pPOitem)
		cPOitem = ''
	ELSE
		cPOitem = pPOitem 
	ENDIF
ENDIF

PRIVATE nHpaPo
nHpaPo = 0
IF cPOitem == ''
	IF VARTYPE(pPOitem) = "N"
		nHpaPo	= PrepareSQLnum( pPOitem,'HPAPO',9)
	ENDIF
ELSE
	nHpaPo	= PrepareSQLnum( LEFT(cPOitem,9),'HPAPO',9)
ENDIF

RETURN nHpaPo	
ENDPROC

*********************************	
PROC Proper_SO_Item 
PARAMETER pSOitem
*cSOitem = Proper_SO_Item(SOitem)  Proper_SO_Item(STR(nSO)+"-"+STR(nItemSO))
*dbo.ProperSO('"+cSOitem+"')"

PRIVATE cSO,nSO,cItem,nItem,crSOitem
crSOitem = ""

IF TYPE("pSOitem")="L"
	TrackError("No SOitem was sent to Proper_SO_Item (). ","Proc_ERP:Proper_SO_Item() has no Field","Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF
IF TYPE("pSOitem")="C"
	pSOitem= ALLTRIM(pSOitem)
	nSO = ABS(VAL( LEFT(pSOitem,7) ))
	cSO = STR( nSO, 7)
	IF '-' $ pSOitem
		nItem = ABS(VAL( RIGHT( ALLTRIM(pSOitem),2 ) ))
	ELSE
		nItem = 0
	ENDIF

	cItem = ALLTRIM( STR( nItem, 2) )
	IF nSO < 2
		crSOitem = '      0-00'
	ELSE
		IF nItem < 10
			cItem = '0'+cItem
		ENDIF
		crSOitem = cSO+"-"+cItem
	ENDIF
ELSE
	crSOitem = ""
ENDIF

RETURN crSOitem	
ENDPROC

*********************************	
PROC Proper_SO_Item_Item 
PARAMETER pSOitem
*nItem = Proper_SO_Item_Item(SOitem)

IF VARTYPE(pSOitem) != "C"
	cSOitem = ''
ELSE
	cSOitem = pSOitem
ENDIF

IF LEN(cSOitem) < 5
	RETURN 0
ENDIF
IF AT("-",cSOitem) = 0
	RETURN 0
ENDIF

PRIVATE nItemSO
nItemSO = PrepareSQLnum( RIGHT(cSOitem, 2),'ItemSO',2)

RETURN nItemSO	
ENDPROC

*********************************	
PROC Proper_SO_Item_SO 
PARAMETER pSOitem
*nSalesNum = Proper_SO_Item_SO(SOitem)
IF VARTYPE(pSOitem) != "C"
	cSOitem = ''
ELSE
	cSOitem = pSOitem
ENDIF
IF LEN(pSOitem) < 5
	RETURN 0
ENDIF
IF AT("-",cSOitem) = 0
	RETURN 0
ENDIF
PRIVATE nHpaSo
nHpaSo	= PrepareSQLnum( LEFT(cSOitem,7),'HPASO',7)

RETURN nHpaSo	
ENDPROC

*********************************	
PROC Proper_SO 
PARAMETER pSOitem
*Returns SO from SOitem or SO
*nSalesNum = Proper_SO(SOitem)
IF VARTYPE(pSOitem) != "C"
	cSOitem = ''
ELSE
	cSOitem = pSOitem
ENDIF
IF LEN(pSOitem) < 5
	RETURN 0
ENDIF
IF AT("-",cSOitem) = 0
	RETURN 0
ENDIF

PRIVATE nHpaSo
nHpaSo = 0
IF cSOitem == ''
	IF VARTYPE(pSOitem) = "N"
		nHpaSo	= PrepareSQLnum( pSOitem,'HPASO',7)
	ENDIF
ELSE
	nHpaSo	= PrepareSQLnum( LEFT(cSOitem,7),'HPASO',7)
ENDIF

RETURN nHpaSo	
ENDPROC

*********************************	
PROC Proper_SO_Item_SOItem
PARAMETER pSalesNum, pItem
*cSOitem = Proper_SO_Item_SOitem(SalesNum,Item)

IF VARTYPE(pSOitem) != "C"
	cSOitem = ''
ELSE
	cSOitem = pSOitem
ENDIF
IF LEN(pSOitem) < 5
	RETURN 0
ENDIF
IF AT("-",cSOitem) = 0
	RETURN 0
ENDIF
PRIVATE nHpaSo
nHpaSo	= PrepareSQLnum( LEFT(cSOitem,7),'HPASO',7)

RETURN nHpaSo	
ENDPROC

************************************
PROCEDURE Proper_InqNumP 
PARAMETER pInqNumP, pSalesP
*Proper_InqNumP(pInqNumP) OR Proper_InqNumP(InqNum,SalesP)

IF VARTYPE(pInqNumP) != "C"
	IF VARTYPE(pInqNumP) = "N" AND VARTYPE(pSalesP) = "C"
		*Sent AS Inqnum,SalesP
		pInqNumP = STR( pInqNumP, 8, 0)+LEFT(pSalesP,1)
		RETURN pInqNumP
	ENDIF
ENDIF

PRIVATE nInqNum, cInqNum, cSalesP, cInqNumP
cInqNum = SPACE(8)

IF VAL(pInqNumP) = 0
	cInqNumP = ""
ELSE
	*has a number

	pInqNumP = ALLTRIM(pInqNumP)
	nInqNum = VAL( pInqNumP ) 
	cInqNum = STR( nInqNum, 8, 0)
	
	IF VARTYPE(pSalesP) = "C"
		*must have sent SalesP
		cSalesP = RIGHT(pSalesP,1)
	ELSE
		cSalesP = RIGHT( pInqNumP,1 )
	ENDIF
	*IF VAL(cSalesP) > 0
	*	*SalesP 9 is Forging Manager
	*ENDIF
	IF LEN(cSalesP) = 0
		cInqNumP = ""
	ELSE
		cInqNumP = cInqNum + cSalesP 
	ENDIF
ENDIF

RETURN cInqNumP	
ENDPROC

************************************
PROCEDURE Proper_Form
PARAMETER pcForm
*Proper_Form(cForm)
*AllQuotes Allows Form '80'  Other tables only use Form '40'  Proper_Form converts form 80 'DISK' to Form 40 'PLATE'

PRIVATE cReturnForm
cReturnForm = ''

IF VARTYPE(pcForm)= "C"
	cReturnForm = pcForm
	IF pcForm = '80'
		cReturnForm = '40'
	ENDIF
ENDIF

RETURN LTRIM(cReturnForm)
ENDPROC

************************************
PROCEDURE Proper_Thk
PARAMETER pnNumberWithZero
*Proper_Thk(nSize)

*from Remove0.prg
*PARAMETER pnNumberWithZero,pnNumberLength,pnNumberDecimals,plForcePennies

PRIVATE cNumbasCharK,nLastDigits 
*, pnNumberWithZero,pnNumberLength,pnNumberDecimals
***remove0(nNumber_With_Zero,nLength,nDecimals,.F.)

IF VARTYPE(pnNumberWithZero) != "N" AND VARTYPE(pnNumberWithZero) != "Y"
	pnNumberWithZero = 0
ENDIF
PRIVAT pnNumberLength, pnNumberDecimals
pnNumberLength = 9
pnNumberDecimals = 3

PRIVATE nOrigDecimal
nOrigDecimal = SET('DECIMAL')

PRIVATE cReturnChar
cReturnChar = ''
cNumbasCharK = FLOOR(pnNumberWithZero*1000)
cNumbasChar = STR(pnNumberWithZero,pnNumberLength+pnNumberDecimals+1,pnNumberDecimals)

PRIVATE cOnlyWholeNum 
IF AT(".",cNumbasChar) = 0
	*cOnlyWholeNum = STR(pnNumberWithZero,pnNumberLength,0)
	cOnlyWholeNum = cNumbasChar 
ELSE
	cOnlyWholeNum = LEFT(cNumbasChar, AT(".",cNumbasChar)-1)
ENDIF

SET DECIMALS TO 0
nOnlyWholeNum = VAL(cOnlyWholeNum)

PRIVATE nNewDecimal,nNewDecimalasWhole,nTestDecimals 
*Have Decimals to deal with!
PRIVATE nDecimals,nLastDigit
SET DECIMALS TO (pnNumberDecimals)
cNumbasChar = STR(FLOOR(pnNumberWithZero*1000)/1000 ,9,3)

nDecimalasWhole = VAL(RIGHT(cNumbasChar,pnNumberDecimals))

IF RIGHT(cNumbasChar,1) != '0'
	*No Zero to remove
	cReturnChar = LTRIM(cNumbasChar)

ELSE	
	*Remove Zero
	nDecimals	= VAL(RIGHT(cNumbasChar,pnNumberDecimals))/10^pnNumberDecimals
	IF nDecimals < .1 
		IF nDecimals = 0
			*Drop the decimals
			*cReturnChar = ALLTRIM(cNumbasChar)
			cReturnChar = LTRIM(STR(nOnlyWholeNum,pnNumberLength,0))
		ELSE
			*First Decimal is 0, Consider all decimals significant up to 3 places.
			IF pnNumberDecimals <= 3
				cReturnChar = LTRIM(cNumbasChar)
				*cReturnChar = LTRIM(STR(nOnlyWholeNum,pnNumberLength,0))
			ELSE
				IF RIGHT(cNumbasChar,1) = '0'
					*Remove 0 till 3 decimal places.
					nTestDecimals = pnNumberDecimals
					DO WHILE nTestDecimals > 3
						nNewDecimalasWhole = nDecimalasWhole / 10
						nTestDecimals = nTestDecimals -1
						IF RIGHT(STR(nNewDecimalasWhole,nTestDecimals,0),1) != '0'
							EXIT
						ENDIF
						
					ENDDO
					SET DECIMALS TO nTestDecimals
					nNewDecimal = nNewDecimalasWhole/10^nTestDecimals
					cReturnChar = LTRIM(STR(nOnlyWholeNum+nNewDecimal,pnNumberLength+nTestDecimals+1,nTestDecimals ))
				ENDIF
			ENDIF
		ENDIF
	ELSE  &&nDecimals < .1
		*So Decimals are over  .0999999
		
		
		nNewDecimalasWhole = nDecimalasWhole
		FOR nTestDecimals = pnNumberDecimals TO 0 STEP -1
			
			IF RIGHT(STR(nNewDecimalasWhole,nTestDecimals,0),1) = '0'
				SET DECIMALS TO 0
				nNewDecimalasWhole = nNewDecimalasWhole / 10
			ELSE
				EXIT
			ENDIF
			IF nNewDecimalasWhole < 1
				EXIT
			ENDIF
		NEXT nTestDecimals 
		
		SET DECIMALS TO (nTestDecimals)
		nNewDecimal = nNewDecimalasWhole/ 10^nTestDecimals
		cReturnChar = LTRIM(STR(nOnlyWholeNum+nNewDecimal,pnNumberLength+nTestDecimals+1,nTestDecimals))
		
	ENDIF	&&nDecimals < .1
ENDIF	&&No Zero to remove

	

SET DECIMALS TO (nOrigDecimal)

RETURN LTRIM(cReturnChar)
ENDPROC

************************************

PROCEDURE Proper_Email  
PARAMETER pEmail
*checks Email address for @ and .
*Returns list if parsed with ;
cEmail = Proper_Email('David.Kirchner@SpaceAlloysUSA.com; DavidKirchner@yahoo.com')

PRIVATE cEmail
IF VARTYPE(pEmail) # "C"
	cEmail = ''
ELSE
	cEmail = pEmail
ENDIF

*Fill array to check individually
PRIVATE nCount, cEmailList, cReturnEmail
nCount = 0
cEmailList = ALLTRIM(cEmail)
cReturnEmail = ""
*DIMENSION aEmailList()

DO WHILE AT(";",cEmailList) > 0
	nCount = nCount + 1
	DIMENSION aEmail(nCount,2)
	aEmail(nCount,1) = LEFT(cEmailList,AT(";",cEmailList)-1)
	cEmailList = ALLTRIM(RIGHT(cEmailList,LEN(cEmailList)-LEN(aEmail(nCount,1))-2 ))
ENDDO

** check for last Email past last ";"
IF LEN(cEmailList) > 1 AND AT("@",cEmailList) > 0
	nCount = nCount + 1
	DIMENSION aEmail(nCount,2)
	aEmail(nCount,1) = cEmailList
	cEmailList = ''
ENDIF

IF nCount = 0
	nCount = 1
	DIMENSION aEmail(1,2)
	aEmail(1,1) = cEmail
ENDIF

PRIVATE nCurrCount, cEmailParts, nCountSaved
nCurrCount = 0
nCountSaved = 0
*Check
DO WHILE nCurrCount <= nCount 
	nCurrCount = nCurrCount + 1
	* Check Email
	IF AT("@",aEmail(nCurrCount,1)) > 0
		aEmail(nCurrCount,2) = .T.
		*cEmailParts = LEFT(aEmail(nCurrCount),AT("@",aEmail(nCurrCount)) )
		cEmailParts = RIGHT(aEmail(nCurrCount,1),LEN(aEmail(nCurrCount,1))-AT("@",aEmail(nCurrCount,1)) )
	ENDIF
	
	IF AT("@",cEmailParts) > 0
		*Found Second @ in cEmailParts
		aEmail(nCurrCount,2) = .F.
	ELSE
		IF AT(".",cEmailParts) > 0
			*Found period after @ in cEmailParts
			aEmail(nCurrCount,2) = .T.
		ELSE
			*Did not find period after @ in cEmailParts - no extension
			aEmail(nCurrCount,2) = .F.
		ENDIF
	ENDIF
	IF aEmail(nCurrCount,2)
		nCountSaved = nCountSaved + 1
		IF nCountSaved = 1
			cReturnEmail = aEmail(nCurrCount,1)
		ELSE
			cReturnEmail = cReturnEmail + "; " + aEmail(nCurrCount,1)
		ENDIF
	ENDIF
	IF nCurrCount = nCount 
		EXIT
	ENDIF
	LOOP
ENDDO



RETURN cReturnEmail 
ENDPROC

*********************************

PROCEDURE Proper_Heat_Lot_Machine
PARAMETERS pHT_Lot
*cMachInit = Proper_Heat_Lot_Machine('HPA R1234')

PRIVATE cMachineInit
cMachineInit = ''
*dbo.f_GetMachine_Log uses parameters like 'GFM' returns table name
*dbo.f_GetMachine_Table converts an Initial to a 20 char table name

IF VARTYPE(pHT_Lot) <> "C"
	RETURN cMachineInit
ELSE
	pHT_Lot = UPPER(ALLTRIM(pHT_Lot))
ENDIF

*remove HPA
IF pHT_Lot = "HPA "
	pHT_Lot = RIGHT(pHT_Lot,LEN(pHT_Lot)-4)
ENDIF
IF pHT_Lot = "HPA"
	pHT_Lot = RIGHT(pHT_Lot,LEN(pHT_Lot)-3)
ENDIF

PRIVATE cInit
cInit = LEFT(pHT_Lot,1) 
IF NOT ( ASC(cInit) > 64 AND ASC(cInit) < 91 )
	cInit = SUBSTR(pHT_Lot,2,1) 
	IF NOT ( ASC(cInit) > 64 AND ASC(cInit) < 91 )
		*Machine Init should have been first or second letter here
		RETURN cMachineInit
	ENDIF
ENDIF

*Check if cInit is real Proc_SQL:
IF LEN(GetMachine_Table(cInit)) < 1
	RETURN cMachineInit
ENDIF
cMachineInit = cInit

RETURN cMachineInit
ENDPROC


*********************************

PROCEDURE Proper_Heat_Lot_Lot
PARAMETERS pHT_Lot
*nLog = Proper_Heat_Lot_Lot('HPA W1002')
PRIVATE nLot
nLot = 0

IF VARTYPE(pHT_Lot) = "C"
	pHT_Lot = UPPER(ALLTRIM(pHT_Lot))
	*remove HPA
	IF pHT_Lot = "HPA "
		pHT_Lot = RIGHT(pHT_Lot,LEN(pHT_Lot)-4)
	ENDIF
	IF pHT_Lot = "HPA"
		pHT_Lot = RIGHT(pHT_Lot,LEN(pHT_Lot)-3)
	ENDIF
	
	*Must strip all character before the number to use VAL
	PRIVATE cString
	cString = LEFT(pHT_Lot,1)
	DO WHILE NOT ( ASC(cString) >= 48 AND ASC(cString) <57 ) AND LEN(pHT_Lot) > 2
		*number not found
		pHT_Lot = RIGHT(pHT_Lot, LEN(pHT_Lot)-1 )
		cString = LEFT(pHT_Lot,1)
	ENDDO
	
	pHT_Lot = VAL(pHT_Lot)
ENDIF

IF VARTYPE(pHT_Lot) <> "N"
	RETURN nLot
ENDIF

*Check number
nLot = pHT_Lot
IF nLot < 100
	RETURN 0
ENDIF
*Today 1/1/24 only have 5000 GFMlog records for past 25 years
IF nLot > 10000
	RETURN 0
ENDIF


RETURN nLot
ENDPROC


*********************************
* Tests if file with a given name is already in use
* Parameter should contain full path to the file
PROC isFileLocked 
LPARAMETERS tcFileName
LOCAL llLocked, liHandle

llLocked = .F.
IF FILE(tcFileName)
    * File exists, to try to open it
    liHandle = FOPEN(tcFileName, 2)
    IF liHandle = -1
        * File could not be opened
        llLocked = .T.
    ELSE
        * File can be opened exclusive
        FCLOSE(liHandle)
    ENDIF
ENDIF

RETURN llLocked
ENDPROC

*********************************
PROC ValPOitem 
PARAMETER pcPOitem

IF VARTYPE(pcPOitem) != "C"
	RETURN 0
ENDIF

PRIVATE cHPApo, cPOitem
cHPApo	= LEFT(pcPOitem,9)
cPOitem	= RIGHT(pcPOitem,2)
PRIVATE nValPOitem
nValPOitem = 0
nValPOitem = VAL(cHPApo)*100+VAL(cPOitem)

RETURN nValPOitem 
ENDPROC

*********************************
PROC RemoveNasties 
PARAMETER pSTR
*Remove Nasties
pSTR = ALLTRIM(pSTR)
PRIVATE NewSTR, mCurrChar, i
NewSTR = ''
FOR i = 1 TO LEN(pSTR)
	mCurrChar = SUBST( pSTR, i, 1)
	IF ASC(mCurrChar) > 0
		NewSTR = NewSTR + mCurrChar
	ENDIF
NEXT i
pSTR = NewSTR 
RETURN pSTR
ENDPROC

********************************* 
PROC CheckUPSroute 
PARAMETER pShipRoute

PRIVATE lCloseUpsShipRoute 
lCloseUpsShipRoute = .F.

IF !USED("UpsShipRoute")
	USE HPA!UpsShipRoute IN 0 SHARED NOUPDATE
	lCloseUpsShipRoute = .T.
ENDIF

SEEK pShipRoute IN UpsShipRoute ORDER ShipRoute
IF NOT FOUND("UpsShipRoute")
	MESSAGEBOX( "UPS GROUND          "+;
	  CHR(13)+"UPS GROUND COLLECT  "+;
	  CHR(13)+"UPS 3 DAY SELECT    " +;
	  CHR(13)+"UPS 3 DAY COLLECT   " +;
	  CHR(13)+"UPS 2ND DAY         " +;
	  CHR(13)+"UPS 2ND DAY COD     " +;
	  CHR(13)+"UPS 2ND DAY AM      " +;
	  CHR(13)+"UPS 2ND DAY AM COD  " +;
	  CHR(13)+"UPS 2ND DAY SATURDAY" +;
	  CHR(13)+"UPS NEXT DAY AIR    "+;
	  CHR(13)+"UPS NEXT DAY AIR COD"+;
	  CHR(13)+"UPS NEXT DAY AIR SAT"+;
	  CHR(13)+"UPS NEXT DAY SAT COD"+;
	  CHR(13)+"UPS NEXT DAY AIR AM "+;
	  CHR(13)+"UPS NEXT DAY SAVER  "+;
	  CHR(13)+"UPS NEXT DAY SAVER COD"+;
	  CHR(13)+"UPS NEXT DAY AM  "+;
	  CHR(13)+"UPS RED SAT AM "+;
	  CHR(13)+" - - - - - - - - - -"+;
	  CHR(13)+"UPS FREIGHT         "+;
	  CHR(13)+"UPS FREIGHT URGENT  "+;
	  CHR(13)+"UPS FREIGHT GUARANTE"+;
	  CHR(13)+" - - - - - - - - - -"+;
	  CHR(13)+"UPS WORDLWIDE EXPRES"+;
	  CHR(13)+"UPS WRLD EXPRESS NA1"+;
	  CHR(13)+"UPS WORLDWIDE EXPEDI";
	  +CHR(13)+"Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1);
	  ,0+32,"Retry using these, or do not start with UPS" )
	  
	IF lCloseUpsShipRoute
	  	USE IN UpsShipRoute
	ENDIF
	RETURN .F.
ENDIF

IF lCloseUpsShipRoute
  	USE IN UpsShipRoute
ENDIF

Return .T.
ENDPROC
********************************* 

PROCEDURE Chemistry1 
PARAMETER AL,B,C,Ca,Cd,Cl,Co,Cr,Cu,Fe,H,Hf,Mg,Mo,Mn
*,N,Na,Cb,Ni,O,P,Pb,Sn,S,Si,Ta,Ti,U,V,W,Y,Zr,NiandCo,CbandTa,Other

PRIVATE txt

txt = IIF(EMPTY(AL),"" ," Al: "+AL) +IIF(EMPTY(B),""," B: "+B) +IIF(EMPTY(C),""," C: "+C) +IIF(EMPTY(Ca),""," Ca: "+Ca) +IIF(EMPTY(Cd),"",  "Cd: "+Cd)+IIF(EMPTY(CL),""," Cl: "+CL)
txt = txt + IIF(EMPTY(Co),""," Co: "+Co)+IIF(EMPTY(Cr),""," Cr: "+Cr)+IIF(EMPTY(Cu),""," Cu: "+Cu)+IIF(EMPTY(Fe),""," Fe: "+Fe)+IIF(EMPTY(H),""," H: "+H)+IIF(EMPTY(Hf),""," Hf: "+Hf)
txt = txt + IIF(EMPTY(Mg),""," Mg: "+Mg)+IIF(EMPTY(Mo),""," Mo: "+Mo)+IIF(EMPTY(Mn),""," Mn: "+Mn)

return txt
ENDPROC
*********************************
PROCEDURE Chemistry2 
PARAMETER N,Na,Cb,Ni,O,P,Pb,Sn,S,Si,Ta,Ti,U,V,W,Y,Zr
PRIVATE txt

txt = IIF(EMPTY(N),""," N: "+N)+IIF(EMPTY(Na),""," Na: "+Na)+IIF(EMPTY(Cb),""," Cb: "+Cb)
txt = txt + IIF(EMPTY(Ni),""," Ni: "+Ni)+IIF(EMPTY(o),""," O: "+O)+IIF(EMPTY(P),""," P: "+P) +IIF(EMPTY(Pb),""," Pb:"+Pb)+IIF(EMPTY(Sn),""," Sn: "+Sn)+IIF(EMPTY(S),""," S: "+S)
txt = txt + IIF(EMPTY(Si),"" ," Si: "+Si) +IIF(EMPTY(Ta),""," Ta: "+Ta) +IIF(EMPTY(Ti),""," Ti: "+Ti) +IIF(EMPTY(U),""," U: "+U) +IIF(EMPTY(V),"",  "V: "+V)+IIF(EMPTY(W),""," W: "+W)
txt = txt + IIF(EMPTY(Y),"" ," Y: "+Y) +IIF(EMPTY(Zr),""," Zr: "+Zr)

RETURN txt
ENDPROC
*****************************************
PROCEDURE Chemistry3 
PARAMETER NiandCo,CbandTa,Other

PRIVATE txt

txt = IIF(EMPTY(NiandCo),""," Ni+Co: "+NiandCo) +IIF(EMPTY(CbandTa),""," Cb+Ta: "+CbandTa) +IIF(EMPTY(Other),"",  " "+Other)

RETURN txt
ENDPROC
*****************************************


PROC SQLTRAN 
PARAMETER pChar

IF VARTYPE(pCHAR) != "C"
	RETURN
ENDIF

PRIVATE cChar
cCHAR = STRTRAN( cChar ,"'","''")
cChar = ALLTRIM( cChar )

RETURN cChar
ENDPROC


**********************************

PROC getScanStandard 
PARAMETER pScan, nConn
*Wait Window getScanStandard("*PS29000")

PRIVATE cScanStandardResults, nScanOrderNum, nScanOrderItem
cScanStandardResults  = ''
nScanNum = 0
nScanOrderItem = 0

SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
SET PROCEDURE TO Progs\Proc_Setup ADDITIVE

PRIVATE nConn
IF VARTYPE(pConn) = "N"
	nConn = pConn
ELSE
	nConn = 0 
ENDIF
IF nConn < 1
	nConn = get_SQLSTRINGCONNECT() &&Proc_Setup:
	lCloseConn = .T.
ELSE
	lCloseConn = .F.
ENDIF
nConn = CheckSQLConnection(nConn) &&Proc_Setup:


IF VARTYPE(pScan) != "C"
	RETURN PADR("Error: No Char",20," ")
ENDIF

pScan= STRTRAN( pScan, '*', '')

PRIVATE cScanCode
cScanCode = UPPER(LEFT(pScan,2))

DO CASE
CASE cScanCode = "SO"
	cScanStandardResults = PADR("Sales Order Number",20," ")
	nScanNum	= VAL( SUBSTR(pScan,3,LEN(pScan)-2) )
	cScanStandardResults = cScanStandardResults + STR( nScanNum )
	
	Scan_Code_Limits(cScanCode,nScanNum,nScanOrderItem,nConn)
	
CASE cScanCode = "SI"
	cScanStandardResults = PADR("Sales Order Item",20," ")
	nScanNum	= VAL( SUBSTR(pScan,3,LEN(pScan)-2) )
	cScanStandardResults = cScanStandardResults + STR( nScanNum )
	nScanOrderItem = VAL( RIGHT(ALLTRIM(pScan),2) )
	
	Scan_Code_Limits(cScanCode,nScanNum,nScanOrderItem,nConn)
	
CASE cScanCode = "PO"
	cScanStandardResults = PADR("PurchaseOrder Number",20," ")
	nScanNum	= VAL( SUBSTR(pScan,3,LEN(pScan)-2) )
	cScanStandardResults = cScanStandardResults + STR( nScanNum )
	
	Scan_Code_Limits(cScanCode,nScanNum,nScanOrderItem,nConn)
	
CASE cScanCode = "PI"
	cScanStandardResults = PADR("Purchase Order Item",20," ")
	nScanNum	= VAL( SUBSTR(pScan,3,LEN(pScan)-2) )
	cScanStandardResults = cScanStandardResults + STR( nScanNum )
	nScanOrderItem = VAL( RIGHT(ALLTRIM(pScan),2) )
	
	Scan_Code_Limits(cScanCode,nScanNum,nScanOrderItem,nConn)
	
CASE cScanCode = "EM"
	cScanStandardResults = PADR("Employee",20," ")
	nScanNum	= VAL( SUBSTR(pScan,3,LEN(pScan)-2) )
	cScanStandardResults = cScanStandardResults + STR( nScanNum )
	
	Scan_Code_Limits(cScanCode,nScanNum,nScanOrderItem,nConn)
	
CASE cScanCode = "PR"
	cScanStandardResults = PADR("Process",20," ")
	nScanNum	= VAL( SUBSTR(pScan,3,LEN(pScan)-2) )
	cScanStandardResults = cScanStandardResults + STR( nScanNum )

	Scan_Code_Limits(cScanCode,nScanNum,nScanOrderItem,nConn)
	
*Name change, (PU) PickUpDate is never scanned but computed as gone from ReadyShipOut RSU
*CASE cScanCode = "PS"
*	cScanStandardResults = PADR("PackingSlip PU",20," ")
*	cScanStandardResults = cScanStandardResults + STR( VAL( SUBSTR(pScan,3,LEN(pScan)-2) ) )

CASE cScanCode = "PS"
	cScanStandardResults = PADR("PackingSlip RSO",20," ")
	nScanNum	= VAL( SUBSTR(pScan,3,LEN(pScan)-2) )
	cScanStandardResults = cScanStandardResults + STR( nScanNum )
	
	Scan_Code_Limits(cScanCode,nScanNum,nScanOrderItem,nConn)
	
CASE cScanCode = "WO"
CASE cScanCode = "WD"

CASE cScanCode = "RR"
CASE cScanCode = "RD"

*GFMlog GL, HeatTreat HL, LakeErie LL, Roll RL, Swage SL, UT UL, Wire WL
OTHERWISE
	
	IF VAL( pScan ) > 0
		cScanStandardResults = PADR("Char.Stand.not found",20," ")
		cScanStandardResults = cScanStandardResults + STR( VAL( SUBSTR(pScan,3,LEN(pScan)-2) ) )
	
	ELSE
		cScanStandardResults  = PADR("Error: No Number",20," ")
		RETURN cScanStandardResults
	ENDIF
ENDCASE

IF lCloseConn 
	IF nConn > 0
		= SQLDISCONNECT(nConn)
	ENDIF
ENDIF

RETURN cScanStandardResults 
ENDPROC


**********************************
PROC getScannedInt 
PARAMETER pScan
*getScannedInt('1234567890123456789 123456')

*Should include the first 20 Characters, then number
PRIVATE nScanInt
nScanInt= 0

IF VARTYPE(pScan) != "C"
	*Error
	RETURN nScanInt
ENDIF

IF LEN(pScan)>21		
	PRIVATE nSetDecimal
	nSetDecimal =  SET("Decimals")
	SET DECIMALS TO 0
			
	nScanInt = VAL(SUBSTR(pScan,21,LEN(pScan)-20)) 

	IF nSetDecimal > 0
		SET DECIMALS TO (nSetDecimal)
	ENDIF
ENDIF

RETURN nScanInt
ENDPROC

**********************************
PROC getScannedText 
PARAMETER pScan
*getScannedText('1234567890123456789 123456')

*Should include the first 20 Characters, then number
PRIVATE cScanText
cScanText = ''

IF VARTYPE(pScan) != "C"
	*Error
	RETURN cScanText
ENDIF

IF LEN(pScan)>21
	cScanText = SUBSTR(pScan,21,LEN(pScan)-20)
ENDIF

RETURN cScanText 
ENDPROC

*****************************************
PROC getScannedItem 
PARAMETER pScan
* getScannedItem('1234567890123456789 4321-33')

*Should include the first 20 Characters, then number
PRIVATE cScanItem, cNumber
cScanItem = '0-00'

IF VARTYPE(pScan) != "C"
	*Error
	RETURN nScanItem
ENDIF

PRIVATE nSetDecimal
nSetDecimal =  SET("Decimals")

cNumber = SUBSTR(pScan,21,LEN(pScan)-20)

IF AT('-',cNumber)>0
	SET DECIMALS TO 0
	nNumber = VAL(cNumber) 
	nItem = VAL( RIGHT(cNumber,LEN(cNumber)-AT('-',cNumber)) )
	cScanItem = STR(nNumber)+"-"+STR(nItem,2,0)
ELSE
	IF AT(pScan,'.')>0
		SET DECIMALS TO 2
		nScanItem = VAL(cNumber) 
	ENDIF
ENDIF

*IF nSetDecimal > 0
	SET DECIMALS TO (nSetDecimal)
*ENDIF
RETURN cScanItem
ENDPROC


*****************************************************
PROCEDURE SetPrinterforPDF 
*SetPrinterforPDF() returns True or False

PRIVATE lFounddoPDF, lFoundPrinter, nPrinters
lFounddoPDF = .F.
lFoundPrinter = .F.
*MAKE SURE PDFFactory2FileIS known as a PRINTER
nPrinters=APRINTERS(aaprinters)
FOR CT = 1 TO nPrinters

	IF UPPER(aaprinters(CT,1))="DOPDF V6"
		lFounddoPDF  = .T.
		lFoundPrinter = .T.
		EXIT
	ENDIF
NEXT CT

IF lFoundPrinter 
*	IF lFounddoPDF  
		SET PRINTER TO NAME 'doPDF v6'
*	ENDIF
ELSE
	TrackError("No PDF printer found! Install doPDF.","No PDF printer found","Proc_ERP:"+PROGRAM()+" @"+PROGRAM(1),LINENO())
ENDIF

RETURN lFoundPrinter 
ENDPROC

**********************************

PROC getCertMachineInitial
PARAMETER nMachineNo
*Wait Window getCertMachineInitial(2)

PRIVATE cMachineInit
cMachineInit = ''

IF VARTYPE(nMachineNo) != "N"
	*Runs from a printed report, just ignore here.
	*TrackError("getCertMachineInitial - nMachine number not a number","getCertMachineInitial Failed","Proc_ERP:"+PROGRAM()+" @"+PROGRAM(1),LINENO())
	RETURN ''
ENDIF

DO CASE
CASE nMachineNo=1
CASE nMachineNo=2
	*GFM
	cMachineInit = 'G'
CASE nMachineNo=3
	*Roll
	cMachineInit = 'R'
CASE nMachineNo=4 
	*LakeErie
	cMachineInit = 'L'
CASE nMachineNo=5 
	*Wire
	cMachineInit = 'W'
CASE nMachineNo=6 
	*Swage
	cMachineInit = 'S'
CASE nMachineNo=7 
	*Draw Bench
	cMachineInit = 'D'
CASE nMachineNo=8 
	cMachineInit = ''
CASE nMachineNo=9 
	cMachineInit = ''
ENDCASE

RETURN cMachineInit 
ENDPROC



********************************************************
PROCEDURE EmailFileName 
PARAMETERS cName

*cFileName = EmailFileName("Report.PDF")
*Returns a file address with Database Server location.
*user does not have delete Permission but SQL Email does.  
*Do not use if you need to Rename or Delete
*Use local \MEM if you need to Rename or Delete. 

PRIVATE cReturnFileName
cReturnFileName = ""

PRIVATE lFoundHPASetup
lFoundHPASetup = .F.

PRIVATE cHomeSalesp
cHomeSalesp = ''

IF TYPE("m.salesp") !="C"
	IF FILE(SYS(5)+SYS(2003)+"\SalesP.MEM")
		RESTORE FROM (SYS(5)+SYS(2003)+"\SalesP.MEM") ADDITIVE
		cHomeSalesp = ALLTRIM(m.Salesp)
		*MESSAGEBOX("Using SalesP:"+cHomeSalesp+CHR(13)+"Proc_ERP:"+PROGRAM(),64,"cHomeSalesP")
	ELSE
		IF FILE(SYS(5)+SYS(2003)+"\MEM\SalesP.MEM")
			RESTORE FROM (SYS(5)+SYS(2003)+"MEM\SalesP.MEM") ADDITIVE
			cHomeSalesp = ALLTRIM(m.Salesp)
		ENDIF
	ENDIF
ELSE
	cHomeSalesp = ALLTRIM(m.Salesp)
ENDIF
IF EMPTY("cHomeSalesp")
	cHomeSalesp = "A"
	WAIT WINDOW "Enter the your SalesP initial." TO cHomeSalesp
	RecordTest("Record Test Data.","Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No SalesP initial. Now set to: '"+cHomeSalesp+"'." )
ENDIF

SET PROCEDURE TO Progs\Proc_Setup ADDITIVE
cReturnFileName = get_SQL_SendPDF_Path()+cHomeSalesp+"\"
*--"\SendPDF\"+cHomeSalesp+"\"

IF EMPTY(cHomeSalesp)
	MESSAGEBOX("Bad SalesP Home!"+CHR(13)+"Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),16,"EmailFileName")
	TrackError("Send Email Error","Bad SalesP Home!","Proc_ERP:"+PROGRAM()+" @"+PROGRAM(1),LINENO())
ENDIF
IF EMPTY(cReturnFileName)
	MESSAGEBOX("File Name on Server Failed!"+CHR(13)+"Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),16,"EmailFileName")
	TrackError("Send Email Error","File Name on Server Failed!"+CHR(13)+"cReturnFileName ","Proc_ERP:"+PROGRAM()+" @"+PROGRAM(1),LINENO())
ENDIF


IF VARTYPE(cName) = "C"
	IF LEN(cName) > 0
		cReturnFileName = cReturnFileName+cName
	ELSE
		cReturnFileName = cReturnFileName+"TempFile"
	ENDIF
ELSE
	cReturnFileName = cReturnFileName+"TempFile"
ENDIF

RETURN cReturnFileName
ENDPROC


********************************************************
PROCEDURE AddMonths 
PARAMETERS nJan,nFeb,nMar,nApr,nMay,nJun,nJul,nAug,nSep,nOct,nNov,nDec
*AddMonths(nJan,nFeb,nMar,nApr,nMay,nJun,nJul,nAug,nSep,nOct,nNov,nDec)

PRIVATE nReturn
nReturn = 0

nReturn = nReturn + IIF(ISNULL(nJan),0,nJan)
nReturn = nReturn + IIF(ISNULL(nFeb),0,nFeb)
nReturn = nReturn + IIF(ISNULL(nMar),0,nMar)
nReturn = nReturn + IIF(ISNULL(nApr),0,nApr)
nReturn = nReturn + IIF(ISNULL(nMay),0,nMay)
nReturn = nReturn + IIF(ISNULL(nJun),0,nJun)
nReturn = nReturn + IIF(ISNULL(nJul),0,nJul)
nReturn = nReturn + IIF(ISNULL(nAug),0,nAug)
nReturn = nReturn + IIF(ISNULL(nSep),0,nSep)
nReturn = nReturn + IIF(ISNULL(nOct),0,nOct)
nReturn = nReturn + IIF(ISNULL(nNov),0,nNov)
nReturn = nReturn + IIF(ISNULL(nDec),0,nDec)

RETURN nReturn
ENDPROC

********************************************************
PROCEDURE LinesToPrint 
PARAMETERS pString, pCharacters

PRIVATE cString, nCharacters
IF VARTYPE(pString) = 'N'
	cString = STR(pString)
ENDIF
IF VARTYPE(pString) != 'C'
	cString = ''
ELSE
	cString = pString
ENDIF
IF VARTYPE(pCharacters) = 'C'
	nCharacters = VAL(pCharacters)
ENDIF
IF VARTYPE(pCharacters) != 'N'
	nCharacters = 10
ELSE
	nCharacters = pCharacters 
ENDIF

cString = RTRIM(cString)

PRIVATE nReturnLine
nReturnLine = 0

*IF LEN(cString) < nCharacters
*	RETURN 1
*ENDIF

PRIVATE nLineFeed, nCharReturn 
nLineFeed  = 0
nCharReturn = 0

DO WHILE LEN(cString) > 0
	*Get Temp
	cTempHold = LEFT( cString, nCharacters )


	*REMOVE dangeling line feeds and returns.	
	DO WHILE ASC(RIGHT(cString,1))=10 OR ASC(RIGHT(cString,1))=13
		IF ASC(RIGHT(cString,1))=10
			cString = LEFT(cString,LEN(cString)-1)
		ENDIF
		IF ASC(RIGHT(cString,1))=13
			cString = LEFT(cString,LEN(cString)-1)
		ENDIF
	ENDDO
	
	*Count all line feeds
	nLineFeed = OCCURS( CHR(10), cTempHold )
	IF nLineFeed > 0 
		cTempHold = LEFT( cTempHold, ATC( CHR(10),cTempHold  ))
	ENDIF
	nCharReturn = OCCURS( CHR(13), cTempHold )
	IF nCharReturn > 0 
		cTempHold = LEFT( cTempHold, ATC( CHR(13),cTempHold  ))
	ENDIF
	
	nReturnLine = nReturnLine + 1
	
	cString = RIGHT( cString, LEN(cString) - LEN(cTempHold) )
	IF LEFT(cString,1) = CHR(10)
		cString = RIGHT( cString, LEN(cString) - 1 )
	ENDIF
	IF LEFT(cString,1) = CHR(13)
		cString = RIGHT( cString, LEN(cString) - 1 )
	ENDIF
	
	
ENDDO


RETURN nReturnLine
ENDPROC

********************************************************

PROCEDURE HPA_HTML_Header 

PRIVATE m.MsgHeader
m.MsgHeader = ''
m.MsgHeader = m.MsgHeader +"<!DOCTYPE html> " &&Proc_SQL:Send_HTML_Email is simulair
m.MsgHeader = m.MsgHeader +"<html>"
m.MsgHeader = m.MsgHeader +"<head>"
m.MsgHeader = m.MsgHeader +"<title>HPA Report</title>"
m.MsgHeader = m.MsgHeader +[<style type="text/css">]
m.MsgHeader = m.MsgHeader +[.styleRightAlign{text-align: right;}]
*m.MsgHeader = m.MsgHeader +[.styleTableHeadersRow{background-color: #4D5079;color: #FFFFFF;}]
m.MsgHeader = m.MsgHeader +".styleTableHeadersRow{background-color: #D1EAF1;color: #000000;}"
m.MsgHeader = m.MsgHeader +[.styleTextAlignCenter{text-align: center;}]
m.MsgHeader = m.MsgHeader +"</style>"
m.MsgHeader = m.MsgHeader +"</head>"
m.MsgHeader = m.MsgHeader +"<body>"
m.MsgHeader = m.MsgHeader +"<header>"
m.MsgHeader = m.MsgHeader +[<table style="border: thin none #000000; width: 480pt; ">]
m.MsgHeader = m.MsgHeader +"<tr>"
m.MsgHeader = m.MsgHeader +[<td style="width: 165pt; vertical-align: top;">]
m.MsgHeader = m.MsgHeader +[<img alt="Space Alloys USA Logo"]
m.MsgHeader = m.MsgHeader +[src="https://images.SpaceAlloysUSA.com/v1/images/HPALogo.png" height="69"/>]
m.MsgHeader = m.MsgHeader +[</td>]

m.MsgHeader = m.MsgHeader +[<td style="width: 192pt; vertical-align: top;">]
*m.MsgHeader = m.MsgHeader +[<h1>]+[PackingSlip</h1>]
m.MsgHeader = m.MsgHeader +[</td>]
m.MsgHeader = m.MsgHeader +[<td style="width: 123pt; text-align: left; vertical-align: top;">]
m.MsgHeader = m.MsgHeader +[<strong> Date</strong> ]+DTOC(DATE())+[<br />]
*m.MsgHeader = m.MsgHeader +[<strong>]+ALLTRIM(cInqnumP)+[</strong>]
m.MsgHeader = m.MsgHeader +[</td>]	

m.MsgHeader = m.MsgHeader +[</tr>]
m.MsgHeader = m.MsgHeader +[</table>]
m.MsgHeader = m.MsgHeader +[</header>]
m.MsgHeader = m.MsgHeader +[<br />]
m.MsgHeader = m.MsgHeader +[<br />]
m.MsgHeader = m.MsgHeader +[<table style="border: thin none #000000; width: 480pt; ">]
m.MsgHeader = m.MsgHeader +[<tr>]
m.MsgHeader = m.MsgHeader +[<td style="width: 32pt; vertical-align: top;"></td>]
m.MsgHeader = m.MsgHeader +[<td style="width: 54pt; vertical-align: top;">]
*m.MsgHeader = m.MsgHeader +[<strong>Ship To:</strong>]
m.MsgHeader = m.MsgHeader +[</td>]
m.MsgHeader = m.MsgHeader +[<td style="width: 150pt; vertical-align: top;">]
*m.MsgHeader = m.MsgHeader +PrepareSQLtxt(cName,'Name',100)+[<br />]
*m.MsgHeader = m.MsgHeader +PrepareSQLtxt(cCompany,'Company',100)+[<br />]

*m.MsgHeader = m.MsgHeader +PrepareSQLtxt(cAddr1,'Addr1',100)+[<br />]
*IF NOT EMPTY(cAddr2)
*	m.MsgHeader = m.MsgHeader +PrepareSQLtxt(cAddr2,'Addr2',100)+[<br />]
*ENDIF
*m.MsgHeader = m.MsgHeader +PrepareSQLtxt(cCityST,'CityST',100)+[<br />]

*m.MsgHeader = m.MsgHeader +PrepareSQLtxt(cEmail,'email',60)+[<br />]
*IF NOT EMPTY(cPhone)
*	m.MsgHeader = m.MsgHeader +[P ]+PrepareSQLtxt(cPhone ,'Phone ',50)+[<br />]
*ENDIF
*IF NOT EMPTY(cFax)
*	m.MsgHeader = m.MsgHeader +[F ]+PrepareSQLtxt(cFax,'Fax',12)
*ENDIF
m.MsgHeader = m.MsgHeader +[</td>]
m.MsgHeader = m.MsgHeader +[<td style="width: 72pt; text-align: left; vertical-align: top;">]
*m.MsgHeader = m.MsgHeader +[<strong>Sales Rep:</strong>]
m.MsgHeader = m.MsgHeader +[</td>]
m.MsgHeader = m.MsgHeader +[<td style="width: 150pt; vertical-align: top;">]
*m.MsgHeader = m.MsgHeader +ALLTRIM(cSalesRep)+[<br />]
m.MsgHeader = m.MsgHeader +[Space Alloys USA Inc.<br />]
m.MsgHeader = m.MsgHeader +[<br />]
m.MsgHeader = m.MsgHeader +[<br />]
m.MsgHeader = m.MsgHeader +[United States of America<br />]
m.MsgHeader = m.MsgHeader +[P 800-472-5569<br />]
m.MsgHeader = m.MsgHeader +[P 765-945-8230<br />]
m.MsgHeader = m.MsgHeader +[F 765-945-8294]
m.MsgHeader = m.MsgHeader +[</td>]
m.MsgHeader = m.MsgHeader +[</tr>]
m.MsgHeader = m.MsgHeader +[</table>]
m.MsgHeader = m.MsgHeader +[<br />]
m.MsgHeader = m.MsgHeader +[<br />]

RETURN m.MsgHeader
ENDPROC

****************************************************
PROCEDURE HPA_HTML_Footer

PRIVATE m.MsgFooter
m.MsgFooter = ""
*Proc_SQL:Send_HTML_Email is simulair

m.MsgFooter = m.MsgFooter +[<footer>]
m.MsgFooter = m.MsgFooter +[<div id="Div12" style="bottom:0; height: 12pt; width: 450pt; margin-left: 15pt;">]
m.MsgFooter = m.MsgFooter +[<table style="border: thin none #000000; width: 450pt;">]
m.MsgFooter = m.MsgFooter +[<tr>]
m.MsgFooter = m.MsgFooter +[<td class="styleTextAlignCenter" colspan="3">]
m.MsgFooter = m.MsgFooter +[<hr />]
m.MsgFooter = m.MsgFooter +[</td>]
m.MsgFooter = m.MsgFooter +[</tr>]
m.MsgFooter = m.MsgFooter +[<tr>]
m.MsgFooter = m.MsgFooter +[<td style="width: 138pt; vertical-align: top; text-align: center;">]
m.MsgFooter = m.MsgFooter +[Windfall Production Center<br />]
m.MsgFooter = m.MsgFooter +[</td>]
m.MsgFooter = m.MsgFooter +[<td style="width: 126pt; vertical-align: top; text-align: center;">]
m.MsgFooter = m.MsgFooter +[Tipton Production Center<br />]
m.MsgFooter = m.MsgFooter +[</td>]
m.MsgFooter = m.MsgFooter +[</tr>]

m.MsgFooter = m.MsgFooter +[</table>]
m.MsgFooter = m.MsgFooter +[</div>]

m.MsgFooter = m.MsgFooter +[</footer>]

RETURN m.MsgFooter
ENDPROC

*& = CHR(38)

********************************************************
*PRIVATE loHyperlink,m.cHyperLink
*m.cHyperLink = HTML_SOitem(cSOitem,.T.) &&lReturnURL --not URL is an HTML code.
*loHyperlink = CREATEOBJECT("Hyperlink")
*loHyperlink.navigateto(m.cHyperLink)
*RELEASE loHyperlink
*MESSAGEBOX("Look for Open Web Browser for this Report",0,"Report Complete")
*Font ForeColor = 0,0,255

*depricated CREATEOBJECT("internetexplorer.application")
********************************************************
PROCEDURE HTML_SOitem 
PARAMETERS pSOitem, pReturnURL

*m.cHyperLink = HTML_SOitem(cSOitem,lReturnURL)

PRIVATE cReturnString
cReturnString = ""

IF VARTYPE(pSOitem) != "C"
	RETURN " "
ENDIF

PRIVATE cSOitem
cSOitem = PrepareSQLtxt(pSOitem,'SOitem',10)

IF Proper_SO_item(cSOitem) = Proper_SO_item("")
	RETURN " "
ENDIF

PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF

IF cSOitem = Proper_SO_Item('   0-00')
	*Not a SOitem, Probably "Stock"
	IF lReturnURL 
		cReturnString = ''
	ELSE
		cReturnString = cSOitem
	ENDIF
ELSE
	IF lReturnURL 
*		cReturnString = get_Report_Server()+"%2fHPA+Sales+Reports%2fSalesOrder+SOitem"+CHR(38)+"rs:Command=Render"+CHR(38)+"cSOitem="
*https://PEREGRINE/ReportServer/Pages/ReportViewer.aspx?/HPA+Sales+Reports/SalesOrder+SOitem&rs:Command=Render&cSOitem=+111029-01
		cReturnString = get_Report_Server()+[%2fHPA+Sales+Reports%2fSalesOrder+SOitem&rs:Command=Render]+"&"+[cSOitem=]
		cReturnString = cReturnString + STRTRAN(cSOitem," ","+")
*%2fHPA+Sales+Reports%2fSalesOrder+SOitem&rs:Command=Render%20111029-01=+111029-01
*%2fHPA+Sales+Reports%2fSalesOrder+SOitem&rs:Command=Render&cSOitem=+111029-01
	ELSE
		*Return HTML Code
		cReturnString = [<a href=]+get_Report_Server()+[%2fHPA+Sales+Reports%2fSalesOrder+SOitem&rs:Command=Render]+"&"+[cSOitem=]
		cReturnString = cReturnString + STRTRAN(cSOitem," ","+")
		cReturnString = cReturnString + [>]+cSOitem+"</a>"+"<br />"
	ENDIF
ENDIF

RETURN cReturnString
ENDPROC


********************************************************
PROCEDURE HTML_SO 
PARAMETERS pSO, pReturnURL
*m.cHyperLink = HTML_SO(nSalesNum,.T.)

PRIVATE cReturnString
cReturnString = ""

IF VARTYPE(pSO) != "N"
	RETURN " "
ENDIF

**
PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF

IF lReturnURL 
	cReturnString = get_Report_Server()+[%2fHPA+Sales+Reports%2fSalesOrders&rs:Command=Render]+"&"+[soNum=]
	cReturnString = cReturnString + ALLTRIM(STR(pSO))
ELSE
	*Return HTML Code
	cReturnString = [<a href=]+get_Report_Server()+[%2fHPA+Sales+Reports%2fSalesOrders&rs:Command=Render]+"&"+[soNum=]
	cReturnString = cReturnString + ALLTRIM(STR(pSO))
	cReturnString = cReturnString + [>]+ALLTRIM(STR(pSO))+"</a>"+"<br />"
ENDIF

RETURN cReturnString
ENDPROC


********************************************************
PROCEDURE HTML_SO_Status 
PARAMETERS pSO, pReturnURL
*m.cHyperLink = HTML_SO_Status (nSalesNum,.T.)

PRIVATE cReturnString
cReturnString = ""

IF VARTYPE(pSO) != "N"
	RETURN " "
ENDIF

**
PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF

IF lReturnURL 
	cReturnString = get_Report_Server()+[%2fHPA+Sales+Reports%2fSalesNum+Status&rs:Command=Render]+"&"+[SalesNum=]
	cReturnString = cReturnString + ALLTRIM(STR(pSO))
ELSE
	*Return HTML Code
	cReturnString = [<a href=]+get_Report_Server()+[%2fHPA+Sales+Reports%2fSalesNum+Status&rs:Command=Render]+"&"+[SalesNum=]
	cReturnString = cReturnString + ALLTRIM(STR(pSO))
	cReturnString = cReturnString + [>]+ALLTRIM(STR(pSO))+"</a>"+"<br />"
ENDIF

RETURN cReturnString
ENDPROC


******************************************************** 
PROCEDURE HTML_POitem 
PARAMETERS pPOitem, pReturnURL

*m.cHyperLink = HTML_POitem(pPOitem,pReturnURL)

PRIVATE cReturnString
cReturnString = ""

IF VARTYPE(pPOitem) != "C"
	RETURN ""
ENDIF
PRIVATE cPOitem
cPOitem = PrepareSQLtxt(pPOitem,'POitem',12)

IF Proper_PO_item(cPOitem) = Proper_PO_item("")
	RETURN " "
ENDIF

PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF

IF lReturnURL 
	cReturnString = get_Report_Server()+[%2fHPA+Purchasing+Reports%2fPurchaseOrders+POitem&rs:Command=Render]+"&"+[cHPAPOItem=]
	cReturnString = cReturnString + STRTRAN(cPOitem," ","+")
ELSE
	*Return HTML Code
	cReturnString = [<a href=]+get_Report_Server()+[%2fHPA+Purchasing+Reports%2fPurchaseOrders+POitem&rs:Command=Render]+"&"+[cHPAPOItem=]
	cReturnString = cReturnString + STRTRAN(cPOitem," ","+")
	cReturnString = cReturnString + [>]+ALLTRIM(cPOitem)+"</a>"+"<br />"
ENDIF

RETURN cReturnString
ENDPROC


******************************************************** 
PROCEDURE HTML_PO 
PARAMETERS pPO, pReturnURL

*m.cHyperLink = HTML_PO(nHPApo,.F.)

PRIVATE cReturnString
cReturnString = ""

IF VARTYPE(pPO) != "N"
	RETURN " "
ENDIF

PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF

IF lReturnURL 
	cReturnString = get_Report_Server()+[%2fHPA+Purchasing+Reports%2fPurchaseOrders&rs:Command=Render]+"&"+[hpapo=]
	cReturnString = cReturnString + ALLTRIM(STR(pPO))
ELSE
	*Return HTML Code
	cReturnString = [<a href=]+get_Report_Server()+[%2fHPA+Purchasing+Reports%2fPurchaseOrders&rs:Command=Render]+"&"+[hpapo=]
	cReturnString = cReturnString + ALLTRIM(STR(pPO))
	cReturnString = cReturnString + [>]+ALLTRIM(STR(pPO))+"</a>"+"<br />"
ENDIF

RETURN cReturnString
ENDPROC

********************************************************
PROCEDURE HTML_RMA_No 
PARAMETERS pRMA_No, pReturnURL
*m.cHyperLink = HTML_RMA_No(nRMA_No,.F.)

PRIVATE cReturnString
cReturnString = ""

PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF

IF VARTYPE(pRMA_no) != "N"
	IF lReturnURL 
		RETURN " "
	ELSE
		*RETURN "<> </>"
		RETURN " "
	ENDIF
ENDIF

IF lReturnURL 
	cReturnString = get_Report_Server()+[%2fReceiving%2fRMA_No&rs:Command=Render]+"&"+[nRMA_No=]
	cReturnString = cReturnString + ALLTRIM(STR(pRMA_no))
ELSE
*!*		*Return HTML Code
	cReturnString = [<a href=]+get_Report_Server()+[%2fReceiving%2fRMA_No&rs:Command=Render]+"&"+[nRMA_No=]
	cReturnString = cReturnString + ALLTRIM(STR(pRMA_No))
	cReturnString = cReturnString + [>]+ALLTRIM(STR(pRMA_No))+"</a>"+"<br />"
ENDIF

RETURN cReturnString
ENDPROC

********************************************************
PROCEDURE HTML_RMA_Detail 
PARAMETERS pRMA_Detail, pReturnURL
*m.cHyperLink = HTML_RMA_Detail(nRMA_Detail,.F.)

PRIVATE cReturnString
cReturnString = ""

PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF

IF VARTYPE(pRMA_Detail) != "N"
	IF lReturnURL 
		RETURN " "
	ELSE
		*RETURN "<> </>"
		RETURN " "
	ENDIF
ENDIF

*!*	IF lReturnURL 
*!*		cReturnString = get_Report_Server()+[%2fWorkOrder%2fWorkOrder&rs:Command=Render]+"&"+[RMA_Detail=]
*!*		cReturnString = cReturnString + ALLTRIM(STR(pRMA_Detail))
*!*	ELSE
*!*		*Return HTML Code
*!*		cReturnString = [<a href=]+get_Report_Server()+[%2fWorkOrder%2fWorkOrder&rs:Command=Render]+"&"+[RMA_Detail=]
*!*		cReturnString = cReturnString + ALLTRIM(STR(pRMA_Detail))
*!*		cReturnString = cReturnString + [>]+ALLTRIM(STR(pRMA_Detail))+"</a>"+"<br />"
*!*	ENDIF

RETURN cReturnString
ENDPROC

********************************************************
PROCEDURE HTML_Rack_Location
PARAMETERS cLocation, pReturnURL
*m.cHyperLink = HTML_Rack_Location(cLocation,.F.)

PRIVATE cReturnString
cReturnString = ""

PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF

IF VARTYPE(cLocation) != "C"
	IF lReturnURL 
		RETURN " "
	ELSE
		*RETURN "<> </>"
		RETURN " "
	ENDIF
ENDIF

IF lReturnURL 
	cReturnString = get_Report_Server()+[%2fInventory%2fRack%2fLocation%20Detail&rs:Command=Render]+"&"+[Location=]
	cReturnString = cReturnString + ALLTRIM(cLocation)
ELSE
	*Return HTML Code
	cReturnString = [<a href=]+get_Report_Server()+[%2fInventory%2fRack%2fLocation%20Detail&rs:Command=Render]+"&"+[Location=]
	cReturnString = cReturnString + ALLTRIM(cLocation)
	cReturnString = cReturnString + [>]+ALLTRIM(cLocation)+"</a>"+"<br />"
ENDIF

RETURN cReturnString
ENDPROC

********************************************************
PROCEDURE HTML_WO 
PARAMETERS pWO, pReturnURL
*m.cHyperLink = HTML_WO(nWO,.F.)

PRIVATE cReturnString
cReturnString = ""

PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF

IF VARTYPE(pWO) != "N"
	IF lReturnURL 
		RETURN " "
	ELSE
		*RETURN "<> </>"
		RETURN " "
	ENDIF
ENDIF

IF lReturnURL 
	cReturnString = get_Report_Server()+[%2fWorkOrder%2fWorkOrder&rs:Command=Render]+"&"+[WO=]
	cReturnString = cReturnString + ALLTRIM(STR(pWO))
ELSE
	*Return HTML Code
	cReturnString = [<a href=]+get_Report_Server()+[%2fWorkOrder%2fWorkOrder&rs:Command=Render]+"&"+[WO=]
	cReturnString = cReturnString + ALLTRIM(STR(pWO))
	cReturnString = cReturnString + [>]+ALLTRIM(STR(pWO))+"</a>"+"<br />"
ENDIF

RETURN cReturnString
ENDPROC

******************************************************** 
PROCEDURE HTML_WO_Detail 
PARAMETERS pWO_Detail, pReturnURL

*m.cHyperLink = HTML_WO_Detail(pWO_Detail,.T.)

PRIVATE cReturnString
cReturnString = ""

IF VARTYPE(pWO_Detail) != "N"
	RETURN " "
ENDIF 7

PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF

IF lReturnURL 
	cReturnString = get_Report_Server()+[%2fWorkOrder%2fWorkOrder+WOD&rs:Command=Render]+"&"+[WO_Detail=]
	cReturnString = cReturnString + ALLTRIM(STR(pWO_Detail))
ELSE
	*Return HTML Code
	cReturnString = [<a href=]+get_Report_Server()+[%2fWorkOrder%2fWorkOrder+WOD&rs:Command=Render]+"&"+[WO_Detail=]
	cReturnString = cReturnString + ALLTRIM(STR(pWO_Detail))
	cReturnString = cReturnString + [>]+ALLTRIM(STR(pWO_Detail))+"</a>"+"<br />"
ENDIF

RETURN cReturnString
ENDPROC

********************************************************
PROCEDURE HTML_WO_Status 
PARAMETERS pWO, pReturnURL
*m.cHyperLink = HTML_WO_Status (nWO,.T.)

PRIVATE cReturnString
cReturnString = ""

IF VARTYPE(pWO) != "N"
	RETURN " "
ENDIF

**
PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF

IF lReturnURL 
*https://raptor/ReportServer/Pages/ReportViewer.aspx?%2fWorkOrder%2fWO+Status&rs:Command=Render]+"&"+[WO=1020
*	cReturnString = get_Report_Server()+[%2fWorkOrder%2fWorkOrder&rs:Command=Render]+"&"+[WO=]
	cReturnString = get_Report_Server()+[%2fWorkOrder%2fWorkOrder+Status&rs:Command=Render]+"&"+[WO=]
	cReturnString = cReturnString + ALLTRIM(STR(pWO))
ELSE
	*Return HTML Code
	cReturnString = [<a href=]+get_Report_Server()+[%2fWorkOrder%2fWorkOrder+Status&rs:Command=Render]+"&"+[WO=]
	cReturnString = cReturnString + ALLTRIM(STR(pWO))
	cReturnString = cReturnString + [>]+ALLTRIM(STR(pSO))+"</a>"+"<br />"
ENDIF

RETURN cReturnString
ENDPROC

********************************************************
PROCEDURE HTML_CustomerInfo_ID
PARAMETERS pCustID, pReturnURL
*m.cHyperLink = HTML_CustomerInfo_ID(pCustID,.T.)

PRIVATE cReturnString
cReturnString = ""

IF VARTYPE(pCustID) != "C"
	RETURN " "
ENDIF
PRIVATE cCustID
cCustID = PrepareSQLtxt(pCustID,'CustID',20)


**
PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF

IF lReturnURL 
	*cReturnString = get_Report_Server()+[%2fWorkOrder%2fWO+Status&rs:Command=Render]+"&"+[SO=]
	cReturnString = get_Report_Server()+[%2fCustomer%2fCustomer+Info+CustID&rs:Command=Render]+"&"+[CustomerID=]
	cReturnString = cReturnString + ALLTRIM(cCustID)
ELSE
	*Return HTML Code
	*cReturnString = [<a href=]+get_Report_Server()+[%2fWO%2fWorkOrder+&rs:Command=Render]+"&"+[SO=]
	cReturnString = [<a href=]+get_Report_Server()+[%2fCustomer%2fCustomer+Info+CustID&rs:Command=Render]+"&"+[CustomerID=]
	cReturnString = cReturnString + ALLTRIM(cCustID)
	cReturnString = cReturnString + [>]+ALLTRIM(cCustID)+"</a>"+"<br />"
ENDIF

RETURN cReturnString
ENDPROC

********************************************************
PROCEDURE HTML_CompanyInfo
PARAMETERS pCompany, pReturnURL
*m.cHyperLink = HTML_CompanyInfo(pCompany,.T.)

PRIVATE cReturnString
cReturnString = ""

IF VARTYPE(pCompany) != "C"
	RETURN " "
ENDIF
PRIVATE cCompany
cCompany = PrepareSQLtxt(pCompany,'Company',50)


**
PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF

IF lReturnURL 
	cReturnString = get_Report_Server()+[%2fCustomer%2fCustomer+Info&rs:Command=Render]+"&"+[customer=]
	cReturnString = cReturnString + ALLTRIM(cCompany)
ELSE
	*Return HTML Code
	cReturnString = [<a href=]+get_Report_Server()+[%2fCustomer%2fCustomer+Info&rs:Command=Render]+"&"+[customer=]
	cReturnString = cReturnString + ALLTRIM(cCompany)
	cReturnString = cReturnString + [>]+ALLTRIM(cCompany)+"</a>"+"<br />"
ENDIF

RETURN cReturnString
ENDPROC


******************************************************** 
PROCEDURE HTML_Quote_ID 
PARAMETERS pID, pReturnURL
*m.cHyperLink = HTML_CompanyInfo(pCompany,.T.)

PRIVATE cReturnString
cReturnString = ""

*!*	IF VARTYPE(pID) != "C"
*!*		RETURN " "
*!*	ENDIF
PRIVATE nID
nID = PrepareSQLnum(pID,'ID',-4)


**
PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF

IF lReturnURL 
	cReturnString = get_Report_Server()+[%2fQuotes%2fQuote+ID&rs:Command=Render]+"&"+[ID=]
	cReturnString = cReturnString +STR(nID)
ELSE
	*Return HTML Code
	cReturnString = [<a href=]+get_Report_Server()+[%2fQuotes%2fQuote+ID&rs:Command=Render]+"&"+[ID=]
	cReturnString = cReturnString +STR(nID)
	cReturnString = cReturnString + [>]+STR(nID)+"</a>"+"<br />"
ENDIF

RETURN cReturnString
ENDPROC

******************************************************** 
PROCEDURE HTML_InqNumP
PARAMETERS pInqNumP, pReturnURL
*m.cHyperLink = HTML_InqNumP(pInqNumP,.T.)

PRIVATE cReturnString
cReturnString = ""

IF VARTYPE(pInqNumP) != "C"
	RETURN " "
ENDIF
PRIVATE cInqNumP
cInqNumP = PrepareSQLtxt(pInqNumP,'InqNumP',9)


**
PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF

IF lReturnURL 
	cReturnString = get_Report_Server()+[%2fQuotes%2fQuote+InqNumP&rs:Command=Render]+"&"+[InqNumP=]
	cReturnString = cReturnString + cInqNumP 
ELSE
	*Return HTML Code
	cReturnString = [<a href=]+get_Report_Server()+[%2fQuotes%2fQuote+InqNumP&rs:Command=Render]+"&"+[InqNumP=]
	cReturnString = cReturnString + cInqNumP 
	cReturnString = cReturnString + [>]+cInqNumP +"</a>"+"<br />"
ENDIF

RETURN cReturnString
ENDPROC


******************************************************** 
PROCEDURE HTML_ProjID 
PARAMETERS pProjID, pReturnURL

*m.cHyperLink = HTML_ProjID(pProjID,.F.)

PRIVATE cReturnString
cReturnString = ""

IF VARTYPE(pProjID) != "N"
	RETURN " "
ENDIF

PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF

IF lReturnURL 
	cReturnString = get_Report_Server()+[%2fWorkOrder%2fWO+by+ProjID&rs:Command=Render]+"&"+[ProjID=]
	cReturnString = cReturnString + ALLTRIM(STR(pProjID))
ELSE
	*Return HTML Code
	cReturnString = [<a href=]+get_Report_Server()+[%2fWorkOrder%2fWO+by+ProjID&rs:Command=Render]+"&"+[ProjID=]
	cReturnString = cReturnString + ALLTRIM(STR(pProjID))
	cReturnString = cReturnString + [>]+ALLTRIM(STR(pProjID))+"</a>"+"<br />"
ENDIF

RETURN cReturnString
ENDPROC
******************************************************** 
PROCEDURE HTML_MFG_Log 
PARAMETERS cMachine, pLOG, pReturnURL

*m.cHyperLink = HTML_MFG_Log('D',1002,.T.)

PRIVATE cReturnString
cReturnString = ""

IF VARTYPE(cMachine) != "C"
	RETURN " "
ENDIF

PRIVATE nLOG
IF VARTYPE(pLOG) = "N"
	nLOG = pLOG
ENDIF
IF VARTYPE(pLOG) = "C"
	nLOG = VAL(ALLTRIM(pLOG))
ENDIF

PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF

PRIVATE cReport
cReport = ""
DO CASE
*CASE UPPER(LEFT(pTable,1)) = "C"
*	cReport = "Conversion_log"
CASE UPPER(LEFT(cMachine,1)) = "D"
	cReport = "Draw_log"
	IF lReturnURL 
		cReturnString = get_Report_Server()+[%2fMFG+Log%2f]+cReport+[&rs:Command=Render]+"&"+[Lot=]
		cReturnString = cReturnString + ALLTRIM(STR(nLOG))
	ELSE
		*Return HTML Code
		cReturnString = [<a href=]+get_Report_Server()+[%2fMFG+Log%2f]+cReport+[&rs:Command=Render]+"&"+[Lot=]
		cReturnString = cReturnString + ALLTRIM(STR(nLOG))
		cReturnString = cReturnString + [>]+ALLTRIM(STR(nLOG))+"</a>"+"<br />"
	ENDIF
CASE UPPER(LEFT(cMachine,1)) = "G"
	cReport = "GFMlog"
	IF lReturnURL 
		cReturnString = get_Report_Server()+[%2fMFG+Log%2f]+cReport+[&rs:Command=Render]+"&"+[Lot=]
		cReturnString = cReturnString + ALLTRIM(STR(nLOG))
	ELSE
		*Return HTML Code
		cReturnString = [<a href=]+get_Report_Server()+[%2fMFG+Log%2f]+cReport+[&rs:Command=Render]+"&"+[Lot=]
		cReturnString = cReturnString + ALLTRIM(STR(nLOG))
		cReturnString = cReturnString + [>]+ALLTRIM(STR(nLOG))+"</a>"+"<br />"
	ENDIF
*CASE UPPER(LEFT(cMachine,1)) = "H"
*	cReport = "HT_log"
CASE UPPER(LEFT(cMachine,1)) = "R"
	cReport = "Roll_log"
	IF lReturnURL 
		cReturnString = get_Report_Server()+[%2fMFG+Log%2f]+cReport+[&rs:Command=Render]+"&"+[Lot=]
		cReturnString = cReturnString + ALLTRIM(STR(nLOG))
	ELSE
		*Return HTML Code
		cReturnString = [<a href=]+get_Report_Server()+[%2fMFG+Log%2f]+cReport+[&rs:Command=Render]+"&"+[Lot=]
		cReturnString = cReturnString + ALLTRIM(STR(nLOG))
		cReturnString = cReturnString + [>]+ALLTRIM(STR(nLOG))+"</a>"+"<br />"
	ENDIF
CASE UPPER(LEFT(cMachine,1)) = "L"
	cReport = "LakeErie_log"
	IF lReturnURL 
		cReturnString = get_Report_Server()+[%2fMFG+Log%2f]+cReport+[&rs:Command=Render]+"&"+[Lot=]
		cReturnString = cReturnString + ALLTRIM(STR(nLOG))
	ELSE
		*Return HTML Code
		cReturnString = [<a href=]+get_Report_Server()+[%2fMFG+Log%2f]+cReport+[&rs:Command=Render]+"&"+[Lot=]
		cReturnString = cReturnString + ALLTRIM(STR(nLOG))
		cReturnString = cReturnString + [>]+ALLTRIM(STR(nLOG))+"</a>"+"<br />"
	ENDIF
CASE UPPER(LEFT(cMachine,1)) = "S"
	cReport = "Swage_Log"
	IF lReturnURL 
		cReturnString = get_Report_Server()+[%2fMFG+Log%2f]+cReport+[&rs:Command=Render]+"&"+[Lot=]
		cReturnString = cReturnString + ALLTRIM(STR(nLOG))
	ELSE
		*Return HTML Code
		cReturnString = [<a href=]+get_Report_Server()+[%2fMFG+Log%2f]+cReport+[&rs:Command=Render]+"&"+[Lot=]
		cReturnString = cReturnString + ALLTRIM(STR(nLOG))
		cReturnString = cReturnString + [>]+ALLTRIM(STR(nLOG))+"</a>"+"<br />"
	ENDIF
CASE UPPER(LEFT(cMachine,1)) = "W"
	cReport = "Wire_log"
	IF lReturnURL 
		cReturnString = get_Report_Server()+[%2fMFG+Log%2f]+cReport+[&rs:Command=Render]+"&"+[Lot=]
		cReturnString = cReturnString + ALLTRIM(STR(nLOG))
	ELSE
		*Return HTML Code
		cReturnString = [<a href=]+get_Report_Server()+[%2fMFG+Log%2f]+cReport+[&rs:Command=Render]+"&"+[Lot=]
		cReturnString = cReturnString + ALLTRIM(STR(nLOG))
		cReturnString = cReturnString + [>]+ALLTRIM(STR(nLOG))+"</a>"+"<br />"
	ENDIF
OTHERWISE
	MESSAGEBOX(cMachine+": machine name is not Programed",0,"No Report")
	RETURN " "
ENDCASE	
	

RETURN cReturnString
ENDPROC

******************************************************** 
PROCEDURE HTML_GFM_Log
PARAMETERS pLot, pReturnURL

*m.cHyperLink = HTML_GFM_Log(pLot,.F.)

PRIVATE cReturnString
cReturnString = ""

IF VARTYPE(pLot) != "N"
	RETURN " "
ENDIF

PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF

IF lReturnURL 
	cReturnString = get_Report_Server()+[%2fMFG+Log%2f]+[GFMlog]+[&rs:Command=Render]+"&"+[Lot=]
	cReturnString = cReturnString + ALLTRIM(STR(pLot))
ELSE
	*Return HTML Code
	cReturnString = [<a href=]+get_Report_Server()+[%2fMFG+Log%2f]+[GFMlog]+[&rs:Command=Render]+"&"+[Lot=]
	cReturnString = cReturnString + ALLTRIM(STR(pLot))
	cReturnString = cReturnString + [>]+ALLTRIM(STR(pLot))+"</a>"+"<br />"
ENDIF

RETURN cReturnString
ENDPROC


******************************************************** 
PROCEDURE HTML_GFM_fSize_CW   
PARAMETERS pfSize, pCW, pAlloy, pReturnURL

*m.cHyperLink = HTML_GFM_fSize_CW(pfSize, pCW, pAlloy, .F.)
*m.cHyperLink = HTML_GFM_fSize_CW(2.050, .32, 'HPA N60', .t.)

SET PROCEDURE TO Progs\Proc_Setup ADDITIVE
IF VARTYPE(pAlloy) != "C"
	RETURN " "
ENDIF

PRIVATE cReturnString
cReturnString = ""

PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF

IF lReturnURL 
	cReturnString = get_Report_Server()+[%2fMFG+Log%2f]+[GFMlog+by+fSize+CW]+[&rs:Command=Render]+"&"
	cReturnString = cReturnString + [FinishSize=]+STR(pfSize,5,4)
	cReturnString = cReturnString + +"&"+[ColdWork=]+STR(pCW,4,3)
	cReturnString = cReturnString + +"&"+[Alloy=]+pAlloy
	
ELSE
	*Return HTML Code
	cReturnString = [<a href=]+get_Report_Server()+[%2fMFG+Log%2f]+[GFMlog+by+fSize+CW]+[&rs:Command=Render]+"&"
	cReturnString = cReturnString + [FinishSize=]+STR(pfSize,5,4)
	cReturnString = cReturnString + "&"+ [ColdWork=]+STR(pCW,4,3)
	cReturnString = cReturnString + "&"+ [Alloy=]+pAlloy
	cReturnString = cReturnString + [>]+"Report GFMlog+by+fSize+CW"+"</a>"+"<br />"
ENDIF

RETURN cReturnString
ENDPROC

******************************************************** 
PROCEDURE HTML_GFM_Calc_StartSize
PARAMETERS pWorkSize, pLevel, pReturnURL

*m.cHyperLink = HTML_GFM_Calc_StartSize(pWorkSize, pLevel,.F.)
*m.cHyperLink = HTML_GFM_Calc_StartSize(2.050, 3,.T.)

PRIVATE cReturnString
cReturnString = ""

IF VARTYPE(pLevel) != "N"
	RETURN " "
ENDIF

PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF

IF lReturnURL 
*	cReturnString = get_Report_Server()+[%2fMFG+Log%2f]+[GFMlog&rs:Command=Render]+"&"+[Lot=]
	cReturnString = get_Report_Server()+[%2fMFG+Log%2f]+[GFM+Calc+StartSize]+[&rs:Command=Render]+"&"
	cReturnString = cReturnString + [nWorkSize=]+ALLTRIM(STR(pWorkSize,6,3))
	cReturnString = cReturnString + "&"+ [nLevel=]+ALLTRIM(STR(pLevel))
	
ELSE
	*Return HTML Code
*	cReturnString = [<a href=]+get_Report_Server()+[%2fMFG+Log%2fGFMlog&rs:Command=Render]+"&"+[Lot=]
	cReturnString = [<a href=]+get_Report_Server()+[%2fMFG+Log%2f]+[GFM+Calc+StartSize]+[&rs:Command=Render]+"&"
	cReturnString = cReturnString + [nWorkSize=]+ALLTRIM(STR(pWorkSize,6,3))
	cReturnString = cReturnString + "&"+ [nLevel=]+ALLTRIM(STR(pLevel))
	cReturnString = cReturnString + [>]
	cReturnString = cReturnString + [nWorkSize=]+ALLTRIM(STR(pWorkSize,6,3))
	cReturnString = cReturnString + "&"+ [nLevel=]+ALLTRIM(STR(pLevel))
	cReturnString = cReturnString + "</a>"+"<br />"
ENDIF

RETURN cReturnString
ENDPROC

******************************************************** 
PROCEDURE HTML_MFG_CC_CL_Search 
PARAMETERS pAlloy, pCC, pCL, pfSize, pReturnURL

*m.cHyperLink = HTML_MFG_CC_CL_Search('HPA N60','7','3',1.125, .T.)

PRIVATE cAlloy, cCC, cCL, cfSize
cReturnString = ""

IF VARTYPE(pAlloy) != "C"
	RETURN " "
ENDIF
IF VARTYPE(pCC) != "C"
	RETURN " "
ENDIF
IF VARTYPE(pCL) != "C"
	RETURN " "
ENDIF

IF VARTYPE(pfSize) != "N"
	RETURN " "
ENDIF

*cAlloy, cCC, cCL, nfSize
PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF
PRIVATE cAlloy, cCC, cCL, cfSize
cAlloy  = STRTRAN(ALLTRIM(pAlloy)," ","+")
cCC		= pCC
cCL		= pCL
SET PROCEDURE TO Progs\Proc_Quotes ADDITIVE
cfSize	= Remove0(pfSize,9,3,.F.)

IF lReturnURL 
	cReturnString = get_Report_Server()+[%2fMFG+Log%2f]+[MFG+CC+CL+Search]+[&rs:Command=Render]+"&"
	cReturnString = cReturnString + [Alloy=]+cAlloy
	cReturnString = cReturnString + +"&"+[CC=]+cCC
	cReturnString = cReturnString + +"&"+[CL=]+cCL
	cReturnString = cReturnString + +"&"+[fSize=]+cfSize
ELSE
	*Return HTML Code
	cReturnString = [<a href=]+get_Report_Server()+[%2fMFG+Log%2f]+[MFG+CC+CL+Search]+[&rs:Command=Render]+"&"
	cReturnString = cReturnString + [Alloy=]+STRTRAN(ALLTRIM(cAlloy)," ","+")
	cReturnString = cReturnString + +"&"+[CC=]+cCC
	cReturnString = cReturnString + +"&"+[CL=]+cCL
	cReturnString = cReturnString + +"&"+[fSize=]+cfSize
	
	cReturnString = cReturnString + [>]+ALLTRIM(STR(pLot))+"</a>"+"<br />"
ENDIF

RETURN cReturnString
ENDPROC

******************************************************** 
PROCEDURE HTML_ColdWork_Stats  
PARAMETERS pAlloy, pCC, pCL, pfSize, pReturnURL

*m.cHyperLink = HTML_ColdWork_Stats('HPA N60','7','3',1.125, .T.)

PRIVATE cAlloy, cCC, cCL, cfSize
cReturnString = ""

IF VARTYPE(pAlloy) != "C"
	RETURN " "
ENDIF
IF VARTYPE(pCC) != "C"
	RETURN " "
ENDIF
IF VARTYPE(pCL) != "C"
	RETURN " "
ENDIF

IF VARTYPE(pfSize) != "N"
	RETURN " "
ENDIF

*cAlloy, cCC, cCL, nfSize
PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF
PRIVATE cAlloy, cCC, cCL, cfSize
cAlloy  = STRTRAN(ALLTRIM(pAlloy)," ","+")
cCC		= pCC
cCL		= pCL
SET PROCEDURE TO Progs\Proc_Quotes ADDITIVE
cfSize	= Remove0(pfSize,9,3,.F.)

IF lReturnURL 
*	cReturnString = get_Report_Server()+[%2fMFG+Log%2f]+[MFG+CC+CL+Search]+[&rs:Command=Render]+"&"
	cReturnString = get_Report_Server()+[%2fMFG+Log%2f]+[GFMlog+Cold+Work+Stats]+[&rs:Command=Render]+"&"
	cReturnString = cReturnString + [Alloy=]+cAlloy
	cReturnString = cReturnString + "&"+[CC=]+cCC
	cReturnString = cReturnString + "&"+[CL=]+cCL
	cReturnString = cReturnString + "&"+[FinSize=] 
	cReturnString = cReturnString + cfSize
ELSE
	*Return HTML Code
*	cReturnString = [<a href=]+get_Report_Server()+[%2fMFG+Log%2f]+[MFG+CC+CL+Search]+[&rs:Command=Render]+"&"
	cReturnString = [<a href=]+get_Report_Server()+[%2fMFG+Log%2f]+[GFMlog+Cold+Work+Stats]+[&rs:Command=Render]+"&"
	cReturnString = cReturnString + [Alloy=]+STRTRAN(ALLTRIM(cAlloy)," ","+")
	cReturnString = cReturnString + "&"+[CC=]+cCC
	cReturnString = cReturnString + "&"+[CL=]+cCL
	cReturnString = cReturnString + "&"+[FinSize=]+cfSize
	
	cReturnString = cReturnString + [>]+"Report GFMlog+Cold+Work+Stats"+"</a>"+"<br />"
ENDIF

RETURN cReturnString
ENDPROC

******************************************************** 
PROCEDURE HTML_PackingSlipNo 
PARAMETERS pPackingSlipNo, pReturnURL

*m.cHyperLink = HTML_PackingSlipNo(pPackingSlipNo,pReturnURL)

PRIVATE cReturnString
cReturnString = ""

IF VARTYPE(pPackingSlipNo) != "N"
	RETURN " "
ENDIF

PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF

IF lReturnURL 
	cReturnString = get_Report_Server()+[%2fShipping%2fPackingSlip+nPackingSlip&rs:Command=Render]+"&"+[nPackingSlip=]
	cReturnString = cReturnString + ALLTRIM(STR(pPackingSlipNo))
ELSE
	*Return HTML Code
	cReturnString = [<a href=]+get_Report_Server()+[%2fShipping%2fPackingSlip+nPackingSlip&rs:Command=Render]+"&"+[nPackingSlip=]
	cReturnString = cReturnString + ALLTRIM(STR(pPackingSlipNo))
	cReturnString = cReturnString + [>]+ALLTRIM(STR(pPackingSlipNo))+"</a>"+"<br />"
ENDIF

RETURN cReturnString
ENDPROC

******************************************************** 
PROCEDURE HTML_PackingSlip_SO 
PARAMETERS pSO, pReturnURL

*m.cHyperLink = HTML_PackingSlip_SO( pSO,pReturnURL )

PRIVATE cReturnString
cReturnString = ""

IF VARTYPE(pSO) != "N"
	RETURN " "
ENDIF

PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF

IF lReturnURL 
	cReturnString = get_Report_Server()+[%2fShipping%2fPackingSlip+SalesNum&rs:Command=Render]+"&"+[salesnum=]
	cReturnString = cReturnString + ALLTRIM(STR(pSO))+" "
ELSE
	*Return HTML Code
	cReturnString = [<a href=]+get_Report_Server()+[%2fShipping%2fPackingSlip+SalesNum&rs:Command=Render]+"&"+[salesnum=]
	cReturnString = cReturnString + ALLTRIM(STR(pSO))
	cReturnString = cReturnString + [> ]+ALLTRIM(STR(pSO))+" </a>"+"<br />"
ENDIF

RETURN cReturnString
ENDPROC

******************************************************** 
PROCEDURE HTML_PackingSli_DataMatrix 
PARAMETERS pPackingSli, cComapany, pReturnURL

*m.cHyperLink = HTML_PackingSli_DataMatrix(pPackingSli,cComapany, pReturnURL)
IF NOT "PROC_SETUP" $ SET("PROCEDURE")  &&Added for when Quotes is run without HPA menu.
	SET PROCEDURE TO Progs\Proc_Setup ADDITIVE
ENDIF 
PRIVATE cReturnString
cReturnString = ""

IF VARTYPE(pPackingSli) != "N"
	RETURN " "
ENDIF
IF VARTYPE(cComapany) != "C"
	RETURN " "
ENDIF

PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF

IF lReturnURL 
	DO CASE 
	CASE cComapany = "FLOWSERVE"
		*http://peregrine.windfall.hpa.local/ReportS/report/PackingSlip/Packing%20Slip%20-%20FlowServe?Packingsli=4001
		cReturnString = get_Report_Server()+[%2fPackingSlip%2fPacking%20Slip%20-%20FlowServe&rs:Command=Render]+"&"+[Packingsli=]
		*cReturnString = get_Report_Server()+"%2fShipping%2fPackingSlip+nPackingSlip"+CHR(38)+"rs:Command=Render"+CHR(38)+"Packingsli="
		cReturnString = cReturnString + ALLTRIM(STR(pPackingSli))
	ENDCASE 	
ELSE
	*Return HTML Code
	DO CASE 
	CASE cComapany = "FLOWSERVE"
		cReturnString = [<a href=]+get_Report_Server()+[%2fPackingSlip%2fPacking%20Slip%20-%20FlowServe&rs:Command=Render]+"&"+[Packingsli=]
	*	cReturnString = [<a href=]+get_Report_Server()+[%2fShipping%2fPackingSlip+nPackingSlip&rs:Command=Render]+"&"+[nPackingSlip=]
		cReturnString = cReturnString + ALLTRIM(STR(pPackingSli))
		cReturnString = cReturnString + [>]+ALLTRIM(STR(pPackingSli))+"</a>"+"<br />"
	ENDCASE
ENDIF

RETURN cReturnString
ENDPROC

********************************************************
PROCEDURE HTML_Sales_Stock_SOitem
PARAMETERS pSOitem, pReturnURL

*m.cHyperLink = HTML_Sales_Stock_SOitem(cSOitem,lReturnURL)
*? HTML_Sales_Stock_SOitem(' 115520-01',.T.)
PRIVATE cReturnString
cReturnString = ""

IF VARTYPE(pSOitem) != "C"
	RETURN " "
ENDIF

PRIVATE cSOitem
cSOitem = PrepareSQLtxt(pSOitem,'SOitem',10)

IF Proper_SO_item(cSOitem) = Proper_SO_item("")
	RETURN " "
ENDIF

PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF

IF cSOitem = Proper_SO_Item('   0-00')
	*Not a SOitem, Probably "Stock"
	IF lReturnURL 
		cReturnString = ''
	ELSE
		cReturnString = cSOitem
	ENDIF
ELSE
	IF lReturnURL 
		cReturnString = get_Report_Server()+[%2fHPA+Sales+Reports/Sales_Stock+SOitem&rs:Command=Render]+"&"+[cSOitem=]
		cReturnString = cReturnString + STRTRAN(cSOitem," ","+")
	ELSE
		*Return HTML Code
		cReturnString = [<a href=]+get_Report_Server()+[%2fHPA+Sales+Reports%2fSales_Stock+SOitem&rs:Command=Render]+"&"+[cSOitem=]
		cReturnString = cReturnString + STRTRAN(cSOitem," ","+")
		cReturnString = cReturnString + [>]+cSOitem+"</a>"+"<br />"
	ENDIF
ENDIF

RETURN cReturnString
ENDPROC

******************************************************** 
PROCEDURE HTML_VendCode 
PARAMETERS pVendCode, pReturnURL

*m.cHyperLink = HTML_VendCode(nVendCode,pReturnURL)

PRIVATE cReturnString
cReturnString = ""

IF VARTYPE(pVendCode) != "N"
	RETURN " "
ENDIF

PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF

IF lReturnURL 
	cReturnString = get_Report_Server()+[%2fVendor%2fVendor+Code&rs:Command=Render]+"&"+[VendCode=]
	cReturnString = cReturnString + ALLTRIM(STR(pVendCode))
ELSE
	*Return HTML Code
	cReturnString = [<a href=]+get_Report_Server()+[%2fVendor%2fVendor+Code&rs:Command=Render]+"&"+[VendCode="]
	cReturnString = cReturnString + ALLTRIM(STR(pVendCode))
	cReturnString = cReturnString + [>]+ALLTRIM(STR(pVendCode))+"</a>"+"<br />"
ENDIF

RETURN cReturnString
ENDPROC

******************************************************** 
PROCEDURE HTML_CustomerInfo 
PARAMETERS cCustomer, pReturnURL

PRIVATE cReturnString
cReturnString = ""

IF VARTYPE(cCustomer) != "C"
	RETURN " "
ENDIF

PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF

IF lReturnURL 
	cReturnString = get_Report_Server()+[%2fCustomer%2fCustomer+Info&rs:Command=Render]+"&"+[customer=]
	cReturnString = cReturnString + ALLTRIM(cCustomer)
ELSE
	*Return HTML Code
	cReturnString = [<a href=]+get_Report_Server()+[%2fCustomer%2fCustomer+Info&rs:Command=Render]+"&"+[customer="]
	cReturnString = cReturnString + ALLTRIM(cCustomer)
	cReturnString = cReturnString + [>]+ALLTRIM(cCustomer)+"</a>"+"<br />"
ENDIF

RETURN cReturnString
ENDPROC

******************************************************** 
PROCEDURE HTML_StockLstTotalsandSales 
PARAMETERS cAlloy,cForm,cCC, pReturnURL

*m.cHyperLink = HTML_StockLstTotalsandSales(cAlloy,cForm,cCC,pReturnURL)

PRIVATE cReturnString
cReturnString = ""

IF VARTYPE(cAlloy) != "C"
	RETURN " "
ENDIF
IF VARTYPE(cForm) != "C"
	RETURN " "
ENDIF
IF VARTYPE(cCC) != "C"
	cCC = '1'
ENDIF

PRIVATE cParameters, cText
*+CHR(38)+ 
cParameters =             "&"+"Alloy="+ALLTRIM(cAlloy)
cParameters = cParameters+"&"+"Form=" +ALLTRIM(cForm)
cParameters = cParameters+"&"+"CC="   +ALLTRIM(cCC)
cParameters = STRTRAN(cParameters,' ','%20')

cText = " Alloy="+ALLTRIM(cAlloy)+" Form=" +ALLTRIM(cForm)+" CC="   +ALLTRIM(cCC)

PRIVATE lReturnURL
lReturnURL = .T.		&&Other Procs default to False!!!

IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF

IF lReturnURL 
	cReturnString = get_Report_Server()+[%2fInventory%2fStockLst+Totals+with+Sales&rs:Command=Render]+cParameters
ELSE
	*Return HTML Code
	cReturnString = [<a href=]+get_Report_Server()+[%2fInventory%2fStockLst+Totals+with+Sales&rs:Command=Render]+cParameters
	cReturnString = cReturnString + [>]+ALLTRIM(cText)+"</a>"+"<br />"
ENDIF

RETURN cReturnString
ENDPROC

*!*	******************************************************** 
*!*	PROCEDURE HTML_Receiving 
*!*	PARAMETERS pReceivingID, pReturnURL

*!*	*m.cHyperLink = HTML_Receiving(31056,.T.)

*!*	PRIVATE cReturnString
*!*	cReturnString = ""

*!*	IF VARTYPE(pReceivingID) != "N"
*!*		RETURN " "
*!*	ENDIF

*!*	PRIVATE lReturnURL
*!*	lReturnURL = .F.
*!*	IF VARTYPE(pReturnURL) = "L"
*!*		lReturnURL = pReturnURL
*!*	ENDIF

*!*	IF lReturnURL 
*!*		*cReturnString= get_Report_Server()+[%2fShipping%2fPackingSlip+nPackingSlip&rs:Command=Render]+"&"+[nPackingSlip=]
*!*		cReturnString = get_Report_Server()+[%2fReceiving%2fReceiving+ReceivingID&rs:Command=Render]+"&"+[ReceivingID=]
*!*		cReturnString = cReturnString + ALLTRIM(STR(pReceivingID))
*!*	ELSE
*!*		*Return HTML Code
*!*		*cReturnString = [<a href=]+get_Report_Server()+[%2fReceiving%2fReceiving+ReceivingID&rs:Command=Render]+"&"+[ReceivingID=]
*!*		cReturnString = [<a href=]+get_Report_Server()+[%2fReceiving%2fReceiving+ReceivingID&rs:Command=Render]+"&"+[ReceivingID=]
*!*		cReturnString = cReturnString + ALLTRIM(STR(pReceivingID))
*!*		cReturnString = cReturnString + [>]+ALLTRIM(STR(pReceivingID))+"</a>"+"<br />"
*!*	ENDIF

*!*	RETURN cReturnString
*!*	ENDPROC

********************************************************  
PROCEDURE HTML_ReceivingID
PARAMETERS pReceivingID, pReturnURL


*m.cHyperLink = HTML_ReceivingID(nReceivingID,.T.)

PRIVATE cReturnString
cReturnString = ""

PRIVATE nReceivingID
nReceivingID = PrepareSQLnum(pReceivingID,'ReceivingID',-3)

IF nReceivingID= 0
	RETURN " "
ENDIF

PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF

IF lReturnURL 
	cReturnString = get_Report_Server()+[/Receiving]+[/Receiving%20ReceivingID&rs:Command=Render]+"&"+[ReceivingID=]
	cReturnString = cReturnString + ALLTRIM(STR(nReceivingID))
ELSE
	*Return HTML Code
	cReturnString = [<a href=]+get_Report_Server()+[/Receiving]+[/Receiving%20ReceivingID&rs:Command=Render]+"&"+[ReceivingID=]
	cReturnString = cReturnString + ALLTRIM(STR(nReceivingID))
	cReturnString = cReturnString + [> ]+ALLTRIM(STR(nReceivingID)) +" </a>"+"<br />"
ENDIF

RETURN cReturnString
ENDPROC

******************************************************** 
PROCEDURE HTML_Receiving_POitem 
PARAMETERS pPOitem, pReturnURL

*m.cHyperLink = HTML_Receiving_POitem('   510444-01',.T.)

PRIVATE cReturnString
cReturnString = ""

PRIVATE cPOitem
cPOitem = PrepareSQLtxt(pPOitem,'POitem',12)

IF Proper_PO_item(cPOitem) = Proper_PO_item("")
	RETURN " "
ENDIF

PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF

IF lReturnURL 
	cReturnString = get_Report_Server()+[%2fReceiving%2fReceiving+POitem&rs:Command=Render]+"&"+[cPOitem=]
	cReturnString = cReturnString + STRTRAN(cPOitem," ","+")
ELSE
	*Return HTML Code
	cReturnString = [<a href=]+get_Report_Server()+[%2fReceiving%2fReceiving+POitem&rs:Command=Render]+"&"+[cPOitem=]
	cReturnString = cReturnString + STRTRAN(cPOitem," ","+")
	cReturnString = cReturnString + [>]+ALLTRIM(cPOitem) +"</a>"+"<br />"
ENDIF

RETURN cReturnString
ENDPROC

********************************************************  
PROCEDURE HTML_Receiving_Stock_Detail 
PARAMETERS pID_Detail, pReturnURL


*m.cHyperLink = HTML_Receiving_Stock_Detail(nID_Detail,.T.)

PRIVATE cReturnString
cReturnString = ""

PRIVATE nID_Detail
nID_Detail= PrepareSQLnum(pID_Detail,'ID_Detail',-3)

IF nID_Detail = 0
	RETURN ""
ENDIF

PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF

IF lReturnURL 
*https://raptor/ReportServer/Pages/ReportViewer.aspx?%2fReceiving%2fPOitem+Receiving+SELECTED+SOitem&rs:Command=Render]+"&"+[cPOitem=+++510444-01
*https://raptor/ReportServer/Pages/ReportViewer.aspx?/Receiving/Receiving%20SELECTED%20SOitem&rs:Command=Render&ID_Detail=13175

	cReturnString = get_Report_Server()+[/Receiving]+[/Receiving%20SELECTED%20Stock&rs:Command=Render]+"&"+[ID_Detail=]
	cReturnString = cReturnString + ALLTRIM(STR(nID_Detail))
ELSE
	*Return HTML Code
	cReturnString = [<a href=]+get_Report_Server()+[/Receiving]+[/Receiving%20SELECTED%20Stock&rs:Command=Render]+"&"+[ID_Detail=]
	cReturnString = cReturnString + ALLTRIM(STR(nID_Detail))
	cReturnString = cReturnString + [>]+ALLTRIM(STR(nID_Detail)) +"</a>"+"<br />"
ENDIF

RETURN cReturnString
ENDPROC


********************************************************  

PROCEDURE HTML_Receiving_Broker_Detail 
PARAMETERS pID_Detail, pReturnURL


*m.cHyperLink = HTML_Receiving_Broker_Detail(nID_Detail,.T.)

PRIVATE cReturnString
cReturnString = ""

PRIVATE nID_Detail
nID_Detail= PrepareSQLnum(pID_Detail,'ID_Detail',-3)

IF nID_Detail = 0
	RETURN ""
ENDIF

PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF

IF lReturnURL 
*https://raptor/ReportServer/Pages/ReportViewer.aspx?%2fReceiving%2fPOitem+Receiving+SELECTED+SOitem&rs:Command=Render]+"&"+[cPOitem=+++510444-01
*https://raptor/ReportServer/Pages/ReportViewer.aspx?/Receiving/Receiving%20SELECTED%20SOitem&rs:Command=Render&ID_Detail=13175

	cReturnString = get_Report_Server()+[/Receiving]+[/Receiving%20Broker%20Detail&rs:Command=Render]+"&"+[ID_Detail=]
	cReturnString = cReturnString + ALLTRIM(STR(nID_Detail))
ELSE
	*Return HTML Code
	cReturnString = [<a href=]+get_Report_Server()+[/Receiving]+[/Receiving%20Broker%20Detail&rs:Command=Render]+"&"+[ID_Detail=]
	cReturnString = cReturnString + ALLTRIM(STR(nID_Detail))
	cReturnString = cReturnString + [>]+ALLTRIM(STR(nID_Detail)) +"</a>"+"<br />"
ENDIF

RETURN cReturnString
ENDPROC


********************************************************  
PROCEDURE HTML_POitem_Receiving_SELECTED_SOitem 
PARAMETERS pPOitem, pReturnURL


*m.cHyperLink = HTML_POitem_Receiving_SELECTED_SOitem('   510444-01',.T.)

PRIVATE cReturnString
cReturnString = ""

PRIVATE cPOitem
cPOitem = PrepareSQLtxt(pPOitem,'POitem',12)

IF Proper_PO_item(cPOitem) = Proper_PO_item("")
	RETURN " "
ENDIF

PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF

IF lReturnURL 
*https://raptor/ReportServer/Pages/ReportViewer.aspx?%2fReceiving%2fPOitem+Receiving+SELECTED+SOitem&rs:Command=Render]+"&"+[cPOitem=+++510444-01
*												       POitem%20Receiving%20SELECTED%20SOitem
	cReturnString = get_Report_Server()+[/Receiving]+[/POitem%20Receiving%20SELECTED%20SOitem&rs:Command=Render]+"&"+[cPOitem=]
	cReturnString = cReturnString + STRTRAN(cPOitem," ","+")
ELSE
	*Return HTML Code								              POitem%20Receiving%20SELECTED%20SOitem
	cReturnString = [<a href=]+get_Report_Server()+[/Receiving]+[/POitem%20Receiving%20SELECTED%20SOitem&rs:Command=Render]+"&"+[cPOitem=]
	cReturnString = cReturnString + STRTRAN(cPOitem," ","+")
	cReturnString = cReturnString + [>]+ALLTRIM(cPOitem) +"</a>"+"<br />"
ENDIF

RETURN cReturnString
ENDPROC

********************************************************  
PROCEDURE HTML_Receiving_WOD_SELECTED_SOitem 
PARAMETERS pWO_Detail, pReturnURL

*m.cHyperLink = HTML_Receiving_WOD_SELECTED_SOitem(nWO_Detail,.T.)
*m.cHyperLink = HTML_Receiving_WOD_SELECTED_SOitem(1913,.T.)

PRIVATE cReturnString
cReturnString = ""

PRIVATE nWO_Detail
nWO_Detail = PrepareSQLnum(pWO_Detail,'WO_Detail',-3)

IF nWO_Detail = 0
	RETURN " "
ENDIF

PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF

IF lReturnURL 
               *http://raptor/ReportS/report/Receiving/WO_Detail%20Receiving%20SELECTED%20SOitem
	cReturnString = get_Report_Server()+[/Receiving]+[/WO_Detail%20Receiving%20SELECTED%20SOitem&rs:Command=Render]+"&"+[WO_Detail=]
	*cReturnString = cReturnString + STRTRAN(cPOitem," ","+")
	cReturnString = cReturnString + ALLTRIM(STR(nWO_Detail))
ELSE
	*Return HTML Code
	cReturnString = [<a href=]+get_Report_Server()+[/Receiving]+[/WO_Detail%20Receiving%20SELECTED%20SOitem&rs:Command=Render]+"&"+[WO_Detail=]
	*cReturnString = cReturnString + STRTRAN(cPOitem," ","+")
	cReturnString = cReturnString + ALLTRIM(STR(nWO_Detail))
	cReturnString = cReturnString + [>]+ALLTRIM(cPOitem) +"</a>"+"<br />"
ENDIF

RETURN cReturnString
ENDPROC


********************************************************  
PROCEDURE HTML_Receiving_SELECTED_SOitem 
PARAMETERS pSOitem, pReturnURL


*m.cHyperLink = HTML_Receiving_SELECTED_SOitem(' 130260-01',.T.)

PRIVATE cReturnString
cReturnString = ""

PRIVATE cSOitem
cSOitem = PrepareSQLtxt(pSOitem,'SOitem',10)

IF Proper_SO_item(cSOitem) = Proper_SO_item("")
	RETURN " "
ENDIF

PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF

IF lReturnURL 
	cReturnString = get_Report_Server()+[/Receiving]+[/Receiving%20SELECTED%20SOitem&rs:Command=Render]+"&"+[cSOitem=]
	cReturnString = cReturnString + STRTRAN(cSOitem," ","+")
ELSE
	*Return HTML Code
	cReturnString = [<a href=]+get_Report_Server()+[/Receiving]+[/Receiving%20SELECTED%20SOitem&rs:Command=Render]+"&"+[cSOitem=]
	cReturnString = cReturnString + STRTRAN(cSOitem," ","+")
	cReturnString = cReturnString + [>]+ALLTRIM(cSOitem) +"</a>"+"<br />"
ENDIF

RETURN cReturnString
ENDPROC




******************************************************** 
PROCEDURE HTML_Stock_ID 
PARAMETERS cTBL, pID, pReturnURL

*m.cHyperLink = HTML_Stock_ID(TBL,ID,pReturnURL)

PRIVATE cReturnString
cReturnString = ""

cTBL = PrepareSQLtxt(cTBL,'TBL',1)
IF LEN(cTBL) = 0
	RETURN " "
ENDIF
PRIVATE nID
nID = PrepareSQLnum(pID,'ID',-3)
IF nID < 1
	RETURN " "
ENDIF

PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF
*http://raptor/ReportS/report/Inventory/BrokerLst%20ID
*http://raptor/ReportS/report/Inventory/StockLst%20ID&rs:Command=Render]+"&"+[ID=50000
*http://raptor/ReportS/report/Inventory/
*http://raptor/ReportS/report+[%2fInventory%2fStockLst+ID&rs:Command=Render]+"&"+[ID=50000]
*http://raptor/ReportS/report+%2fInventory%2fStockLst+ID&rs:Command=Render]+"&"+[ID=50000
	
*cReturnString = get_Report_Server()+[%2fHPA+Sales+Reports%2fSalesOrders&rs:Command=Render]+"&"+[soNum=]
*	cReturnString = cReturnString + ALLTRIM(STR(pSO))
	
IF lReturnURL 
	cReturnString = get_Report_Server()+[%2fInventory%2fStockID%2f]
	IF cTBL = "S"
		cReturnString = cReturnString + [StockLst%20ID]
	ENDIF
	IF cTBL = "B"
		cReturnString = cReturnString + [BrokerLst%20ID]
	ENDIF
	IF cTBL = "W"
		cReturnString = cReturnString + [WIPLst%20ID]
	ENDIF	
	*cReturnString = cReturnString + [?nID=]+ALLTRIM(STR(nID))
	cReturnString = cReturnString + [&rs:Command=Render]+"&"+[nID=]+ALLTRIM(STR(nID))
ELSE
	*Return HTML Code
	cReturnString = [<a href=]+get_Report_Server()+[%2fInventory%2fStockID%2f]
	IF cTBL = "S"
		cReturnString = cReturnString + [StockLst%20ID]
	ENDIF
	IF cTBL = "B"
		cReturnString = cReturnString + [BrokerLst%20ID]
	ENDIF
	IF cTBL = "W"
		cReturnString = cReturnString + [WIPLst%20ID]
	ENDIF	
	cReturnString = cReturnString + [&rs:Command=Render]+"&"+[nID=]+ALLTRIM(STR(nID))
*	cReturnString = cReturnString + [?nID=]+ALLTRIM(STR(nID))
	cReturnString = cReturnString + [>]+ALLTRIM(STR(nID)) +"</a>"+"<br />"
ENDIF

RETURN cReturnString
ENDPROC


******************************************************** 
PROCEDURE HTML_Stock_ID_Detail  
PARAMETERS cTBL, pID_Detail, pReturnURL

*m.cHyperLink = HTML_Stock_ID_Detail(TBL,ID_Detail,pReturnURL)

PRIVATE cReturnString
cReturnString = ""

cTBL = PrepareSQLtxt(cTBL,'TBL',1)
IF LEN(cTBL) = 0
	RETURN " "
ENDIF
PRIVATE nID_Detail
nID_Detail = PrepareSQLnum(pID_Detail,'ID_Detail',-3)
IF nID_Detail < 1
	RETURN " "
ENDIF

PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF
*http://raptor/ReportS/report/Inventory/BrokerLst%20ID_Detail
*http://raptor/ReportS/report/Inventory/StockLst%20ID_Detail&rs:Command=Render]+"&"+[ID_Detail=50000
*http://raptor/ReportS/report/Inventory/
*http://raptor/ReportS/report+[%2fInventory%2fStockLst+ID_Detail&rs:Command=Render]+"&"+[ID_Detail=50000]
*http://raptor/ReportS/report+%2fInventory%2fStockLst+ID_Detail&rs:Command=Render]+"&"+[ID_Detail=50000
	
*cReturnString = get_Report_Server()+[%2fHPA+Sales+Reports%2fSalesOrders&rs:Command=Render]+"&"+[soNum=]
*	cReturnString = cReturnString + ALLTRIM(STR(pSO))
	
IF lReturnURL 
	cReturnString = get_Report_Server()+[%2fInventory%2fStockID%2f]
	IF cTBL = "S"
		cReturnString = cReturnString + [StockLst%20ID_Detail]
	ENDIF
	IF cTBL = "B"
		cReturnString = cReturnString + [BrokerLst%20ID_Detail]
	ENDIF
	IF cTBL = "W"
		cReturnString = cReturnString + [WIPLst%20ID_Detail]
	ENDIF	
	*cReturnString = cReturnString + [?nID_Detail=]+ALLTRIM(STR(nID_DETAIL))
	cReturnString = cReturnString + [&rs:Command=Render]+"&"+[nID_Detail=]+ALLTRIM(STR(nID_DETAIL))
ELSE
	*Return HTML Code
	cReturnString = [<a href=]+get_Report_Server()+[%2fInventory%2fStockID%2f]
	IF cTBL = "S"
		cReturnString = cReturnString + [StockLst%20ID_Detail]
	ENDIF
	IF cTBL = "B"
		cReturnString = cReturnString + [BrokerLst%20ID_Detail]
	ENDIF
	IF cTBL = "W"
		cReturnString = cReturnString + [WIPLst%20ID_Detail]
	ENDIF	
	cReturnString = cReturnString + [&rs:Command=Render]+"&"+[nID_Detail=]+ALLTRIM(STR(nID_DETAIL))
*	cReturnString = cReturnString + [?nID_Detail=]+ALLTRIM(STR(nID_DETAIL))
	cReturnString = cReturnString + [>]+ALLTRIM(STR(nID_DETAIL)) +"</a>"+"<br />"
ENDIF

RETURN cReturnString
ENDPROC

******************************************************** 

PROCEDURE HTML_Stock_Master_Detail  
PARAMETERS cTBL, pID, pReturnURL

*m.cHyperLink = HTML_Stock_Master_Detail(TBL,ID,pReturnURL)

PRIVATE cReturnString
cReturnString = ""

cTBL = PrepareSQLtxt(cTBL,'TBL',1)
IF LEN(cTBL) = 0
	RETURN " "
ENDIF
PRIVATE nID
nID = PrepareSQLnum(pID,'ID',-3)
IF nID_Detail < 1
	RETURN " "
ENDIF

PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF


IF lReturnURL 
	cReturnString = get_Report_Server()+[%2fInventory%2fStockID%2f]
	IF cTBL = "S"
		cReturnString = cReturnString + [StockLst_Master%20and%20Detail%20Table]
	ENDIF
	IF cTBL = "B"
		cReturnString = cReturnString + [BrokerLst_Master%20and%20Detail%20Table]
	ENDIF
	IF cTBL = "W"
		cReturnString = cReturnString + [BrokerLst_Master%20and%20Detail%20Table]
	ENDIF	
	*cReturnString = cReturnString + [?nID_Detail=]+ALLTRIM(STR(nID_DETAIL))
	cReturnString = cReturnString + [&rs:Command=Render]+"&"+[nID=]+ALLTRIM(STR(nID))
ELSE
	*Return HTML Code
	cReturnString = [<a href=]+get_Report_Server()+[%2fInventory%2fStockID%2f]
	IF cTBL = "S"
		cReturnString = cReturnString + [StockLst%20ID_Detail]
	ENDIF
	IF cTBL = "B"
		cReturnString = cReturnString + [BrokerLst%20ID_Detail]
	ENDIF
	IF cTBL = "W"
		cReturnString = cReturnString + [WIPLst%20ID_Detail]
	ENDIF	
	cReturnString = cReturnString + [&rs:Command=Render]+"&"+[nID_Detail=]+ALLTRIM(STR(nID_DETAIL))
*	cReturnString = cReturnString + [?nID_Detail=]+ALLTRIM(STR(nID_DETAIL))
	cReturnString = cReturnString + [>]+ALLTRIM(STR(nID_DETAIL)) +"</a>"+"<br />"
ENDIF

RETURN cReturnString
ENDPROC

********************************************
PROCEDURE HTML_Stock_ProcessID_Detail
PARAMETERS pID_Detail, pReturnURL

*m.cHyperLink = HTML_Stock_ProcessID_Detail(ID_Detail,pReturnURL)

PRIVATE cReturnString
cReturnString = ""

cTBL = UPPER(PrepareSQLtxt(cTBL,'TBL',1))
IF LEN(cTBL) = 0
	RETURN " "
ENDIF
PRIVATE nID_Detail
nID_Detail = PrepareSQLnum(pID_Detail_P,'ID_Detail_Process',-3)
IF nID_Detail < 1
	RETURN " "
ENDIF

PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF
	
IF lReturnURL 
	cReturnString = get_Report_Server()+[%2fInventory%2fStockID%2f]
*	IF cTBL = "S"
		cReturnString = cReturnString + [StockLst%20ID_Detail_Proc]
*	ENDIF
*	IF cTBL = "B"
*		cReturnString = cReturnString + [BrokerLst%20ID_Detail_Proc]
*	ENDIF
*	IF cTBL = "W"
*		cReturnString = cReturnString + [WIPLst%20ID_Detail_Proc]
*	ENDIF	

	cReturnString = cReturnString + [&rs:Command=Render]+"&"+[nID_Detail=]+ALLTRIM(STR(nID_Detail))
ELSE
	*Return HTML Code
	cReturnString = [<a href=]+get_Report_Server()+[%2fInventory%2fStockID%2f]
*	IF cTBL = "S"
		cReturnString = cReturnString + [StockLst%20ID_Detail_Proc]
*	ENDIF
*	IF cTBL = "B"
*		cReturnString = cReturnString + [BrokerLst%20ID_Detail_Proc]
*	ENDIF
*	IF cTBL = "W"
*		cReturnString = cReturnString + [WIPLst%20ID_Detail_Proc]
*	ENDIF	
	cReturnString = cReturnString + [&rs:Command=Render]+"&"+[nID_Detail=]+ALLTRIM(STR(nID_Detail))
	cReturnString = cReturnString + [>]+ALLTRIM(STR(nID_Detail)) +"</a>"+"<br />"
ENDIF

RETURN cReturnString
ENDPROC

********************************************
PROCEDURE HTML_Stock_ID_Detail_Process  
PARAMETERS cTBL, pID_Detail_P, pReturnURL

*m.cHyperLink = HTML_Stock_ID_Detail_Process(TBL,ID_Detail_P,pReturnURL)

PRIVATE cReturnString
cReturnString = ""

cTBL = UPPER(PrepareSQLtxt(cTBL,'TBL',1))
IF LEN(cTBL) = 0
	RETURN " "
ENDIF
PRIVATE nID_Detail_P
nID_Detail_P = PrepareSQLnum(pID_Detail_P,'ID_Detail_Process',-3)
IF nID_Detail_P < 1
	RETURN " "
ENDIF

PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF
	
IF lReturnURL 
	cReturnString = get_Report_Server()+[%2fInventory%2fStockID%2f]
	IF cTBL = "S"
		cReturnString = cReturnString + [StockLst%20Process]
	ENDIF
	IF cTBL = "B"
		cReturnString = cReturnString + [BrokerLst%20Process]
	ENDIF
	IF cTBL = "W"
		cReturnString = cReturnString + [WIPLst%20Process]
	ENDIF	
	*cReturnString = cReturnString + [?nID_Detail=]+ALLTRIM(STR(nID_DETAIL))
	cReturnString = cReturnString + [&rs:Command=Render]+"&"+[nID_Detail_Process=]+ALLTRIM(STR(nID_Detail_P))
ELSE
	*Return HTML Code
	cReturnString = [<a href=]+get_Report_Server()+[%2fInventory%2fStockID%2f]
	IF cTBL = "S"
		cReturnString = cReturnString + [StockLst%20Process]
	ENDIF
	IF cTBL = "B"
		cReturnString = cReturnString + [BrokerLst%20Process]
	ENDIF
	IF cTBL = "W"
		cReturnString = cReturnString + [WIPLst%20Process]
	ENDIF	
	cReturnString = cReturnString + [&rs:Command=Render]+"&"+[nID_Detail_Process=]+ALLTRIM(STR(nID_Detail_P))
*	cReturnString = cReturnString + [?nID_Detail=]+ALLTRIM(STR(nID_Detail_P))
	cReturnString = cReturnString + [>]+ALLTRIM(STR(nID_Detail_P)) +"</a>"+"<br />"
ENDIF

RETURN cReturnString
ENDPROC

******************************************************** 
PROCEDURE HTML_Tracking_Mess 
PARAMETERS pSearch, pReturnURL
*m.cHyperLink = HTML_Tracking_Mess(pSearch,.T.)

PRIVATE cReturnString
cReturnString = ""

IF NOT ( VARTYPE(pSearch) = "C" OR VARTYPE(pSearch) = "N" )
	RETURN " "
ENDIF
PRIVATE cSearch
cSearch = PrepareSQLtxt(pSearch,'Search',100)


**
PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF

IF lReturnURL 
	cReturnString = get_Report_Server()+[%2fOrder+Tracking%2fTracking+Mess&rs:Command=Render]+"&"+[Search=]
	cReturnString = cReturnString + ALLTRIM(cSearch)
ELSE
	*Return HTML Code
	cReturnString = [<a href=]+get_Report_Server()+[%2fOrder+Tracking%2fTracking+Mess&rs:Command=Render]+"&"+[Search=]
	cReturnString = cReturnString + ALLTRIM(cSearch)
	cReturnString = cReturnString + [>]+ALLTRIM(cSearch)+"</a>"+"<br />"
ENDIF

RETURN cReturnString
ENDPROC

******************************************************** 
PROCEDURE HTML_Inv_Rack 
PARAMETERS pAlloy, pForm, pSize, pReturnURL
*m.cHyperLink = HTML_Inv_Rack("625","10",.375,.T.)

PRIVATE cReturnString
cReturnString = ""

PRIVATE cAlloy, cForm, nSize
cAlloy	= PrepareSQLtxt(pAlloy,'Alloy',12)
cForm	= PrepareSQLtxt(pForm,'Form',2)
nSize	= PrepareSQLnum(pSize,'THCK',9,3)

IF LEN(cAlloy)=0
	RETURN " "
ENDIF
IF LEN(cForm)=0
	RETURN " "
ENDIF
IF nSize=0
	RETURN " "
ENDIF

PRIVATE cParameters, cText
*+CHR(38)+ 
cParameters =             "&"+"Alloy="+PADR(ALLTRIM(cAlloy),12,'+')
cParameters = cParameters+"&"+"Form=" +ALLTRIM(cForm)
cParameters = cParameters+"&"+"Size="   +ALLTRIM(STR(nSize,9,3))
cParameters = STRTRAN(cParameters,' ','%20')

cText = " Alloy="+ALLTRIM(cAlloy)+" Form=" +ALLTRIM(cForm)+" Size="   +ALLTRIM(STR(nSize,9,3))

PRIVATE lReturnURL
lReturnURL = .T.		&&Other Procs default to False!!!

IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF
*	https://raptor/ReportServer/Pages/ReportViewer.aspx&rs:Command=Render&%2fInventory%2fRack%2fStock+Tray+by+description&Alloy=625+++++++++&Form=10&Size=0.5
IF lReturnURL 
	cReturnString = get_Report_Server()+[%2fInventory%2fRack%2fStock+Tray+by+description&rs:Command=Render]+cParameters
ELSE
	*Return HTML Code
	cReturnString = [<a href=]+get_Report_Server()+[%2fInventory%2fRack%2fStock+Tray+by+description&rs:Command=Render]+cParameters
	cReturnString = cReturnString + [>]+ALLTRIM(cText)+"</a>"+"<br />"
ENDIF

RETURN cReturnString
ENDPROC


******************************************************** 
PROCEDURE HTML_DeepSearchSOitem
PARAMETERS pSOitem, pReturnURL

*m.cHyperLink = HTML_DeepSearchSOitem(pSOitem,.T.)

PRIVATE cReturnString
cReturnString = ""

IF VARTYPE(pSOitem) != "C"
	RETURN " "
ENDIF

PRIVATE cSOitem
cSOitem = PrepareSQLtxt(pSOitem,'SOitem',10)

IF Proper_SO_item(cSOitem) = Proper_SO_item("")
	RETURN " "
ENDIF

PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF

IF lReturnURL 
	cReturnString = get_Report_Server()+[%2fWorkOrder/Find+SOitem+in+WO_Detail&rs:Command=Render]+"&"+[cSOitem=]
	cReturnString = cReturnString + STRTRAN(cSOitem," ","+")
ELSE
	*Return HTML Code
	cReturnString = [<a href=]+get_Report_Server()+[%2fWorkOrder/Find+SOitem+in+WO_Detail&rs:Command=Render]+"&"+[cSOitem=]
	cReturnString = cReturnString + STRTRAN(cSOitem," ","+")
	cReturnString = cReturnString + [>]+cSOitem+"</a>"+"<br />"
ENDIF

RETURN cReturnString
ENDPROC

******************************************************** 
PROCEDURE HTML_PurchaseSpec
PARAMETERS pAlloy, pReturnURL

*m.cHyperLink = HTML_PurchaseSpec(pAlloy,.T.)

PRIVATE cReturnString
cReturnString = ""

IF VARTYPE(pAlloy) != "C"
	RETURN " "
ENDIF

PRIVATE cAlloy
cAlloy = PrepareSQLtxt(pAlloy,'Alloy',12)


PRIVATE lReturnURL
lReturnURL = .F.
IF VARTYPE(pReturnURL) = "L"
	lReturnURL = pReturnURL
ENDIF

IF lReturnURL 
	cReturnString = get_Report_Server()+[%2fPurchasing%2fPurchases%20Boiler%20Plate&rs:Command=Render]+"&"+[Alloy=]
	*[%2fWorkOrder/Find+SOitem+in+WO_Detail&rs:Command=Render]+"&"+[cSOitem=]
	cReturnString = cReturnString + PADR(ALLTRIM(cAlloy),12,'+')
ELSE
	*Return HTML Code
	cReturnString = [<a href=]+get_Report_Server()+[%2fPurchasing%2fPurchases%20Boiler%20Plate&rs:Command=Render]+"&"+[Alloy=]
	cReturnString = cReturnString + PADR(ALLTRIM(cAlloy),12,'+')
	cReturnString = cReturnString + [>]+cAlloy+"</a>"+"<br />"
ENDIF

RETURN cReturnString
ENDPROC

******************************************************** 
PROCEDURE HTML_Escape
PARAMETERS cString

*cString = HTML_Escape(cString)

PRIVATE cReturnString
cReturnString = ""

IF VARTYPE(cString) != "C"
	RETURN ""
ENDIF

cString = ALLTRIM( cString )
PRIVATE cCharacter, cHTMLCharacter, nCharacters, i
cCharacter = ''
cHTMLCharacter = ''
nCharacters = LEN( cString  )

FOR i = 1 TO nCharacters
	cCharacter = SUBSTR(cString, i, 1 )
	DO CASE
	CASE cCharacter = " "
		cHTMLCharacter = "%20"
	CASE cCharacter = "!"
		cHTMLCharacter = "%21"
	CASE cCharacter = ["]
		cHTMLCharacter = "%22"
	CASE cCharacter = "#"
		cHTMLCharacter = "%23"
	CASE cCharacter = "$"
		cHTMLCharacter = "%24"
	CASE cCharacter = "%"
		cHTMLCharacter = "%25"
	CASE cCharacter = "&"
		cHTMLCharacter = "%26"
	CASE cCharacter = "`"
		cHTMLCharacter = "%27"
	CASE cCharacter = "("
		cHTMLCharacter = "%28"
	CASE cCharacter = ")"
		cHTMLCharacter = "%29"
	CASE cCharacter = "*"
		cHTMLCharacter = "%2A"
	CASE cCharacter = "+"
		cHTMLCharacter = "%2B"
	CASE cCharacter = "'"
		cHTMLCharacter = "%2C"
	CASE cCharacter = ","
		cHTMLCharacter = "%2D"
	CASE cCharacter = "-"
		cHTMLCharacter = "%2E"
	CASE cCharacter = "."
		cHTMLCharacter = "%2f"
	OTHERWISE
		cHTMLCharacter = cCharacter 
	ENDCASE 
	cReturnString = cReturnString + cHTMLCharacter
NEXT i

RETURN cReturnString
ENDPROC

********************************************************
PROCEDURE getPOStockString 

PRIVATE cReturnString
cReturnString = "All for Stock,Mostly Stock,Some Stock,No Stock,Not 2 HPA"
RETURN cReturnString

ENDPROC

********************************************************
PROCEDURE getShipWhereString 

PRIVATE cReturnString
*cReturnString = "HPA Tipton,Direct,Blind,Service,HPA Windfall"
cReturnString = "HPA Tipton,Direct2Cust,Blind,Service_Conv,HPA Windfall,Remote Stock"
RETURN cReturnString

ENDPROC

********************************************************
PROCEDURE PU_Unit 
PARAMETERS cUnit
*Returns the PricingUnit from the UNIT text

IF VARTYPE(cUnit) != "C"
	RETURN 0
ENDIF

PRIVATE nReturn
nReturn = 0

DO CASE
CASE UPPER(ALLTRIM(cUnit)) = "$/#"
	nReturn = 1
CASE UPPER(ALLTRIM(cUnit)) = "$/FT"
	nReturn = 2
CASE UPPER(ALLTRIM(cUnit)) = "$/PC"
	nReturn = 3
CASE UPPER(ALLTRIM(cUnit)) = "$/LOT"
	nReturn = 4
ENDCASE

RETURN nReturn

ENDPROC
********************************************************

*!*	PROCEDURE Calc_TotalValue 
*!*	PARAMETERS nCostValue, nPweight, nPFt, nPPc, nPU
*!*	*DEPRICATED
*!*	*Returns the TotalCost using correct PU
*!*	*Calc_StockCost(D.CostValue, P.Pweight, P.PFt, nPPc, P.PU)

*!*	IF VARTYPE(nCostValue) != "N" AND VARTYPE(nCostValue) != "Y"
*!*		RETURN 0
*!*	ENDIF
*!*	IF VARTYPE(nPU) != "N" AND VARTYPE(nPU) != "Y"
*!*		RETURN 0
*!*	ENDIF

*!*	PRIVATE nReturn
*!*	nReturn = 0

*!*	DO CASE
*!*	CASE nPU = 1
*!*		IF VARTYPE(nPweight) != "N" AND VARTYPE(nPweight) != "Y"
*!*			nPweight = 0
*!*		ENDIF
*!*		nReturn = nCostValue * nPweight
*!*		*Per LB
*!*	CASE nPU = 2
*!*		*Per Foot
*!*		IF VARTYPE(nPFt) != "N" AND VARTYPE(nPFt) != "Y"
*!*			nPFt= 0
*!*		ENDIF
*!*		nReturn = nCostValue * nPFt
*!*	CASE nPU = 3
*!*		*Per PC
*!*		IF VARTYPE(nPPc) != "N" AND VARTYPE(nPPc) != "Y"
*!*			nPPc= 0
*!*		ENDIF
*!*		nReturn = nCostValue * nPPc
*!*	CASE nPU = 4
*!*		*lot
*!*		nReturn = nCostValue * 1
*!*	ENDCASE

*!*	RETURN nReturn

*!*	ENDPROC

********************************************************

PROCEDURE DescriptionMetricReport
PARAMETERS nPieces, cForm, nThck, nSZ2, nSZ3, nWeight, lRandLen, lMetric, cSz1orig, cSz2orig, cSz3orig, nConn
*Returns Description
**SELECT dbo.f_DescriptionMetricReport(nPieces, cForm, nThck, nSZ2, nSZ3, nWeight, lRandLen, lMetric, cSz1orig, cSz2orig, cSz3orig)
PRIVATE cReturn
cReturn = ''

IF VARTYPE(nPieces) != "N"
	nPieces = 0
ENDIF
IF VARTYPE(cForm) != "C"
	cForm = ''
ENDIF
IF VARTYPE(nThck) != "N"
	nThck = 0
ENDIF
IF VARTYPE(nSZ2) != "N"
	nSZ2 = 0
ENDIF
IF VARTYPE(nSZ3) != "N"
	nSZ3 = 0
ENDIF
IF VARTYPE(nWeight) != "N"
	nWeight = 0
ENDIF
IF VARTYPE(lRandLen) != "L"
	lRandLen = .F.
ENDIF
IF VARTYPE(lMetric) != "L"
	lMetric = .F.
ENDIF
IF VARTYPE(cSz1orig) != "C"
	cSz1orig = ''
ENDIF
IF VARTYPE(cSz2orig) != "C"
	cSz2orig = ''
ENDIF
IF VARTYPE(cSz3orig) != "C"
	cSz3orig = ''
ENDIF

IF VARTYPE(nConn) != "N"
	nConn = 0 
ENDIF
IF nConn < 1
	nConn = get_SQLSTRINGCONNECT() 
	lCloseConn = .T.
ELSE
	lCloseConn = .F.
ENDIF
nConn = CheckSQLConnection(nConn)


PRIVATE cAlias 
cAlias = ALIAS()
PRIVATE cSQL, nSQLEXEC 

IF USED("tmpPH_tmpF_Descript")
	USE IN tmpPH_tmpF_Descript
ENDIF

cSQL = "SELECT dbo.f_DescriptionMetricReport("
cSQL = cSQL + " "+STR(nPieces)
cSQL = cSQL + ",'"+cForm+"'"
cSQL = cSQL + ","+STR(nThck,10,4)
cSQL = cSQL + ","+STR(nSZ2,9,3)
cSQL = cSQL + ","+STR(nSZ3,9,3)
cSQL = cSQL + ","+STR(nWeight,7,1)
cSQL = cSQL + ","+IIF(lRandLen,'1','0')
cSQL = cSQL + ","+IIF(lMetric,'1','0')
cSQL = cSQL + ",'"+cSz1orig+"'"
cSQL = cSQL + ",'"+cSz2orig+"'"
cSQL = cSQL + ",'"+cSz3orig+"'"
cSQL = cSQL + " ) AS Descript "

SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPH_tmpF_Descript')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPH_tmpF_Descript' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPH_tmpF_Descript")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPH_tmpF_Descript")

		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	SQLEXECError(cSQL,nConn, nSQLEXEC, 'tmpF_Descript')
	RecordError(nSQLEXEC,"SQL Error" ,"Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
ENDIF

IF USED('tmpPH_tmpF_Descript')
	IF RECCOUNT('tmpPH_tmpF_Descript') > 0
		cReturn = tmpPH_tmpF_Descript.Descript
	ELSE
		cReturn = ''
	ENDIF
ENDIF

IF USED('tmpPH_tmpF_Descript')
	USE IN tmpPH_tmpF_Descript
ENDIF


IF lCloseConn
	SQLDISCONNECT( nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cReturn
ENDPROC
********************************************************

PROCEDURE Encode2D
PARAMETERS cInput
*Returns the 2D Encoding -DEPRICATED
*-- replaced with EncodeToDataMatrixString 2019

IF VARTYPE(cInput) = "N"
	*cInput = Remove0(cInput)
	cInput = STR(cInput)
ENDIF
IF  VARTYPE(cInput) = "Y"
	cInput = STR(cInput,18,4)
ENDIF
cInput = ALLTRIM(cInput)

IF VARTYPE(cInput) != "C"
	WAIT WINDOW "Encode2D Parameter error"
	RecordError(0,"Encode2D Parameter error","Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(), "Encode2D Parameter error")

	RETURN ""
ENDIF

******
PRIVATE o2D, cReturn
cReturn = ''
TRY 
*	RecordError(0,0,"Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(), "o2D = CREATEOBJECT(DataMatrix.net.BarCode)")
	o2D = CREATEOBJECT("DataMatrix.net.BarCode")
*	o2D = CREATEOBJECT("DataMatrix.net")
	cReturn = o2D.CodeString(cInput)
CATCH
	RecordError(0,0,"Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(), "o2D = CREATEOBJECT('DataMatrix.net.BarCode')")
	*TrackError("Problem Memo","Title C254", PROGRAM(), LINENO(1))
	MESSAGEBOX([CREATEOBJECT("DataMatrix.net.BarCode")]+CHR(13)+"has failed!"+CHR(13)+"Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),0+16,"Will not print right.")
ENDTRY
*
RELEASE o2D
******

RETURN cReturn
ENDPROC
********************************************************

PROCEDURE EncodeToDataMatrixString
PARAMETERS cInput
*Returns the 2D DataMatrix = EncodeToDataMatrixString('123456')

IF VARTYPE(cInput) = "N"
	*cInput = Remove0(cInput)
	cInput = STR(cInput)
ENDIF
IF  VARTYPE(cInput) = "Y"
	cInput = STR(cInput,18,4)
ENDIF
cInput = ALLTRIM(cInput)

IF VARTYPE(cInput) != "C"
	WAIT WINDOW "EncodeToDataMatrixString Parameter error"
	RecordError(0,"EncodeToDataMatrixString Parameter error","Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(), "EncodeToDataMatrixString Parameter error")

	RETURN ""
ENDIF

******
PRIVATE o2D, cReturn
cReturn = ''
TRY 
*	RecordError(0,0,"Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(), "o2D = CREATEOBJECT(DataMatrix.net.BarCode)")
	o2D = CREATEOBJECT("DataMatrix.Net.BarCode")

	cReturn = o2D.EncodeToDataMatrixString(cInput)
CATCH
	*Brandon wrote the DataMatrix.net.dll " --uses .NetFramework 3.5
	*cmd prompt as Administrator! "C:\Windows\Microsoft.NET\Framework\v4.0.30319\RegAsm" "C:\Program Files (x86)\HPA\INCLUDE\DataMatrix.net.dll" /codebase
	
	RecordError(0,0,"Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(), "o2D = CREATEOBJECT('DataMatrix.Net.BarCode')"+CHR(13)+"DataMatrix.net.dll"+CHR(13)+[Source: "C:\Program Files (x86)\HPA\INCLUDE\DataMatrix.net.dll"; DestDir: "{sys}"; ]+CHR(13)+[Filename: "C:\Windows\Microsoft.NET\Framework\v4.0.30319\RegAsm"; Parameters: "C:\Program Files (x86)\HPA\INCLUDE\DataMatrix.net.dll /codebase";   Description: "to run DataMatrix"; Flags: postinstall shellexec skipifsilent]+CHR(13)+CHR(13)+[cmd prompt as Administrator! "C:\Windows\Microsoft.NET\Framework\v4.0.30319\RegAsm" "C:\Program Files (x86)\HPA\INCLUDE\DataMatrix.net.dll" /codebase] )
	MESSAGEBOX([CREATEOBJECT("DataMatrix.Net.BarCode")]+CHR(13)+"has failed!"+CHR(13)+"Proc_ERP:"+PROGRAM(),0+16,"Will not print right.")
ENDTRY
*
RELEASE o2D
******

RETURN cReturn
ENDPROC
********************************************************

PROCEDURE EncDM
PARAMETERS cInput
*Returns the Data Matrix Encoding

IF VARTYPE(cInput) = "N"
	*cInput = Remove0(cInput)
	cInput = STR(cInput)
ENDIF
IF  VARTYPE(cInput) = "Y"
	cInput = STR(cInput,18,4)
ENDIF
cInput = ALLTRIM(cInput)

IF VARTYPE(cInput) != "C"
	WAIT WINDOW "EncDM Parameter error"
	RecordError(0,"EncDM Parameter error","Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(), "EncDM Parameter error")

	RETURN ""
ENDIF

******
PRIVATE o2D, cReturn
cReturn = ''
TRY 
	o2D = CREATEOBJECT("DMATRIXLib.Datamatrix")
	cReturn = o2D.FontEncode(cInput)
CATCH
	RecordError(0,0,"Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(), "o2D = CREATEOBJECT(DMATRIXLib.Datamatrix)")
	MESSAGEBOX([CREATEOBJECT("DMATRIXLib.Datamatrix")]+CHR(13)+"has failed!"+CHR(13)+"Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),0+16,"Will not print right.")
ENDTRY

RELEASE o2D
******

RETURN cReturn
ENDPROC
********************************************************

PROCEDURE Convert_Fractions_to_Numeric
PARAMETERS cInput
*Returns Numeric evan if string Fraction.

IF VARTYPE(cInput) = "N"
	*cInput = Remove0(cInput)
	cInput = STR(cInput)
ENDIF
IF  VARTYPE(cInput) = "Y"
	cInput = STR(cInput,18,4)
ENDIF
cInput = ALLTRIM(cInput)

IF VARTYPE(cInput) != "C"
	WAIT WINDOW "Convert_Fractions_to_Numeric Parameter error"
	RecordError(0,"Convert_Fractions_to_Numeric Parameter error","Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(), "Convert_Fractions_to_Numeric Parameter error")
	*RecordError(Pnerror, Pmess1, Pcprogram, Pnlineno, pMess)
	RETURN 0
ENDIF

******
PRIVATE nReturn, cInt, cFraction, cNomimator, cDenotminator, nInt, nDecimal 
nReturn = 0
cInt=''
cFraction=''
cNomimator=''
cDenotminator=''
nInt = 0
nDecimal  = 0

IF AT(".",cInput)>0
	cInt = LEFT(cInput,AT([.],cInput)-1)
	nInt = VAL(cInt)
	cFraction = "." +RIGHT(cInput, LEN(cInput)-AT([.],cInput) ) 
ENDIF
IF AT("-",cInput)>0
	cInt = LEFT(cInput,AT([-],cInput)-1)
	nInt = VAL(cInt)
	cFraction = RIGHT(cInput, LEN(cInput)-AT([-],cInput) ) 
ENDIF

IF AT("/",cInput)>0
	cNomimator = LEFT(cFraction ,AT([/],cFraction )-1)
	cDenotminator =  RIGHT(cFraction , LEN(cFraction )-AT([/],cFraction ) ) 
ELSE
	IF EMPTY(cInt)
		*Must All be Int
		*No .- or /
		cInt  = cInput
		nInt = VAL(cInt)
	ENDIF
ENDIF

IF LEN(cFraction)>0
	IF LEN(cNomimator)>0
		nDecimal = VAL(cNomimator) / VAL(cDenotminator)
	ELSE
		*Fraction needs no math.
		nDecimal = VAL(cFraction)
	ENDIF
ENDIF

** Build Return
IF nInt = 0
	IF nDecimal > 0
		nReturn = nDecimal 
	ELSE
		nReturn = 0
	ENDIF
ELSE
	IF nDecimal > 0
		nReturn = nInt + nDecimal 
	ELSE
		nReturn = nInt 
	ENDIF
ENDIF

RETURN nReturn
ENDPROC
********************************************************

PROCEDURE GetStreetAddress
PARAMETERS cCompany,cCustID, nConn
*Returns Street Address
**cAddress = GetStreetAddress(cCompany,cCustID, nConn)

IF VARTYPE(cCompany) != "C"
	cCompany= ''
ENDIF
IF VARTYPE(cCustID) != "C"
	cCustID= ''
ENDIF


IF VARTYPE(nConn) != "N"
	nConn = 0 
ENDIF
IF nConn < 1
	nConn = get_SQLSTRINGCONNECT() 
	lCloseConn = .T.
ELSE
	lCloseConn = .F.
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE cReturn
cReturn = ''


PRIVATE cAlias 
cAlias = ALIAS()
PRIVATE cSQL, nSQLEXEC 

IF USED("tmpPH_tmpStreetAddr")
	USE IN tmpPH_tmpStreetAddr
ENDIF

IF NOT EMPTY(cCustID)
	cSQL = "SELECT Addr1,Addr2 "
	cSQL = cSQL + " FROM dbo.SoldAddr "
	cSQL = cSQL + " WHERE Customer = '"+cCustID+"'"
	cSQL = cSQL + " AND LEN(Addr1)>0"
	
	SELECT 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPH_tmpStreetAddr')

	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPH_tmpStreetAddr' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPH_tmpStreetAddr")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPH_tmpStreetAddr")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL,nConn, nSQLEXEC, 'tmpPH_tmpStreetAddr')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF

	IF USED('tmpPH_tmpStreetAddr')
		IF RECCOUNT('tmpPH_tmpStreetAddr') > 0
			cReturn = tmpPH_tmpStreetAddr.Addr1
			IF "PO" $ UPPER(LEFT(cReturn,3))
				*Do not use a PO Box
				IF NOT EMPTY(tmpPH_tmpStreetAddr.Addr2)
					cReturn = tmpPH_tmpStreetAddr.Addr2
				ENDIF
			ENDIF
		ELSE
			cReturn = ''
		ENDIF
	ENDIF
ENDIF

IF NOT EMPTY(cCompany) AND EMPTY(cReturn)
	
	cSQL = "SELECT Addr1,Addr2 "
	cSQL = cSQL + " FROM dbo.SoldAddr "
	cSQL = cSQL + " WHERE Company = '"+cCompany+"'"
	cSQL = cSQL + " AND LEN(Addr1)>0"
	
	IF USED('tmpPH_tmpStreetAddr')
		USE IN tmpPH_tmpStreetAddr
	ENDIF
	SELECT 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPH_tmpStreetAddr')

	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPH_tmpStreetAddr' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPH_tmpStreetAddr")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPH_tmpStreetAddr")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL,nConn, nSQLEXEC, 'tmpPH_tmpStreetAddr')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF

	IF USED('tmpPH_tmpStreetAddr')
		IF RECCOUNT('tmpPH_tmpStreetAddr') > 0
			cReturn = tmpPH_tmpStreetAddr.Addr1
			IF "PO" $ UPPER(LEFT(cReturn,3))
				*Do not use a PO Box
				IF NOT EMPTY(tmpPH_tmpStreetAddr.Addr2)
					cReturn = tmpPH_tmpStreetAddr.Addr2
				ENDIF
			ENDIF
		ELSE
			cReturn = ''
		ENDIF
	ENDIF
ENDIF

IF USED('tmpPH_tmpStreetAddr')
	USE IN tmpPH_tmpStreetAddr
ENDIF


IF lCloseConn
	SQLDISCONNECT( nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cReturn
ENDPROC

*********************************

PROCEDURE get_SoldTo
PARAMETERS nSoldAddr,cWhat, nConn
*Returns What String for the nCode
*cSoldToFax = get_ShipTo(ThisFormSet.SoldAddr,'Fax',ThisFormSet.nConnHandle)

IF VARTYPE(nSoldAddr) != "N"
	nSoldAddr = 0
	RETURN ''
ENDIF
IF VARTYPE(cWhat) != "C"
	cWhat = ''
	RETURN ''
ELSE
	cWhat = UPPER(ALLTRIM(cWhat))
ENDIF


IF VARTYPE(nConn) != "N"
	nConn = 0 
ENDIF
IF nConn < 1
	nConn = get_SQLSTRINGCONNECT() 
	lCloseConn = .T.
ELSE
	lCloseConn = .F.
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE cReturn
cReturn = ''


PRIVATE cAlias 
cAlias = ALIAS()
PRIVATE cSQL, nSQLEXEC 

IF USED("tmpPH_tmpStreetAddr")
	USE IN tmpPH_tmpStreetAddr
ENDIF

DO CASE
CASE cWhat = "COMPANY"
	cSQL = "SELECT Company AS cSTRING  "
CASE cWhat = "CITY"
	cSQL = "SELECT City AS cSTRING  "
CASE cWhat = "ST"
	cSQL = "SELECT ST AS cSTRING  "
CASE cWhat = "STATE"
	cSQL = "SELECT ST AS cSTRING  "
CASE cWhat = "COUNTRY"
	cSQL = "SELECT Country AS cSTRING  "
CASE cWhat = "CONTACT"
	cSQL = "SELECT Contact AS cSTRING  "
CASE cWhat = "PHONE"
	cSQL = "SELECT TelePhone AS cSTRING "
CASE cWhat = "FAX"
	cSQL = "SELECT Fax_Number AS cSTRING "
CASE cWhat = "EMAIL"
	cSQL = "SELECT Email AS cSTRING  "
OTHERWISE
	cSQL = ''
ENDCASE

IF NOT EMPTY(cSQL)
	cSQL = cSQL + " FROM dbo.SoldAddr "
	cSQL = cSQL + " WHERE SoldCode = "+STR(nSoldAddr)

	
	SELECT 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPH_tmpStreetAddr')

	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPH_tmpStreetAddr' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPH_tmpStreetAddr")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPH_tmpStreetAddr")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL,nConn, nSQLEXEC, 'tmpPH_tmpStreetAddr')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF

	IF USED('tmpPH_tmpStreetAddr')
		IF RECCOUNT('tmpPH_tmpStreetAddr') > 0
			cReturn = tmpPH_tmpStreetAddr.cSTRING  
		ELSE
			cReturn = ''
		ENDIF
	ENDIF
ENDIF


IF USED('tmpPH_tmpStreetAddr')
	USE IN tmpPH_tmpStreetAddr
ENDIF


IF lCloseConn
	SQLDISCONNECT( nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cReturn
ENDPROC

*********************************
PROCEDURE have_Customer_List_Notes
PARAMETERS cCustID, pConnHandle
*IF have_Customer_List_Notes(cCustomerID, ThisForm.nConnHandle )


IF VARTYPE(cCustID) != "C"
	RecordError( 0, 'PARAMETERS ', "Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"VFP message: No cCustID Parameter" )
	RETURN .F.
ENDIF

PRIVATE lReturn
lReturn = .F.

PRIVATE lNewConn, nConn
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
		lNewConn = .F.
	ELSE
		nConn = get_SQLSTRINGCONNECT()
		lNewConn = .T.
	ENDIF
ELSE
	nConn = get_SQLSTRINGCONNECT()
	lNewConn = .T.
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE cAlias 
cAlias = ALIAS()


IF USED("tmpPH_tmpCustID")
	USE IN tmpPH_tmpCustID
ENDIF

cSQL = "SELECT COUNT(*) as CNTD "
cSQL = cSQL + " FROM dbo.Customer_List_Notes "
cSQL = cSQL + " WHERE CustomerID = '"+cCustID+"'"
*cWhat Notes
*cWhat IND_Type


SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPH_tmpCustID')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPH_tmpCustID' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPH_tmpCustID")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPH_tmpCustID")

		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	SQLEXECError(cSQL,nConn, nSQLEXEC, 'tmpPH_tmpCustID')
	RecordError(nSQLEXEC,"SQL Error" ,"Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
ENDIF

IF USED('tmpPH_tmpCustID')
	IF RECCOUNT('tmpPH_tmpCustID') > 0
		IF tmpPH_tmpCustID.CNTD > 0
			lReturn = .T.
		ENDIF
	ENDIF
	USE IN tmpPH_tmpCustID
ENDIF


IF lNewConn 
	SQLDISCONNECT( nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lReturn
ENDPROC

*********************************
PROCEDURE get_ShipTo
PARAMETERS nShipAddr,cWhat, nConn
*Returns What String for the nCode

IF VARTYPE(nShipAddr) != "N"
	nShipAddr = 0
	RETURN ''
ENDIF
IF VARTYPE(cWhat) != "C"
	cWhat = ''
	RETURN ''
ELSE
	cWhat = UPPER(ALLTRIM(cWhat))
ENDIF


IF VARTYPE(nConn) != "N"
	nConn = 0 
ENDIF
IF nConn < 1
	nConn = get_SQLSTRINGCONNECT() 
	lCloseConn = .T.
ELSE
	lCloseConn = .F.
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE cReturn
cReturn = ''


PRIVATE cAlias 
cAlias = ALIAS()
PRIVATE cSQL, nSQLEXEC 

IF USED("tmpPH_tmpStreetAddr")
	USE IN tmpPH_tmpStreetAddr
ENDIF

DO CASE
CASE cWhat = "COMPANY"
	cSQL = "SELECT Company AS cSTRING  "
CASE cWhat = "CITY"
	cSQL = "SELECT City AS cSTRING  "
CASE cWhat = "ST"
	cSQL = "SELECT ST AS cSTRING  "
CASE cWhat = "STATE"
	cSQL = "SELECT ST AS cSTRING  "
CASE cWhat = "COUNTRY"
	cSQL = "SELECT Country AS cSTRING  "
CASE cWhat = "CONTACT"
	cSQL = "SELECT Contact AS cSTRING  "
CASE cWhat = "PHONE"
	cSQL = "SELECT TelePhone AS cSTRING "
CASE cWhat = "FAX"
	cSQL = "SELECT Fax_Number AS cSTRING "
CASE cWhat = "EMAIL"
	cSQL = "SELECT Email AS cSTRING  "
OTHERWISE
	cSQL = ''
ENDCASE

IF NOT EMPTY(cSQL)
	cSQL = cSQL + " FROM dbo.ShipAddr "
	cSQL = cSQL + " WHERE ShipCode = "+STR(nShipAddr)

	
	SELECT 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPH_tmpStreetAddr')

	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPH_tmpStreetAddr' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPH_tmpStreetAddr")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPH_tmpStreetAddr")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL,nConn, nSQLEXEC, 'tmpPH_tmpStreetAddr')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF

	IF USED('tmpPH_tmpStreetAddr')
		IF RECCOUNT('tmpPH_tmpStreetAddr') > 0
			cReturn = tmpPH_tmpStreetAddr.cSTRING  
		ELSE
			cReturn = ''
		ENDIF
	ENDIF
ENDIF


IF USED('tmpPH_tmpStreetAddr')
	USE IN tmpPH_tmpStreetAddr
ENDIF


IF lCloseConn
	SQLDISCONNECT( nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cReturn
ENDPROC
*********************************

PROCEDURE GetAlloyStandard 
PARAMETER cAlloy, pConnHandle
*GetAlloyStandard(cAlloy,nConnHandle)
*Returns the Standard from Alloys table

IF VARTYPE(cAlloy) != "C"
	cAlloy = " "
ENDIF
PRIVATE cReturnAlloy
cReturnAlloy = ''

PRIVATE pConn, lNewConn
lNewConn = .F.
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		pConn = pConnHandle
	ELSE
		pConn = get_SQLSTRINGCONNECT()
		lNewConn = .T.
	ENDIF
ELSE
	pConn = get_SQLSTRINGCONNECT()
	lNewConn = .T.
ENDIF
pConn = CheckSQLConnection(pConn)

PRIVATE cSQL, nSQLEXEC 
cAlloy = STRTRAN(cAlloy,CHR(9)," ")  &&change Horizantal Tab to Space
cAlloy = PrepareSQLtxt( cAlloy, 'Alloy', 12 )

PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPH_tmpSqlAns')
	USE IN tmpPH_tmpSqlAns
ENDIF
SELECT 0

IF pConn > 0
	cSQL = "SELECT Alloy FROM dbo.Alloys WHERE Alloys = "
	cSQL = cSQL + "'"+ cAlloy+ "'"

	
	nSQLEXEC = SQLEXEC(pConn, cSQL, 'tmpPH_tmpSqlAns' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(pConn, cSQL, 'tmpPH_tmpSqlAns' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(pConn, cSQL, "tmpPH_tmpSqlAns")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(pConn, cSQL, "tmpPH_tmpSqlAns")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL,pConn,nSQLEXEC, 'tmpPH_tmpSqlAns')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(), cSQL )
	ENDIF
	
	IF lNewConn 
		SQLDISCONNECT(pConn )
	ENDIF
	
	IF USED('tmpPH_tmpSqlAns')
		IF VARTYPE(tmpPH_tmpSqlAns.Alloy) = "C"
			cReturnAlloy = tmpPH_tmpSqlAns.Alloy
		ENDIF
		USE IN tmpPH_tmpSqlAns
	ENDIF
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cReturnAlloy
ENDPROC


*********************************

PROCEDURE GetFormStandard
PARAMETER cForm
*GetFormStandard(cForm)
*Returns the Standard Form Digits

IF VARTYPE(cForm) != "C"
	cForm= " "
ENDIF
PRIVATE cReturnForm
cReturnForm = cForm

IF NOT EMPTY(cForm) 
	DO CASE
	CASE VAL(cForm)> 0 AND VAL(cForm)<100
		cReturnForm= cForm
	CASE UPPER(cForm) = "BAR"
		cReturnForm= '10'
	CASE UPPER(cForm) = "FLAT BAR"
		cReturnForm= '11'
	CASE UPPER(cForm) = "HEX"
		cReturnForm= '12'
	CASE UPPER(cForm) = "WIRE"
		cReturnForm= '20'

	CASE "DIA" $ UPPER(cForm)
		cReturnForm= '10'

	CASE UPPER(cForm) = "PLATE"
		cReturnForm= '40'
	CASE UPPER(cForm) = "SHEET"
		cReturnForm= '40'
	CASE UPPER(cForm) = "COIL"
		cReturnForm= '52'


	CASE UPPER(cForm) = "TUBE"
		cReturnForm= '60'
	CASE UPPER(cForm) = "PIPE"
		cReturnForm= '65'

	CASE UPPER(cForm) = "NIPPLE"
		cReturnForm= '66'
	CASE UPPER(cForm) = "ELBOW"
		cReturnForm= '66'
	CASE UPPER(cForm) = "TEE"
		cReturnForm= '68'
	CASE UPPER(cForm) = "REDUCER"
		cReturnForm= '69'
	CASE UPPER(cForm) = "FITTING"
		cReturnForm= '70'
	CASE UPPER(cForm) = "COUPL"
		cReturnForm= '71'
	CASE UPPER(cForm) = "FLANGE"
		cReturnForm= '72'

	CASE UPPER(cForm) = "BOLT"
		cReturnForm= '75'
	CASE UPPER(cForm) = "FASTEN"
		cReturnForm= '75'
	ENDCASE	
ENDIF

RETURN cReturnForm
ENDPROC


*********************************
PROCEDURE Alert_Receive_Check 
PARAMETER cWhat,cNumber,pConnHandle
*lSendThisEmail = Alert_Receive_Check("WO_Detail",cOrderNumber,ThisForm.nConnHandle)
*Checks to see if an EMail Send is required
*W,WO_Detail,SOitem_RMA,POitem,POitem,PODLA

IF VARTYPE(cWhat) != "C"
	RETURN .F.
ENDIF
IF VARTYPE(cNumber) != "C"
	RETURN .F.
ENDIF

IF NOT "PROC_SETUP" $ SET("PROCEDURE")  &&Added for when Quotes is run without HPA menu.
	SET PROCEDURE TO Progs\Proc_Setup ADDITIVEF
ENDIF 

PRIVATE pConn, lNewConn
lNewConn = .F.
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		pConn = pConnHandle
	ELSE
		pConn = get_SQLSTRINGCONNECT()
		lNewConn = .T.
	ENDIF
ELSE
	pConn = get_SQLSTRINGCONNECT()
	lNewConn = .T.
ENDIF
pConn = CheckSQLConnection(pConn)


PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPH_tmpSqlAns2')
	USE IN tmpPH_tmpSqlAns2
ENDIF
SELECT 0

PRIVATE cSQL
PRIVATE lSendThisEmail
lSendThisEmail = .F.

IF pConn > 0
	cSQL = ""
	*True if a 'Recieved' Email has been sent.
	DO CASE
	CASE cWhat = "PODLA"
		cSQL = "SELECT DLAE AS [RcvdE] FROM dbo.PurchaseOrder WHERE POitem = dbo.f_ProperPOitem('"+cNumber+"')"
	CASE cWhat = "POitem"
		cSQL = "SELECT RcvdE FROM dbo.PurchaseOrder WHERE POitem = dbo.f_ProperPOitem('"+cNumber+"')"
	CASE cWhat == "SOitem"
		cSQL = "SELECT RcvdE FROM dbo.Sales WHERE SOitem = dbo.f_ProperSOitem('"+cNumber+"')"
	CASE cWhat = "SOitem_RMA"
		cSQL = "SELECT RcvdE FROM dbo.WorkOrder WHERE WO = "+cNumber
	CASE cWhat == "WO"
		cSQL = "SELECT RcvdE FROM dbo.WorkOrder WHERE WO = "+cNumber
	CASE cWhat = "WO_Detail"
		cSQL = "SELECT RcvdE FROM dbo.WorkOrder_Detail WHERE WO_Detail = "+cNumber	
*	CASE cWhat = "ID_DETAIL"
*		cSQL = "SELECT RcvdE FROM dbo.WorkOrder_Detail WHERE WO_Detail = "+cNumber	
	OTHERWISE
		IF NOT EMPTY(cAlias)
			IF USED(cAlias)
				SELECT (cAlias)
			ELSE
				RecordTest("Record Test Data.","Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
			ENDIF
		ENDIF

		RETURN .F.
	ENDCASE
	
	IF LEN(cSQL) > 1
		nSQLEXEC = SQLEXEC(pConn, cSQL, 'tmpPH_tmpSqlAns2' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(pConn, cSQL, 'tmpPH_tmpSqlAns2' )
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(pConn, cSQL, "tmpPH_tmpSqlAns2")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(pConn, cSQL, "tmpPH_tmpSqlAns2")

				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, pConn, nSQLEXEC, 'tmpPH_tmpSqlAns2')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
		
		IF lNewConn 
			SQLDISCONNECT(pConn)
		ENDIF
		
		IF USED('tmpPH_tmpSqlAns2')
			IF RECCOUNT('tmpPH_tmpSqlAns2') = 0
				lSendThisEmail = .F.
			ELSE
				IF ISNULL(tmpPH_tmpSqlAns2.RcvdE)
					lSendThisEmail = .T.
				ELSE
					IF PrepareSQLlogic(tmpPH_tmpSqlAns2.RcvdE,'RcvdE') &&This line had type mismatch error in 3.1.21
						lSendThisEmail = .F.
					ELSE
						*RcvdE = 0
						lSendThisEmail = .T.
					ENDIF
				ENDIF
			ENDIF
			
			USE IN tmpPH_tmpSqlAns2
		ENDIF
	ENDIF
	
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lSendThisEmail
ENDPROC

*********************************
PROCEDURE Alert_Receive_Mark 
PARAMETER cWhat,cNumber,pConnHandle
*lSentEmailMarked = Alert_Receive_Mark("WO_Detail",cOrderNumber,ThisForm.nConnHandle)
*W,WO_Detail,SOitem_RMA,POitem,POitem,PODLA

IF VARTYPE(cWhat) != "C"
	RETURN .F.
ENDIF
IF VARTYPE(cNumber) != "C"
	RETURN .F.
ENDIF

IF NOT "PROC_SETUP" $ SET("PROCEDURE")  &&Added for when Quotes is run without HPA menu.
	SET PROCEDURE TO Progs\Proc_Setup ADDITIVEF
ENDIF 

PRIVATE pConn, lNewConn
lNewConn = .F.
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		pConn = pConnHandle
	ELSE
		pConn = get_SQLSTRINGCONNECT()
		lNewConn = .T.
	ENDIF
ELSE
	pConn = get_SQLSTRINGCONNECT()
	lNewConn = .T.
ENDIF
pConn = CheckSQLConnection(pConn)

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL
PRIVATE lSentEmailMarked
lSentEmailMarked = .F.

IF pConn > 0
	cSQL = ""
	*True if a 'Received' Email has been sent.
	DO CASE
	CASE cWhat = "PODLA"
		cSQL = "UPDATE dbo.PurchaseOrder SET DLAE=1 WHERE POitem = dbo.f_ProperPOitem('"+cNumber+"')"
		*True if  DLA Email has been sent to QA.
	CASE cWhat = "POitem"
		cSQL = "UPDATE dbo.PurchaseOrder SET RcvdE=1 WHERE POitem = dbo.f_ProperPOitem('"+cNumber+"')"
	CASE cWhat == "SOitem"
		cSQL = "UPDATE dbo.Sales SET RcvdE=1 WHERE SOitem = dbo.f_ProperSOitem('"+cNumber+"')"
	CASE cWhat = "SOitem_RMA"
		cSQL = "UPDATE dbo.Sales SET RMA_E=1 WHERE SOitem = dbo.f_ProperSOitem('"+cNumber+"')"
	CASE cWhat == "WO"
		cSQL = "UPDATE dbo.WorkOrder SET RcvdE=1 WHERE WO = "+cNumber
	CASE cWhat = "WO_Detail"
		cSQL = "UPDATE dbo.WorkOrder_Detail SET RcvdE=1 WHERE WO_Detail = "+cNumber		
	OTHERWISE
		*FAIL
		IF NOT EMPTY(cAlias)
			IF USED(cAlias)
				SELECT (cAlias)
			ELSE
				RecordTest("Record Test Data.","Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
			ENDIF
		ENDIF

		RETURN .F.
	ENDCASE
	
	IF LEN(cSQL) > 1
		nSQLEXEC = SQLEXEC(pConn, cSQL )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(pConn, cSQL )
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(pConn, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(pConn, cSQL, "")

				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, pConn, nSQLEXEC )
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ELSE
			lSentEmailMarked = .T.
		ENDIF
		
		IF lNewConn 
			SQLDISCONNECT(pConn)
		ENDIF
	ENDIF	
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

RETURN lSentEmailMarked
ENDPROC

********************************************************
PROCEDURE UniqDBF 
PARAMETERS pFileName
*reuse File name if it can be 

IF VARTYPE(pFileName)="C"
	IF ".DBF" $ UPPER(pFileName)
		IF "\MEM" $ SYS(2003)
			IF FILE(SYS(5)+SYS(2003)+"\"+pFileName)
				RETURN pFileName
			ENDIF
		ELSE
			IF FILE(SYS(5)+SYS(2003)+"\MEM\"+pFileName)
				RETURN pFileName
			ENDIF
		ENDIF	
	ENDIF
ENDIF

PRIVATE lFoundDBF
lFoundDBF = .T.

PRIVATE cUniqDBF
cUniqDBF = SYS(3)+".DBF"

DO WHILE lFoundDBF
	IF "\MEM" $ SYS(2003)
		IF FILE(SYS(5)+SYS(2003)+"\"+cUniqDBF )
			cUniqDBF = SYS(3)+".DBF"
		ELSE
			lFoundDBF = .F.
		ENDIF
	ELSE
		*Add the \MEM\
		IF FILE(SYS(5)+SYS(2003)+"\MEM\"+cUniqDBF )
			cUniqDBF = SYS(3)+".DBF"
		ELSE
			lFoundDBF = .F.
		ENDIF
	ENDIF
ENDDO

RETURN cUniqDBF
ENDPROC

********************************************************
PROCEDURE UniqDBFdel 
PARAMETERS pFileName

IF VARTYPE(pFileName) != "C"
	RETURN .F.
ENDIF

IF ".DBF" $ UPPER(pFileName)
	*Place a fail safe so not just any file can be deleted.
	
	IF FILE(SYS(5)+SYS(2003)+"\"+pFileName)
		DELETE FILE (SYS(5)+SYS(2003)+"\"+pFileName)
	ENDIF
	IF FILE(SYS(5)+SYS(2003)+"\MEM\"+pFileName)
		DELETE FILE (SYS(5)+SYS(2003)+"\MEM\"+pFileName)
	ENDIF
ENDIF

RETURN .T.
ENDPROC

******************************************************** 

PROCEDURE Calc_Feet
PARAMETERS nPieces, cForm, nSZ2, nSZ3, nConn
*Returns Feet
*nFeet = Calc_Feet(nPieces, cForm, nSZ2, nSZ3, nConn)

PRIVATE nFeet
nFeet = 0

IF VARTYPE(nPieces) != "N"
	nPieces = 1
ENDIF
IF VARTYPE(cForm) != "C"
	RETURN 0
ENDIF

IF VARTYPE(nSZ2) != "N"
	RETURN 0
ENDIF
IF VARTYPE(nSZ3) != "N"
	nSZ3 = 0
ENDIF

IF VARTYPE(nConn) != "N"
	nConn = 0 
ENDIF
IF nConn < 1
	nConn = get_SQLSTRINGCONNECT() 
	lCloseConn = .T.
ELSE
	lCloseConn = .F.
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE nSigDigit
nSigDigit = getSigDim(cForm, nConn)

DO CASE
CASE nSigDigit = 0
	*PC
	nFeet = nPieces * nSZ2 / 12
CASE nSigDigit = 1
	nFeet = nPieces * nSZ2 / 12
CASE nSigDigit = 2
	nFeet = nPieces * nSZ2 / 12
CASE nSigDigit = 3
	nFeet = nPieces * nSZ3 / 12
CASE nSigDigit = 6
	nFeet = nPieces * nSZ3 / 12
OTHERWISE
	nFeet = 0
ENDCASE

IF lCloseConn
	SQLDISCONNECT( nConn )
ENDIF


RETURN nFeet
ENDPROC

********************************************************
PROCEDURE Board_Sched_Type
PARAMETERS pSched_Type

IF VARTYPE(pSched_Type) != "N"
	RETURN ''
ENDIF

LOCAL m.cCaption
DO CASE
CASE pSched_Type = 1
	m.cCaption = "ROTARY FORGE"
CASE pSched_Type = 2
	m.cCaption = "OPEN DIE PRESS"
CASE pSched_Type = 3
	m.cCaption = "ROLLING"
CASE pSched_Type = 4
	m.cCaption = "DRAWING"
CASE pSched_Type = 5
	m.cCaption = "MACHINE SHOP"
CASE pSched_Type = 6
	m.cCaption = "CUTTING"
CASE pSched_Type = 7
	m.cCaption = "OUTSOURCE"
CASE pSched_Type = 8
	m.cCaption = "TESTING"
CASE pSched_Type = 9
	m.cCaption = "WELDING"
CASE pSched_Type = 10
	m.cCaption = "MAINTENANCE"
OTHERWISE
	m.cCaption = ""
ENDCASE

*!*	DO CASE
*!*	CASE cWindow = "ROTARY FORGE"
*!*		m.nSched_Type = 1
*!*	CASE cWindow = "OPEN DIE PRESS"
*!*		m.nSched_Type = 2
*!*	CASE cWindow = "ROLLING"
*!*		m.nSched_Type = 3
*!*	CASE cWindow = "DRAWING"
*!*		m.nSched_Type = 4
*!*	CASE cWindow = "MACHINE SHOP"
*!*		m.nSched_Type = 5
*!*	CASE cWindow = "CUTTING"
*!*		m.nSched_Type = 6
*!*	CASE cWindow = "OUTSOURCE"
*!*		m.nSched_Type = 7
*!*	CASE cWindow = "TESTING"
*!*		m.nSched_Type = 8
*!*	CASE cWindow = "WELDING"
*!*		m.nSched_Type = 9
*!*	CASE cWindow = "MAINTENANCE"
*!*		m.nSched_Type = 10


RETURN m.cCaption
ENDPROC

******************************************************** 

PROCEDURE RFQ_EmailLog_TO
PARAMETERS cEmail, nConn
*Open messagebox

IF VARTYPE(cEmail) != "C"
	RETURN .F.
ENDIF
cEmail = ALLTRIM(cEmail)

IF VARTYPE(nConn) != "N"
	nConn = 0 
ENDIF
IF nConn < 1
	nConn = get_SQLSTRINGCONNECT() 
	lCloseConn = .T.
ELSE
	lCloseConn = .F.
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPH_tmpSqlAns3')
	USE IN tmpPH_tmpSqlAns3
ENDIF

PRIVATE cSQL
cSQL = " SELECT [To] AS Email,[From] as SalesEmail,[Subject],[DateSent] "
cSQL = cSQL + " FROM [Mail].[dbo].[EmailLog] "
cSQL = cSQL + " WHERE [To] like '%"+cEmail+"%' "
cSQL = cSQL + " ORDER BY EmailNum DESC "

SELECT 0	
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPH_tmpSqlAns3' )
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPH_tmpSqlAns3' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPH_tmpSqlAns3")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPH_tmpSqlAns3")

		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpPH_tmpSqlAns3')
	RecordError(nSQLEXEC,"SQL Error" ,"Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(), cSQL )
ENDIF

IF USED('tmpPH_tmpSqlAns3')
	IF RECCOUNT('tmpPH_tmpSqlAns3') > 0
		PRIVATE nRECCNT, nMess
		nRECCNT = RECCOUNT('tmpPH_tmpSqlAns3')
		SCAN
			cText = "Record "+ALLTRIM(STR( RECNO('tmpPH_tmpSqlAns3')))+" of "+ALLTRIM(STR(nRECCNT))+" "
			cText = cText +CHR(13)+"From: "+ShowSQLtxt(tmpPH_tmpSqlAns3.Email,'Email',100)+" "
			cText = cText +CHR(13)+"To: "+ShowSQLtxt(tmpPH_tmpSqlAns3.SalesEmail,'SalesEmail',100)+" "
			cText = cText +CHR(13)+ShowSQLtxt(tmpPH_tmpSqlAns3.Subject,'Subject',200)+" "
			cText = cText +CHR(13)+TTOC(tmpPH_tmpSqlAns3.DateSent)
			IF RECNO('tmpPH_tmpSqlAns3') < nRECCNT 
				cText = cText +CHR(13)+CHR(13)+"Do you want to see the next record? (Y)"
				nMess = MESSAGEBOX(cText,4+64,"Found in Web RFQ Email Log")
			ELSE
				nMess = MESSAGEBOX(cText+CHR(13)+CHR(13)+"RFQ will not be searched again in this session.",0+64,"Found in Web RFQ Email Log")
			ENDIF
			IF nMess <> 6
				EXIT
			ENDIF
		ENDSCAN
	ENDIF
	USE IN tmpPH_tmpSqlAns3
ENDIF


IF lCloseConn
	SQLDISCONNECT( nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN .T.
ENDPROC
******************************************

PROCEDURE Get_SQL_DateTime
*dtSQL = Get_SQL_DateTime(ThisFormSet.nConnHandle)
PRIVATE dtReturn
dtReturn = CTOT('')

IF NOT "PROC_SETUP" $ SET("PROCEDURE")  &&Added for when Quotes is run without HPA menu.
	SET PROCEDURE TO Progs\Proc_Setup ADDITIVE
ENDIF

PRIVATE pConn, lNewConn
pConn = get_SQLSTRINGCONNECT()
lNewConn = .T.
pConn = CheckSQLConnection(pConn)

PRIVATE cAlias, cSQL
cAlias = ALIAS()

IF USED('tmpPH_tmpSqlAns4')
	USE IN tmpPH_tmpSqlAns4
ENDIF
SELECT 0

IF pConn > 0
	cSQL = "SELECT GETDATE() as [Today]"

	nSQLEXEC = SQLEXEC(pConn, cSQL, 'tmpPH_tmpSqlAns4' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(pConn, cSQL, 'tmpPH_tmpSqlAns4' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(pConn, cSQL, "tmpPH_tmpSqlAns4")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(pConn, cSQL, "tmpPH_tmpSqlAns4")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL,pConn,nSQLEXEC, 'tmpPH_tmpSqlAns4')
			RecordError(nSQLEXEC,"SQL Error","Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
		
	IF USED('tmpPH_tmpSqlAns4')
		IF VARTYPE(tmpPH_tmpSqlAns4.Today) = "T"
			dtReturn = tmpPH_tmpSqlAns4.Today
		ENDIF
		USE IN tmpPH_tmpSqlAns4
	ENDIF

	IF lNewConn 
		SQLDISCONNECT(pConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.", "Proc_ERP:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN dtReturn
ENDPROC
****************************
