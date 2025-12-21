*IF NOT "PROC_WO" $ SET("PROCEDURE")  &&Added for when Quotes is run without HPA menu.
*	SET PROCEDURE TO Progs\Proc_WO ADDITIVE
*ENDIF

***********************************************************************************************
*GetNextWorkOrder  
*GetNextWorkOrder_Detail 
*getWO_Detail_DueDate  
*GetWO_WO_Detail GetWO_SOitem GetWOD_SOitem
*getWorkOrder_POitem  getWOD_POitem  getWO_with_POitem  getWOD_with_POitem  
*Update_WO_POitem_Test Update_WOD_POitem_Test WO_POitem_Test
*get_WO_from_POitem HPAPOneedsWO
*get_Description_WO get_Description_WOD 
*getHeat_WO 
*Is_Production_WO_SOi  
*Is_InternalProduction_SOi 
*OType_Proper Is_OTyp
*CheckSOforProduction
*getSalesRep_WO getSalesRep_WOD

*
*DoesSOitem_need_rtr DoesWO_Detail_need_rtr
*
*get_OrderType get_OrderNum getOperation_Oper_ID getDetail_Oper_ID 
*
*Count_WOinWO 
*Count_WODinWO_Detail Save_ItemCost_WO   Count_WOinWO_Detail 
*Count_WODinWOD_WOD Count_WODinWO_WO 
*
*GetMachine_Init GetMachine_Caption GetMachine_LogList GetMachine_Log Get_ID_Mach_Lot
*Progs\Proc_SQL has Get_Machine_fromLot Get_LOG_fromLot getLot_Machine_Log

* CheckPoTest_Pass 
*
*GetNext_Sched_Position
*is_WO
*Get_QTY_WO

***********************************************************************************************

PROC GetNextWorkOrder 
PARAMETER pConnHandle
*GetNextWorkOrder ( ThisForm.nConnHandle )

PRIVATE nConn, lNewConn, nMax
lNewConn = .F.
nMax = 0
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

PRIVATE cSQL, nSQLEXEC
PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPW_Max')
	USE IN tmpPW_Max
ENDIF
SELECT 0

IF nConn > 0
	cSQL = "SELECT MAX(WO) AS MaxO FROM dbo.WorkOrder "
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_Max' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn,  cSQL, 'tmpPW_Max' )
	ENDDO
	IF nSQLEXEC < 0
		SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPW_Max')
	ENDIF
	
	IF USED('tmpPW_Max')
		IF VARTYPE(tmpPW_Max.MaxO) = "N"
			nMax = tmpPW_Max.MaxO + 1
		ENDIF
		IF ISNULL(tmpPW_Max.MaxO)
			nMax = 1000
		ENDIF
		USE IN tmpPW_Max
	ENDIF

	IF lNewConn 
		SQLDISCONNECT(nConn )
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

RETURN nMax 
ENDPROC

***********************************************************************************************

PROC GetNextWorkOrder_Detail
PARAMETER pConnHandle
*GetNextWorkOrder_Detail( ThisForm.nConnHandle )

PRIVATE nConn, lNewConn, nMax
lNewConn = .F.
nMax = 0
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

PRIVATE cSQL, nSQLEXEC
PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPW_Max')
	USE IN tmpPW_Max
ENDIF
SELECT 0

IF nConn > 0
	cSQL = "SELECT MAX(WO_Detail) AS MaxO FROM dbo.WorkOrder_Detail "
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_Max' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn,  cSQL, 'tmpPW_Max' )
	ENDDO
	IF nSQLEXEC < 0
		SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPW_Max')
	ENDIF
	
	IF USED('tmpPW_Max')
		IF VARTYPE(tmpPW_Max.MaxO) = "N"
			nMax = tmpPW_Max.MaxO + 1
		ENDIF
		IF ISNULL(tmpPW_Max.MaxO)
			nMax = 1000
		ENDIF
		USE IN tmpPW_Max
	ENDIF

	IF lNewConn 
		SQLDISCONNECT(nConn )
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

RETURN nMax 
ENDPROC

*********************************

PROCEDURE getWO_Detail_DueDate
PARAMETERS nWO, pConnHandle
*dDueDate = getWO_Detail_DueDate( nWO, ThisForm.nConnHandle)


IF VARTYPE(nWO) != "N"
	RETURN CTOD('')
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

PRIVATE dReturn
dReturn = CTOD('')

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL

IF USED('tmpPW_WO_DdueDate')
	USE IN tmpPW_WO_DdueDate
ENDIF


IF nConn > 0 

	cSQL = "SELECT TOP 1 fDueDate "
	cSQL = cSQL+" FROM dbo.WorkOrder_Detail "
	cSQL = cSQL+" WHERE WO = "+ALLTRIM(STR(nWO))
	cSQL = cSQL+" ORDER BY fDueDate "
	
	SELECT 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_WO_DdueDate' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn,  cSQL, 'tmpPW_WO_DdueDate' )
	ENDDO
	IF nSQLEXEC < 0
		SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPW_WO_DdueDate')
	ENDIF
	
	IF USED('tmpPW_WO_DdueDate')
		IF RECCOUNT('tmpPW_WO_DdueDate') > 0
			IF NOT EMPTY(tmpPW_WO_DdueDate.fDueDate)
				dReturn = tmpPW_WO_DdueDate.fDueDate
			ENDIF
		ENDIF
		USE IN tmpPW_WO_DdueDate
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


RETURN dReturn
ENDPROC
*********************************

PROCEDURE GetWO_WO_Detail  
PARAMETERS nWO_Detail, pConnHandle
*nWO = GetWO_WO_Detail( nWO_Detail, ThisForm.nConnHandle)
*Get WO from WO_Detail

IF VARTYPE(nWO_Detail) != "N"
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

PRIVATE nReturn
nReturn = 0

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL

IF USED('tmpPW_WO_POi')
	USE IN tmpPW_WO_POi
ENDIF


IF nConn > 0 

	cSQL = "SELECT WO "
	cSQL = cSQL+" FROM dbo.WorkOrder_Detail WITH(NOLOCK) "
	cSQL = cSQL+" WHERE WO_Detail = "+ALLTRIM(STR(nWO_Detail))
	
	SELECT 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_WO_POi' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn,  cSQL, 'tmpPW_WO_POi' )
	ENDDO
	IF nSQLEXEC < 0
		SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPW_WO_POi')
	ENDIF
	
	IF USED('tmpPW_WO_POi')
		IF RECCOUNT('tmpPW_WO_POi') > 0
			nReturn = PrepareSQLnum(tmpPW_WO_POi.WO,'WO',-3)
		ENDIF
		USE IN tmpPW_WO_POi
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


RETURN nReturn 
ENDPROC


*********************************

PROCEDURE GetWO_SOitem 
PARAMETERS cSOitem, pConnHandle
*nWO = GetWO_SOitem( cSOitem, ThisForm.nConnHandle)
*Get WO from SOitem

IF VARTYPE(cSOitem) != "C"
	RETURN 0
ENDIF
IF Proper_SO_Item(cSOitem) = Proper_SO_Item("")
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

PRIVATE nReturn
nReturn = 0

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL

IF USED('tmpPW_WO_POi')
	USE IN tmpPW_WO_POi
ENDIF


IF nConn > 0 

	cSQL = "SELECT WO.WO "
	cSQL = cSQL+" FROM dbo.WorkOrder WO "
	cSQL = cSQL+" LEFT OUTER JOIN dbo.WorkOrder_Detail WOD ON WO.WO = WOD.WO "
	cSQL = cSQL+" WHERE WO.SOitem = dbo.f_ProperSOitem('"+cSOitem+"')"
	cSQL = cSQL+" OR WOD.fSOitem = dbo.f_ProperSOitem('"+cSOitem+"')"

	
	
	SELECT 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_WO_POi' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn,  cSQL, 'tmpPW_WO_POi' )
	ENDDO
	IF nSQLEXEC < 0
		SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPW_WO_POi')
	ENDIF
	
	IF USED('tmpPW_WO_POi')
		IF RECCOUNT('tmpPW_WO_POi') > 0
			nReturn = PrepareSQLnum(tmpPW_WO_POi.WO,'WO',-3)
		ENDIF
		USE IN tmpPW_WO_POi
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


RETURN nReturn 
ENDPROC


*********************************

PROCEDURE GetWOD_SOitem 
PARAMETERS cSOitem, pConnHandle
*nWO_Detail = GetWOD_SOitem( cSOitem, ThisForm.nConnHandle)
*Get WO from SOitem

IF VARTYPE(cSOitem) != "C"
	RETURN 0
ENDIF
IF Proper_SO_Item(cSOitem) = Proper_SO_Item("")
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

PRIVATE nReturn
nReturn = 0

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL

IF USED('tmpPW_WO_POi')
	USE IN tmpPW_WO_POi
ENDIF


IF nConn > 0 

	cSQL = "SELECT WOD.WO_Detail "
	cSQL = cSQL+" FROM dbo.WorkOrder_Detail WOD WITH(NOLOCK) "
	cSQL = cSQL+" WHERE WOD.fSOitem = dbo.f_ProperSOitem('"+cSOitem+"')"
	
	
	SELECT 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_WO_POi' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn,  cSQL, 'tmpPW_WO_POi' )
	ENDDO
	IF nSQLEXEC < 0
		SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPW_WO_POi')
	ENDIF
	
	IF USED('tmpPW_WO_POi')
		IF RECCOUNT('tmpPW_WO_POi') > 0
			nReturn = PrepareSQLnum(tmpPW_WO_POi.WO_Detail,'WO_Detail',-3)
		ENDIF
		USE IN tmpPW_WO_POi
	ENDIF
	
	
	******
	IF nReturn = 0
		cSQL = "SELECT TOP 1 WOD.WO_Detail "
		cSQL = cSQL+" FROM dbo.WorkOrder WO WITH(NOLOCK) "
		cSQL = cSQL+" INNER JOIN dbo.WorkOrder_Detail WOD WITH(NOLOCK) ON WO.WO=WOD.WO"
		cSQL = cSQL+" WHERE WO.SOitem = dbo.f_ProperSOitem('"+cSOitem+"')"
		
		SELECT 0
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_WO_POi' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn,  cSQL, 'tmpPW_WO_POi' )
		ENDDO
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPW_WO_POi')
		ENDIF
		
		IF USED('tmpPW_WO_POi')
			IF RECCOUNT('tmpPW_WO_POi') > 0
				nReturn = PrepareSQLnum(tmpPW_WO_POi.WO_Detail,'WO_Detail',-3)
			ENDIF
			USE IN tmpPW_WO_POi
		ENDIF

	ENDIF	
	
	****************
		
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


