*IF NOT "PROC_RTR" $ SET("PROCEDURE")  &&Added for when Quotes is run without HPA menu.
*	SET PROCEDURE TO Progs\Proc_RTR ADDITIVE
*ENDIF

*Create_rtr_SOitem 
*Create_rtr_SOitem_SoldProd 
*Create_rtr_WO
*Create_rtr_WOD 
*Create_rtr_Quote_ID 

*Set_rtr_Detail_Oper  
*Add_rtr_Detail_Oper 

*GetNext_rtr_DetailOper_ID
*GetNext_rtr_Detail 
*GetStandard_rtr_Detail 
*GetStandard_Oper_ID 
*DoesSOitem_need_rtr 
*get_rtr_ID
*get_Oper_ID_Operation 
*get_Operation_Oper_ID
*Validate_Oper_ID
*
*rtr_Oper_Sched  rtr_Oper_Start  rtr_Oper_Stop rtr_Oper_Cancel  
*Get_rtr_Oper_Number   Operations_Text
*get_OrderType get_OrderNum getOperation_Oper_ID getDetail_Oper_ID
*
**************************************************************
PROCEDURE Create_rtr_SOitem 
PARAMETERS pSOitem, pConnHandle
*Inserts a rtr record. used in Sales Order to create the first rtr
*Returns the rtr_ID = Create_rtr_SOitem (cSOitem, pConnHandle)

IF VARTYPE(pSOitem) <> "C"
	RecordError( 0, 'Create_rtr_SOitem', "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No SO item" )	
	RETURN 0
ENDIF
PRIVATE cSOitem
cSOitem = Proper_SO_item(pSOitem)