RETURN nReturn 
ENDPROC
********************************* 

PROCEDURE getWorkOrder_POitem
PARAMETERS nWO, pConnHandle
*cPOitem = getWorkOrder_POitem( nWO, ThisForm.nConnHandle)


IF VARTYPE(nWO) != "N"
	RETURN ''
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

PRIVATE cReturn
cReturn = ''

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL

IF USED('tmpPW_WO_POi')
	USE IN tmpPW_WO_POi
ENDIF


IF nConn > 0 

	cSQL = "SELECT POitem "
	cSQL = cSQL+" FROM dbo.WorkOrder WITH(NOLOCK) "
	cSQL = cSQL+" WHERE WO = "+ALLTRIM(STR(nWO))
*	cSQL = cSQL+" AND LEN(ISNULL(Poitem,''))>3 "
	
	SELECT 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_WO_POi' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn,  cSQL, 'tmpPW_WO_POi' )
	ENDDO
	IF nSQLEXEC < 0
		SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPW_WO_POi')
	ENDIF
	
	IF USED('tmpPW_WO_POi')
		IF RECCOUNT('tmpPW_WO_POi') > 0
			cReturn = PrepareSQLtxt(tmpPW_WO_POi.POitem,'POitem',12)
		ENDIF
		USE IN tmpPW_WO_POi
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


RETURN cReturn 
ENDPROC

********************************* 

PROCEDURE getWOD_POitem  
PARAMETERS nWO_Detail, pConnHandle, pWhat
*cPOitem = getWOD_POitem( nWO_Detail, ThisForm.nConnHandle,'TestPO') 

IF VARTYPE(nWO_Detail) != "N"
	RETURN ''
ENDIF
IF VARTYPE(pWhat)!= 'C'
	pWhat = ''
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

PRIVATE cReturn
cReturn = ''

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL

IF USED('tmpPW_WO_POi')
	USE IN tmpPW_WO_POi
ENDIF


IF nConn > 0 
	IF pWhat = 'TestPO'
		cSQL = "SELECT TestPO "
	ELSE
		cSQL = "SELECT fPOitem "
	ENDIF
	cSQL = cSQL+" FROM dbo.WorkOrder_Detail WITH(NOLOCK) "
	cSQL = cSQL+" WHERE WO_Detail = "+ALLTRIM(STR(nWO_Detail))
	
	SELECT 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_WO_POi' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn,  cSQL, 'tmpPW_WO_POi' )
	ENDDO
	IF nSQLEXEC < 0
		SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPW_WO_POi')
	ENDIF
	
	IF USED('tmpPW_WO_POi')
		IF RECCOUNT('tmpPW_WO_POi') > 0
			cReturn = PrepareSQLtxt(tmpPW_WO_POi.POitem,'POitem',12)
		ENDIF
		USE IN tmpPW_WO_POi
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


RETURN cReturn 
ENDPROC

********************************* 

PROCEDURE getWO_with_POitem  
PARAMETERS cPOitem, pConnHandle, pWhat
*nWO = getWO_with_POitem( POitem, ThisForm.nConnHandle) 

cPOitem = PrepareSQLtxt(cPOitem,'POitem',12)
IF Proper_PO_item(cPOitem) = Proper_PO_item()
	RETURN 0
ENDIF
IF VARTYPE(pWhat)!= 'C'
	pWhat = ''
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

PRIVATE nReturn
nReturn = 0

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL

IF USED('tmpPW_WO_POi')
	USE IN tmpPW_WO_POi
ENDIF


IF nConn > 0 
	
	cSQL = "SELECT WO "
	cSQL = cSQL+" FROM dbo.WorkOrder WITH(NOLOCK) "
	cSQL = cSQL+" WHERE POitem = '"+cPOitem+"'"
	*TestPO, fPOitem
	
	SELECT 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_WO_POi' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn,  cSQL, 'tmpPW_WO_POi' )
	ENDDO
	IF nSQLEXEC < 0
		SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPW_WO_POi')
	ENDIF
	
	IF USED('tmpPW_WO_POi')
		IF RECCOUNT('tmpPW_WO_POi') > 0
			nReturn = PrepareSQLnum(tmpPW_WO_POi.WO,'WO',-3)
		ENDIF
		IF RECCOUNT('tmpPW_WO_POi') > 1
			TrackError("Returned too many WO's"+CHR(13)+cSQL,"Returned too many WOs","Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
		ENDIF
		USE IN tmpPW_WO_POi
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


RETURN nReturn 
ENDPROC

********************************* 

PROCEDURE getWOD_with_POitem  
PARAMETERS cPOitem, pConnHandle, pWhat
*nWO_Detail = getWOD_with_POitem( POitem, ThisForm.nConnHandle) 

cPOitem = PrepareSQLtxt(cPOitem,'POitem',12)
IF Proper_PO_item(cPOitem) = Proper_PO_item()
	RETURN 0
ENDIF
IF VARTYPE(pWhat)!= 'C'
	pWhat = ''
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

PRIVATE nReturn
nReturn = 0

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL

IF USED('tmpPW_WO_POi')
	USE IN tmpPW_WO_POi
ENDIF


IF nConn > 0 
	
	cSQL = "SELECT WO_Detail "
	cSQL = cSQL+" FROM dbo.WorkOrder_Detail WITH(NOLOCK) "
	cSQL = cSQL+" WHERE fPOitem = '"+cPOitem+"'"
	cSQL = cSQL+" or TestPO = '"+cPOitem+"'"
	*TestPO, fPOitem
	
	SELECT 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_WO_POi' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn,  cSQL, 'tmpPW_WO_POi' )
	ENDDO
	IF nSQLEXEC < 0
		SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPW_WO_POi')
	ENDIF
	
	IF USED('tmpPW_WO_POi')
		IF RECCOUNT('tmpPW_WO_POi') > 0
			nReturn = PrepareSQLnum(tmpPW_WO_POi.WO_Detail,'WO_Detail',-3)
		ENDIF
		IF RECCOUNT('tmpPW_WO_POi') > 1
			TrackError("Returned too many WO_Details"+CHR(13)+cSQL,"Returned too many WO_Details","Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
		ENDIF
		USE IN tmpPW_WO_POi
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


RETURN nReturn 
ENDPROC
********************************* 

PROCEDURE Update_WO_POitem_Test 
PARAMETERS nWO, cPOItem, pConnHandle, lPass
*lOK = Update_WO_POitem_Test( nWO, cPOItem, ThisForm.nConnHandle, lPass)

IF VARTYPE(nWO) != 'N'
	RETURN .F.
ENDIF

IF VARTYPE(cPOItem) != "C"
	RETURN .F.
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

PRIVATE cReturn
cReturn = ''

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL


IF nConn > 0 
	PRIVATE cTestPOitem
	 cTestPOitem = getWorkOrder_POitem( nWO, nConn)
	 
	IF NOT Proper_PO_Item(cTestPOitem) = Proper_PO_Item(cPOitem)
		*Try to save this POitem to WO.
	
		cSQL = "UPDATE dbo.WorkOrder SET "
		cSQL = cSQL+" POitem = dbo.f_ProperPOitem('"+cPOitem+"')"
		cSQL = cSQL+" WHERE WO = "+ALLTRIM(STR(nWO))
		cSQL = cSQL+" AND dbo.f_ProperPOitem(POitem) = dbo.f_ProperPOitem('')"
		*only update if empty
		
			
		SELECT 0
		nSQLEXEC = SQLEXEC(nConn, cSQL, '' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn,  cSQL, '' )
		ENDDO
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, nConn, nSQLEXEC, '')
		ENDIF
		
	ENDIF
	*Send Alert to SalesRep that Services is done.
		

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


RETURN cReturn 
ENDPROC
********************************* 


PROCEDURE WO_POitem_Test
PARAMETERS nWO, cPOItem, cText, pConnHandle
*lOK = WO_POitem_Test( nWO, cPOItem, cText, ThisForm.nConnHandle)

IF VARTYPE(nWO) != 'N'
	nWO = 0
ENDIF

IF VARTYPE(cPOItem) != "C"
	cPOItem = ''
ENDIF

IF VARTYPE(cText) != "C"
	cText = ''
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

PRIVATE lReturn
lReturn = .F.

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL
cSQL = ""

IF nConn > 0 
	IF nWO > 0
		lReturn = .T.
	ELSE
		IF Proper_PO_item(cPOitem) <> Proper_PO_item('')
		
			cSQL = "SELECT Services,Equipment,Stock FROM dbo.PurchaseOrder "
			cSQL = cSQL+" WHERE POitem = dbo.f_ProperPOitem('"+cPOitem+"')"  +";"
	
			SELECT 0		
			IF USED("tmpPOiStock")
				USE IN tmpPOiStock
			ENDIF
	
			IF cText = 'STOCK'
	
				nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPOiStock' )
				DO WHILE nSQLEXEC = 0
					WAIT WINDOW 'SQL' TIMEOUT 1
				nSQLEXEC = SQLEXEC(nConn,  cSQL, 'tmpPOiStock' )
				ENDDO
				IF nSQLEXEC < 0
					SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPOiStock')
				ENDIF
				
				
				IF USED('tmpPOiStock')
					IF RECCOUNT('tmpPOiStock') > 0
						IF cText = 'STOCK'
							IF PrepareSQLbit(tmpPOiStock.Services,'Services') ;
								OR PrepareSQLbit(tmpPOiStock.Equipment,'Equipment') 
								
								lReturn = .F.
							ELSE
								lReturn = .T.
							ENDIF
						ENDIF
					ENDIF
					USE IN tmpPOiStock
				ENDIF
				
			ENDIF			
		ENDIF	
	ENDIF
	*Send Alert to SalesRep that Services is done.
		

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


RETURN lReturn 
ENDPROC
********************************* 

PROCEDURE Update_WOD_POitem_Test 
PARAMETERS nWO_Detail, cPOItem, pConnHandle, lPass
*lOK = Update_WOD_POitem_Test( nWO_Detail, cPOItem, ThisForm.nConnHandle, lPass)

IF VARTYPE(nWO_Detail) != 'N'
	RETURN .F.
ENDIF

IF VARTYPE(cPOItem) != "C"
	RETURN .F.
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

PRIVATE cReturn
cReturn = ''

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL

IF nConn > 0 
	PRIVATE cTestPOitem
	 cTestPOitem = getWOD_POitem( nWO_Detail, cPOitem, nConn, 'TestPO')
	 
	IF NOT Proper_PO_Item(cTestPOitem) = Proper_PO_Item(cPOitem)
		*Try to save this POitem as TestPO to WOD.
	
		cSQL = "UPDATE dbo.WorkOrder_Detail_Detail SET "
		cSQL = cSQL+" TestPO = dbo.f_ProperPOitem('"+cPOitem+"')"
		cSQL = cSQL+" WHERE WO_Detail = "+ALLTRIM(STR(nWO_Detail))
		*cSQL = cSQL+" AND dbo.f_ProperPOitem(POitem) = dbo.f_ProperPOitem('')"
		*only update if empty
		
			
		SELECT 0
		nSQLEXEC = SQLEXEC(nConn, cSQL, '' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn,  cSQL, '' )
		ENDDO
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, nConn, nSQLEXEC, '')
		ENDIF
		
	ENDIF
	*Send Alert to SalesRep that Services is done.
		

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


RETURN cReturn 
ENDPROC

*********************************

PROCEDURE get_WO_from_POitem
PARAMETERS cPOitem, pConnHandle
*nWO = get_WO_from_POitem( cPOitem, ThisForm.nConnHandle)


IF VARTYPE(cPOitem) != "C"
	RETURN 0
ENDIF
IF Proper_PO_Item(cPOItem) = Proper_PO_Item("0-00")
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

PRIVATE nReturn
nReturn = 0

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL

IF USED('tmpPW_WO_POi')
	USE IN tmpPW_WO_POi
ENDIF


IF nConn > 0 

	cSQL = "SELECT WO "
	cSQL = cSQL+" FROM dbo.WorkOrder WITH(NOLOCK) "
	cSQL = cSQL+" WHERE POitem = dbo.f_ProperPOitem('"+cPOitem+"')"
	
	SELECT 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_WO_POi' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn,  cSQL, 'tmpPW_WO_POi' )
	ENDDO
	IF nSQLEXEC < 0
		SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPW_WO_POi')
	ENDIF
	
	IF USED('tmpPW_WO_POi')
		IF RECCOUNT('tmpPW_WO_POi') > 0
			nReturn = PrepareSQLnum(tmpPW_WO_POi.WO,'WO',-3)
		ENDIF
		USE IN tmpPW_WO_POi
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


RETURN nReturn 
ENDPROC

*********************************

PROCEDURE HPAPOneedsWO
PARAMETERS nHPAPO, pConnHandle
*nWO = HPAPOneedsWO( nHPAPO, ThisForm.nConnHandle)


IF VARTYPE(nHPAPO) != "N"
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

PRIVATE nReturn
nReturn = 0

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL

IF USED('tmpPW_POitems')
	USE IN tmpPW_POitems
ENDIF

PRIVATE cPOitem, nWO, nWO_Detail, cMess

IF nConn > 0 
	
	
	cSQL = "SELECT POitem "
	cSQL = cSQL+" FROM dbo.PurchaseOrder WITH(NOLOCK) "
	cSQL = cSQL+" WHERE HPAPO = "+STR(nHPAPO)
	cSQL = cSQL+" AND ISNULL(ConvServ,0) = 1"
	cSQL = cSQL+" AND ISNULL(Cmplt,0) = 0"
	cSQL = cSQL+" AND ISNULL(Cancelled,0) = 0"
	
	SELECT 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_POitems' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn,  cSQL, 'tmpPW_POitems' )
	ENDDO
	IF nSQLEXEC < 0
		SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPW_POitems')
	ENDIF
	
	IF USED('tmpPW_POitems')
		IF RECCOUNT('tmpPW_POitems') > 0
			SCAN
				cPOitem = PrepareSQLtxt(tmpPW_POitems.POitem,'POitem',12)
				*getWorkOrder_POitem  getWOD_POitem  getWO_with_POitem  getWOD_with_POitem  get_WO_from_POitem
				nWO = getWO_with_POitem( cPOitem, nConn) 
				nWO_Detail = getWOD_with_POitem( cPOitem, nConn) 
				IF nWO+nWO_Detail = 0
					cMess = "POitem "+ALLTRIM(cPOitem)+" is a Conversion Service Order." + CHR(13)+ CHR(13)
					cMess = cMess + "A Work Order or WO Detail needs to be created." + CHR(13)+ CHR(13)
					cMess = cMess + "If material is going to be taken off stock" + CHR(13)
					cMess = cMess + "the WO lets the accountanst know where the stock went." + CHR(13)+ CHR(13)
					cMess = cMess + "When the conversion is done the Receiving department" + CHR(13)
					cMess = cMess + "has a WO Detail to receiving in to HPA." + CHR(13)+ CHR(13)
					cMess = cMess + "Please create the WO." 
					MESSAGEBOX(cMess,48,"Needs a WorkOrder")
					EXIT		&&only warning is good for now.
				ENDIF
				SELECT tmpPW_POitems
			ENDSCAN
		ENDIF
		USE IN tmpPW_POitems
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


RETURN nReturn 
ENDPROC

**********************************

PROCEDURE get_Description_WO 
PARAMETERS nWO, pConnHandle, lAddAlloy
*get_Description_WO(nWO,ThisForm.nConnHandle,lAddAlloy)

PRIVATE cReturn
cReturn = ''

IF VARTYPE(nWO) != "N"
	RETURN ''
ENDIF

IF VARTYPE(lAddAlloy) != "L"
	lAddAlloy = .F.
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

PRIVATE cSQL, nSQLEXEC 

IF USED("tmpPW_Desc")
	USE IN tmpPW_Desc
ENDIF

cSQL = "SELECT sAlloy AS Alloy, sCC AS CC, sPieces AS PC"
cSQL = cSQL + " ,dbo.f_ItemDescriptionMetric(sForm,sThck,sSz2,sSz3,sWeight,0,0,'','','') AS ItemDescription  "
cSQL = cSQL + " FROM dbo.WorkOrder WITH(NOLOCK) "
cSQL = cSQL + " WHERE WO = "+STR(nWO)

SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_Desc')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPW_Desc' )
ENDDO
IF nSQLEXEC < 0
	SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPW_Desc')
ENDIF

IF USED('tmpPW_Desc')
	IF VARTYPE(tmpPW_Desc.ItemDescription)="C"
		*cReturn = ALLTRIM(tmpPW_Desc.ItemDescription)
		IF lAddAlloy
			IF PrepareSQLtxt(tmpPW_Desc.CC,'CC',1) = '1'
				cReturn = ALLTRIM(tmpPW_Desc.Alloy) +" "
			ELSE
				cReturn = ALLTRIM(tmpPW_Desc.Alloy) +" CC:" +PrepareSQLtxt(tmpPW_Desc.CC,'CC',1) + " " 
			ENDIF

			PRIVATE nPCS
			nPCS = PrepareSQLnum(tmpPW_Desc.PC,'PC',3)
			IF nPCS > 0
				cReturn = cReturn + ALLTRIM(STR(nPCS,10,0))+" PC"
				IF nPCS > 1
					cReturn = cReturn + "s "
				ELSE
					cReturn = cReturn + " "
				ENDIF
			ENDIF
			cReturn = cReturn + ALLTRIM(tmpPW_Desc.ItemDescription )
		ELSE
			cReturn = ALLTRIM(tmpPW_Desc.ItemDescription )	
		ENDIF
		
	ENDIF
ENDIF

IF USED('tmpPW_Desc')
	USE IN tmpPW_Desc
ENDIF

IF lNewConn
	SQLDISCONNECT(nConn )
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

**********************************

PROCEDURE get_Description_WOD 
PARAMETERS nWO_Detail, pConnHandle, lAddAlloy
*get_Description_WOD(nWO_Detail,ThisForm.nConnHandle,lAddAlloy)

PRIVATE cReturn
cReturn = ''

IF VARTYPE(nWO_Detail) != "N"
	RETURN ''
ENDIF

IF VARTYPE(lAddAlloy) != "L"
	lAddAlloy = .F.
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

PRIVATE cSQL, nSQLEXEC 

IF USED("tmpPW_Desc")
	USE IN tmpPW_Desc
ENDIF

cSQL = "SELECT fAlloy AS Alloy, fCC AS CC, fPieces AS PC"
cSQL = cSQL + "  ,dbo.f_ItemDescriptionMetric(fForm,fThck,fSz2,fSz3,fWeight,0,0,'','','') AS ItemDescription   "
cSQL = cSQL + " FROM dbo.WorkOrder_Detail WITH(NOLOCK) "
cSQL = cSQL + " WHERE WO_Detail= "+STR(nWO_Detail)

SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_Desc')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPW_Desc' )
ENDDO
IF nSQLEXEC < 0
	SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPW_Desc')
ENDIF

IF USED('tmpPW_Desc')
	IF VARTYPE(tmpPW_Desc.ItemDescription)="C"
		*cReturn = ALLTRIM(tmpPW_Desc.ItemDescription)
		IF lAddAlloy
			IF tmpPW_Desc.CC = '1'
				cReturn = ALLTRIM(tmpPW_Desc.Alloy) +" "
			ELSE
				cReturn = ALLTRIM(tmpPW_Desc.Alloy) +" CC:"+tmpPW_Desc.CC + " " 
			ENDIF

			PRIVATE nPCS
			nPCS = PrepareSQLnum(tmpPW_Desc.PC,'PC',3)
			IF nPCS > 0
				cReturn = cReturn + ALLTRIM(STR(nPCS,10,0))+" PC"
				IF nPCS > 1
					cReturn = cReturn + "s "
				ELSE
					cReturn = cReturn + " "
				ENDIF
			ENDIF
			cReturn = cReturn + ALLTRIM(tmpPW_Desc.ItemDescription )
		ELSE
			cReturn = ALLTRIM(tmpPW_Desc.ItemDescription )	
		ENDIF
		
	ENDIF
ENDIF