IF Proper_SO_item(cSOitem) = Proper_SO_item('')
	RecordError( 0, 'Create_rtr_SOitem', "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"BAD SO item" )	
	RETURN 0
ENDIF

PRIVATE nConn, lNewConn
lNewConn = .F.

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
nConn = CheckSQLConnection(nConn)

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE nNEWrtr_ID, lOK
nNEWrtr_ID = 0
lOK = .T.

PRIVATE cSQL, nSQLEXEC

****Check for existing
IF USED('tmpPR_SQLAns')
	USE IN tmpPR_SQLAns
ENDIF
SELECT 0

IF nConn > 0
	cSQL = "SELECT COUNT(*) AS CNTD "
	cSQL = cSQL + "	FROM dbo.rtr WITH(NOLOCK) "
	cSQL = cSQL + "	WHERE SOitem = dbo.f_ProperSOitem('"+cSOitem+"')"

	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
	ENDDO
	
	IF nSQLEXEC < 0  &&Try again.
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
		ENDDO
	ENDIF
	
	IF nSQLEXEC < 0
		SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPR_SQLAns')
		RecordError(nSQLEXEC,"SQL Error","Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		lOK = .F.
	ENDIF
	
	IF USED('tmpPR_SQLAns')
		IF RECCOUNT('tmpPR_SQLAns') > 0
			IF tmpPR_SQLAns.CNTD > 0
				MESSAGEBOX("Found Exisiting Router"+CHR(13)+"for SOitem '"+cSOitem+"'.",16,"Cannot create new Router!")
				lOK = .F.
			ENDIF
		ENDIF
		USE IN tmpPR_SQLAns
	ENDIF
	

	PRIVATE lTranAlreadySet, nProp 
	nProp = SQLGETPROP(nConn, 'Transactions')
	lTranAlreadySet = (nProp = 2)
				
*		IF NOT lTranAlreadySet
*			= SQLSETPROP(nConn, 'Transactions', 2)  && Manual transactions
*		ENDIF

	PRIVATE biRTR_ID
	IF lOK
		*Create the rtr
		*INSERT
		
		SELECT 0
		cSQL = "EXEC dbo.p_rtr_Ins "
		cSQL = cSQL + " @SOitem='"+cSOitem+"',@WO=0,@WO_Detail=0,@Quote_ID=0"

		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
		ENDDO
		
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPR_SQLAns')
			RecordError(nSQLEXEC,"SQL Error","Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
			lOK = .F.
		ENDIF
		*get New ID for Insert
		
		IF USED('tmpPR_SQLAns')
			IF RECCOUNT('tmpPR_SQLAns') > 0
				biRTR_ID = PrepareSQLnum(tmpPR_SQLAns.EXP,'rtr_ID',-4)
			ENDIF

			USE IN tmpPR_SQLAns
		ENDIF			
					
	ENDIF
	
	IF lOK
		IF biRTR_ID = 0
			lOK = .F.
		ENDIF
	ENDIF
	

*IF NOT lTranAlreadySet
*	IF lOK
*		= SQLCOMMIT(nConn)
*	ELSE				
*		= SQLROLLBACK(nConn)
*	ENDIF
*	*end the Transaction:
*	= SQLSETPROP(nConn, 'Transactions', 1)  && 1AUTO, 2MANUAL Trans
*ENDIF
	
	*Set the General Operations		
	IF lOK
		*pcOrder, pnOrder, pnDetail, pnOper_ID, pcOper_Note, plStart, nConn
		lOK = Set_rtr_Detail_Oper ('SOi',cSOitem,10,0,'Created Order',.T.,nConn)
	ELSE
		nNEWrtr_ID = 0	&&Reset on fail.
	ENDIF

	IF lOK
		lOK = Set_rtr_Detail_Oper ('SOi',cSOitem,90,0,'Print Order',.F.,nConn)
	ENDIF	
	
	IF lOK
		IF DoesSOitem_need_rtr( cSOitem, nConn )  &&Checks for Quoted machine CG,GFM.
			*dbo.f_rtr_Need_SOitem()
			
			*Read the Sales data and add to rtr
			lOK = Create_rtr_SOitem_SoldProd( cSOitem, biRTR_ID, nConn )
			
		ENDIF
	ENDIF
	
	IF lOK
		lOK = Set_rtr_Detail_Oper ('SOi',cSOitem,990,0,'Finished',.F.,nConn)
	ENDIF	

	*********************
	IF lNewConn
		SQLDISCONNECT( nConn )
	ENDIF
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nNEWrtr_ID
ENDPROC

**************************************************************

PROCEDURE Create_rtr_SOitem_SoldProd 
PARAMETERS pSOitem, biRTR_ID, pConnHandle
*Called from Create_rtr_SOitem (cSOitem, biRTR_ID, pConnHandle)
*Reads Sales and add all Operations quoted to the router.

IF VARTYPE(pSOitem) <> "C"
	RecordError( 0, 'Create_rtr_SOitem_SoldProd', "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No SO item" )	
	RETURN .F.
ENDIF
PRIVATE cSOitem
cSOitem = Proper_SO_item(pSOitem)

IF Proper_SO_item(cSOitem) = Proper_SO_item('')
	RecordError( 0, 'Create_rtr_SOitem_SoldProd', "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"BAD SO item" )	
	RETURN .F.
ENDIF

*biRTR_ID

PRIVATE nConn, lNewConn
lNewConn = .F.

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
nConn = CheckSQLConnection(nConn)

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE nNEWrtr_ID, lOK
nNEWrtr_ID = 0
lOK = .T.

PRIVATE cSQL, nSQLEXEC

****Get Quoted Sales data.
IF USED('tmpSqlSold')
	USE IN tmpSqlSold
ENDIF
SELECT 0

IF nConn > 0
	cSQL = "SELECT * "
	cSQL = cSQL + "	FROM dbo.Sales WITH(NOLOCK) "
	cSQL = cSQL + "	WHERE SOitem = dbo.f_ProperSOitem('"+cSOitem+"')"

	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpSqlSold' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpSqlSold' )
	ENDDO
	
	IF nSQLEXEC < 0  &&Try again.
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpSqlSold' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpSqlSold' )
		ENDDO
	ENDIF
	
	IF nSQLEXEC < 0
		SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpSqlSold')
		RecordError(nSQLEXEC,"SQL Error","Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		lOK = .F.
	ENDIF
	
	IF USED('tmpSqlSold')
		IF RECCOUNT('tmpSqlSold') > 0
		*pcOrder, pnOrder, pnDetail, pnOper_ID, pcOper_Note, plStart, nConn
			* Set_rtr_Detail_Oper ('SOi',cSOitem,10,0,'Created Order',.T.,nConn)
			* Set_rtr_Detail_Oper ('SOi',cSOitem, 90,0,'Print Order',.F.,nConn)
			
			*See table HPAlloy.dbo.rtr_Operation
			*enter by TYP?
			
			PRIVATE nOper_ID, cOper_Note, nDetail
			IF PrepareSQLlogic(tmpSqlSold.INV,'INV') AND lOK
				nOper_ID	= 100	
				*  &&f_rtr_getOperation_Oper_ID ONLY Works for Oper_ID >= 500
				*cOper_Note	= getOperation_Oper_ID(nOper_ID,nConn) 
				*nDetail 	= getDetail_Oper_ID(nOper_ID,nConn)
				cOper_Note	= "Select Stock"
				nDetail 	= 100
				lOK = Add_rtr_Detail_Oper(biRTR_ID, nDetail, nOper_ID, cOper_Note, nConn )
			ENDIF
			IF PrepareSQLlogic(tmpSqlSold.GFM,'GFM') AND lOK
				nOper_ID	= 528
				cOper_Note	= getOperation_Oper_ID(nOper_ID,nConn) 
				nDetail 	= getDetail_Oper_ID(nOper_ID,nConn)
				*cOper_Note	= "Forge"
				*nDetail = 300
				lOK = Add_rtr_Detail_Oper(biRTR_ID, nDetail, nOper_ID, cOper_Note, nConn )
			ENDIF
			IF PrepareSQLlogic(tmpSqlSold.Roll,'Roll') AND lOK
				nOper_ID	= 517
				cOper_Note	= getOperation_Oper_ID(nOper_ID,nConn) 
				nDetail 	= getDetail_Oper_ID(nOper_ID,nConn)
				*cOper_Note	= "Rolling Mill"
				*nDetail 	= 340
				lOK = Add_rtr_Detail_Oper(biRTR_ID, nDetail, nOper_ID, cOper_Note, nConn )
			ENDIF
			IF PrepareSQLlogic(tmpSqlSold.Press,'Press') AND lOK
				nOper_ID	= 534
				cOper_Note	= getOperation_Oper_ID(nOper_ID,nConn) 
				nDetail 	= getDetail_Oper_ID(nOper_ID,nConn)
				*cOper_Note	= "Open Die Forge      "
				*nDetail 	= 360
				lOK = Add_rtr_Detail_Oper(biRTR_ID, nDetail, nOper_ID, cOper_Note, nConn )
			ENDIF
			IF PrepareSQLlogic(tmpSqlSold.Mach,'Mach') AND lOK
				nOper_ID	= 535
				cOper_Note	= getOperation_Oper_ID(nOper_ID,nConn) 
				nDetail 	= getDetail_Oper_ID(nOper_ID,nConn)
				*cOper_Note	= "Machine Shop        "
				*nDetail 	= 500
				lOK = Add_rtr_Detail_Oper(biRTR_ID, nDetail, nOper_ID, cOper_Note, nConn )
			ENDIF
			IF PrepareSQLlogic(tmpSqlSold.CG,'CG') AND lOK
				nOper_ID	= 520
				cOper_Note	= getOperation_Oper_ID(nOper_ID,nConn) 
				nDetail 	= getDetail_Oper_ID(nOper_ID,nConn)
				*cOper_Note	= "Centerless Grinder  "
				*nDetail 	= 650
				lOK = Add_rtr_Detail_Oper(biRTR_ID, nDetail, nOper_ID, cOper_Note, nConn )
			ENDIF
			IF PrepareSQLlogic(tmpSqlSold.Plasma,'Plasma') AND lOK
				nOper_ID	= 504
				cOper_Note	= getOperation_Oper_ID(nOper_ID,nConn) 
				nDetail 	= getDetail_Oper_ID(nOper_ID,nConn)
				*cOper_Note	= "Plasma Cut"
				*nDetail 	= 150
				lOK = Add_rtr_Detail_Oper(biRTR_ID, nDetail, nOper_ID, cOper_Note, nConn )
			ENDIF
			IF PrepareSQLlogic(tmpSqlSold.WJet,'WJet') AND lOK
				nOper_ID	= 527
				cOper_Note	= getOperation_Oper_ID(nOper_ID,nConn) 
				nDetail 	= getDetail_Oper_ID(nOper_ID,nConn)
				*cOper_Note	= "Watejet             "
				*nDetail 	= 150
				lOK = Add_rtr_Detail_Oper(biRTR_ID, nDetail, nOper_ID, cOper_Note, nConn )
			ENDIF
			IF PrepareSQLnum(tmpSqlSold.ConverPo,'ConverPo',-3) > 0  AND lOK
				nOper_ID	= 536
				cOper_Note	= getOperation_Oper_ID(nOper_ID,nConn) 
				nDetail 	= getDetail_Oper_ID(nOper_ID,nConn)
				*cOper_Note	= "PO Conversion     "
				*nDetail 	= 200
				lOK = Add_rtr_Detail_Oper(biRTR_ID, nDetail, nOper_ID, cOper_Note, nConn )	
			ENDIF
			*
			*
			*			
		ENDIF
		USE IN tmpSqlSold
	ENDIF
	



	*********************
	IF lNewConn
		SQLDISCONNECT( nConn )
	ENDIF
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lOK 
ENDPROC


**************************************************************
PROCEDURE Create_rtr_WO 
PARAMETERS pWO, pConnHandle
*Returns the rtr_ID = Create_rtr_WO (nWO, pConnHandle)

PRIVATE nWO
nWO = PrepareSQLnum(pWO,'WO',-3)

IF nWO  < 1
	RecordError( 0, 'Create_rtr_WO', "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"BAD WO" )	
	RETURN 0
ENDIF

PRIVATE nConn, lNewConn
lNewConn = .F.

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
nConn = CheckSQLConnection(nConn)

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE nNEWrtr_ID, lOK
nNEWrtr_ID = 0
lOK = .T.

PRIVATE cSQL, nSQLEXEC

****Check for existing
IF USED('tmpPR_SQLAns')
	USE IN tmpPR_SQLAns
ENDIF
SELECT 0

IF nConn > 0
	cSQL = "SELECT COUNT(*) AS CNTD "
	cSQL = cSQL + "	FROM dbo.rtr WITH(NOLOCK) "
	cSQL = cSQL + "	WHERE WO = "+STR(nWO)

	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
	ENDDO
	
	IF nSQLEXEC < 0  &&Try again.
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
		ENDDO
	ENDIF
	
	IF nSQLEXEC < 0
		SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPR_SQLAns')
		RecordError(nSQLEXEC,"SQL Error","Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		lOK = .F.
	ENDIF
	
	IF USED('tmpPR_SQLAns')
		IF RECCOUNT('tmpPR_SQLAns') > 0
			IF tmpPR_SQLAns.CNTD > 0
				MESSAGEBOX("Found Exisiting Router"+CHR(13)+"for WO "+STR(nWO)+".",16,"Cannot create new Router!")
				lOK = .F.
			ENDIF
		ENDIF
		USE IN tmpPR_SQLAns
	ENDIF
	

	PRIVATE lTranAlreadySet, nProp 
	nProp = SQLGETPROP(nConn, 'Transactions')
	lTranAlreadySet = (nProp = 2)
				
*		IF NOT lTranAlreadySet
*			= SQLSETPROP(nConn, 'Transactions', 2)  && Manual transactions
*		ENDIF

	PRIVATE biRTR_ID
	IF lOK
		*Create the rtr
		*INSERT
		
		SELECT 0
		cSQL = "EXEC dbo.p_rtr_Ins "
		cSQL = cSQL + " @SOitem=NULL,@WO="+STR(nWO)+",@WO_Detail=0, @Quote_ID=0"
		*cSQL = cSQL + " @SOitem='"+cSOitem+"'"

		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
		ENDDO
		
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPR_SQLAns')
			RecordError(nSQLEXEC,"SQL Error","Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
			lOK = .F.
		ENDIF
		*get New ID for Insert
		
		IF USED('tmpPR_SQLAns')
			IF RECCOUNT('tmpPR_SQLAns') > 0
				biRTR_ID = PrepareSQLnum(tmpPR_SQLAns.EXP,'rtr_ID',-4)
			ENDIF

			USE IN tmpPR_SQLAns
		ENDIF			
					
	ENDIF
	
	IF lOK
		IF biRTR_ID = 0
			lOK = .F.
		ENDIF
	ENDIF
	

*IF NOT lTranAlreadySet
*	IF lOK
*		= SQLCOMMIT(nConn)
*	ELSE				
*		= SQLROLLBACK(nConn)
*	ENDIF
*	*end the Transaction:
*	= SQLSETPROP(nConn, 'Transactions', 1)  && 1AUTO, 2MANUAL Trans
*ENDIF
	
	*Set the General Operations		
	IF lOK
		*pcOrder, pnOrder, pnDetail, pnOper_ID, pcOper_Note, plStart, nConn
		*lOK = Set_rtr_Detail_Oper  ('WO',1000,100,523,'SELECT S ID_Detail_Process=37724',.T.,nConn)
		lOK = Set_rtr_Detail_Oper ('WO',nWO,10,0,'Created Work Order',.T.,nConn)
	ELSE
		nNEWrtr_ID = 0	&&Reset on fail.
	ENDIF

	IF lOK
	*	lOK = Set_rtr_Detail_Oper ('SOi',cSOitem,90,0,'Print Order',.F.,nConn)
	ENDIF	
	
	IF lOK
*		IF DoesWO_need_rtr( cSOitem, nConn )  &&Checks for Quoted machine CG,GFM.
			*dbo.f_rtr_Need_SOitem()
			
			*Read the Sales data and add to rtr
*			lOK = Create_rtr_SOitem_SoldProd( cSOitem, biRTR_ID, nConn )
			
*		ENDIF
	ENDIF
	
	IF lOK
*		lOK = Set_rtr_Detail_Oper ('SOi',cSOitem,990,0,'Finished',.F.,nConn)
	ENDIF	

	*********************
	IF lNewConn
		SQLDISCONNECT( nConn )
	ENDIF
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nNEWrtr_ID
ENDPROC

**************************************************************
PROCEDURE Create_rtr_WOD 
PARAMETERS pWOD, pConnHandle
*Returns the rtr_ID = Create_rtr_WOD (nWOD, pConnHandle)

PRIVATE nWOD
nWOD = PrepareSQLnum(pWOD,'WO_Detail',-3)

IF nWO  < 1
	RecordError( 0, 'Create_rtr_WOD', "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"BAD WO_Detail" )	
	RETURN 0
ENDIF

PRIVATE nConn, lNewConn
lNewConn = .F.

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
nConn = CheckSQLConnection(nConn)

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE nNEWrtr_ID, lOK
nNEWrtr_ID = 0
lOK = .T.

PRIVATE cSQL, nSQLEXEC

****Check for existing
IF USED('tmpPR_SQLAns')
	USE IN tmpPR_SQLAns
ENDIF
SELECT 0

IF nConn > 0
	cSQL = "SELECT COUNT(*) AS CNTD "
	cSQL = cSQL + "	FROM dbo.rtr WITH(NOLOCK) "
	cSQL = cSQL + "	WHERE WO_Detail = "+STR(nWOD)

	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
	ENDDO
	
	IF nSQLEXEC < 0  &&Try again.
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
		ENDDO
	ENDIF
	
	IF nSQLEXEC < 0
		SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPR_SQLAns')
		RecordError(nSQLEXEC,"SQL Error","Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		lOK = .F.
	ENDIF
	
	IF USED('tmpPR_SQLAns')
		IF RECCOUNT('tmpPR_SQLAns') > 0
			IF tmpPR_SQLAns.CNTD > 0
				MESSAGEBOX("Found Exisiting Router"+CHR(13)+"for WO_Detail "+STR(nWOD)+".",16,"Cannot create new Router!")
				lOK = .F.
			ENDIF
		ENDIF
		USE IN tmpPR_SQLAns
	ENDIF
	

	PRIVATE lTranAlreadySet, nProp 
	nProp = SQLGETPROP(nConn, 'Transactions')
	lTranAlreadySet = (nProp = 2)
				
*		IF NOT lTranAlreadySet
*			= SQLSETPROP(nConn, 'Transactions', 2)  && Manual transactions
*		ENDIF

	PRIVATE biRTR_ID
	IF lOK
		*Create the rtr
		*INSERT
		
		SELECT 0
		cSQL = "EXEC dbo.p_rtr_Ins "
		cSQL = cSQL + " @SOitem=NULL, @WO=0, @WO_Detail="+STR(nWOD)+", @Quote_ID=0"
		*cSQL = cSQL + " @SOitem='"+cSOitem+"'"

		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
		ENDDO
		
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPR_SQLAns')
			RecordError(nSQLEXEC,"SQL Error","Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
			lOK = .F.
		ENDIF
		*get New ID for Insert
		
		IF USED('tmpPR_SQLAns')
			IF RECCOUNT('tmpPR_SQLAns') > 0
				biRTR_ID = PrepareSQLnum(tmpPR_SQLAns.EXP,'rtr_ID',-4)
			ENDIF

			USE IN tmpPR_SQLAns
		ENDIF			
					
	ENDIF
	
	IF lOK
		IF biRTR_ID = 0
			lOK = .F.
		ENDIF
	ENDIF
	

*IF NOT lTranAlreadySet
*	IF lOK
*		= SQLCOMMIT(nConn)
*	ELSE				
*		= SQLROLLBACK(nConn)
*	ENDIF
*	*end the Transaction:
*	= SQLSETPROP(nConn, 'Transactions', 1)  && 1AUTO, 2MANUAL Trans
*ENDIF
	
	*Set the General Operations		
	IF lOK
		*pcOrder, pnOrder, pnDetail, pnOper_ID, pcOper_Note, plStart, nConn
		*lOK = Set_rtr_Detail_Oper  ('WO',1000,100,523,'SELECT S ID_Detail_Process=37724',.T.,nConn)
		lOK = Set_rtr_Detail_Oper ('WOD',nWOD,10,0,'Created WO Detail',.T.,nConn)
	ELSE
		nNEWrtr_ID = 0	&&Reset on fail.
	ENDIF

	IF lOK
	*	lOK = Set_rtr_Detail_Oper ('SOi',cSOitem,90,0,'Print Order',.F.,nConn)
	ENDIF	
	
	IF lOK
*		IF DoesWO_need_rtr( cSOitem, nConn )  &&Checks for Quoted machine CG,GFM.
			*dbo.f_rtr_Need_SOitem()
			
			*Read the Sales data and add to rtr
*			lOK = Create_rtr_SOitem_SoldProd( cSOitem, biRTR_ID, nConn )
			
*		ENDIF
	ENDIF
	
	IF lOK
*		lOK = Set_rtr_Detail_Oper ('SOi',cSOitem,990,0,'Finished',.F.,nConn)
	ENDIF	

	*********************
	IF lNewConn
		SQLDISCONNECT( nConn )
	ENDIF
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nNEWrtr_ID
ENDPROC

************************************************************** 
**************************************************************

PROCEDURE Create_rtr_Quote_ID
PARAMETERS pQID, pConnHandle
*Returns the rtr_ID = Create_rtr_Quote_ID(nQoute_ID, pConnHandle)

PRIVATE nQID
nQID = PrepareSQLnum(pQID,'Quote_ID',-3)

IF nQID  < 1
	RecordError( 0, 'Create_rtr_Quote_ID', "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"BAD Quote_ID" )	
	RETURN 0
ENDIF

PRIVATE nConn, lNewConn
lNewConn = .F.

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
nConn = CheckSQLConnection(nConn)

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE nNEWrtr_ID, lOK
nNEWrtr_ID = 0
lOK = .T.

PRIVATE cSQL, nSQLEXEC

****Check for existing
IF USED('tmpPR_SQLAns')
	USE IN tmpPR_SQLAns
ENDIF
SELECT 0

IF nConn > 0
	cSQL = "SELECT COUNT(*) AS CNTD "
	cSQL = cSQL + "	FROM dbo.rtr WITH(NOLOCK) "
	cSQL = cSQL + "	WHERE Quote_ID = "+STR(nQID)

	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
	ENDDO
	
	IF nSQLEXEC < 0  &&Try again.
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
		ENDDO
	ENDIF
	
	IF nSQLEXEC < 0
		SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPR_SQLAns')
		RecordError(nSQLEXEC,"SQL Error","Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		lOK = .F.
	ENDIF
	
	IF USED('tmpPR_SQLAns')
		IF RECCOUNT('tmpPR_SQLAns') > 0
			IF tmpPR_SQLAns.CNTD > 0
				MESSAGEBOX("Found Exisiting Router"+CHR(13)+"for Quote_ID "+STR(nQID)+".",16,"Cannot create new Router!")
				lOK = .F.
			ENDIF
		ENDIF
		USE IN tmpPR_SQLAns
	ENDIF
	

	PRIVATE lTranAlreadySet, nProp 
	nProp = SQLGETPROP(nConn, 'Transactions')
	lTranAlreadySet = (nProp = 2)
				
*		IF NOT lTranAlreadySet
*			= SQLSETPROP(nConn, 'Transactions', 2)  && Manual transactions
*		ENDIF

	PRIVATE biRTR_ID
	IF lOK
		*Create the rtr
		*INSERT
		
		SELECT 0
		cSQL = "EXEC dbo.p_rtr_Ins "
		cSQL = cSQL + " @SOitem=NULL, @WO=0, @WO_Detail=0, @Quote_ID="+STR(nQID)+""

		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
		ENDDO
		
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPR_SQLAns')
			RecordError(nSQLEXEC,"SQL Error","Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
			lOK = .F.
		ENDIF
		*get New ID for Insert
		
		IF USED('tmpPR_SQLAns')
			IF RECCOUNT('tmpPR_SQLAns') > 0
				biRTR_ID = PrepareSQLnum(tmpPR_SQLAns.EXP,'rtr_ID',-4)
			ENDIF

			USE IN tmpPR_SQLAns
		ENDIF			
					
	ENDIF
	
	IF lOK
		IF biRTR_ID = 0
			lOK = .F.
		ENDIF
	ENDIF
	

*IF NOT lTranAlreadySet
*	IF lOK
*		= SQLCOMMIT(nConn)
*	ELSE				
*		= SQLROLLBACK(nConn)
*	ENDIF
*	*end the Transaction:
*	= SQLSETPROP(nConn, 'Transactions', 1)  && 1AUTO, 2MANUAL Trans
*ENDIF
	
	*Set the General Operations	
	IF lOK
		nOper_ID	= 554	&&'new rtr_Detail'
		cOper_Note	= ''
		nDetail 	= 100

		*  &&f_rtr_getOperation_Oper_ID ONLY Works for Oper_ID >= 500
		cOper_Note	= getOperation_Oper_ID(nOper_ID,nConn) &&cOper_Note	= "Select Stock"
		nDetail 	= getDetail_Oper_ID(nOper_ID,nConn) 	&&nDetail 	= 100
		
		lOK = Add_rtr_Detail_Oper(biRTR_ID, nDetail, nOper_ID, cOper_Note, nConn )
		nNEWrtr_ID  = biRTR_ID 
		
	ENDIF
		
	IF lOK
		*pcOrder, pnOrder, pnDetail, pnOper_ID, pcOper_Note, plStart, nConn
		
		*lOK = Set_rtr_Detail_Oper ('QID',nQID,10,0,'Created Quote_ID',.T.,nConn)
		*Create_rtr_Detail_QID

	ELSE
		nNEWrtr_ID = 0	&&Reset on fail.
	ENDIF

	IF lOK
	*	lOK = Set_rtr_Detail_Oper ('QID',cSOitem,90,0,'Print Order',.F.,nConn)
	ENDIF	
	
	IF lOK
	ENDIF
	
	IF lOK
*		lOK = Set_rtr_Detail_Oper ('QID',nQuoteID,990,0,'Finished',.F.,nConn)
	ENDIF	

	*********************
	IF lNewConn
		SQLDISCONNECT( nConn )
	ENDIF
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nNEWrtr_ID
ENDPROC

****************************************************
PROCEDURE Set_rtr_Detail_Oper  
PARAMETERS pcOrder, pOrder, pnDetail, pnOper_ID, pcOper_Note, plStart, pConnHandle
*lOK = Set_rtr_Detail_Oper  ('WO',1000,100,523,'SELECT S ID_Detail_Process=37724',.T.,nConn)
*lOK = Set_rtr_Detail_Oper  ('SOi','106123-01',410,0,'',.T.,nConn)
*Oper_Note = 'PO Conversion     ' or 'SELECT S ID_Detail_Process=37724'

IF VARTYPE(pcOrder) <> "C"
	RecordError( 0, 'Set_rtr_Detail_Oper ', "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No Order Type" )	
	RETURN .F.
ENDIF
IF EMPTY(pcOrder) && = ''
	RecordError( 0, 'Set_rtr_Detail_Oper ', "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No Order Type" )
	RETURN .F.
ENDIF

PRIVATE nOrderNumber,cOrderNumber
nOrderNumber = 0
cOrderNumber = ''

PRIVATE cOrderType
DO CASE
CASE UPPER(pcOrder) == "SOI"
	cOrderType = "SOI"
	IF VARTYPE(pOrder) <> "C"
		RecordError( 0, 'Set_rtr_Detail_Oper ', "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No Sales Order Item" )	
		RETURN .F.
	ENDIF
	cOrderNumber = PrepareSQLtxt(pOrder,'SOitem',10)

CASE UPPER(pcOrder) == "WO"
	cOrderType = "WO"
	IF VARTYPE(pOrder) <> "N"
		RecordError( 0, 'Set_rtr_Detail_Oper ', "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No Work Order Number" )	
		RETURN .F.
	ENDIF
	nOrderNumber = pOrder
CASE UPPER(pcOrder) == "WOD"
	cOrderType = "WOD"
	IF VARTYPE(pOrder) <> "N"
		RecordError( 0, 'Set_rtr_Detail_Oper ', "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No WO Detail Number" )	
		RETURN .F.
	ENDIF
	nOrderNumber = pOrder
	
CASE UPPER(pcOrder) == "QID"
	cOrderType = "QID"
	IF VARTYPE(pOrder) <> "N"
		RecordError( 0, 'Set_rtr_Detail_Oper ', "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No Quote ID Detail Number" )	
		RETURN .F.
	ENDIF
	nOrderNumber = pOrder
	
CASE UPPER(pcOrder) == "POI"
	cOrderType = "POI"
	IF VARTYPE(pOrder) <> "C"
		RecordError( 0, 'Set_rtr_Detail_Oper ', "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No Purchase Order Item" )	
		RETURN .F.
	ENDIF
	cOrderNumber = PrepareSQLtxt(pOrder,'POitem',12)

OTHERWISE
	RecordError( 0, 'Set_rtr_Detail_Oper ', "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Unknown Order Type" )
	RETURN .F.
ENDCASE

IF VARTYPE(pnOper_ID) <> "N"
	RecordError( 0, 'Set_rtr_Detail_Oper ', "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No Oper_ID" )	
	RETURN .F.
ENDIF
IF pnOper_ID = 0
	RecordError( 0, 'Set_rtr_Detail_Oper ', "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No Oper_ID" )
	RETURN .F.
ENDIF

PRIVATE nOper_ID
nOper_ID = pnOper_ID

IF VARTYPE(pnDetail) != "N"
	RecordError( 0, 'Set_rtr_Detail_Oper ', "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No Detail" )
	RETURN .F.
ENDIF

PRIVATE nDetail
nDetail = PrepareSQLnum(pnDetail,'Detail',4,0)
*Detail: A collection of same rtr_ID seperated by 100 in order of execution.
*See rtr_Operation for standard Detail number

IF VARTYPE(pcOper_Note)<> "C"
	pcOper_Note = ''
ENDIF
PRIVATE cOper_Note, cLastOper_Note, nID_Detail_Process, cTBL, cLast_TBL, nLast_ID_D_Prc
cOper_Note = pcOper_Note
cLastOper_Note = ""
nID_Detail_Process = 0
cTBL 		= ''
cLast_TBL 	=''
nLast_ID_D_Prc = 0

*'SELECT S ID_Detail_Process=37724' or 'PO Conversion
IF "Select Material Process " $ UPPER(cOper_Note)
	cTBL =  UPPER(SUBSTR(cOper_Note,17,1))
	IF cTBL = "S" OR cTBL = "B" OR cTBL = "W" 
		IF  "ID_DETAIL_PROCESS=" $ UPPER(cOper_Note)
			PRIVATE cID_Detail_Process 
			cID_Detail_Process = SUBSTR(cOper_Note,AT("ID_DETAIL_PROCESS=",UPPER(cOper_Note))+LEN("ID_DETAIL_PROCESS="),10)
			nID_Detail_Process = PrepareSQLnum(cID_Detail_Process,"ID_Detail_Process",-3)
		ENDIF
	ELSE
		cTBL = ""
	ENDIF
ELSE
	*
	IF LIKE( UPPER("*Modified this Stock*"), UPPER(cOper_Note) )
	
		PRIVATE cID_Detail_Process 	
		cTBL = "S" 
		*&&UPPER(SUBSTR(cOper_Note, ATC(" T:",cOper_Note) ,1)) 
		cID_Detail_Process = SUBSTR(cOper_Note, ATC(" ID_D_P:",cOper_Note)+8 ,10)
		nID_Detail_Process = PrepareSQLnum(cID_Detail_Process,"ID_Detail_Process",-3)
		
	ELSE
		IF EMPTY(cOper_Note)
			*replace with OperID Operation
			*cComment = 'Grabbed '+cComment
			cOper_Note = get_Operation_Oper_ID(nOper_ID,pConnHandle)
		ENDIF
	ENDIF
ENDIF

PRIVATE lStart	
*USE Today as StartDate 
IF VARTYPE(plStart ) = "L"
	lStart = plStart
ELSE
	lStart = .T.
ENDIF

PRIVATE nConn, lNewConn
lNewConn = .F.

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
nConn = CheckSQLConnection(nConn)

IF nConn = 0	
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN .F.
ENDIF

PRIVATE cAlias 
cAlias = ALIAS()

*********
PRIVATE lPass, lInsert_RTR, biRTR_ID, lOK
lPass = .T.
lInsert_RTR = .T.

biRTR_ID = 0
lOK = .T.

*New Public
PRIVATE lHave_RTR, lAdd_RTR_Detail 
lHave_RTR = .F.
lAdd_RTR_Detail = .F.

PRIVATE cSQL, nSQLEXEC

********************

*Check rtr First
IF USED('tmpPR_SQLAns')
	USE IN tmpPR_SQLAns
ENDIF
SELECT 0

cSQL = "SELECT ID "
cSQL = cSQL + "	FROM dbo.rtr WITH(NOLOCK) "

DO CASE
CASE UPPER(pcOrder) = "SOI"
	cSQL = cSQL + " WHERE rtr.SOitem = dbo.f_ProperSOitem('"+cOrderNumber+"')"
CASE cOrderType == "WO"
	cSQL = cSQL + " WHERE rtr.WO = "+ALLTRIM(STR(nOrderNumber))
CASE cOrderType == "WOD"
	cSQL = cSQL + " WHERE rtr.WO_Detail = "+ALLTRIM(STR(nOrderNumber))
	
CASE cOrderType == "QID"
	cSQL = cSQL + " WHERE rtr.Quote_ID = "+ALLTRIM(STR(nOrderNumber))
	
CASE UPPER(pcOrder) = "POI"
	cSQL = cSQL + " INNER JOIN dbo.rtr_Detail rD WITH(NOLOCK) ON rtr.ID = rD.rtr_ID "
	cSQL = cSQL + " WHERE rD.POitem = dbo.f_ProperPOitem('"+cOrderNumber+"')"
ENDCASE
			
nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
ENDDO

IF nSQLEXEC < 0
	SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPR_SQLAns')
	RecordError(nSQLEXEC,"SQL Error","Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	lOK = .F.
ENDIF

IF USED('tmpPR_SQLAns')
	IF RECCOUNT('tmpPR_SQLAns') > 0
		IF PrepareSQLnum(tmpPR_SQLAns.ID,'rtr_ID',-4) > 0
			biRTR_ID = PrepareSQLnum(tmpPR_SQLAns.ID,'rtr_ID',-4)
			lHave_RTR = .T.
		ENDIF
	ENDIF

	USE IN tmpPR_SQLAns
ENDIF	
*****************

IF biRTR_ID = 0
	*INSERT rtr if needed
	
	SELECT 0
	cSQL = "EXEC dbo.p_rtr_Ins "
	DO CASE
	CASE UPPER(pcOrder) = "SOI"
		cSQL = cSQL + " @SOitem='"+cOrderNumber+"',@WO=0, @WO_Detail=0, @Quote_ID=0"
	CASE cOrderType == "WO"
		cSQL = cSQL + " @SOitem=NULL, @WO="+STR(nOrderNumber)+", @WO_Detail=0, @Quote_ID=0"
	CASE cOrderType == "WOD"
		cSQL = cSQL + " @SOitem=NULL, @WO=0, @WO_Detail="+STR(nOrderNumber)+", @Quote_ID=0"
	CASE cOrderType == "QID"
		cSQL = cSQL + " @SOitem=NULL, @WO=0, @WO_Detail=0, @Quote_ID= "+STR(nOrderNumber)+""
		
	CASE UPPER(pcOrder) = "POI"
		*PRIVATE lInsert_rtr_Sub
		*PO item is related to rtr thru rtr_Detail
		*Catch-22 
		*Need a WO,WO, or SOitem to create a rtr.  Cannot add rtr_Sub untill rtr
*				cSQL = cSQL + " @POitem=dbo.f_ProperPOitem('"+cOrderNumber+"')"

		RecordError( 0,"Could not insert rtr", "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(), 'Could not insert rtr because only have POi!'+CHR(13)+cOrderNumber )
		lOK = .F.
		lHave_RTR = .F.
		RETURN .F.
	ENDCASE

	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
	ENDDO
	
	IF nSQLEXEC < 0
		SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPR_SQLAns')
		RecordError(nSQLEXEC,"SQL Error","Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		lOK = .F.
		RETURN .F.
	ENDIF
	*get New rtr_ID for the rtr_Detail Insert
	
	IF USED('tmpPR_SQLAns')
		IF RECCOUNT('tmpPR_SQLAns') > 0
			biRTR_ID = PrepareSQLnum(tmpPR_SQLAns.EXP,'rtr_ID',-4)
		ENDIF

		USE IN tmpPR_SQLAns
	ENDIF			
ENDIF

************************	
IF biRTR_ID = 0
	*Failed
	lOK = .F.
	lHave_RTR = .F.
	RecordError(SQLEXECError,'SQL Error',"Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(0), "biRTR_ID = 0.  "+cSQL )
	RETURN .F.
ENDIF



*****************
* Look for Detail
*Detail: A collection of same rtr_ID seperated by 100 in order of router execution.
*See dbo.rtr_Operation for standard Detail numbers

PRIVATE nLastDetail 
nLastDetail = 0

PRIVATE lFound_Oper_ID, nFound_Oper_ID, nFound_Oper_Detail, lIs_Detail_found, lFound_Oper_ID
lFound_Oper_ID = .F.
nFound_Oper_ID = 0
nFound_Oper_Detail = 0
lIs_Detail_found = .F.
lFound_Oper_ID = .F.
			
IF lOK
	IF USED('tmpPR_SQLAns')
		USE IN tmpPR_SQLAns
	ENDIF
	SELECT 0

	cSQL = "SELECT rD.Detail,rD.Oper_ID "
	cSQL = cSQL + "	FROM dbo.rtr WITH(NOLOCK) "
	cSQL = cSQL + " INNER JOIN dbo.rtr_Detail rD WITH(NOLOCK) ON rtr.ID = rD.rtr_ID "
	cSQL = cSQL + " WHERE "
	DO CASE
	CASE cOrderType == "WO"
		cSQL = cSQL + " rtr.WO = "+ALLTRIM(STR(nOrderNumber))
	CASE cOrderType == "WOD"
		cSQL = cSQL + " rtr.WO_Detail = "+ALLTRIM(STR(nOrderNumber))
	CASE UPPER(pcOrder) = "SOI"
		cSQL = cSQL + " rtr.SOitem = dbo.f_ProperSOitem('"+cOrderNumber+"')"
	CASE UPPER(pcOrder) = "POI"
		cSQL = cSQL + " rD.POitem = dbo.f_ProperPOitem('"+cOrderNumber+"')"
	OTHERWISE
		RecordError( 0, 'Set_rtr_Detail_Oper ', "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Unknown Order Type" )
	ENDCASE
	
	cSQL = cSQL + " AND rD.Detail = "+ALLTRIM(STR(nDetail))

	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
	ENDDO

	IF nSQLEXEC < 0  &&Try again.
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
		ENDDO
	ENDIF

	IF nSQLEXEC < 0
		SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPR_SQLAns')
		RecordError(nSQLEXEC,"SQL Error","Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		lOK = .F.
	ENDIF

	IF USED('tmpPR_SQLAns')
		IF RECCOUNT('tmpPR_SQLAns') > 0

			SCAN
				*Found the rtr_Detail, but if Oper_ID is wrong, must insert with New Detail
				IF PrepareSQLnum( tmpPR_SQLAns.Oper_ID,'Oper_ID', -3) = nOper_ID
					lFound_Oper_ID = .T.
					nFound_Oper_Detail	= PrepareSQLnum( tmpPR_SQLAns.Detail, 'Detail', -3)
					nFound_Oper_ID		= PrepareSQLnum( tmpPR_SQLAns.Oper_ID, 'Oper_ID', -3)
				ENDIF
				nLastDetail = PrepareSQLnum( tmpPR_SQLAns.Detail, 'Detail', -3)
				*nDetail = PrepareSQLnum( tmpPR_SQLAns.Detail, 'Detail', -3) &&Does not Change
				
				lIs_Detail_found = .T.
				cHowFound = "Detail"
			ENDSCAN			
		ENDIF

		USE IN tmpPR_SQLAns
	ENDIF
ENDIF

***************
*Get Last Oper_Note of Detail and Oper_ID
IF lOK AND nLastDetail > 0
	IF USED('tmpPR_SQLAns')
		USE IN tmpPR_SQLAns
	ENDIF
	SELECT 0

	*get cLastOper_Note and UPDATE that Note
	cSQL = "SELECT rD.Oper_Note "
	cSQL = cSQL + "	,rD.TBL "
	cSQL = cSQL + "	,ISNULL(rD.ID_Detail_Process,0) AS ID_Detail_Process "
	cSQL = cSQL + "	FROM dbo.rtr WITH(NOLOCK) "
	cSQL = cSQL + " INNER JOIN dbo.rtr_Detail rd WITH(NOLOCK) ON rtr.ID = rd.rtr_ID "
	DO CASE
	CASE UPPER(pcOrder) = "SOI"
		cSQL = cSQL + " AND rtr.SOitem = dbo.f_ProperSOitem('"+cOrderNumber+"')"
	CASE cOrderType == "WO"
		cSQL = cSQL + " AND rtr.WO = "+ALLTRIM(STR(nOrderNumber))
	CASE cOrderType == "WOD"
		cSQL = cSQL + " AND rtr.WO_Detail = "+ALLTRIM(STR(nOrderNumber))
	CASE cOrderType == "QID"
		cSQL = cSQL + " AND rtr.Quote_ID = "+ALLTRIM(STR(nOrderNumber))
	CASE UPPER(pcOrder) = "POI"
		cSQL = cSQL + " AND rD.POitem = dbo.f_ProperPOitem('"+cOrderNumber+"')"
	ENDCASE

	cSQL = cSQL + " AND rd.Oper_ID = "+ALLTRIM(STR(nOper_ID))
	cSQL = cSQL + " AND rd.Detail = "+ALLTRIM(STR(nDetail))
	*lStart -ignore here

	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
	ENDDO

	IF nSQLEXEC < 0  &&Try again.
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
		ENDDO
	ENDIF

	IF nSQLEXEC < 0
		SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPR_SQLAns')
		RecordError(nSQLEXEC,"SQL Error","Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		lOK = .F.
	ENDIF

	IF USED('tmpPR_SQLAns')
		IF RECCOUNT('tmpPR_SQLAns') > 0
			*Found the rd.Oper_ID and rD.Detail
			cLastOper_Note	= PrepareSQLtxt( tmpPR_SQLAns.Oper_Note, 'Oper_Note', -1 )
			cLast_TBL 		= PrepareSQLtxt( tmpPR_SQLAns.TBL, 'TBL', 1 )
			nLast_ID_D_Prc 	= PrepareSQLnum( tmpPR_SQLAns.ID_Detail_Process,'ID_Detail_Process',-3)
			cHowFound = "Oper_ID-Detail"
		ENDIF

		USE IN tmpPR_SQLAns
	ENDIF
ENDIF

*****************
*Gets Highest nDetail for Oper_ID
IF lHave_RTR
	IF USED('tmpPR_SQLAns')
		USE IN tmpPR_SQLAns
	ENDIF
	SELECT 0

	cSQL = "SELECT TOP 1 rD.Detail, rD.Oper_ID "
	cSQL = cSQL + "	FROM dbo.rtr WITH(NOLOCK) "
	cSQL = cSQL + " INNER JOIN dbo.rtr_Detail rD WITH(NOLOCK) ON rtr.ID = rD.rtr_ID "
	DO CASE
	CASE UPPER(pcOrder) = "SOI"
		cSQL = cSQL + " WHERE rtr.SOitem = dbo.f_ProperSOitem('"+cOrderNumber+"')"+" AND "
	CASE cOrderType == "WO"
		cSQL = cSQL + " WHERE rtr.WO = "+ALLTRIM(STR(nOrderNumber))+" AND "
	CASE cOrderType == "WOD"
		cSQL = cSQL + " WHERE rtr.WO_Detail = "+ALLTRIM(STR(nOrderNumber))+" AND "
	CASE cOrderType == "QID"
		cSQL = cSQL + " WHERE rtr.Quote_ID = "+ALLTRIM(STR(nOrderNumber))+" AND "
	CASE UPPER(pcOrder) = "POI"
		cSQL = cSQL + " WHERE rD.POitem = dbo.f_ProperPOitem('"+cOrderNumber+"')"+" AND "
	OTHERWISE
		cSQL = cSQL + " WHERE "
	ENDCASE
	
	cSQL = cSQL + " rD.Oper_ID = "+ALLTRIM(STR(nOper_ID))
	cSQL = cSQL + " ORDER BY rD.Detail "
	
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
	ENDDO

	IF nSQLEXEC < 0  &&Try again.
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
		ENDDO
	ENDIF

	IF nSQLEXEC < 0
		SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPR_SQLAns')
		RecordError(nSQLEXEC,"SQL Error","Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		lOK = .F.
	ENDIF

	IF USED('tmpPR_SQLAns')
		IF RECCOUNT('tmpPR_SQLAns') > 0
		
			SCAN
				nFound_Oper_Detail = PrepareSQLnum( tmpPR_SQLAns.Detail, 'Detail', -3)
				IF nFound_Oper_Detail > 0
					lIs_Detail_found = .T.
					cHowFound = "Oper_ID"
					lFound_Oper_ID = .T.
					nLastDetail = nFound_Oper_Detail
				ENDIF			
			ENDSCAN			
			
		ENDIF

		USE IN tmpPR_SQLAns
	ENDIF
ENDIF



*****************
*Also Check exact Oper_Note for Detail Number
PRIVATE nNoteDetail 
nNoteDetail = 0

IF lOK 
	*AND NOT lIs_Detail_found 
	IF USED('tmpPR_SQLAns')
		USE IN tmpPR_SQLAns
	ENDIF
	SELECT 0

	cSQL = "SELECT rD.Detail "
	cSQL = cSQL + " FROM dbo.rtr_Detail rD WITH(NOLOCK)"
	cSQL = cSQL + " WHERE Oper_Note = '"+cOper_Note+"'"

	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
	ENDDO

	IF nSQLEXEC < 0  &&Try again.
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
		ENDDO
	ENDIF

	IF nSQLEXEC < 0
		SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPR_SQLAns')
		RecordError(nSQLEXEC,"SQL Error","Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		lOK = .F.
	ENDIF

	IF USED('tmpPR_SQLAns')
		IF RECCOUNT('tmpPR_SQLAns') > 0
			*Found the rtr_Detail
			nNoteDetail = PrepareSQLnum( tmpPR_SQLAns.Detail, 'Detail', -3)
			lIs_Detail_found = .T.
			cHowFound = "Oper_Note"
			
		ENDIF

		USE IN tmpPR_SQLAns
	ENDIF
ENDIF


*!*	*****************
*!*	*Do a special check for WO  - Auto advance Detail number for ?
*!*	IF cOrderType == "WO"
*!*		IF "Select Material Process " $ cOper_Note
*!*			PRIVATE nID_Detail_Process, cTBL
*!*			nID_Detail_Process = VAL(SUBSTR(cOper_Note,AT("ID_Detail_Process=",cOper_Note)+LEN("ID_Detail_Process=")))
*!*			cTBL = UPPER(SUBSTR(cOper_Note,AT("Select Material Process ",cOper_Note)+LEN("Select Material Process "),1))
*!*			IF nID_Detail_Process > 0 
*!*				cSQL = "SELECT rd.Detail, rd.TBL, rd.ID_Detail_Process, rd.RTR_ID  "
*!*				cSQL = cSQL + "	FROM Router.dbo.rtr WITH(NOLOCK) "
*!*				cSQL = cSQL + " INNER JOIN Router.dbo.rtr_Detail rd WITH(NOLOCK) ON rtr.ID = rd.rtr_ID "
*!*				*cSQL = cSQL + " WHERE rd.TBL = '"+cTBL+"'"
*!*				*cSQL = cSQL + " AND rd.ID_Detail_Process = "+nID_Detail_Process
*!*				cSQL = cSQL + " WHERE rtr.WO = "+ALLTRIM(STR(nOrderNumber))	
*!*				cSQL = cSQL + " ORDER BY rd.Detail DESC "
*!*				
*!*				nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
*!*				DO WHILE nSQLEXEC = 0
*!*					WAIT WINDOW 'SQL' TIMEOUT 1
*!*					nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
*!*				ENDDO
*!*								
*!*				IF nSQLEXEC < 0
*!*					SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPR_SQLAns')
*		RecordError(nSQLEXEC,"SQL Error","Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
*!*					lOK = .F.
*!*				ENDIF
*!*				
*!*				IF USED('tmpPR_SQLAns')
*!*					IF RECCOUNT('tmpPR_SQLAns') > 0
*!*						*Found the rtr
*!*						nLastDetail 	= PrepareSQLnum(tmpPR_SQLAns.Detail,'Detail',-3)
*!*						cLastTBL		= PrepareSQLtxt(tmpPR_SQLAns.TBL,'TBL',1)
*!*						nID_Detail_Process = PrepareSQLnum(tmpPR_SQLAns.ID_Detail_Process,'ID_Detail_Process',-5)
*!*						nRTR_ID 		= PrepareSQLnum(tmpPR_SQLAns.rtr_ID,'rtr_ID',-4)
*!*						
*!*						LOCATE FOR ID_Detail_Process = nID_Detail_Process 

*!*						DO WHILE FOUND()
*!*							LOCATE FOR ID_Detail_Process = nID_Detail_Process ;
*!*								AND TBL = cTBL ;
*!*								AND Detail = nDetail
*!*							IF FOUND()
*!*								*get the next Detail
*!*								nDetail 		= nDetail + 1
*!*								nLastDetail 	= PrepareSQLnum(tmpPR_SQLAns.Detail,'Detail',-3)
*!*								cLastTBL		= PrepareSQLtxt(tmpPR_SQLAns.TBL,'TBL',1)
*!*								nID_Detail_Process = PrepareSQLnum(tmpPR_SQLAns.ID_Detail_Process,'ID_Detail_Process',-5)
*!*								*biRTR_ID 		= PrepareSQLnum(tmpPR_SQLAns.rtr_ID,'rtr_ID',-4)	&&Should not change!!
*!*							ENDIF
*!*						ENDDO
*!*						*nDetail is the Next Available Detail for this WO
*!*						lInsert_RTR = .F.	&&Already have master, do not Insert
*!*						*lInsert_add = .T.
*!*						
*!*					ENDIF

*!*					USE IN tmpPR_SQLAns
*!*				ENDIF
*!*				
*!*								
*!*			ENDIF		
*!*		ENDIF
*!*	ENDIF
*lIs_Detail_found = .F.



******************************
******************************
* Prepare to add the Detail
******************************
*lIs_Detail_found = .F.

PRIVATE lInsert_New_Detail, lUpdate_Detail, nNewDetail 
lInsert_New_Detail = .F.
lUpdate_Detail = .F.
nNewDetail = nDetail 

IF lIs_Detail_found 
	DO CASE
	CASE cHowFound = "Oper_ID-Detail"
		*Found by the Oper_ID and Detail -probbly needs update
		lInsert_New_Detail = .F.
		*cLastOper_Note	= PrepareSQLtxt( tmpPR_SQLAns.Oper_Note, 'Oper_Note', -1 )
		*cLast_TBL 		= PrepareSQLtxt( tmpPR_SQLAns.TBL, 'TBL', 1 )
		*nLast_ID_D_Prc 
		**Insert if nLast_ID_D_Prc has changed.
		
		IF nLast_ID_D_Prc > 0
			IF nLast_ID_D_Prc > 0
				IF nLast_ID_D_Prc = nID_Detail_Process 
					lInsert_New_Detail = .F.
				ELSE
					* Oper_ID and Detail, yet nID_Detail_Process does not match
					lInsert_New_Detail = .T.
					nNewDetail = GetNext_rtr_Detail(biRTR_ID, nLastDetail, nConn)
				ENDIF
			ENDIF
		ENDIF
		
	CASE cHowFound = "Oper_Note"
		*Found by the Oper_Note- This just needs updated
		nNewDetail = nNoteDetail 
		lInsert_New_Detail = .F.
		
	CASE cHowFound = "Oper_ID"
		*Found by the Oper_ID- Insert with Next Detail
		nNewDetail = GetNext_rtr_Detail(biRTR_ID, nLastDetail, nConn)
		lInsert_New_Detail = .F.
		
	CASE cHowFound = "Detail"
		*Found by the Detail
		*Since the Oper_ID did not match- Insert with Next Detail
		nNewDetail = GetNext_rtr_Detail(biRTR_ID, nLastDetail, nConn)
		lInsert_New_Detail = .T.
	ENDCASE
ELSE
	*Did not find existing Detail, must be an insert.
	lInsert_New_Detail = .T.
ENDIF


******************************   L1210
PRIVATE lTranAlreadySet, nProp 
nProp = PrepareSQLnum(SQLGETPROP(nConn, 'Transactions'),'TransProp',-1)
lTranAlreadySet = (nProp = 2)
		
IF NOT lTranAlreadySet
	*Start Transaction mode
	= SQLSETPROP(nConn, 'Transactions', 2)  && Manual transactions
ENDIF

**************************

IF lInsert_New_Detail 
	*INSERT
	
	cSQL = "INSERT INTO dbo.rtr_Detail "
	
	cSQL = cSQL + "	( [rtr_ID]"
	cSQL = cSQL + ",[Detail]"
	IF lStart
		cSQL = cSQL + ",[EstStart]"
		cSQL = cSQL + ",[Started]"
		cSQL = cSQL + ",StartDate"
	ELSE
		cSQL = cSQL + " ,[Started]"
	ENDIF
	IF lStart AND nNewDetail < 100
		*auto Finish Detail under 100
		cSQL = cSQL + ",[EstFinish] "
		cSQL = cSQL + ",[Finished] "
		cSQL = cSQL + ",FinishDate "
	ENDIF
	cSQL = cSQL + ",Oper_Note "
	cSQL = cSQL + ",Oper_ID "
	cSQL = cSQL + ",TBL "
	cSQL = cSQL + ",ID_Detail_Process "
	
	cSQL = cSQL + ") VALUES ("
	
	cSQL = cSQL + ALLTRIM(STR(biRTR_ID))
	cSQL = cSQL + ","+STR(nNewDetail)
	IF lStart 
		cSQL = cSQL + ", CAST(GetDate() AS Date)"
		cSQL = cSQL + ",1 " &&keep as a default on Insert
		cSQL = cSQL + ",GetDate()"
	ELSE
		cSQL = cSQL + ",0"
	ENDIF
	IF lStart AND nDetail < 100
		*auto Finish Operations under 500
		cSQL = cSQL + ", CAST(GetDate() AS Date)"
		cSQL = cSQL + ",1 "
		cSQL = cSQL + ",GetDate()"
	ENDIF
	
	cSQL = cSQL + ",'"+cOper_Note+"'"
	
	cSQL = cSQL + ","+ALLTRIM(STR(nOper_ID))
	cSQL = cSQL + ",'"+cTBL+"'"
	cSQL = cSQL + ","+STR(nID_Detail_Process)

	cSQL = cSQL + ")"
	
	
ELSE
	*UPDATE
	
	cSQL = "UPDATE dbo.rtr_Detail "
	cSQL = cSQL + "	SET [Started] = 1 " &&keep as a default
	IF lStart 
		cSQL = cSQL + ",EstStart = CAST(GetDate() AS Date)"
		cSQL = cSQL + ",StartDate = GetDate()"
	ENDIF
	
*	IF EMPTY(cLastOper_Note)
		cSQL = cSQL + ",Oper_Note='"+cOper_Note+"'"
*	ELSE
*		IF cLastOper_Note = "Select Material"
*			*Do not repeat "Select Material"
*			cSQL = cSQL + ",Oper_Note='"+cOper_Note+"'"
*		ELSE
*			cSQL = cSQL + ",Oper_Note='"+cLastOper_Note+CHR(13)+cOper_Note+"'"
*		ENDIF
*	ENDIF
	
	IF LEN(cTBL)>0
		cSQL = cSQL + ",TBL='"+cTBL+"'"
	ENDIF
	IF nID_Detail_Process > 0
		cSQL = cSQL + ",ID_Detail_Process="+STR(nID_Detail_Process)
	ENDIF
	
	cSQL = cSQL + " FROM dbo.rtr rtr "
	cSQL = cSQL + " INNER JOIN dbo.rtr_Detail rd ON rtr.ID = rd.rtr_ID "
	
	DO CASE
	CASE UPPER(pcOrder) = "SOI"
		cSQL = cSQL + " WHERE rd.Oper_ID = "+ALLTRIM(STR(nOper_ID))
		cSQL = cSQL + " AND rtr.SOitem = dbo.f_ProperSOitem('"+cOrderNumber+"')"
	CASE cOrderType == "WO"
		cSQL = cSQL + " WHERE rd.Oper_ID = "+ALLTRIM(STR(nOper_ID))
		cSQL = cSQL + " AND rtr.WO = "+ALLTRIM(STR(nOrderNumber))
	CASE cOrderType == "WOD"
		cSQL = cSQL + " WHERE rd.Oper_ID = "+ALLTRIM(STR(nOper_ID))
		cSQL = cSQL + " AND rtr.WO_Detail = "+ALLTRIM(STR(nOrderNumber))
	CASE UPPER(pcOrder) = "QID"
		cSQL = cSQL + " WHERE rd.Oper_ID = "+ALLTRIM(STR(nOper_ID))
		cSQL = cSQL + " AND rtr.Quote_ID = "+ALLTRIM(STR(nOrderNumber))

	CASE UPPER(pcOrder) = "POI"
	*	cSQL = cSQL + " AND rtr.POitem = dbo.f_ProperPOitem('"+cOrderNumber+"')"
	*	cSQL = cSQL + " INNER JOIN Router.dbo.rtr_Detail rD ON rtr.ID = rD.rtr_ID "
		cSQL = cSQL + " WHERE rd.Oper_ID = "+ALLTRIM(STR(nOper_ID))
		cSQL = cSQL + " AND rd.POitem = dbo.f_ProperPOitem('"+cOrderNumber+"')"
	ENDCASE
	
	IF cHowFound = "Oper_Note"
		cSQL = cSQL + "	AND rD.Detail = "+STR(nNoteDetail)
		cSQL = cSQL + "	AND rD.Oper_Note = '"+cOper_Note+"'"
	ELSE
		*Note this is a different nDetail
		cSQL = cSQL + "	AND rD.Detail = "+STR(nDetail)
	ENDIF
ENDIF

nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
ENDDO

IF nSQLEXEC < 0
	SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPR_SQLAns')
	IF lInsert_New_Detail 
		RecordError( 0, "Could not insert rtr_Detail", "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),'Could not Insert rtr_Detail '+CHR(13)+cSQL )
	ELSE
		RecordError( 0, "Could not update rtr_Detail", "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),'Could not Update rtr_Detail '+CHR(13)+cSQL )
	ENDIF
	lOK = .F.
ENDIF

IF USED('tmpPR_SQLAns')
	USE IN tmpPR_SQLAns
ENDIF

IF lOK
	IF NOT lTranAlreadySet
		= SQLCOMMIT(nConn)
	ENDIF
ELSE	
	IF NOT lTranAlreadySet			
		= SQLROLLBACK(nConn)
	ENDIF
ENDIF

IF NOT lTranAlreadySet
	*end the Transaction:
	= SQLSETPROP(nConn, 'Transactions', 1)  && 1AUTO, 2MANUAL Trans
ENDIF

IF lNewConn
	SQLDISCONNECT( nConn )
ENDIF


IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lOK
ENDPROC



*********************************
PROCEDURE Add_rtr_Detail_Oper 
PARAMETERS biRTR_ID, nDetail, nOper_ID, cOper_Note, pConnHandle
*Add_rtr_Detail_Oper( biRTR_ID, nDetail, nOper_ID, cOper_Note, nConn )
* Inserts a router Operation
* rtr_Detail table needs a record so inner join Query works!
*use Add_rtr_Detail_Oper to create the first rtr_Detail record.

IF NOT "PROC_SQL" $ SET("PROCEDURE")  &&Added for when Quotes is run without HPA menu.
	SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
ENDIF
IF NOT "PROC_SETUP" $ SET("PROCEDURE")
	SET PROCEDURE TO Progs\Proc_Setup ADDITIVE
ENDIF

IF VARTYPE(biRTR_ID) = "C"
	IF VAL(biRTR_ID) > 1
		*return to Num
		biRTR_ID = VAL(biRTR_ID)
	ELSE
		RecordError( 0, 'PARAMETERS ', "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"VFP message: No biRTR_ID parameter" )
		RETURN .F.
	ENDIF
ELSE
	IF VARTYPE(biRTR_ID) = "N"
		biRTR_ID = PrepareSQLnum(biRTR_ID,'rtr_ID',-4)
	ELSE
		RecordError( 0, 'PARAMETERS ', "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"VFP message: No biRTR_ID parameter" )
		RETURN .F.
	ENDIF
ENDIF

IF VARTYPE(nDetail) != "N"
	RecordError( 0, 'PARAMETERS ', "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"VFP message: No nDetail parameter" )
	RETURN .F.
ENDIF
IF VARTYPE(nOper_ID) != "N"
	RecordError( 0, 'PARAMETERS ', "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"VFP message: No nOper_ID parameter" )
	RETURN .F.
ENDIF
IF VARTYPE(cOper_Note) != "C"
	RecordError( 0, 'PARAMETERS ', "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"VFP message: No cOper_Note parameter" )
	RETURN .F.
ENDIF


PRIVATE nConn, lNewConn, lOK 
nConn = 0
lNewConn = .F.
lOK = .T.

IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn= pConnHandle
	ELSE
		nConn= get_SQLSTRINGCONNECT()
		lNewConn = .T.
	ENDIF
ELSE
	nConn = get_SQLSTRINGCONNECT()
	lNewConn = .T.
ENDIF
nConn = CheckSQLConnection(nConn)

******************
IF nOper_ID = 0 AND LEN(cOper_Note) > 0
	*Description/Operation may match Oper_Note
	nOper_ID = get_Oper_ID_Operation(cOper_Note, nConn)
ENDIF
IF nOper_ID > 0 AND LEN(cOper_Note) = 0
	*Description/Operation may match Oper_Note
	cOper_Note	= getOperation_Oper_ID(nOper_ID,nConn)
ENDIF

*************
*validate Oper_ID in dbo.rtr_Operation, Oper_ID must exists
IF NOT Validate_Oper_ID(nOper_ID,nConn)
	lOK = .F.
	RecordError( 0, "rtr_Operation record does not exist for nOper_ID "+STR(nOper_ID), "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),'Will not Insert rtr_Detail Operation ' )
ENDIF

*************************************
PRIVATE cAlias 
cAlias = ALIAS()

IF USED('cntrtr_Detail1')
	USE IN cntrtr_Detail1
ENDIF

PRIVATE cSQL, nSQLEXEC

*Check for existing rtr_ID and Detail
cSQL = "SELECT COUNT(*) AS CNTD FROM dbo.rtr_Detail "
cSQL = cSQL + "	WHERE [rtr_ID]="+ ALLTRIM(STR(biRTR_ID))
cSQL = cSQL + " AND [Detail]="+STR(nDetail)

SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'cntrtr_Detail1')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'cntrtr_Detail1' )
ENDDO
IF nSQLEXEC < 0
	SQLEXECError(cSQL, nConn, nSQLEXEC, 'cntrtr_Detail1')
	RecordError(nSQLEXEC,"SQL Error","Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
ENDIF

IF USED('cntrtr_Detail1')
	IF cntrtr_Detail1.Cntd > 0
		nDetail = GetNext_rtr_DetailOper_ID( biRTR_ID, nDetail, nOper_ID, nConn )
	ENDIF
	USE IN cntrtr_Detail1
ENDIF


*SELECT * FROM Router.dbo.rtr_Operation ORDER BY Oper_ID
*INSERT INTO Router.dbo.rtr_Operation (Operation,jobClass,jobClassID,jobType,StdDetail) VALUES ('Print','Sales',6,'Print',90)
*SELECT * FROM dbo.OTracking_Job ORDER BY Oper_ID
*INSERT INTO dbo.OTracking_Job (Description,ClassID,Type,Sched_Type,IsMachine,Oper_ID) VALUES 	('Print',6,'Sales',0,0,539)


IF nOper_ID = 0
	lOK = .F.
	*cannot insert 0
ELSE
	*INSERT

	cSQL = "INSERT INTO dbo.rtr_Detail "
	cSQL = cSQL + "	( [rtr_ID]"
	cSQL = cSQL + ",[Detail]"
	cSQL = cSQL + ",[EstStart]"
	cSQL = cSQL + ",[Started]"
	cSQL = cSQL + ",StartDate"

	cSQL = cSQL + ",Oper_Note "
	cSQL = cSQL + ",Oper_ID "
	cSQL = cSQL + ") VALUES ("

	cSQL = cSQL + ALLTRIM(STR(biRTR_ID))
	cSQL = cSQL + ","+STR(nDetail)
	cSQL = cSQL + ", CAST(GetDate() AS Date)"	&&EstStart
	cSQL = cSQL + ",0 " 		&&Started 
	cSQL = cSQL + ",GetDate()"	&&StartDate

	cSQL = cSQL + ",'"+cOper_Note+"'"
	cSQL = cSQL + ","+ALLTRIM(STR(nOper_ID)) &&Oper_ID must exist in dbo.rtr_Operation
	cSQL = cSQL + ")"

	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPR_SQLAns' )
	ENDDO

	IF nSQLEXEC < 0
		SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPR_SQLAns')
*		IF lInsert_New_Detail 
			RecordError( 0, "Could not insert rtr_Detail", "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),'Could not Insert rtr_Detail '+CHR(13)+cSQL )
*		ELSE
*			RecordError( 0, "Could not update rtr_Detail", "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),'Could not Update rtr_Detail '+CHR(13)+cSQL )
*		ENDIF
		lOK = .F.
	ENDIF
ENDIF
		 
IF lNewConn
	SQLDISCONNECT( nConn )
ENDIF


IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lOK
ENDPROC

*********************************
PROCEDURE GetNext_rtr_DetailOper_ID
PARAMETERS biRTR_ID, nDetail, nOper_ID, pConnHandle
*nDetail = GetNext_rtr_DetailOper_ID( biRTR_ID, nDetail, nOper_ID, nConnHandle )
* Returns Next available Detail for Oper_ID

IF VARTYPE(biRTR_ID) = "C"
	IF VAL(biRTR_ID) > 1
		*return to Num
		biRTR_ID = VAL(biRTR_ID)
	ELSE
		RecordError( 0, 'PARAMETERS ', "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"VFP message: No biRTR parameter" )
		RETURN 0
	ENDIF
ELSE
	IF VARTYPE(biRTR_ID) = "N"
		biRTR_ID = PrepareSQLnum(biRTR_ID,'rtr_ID',-4)
	ELSE
		RecordError( 0, 'PARAMETERS ', "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"VFP message: No biRTR_ID parameter" )
		RETURN 0
	ENDIF
ENDIF
IF VARTYPE(nDetail) != "N"
	RecordError( 0, 'PARAMETERS ', "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"VFP message: No nDetail parameter" )
	RETURN 0
ENDIF
IF VARTYPE(nOper_ID) != "N"
	RecordError( 0, 'PARAMETERS ', "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"VFP message: No nOper_ID parameter" )
	RETURN 0
ENDIF

PRIVATE nConn, lNewConn
nConn = 0
lNewConn = .F.
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
nConn = CheckSQLConnection(nConn)

PRIVATE nNewDetail, lFoundDetail
nNewDetail = nDetail
lFoundDetail = .T.

PRIVATE cAlias 
cAlias = ALIAS()

IF USED('cntrtr_Detail')
	USE IN cntrtr_Detail
ENDIF

PRIVATE cSQL, nSQLEXEC

DO WHILE lFoundDetail

	cSQL = "SELECT COUNT(*) AS Cntd FROM dbo.rtr_Detail WITH(NOLOCK) "
	cSQL = cSQL + " WHERE rtr_ID ="+(STR(biRTR_ID))
	cSQL = cSQL + " AND Detail ="+STR(nNewDetail)

	SELECT 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'cntrtr_Detail')

	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'cntrtr_Detail' )
	ENDDO
	IF nSQLEXEC < 0
		SQLEXECError(cSQL,nConn, nSQLEXEC, 'cntrtr_Detail')
		RecordError(nSQLEXEC,"SQL Error","Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
	
	IF USED('cntrtr_Detail')
		IF cntrtr_Detail.Cntd > 0
			lFoundDetail = .T.
			nNewDetail = nNewDetail + 1
		ELSE
			lFoundDetail = .F.
		ENDIF
	ENDIF
	
	IF nNewDetail >= 1000
		*abort
		lFoundDetail = .F.
		nNewDetail = 0
	ENDIF
	
	IF USED('cntrtr_Detail')
		USE IN cntrtr_Detail
	ENDIF
	
ENDDO

IF lNewConn 
	=SQLDISCONNECT(nConn)
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nNewDetail
ENDPROC



*********************************
PROCEDURE GetNext_rtr_Detail 
PARAMETERS biRTR_ID, nDetail, pConnHandle
*nNewDetail = GetNext_rtr_Detail( biRTR_ID, nDetail, pConnHandle )
 
* Returns Next available Detail
*

IF VARTYPE(biRTR_ID) = "C"
	IF VAL(biRTR_ID) > 1
		*return to Num
		biRTR_ID = VAL(biRTR_ID)
	ELSE
		RecordError( 0, 'PARAMETERS ', "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"VFP message: No biRTR parameter" )
		RETURN 0
	ENDIF
ELSE
	IF VARTYPE(biRTR_ID) = "N"
		biRTR_ID = PrepareSQLnum(biRTR_ID,'rtr_ID',-4)
	ELSE
		RecordError( 0, 'PARAMETERS ', "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"VFP message: No biRTR_ID parameter" )
		RETURN 0
	ENDIF
ENDIF
IF VARTYPE(nDetail) != "N"
	RecordError( 0, 'PARAMETERS ', "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"VFP message: No nDetail parameter" )
	RETURN 0
ENDIF

PRIVATE nConn, lNewConn
nConn = 0
lNewConn = .F.
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
nConn = CheckSQLConnection(nConn)

PRIVATE nNewDetail, lFoundDetail
nNewDetail = nDetail
lFoundDetail = .T.

PRIVATE cAlias 
cAlias = ALIAS()

IF USED('cntrtr_Detail')
	USE IN cntrtr_Detail
ENDIF

PRIVATE cSQL, nSQLEXEC

DO WHILE lFoundDetail

	cSQL = "SELECT COUNT(*) AS Cntd FROM dbo.rtr_Detail WITH(NOLOCK) "
	cSQL = cSQL + " WHERE rtr_ID ="+(STR(biRTR_ID))
	cSQL = cSQL + " AND Detail ="+STR(nNewDetail)

	SELECT 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'cntrtr_Detail')

	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'cntrtr_Detail' )
	ENDDO
	IF nSQLEXEC < 0
		SQLEXECError(cSQL,nConn, nSQLEXEC, 'cntrtr_Detail')
		RecordError(nSQLEXEC,"SQL Error","Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
	
	IF USED('cntrtr_Detail')
		IF cntrtr_Detail.Cntd > 0
			lFoundDetail = .T.
			nNewDetail = nNewDetail + 1
		ELSE
			lFoundDetail = .F.
		ENDIF
	ENDIF
	
	IF nNewDetail >= 1000
		*abort
		lFoundDetail = .F.
		nNewDetail = 0
	ENDIF
	
	IF USED('cntrtr_Detail')
		USE IN cntrtr_Detail
	ENDIF
	
ENDDO

IF lNewConn 
	=SQLDISCONNECT(nConn)
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nNewDetail
ENDPROC

********************************* 

PROCEDURE GetStandard_rtr_Detail 
PARAMETERS nOper_ID, pConnHandle
 
* Returns Standard nStnDetail for Oper_ID
*nDetail = GetStandard_rtr_Detail(nOper_ID, nConn)

IF VARTYPE(nOper_ID) != "N"
	RecordError( 0, 'PARAMETERS ', "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"VFP message: No nOper_ID parameter" )
	RETURN 0
ENDIF

PRIVATE nConn, lNewConn
nConn = 0
lNewConn = .F.
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
nConn = CheckSQLConnection(nConn)

PRIVATE nNewDetail
nNewDetail = 0

PRIVATE cAlias 
cAlias = ALIAS()

IF USED('StdDetail')
	USE IN StdDetail
ENDIF

PRIVATE cSQL, nSQLEXEC

cSQL = "SELECT ISNULL(StdDetail,0) AS StdDetail FROM dbo.rtr_Operation WITH(NOLOCK) "
cSQL = cSQL + " WHERE Oper_ID ="+STR(nOper_ID)

SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'StdDetail')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'StdDetail' )
ENDDO
IF nSQLEXEC < 0
	SQLEXECError(cSQL,nConn, nSQLEXEC, 'StdDetail')
		RecordError(nSQLEXEC,"SQL Error","Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
ENDIF

IF USED('StdDetail')
	IF VARTYPE(StdDetail.StdDetail) = "N"
		nNewDetail = StdDetail.StdDetail
	ENDIF
	USE IN StdDetail
ENDIF

IF lNewConn 
	IF nConn > 0
		=SQLDISCONNECT(nConn)
	ENDIF
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nNewDetail
ENDPROC

********************************* 

PROCEDURE GetStandard_Oper_ID 
PARAMETERS pOperation,pJobType, pConnHandle
*Returns Standard nStandard Oper_ID for Operation or JobType
*nOper_ID = GetStandard_Oper_ID(cOperation,cJobType, nConn)

PRIVATE cOperation, cJobType
cOperation = PrepareSQLtxt(pOperation,'Operation',20)
cJobType = PrepareSQLtxt(pJobType,'JobType',50)

IF LEN(cOperation) + LEN(cJobType) = 0
	RecordError( 0, 'PARAMETERS ', "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"VFP message: No pOperation,pJobType parameter" )
	RETURN 0
ENDIF

PRIVATE nConn, lNewConn
nConn = 0
lNewConn = .F.
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
nConn = CheckSQLConnection(nConn)

PRIVATE nOper_ID
nOper_ID = 0

PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tStndOper_ID')
	USE IN tStndOper_ID
ENDIF


PRIVATE cSQL, nSQLEXEC

cSQL = "SELECT Oper_ID FROM dbo.rtr_Operation WITH(NOLOCK) "
IF LEN(cOperation) > 0
	cSQL = cSQL + " WHERE Operation = '"+cOperation+"'"
	IF LEN(cJobType) > 0
		cSQL = cSQL + " OR JobType= '"+cJobType+"'"
	ENDIF
ELSE
	cSQL = cSQL + " WHERE JobType= '"+cJobType+"'"
ENDIF

SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tStndOper_ID')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tStndOper_ID' )
ENDDO
IF nSQLEXEC < 0
	SQLEXECError(cSQL,nConn, nSQLEXEC, 'tStndOper_ID')
	RecordError(nSQLEXEC,"SQL Error","Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
ENDIF

IF USED('tStndOper_ID')
	IF RECCOUNT("tStndOper_ID") > 0
		nOper_ID = PrepareSQLnum(tStndOper_ID.Oper_ID,'Oper_ID',-3)
	ENDIF
	USE IN tStndOper_ID
ENDIF

IF lNewConn 
	IF nConn > 0
		=SQLDISCONNECT(nConn)
	ENDIF
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nOper_ID
ENDPROC
*******************************************

PROCEDURE DoesSOitem_need_rtr 
PARAMETERS cSOitem, pConnHandle
*lNeed = DoesSOitem_need_rtr( cSOitem, ThisForm.nConnHandle )
* Returns .T. or .F.

IF VARTYPE(cSOitem) != "C"
	TrackError("Bad Parameter cSOitem","Bad Parameter cSOitem","Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN -1
ENDIF

IF NOT "PROC_SQL" $ SET("PROCEDURE") 
	SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
ENDIF
IF NOT "Proc_ERP" $ SET("PROCEDURE") 
	SET PROCEDURE TO Progs\Proc_ERP ADDITIVE
ENDIF
IF NOT "PROC_SEUP" $ SET("PROCEDURE") 
	SET PROCEDURE TO Progs\Proc_Setup ADDITIVE
ENDIF
IF NOT "PROC_QUOTES" $ SET("PROCEDURE") 
	SET PROCEDURE TO Progs\Proc_Quotes ADDITIVE
ENDIF


IF Proper_SO_item(cSOitem) = Proper_SO_item('')
	RETURN .F.
ENDIF

PRIVATE lReturn
lReturn = .F.

PRIVATE nConn, lNewConn
nConn = 0
lNewConn = .F.
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
nConn = CheckSQLConnection(nConn)


IF nConn > 0
	PRIVATE cSQL, nSQLEXEC 
	PRIVATE cAlias 
	cAlias = ALIAS()

	IF USED("rtr_NeedSOi")
		USE IN rtr_NeedSOi
	ENDIF
	cSQL = "SELECT dbo.f_rtr_Need_SOitem(dbo.f_ProperSOitem('"+cSOitem+"')) AS Need "

	SELECT 0
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'rtr_NeedSOi')
	
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'rtr_NeedSOi')
	ENDDO
	IF nSQLEXEC < 0
		SQLEXECError(cSQL, nConn, nSQLEXEC, 'rtr_NeedSOi')
	ENDIF
	
	IF USED("rtr_NeedSOi")
		IF RECCOUNT('rtr_NeedSOi')>0
			lReturn = PrepareSQLlogic(rtr_NeedSOi.Need,'Need')
		ENDIF
		USE IN rtr_NeedSOi
	ENDIF
ELSE 
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN -1
ENDIF

IF lNewConn 
	SQLDISCONNECT( nConn )
ENDIF
	
IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF
	
RETURN lReturn
ENDPROC

******************************************* 

PROCEDURE get_rtr_ID
PARAMETERS cOrderType, pOrderNumber, pConnHandle
*nrtr_ID = get_rtr_ID(WO,1234 )

*@cOrderType CHAR(3)
*@pOrderNumber CHAR(15)

IF VARTYPE(cOrderType) <> "C"
	RecordError( 0, 'get_rtr_ID', "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No Order Type" )	
	RETURN .F.
ENDIF
IF EMPTY(pOrderNumber) && = ''
	RecordError( 0, 'get_rtr_ID', "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No OrderNumber" )
	RETURN .F.
ENDIF

PRIVATE lCloseConn, nConn
nConn = 0
IF VARTYPE(pConnHandle) != "N"
	nConn = 0 
ELSE 
	nConn = pConnHandle
ENDIF
IF nConn < 1
	nConn = get_SQLSTRINGCONNECT() 
	lCloseConn = .T.
ELSE
	lCloseConn = .F.
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE cOrderNumber
cOrderNumber = PrepareSQLtxt(pOrderNumber,'OrderNumber',15)

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE nrtr_ID
nrtr_ID = 0

PRIVATE cSQL, nSQLEXEC
IF USED("t_rtr_ID")
	USE IN t_rtr_ID
ENDIF

cSQL = "EXEC dbo.p_get_rtr_ID "
cSQL = cSQL + " @cOrderType=N'"+ cOrderType +"'"
cSQL = cSQL + " ,@pOrderNumber=N'"+ cOrderNumber +"'"

SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 't_rtr_ID' )

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL 1' TIMEOUT 2
	nSQLEXEC = SQLEXEC(nConn, cSQL, 't_rtr_ID' )
ENDDO

IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "t_rtr_ID")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 2
		nSQLEXEC = SQLEXEC(nConn, cSQL, "t_rtr_ID")

	ENDDO
ENDIF

IF nSQLEXEC < 0
	IF SQLEXECError(cSQL, nConn, nSQLEXEC, 't_rtr_ID')
		RecordError(nSQLEXEC,"SQL Error","Proc_SQL:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

IF USED("t_rtr_ID")
	IF RECCOUNT('t_rtr_ID') > 0
		nrtr_ID  = PrepareSQLnum(t_rtr_ID.EXP,'rtr_ID',-4)
	ENDIF
	USE IN t_rtr_ID
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.", "Proc_SQL:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

IF lCloseConn
	SQLDISCONNECT( nConn )
ENDIF

RETURN nrtr_ID 
******************************************* 

PROCEDURE get_Oper_ID_Operation
PARAMETERS pOperation, pConnHandle
*nOper_ID = get_Oper_ID_Operation(cOperation/cDescription/cOper_Note, pConn)
*returns Oper_ID from dbo.OTracking_Job WHERE [Description]='"+cOperation+"'"

IF VARTYPE(pOperation) <> "C"
	RecordError( 0, 'get_Oper_ID_Operation', "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No pOperation" )	
	RETURN 0
ENDIF

PRIVATE lCloseConn, nConn
nConn = 0
IF VARTYPE(pConnHandle) != "N"
	nConn = 0 
ELSE
	nConn = pConnHandle
ENDIF

IF nConn < 1
	nConn = get_SQLSTRINGCONNECT() 
	lCloseConn = .T.
ELSE
	lCloseConn = .F.
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE cOperation
cOperation = PrepareSQLtxt(pOperation,'Description',50)

PRIVATE nOper_ID
nOper_ID = 0

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC
IF USED("t_Oper_ID_Oper")
	USE IN t_Oper_ID_Oper
ENDIF

cSQL = "SELECT Oper_ID  "
cSQL = cSQL + " FROM dbo.OTracking_Job "
cSQL = cSQL + " WHERE [Description]='"+cOperation+"'"

SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 't_Oper_ID_Oper' )

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL 1' TIMEOUT 2
	nSQLEXEC = SQLEXEC(nConn, cSQL, 't_Oper_ID_Oper' )
ENDDO

IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "t_Oper_ID_Oper")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 2
		nSQLEXEC = SQLEXEC(nConn, cSQL, "t_Oper_ID_Oper")

	ENDDO
ENDIF

IF nSQLEXEC < 0
	IF SQLEXECError(cSQL, nConn, nSQLEXEC, 't_Oper_ID_Oper')
		RecordError(nSQLEXEC,"SQL Error","Proc_SQL:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

IF USED("t_Oper_ID_Oper")
	IF RECCOUNT('t_Oper_ID_Oper') > 0
		nOper_ID = PrepareSQLnum(t_Oper_ID_Oper.Oper_ID,'Oper_ID',-3)
	ENDIF
	USE IN t_Oper_ID_Oper
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.", "Proc_SQL:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

IF lCloseConn
	SQLDISCONNECT( nConn )
ENDIF

RETURN nOper_ID

******************************************* 

PROCEDURE get_Operation_Oper_ID
PARAMETERS pOper_ID, pConnHandle
*cOperation = get_Operation_Oper_ID(nOper_ID, pConn)
*returns Operation FROM dbo.rtr_Operation WHERE Oper_ID  ="+STR(nOper_ID) 

IF VARTYPE(pOper_ID) <> "N"
	RecordError( 0, 'get_Operation_Oper_ID', "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No pOper_ID" )	
	RETURN 0
ENDIF

PRIVATE lCloseConn, nConn
nConn = 0
IF VARTYPE(pConnHandle) != "N"
	nConn = 0 
ELSE
	nConn = pConnHandle
ENDIF

IF nConn < 1
	nConn = get_SQLSTRINGCONNECT() 
	lCloseConn = .T.
ELSE
	lCloseConn = .F.
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE cOperation
cOperation = ''

PRIVATE nOper_ID
nOper_ID = pOper_ID

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC
IF USED("t_Oper_ID_Oper")
	USE IN t_Oper_ID_Oper
ENDIF

cSQL = "SELECT Operation "
cSQL = cSQL + " FROM dbo.rtr_Operation "
cSQL = cSQL + " WHERE Oper_ID  ="+STR(nOper_ID) 

SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 't_Oper_ID_Oper' )

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL 1' TIMEOUT 2
	nSQLEXEC = SQLEXEC(nConn, cSQL, 't_Oper_ID_Oper' )
ENDDO

IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "t_Oper_ID_Oper")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 2
		nSQLEXEC = SQLEXEC(nConn, cSQL, "t_Oper_ID_Oper")

	ENDDO
ENDIF

IF nSQLEXEC < 0
	IF SQLEXECError(cSQL, nConn, nSQLEXEC, 't_Oper_ID_Oper')
		RecordError(nSQLEXEC,"SQL Error","Proc_SQL:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

IF USED("t_Oper_ID_Oper")
	IF RECCOUNT('t_Oper_ID_Oper') > 0
		cOperation = PrepareSQLtxt(t_Oper_ID_Oper.Operation,'Operation',20)
	ENDIF
	USE IN t_Oper_ID_Oper
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.", "Proc_SQL:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

IF lCloseConn
	SQLDISCONNECT( nConn )
ENDIF

RETURN cOperation 

******************************************* Validate_Oper_ID

PROCEDURE Validate_Oper_ID 
PARAMETERS pOper_ID, pConnHandle
*cOperation = Validate_Oper_ID(nOper_ID, pConn)
*returns True if dbo.rtr_Operation has Oper_ID  ="+STR(nOper_ID) 

IF VARTYPE(pOper_ID) <> "N"
	RecordError( 0, 'Validate_Oper_ID', "Proc_RTR:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No pOper_ID" )	
	RETURN .F.
ENDIF

PRIVATE lCloseConn, nConn
nConn = 0
IF VARTYPE(pConnHandle) != "N"
	nConn = 0 
ELSE
	nConn = pConnHandle
ENDIF

IF nConn < 1
	nConn = get_SQLSTRINGCONNECT() 
	lCloseConn = .T.
ELSE
	lCloseConn = .F.
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE lFound 
lFound = .F.

PRIVATE nOper_ID
nOper_ID = pOper_ID

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC
IF USED("t_Oper_ID_Oper")
	USE IN t_Oper_ID_Oper
ENDIF

cSQL = "SELECT Operation "
cSQL = cSQL + " FROM dbo.rtr_Operation "
cSQL = cSQL + " WHERE Oper_ID  ="+STR(nOper_ID) 

SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 't_Oper_ID_Oper' )

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL 1' TIMEOUT 2
	nSQLEXEC = SQLEXEC(nConn, cSQL, 't_Oper_ID_Oper' )
ENDDO

IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "t_Oper_ID_Oper")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 2
		nSQLEXEC = SQLEXEC(nConn, cSQL, "t_Oper_ID_Oper")

	ENDDO
ENDIF

IF nSQLEXEC < 0
	IF SQLEXECError(cSQL, nConn, nSQLEXEC, 't_Oper_ID_Oper')
		RecordError(nSQLEXEC,"SQL Error","Proc_SQL:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

IF USED("t_Oper_ID_Oper")
	IF RECCOUNT('t_Oper_ID_Oper') > 0
		lFound = .T.
	ENDIF
	USE IN t_Oper_ID_Oper
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.", "Proc_SQL:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

IF lCloseConn
	SQLDISCONNECT( nConn )
ENDIF

RETURN lFound 

*********************************************
*********************************
PROCEDURE rtr_Oper_Sched
PARAMETERS vOrderType,vOrderNumber,pOper,lOper,pConnHandle
*rtr_Oper_Sched('SOitem',cSOItem,"INV",lInv,ThisFormSet.nConnHandle)

*SET PROCEDURE TO Progs\Proc_WO ADDITIVE
*--rtr_Oper_Sched('SOitem',' 114000-01',"Radial Forge",.T.)

PRIVATE nOrderNumber,cOrderNumber, cOperation, nOper_ID

IF VARTYPE(vOrderType)<> "C"
	RecordError( 0, 'rtr_Oper_Sched', "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No vOrderType" )	
	RETURN .F.
ENDIF
IF NOT "PROC_SQL" $ SET("PROCEDURE")
	SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
ENDIF
IF NOT "PROC_SETUP" $ SET("PROCEDURE")
	SET PROCEDURE TO Progs\Proc_Setup ADDITIVE
ENDIF
IF NOT "Proc_ERP" $ SET("PROCEDURE")
	SET PROCEDURE TO Progs\Proc_ERP ADDITIVE
ENDIF

PRIVATE cWhere
DO CASE
CASE vOrderType = "WO"
	nOrderNumber = PrepareSQLnum(vOrderNumber,'WO',-3)
	cOrderNumber = STR(nOrderNumber)
	cWhere = " WHERE WO="+cOrderNumber 
CASE vOrderType = "WO_Detail"
	nOrderNumber = PrepareSQLnum(vOrderNumber,'WO_Detail',-3)
	cOrderNumber = STR(nOrderNumber)
	cWhere = " WHERE WO_Detail="+cOrderNumber 
CASE vOrderType = "SOitem"
	nOrderNumber = Proper_PO_Item_PO(vOrderNumber)
	cOrderNumber = "'"+PrepareSQLtxt(vOrderNumber,'SOitem',10)+"'"
	cWhere = " WHERE SOitem="+cOrderNumber 
OTHERWISE
	RecordError( 0, 'rtr_Oper_Sched', "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No vOrderType CASE" )	
	RETURN .F.
ENDCASE

IF NOT ( VARTYPE(pOper) = "C" OR VARTYPE(pOper) = "N"  )
	RecordError( 0, 'rtr_Oper_Sched', "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No pOper" )	
	RETURN .F.
ENDIF

*Can pass in either Operation txt or ID
IF VARTYPE(pOper) = "C"
	cOperation = pOper
	nOper_ID = 0
ENDIF
IF VARTYPE(pOper) = "N"
	cOperation = ''
	nOper_ID = pOper
ENDIF
***
IF VARTYPE(lOper)<> "L"
	RecordError( 0, 'rtr_Oper_Sched', "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No lOper" )	
	RETURN .F.
ENDIF

**
PRIVATE lReturnWorked
lReturnWorked = .T.


PRIVATE nConn, lNewConn
lNewConn = .F.
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
nConn = CheckSQLConnection(nConn)

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPW_SqlAns')
	USE IN tmpPW_SqlAns
ENDIF
SELECT 0

IF nConn > 0
	
	IF nOper_ID = 0
		nOper_ID =  Get_rtr_Oper_Number(cOperation,nConn)
	ENDIF
		
	IF nOper_ID > 0	
		
		PRIVATE lFound
		lFound = .F.
		
		cSQL = "SELECT rD.Oper_Note,rD.Cncld "
		cSQL = cSQL + " FROM dbo.rtr "
		cSQL = cSQL + " INNER JOIN dbo.rtr_Detail rD ON rtr.ID = rD.rtr_ID "
		cSQL = cSQL + cWhere 
		cSQL = cSQL + " AND Oper_ID = "+STR(nOper_ID)
		
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_SqlAns' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_SqlAns' )
		ENDDO
		
		IF nSQLEXEC < 0  &&Try again. Problem query!
			nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_SqlAns' )
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL' TIMEOUT 1
				nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_SqlAns' )
			ENDDO
		ENDIF
		
		IF nSQLEXEC < 0
			SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPW_SqlAns')
			lReturnWorked = .F.
		ENDIF
		
		IF USED('tmpPW_SqlAns')
			IF RECCOUNT('tmpPW_SqlAns') > 0
				lFound = .T.
				*Oper_Note
								
				IF PrepareSQLlogic(tmpPW_SqlAns.Cncld,'Cnnld',.F.)
					TrackMess("Found a cancelled Operation when a scheduled operation was triggered. rtr_Oper_Sched() "+CHR(13)+cSQL)
					PRIVATE cMess

					cMess = "Found a cancelled Operation when a scheduled operation was triggered."+CHR(13)
					cMess = cMess +"rtr_Oper_Sched() "+CHR(13)
					cMess = cMess + "*rtr_Oper_Sched(vOrderType,vOrderNumber,pOper,lOper,pConnHandle)"+CHR(13)
					cMess = cMess + "vOrderType = "+vOrderType+" "
					cMess = cMess + ",nOrderNumber = "+ALLTRIM(STR(nOrderNumber))+" "
					cMess = cMess + ",cOrderNumber = '"+ALLTRIM(cOrderNumber) + "' "+CHR(13)
					cMess = cMess + ",cOperation = '"+ALLTRIM(cOperation)+"' "
					cMess = cMess + ",nOper_ID = "+ALLTRIM(STR(nOper_ID))+" "+CHR(13)
					cMess = cMess + ",lOper = "+IIF(lOper,'True','False')+" "+CHR(13)
					cMess = cMess + ",cWhere = '"+ALLTRIM(cWhere)+"' "+CHR(13)
					cMess = cMess +CHR(13)+CHR(13)+ cSQL 
					
					RecordError(0,"Error" ,"Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(1),cMess)
				ENDIF
			ENDIF

			USE IN tmpPW_SqlAns
		ENDIF		
		
		IF NOT lFound AND lReturnWorked 
			*Insert a Schedule
			
			cSQL = "EXEC dbo.p_rtr_Sched "
			cSQL = cSQL + " '"+vOrderType+"'"
			cSQL = cSQL + " ,"+cOrderNumber+""
			cSQL = cSQL + " ,"+STR(nOper_ID)+""
			
			nSQLEXEC = SQLEXEC(nConn, cSQL, '' )
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL' TIMEOUT 1
				nSQLEXEC = SQLEXEC(nConn, cSQL, '' )
			ENDDO
			
			IF nSQLEXEC < 0  &&Try again. Problem query!
				nSQLEXEC = SQLEXEC(nConn, cSQL, '' )
				DO WHILE nSQLEXEC = 0
					WAIT WINDOW 'SQL' TIMEOUT 1
					nSQLEXEC = SQLEXEC(nConn, cSQL, '' )
				ENDDO
			ENDIF
			
			IF nSQLEXEC < 0
				SQLEXECError(cSQL ,nConn,nSQLEXEC, '')
				lReturnWorked = .F.
			ENDIF
			
			
		ENDIF	

	ENDIF
	
	IF lNewConn 
		SQLDISCONNECT( nConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF


IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lReturnWorked
ENDPROC

*********************************
PROCEDURE rtr_Oper_Start
PARAMETERS vOrderType,vOrderNumber,pOper,lOper,pConnHandle
*rtr_Oper_Start('SOitem',cSOItem,"INV",lInv,ThisFormSet.nConnHandle)

*SET PROCEDURE TO Progs\Proc_WO ADDITIVE
*--rtr_Oper_Set('SOitem',' 114000-01',"Radial Forge",.T.)
*--SELECT * FROM dbo.Sales WHERE gfm = 1 ORDER BY SalesNum desc
*SELECT * FROM Router.dbo.rtr WHERE SOitem = ' 114000-01'
*SELECT * FROM Router.dbo.rtr_Detail D inner join Router.dbo.rtr on D.rtr_ID=rtr.ID WHERE rtr.SOitem = ' 114000-01'

PRIVATE nOrderNumber,cOrderNumber, cOperation, nOper_ID

IF VARTYPE(vOrderType)<> "C"
	RecordError( 0, 'rtr_Oper_Start', "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No vOrderType" )	
	RETURN .F.
ENDIF

IF NOT "PROC_SQL" $ SET("PROCEDURE")
	SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
ENDIF
IF NOT "PROC_SETUP" $ SET("PROCEDURE")
	SET PROCEDURE TO Progs\Proc_Setup ADDITIVE
ENDIF
IF NOT "Proc_ERP" $ SET("PROCEDURE")
	SET PROCEDURE TO Progs\Proc_ERP ADDITIVE
ENDIF

DO CASE
CASE vOrderType = "WO"
	nOrderNumber = PrepareSQLnum(vOrderNumber,'WO',-3)
	cOrderNumber = STR(nOrderNumber)
CASE vOrderType = "WO_Detail"
	nOrderNumber = PrepareSQLnum(vOrderNumber,'WO_Detail',-3)
	cOrderNumber = STR(nOrderNumber)
CASE vOrderType = "SOitem"
	nOrderNumber = Proper_PO_Item_PO(vOrderNumber)
	cOrderNumber = "'"+PrepareSQLtxt(vOrderNumber,'SOitem',10)+"'"
	
OTHERWISE
	RecordError( 0, 'rtr_Oper_Start', "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No vOrderType CASE" )	
	RETURN .F.
ENDCASE

IF NOT ( VARTYPE(pOper) = "C" OR VARTYPE(pOper) = "N"  )
	RecordError( 0, 'rtr_Oper_Start', "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No pOper" )	
	RETURN .F.
ENDIF

*Can pass in either Operation txt or ID
IF VARTYPE(pOper) = "C"
	cOperation = pOper
	nOper_ID = 0
ENDIF
IF VARTYPE(pOper) = "N"
	cOperation = ''
	nOper_ID = pOper
ENDIF

IF VARTYPE(lOper)<> "L"
	RecordError( 0, 'rtr_Oper_Start', "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No lOper" )	
	RETURN .F.
ENDIF

****
PRIVATE lReturnWorked
lReturnWorked = .T.


PRIVATE nConn, lNewConn
lNewConn = .F.
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
nConn = CheckSQLConnection(nConn)

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPW_SqlAns')
	USE IN tmpPW_SqlAns
ENDIF
SELECT 0

IF nConn > 0
	
	IF nOper_ID = 0
		nOper_ID =  Get_rtr_Oper_Number(cOperation,nConn)
	ENDIF
		
	IF nOper_ID > 0	
	
		cSQL = "EXEC dbo.p_rtr_Oper "
		cSQL = cSQL + " '"+vOrderType+"'"
		cSQL = cSQL + " ,"+cOrderNumber+""
		cSQL = cSQL + " ,"+STR(nOper_ID)+""
		cSQL = cSQL + " ,1"	&&+STR(nStart)+""
		
		*EXEC Router.dbo.p_rtr_Oper 'WO',CAST(1183 AS CHAR),520,1	--Insert CG Operation for WO
		
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_SqlAns' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_SqlAns' )
		ENDDO
		
		IF nSQLEXEC < 0  &&Try again. Problem query!
			nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_SqlAns' )
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL' TIMEOUT 1
				nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_SqlAns' )
			ENDDO
		ENDIF
		
		IF nSQLEXEC < 0
			SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPW_SqlAns')
			lReturnWorked = .F.
		ENDIF
		
		IF USED('tmpPW_SqlAns')
			*IF VARTYPE(tmpPW_SqlAns.SalesRep ) = "C"
			*	lcReturnName = tmpPW_SqlAns.SalesRep 
			*ENDIF

			USE IN tmpPW_SqlAns
		ENDIF
	ENDIF
	
	IF lNewConn 
		SQLDISCONNECT( nConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF


IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lReturnWorked
ENDPROC

*********************************
PROCEDURE rtr_Oper_Stop
PARAMETERS vOrderType,vOrderNumber,pOper,lOper,pConnHandle
*rtr_Oper_Stop('SOitem',cSOItem,"INV",lInv,ThisFormSet.nConnHandle)

*SET PROCEDURE TO Progs\Proc_WO ADDITIVE
*rtr_Oper_Stop('SOitem',' 114000-01',"Radial Forge",.T.)

PRIVATE nOrderNumber,cOrderNumber, cOperation, nOper_ID

IF VARTYPE(vOrderType)<> "C"
	RecordError( 0, 'rtr_Oper_Stop', "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No vOrderType" )	
	RETURN .F.
ENDIF

IF NOT "PROC_SQL" $ SET("PROCEDURE")
	SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
ENDIF
IF NOT "PROC_SETUP" $ SET("PROCEDURE")
	SET PROCEDURE TO Progs\Proc_Setup ADDITIVE
ENDIF
IF NOT "Proc_ERP" $ SET("PROCEDURE")
	SET PROCEDURE TO Progs\Proc_ERP ADDITIVE
ENDIF

DO CASE
CASE vOrderType = "WO"
	nOrderNumber = PrepareSQLnum(vOrderNumber,'WO',-3)
	cOrderNumber = STR(nOrderNumber)
CASE vOrderType = "WO_Detail"
	nOrderNumber = PrepareSQLnum(vOrderNumber,'WO_Detail',-3)
	cOrderNumber = STR(nOrderNumber)
CASE vOrderType = "SOitem"
	nOrderNumber = Proper_PO_Item_PO(vOrderNumber)
	cOrderNumber = "'"+PrepareSQLtxt(vOrderNumber,'SOitem',10)+"'"
	
OTHERWISE
	RecordError( 0, 'rtr_Oper_Stop', "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No vOrderType CASE" )	
	RETURN .F.
ENDCASE

IF NOT ( VARTYPE(pOper) = "C" OR VARTYPE(pOper) = "N"  )
	RecordError( 0, 'rtr_Oper_Stop', "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No pOper" )	
	RETURN .F.
ENDIF

*Can pass in either Operation txt or ID
IF VARTYPE(pOper) = "C"
	cOperation = pOper
	nOper_ID = 0
ENDIF
IF VARTYPE(pOper) = "N"
	cOperation = ''
	nOper_ID = pOper
ENDIF

IF VARTYPE(lOper)<> "L"
	RecordError( 0, 'rtr_Oper_Stop', "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No lOper" )	
	RETURN .F.
ENDIF

****
PRIVATE lReturnWorked
lReturnWorked = .T.


PRIVATE nConn, lNewConn
lNewConn = .F.
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
nConn = CheckSQLConnection(nConn)

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPW_SqlAns')
	USE IN tmpPW_SqlAns
ENDIF
SELECT 0

IF nConn > 0
	
	IF nOper_ID = 0
		nOper_ID =  Get_rtr_Oper_Number(cOperation,nConn)
	ENDIF
	
	IF lCncld
		
	ENDIF
		
	IF nOper_ID > 0	
	
		cSQL = "EXEC dbo.p_rtr_Oper "
		cSQL = cSQL + " '"+vOrderType+"'"
		cSQL = cSQL + " ,"+cOrderNumber+""
		cSQL = cSQL + " ,"+STR(nOper_ID)+""
		cSQL = cSQL + " ,0"	&&Stop
		
		*EXEC Router.dbo.p_rtr_Oper 'WO',CAST(1183 AS CHAR),520,0	--Insert CG Operation for WO
		
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_SqlAns' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_SqlAns' )
		ENDDO
		
		IF nSQLEXEC < 0  &&Try again. Problem query!
			nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_SqlAns' )
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL' TIMEOUT 1
				nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_SqlAns' )
			ENDDO
		ENDIF
		
		IF nSQLEXEC < 0
			SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPW_SqlAns')
			lReturnWorked = .F.
		ENDIF
		
		IF USED('tmpPW_SqlAns')
			IF VARTYPE(tmpPW_SqlAns.SalesRep ) = "C"
				lcReturnName = tmpPW_SqlAns.SalesRep 
			ENDIF

			USE IN tmpPW_SqlAns
		ENDIF
	ENDIF
	
	IF lNewConn 
		SQLDISCONNECT( nConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF


IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lReturnWorked
ENDPROC

*********************************rtr_Oper_Cancel was written twice but not used yet!!
PROCEDURE rtr_Oper_Cancel1 
PARAMETERS vOrderType,vOrderNumber,pOper,lOper,pConnHandle
*rtr_Oper_Cancel('SOitem',cSOItem,"INV",lInv,ThisFormSet.nConnHandle)
*If Operation is still in 'Schedule' mode DELETE
*Otherwise make a Cancel UPDATE

*SET PROCEDURE TO Progs\Proc_WO ADDITIVE
*rtr_Oper_Cancel('SOitem',' 114000-01',"Radial Forge",.T.)

PRIVATE nOrderNumber,cOrderNumber, cOperation, nOper_ID

IF VARTYPE(vOrderType)<> "C"
	RecordError( 0, 'rtr_Oper_Cancel', "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No vOrderType" )	
	RETURN .F.
ENDIF

IF NOT "PROC_SQL" $ SET("PROCEDURE")
	SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
ENDIF
IF NOT "PROC_SETUP" $ SET("PROCEDURE")
	SET PROCEDURE TO Progs\Proc_Setup ADDITIVE
ENDIF
IF NOT "Proc_ERP" $ SET("PROCEDURE")
	SET PROCEDURE TO Progs\Proc_ERP ADDITIVE
ENDIF

PRIVATE cWhere
DO CASE
CASE vOrderType = "WO"
	nOrderNumber = PrepareSQLnum(vOrderNumber,'WO',-3)
	cOrderNumber = STR(nOrderNumber)
	cWhere = " WHERE WO="+cOrderNumber 
CASE vOrderType = "WO_Detail"
	nOrderNumber = PrepareSQLnum(vOrderNumber,'WO_Detail',-3)
	cOrderNumber = STR(nOrderNumber)
	cWhere = " WHERE WO_Detail="+cOrderNumber 
CASE vOrderType = "SOitem"
	nOrderNumber = Proper_PO_Item_PO(vOrderNumber)
	cOrderNumber = "'"+PrepareSQLtxt(vOrderNumber,'SOitem',10)+"'"
	cWhere = " WHERE SOitem="+cOrderNumber 
OTHERWISE
	RecordError( 0, 'rtr_Oper_Cancel', "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No vOrderType CASE" )	
	RETURN .F.
ENDCASE

IF NOT ( VARTYPE(pOper) = "C" OR VARTYPE(pOper) = "N"  )
	RecordError( 0, 'rtr_Oper_Cancel', "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No pOper" )	
	RETURN .F.
ENDIF

*Can pass in either Operation txt or ID
IF VARTYPE(pOper) = "C"
	cOperation = pOper
	nOper_ID = 0
ENDIF
IF VARTYPE(pOper) = "N"
	cOperation = ''
	nOper_ID = pOper
ENDIF

IF VARTYPE(lOper)<> "L"
	RecordError( 0, 'rtr_Oper_Cancel', "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No lOper" )	
	RETURN .F.
ENDIF


*********
PRIVATE lReturnWorked
lReturnWorked = .T.
PRIVATE lCncld, lStarted, lFinished, nDetail, biRTR_ID

PRIVATE nConn, lNewConn
lNewConn = .F.
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
nConn = CheckSQLConnection(nConn)

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPW_SqlAns')
	USE IN tmpPW_SqlAns
ENDIF
SELECT 0

IF nConn > 0
	
	IF nOper_ID = 0
		nOper_ID =  Get_rtr_Oper_Number(cOperation,nConn)
	ENDIF
		
	IF nOper_ID > 0	
		
		PRIVATE lFound
		lFound = .F.
		
		cSQL = "SELECT rD.Oper_Note,rD.Cncld "
		cSQL = cSQL + ",rD.Started, rD.Finished, rD.Detail, rD.rtr_ID "
		cSQL = cSQL + " FROM dbo.rtr "
		cSQL = cSQL + " INNER JOIN dbo.rtr_Detail rD ON rtr.ID = rD.rtr_ID "
		cSQL = cSQL + cWhere 
		cSQL = cSQL + " AND Oper_ID = "+STR(nOper_ID)
		
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_SqlAns' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_SqlAns' )
		ENDDO
		
		IF nSQLEXEC < 0  &&Try again. Problem query!
			nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_SqlAns' )
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL' TIMEOUT 1
				nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_SqlAns' )
			ENDDO
		ENDIF
		
		IF nSQLEXEC < 0
			SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPW_SqlAns')
			lReturnWorked = .F.
		ENDIF
		
		IF USED('tmpPW_SqlAns')
			IF RECCOUNT('tmpPW_SqlAns') > 0
				lFound = .T.
				SCAN
					lCncld = PrepareSQLlogic(tmpPW_SqlAns.Cncld,'Cncld',.F.)
					lStarted = PrepareSQLlogic(tmpPW_SqlAns.Started,'Started',.F.)
					lFinished = PrepareSQLlogic(tmpPW_SqlAns.Finished,'Finished',.F.)
					nDetail = PrepareSQLnum(tmpPW_SqlAns.Detail,'Detail',-3)
					biRTR_ID = PrepareSQLnum(tmpPW_SqlAns.RTR_ID,'RTR_ID',-4)
					IF lCncld
						*Already cancelled
					ELSE
						IF lStarted 
							PRIVATE cSQLu
							cSQLu = "UPDATE dbo.rtr_Detail "
							cSQLu = cSQLu + " SET Cncld = 1 "
							cSQLu = cSQLu + " WHERE rtr_ID ="+STR(biRTR_ID)
							cSQLu = cSQLu + " AND Detail="+STR(nDetail)
							cSQLu = cSQLu + " AND Oper_ID = "+STR(nOper_ID)
							
							nSQLEXEC = SQLEXEC(nConn, cSQLu, '' )
							DO WHILE nSQLEXEC = 0
								WAIT WINDOW 'SQL' TIMEOUT 1
								nSQLEXEC = SQLEXEC(nConn, cSQLu, '' )
							ENDDO
							
							IF nSQLEXEC < 0  &&Try again. Problem query!
								nSQLEXEC = SQLEXEC(nConn, cSQLu, '' )
								DO WHILE nSQLEXEC = 0
									WAIT WINDOW 'SQL' TIMEOUT 1
									nSQLEXEC = SQLEXEC(nConn, cSQLu, '' )
								ENDDO
							ENDIF
							
							IF nSQLEXEC < 0
								SQLEXECError(cSQLu ,nConn,nSQLEXEC, '')
								lReturnWorked = .F.
								
								TrackMess("Tried to cancel an Operation."+CHR(13)+cSQLu)
								RecordError(0,"Error" ,"Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(1),"Tried to cancel an Operation."+CHR(13)+cSQLu)

							ENDIF

						ENDIF
					ENDIF
				ENDSCAN
			ENDIF

			USE IN tmpPW_SqlAns
		ENDIF		

	ENDIF
	
	IF lNewConn 
		SQLDISCONNECT( nConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF


IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lReturnWorked
ENDPROC

*********************************
PROCEDURE rtr_Oper_Cancel2 
PARAMETERS vOrderType,vOrderNumber,pOper,pConnHandle
*rtr_Oper_Cancel('SOitem',cSOItem,"INV",ThisFormSet.nConnHandle)

*SET PROCEDURE TO Progs\Proc_WO ADDITIVE
*rtr_Oper_Cancel('SOitem',' 114000-01',"Radial Forge")


PRIVATE nOrderNumber,cOrderNumber, cOperation, nOper_ID

IF VARTYPE(vOrderType)<> "C"
	RecordError( 0, 'rtr_Oper_Stop', "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No vOrderType" )	
	RETURN .F.
ENDIF

IF NOT "PROC_SQL" $ SET("PROCEDURE")
	SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
ENDIF
IF NOT "PROC_SETUP" $ SET("PROCEDURE")
	SET PROCEDURE TO Progs\Proc_Setup ADDITIVE
ENDIF
IF NOT "Proc_ERP" $ SET("PROCEDURE")
	SET PROCEDURE TO Progs\Proc_ERP ADDITIVE
ENDIF


DO CASE
CASE vOrderType = "WO"
	nOrderNumber = PrepareSQLnum(vOrderNumber,'WO',-3)
	cOrderNumber = STR(nOrderNumber)
CASE vOrderType = "WO_Detail"
	nOrderNumber = PrepareSQLnum(vOrderNumber,'WO_Detail',-3)
	cOrderNumber = STR(nOrderNumber)
CASE vOrderType = "SOitem"
	nOrderNumber = Proper_PO_Item_PO(vOrderNumber)
	cOrderNumber = "'"+PrepareSQLtxt(vOrderNumber,'SOitem',10)+"'"
	
OTHERWISE
	RecordError( 0, 'rtr_Oper_Cancel', "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No vOrderType CASE" )	
	RETURN .F.
ENDCASE

IF NOT ( VARTYPE(pOper) = "C" OR VARTYPE(pOper) = "N"  )
	RecordError( 0, 'rtr_Oper_Cancel', "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No pOper" )	
	RETURN .F.
ENDIF

*Can pass in either Operation txt or ID
IF VARTYPE(pOper) = "C"
	cOperation = pOper
	nOper_ID = 0
ENDIF
IF VARTYPE(pOper) = "N"
	cOperation = ''
	nOper_ID = pOper
ENDIF

IF VARTYPE(lOper)<> "L"
	RecordError( 0, 'rtr_Oper_Cancel', "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No lOper" )	
	RETURN .F.
ENDIF


*!*	IF VARTYPE(lCncld)<> "L"
*!*		RecordError( 0, 'rtr_Oper_Cancel', "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No lCncld" )	
*!*		RETURN .F.
*!*	ENDIF
PRIVATE lCncld
lCncld =  .T.

*********
PRIVATE lReturnWorked
lReturnWorked = .T.


PRIVATE nConn, lNewConn
lNewConn = .F.
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
nConn = CheckSQLConnection(nConn)

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPW_SqlAns')
	USE IN tmpPW_SqlAns
ENDIF
SELECT 0

IF nConn > 0
	
	IF nOper_ID = 0
		nOper_ID =  Get_rtr_Oper_Number(cOperation,nConn)
	ENDIF
	
	IF lCncld
		
	ENDIF
		
	IF nOper_ID > 0	
	
		cSQL = "EXEC dbo.p_rtr_Oper "
		cSQL = cSQL + " '"+vOrderType+"'"
		cSQL = cSQL + " ,"+cOrderNumber+""
		cSQL = cSQL + " ,"+STR(nOper_ID)+""
		cSQL = cSQL + " ,0"	&&Stop
		
		*EXEC Router.dbo.p_rtr_Oper 'WO',CAST(1183 AS CHAR),520,0	--Insert CG Operation for WO
		
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_SqlAns' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_SqlAns' )
		ENDDO
		
		IF nSQLEXEC < 0  &&Try again. Problem query!
			nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_SqlAns' )
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL' TIMEOUT 1
				nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_SqlAns' )
			ENDDO
		ENDIF
		
		IF nSQLEXEC < 0
			SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPW_SqlAns')
			lReturnWorked = .F.
		ENDIF
		
		IF USED('tmpPW_SqlAns')
			IF VARTYPE(tmpPW_SqlAns.SalesRep ) = "C"
				lcReturnName = tmpPW_SqlAns.SalesRep 
			ENDIF

			USE IN tmpPW_SqlAns
		ENDIF
	ENDIF
	
	IF lNewConn 
		SQLDISCONNECT( nConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF


IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lReturnWorked
ENDPROC

*********************************
PROCEDURE Get_rtr_Oper_Number
PARAMETERS pOper_txt,pConnHandle
*Returns Opertion Number for Text

IF VARTYPE(pOper_txt) <> "C"
	RecordError( 0, 'Get_rtr_Oper_Number', "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No Oper_TXT" )	
	RETURN 0
ENDIF

PRIVATE lnOper_ID
lnOper_ID = 0

PRIVATE nConn, lNewConn
lNewConn = .F.
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
nConn = CheckSQLConnection(nConn)

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPW_SqlAns')
	USE IN tmpPW_SqlAns
ENDIF
SELECT 0

IF nConn > 0

	cSQL = "SELECT Oper_ID FROM dbo.rtr_Operation "
	cSQL = cSQL + " WHERE Operation = '"+pOper_txt+"'"
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_SqlAns' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn,  cSQL, 'tmpPW_SqlAns' )
	ENDDO
	
	IF nSQLEXEC < 0  &&Try again. Problem query!
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_SqlAns' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn,  cSQL, 'tmpPW_SqlAns' )
		ENDDO
	ENDIF
	
	IF nSQLEXEC < 0
		SQLEXECError(cSQL ,nConn, nSQLEXEC, 'tmpPW_SqlAns')
	ENDIF
	
	IF USED('tmpPW_SqlAns')
		IF RECCOUNT('tmpPW_SqlAns') > 0
			lnOper_ID = tmpPW_SqlAns.Oper_ID
		ENDIF

		USE IN tmpPW_SqlAns
	ENDIF
	

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF lNewConn 
	SQLDISCONNECT( nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lnOper_ID
ENDPROC

******************************************

PROCEDURE Operations_Text 
PARAMETERS pnOper_ID

IF VARTYPE(pnOper_ID)<> "N"
	RecordError( 0, 'Operations_Text', "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No Oper_ID" )	
	RETURN ' '
ENDIF

PRIVATE lcReturnName
lcReturnName = " "


PRIVATE nConn
nConn = get_SQLSTRINGCONNECT()

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPW_SqlAns')
	USE IN tmpPW_SqlAns
ENDIF
SELECT 0

IF nConn > 0

	cSQL = "SELECT Operation FROM dbo.rtr_Operation "
	cSQL = cSQL + " WHERE Oper_ID = "+STR(pnOper_ID)
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_SqlAns' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn,  cSQL, 'tmpPW_SqlAns' )
	ENDDO
	
	IF nSQLEXEC < 0  &&Try again. Problem query!
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_SqlAns' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn,  cSQL, 'tmpPW_SqlAns' )
		ENDDO
	ENDIF
	
	IF nSQLEXEC < 0
		SQLEXECError(cSQL ,nConn, nSQLEXEC, 'tmpPW_SqlAns')
	ENDIF
	
	IF USED('tmpPW_SqlAns')
		IF VARTYPE(tmpPW_SqlAns.Operation ) = "C"
			lcReturnName = tmpPW_SqlAns.Operation 
		ENDIF

		USE IN tmpPW_SqlAns
	ENDIF
	
	SQLDISCONNECT( nConn )
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN ALLTRIM(lcReturnName)
ENDPROC





******************************************

PROCEDURE get_OrderType 
PARAMETERS pSOitem,pPOitem,pWO,pWO_Detail
*cOrderType = get_OrderType(ThisForm.cSOitem,ThisForm.cPOitem,ThisForm.nWO,ThisForm.nWO_Detail)

PRIVATE cSOitem,cPOitem,nWO,nWO_Detail
IF VARTYPE(pSOitem)<> "C"
	RecordError( 0, 'get_OrderType ', "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No SOitem" )	
*	RETURN ' '
ENDIF
cSOitem = PrepareSQLtxt(pSOitem,'SOitem',10)

IF VARTYPE(pPOitem)<> "C"
	RecordError( 0, 'get_OrderType ', "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No pPOitem" )	
*	RETURN ' '
ENDIF
cPOitem = PrepareSQLtxt(pPOitem,'POitem',12)

IF VARTYPE(pWO)<> "N"
	RecordError( 0, 'get_OrderType ', "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No WO" )	
*	RETURN ' '
ENDIF
nWO = PrepareSQLnum(pWO,'WO',-3)

IF VARTYPE(pWO_Detail)<> "N"
	RecordError( 0, 'get_OrderType ', "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No pWO_Detail" )	
*	RETURN ' '
ENDIF
nWO_Detail = PrepareSQLnum(pWO_Detail,'WO_Detail',-3)

*StockLst_Detail_Insert is sized to allow CHAR(10) as OrderType
*This order aligns with Modify StockLst Detail
IF cSOitem <> Proper_SO_item('')
	RETURN "SOitem"
ENDIF
IF nWO > 0
	RETURN "WO"
ENDIF
IF nWO_Detail > 0
	RETURN "WO_Detail"
ENDIF
IF cPOitem <> Proper_PO_item('')
	RETURN "POitem"
ENDIF

RETURN ""
ENDPROC

******************************************

PROCEDURE get_OrderNum 
PARAMETERS pSOitem,pPOitem,pWO,pWO_Detail
*cOrderNum = get_OrderNum(ThisForm.cSOitem,ThisForm.cPOitem,ThisForm.nWO,ThisForm.nWO_Detail)

PRIVATE cSOitem,cPOitem,nWO,nWO_Detail
IF VARTYPE(pSOitem)<> "C"
	RecordError( 0, 'get_OrderNum', "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No SOitem" )	
*	RETURN ' '
ENDIF
cSOitem = PrepareSQLtxt(pSOitem,'SOitem',10)

IF VARTYPE(pPOitem)<> "C"
	RecordError( 0, 'get_OrderNum', "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No pPOitem" )	
*	RETURN ' '
ENDIF
cPOitem = PrepareSQLtxt(pPOitem,'POitem',12)

IF VARTYPE(pWO)<> "N"
	RecordError( 0, 'get_OrderNum', "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No WO" )	
*	RETURN ' '
ENDIF
nWO = PrepareSQLnum(pWO,'WO',-3)

IF VARTYPE(pWO_Detail)<> "N"
	RecordError( 0, 'get_OrderNum', "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No pWO_Detail" )	
*	RETURN ' '
ENDIF
nWO_Detail = PrepareSQLnum(pWO_Detail,'WO_Detail',-3)

*StockLst_Detail_Insert is sized to allow CHAR(13) as OrderNum
*This order aligns with Modify StockLst Detail
IF Proper_SO_Item(cSOitem) <> Proper_SO_item('')
	RETURN cSOitem 
ENDIF
IF nWO > 0
	RETURN STR(nWO)
ENDIF
IF nWO_Detail > 0
	RETURN STR(nWO_Detail)
ENDIF
IF Proper_PO_Item(cPOitem) <> Proper_PO_item('')
	RETURN cPOitem
ENDIF

RETURN ""
ENDPROC

******************************************

PROCEDURE getOperation_Oper_ID 
PARAMETERS pOper_ID, pConnHandle
*cOper_Note	= getOperation_Oper_ID(nOper_ID,nConn) 

PRIVATE nOper_ID, cReturn 
IF VARTYPE(pOper_ID)<> "N"
	RecordError( 0, 'PARAMETER', "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No nOper_ID" )	
	RETURN ' '
ENDIF
nOper_ID = pOper_ID
cReturn = ''

PRIVATE nConn, lNewConn
lNewConn = .F.
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
nConn = CheckSQLConnection(nConn)

IF nConn > 0
	PRIVATE cSQL, nSQLEXEC 
	PRIVATE cAlias 
	cAlias = ALIAS()

	IF USED("tmpPW_RTRop")
		USE IN tmpPW_RTRop
	ENDIF
	cSQL = "SELECT dbo.f_rtr_getOperation_Oper_ID("+STR(nOper_ID)+") AS Operation "

	SELECT 0
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPW_RTRop')
	
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPW_RTRop')
	ENDDO
	IF nSQLEXEC < 0
		SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPW_RTRop')
	ENDIF
	
	IF USED("tmpPW_RTRop")
		IF RECCOUNT('tmpPW_RTRop')>0
			cReturn = tmpPW_RTRop.Operation 
		ENDIF
		USE IN tmpPW_RTRop
	ENDIF
ELSE 
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN ' '
ENDIF

IF lNewConn 
	SQLDISCONNECT( nConn )
ENDIF
	
IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF
	
RETURN cReturn 
ENDPROC

******************************************

PROCEDURE getDetail_Oper_ID
PARAMETERS pOper_ID, pConnHandle
*nDetail = getDetail_Oper_ID(nOper_ID,nConn) 

PRIVATE nOper_ID, nReturn 
IF VARTYPE(pOper_ID)<> "N"
	RecordError( 0, 'PARAMETER', "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No nOper_ID" )	
	RETURN -1
ENDIF
nOper_ID = pOper_ID
nReturn = 0

PRIVATE nConn, lNewConn
lNewConn = .F.
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
nConn = CheckSQLConnection(nConn)

IF nConn > 0
	PRIVATE cSQL, nSQLEXEC 
	PRIVATE cAlias 
	cAlias = ALIAS()

	IF USED("tmpPW_RTRop")
		USE IN tmpPW_RTRop
	ENDIF
	cSQL = "SELECT dbo.f_rtr_getDetail_Oper_ID("+STR(nOper_ID)+") AS Detail"

	SELECT 0
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPW_RTRop')
	
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPW_RTRop')
	ENDDO
	IF nSQLEXEC < 0
		SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPW_RTRop')
	ENDIF
	
	IF USED("tmpPW_RTRop")
		IF RECCOUNT('tmpPW_RTRop')>0
			nReturn = tmpPW_RTRop.Detail
		ENDIF
		USE IN tmpPW_RTRop
	ENDIF
ELSE 
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN -1
ENDIF

IF lNewConn 
	SQLDISCONNECT( nConn )
ENDIF
	
IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF
	
RETURN nReturn 
ENDPROC




*********************************************

*nOper_ID = get_Oper_ID('Radial Forge')

*nStdDetail = get_StndDetail('Radial Forge')