IF USED('tmpPW_Desc')
	USE IN tmpPW_Desc
ENDIF

IF lNewConn
	SQLDISCONNECT(nConn )
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
**********************************

PROCEDURE getHeat_WO 
PARAMETERS nWO, nWO_Detail, pConnHandle
*get_Heat_WO (nWO,nWO_Detail,ThisForm.nConnHandle)

PRIVATE cReturn
cReturn = ''

IF VARTYPE(nWO) != "N"
	nWO = 0
ENDIF
IF VARTYPE(nWO_Detail) != "N"
	nWO_Detail= 0
ENDIF

IF nWO + nWO_Detail = 0
	RETURN ''
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

PRIVATE cSQL, nSQLEXEC 

IF USED("tmpPW_Desc")
	USE IN tmpPW_Desc
ENDIF

cSQL = "SELECT TOP 1 WO.sHeat "
cSQL = cSQL + " FROM dbo.WorkOrder WO WITH(NOLOCK) "

IF nWO > 0
	cSQL = cSQL + " WHERE WO.WO = "+STR(nWO)
ENDIF
IF nWO_Detail > 0
	cSQL = cSQL + " INNER JOIN dbo.WorkOrder_Detail WOD WITH(NOLOCK) ON WO.WO = WOD.WO "
	cSQL = cSQL + " WHERE WOD.WO_Detail = "+STR(nWO_Detail )
ENDIF


SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_Desc')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPW_Desc' )
ENDDO
IF nSQLEXEC < 0
	SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPW_Desc')
ENDIF

IF USED('tmpPW_Desc')
	IF RECCOUNT('tmpPW_Desc') > 0
		cReturn = PrepareSQLtxt(tmpPW_Desc.sHeat,'Heat',50)
	ENDIF
ENDIF

IF USED('tmpPW_Desc')
	USE IN tmpPW_Desc
ENDIF

IF lNewConn
	SQLDISCONNECT(nConn )
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

*********************************

PROCEDURE Is_Production_WO_SOi
PARAMETERS cSOitem, pConnHandle
*lIs_Production_WO = Is_Production_WO_SOi( cSOitem, ThisForm.nConnHandle )

IF VARTYPE(cSOitem) != "C"
	RETURN .F.
ENDIF
IF EMPTY(cSOitem) 
	RETURN .F.
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

PRIVATE lFoundWO 
lFoundWO = .F.

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL

IF USED('tmpPW_WO_SOi')
	USE IN tmpPW_WO_SOi
ENDIF
SELECT 0

IF nConn > 0 

	cSQL = "SELECT COUNT(*) AS CNTD"
	cSQL = cSQL+" FROM dbo.WorkOrder WITH(NOLOCK) "
	cSQL = cSQL+" WHERE SOitem = dbo.f_ProperSOitem('"+cSOItem+"')"
	
	SELECT 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_WO_SOi' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn,  cSQL, 'tmpPW_WO_SOi' )
	ENDDO
	IF nSQLEXEC < 0
		SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPW_WO_SOi')
	ENDIF
	
	IF USED('tmpPW_WO_SOi')
		IF RECCOUNT('tmpPW_WO_SOi') > 0
			IF tmpPW_WO_SOi.CNTD > 0
				lFoundWO = .T.
				
				cSQL = "UPDATE dbo.Sales SET ProductionWO = 1 WHERE  SOitem = dbo.f_ProperSOitem('"+cSOItem+"')"
			ELSE
				cSQL = "UPDATE dbo.Sales SET ProductionWO = 0 WHERE  SOitem = dbo.f_ProperSOitem('"+cSOItem+"')"
			ENDIF
			
			*Update Sales
			nSQLEXEC = SQLEXEC(nConn, cSQL, '' )
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn,  cSQL, '' )
			ENDDO
			IF nSQLEXEC < 0
				SQLEXECError(cSQL, nConn, nSQLEXEC, '')
			ENDIF
			
		ENDIF
		USE IN tmpPW_WO_SOi
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


RETURN lFoundWO 
ENDPROC

*********************************

PROCEDURE Is_InternalProduction_SOi 
PARAMETERS cSOitem, pConnHandle
*lIntP = Is_InternalProduction_SOi( cSOitem, ThisForm.nConnHandle )

IF VARTYPE(cSOitem) != "C"
	RETURN .F.
ENDIF
IF EMPTY(cSOitem) 
	RETURN .F.
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

PRIVATE lFoundWO 
lFoundWO = .F.

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL

IF USED('tmpPW_WO_SOi')
	USE IN tmpPW_WO_SOi
ENDIF
SELECT 0

IF nConn > 0 

	cSQL = "SELECT COUNT(*) AS CNTD"
	cSQL = cSQL+" FROM dbo.WorkOrder WITH(NOLOCK) "
	cSQL = cSQL+" WHERE SOitem = dbo.f_ProperSOitem('"+cSOItem+"')"
	cSQL = cSQL+" AND IntP = 1"
	
	SELECT 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_WO_SOi' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn,  cSQL, 'tmpPW_WO_SOi' )
	ENDDO
	IF nSQLEXEC < 0
		SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPW_WO_SOi')
	ENDIF
	
	IF USED('tmpPW_WO_SOi')
		IF RECCOUNT('tmpPW_WO_SOi') > 0
			IF tmpPW_WO_SOi.CNTD > 0
				lFoundWO = .T.
				
				cSQL = "UPDATE dbo.Sales SET IntP = 1 WHERE  SOitem = dbo.f_ProperSOitem('"+cSOItem+"')"
			ELSE
				cSQL = "UPDATE dbo.Sales SET IntP = 0 WHERE  SOitem = dbo.f_ProperSOitem('"+cSOItem+"')"
			ENDIF
			
			*Update Sales
			nSQLEXEC = SQLEXEC(nConn, cSQL, '' )
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn,  cSQL, '' )
			ENDDO
			IF nSQLEXEC < 0
				SQLEXECError(cSQL, nConn, nSQLEXEC, '')
			ENDIF
			
		ENDIF
		USE IN tmpPW_WO_SOi
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


RETURN lFoundWO 
ENDPROC


********************************* 

PROCEDURE OType_Proper 
PARAMETERS cType, cOrderNum, pConnHandle
*cOType_Num = OType_Proper( cType, cOrderNum, ThisForm.nConnHandle )

IF VARTYPE(cType) != "C"
	RETURN ''
ENDIF
IF EMPTY(cOrderNum) 
	RETURN ''
ENDIF

*!*	PRIVATE nConn, lNewConn
*!*	lNewConn = .F.
*!*	IF VARTYPE(pConnHandle) = "N"
*!*		IF pConnHandle > 0
*!*			nConn = pConnHandle
*!*		ELSE
*!*			nConn = get_SQLSTRINGCONNECT()
*!*			lNewConn = .T.
*!*		ENDIF
*!*	ELSE
*!*		nConn = get_SQLSTRINGCONNECT()
*!*		lNewConn = .T.
*!*	ENDIF
*!*	nConn = CheckSQLConnection(nConn)


***********************************
PRIVATE cOrder,nOrder,cOType_Num
cOrder = ''
nOrder = 0
cOType_Num = ''

PRIVATE cSQL

DO CASE
CASE UPPER(cType) = "WO" OR cType = "WorkOrder"
	nOrder = PrepareSQLnum(cOrderNum,'WorkOrder',-3)
	cOType_Num = 'WO'+STR(nOrder)
	cSQL = "SELECT dbo.f_rtr_OType_Num('WO',"+STR(nOrder)+") AS 'OType_Num'"

CASE UPPER(cType) = "SO" OR cType = "Sales Order"
	nOrder = PrepareSQLnum(cOrderNum,'SalesOrder',-3)
	cOType_Num = 'SO'+STR(nOrder)
	cSQL = "SELECT dbo.f_rtr_OType_Num('SO',"+STR(nOrder)+") AS 'OType_Num'"
	
CASE UPPER(cType) = "PI" OR cType = "PO Item"
	cOrder = PrepareSQLtxt(cOrderNum,'POitem',12)
	IF AT('-',cOrder) = 0
		MESSAGEBOX("PO item requires an -Item",16,"Cannot continue")
		TrackError("PO item requires an -Item, no - found.","PO item requires an -Item", "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(1))
		*RETURN .F.
	ENDIF
	cOType_Num = 'PI'+cOrder
	cSQL = "SELECT dbo.f_rtr_OType_Num('PI',"+cOrder+") AS 'OType_Num'"
	
CASE UPPER(cType) = "SI" OR cType = "SO Item"
	cOrder = PrepareSQLtxt(cOrderNum,'SOitem',10)
	IF AT('-',cOrder) = 0
		MESSAGEBOX("SO item requires an -Item",16,"Cannot continue")
		TrackError("SO item requires an -Item, no - found.","SO item requires an -Item", "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(1))
	ENDIF
	cOType_Num = 'SI'+cOrder
	cSQL = "SELECT dbo.f_rtr_OType_Num('SI',"+cOrder+") AS 'OType_Num'"
	
CASE UPPER(cType) = "WD" OR cType = "WO Detail"
	nOrder = PrepareSQLnum(cOrderNum,'WO_Detail',-3)
	cOType_Num = 'WD'+STR(nOrder)
	cSQL = "SELECT dbo.f_rtr_OType_Num('WD',"+STR(nOrder)+") AS 'OType_Num'"
	
CASE UPPER(cType) = "MT" OR cType = "Maintenance"
	nOrder = PrepareSQLnum(cOrderNum,'Maintenance',-3)
	cOType_Num = 'MT'+STR(nOrder)
	cSQL = "SELECT dbo.f_rtr_OType_Num('MT',"+STR(nOrder)+") AS 'OType_Num'"
	
CASE UPPER(cType) = "PO" OR cType = "Purchase Order"
	nOrder = PrepareSQLnum(cOrderNum,'HPAPO',-3)
	cOType_Num = 'PO'+STR(nOrder)
	cSQL = "SELECT dbo.f_rtr_OType_Num('PO',"+STR(nOrder)+") AS 'OType_Num'"
	
CASE UPPER(cType) = "RA" OR cType = "Return Merchandise Authorization"
	nOrder = PrepareSQLnum(cOrderNum,'RMA',-3)

	cOType_Num = 'RA'+STR(nOrder)
	cSQL = "SELECT dbo.f_rtr_OType_Num('RA',"+STR(nOrder)+") AS 'OType_Num'"
	
CASE UPPER(cType) = "RD" OR cType = "RMA Detail"
	nOrder = PrepareSQLnum(cOrderNum,'RMAD',-3)
	cOType_Num = 'RD'+STR(nOrder)
	cSQL = "SELECT dbo.f_rtr_OType_Num('RD',"+STR(nOrder)+") AS 'OType_Num'"
OTHERWISE
	RecordTest("Record Test Data.", "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(1),"Did not recognize OType parameter "+cType )
ENDCASE





*!*	IF nConn > 0 AND LEN(cSQL) > 0
*!*		PRIVATE cAlias 
*!*		cAlias = ALIAS()


*!*		IF USED('tmpPW_OType')
*!*			USE IN tmpPW_WO_SOi
*!*		ENDIF
*!*		
*!*		SELECT 0
*!*		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_OType' )
*!*		DO WHILE nSQLEXEC = 0
*!*			WAIT WINDOW 'SQL' TIMEOUT 1
*!*		nSQLEXEC = SQLEXEC(nConn,  cSQL, 'tmpPW_OType' )
*!*		ENDDO
*!*		IF nSQLEXEC < 0
*!*			SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPW_OType')
*!*		ENDIF
*!*		
*!*		IF USED('tmpPW_OType')
*!*			IF RECCOUNT('tmpPW_OType') > 0
*!*				cOType_Num = tmpPW_OType.OType_Num
*!*			ENDIF
*!*			USE IN tmpPW_OType
*!*		ENDIF
*!*		
*!*		IF lNewConn 
*!*			SQLDISCONNECT( nConn )
*!*		ENDIF
*!*		
*!*		IF NOT EMPTY(cAlias)
*!*			IF USED(cAlias)
*!*				SELECT (cAlias)
*!*			ELSE
*!*				RecordTest("Record Test Data.","Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
*!*			ENDIF
*!*		ENDIF

*!*	ELSE
*!*		*Error on Connection String
*!*		TrackError("Could not Connect to SQL","Error on Connection String","Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
*!*	ENDIF


RETURN cOType_Num 
ENDPROC

********************************* 

PROCEDURE Is_OTyp 
PARAMETERS cType, pConnHandle
*lIs_OType = Is_OTyp( cType, ThisForm.nConnHandle )

IF VARTYPE(cType) != "C"
	RETURN .F.
ENDIF

*!*	PRIVATE nConn, lNewConn
*!*	lNewConn = .F.
*!*	IF VARTYPE(pConnHandle) = "N"
*!*		IF pConnHandle > 0
*!*			nConn = pConnHandle
*!*		ELSE
*!*			nConn = get_SQLSTRINGCONNECT()
*!*			lNewConn = .T.
*!*		ENDIF
*!*	ELSE
*!*		nConn = get_SQLSTRINGCONNECT()
*!*		lNewConn = .T.
*!*	ENDIF
*!*	nConn = CheckSQLConnection(nConn)


***********************************

PRIVATE lIs_OType 
lIs_OType = .F.
PRIVATE cSQL,nSQLEXEC 

DO CASE
CASE UPPER(cType) = "WO" OR cType = "WorkOrder"
	lIs_OType = .T.
CASE UPPER(cType) = "SO" OR cType = "Sales Order"
	lIs_OType = .T.
CASE UPPER(cType) = "PI" OR cType = "PO Item"
	lIs_OType = .T.
CASE UPPER(cType) = "SI" OR cType = "SO Item"
	lIs_OType = .T.
CASE UPPER(cType) = "WD" OR cType = "WO Detail"
	lIs_OType = .T.
CASE UPPER(cType) = "MT" OR cType = "Maintenance"
	lIs_OType = .T.
CASE UPPER(cType) = "PO" OR cType = "Purchase Order"
	lIs_OType = .T.
CASE UPPER(cType) = "RA" OR cType = "Return Merchandise Authorization"
	lIs_OType = .T.
CASE UPPER(cType) = "RD" OR cType = "RMA Detail"
	lIs_OType = .T.
OTHERWISE
	RecordTest("Record Test Data.", "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(1),"Did not recognize OType parameter "+cType )
ENDCASE




*!*	IF nConn > 0 AND LEN(cSQL) > 0
*!*		PRIVATE cAlias 
*!*		cAlias = ALIAS()


*!*		IF USED('tmpPW_OType')
*!*			USE IN tmpPW_WO_SOi
*!*		ENDIF
*!*		
*!*		SELECT 0
*!*		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_OType' )
*!*		DO WHILE nSQLEXEC = 0
*!*			WAIT WINDOW 'SQL' TIMEOUT 1
*!*		nSQLEXEC = SQLEXEC(nConn,  cSQL, 'tmpPW_OType' )
*!*		ENDDO
*!*		IF nSQLEXEC < 0
*!*			SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPW_OType')
*!*		ENDIF
*!*		
*!*		IF USED('tmpPW_OType')
*!*			IF RECCOUNT('tmpPW_OType') > 0
*!*				cOType_Num = tmpPW_OType.OType_Num
*!*			ENDIF
*!*			USE IN tmpPW_OType
*!*		ENDIF
*!*		
*!*		IF lNewConn 
*!*			SQLDISCONNECT( nConn )
*!*		ENDIF
*!*		
*!*		IF NOT EMPTY(cAlias)
*!*			IF USED(cAlias)
*!*				SELECT (cAlias)
*!*			ELSE
*!*				RecordTest("Record Test Data.","Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
*!*			ENDIF
*!*		ENDIF

*!*	ELSE
*!*		*Error on Connection String
*!*		TrackError("Could not Connect to SQL","Error on Connection String","Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
*!*	ENDIF


RETURN lIs_OType
ENDPROC
****************************************************************

PROCEDURE CheckSOforProduction
PARAMETERS cSOitem, pConnHandle
*lIs_Production = CheckSOforProduction( cSOitem, ThisForm.nConnHandle )

IF VARTYPE(cSOitem) != "C"
	RETURN .F.
ENDIF
IF EMPTY(cSOitem) 
	RETURN .F.
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

PRIVATE lProduction 
lProduction = .F.

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL

IF USED('tmpPW_SalesProd')
	USE IN tmpPW_SalesProd
ENDIF
SELECT 0

IF nConn > 0 

	cSQL = "SELECT GFM,Roll,Press,Mach, Typ, WO, WO_Detail, IntP"
	cSQL = cSQL+" FROM dbo.Sales "
	cSQL = cSQL+" WHERE SOitem = dbo.f_ProperSOitem('"+cSOItem+"')"
	
	SELECT 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_SalesProd' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn,  cSQL, 'tmpPW_SalesProd' )
	ENDDO
	IF nSQLEXEC < 0
		SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPW_SalesProd')
	ENDIF
	
	IF USED('tmpPW_SalesProd')
		IF RECCOUNT('tmpPW_SalesProd') > 0
			IF tmpPW_SalesProd.GFM 
				lProduction = .T.
			ENDIF
			IF tmpPW_SalesProd.Roll 
				lProduction = .T.
			ENDIF
			IF tmpPW_SalesProd.Press 
				lProduction = .T.
			ENDIF
			IF tmpPW_SalesProd.Mach 
				lProduction = .T.
			ENDIF

			IF tmpPW_SalesProd.TYP = 'P'
				lProduction = .T.
			ENDIF
			
			IF tmpPW_SalesProd.WO > 1
				lProduction = .T.
			ENDIF
			IF tmpPW_SalesProd.WO_Detail > 1
				lProduction = .T.
			ENDIF
			IF tmpPW_SalesProd.IntP 
				lProduction = .T.
			ENDIF

			
		ENDIF
		USE IN tmpPW_SalesProd
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


RETURN lProduction 
ENDPROC

*********************************
PROCEDURE getSalesRep_WO 
PARAMETERS pnWO, pConnHandle

IF VARTYPE(pnWO)<> "N"
	RecordError( 0, 'getSalesRep_WO', "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No WO" )	
	RETURN ' '
ENDIF

IF pnWO = 0
	RecordError( 0, 'getSalesRep_WO', "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No WO" )
	RETURN ' '
ENDIF

*********
PRIVATE lcReturnName
lcReturnName = " "


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
*PRIVATE nConn
*nConn = get_SQLSTRINGCONNECT()

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPW_SqlAns')
	USE IN tmpPW_SqlAns
ENDIF
SELECT 0

IF nConn > 0

	cSQL = "SELECT SalesRep FROM dbo.WorkOrder WITH(NOLOCK) WHERE WO = "+STR(pnWO)
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_SqlAns' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_SqlAns' )
	ENDDO
	
	IF nSQLEXEC < 0  &&Try again. Problem query!
		nSQLEXEC = SQLEXEC(nConn , cSQL , 'tmpPW_SqlAns' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_SqlAns' )
		ENDDO
	ENDIF
	
	IF nSQLEXEC < 0
		SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPW_SqlAns')
	ENDIF
	
	IF USED('tmpPW_SqlAns')
		IF VARTYPE(tmpPW_SqlAns.SalesRep ) = "C"
			lcReturnName = tmpPW_SqlAns.SalesRep 
		ENDIF

		USE IN tmpPW_SqlAns
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

RETURN ALLTRIM(lcReturnName)
ENDPROC

********************************* 
PROCEDURE getSalesRep_WOD
PARAMETERS pnWOD, pConnHandle

IF VARTYPE(pnWOD)<> "N"
	RecordError( 0, 'getSalesRep_WOD', "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No WOD" )	
	RETURN ' '
ENDIF

IF pnWOD = 0
	RecordError( 0, 'getSalesRep_WOD', "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No WOD" )
	RETURN ' '
ENDIF

*********
PRIVATE lcReturnName
lcReturnName = " "


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

	cSQL = "SELECT TOP 1 WO.SalesRep FROM dbo.WorkOrder WO WITH(NOLOCK) "
	cSQL = cSQL + " INNER JOIN dbo.WorkOrder_Detail WOD WITH(NOLOCK) ON WO.WO=WOD.WO "
	cSQL = cSQL + " WHERE WOD.WO_Detail = "+STR(pnWOD)
	
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
	ENDIF
	
	IF USED('tmpPW_SqlAns')
		IF VARTYPE(tmpPW_SqlAns.SalesRep ) = "C"
			lcReturnName = tmpPW_SqlAns.SalesRep 
		ENDIF

		USE IN tmpPW_SqlAns
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

RETURN ALLTRIM(lcReturnName)
ENDPROC




******************************************
PROCEDURE Count_WOinWO 
PARAMETERS nWO, pConnHandle, cAndSome
*nCntPOitem = Count_WOinWO( nWO, ThisForm.nConnHandle,cAndSome )
* Returns -1 on error, 0 or 1 on found

IF VARTYPE(nWO) != "N"
	TrackError("Bad Parameter nWO","Bad Parameter nWO","Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN -1
ENDIF
*IF VARTYPE(pConnHandle) != "N"
*	TrackError("Could not Connect to SQL","Error on passed Connection String","Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
*	RETURN -1
*ENDIF
IF VARTYPE(cAndSome) != "C"
	cAndSome = ''
ENDIF

IF nWO <1 
	TrackError("Bad Parameter nWO","Bad Parameter nWO","Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN 0
ENDIF

PRIVATE nReturn
nReturn = -1

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

	IF USED("cntWO")
		USE IN cntWO
	ENDIF
	cSQL = "SELECT COUNT(*) AS Cntd FROM dbo.WorkOrder WITH(NOLOCK) WHERE "
	cSQL = cSQL + " WO ="+STR(nWO)
	
	IF UPPER(cAndSome) = "NOTCANCELLED"
		cSQL = cSQL + " AND ISNULL(Cncld,0) = 0 "
	ENDIF
	IF UPPER(cAndSome) = "CANCELLED"
		cSQL = cSQL + " AND ISNULL(Cncld,0) = 1 "
	ENDIF
	IF UPPER(cAndSome) = "COMPLETE"
		cSQL = cSQL + " AND ISNULL(Cmplt,0) = 1 "
	ENDIF

	IF UPPER(cAndSome) = "CHANGING"
		cSQL = cSQL + " AND ISNULL(Changing,0) = 1 "
	ENDIF
	IF UPPER(cAndSome) = "NOTSHOPRECV"
		cSQL = cSQL + " AND ISNULL(ShopRecv,0) = 0 "
	ENDIF
	IF UPPER(cAndSome) = "SHOPRECV"
		cSQL = cSQL + " AND ISNULL(ShopRecv,0) = 1 "
	ENDIF
	IF UPPER(cAndSome) = "ACTIVE"
		cSQL = cSQL + " AND NOT ( ISNULL(Cncld,0) = 1 OR ISNULL(Cmplt,0) = 1 ) "
	ENDIF

	SELECT 0
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'cntWO')
	
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'cntWO')
	ENDDO
	IF nSQLEXEC < 0
		SQLEXECError(cSQL, nConn, nSQLEXEC, 'cntWO')
	ENDIF
	
	IF USED("cntWO")
		IF RECCOUNT('cntWO')>0
			nReturn = cntWO.Cntd
		ENDIF
		USE IN cntWO
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

*******************************************
PROCEDURE Count_WODinWO_Detail 
PARAMETERS nWO_Detail, pConnHandle, cAndSome
*nCntPOitem = Count_WODinWO_Detail( WO_Detail, ThisForm.nConnHandle, cAndSome )
* Returns -1 on error, 0 or 1 on found

IF VARTYPE(nWO_Detail) != "N"
	TrackError("Bad Parameter nWO_Detail","Bad Parameter nWO_Detail","Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN -1
ENDIF
*IF VARTYPE(pConnHandle) != "N"
*	TrackError("Could not Connect to SQL","Error on passed Connection String","Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
*	RETURN -1
*ENDIF
IF VARTYPE(cAndSome) != "C"
	cAndSome = ''
ENDIF

IF nWO_Detail<1 
	RETURN 0
ENDIF

PRIVATE nReturn
nReturn = -1

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

	IF USED("cntWO_Detail")
		USE IN cntWO_Detail
	ENDIF
	cSQL = "SELECT COUNT(*) AS Cntd FROM dbo.WorkOrder_Detail WITH(NOLOCK) WHERE "
	cSQL = cSQL + " WO_Detail ="+STR(nWO_Detail)
	
	IF UPPER(cAndSome) = "NOTCANCELLED"
		cSQL = cSQL + " AND ISNULL(fCncld,0) = 0 "
	ENDIF
	IF UPPER(cAndSome) = "CANCELLED"
		cSQL = cSQL + " AND ISNULL(fCncld,0) = 1 "
	ENDIF
	IF UPPER(cAndSome) = "COMPLETE"
		cSQL = cSQL + " AND ISNULL(fCmplt,0) = 1 "
	ENDIF
	IF UPPER(cAndSome) = "ACTIVE"
		cSQL = cSQL + " AND NOT ( ISNULL(fCmplt,0) = 1 OR ISNULL(fCncld,0) = 1 )"
	ENDIF

	SELECT 0
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'cntWO_Detail')
	
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'cntWO_Detail')
	ENDDO
	IF nSQLEXEC < 0
		SQLEXECError(cSQL, nConn, nSQLEXEC, 'cntWO_Detail')
	ENDIF
	
	IF USED("cntWO_Detail")
		IF RECCOUNT('cntWO_Detail')>0
			nReturn = cntWO_Detail.Cntd
		ENDIF
		USE IN cntWO_Detail
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

*********************************		

PROC Save_ItemCost_WO 
PARAMETERS nItemCost, nWO, nConn
*lOK = Save_ItemCost_WO ( nItemCost, nWO, THISFORM.nConnHandle )
* Also see Proc_SQL:Save_ItemCostinSales

IF NOT ( VARTYPE(nItemCost) = "N" OR VARTYPE(nItemCost) = "Y" )
	RecordError( 0, 'PARAMETERS ', "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"VFP message: No nItemCost Parameter" )
	RETURN .F.
ENDIF
IF VARTYPE(nWO) != "N"
	RecordError( 0, 'PARAMETERS ', "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"VFP message: No nWO Parameter" )
	RETURN .F.
ENDIF

IF VARTYPE(nConn) != "N"
	RecordError( 0, 'PARAMETERS ', "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"VFP message: No nConn Parameter" )
	RETURN .F.
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE cSQL, nSQLEXEC
cSQL = "UPDATE dbo.WorkOrder SET ItemCost="+STR(nItemCost,9,2)
cSQL = cSQL + " WHERE WO="+STR(nWO)

nSQLEXEC = SQLEXEC( nConn, cSQL )

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL )
ENDDO
IF nSQLEXEC < 0 &&Try again!, long triger
	nSQLEXEC = SQLEXEC(nConn, cSQL)
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL)
	ENDDO
ENDIF
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
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC,'')
		RecordError(nSQLEXEC,"SQL Error","Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

ENDPROC

*******************************************
PROCEDURE Count_WOinWO_Detail 
PARAMETERS nWO, pConnHandle, cAndSome
*nCntPOitem = Count_WOinWO_Detail( WO, ThisForm.nConnHandle, cAndSome )
*Looks at all WO_Detail that belong to same WO
* Returns -1 on error, 0 or 1 on found

IF VARTYPE(nWO) != "N"
	TrackError("Bad Parameter nWO","Bad Parameter nWO","Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN -1
ENDIF
*IF VARTYPE(pConnHandle) != "N"
*	TrackError("Could not Connect to SQL","Error on passed Connection String","Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
*	RETURN -1
*ENDIF
IF VARTYPE(cAndSome) != "C"
	cAndSome = ''
ENDIF

IF nWO <1 
	RETURN 0
ENDIF

PRIVATE nReturn
nReturn = -1

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

	IF USED("cntWO_Detail")
		USE IN cntWO_Detail
	ENDIF
	
	cSQL = "SELECT COUNT(*) AS Cntd FROM "
	cSQL = cSQL + " dbo.WorkOrder WO WITH(NOLOCK) "
	cSQL = cSQL + " INNER JOIN dbo.WorkOrder_Detail WOD WITH(NOLOCK) ON WO.WO=WOD.WO "
	cSQL = cSQL + " WHERE WO.WO ="+STR(nWO)
	
	IF UPPER(cAndSome) = "NOTCANCELLED"
		cSQL = cSQL + " AND ISNULL(WOD.fCncld,0) = 0 "
	ENDIF
	IF UPPER(cAndSome) = "CANCELLED"
		cSQL = cSQL + " AND ISNULL(WOD.fCncld,0) = 1 "
	ENDIF
	IF UPPER(cAndSome) = "COMPLETE"
		cSQL = cSQL + " AND ISNULL(WOD.fCmplt,0) = 1 "
	ENDIF


	SELECT 0
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'cntWO_Detail')
	
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'cntWO_Detail')
	ENDDO
	IF nSQLEXEC < 0
		SQLEXECError(cSQL, nConn, nSQLEXEC, 'cntWO_Detail')
	ENDIF
	
	IF USED("cntWO_Detail")
		IF RECCOUNT('cntWO_Detail')>0
			nReturn = cntWO_Detail.Cntd
		ENDIF
		USE IN cntWO_Detail
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

*******************************************
*PROCEDURE Count_WODinWO_Production 
PROCEDURE Count_WODinWOD_WOD 
PARAMETERS nWO_Detail, pConnHandle, cAndSome
*nCntPOitem = Count_WODinWO_Production( WO_Detail, ThisForm.nConnHandle, cAndSome )
* Returns -1 on error, 0 or 1 on found

IF VARTYPE(nWO_Detail) != "N"
	TrackError("Bad Parameter nWO_Detail","Bad Parameter nWO_Detail","Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN -1
ENDIF
*IF VARTYPE(pConnHandle) != "N"
*	TrackError("Could not Connect to SQL","Error on passed Connection String","Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
*	RETURN -1
*ENDIF
IF VARTYPE(cAndSome) != "C"
	cAndSome = ''
ENDIF

IF nWO_Detail<1 
	RETURN 0
ENDIF

PRIVATE nReturn
nReturn = -1

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

	IF USED("cntWO_Detail")
		USE IN cntWO_Detail
	ENDIF
	cSQL = "SELECT COUNT(*) AS Cntd FROM dbo.WorkOrder_Detail WITH(NOLOCK) WHERE "
	cSQL = cSQL + " WO_Detail ="+STR(nWO_Detail)
	
	IF UPPER(cAndSome) = "NOTCANCELLED"
		cSQL = cSQL + " AND ISNULL(fCncld,0) = 0 "
	ENDIF
	IF UPPER(cAndSome) = "CANCELLED"
		cSQL = cSQL + " AND ISNULL(fCncld,0) = 1 "
	ENDIF
	IF UPPER(cAndSome) = "COMPLETE"
		cSQL = cSQL + " AND ISNULL(fCmplt,0) = 1 "
	ENDIF


	SELECT 0
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'cntWO_Detail')
	
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'cntWO_Detail')
	ENDDO
	IF nSQLEXEC < 0
		SQLEXECError(cSQL, nConn, nSQLEXEC, 'cntWO_Detail')
	ENDIF
	
	IF USED("cntWO_Detail")
		IF RECCOUNT('cntWO_Detail')>0
			nReturn = cntWO_Detail.Cntd
		ENDIF
		USE IN cntWO_Detail
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

*******************************************
PROCEDURE Count_WODinWO_WO
PARAMETERS nWO, pConnHandle, cAndSome
*nCntWOD = Count_WODinWOD_WO( WO, ThisForm.nConnHandle, cAndSome )
* Returns -1 on error, 0 or 1 on found

IF VARTYPE(nWO) != "N"
	TrackError("Bad Parameter nWO","Bad Parameter nWO","Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN -1
ENDIF
*IF VARTYPE(pConnHandle) != "N"
*	TrackError("Could not Connect to SQL","Error on passed Connection String","Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
*	RETURN -1
*ENDIF
IF VARTYPE(cAndSome) != "C"
	cAndSome = ''
ENDIF

IF nWO_Detail<1 
	RETURN 0
ENDIF

PRIVATE nReturn
nReturn = -1

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

	IF USED("cntWO_Detail")
		USE IN cntWO_Detail
	ENDIF
	cSQL = "SELECT COUNT(*) AS Cntd FROM dbo.WorkOrder_Detail WITH(NOLOCK) WHERE "
	cSQL = cSQL + " WO ="+STR(nWO)
	
	IF UPPER(cAndSome) = "NOTCANCELLED"
		cSQL = cSQL + " AND ISNULL(fCncld,0) = 0 "
	ENDIF
	IF UPPER(cAndSome) = "CANCELLED"
		cSQL = cSQL + " AND ISNULL(fCncld,0) = 1 "
	ENDIF
	IF UPPER(cAndSome) = "COMPLETE"
		cSQL = cSQL + " AND ISNULL(fCmplt,0) = 1 "
	ENDIF


	SELECT 0
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'cntWO_Detail')
	
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'cntWO_Detail')
	ENDDO
	IF nSQLEXEC < 0
		SQLEXECError(cSQL, nConn, nSQLEXEC, 'cntWO_Detail')
	ENDIF
	
	IF USED("cntWO_Detail")
		IF RECCOUNT('cntWO_Detail')>0
			nReturn = cntWO_Detail.Cntd
		ENDIF
		USE IN cntWO_Detail
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

*****************************************
PROC GetMachine_Init 
PARAMETER pMach, pConnHandle
*cInit = GetMachine_Init( cMach, nConn )
**returns Init of Machine used in Production.

PRIVATE cSQL,cInit,cMach
cInit = ' '
cMach = ''

IF VARTYPE(pMach) != "C"
	RETURN ''
ELSE 
	cMach = pMach
ENDIF

PRIVATE pConn , lNewConn
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

IF USED('tmpPW_SqlAns')
	USE IN tmpPW_SqlAns
ENDIF
SELECT 0

IF pConn > 0
	
	cSQL = "SELECT dbo.f_GetMachine_Init("
	cSQL = cSQL + "'"+ cMach + "'"
	cSQL = cSQL + ")"
	
	nSQLEXEC = SQLEXEC(pConn,cSQL, 'tmpPW_SqlAns' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(pConn, cSQL, 'tmpPW_SqlAns' )
	ENDDO
	IF nSQLEXEC < 0  &&Try again
		nSQLEXEC = SQLEXEC(pConn,cSQL, 'tmpPW_SqlAns' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(pConn, cSQL, 'tmpPW_SqlAns' )
		ENDDO
	
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL,pConn,nSQLEXEC, 'tmpPW_SqlAns' )
			RecordError(nSQLEXEC,"SQL Error","Proc_SQL:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPW_SqlAns')
		IF RECCOUNT('tmpPW_SqlAns') > 0
			IF NOT ISNULL(tmpPW_SqlAns.EXP)
				cInit = PrepareSQLtxt(tmpPW_SqlAns.EXP,'Init',1)
			ENDIF
		ENDIF
		
		USE IN tmpPW_SqlAns
	ENDIF
	IF lNewConn
		SQLDISCONNECT(pConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_SQL:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.", "Proc_SQL:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cInit
ENDPROC

*****************************************
PROC GetMachine_Caption
PARAMETER pInit, pConnHandle
*cMach = GetMachine_Caption( cInit, nConn )
**returns Caption (NAME) of Machine used in Production.

PRIVATE cSQL,cInit,cMach
cInit = ''
cMach = ''

IF VARTYPE(pInit) != "C"
	RETURN ''
ELSE 
	cInit = pInit
ENDIF

PRIVATE pConn , lNewConn
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

IF USED('tmpPW_SqlAns')
	USE IN tmpPW_SqlAns
ENDIF
SELECT 0

IF pConn > 0
	
	cSQL = "SELECT dbo.f_GetMachine_Caption("
	cSQL = cSQL + "'"+ cInit + "'"
	cSQL = cSQL + ")"
	
	nSQLEXEC = SQLEXEC(pConn,cSQL, 'tmpPW_SqlAns' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(pConn, cSQL, 'tmpPW_SqlAns' )
	ENDDO
	IF nSQLEXEC < 0  &&Try again
		nSQLEXEC = SQLEXEC(pConn,cSQL, 'tmpPW_SqlAns' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(pConn, cSQL, 'tmpPW_SqlAns' )
		ENDDO
	
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL,pConn,nSQLEXEC, 'tmpPW_SqlAns' )
			RecordError(nSQLEXEC,"SQL Error","Proc_SQL:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPW_SqlAns')
		IF RECCOUNT('tmpPW_SqlAns') > 0
			IF NOT ISNULL(tmpPW_SqlAns.EXP)
				cMach = PrepareSQLtxt(tmpPW_SqlAns.EXP,'Machine',20)
			ENDIF
		ENDIF
		
		USE IN tmpPW_SqlAns
	ENDIF
	IF lNewConn
		SQLDISCONNECT(pConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_SQL:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.", "Proc_SQL:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cMach
ENDPROC

********************************************
PROCEDURE GetMachine_LogList
PARAMETER pConnHandle
*cMachList = GetMachine_LogList( nConn )
**returns coma seperated list of Machines used in Production with log files.

PRIVATE cSQL,cMachList 
cMachList = ''

PRIVATE pConn , lNewConn
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

IF USED('tmpPW_SqlAns')
	USE IN tmpPW_SqlAns
ENDIF
SELECT 0

IF pConn > 0
	
	cSQL = "SELECT dbo.f_GetMachine_LogList("
	cSQL = cSQL + ")"
	
	nSQLEXEC = SQLEXEC(pConn,cSQL, 'tmpPW_SqlAns' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(pConn, cSQL, 'tmpPW_SqlAns' )
	ENDDO
	IF nSQLEXEC < 0  &&Try again
		nSQLEXEC = SQLEXEC(pConn,cSQL, 'tmpPW_SqlAns' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(pConn, cSQL, 'tmpPW_SqlAns' )
		ENDDO
	
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL,pConn,nSQLEXEC, 'tmpPW_SqlAns' )
			RecordError(nSQLEXEC,"SQL Error","Proc_SQL:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPW_SqlAns')
		IF RECCOUNT('tmpPW_SqlAns') > 0
			IF NOT ISNULL(tmpPW_SqlAns.EXP)
				cMachList = PrepareSQLtxt(tmpPW_SqlAns.EXP,'MachList',255)
			ENDIF
		ENDIF
		
		USE IN tmpPW_SqlAns
	ENDIF
	IF lNewConn
		SQLDISCONNECT(pConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_SQL:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.", "Proc_SQL:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cMachList
ENDPROC

*****************************************
PROC GetMachine_Log
PARAMETER pMach, pConnHandle
*cName_Machine_Log = GetMachine_Log( cMach, nConn )
**returns Log Table of Machine used

PRIVATE cSQL,cInit,cMach
cInit = ' '
cMach = ''

IF VARTYPE(pMach) != "C"
	RETURN ''
ELSE 
	cMach = pMach
ENDIF

PRIVATE pConn , lNewConn
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

IF USED('tmpPW_SqlAns')
	USE IN tmpPW_SqlAns
ENDIF
SELECT 0

IF pConn > 0
	
	cSQL = "SELECT dbo.f_GetMachine_Log("
	cSQL = cSQL + "'"+ cMach + "'"
	cSQL = cSQL + ")"
	
	nSQLEXEC = SQLEXEC(pConn,cSQL, 'tmpPW_SqlAns' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(pConn, cSQL, 'tmpPW_SqlAns' )
	ENDDO
	IF nSQLEXEC < 0  &&Try again
		nSQLEXEC = SQLEXEC(pConn,cSQL, 'tmpPW_SqlAns' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(pConn, cSQL, 'tmpPW_SqlAns' )
		ENDDO
	
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL,pConn,nSQLEXEC, 'tmpPW_SqlAns' )
			RecordError(nSQLEXEC,"SQL Error","Proc_SQL:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPW_SqlAns')
		IF RECCOUNT('tmpPW_SqlAns') > 0
			IF NOT ISNULL(tmpPW_SqlAns.EXP)
				cInit = PrepareSQLtxt(tmpPW_SqlAns.EXP,'Table',100)
			ENDIF
		ENDIF
		
		USE IN tmpPW_SqlAns
	ENDIF
	IF lNewConn
		SQLDISCONNECT(pConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_SQL:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.", "Proc_SQL:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cInit
ENDPROC


********************************************

PROC CheckPOTest_Pass 
PARAMETER cPOitem, pConnHandle
*cPOitemPass = CheckPoTest_Pass( cPOitem, ThisForm.nConnHandle )
*Return Poitem and Pass Notes.

cPOitem = PrepareSQLtxt(cPOitem,'POitem',12)
IF Proper_PO_item(cPOitem) = Proper_PO_Item('')
	RETURN cPOitem
ENDIF

PRIVATE nConn, lNewConn, nMax
lNewConn = .F.
nMax = 0
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

PRIVATE cReturn
cReturn = cPOitem 

PRIVATE cSQL, nSQLEXEC
PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPW_LabTest')
	USE IN tmpPW_LabTest
ENDIF
SELECT 0

IF nConn > 0
	cSQL = "SELECT Lab,Passed,WO,WO_Detail,Lot,'GFM' AS [Oper] FROM dbo.GFMlog WHERE TestPOitem = dbo.f_ProperPOitem('"+cPOitem+"')"
	cSQL = cSQL + " UNION "
	cSQL = cSQL + " SELECT Lab2 AS LAB,Passed2 AS Passed,WO,WO_Detail,Lot,'GFM' AS [Oper] FROM dbo.GFMlog WHERE TestPOitem2 = dbo.f_ProperPOitem('"+cPOitem+"')"
	cSQL = cSQL + " UNION "
	cSQL = cSQL + " SELECT Lab,Passed,0 AS WO, 0 AS WO_Detail,Lot,'CNV' AS [Oper] FROM dbo.Conversion_log WHERE TestPOitem = dbo.f_ProperPOitem('"+cPOitem+"')"
	cSQL = cSQL + " UNION "
	cSQL = cSQL + " SELECT Lab,Passed,WO,WO_Detail,Lot,'HEAT' AS [Oper] FROM dbo.HT_log WHERE TestPOitem = dbo.f_ProperPOitem('"+cPOitem+"')"
	cSQL = cSQL + " UNION "
	cSQL = cSQL + " SELECT Lab,Passed,WO,WO_Detail,Lot,'PRESS' AS [Oper] FROM dbo.LakeErie_log WHERE TestPOitem = dbo.f_ProperPOitem('"+cPOitem+"')"
	cSQL = cSQL + " UNION "
	cSQL = cSQL + " SELECT Lab,Passed,WO,WO_Detail,Lot,'ROLL' AS [Oper] FROM dbo.Roll_log WHERE TestPOitem = dbo.f_ProperPOitem('"+cPOitem+"')"
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_LabTest' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_LabTest' )
	ENDDO
	IF nSQLEXEC < 0
		SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPW_LabTest')
	ENDIF
	
	IF USED('tmpPW_LabTest')
		IF RECCOUNT('tmpPW_LabTest') > 0
			PRIVATE cLab,lPassed,nWO,nWO_Detail,nLot,cOperMach
			cLab	= PrepareSQLtxt(tmpPW_LabTest.Lab,'Lab',20)
			lPassed = PrepareSQLlogic(tmpPW_LabTest.Passed,'Passed')
			nWO		= PrepareSQLnum(tmpPW_LabTest.WO,'WO',-3)
			nWO_Detail= PrepareSQLnum(tmpPW_LabTest.WO_Detail,'WO_Detail',-3)
			nLot	= PrepareSQLnum(tmpPW_LabTest.Lot,'LOT',-3)
			cOperMach	= PrepareSQLtxt(tmpPW_LabTest.Oper,'Oper',10)
			cReturn = cReturn +" Lab:"+ALLTRIM(cLab)+" "+IIF(lPassed,"'Passed'","NOT 'Passed'")+" "+cOperMach+" "+ALLTRIM(STR(nLot))
		ENDIF
		USE IN tmpPW_LabTest
	ENDIF

	IF lNewConn 
		SQLDISCONNECT(nConn )
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

RETURN cReturn
ENDPROC

***********************************************************************************************

PROC GetNext_Sched_Position
PARAMETER nSched_Type, pConnHandle
*GetNext_Sched_Position( nSched_Type, ThisForm.nConnHandle )

IF NOT VARTYPE(nSched_Type) = "N"
	*nSched_Type = PrepareSQLnum(nSched_Type,'Sched_Type',-1)
	TrackError("Bad parameter","Bad parameter","Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN -1
ENDIF

PRIVATE nConn, lNewConn, nMax
lNewConn = .F.
nMax = 0
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

PRIVATE cSQL, nSQLEXEC
PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPW_Max')
	USE IN tmpPW_Max
ENDIF
SELECT 0

IF nConn > 0
	cSQL = "SELECT MAX(ISNULL(Position,0)) AS MaxO FROM dbo.rtr_Schedule "
	cSQL = cSQL + " WHERE Sched_Type ="+STR(nSched_Type)
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_Max' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_Max' )
	ENDDO
	IF nSQLEXEC < 0
		SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPW_Max')
	ENDIF
	
	IF USED('tmpPW_Max')
		IF VARTYPE(tmpPW_Max.MaxO) = "N"
			nMax = tmpPW_Max.MaxO + 1
			IF nMax < 1000
				nMax = 1001
			ENDIF
		ENDIF
		IF ISNULL(tmpPW_Max.MaxO)
			nMax = 1000
		ENDIF
		USE IN tmpPW_Max
	ENDIF

	IF lNewConn 
		SQLDISCONNECT(nConn )
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

RETURN nMax 
ENDPROC

*********************************

PROCEDURE is_WO
PARAMETERS nWO, pConnHandle, pWhat
*lFoundWO = isWO(ThisForm.nWO,ThisForm.nConnhandle,'OutSource')

IF VARTYPE(nWO) != "N"
	TrackError("Bad parameter WO","Bad parameter","Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN .F.
ENDIF
IF nWO < 1
	TrackError("Bad parameter WO=0","Bad parameter","Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN .F.
ENDIF

PRIVATE cWhat
cWhat = PrepareSQLtxt(pWhat,'What',30)

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

PRIVATE lFoundWO 
lFoundWO = .F.

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL

IF USED('tmpPW_WO_SOi')
	USE IN tmpPW_WO_SOi
ENDIF
SELECT 0

IF nConn > 0 

	cSQL = "SELECT COUNT(*) AS CNTD"
	cSQL = cSQL+" FROM dbo.WorkOrder WITH(NOLOCK) "
	cSQL = cSQL+" WHERE WO = "+STR(nWO)
	
	IF cWhat = 'OutSource'
		cSQL = cSQL+" AND OutSource = 1"
	ENDIF
	
	SELECT 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_WO_SOi' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn,  cSQL, 'tmpPW_WO_SOi' )
	ENDDO
	IF nSQLEXEC < 0
		SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPW_WO_SOi')
	ENDIF
	
	IF USED('tmpPW_WO_SOi')
		IF RECCOUNT('tmpPW_WO_SOi') > 0
			IF tmpPW_WO_SOi.CNTD > 0
				lFoundWO = .T.
			ENDIF
			
		ENDIF
		USE IN tmpPW_WO_SOi
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


RETURN lFoundWO 
ENDPROC


********************************* 
***********************************
PROC SaveTo_WorkOrder_Notes 
PARAMETERS nWO, nWO_Detail, cNotes, pConnHandle
*lOK = SaveTo_WorkOrder_Notes( cSOitem, cWhat, cComment, nConn )

IF VARTYPE(nWO) != "N"
	RecordError( 0, 'PARAMETERS ', "Proc_SQL:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"VFP message: No WO Parameter" )
	RETURN .F.
ENDIF
IF VARTYPE(nWO_Detail) != "N"
	RecordError( 0, 'PARAMETERS ', "Proc_SQL:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"VFP message: No nWO_DetailParameter" )
	RETURN .F.
ENDIF

IF VARTYPE(cNotes) != "C"
	cNotes = ''
ENDIF

cNotes = PrepareSQLtxt(cNotes ,'Notes',-1)

PRIVATE lReturn
lReturn = .T.

PRIVATE lNewConn 
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		pConn = pConnHandle
		lNewConn = .F.
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

cSQL = "INSERT INTO dbo.WorkOrder_Notes (WO,WO_Detail,[Notes]) VALUES ("
cSQL = cSQL +" "+STR(nWO)+","+STR(nWO_Detail)+",'"+cNotes+"' ) "

nSQLEXEC = SQLEXEC( pConn, cSQL )

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( pConn, cSQL )
ENDDO
IF nSQLEXEC < 0 &&Try again!, long triger
	nSQLEXEC = SQLEXEC(pConn, cSQL)
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(pConn, cSQL)
		lReturn = .F.
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, pConn, nSQLEXEC,'')
		RecordError(nSQLEXEC,"SQL Error","Proc_SQL:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ELSE
	*TrackMess("SOitem: "+cSOitem+" " + cComment + " " +SYS(16,1) )
ENDIF


IF lNewConn 
	SQLDISCONNECT( pConn )
ENDIF

RETURN lReturn
ENDPROC

*********************************
PROCEDURE Get_QTYinWO 
PARAMETERS pnWO, pConnHandle

IF VARTYPE(pnWO)<> "N"
	RecordError( 0, 'Get_QTYinWO', "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No WO" )	
	RETURN ' '
ENDIF

IF pnWO = 0
	RecordError( 0, 'Get_QTYinWO', "Proc_WO:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No WO" )
	RETURN ' '
ENDIF
****
PRIVATE nQTY 
nQTY = 0


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
*PRIVATE nConn
*nConn = get_SQLSTRINGCONNECT()

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPW_QTY_WO')
	USE IN tmpPW_QTY_WO
ENDIF
SELECT 0

IF nConn > 0

	cSQL = "SELECT sWeight FROM dbo.WorkOrder WITH(NOLOCK) WHERE WO = "+STR(pnWO)
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_QTY_WO' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_QTY_WO' )
	ENDDO
	
	IF nSQLEXEC < 0  &&Try again. Problem query!
		nSQLEXEC = SQLEXEC(nConn , cSQL , 'tmpPW_QTY_WO' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPW_QTY_WO' )
		ENDDO
	ENDIF
	
	IF nSQLEXEC < 0
		SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPW_QTY_WO')
	ENDIF
	
	IF USED('tmpPW_QTY_WO')
		IF RECCOUNT('tmpPW_QTY_WO') > 0
			nQTY = PrepareSQLnum(tmpPW_QTY_WO.sWeight,'Weight',9,1)
		ENDIF

		USE IN tmpPW_QTY_WO
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

RETURN nQTY 
ENDPROC


***********************************************************************************************