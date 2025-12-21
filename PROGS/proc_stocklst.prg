*IF NOT "PROC_STOCKLST" $ SET("PROCEDURE")  &&Added for when Quotes is run without HPA menu.
*	SET PROCEDURE TO Progs\Proc_StockLst ADDITIVE
*ENDIF
*SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
*SET PROCEDURE TO Progs\Proc_Setup ADDITIVE
*SET PROCEDURE TO Progs\Proc_Quotes ADDITIVE
*SET PROCEDURE TO Progs\Proc_ERP ADDITIVE 

*getPricingUnitbyID 
*CalcDetailWeight 
*CalcDetailPricingUnits 
*getFormbyMasterID 
*GetIDfromID_Detail GetID_DetailfromID_Detail_P	Get_top_ID_Detail_from_ID 
*GetIDfromDeletedHistory_ID_History 
*get_POitem_StockLstID 
*GetUNITfromFORM  
*Get_cPUfrom_nPU Get_PUstr_from_nPU  Get_PriceU_from_nPU get_Max_P_fromPU 
*GetPRICEUNITfromFORM  
*isForStock 
*get_TBL TableName_TBL  TBL_TableName get_TBLwithID_ID_Detail 
*getStock_P-ID_Detail_Process 
*--getStockTotal_SOitem 
*getSpecificStock_Order getSpecificStock_SOitem getSpecificStock_SOitem_WO
*getReceivingIDfromHeat Get_ReceivingID_from_ID_Detail Count_Lst_Detail_by_Heat 
*Count_Lst_by_ID
*Count_Lst_by_ID_Detail_Heat 
*Count_Lst_Detail_by_ID
*Count_Lst_Detail_by_ID_Detail Count_Lst_Details_by_ID_Detail --See how many detail are around the removed detail
*Count_Lst_Process_by_ID_Detail 

*Remove_Lst_Detail_by_ID 
*Remove_Lst_Detail_by_ID_Detail 
*Remove_Lst_Process_by_ID_Detail 

*DEPRICATED THESE 
*<--Remove_StockLst_Detail_by_ID_Detail 
*<--Remove_BrokerLst_Detail_by_ID_Detail 
*<--Remove_WIPLst_Detail_by_ID_Detail 

*getInvoiceValue_ID_Detail 
*get_Info_Lst_Master get_Description_ID_Detail get_Comment_ID_Detail_Process  
*get_Pounds_ID_Detail get_QTY_ID_Detail get_QTY_ID_D_P     get_Price_ID_Detail 
*get_QTY_Grab 
*getPUfromID_Detail  
*get_Description_WO 
*StockLst_Process_Remove_WO 
*StockLst_Process_Delete 
*StockLst_Process_Add_WO 
*StockLst_Process_Count_SOitem 
*StockLst_Process_Count_POitem  getID_D_P_with_POitem 
*WO_Detail 
*StockLst_Process_Count_WO 
*StockLst_Process_Count_WOD 

*CalcDetail_QTY CalcDetail_LBS 
*Calc_Weight Calc_Master_QTY 
*Cancel_Detail_Process_SOitem Cancel_Detail_Process_POitem Cancel_Detail_Process_WO 
*Remove_Stock_listed_POitem Remove_ID_Detail_Process 
*Get_TBL_by_ReceivingID  Get_ID_Detail_by_ReceivingID Get_ID_Detail_Process_by_ReceivingID Get_ID_Master_by_ReceivingID 
*Get_ID_Detail_Prc_by_Received_hist  Get_ID_Detail_Prc_by_ID_Detail
*get_ID_Master_with_ID_Detail
*get_ID_Master_with_POitem   
*get_ID_Detail_with_POitem   
*get_ID_Detail_with_SOitem  
*get_ID_Detail_with_WO 
*get_ID_Detail_with_WO_Detail
*get_ID_with_WO_Detail
*getTBL_Process_POitem	getTBL_ReceivingID getTBL_WO getTBL_WOD_WO 
*getTBL_WO_Detail getTBL_POitem getTBL_WO_SelectedProcess

*Is_Detail_Process  
*Is_ID_Detail_SELECTED_SOitem  Is_ID_Detail_SELECTED_WO Is_ID_Detail_SELECTED_InqNumP 
*get_ID_Master_with_WO_Detail  Is_SOitem_Process_SELECTED 
*ID_Detail_Exists

*Remove_Incoming_Process_RID
*Remove_Incoming_Process_by_POitem 
*Remove_Incoming_Process_by_WO_Detail_RID
*Remove_Incoming_Process_by_ID_Detail 

*Remove_Lst_ID 
*DEPRICATED --Remove_StockLst_ID Remove_BrokerLst_ID Remove_WIPLst_ID

*Remove_Lst_Detail_by_MasterID 
*DEPRICATED --<Remove_StockLst_Detail_by_MasterID <Remove_BrokerLst_Detail_by_MasterID 

*Check_PS_Entry Check_PS_Entry_SID 
*CheckChangeDetailPrice 
*Check_Process 
*MarkedAsRMAreceived 
*GetID_Detail_Process_With_POitem GetID_Detail_Process_With_WO_Detail 
*GetID_Detail_With_ID_Detail_Process 
*Has_ID_Detail_History
*get_Starting_Stock_Desc 
*Move_Lst_POitem 
*Move_BrokerLst_StockLst    Create_StockLstRMA_From_Broker_History
*Move_WIPLst_StockLst  
*isCL_CC  Default_CL_CC  
*ConditionLevelText NewCC_CL CC_CLsort  C2_Sort 
*CCSortValue CCSort 
*isTBL_PO_NotStock isTBL_PO_Valid PurchaseOrder_Allow_TBL  
*Count_ProcessbyID_Detail_Process Count_POItem_DueIn 

*AcctCosting_Start  AcctCosting_Alert AcctCosting_POitem_Update AcctCosting_SOitem_Update AcctCosting_WO_Update AcctCosting_WOD_Update 
*AcctCost_MachineLot_Update AcctCosting_INS AcctCosting_get_dtCreate_ID 
*AcctCosting_Check_WO ?
*Is_InvoiceValue_Valid 

*RESTORE ID_Master - Look at StockLst History for Restore to Stock Code.
*RESTORE ID_Detail - Look at StockLst History for Restore to Stock Code.

*BringBack_DeletedLst 

*get_SD_ID  get_SS_IDfrom_ID_D_P
*get_SD_IDfrom_ID_D_P 

*Calc_Vend_QTYleft_PO    Calc_Vend_PiecesLeft_PO

*Get_Stock_Detail
*get_ID_D_P_forReceivingID 		get_ID_Detail_from_PRC  get_ID_Detail_from_RMA_Detail	get_ID_Detail_from_WOD  
*p_Lst_Detail_Clone p_Lst_Detail_Clone_WIP

*MaxLBS_Location  LBS_Location Location_CNT
*Update_PurchaseOrder_Set_TBL_IDDP Update_WOD_Set_TBL_IDDP 
* is_POitem_Received 
*get_PS_Qty 
*is_Order_Stock_Process
*
********************************* 
PROC getPricingUnitbyID
PARAMETER nID, cTBL, pConnHandle
*cMess = getPricingUnitbyID( nID, cTBL, pConnHandle )

IF VARTYPE(nID) != "N"
	TrackError("Bad Parameter nID","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN ''
ENDIF

IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter cTBL","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN ''
ENDIF

PRIVATE cReturn
cReturn = ''

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	nConn = pConnHandle
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE cForm, cUnit
cForm = '10'
cUnit = ''

PRIVATE cSQL, nSQLEXEC, lOK, cMess
lOK = .T.
cMess = ""
PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_MasterForm')
	USE IN tmpPSTK_MasterForm
ENDIF

SELECT 0

cSQL="SELECT Form FROM "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + " dbo.StockLst_Master "
CASE cTBL = "B"
	cSQL = cSQL + " dbo.BrokerLst_Master "
CASE cTBL = "W"
	cSQL = cSQL + " dbo.WIPLst_Master "
OTHERWISE 
	TrackError("Bad Parameter nConn","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDCASE
cSQL = cSQL + " WHERE ID="+ALLTRIM(STR(nID))
cSQL = cSQL + " AND LEN(Form)>1"

nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_MasterForm')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_MasterForm' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MasterForm")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MasterForm")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_MasterForm')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		lOK = .F.
	ENDIF
ENDIF
IF USED('tmpPSTK_MasterForm')
	IF RECCOUNT('tmpPSTK_MasterForm') > 0
		cForm = PrepareSQLtxt(tmpPSTK_MasterForm.Form,'Form',2)
		cUnit = GetUNITfromFORM(cForm, nConn)
	ENDIF
	USE IN tmpPSTK_MasterForm
ENDIF

*****
IF cUnit = ''
	*Check History
	SELECT 0

	cSQL="SELECT TOP 1 Form FROM "
	DO CASE
	CASE cTBL = "S"
		cSQL = cSQL + " HPAlloy_Archive.dbo.StockLst_Master_History "
	CASE cTBL = "B"
		cSQL = cSQL + " HPAlloy_Archive.dbo.BrokerLst_Master_History "
	CASE cTBL = "W"
		cSQL = cSQL + " HPAlloy_Archive.dbo.WIPLst_Master_History "
	ENDCASE
	cSQL = cSQL + " WHERE ID="+ALLTRIM(STR(nID))
	cSQL = cSQL + " AND LEN(Form)>1"
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_MasterForm')
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_MasterForm' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MasterForm")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MasterForm")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_MasterForm')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
			lOK = .F.
		ENDIF
	ENDIF
	IF USED('tmpPSTK_MasterForm')
		IF RECCOUNT('tmpPSTK_MasterForm') > 0
			cForm = PrepareSQLtxt(tmpPSTK_MasterForm.Form,'Form',2)
			cUnit = GetUNITfromFORM(cForm, nConn)
		ENDIF
		USE IN tmpPSTK_MasterForm
	ENDIF
ENDIF
*****

IF nConn != pConnHandle
	 = SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

IF cUnit = ''
	TrackError(cSQL,"Unit/Form Not Found","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF


RETURN cUnit 
ENDPROC

********************************* 
PROC getStk_Heat
PARAMETER nID, cTBL, pConnHandle
*cMess = getStk_Heat( nID, cTBL, pConnHandle )

IF VARTYPE(nID) != "N"
	TrackError("Bad Parameter nID","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN ''
ENDIF

IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter cTBL","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN ''
ENDIF

PRIVATE cReturn
cReturn = ''

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	nConn = pConnHandle
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE cHeat
cHeat = ''

PRIVATE cSQL, nSQLEXEC, lOK, cMess
lOK = .T.
cMess = ""
PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_MasterForm')
	USE IN tmpPSTK_MasterForm
ENDIF

SELECT 0

cSQL="SELECT Heat FROM "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + " dbo.StockLst_Master "
CASE cTBL = "B"
	cSQL = cSQL + " dbo.BrokerLst_Master "
CASE cTBL = "W"
	cSQL = cSQL + " dbo.WIPLst_Master "
OTHERWISE 
	TrackError("Bad Parameter nConn","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDCASE
cSQL = cSQL + " WHERE ID="+ALLTRIM(STR(nID))


nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_MasterForm')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_MasterForm' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MasterForm")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MasterForm")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_MasterForm')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		lOK = .F.
	ENDIF
ENDIF
IF USED('tmpPSTK_MasterForm')
	IF RECCOUNT('tmpPSTK_MasterForm') > 0
		cHeat = PrepareSQLtxt(tmpPSTK_MasterForm.Heat,'Heat',50)
	ENDIF
	USE IN tmpPSTK_MasterForm
ENDIF
*****
IF LEN(cHeat)=0
	SELECT 0

	cSQL="SELECT Heat FROM "
	DO CASE
	CASE cTBL = "S"
		cSQL = cSQL + " HPAlloy_Archive.dbo.StockLst_Master_History "
	CASE cTBL = "B"
		cSQL = cSQL + " HPAlloy_Archive.dbo.BrokerLst_Master_History "
	CASE cTBL = "W"
		cSQL = cSQL + " HPAlloy_Archive.dbo.WIPLst_Master_History "
	OTHERWISE 
		TrackError("Bad Parameter nConn","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
		RETURN ''
	ENDCASE
	cSQL = cSQL + " WHERE ID="+ALLTRIM(STR(nID))
	cSQL = cSQL + " AND LEN(ISNULL(Heat,'')) >0 "
	cSQL = cSQL + " AND NOT Heat LIKE'Due In%' "

	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_MasterForm')
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_MasterForm' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MasterForm")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MasterForm")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_MasterForm')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
			lOK = .F.
		ENDIF
	ENDIF
	IF USED('tmpPSTK_MasterForm')
		IF RECCOUNT('tmpPSTK_MasterForm') > 0
			cHeat = PrepareSQLtxt(tmpPSTK_MasterForm.Heat,'Heat',50)
		ENDIF
		USE IN tmpPSTK_MasterForm
	ENDIF
ENDIF
****
IF nConn != pConnHandle
	 = SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cHeat 
ENDPROC

********************************* 
PROC getStk_Lot
PARAMETER nID, cTBL, pConnHandle
*cLot = getStk_Lot( nID, cTBL, pConnHandle )

IF VARTYPE(nID) != "N"
	TrackError("Bad Parameter nID","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN ''
ENDIF

IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter cTBL","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN ''
ENDIF

PRIVATE cReturn
cReturn = ''

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	nConn = pConnHandle
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE cLot
cLot = ''

PRIVATE cSQL, nSQLEXEC, lOK, cMess
lOK = .T.
cMess = ""
PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_MasterLot')
	USE IN tmpPSTK_MasterLot
ENDIF

SELECT 0

cSQL="SELECT Lot FROM "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + " dbo.StockLst_Master "
CASE cTBL = "B"
	cSQL = cSQL + " dbo.BrokerLst_Master "
CASE cTBL = "W"
	cSQL = cSQL + " dbo.WIPLst_Master "
OTHERWISE 
	TrackError("Bad Parameter nConn","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDCASE
cSQL = cSQL + " WHERE ID="+ALLTRIM(STR(nID))


nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_MasterLot')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_MasterLot' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MasterLot")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MasterLot")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_MasterLot')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		lOK = .F.
	ENDIF
ENDIF
IF USED('tmpPSTK_MasterLot')
	IF RECCOUNT('tmpPSTK_MasterLot') > 0
		cLot= PrepareSQLtxt(tmpPSTK_MasterLot.Lot,'Lot',10)
	ENDIF
	USE IN tmpPSTK_MasterLot
ENDIF
*****
IF LEN(cLot)=0
	SELECT 0

	cSQL="SELECT Lot FROM "
	DO CASE
	CASE cTBL = "S"
		cSQL = cSQL + " HPAlloy_Archive.dbo.StockLst_Master_History "
	CASE cTBL = "B"
		cSQL = cSQL + " HPAlloy_Archive.dbo.BrokerLst_Master_History "
	CASE cTBL = "W"
		cSQL = cSQL + " HPAlloy_Archive.dbo.WIPLst_Master_History "
	OTHERWISE 
		TrackError("Bad Parameter nConn","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
		RETURN ''
	ENDCASE
	cSQL = cSQL + " WHERE ID="+ALLTRIM(STR(nID))
	cSQL = cSQL + " AND LEN(ISNULL(Lot,'')) >0 "

	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_MasterLot')
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_MasterLot' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MasterLot")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MasterLot")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_MasterLot')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
			lOK = .F.
		ENDIF
	ENDIF
	IF USED('tmpPSTK_MasterLot')
		IF RECCOUNT('tmpPSTK_MasterLot') > 0
			cLot= PrepareSQLtxt(tmpPSTK_MasterLot.Lot,'Lot',10)
		ENDIF
		USE IN tmpPSTK_MasterLot
	ENDIF
ENDIF
****
IF nConn != pConnHandle
	 = SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cLot 
ENDPROC

********************************* 
PROC getStk_Heat_Selected
PARAMETER nID, cTBL, pConnHandle
*cMess = getStk_Heat( nID, cTBL, pConnHandle )

IF VARTYPE(nID) != "N"
	TrackError("Bad Parameter nID","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN ''
ENDIF

IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter cTBL","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN ''
ENDIF

PRIVATE cReturn
cReturn = ''

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	nConn = pConnHandle
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE cHeat
cHeat = ''

PRIVATE cSQL, nSQLEXEC, lOK, cMess
lOK = .T.
cMess = ""
PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_MasterHs')
	USE IN tmpPSTK_MasterHs
ENDIF

SELECT 0

cSQL="SELECT Heat FROM "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + " dbo.StockLst_Master "
CASE cTBL = "B"
	cSQL = cSQL + " dbo.BrokerLst_Master "
CASE cTBL = "W"
	cSQL = cSQL + " dbo.WIPLst_Master "
OTHERWISE 
	TrackError("Bad Parameter nConn","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDCASE
cSQL = cSQL + " WHERE ID="+ALLTRIM(STR(nID))


nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_MasterHs')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_MasterHs' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MasterHs")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MasterHs")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_MasterHs')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		lOK = .F.
	ENDIF
ENDIF
IF USED('tmpPSTK_MasterHs')
	IF RECCOUNT('tmpPSTK_MasterHs') > 0
		cHeat = PrepareSQLtxt(tmpPSTK_MasterHs.Heat,'Heat',50)
	ENDIF
	USE IN tmpPSTK_MasterHs
ENDIF
*****

IF LEN(cHeat) = 0
*Search History
	SELECT 0

	cSQL="SELECT Heat FROM "
	DO CASE
	CASE cTBL = "S"
		cSQL = cSQL + " HPAlloy_Archive.dbo.StockLst_Master_History "
	CASE cTBL = "B"
		cSQL = cSQL + " HPAlloy_Archive.dbo.BrokerLst_Master_History "
	CASE cTBL = "W"
		cSQL = cSQL + " HPAlloy_Archive.dbo.WIPLst_Master_History "
	OTHERWISE 
		TrackError("Bad Parameter nConn","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
		RETURN ''
	ENDCASE
	cSQL = cSQL + " WHERE ID="+ALLTRIM(STR(nID))
	cSQL = cSQL + " AND LEN(ISNULL(Heat,'')) >0 "
	cSQL = cSQL + " AND NOT Heat LIKE'Due In%' "
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_MasterHs')
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_MasterHs' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MasterHs")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MasterHs")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_MasterHs')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
			lOK = .F.
		ENDIF
	ENDIF
	IF USED('tmpPSTK_MasterHs')
		IF RECCOUNT('tmpPSTK_MasterHs') > 0
			cHeat = PrepareSQLtxt(tmpPSTK_MasterHs.Heat,'Heat',50)
		ENDIF
		USE IN tmpPSTK_MasterHs
	ENDIF
ENDIF
*****


IF nConn != pConnHandle
	 = SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cHeat 
ENDPROC

********************************* 
PROC getID_D_P_Incoming
PARAMETER pWhat, pNumber, cTBL, pConnHandle
*nID_Detail_Process  = getID_D_P_Incoming( "WO_Detail", nWO_Detail, cTBL, pConnHandle )
*get ID_Detail_Process for Table and Process_ID = 'INCOMING'"

IF VARTYPE(pWhat) != "C"
	TrackError("Bad Parameter pWhat ","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN 0
ENDIF

IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter cTBL","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN ''
ENDIF


PRIVATE nID_D_P
nID_D_P = 0

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	nConn = pConnHandle
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF
nConn = CheckSQLConnection(nConn)


PRIVATE cSQL, nSQLEXEC, lOK, cMess
lOK = .T.
cMess = ""
PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_IS_D_Pro')
	USE IN tmpPSTK_IS_D_Pro
ENDIF

SELECT 0

cSQL="SELECT ID_Detail_Process FROM "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + " dbo.StockLst_Process "
CASE cTBL = "B"
	cSQL = cSQL + " dbo.BrokerLst_Process "
CASE cTBL = "W"
	cSQL = cSQL + " dbo.WIPLst_Process "
OTHERWISE 
	*TrackError("Bad Parameter nConn","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDCASE

DO CASE
CASE UPPER(pWhat) == "WO"
	cSQL = cSQL + " WHERE WO_Detail = "+ALLTRIM(STR(pNumber))
CASE UPPER(pWhat) == "WO_DETAIL"
	cSQL = cSQL + " WHERE WO_Detail = "+ALLTRIM(STR(pNumber))
CASE UPPER(pWhat) == "RID"
	cSQL = cSQL + " WHERE ReceivingID = "+ALLTRIM(STR(pNumber))
CASE UPPER(pWhat) == "ID_DETAIL"
	cSQL = cSQL + " WHERE ID_Detail = "+ALLTRIM(STR(pNumber))
CASE UPPER(pWhat) == "POITEM" OR UPPER(pWhat) == "PO_ITEM"
	cSQL = cSQL + " WHERE PO_Item = '"+pNumber+"'"
CASE UPPER(pWhat) == "SOITEM"
	cSQL = cSQL + " WHERE SOitem = '"+pNumber+"'"

OTHERWISE
	RETURN 0
ENDCASE

cSQL = cSQL + " and Process_ID = 'INCOMING'"

nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_IS_D_Pro')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_IS_D_Pro' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_IS_D_Pro")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_IS_D_Pro")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_IS_D_Pro')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		lOK = .F.
	ENDIF
ENDIF
IF USED('tmpPSTK_IS_D_Pro')
	IF RECCOUNT('tmpPSTK_IS_D_Pro') > 0
		nID_D_P = PrepareSQLnum(tmpPSTK_IS_D_Pro.ID_Detail_Process ,'ID_Detail_Process',-3)
	ENDIF
	USE IN tmpPSTK_IS_D_Pro
ENDIF
*****

IF nConn != pConnHandle
	 = SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nID_D_P
ENDPROC

********************************* 
PROC getStk_HeatLot
PARAMETER nID, cTBL, pConnHandle
*cMess = getStk_HeatLot( nID, cTBL, pConnHandle )
* you still need to parse the '#' out

IF VARTYPE(nID) != "N"
	TrackError("Bad Parameter nID","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN ''
ENDIF

IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter cTBL","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN ''
ENDIF

PRIVATE cReturn
cReturn = ''

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	nConn = pConnHandle
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE cHeatLot
cHeatLot= ''

PRIVATE cSQL, nSQLEXEC, lOK, cMess
lOK = .T.
cMess = ""
PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_MasterHtLt')
	USE IN tmpPSTK_MasterHtLt
ENDIF

SELECT 0

cSQL="SELECT Heat,Lot FROM "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + " dbo.StockLst_Master "
CASE cTBL = "B"
	cSQL = cSQL + " dbo.BrokerLst_Master "
CASE cTBL = "W"
	cSQL = cSQL + " dbo.WIPLst_Master "
OTHERWISE 
	TrackError("Bad Parameter nConn","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDCASE
cSQL = cSQL + " WHERE ID="+ALLTRIM(STR(nID))


nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_MasterHtLt')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_MasterHtLt' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MasterHtLt")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MasterHtLt")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_MasterHtLt')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		lOK = .F.
	ENDIF
ENDIF
PRIVATE cHeat, cLot
cHeat = ''
cLot = ''

IF USED('tmpPSTK_MasterHtLt')
	IF RECCOUNT('tmpPSTK_MasterHtLt') > 0
		cHeat = PrepareSQLtxt(tmpPSTK_MasterHtLt.Heat,'Heat',50)
		cLot = PrepareSQLtxt(tmpPSTK_MasterHtLt.Lot,'Lot',10)
		cHeatLot = ALLTRIM(cHeat)+'#'+ALLTRIM(cLot)
	ENDIF
	USE IN tmpPSTK_MasterHtLt
ENDIF
*****

IF nConn != pConnHandle
	 = SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cHeatLot
ENDPROC

********************************* 
PROC CalcDetailWeight
PARAMETER nID, cTBL, pPC, pDim1, pDim2, pDim3, pConnHandle
*nLBS = CalcDetailWeight( nID, cTBL, pPC, pDim1, pDim2, pDim3, pConnHandle )

IF VARTYPE(nID) != "N"
	TrackError("Bad Parameter ID","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN 0
ENDIF

IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter cTBL","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN 0
ENDIF

PRIVATE nPC, nDim1, nDim2, nDim3
nPC	= PrepareSQLnum(pPC,'PC',-3)
nDim1 = PrepareSQLnum(pDim1,'Dim1',18,4)
nDim2 = PrepareSQLnum(pDim2,'Dim2',18,3)
nDim3 = PrepareSQLnum(pDim3,'Dim3',18,3)

PRIVATE nLBS 
nLBS = 0

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	nConn = pConnHandle
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE cAlloy,cForm

PRIVATE cSQL, nSQLEXEC, lOK, cMess
lOK = .T.
cMess = ""
PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_MasterForm')
	USE IN tmpPSTK_MasterForm
ENDIF

SELECT 0

cSQL="SELECT Alloy,Form FROM "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + " dbo.StockLst_Master "
CASE cTBL = "B"
	cSQL = cSQL + " dbo.BrokerLst_Master "
CASE cTBL = "W"
	cSQL = cSQL + " dbo.WIPLst_Master "
OTHERWISE 
	TrackError("Bad Parameter nConn","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDCASE

cSQL = cSQL + " WHERE ID ="+ALLTRIM(STR(nID))

nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_MasterForm')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_MasterForm' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MasterForm")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MasterForm")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_MasterForm')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		lOK=.F.
	ENDIF
ENDIF
IF USED('tmpPSTK_MasterForm')
	IF RECCOUNT('tmpPSTK_MasterForm') > 0
		cAlloy = tmpPSTK_MasterForm.Alloy
		cForm  = tmpPSTK_MasterForm.Form
	ENDIF
	USE IN tmpPSTK_MasterForm
ENDIF

*****
*Proc_SQL:GetWeight
nLBS = GetWeight(nPC,cAlloy,cForm,nDim1,nDim2,nDim3, nConn)
*****

IF nConn != pConnHandle
	 = SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nLBS 
ENDPROC

********************************* 
PROC CalcDetailPricingUnits
PARAMETER nID, cTBL, pPC, pDim1, pDim2, pDim3, pConnHandle
*nPriceUnits = CalcDetailPricingUnits( nID, cTBL, pPC, pDim1, pDim2, pDim3, pConnHandle )

IF VARTYPE(nID) != "N"
	TrackError("Bad Parameter ID","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN 0
ENDIF

IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter cTBL","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

PRIVATE nPC, nDim1, nDim2, nDim3
nPC	= PrepareSQLnum(pPC,'PC',-3)
nDim1 = PrepareSQLnum(pDim1,'Dim1',18,4)
nDim2 = PrepareSQLnum(pDim2,'Dim2',18,3)
nDim3 = PrepareSQLnum(pDim3,'Dim3',18,3)

PRIVATE nPriceUnits 
nPriceUnits = 0

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	nConn = pConnHandle
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE cAlloy,cForm
cAlloy=''
cForm = ''

PRIVATE cSQL, nSQLEXEC, lOK, cMess
lOK = .T.
cMess = ""
PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_MasterForm')
	USE IN tmpPSTK_MasterForm
ENDIF

SELECT 0

cSQL="SELECT Alloy,Form FROM "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + " dbo.StockLst_Master "
CASE cTBL = "B"
	cSQL = cSQL + " dbo.BrokerLst_Master "
CASE cTBL = "W"
	cSQL = cSQL + " dbo.WIPLst_Master "
OTHERWISE 
	TrackError("Bad Parameter nConn","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDCASE
cSQL = cSQL + " WHERE ID="+ALLTRIM(STR(nID))

nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_MasterForm')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_MasterForm' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MasterForm")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MasterForm")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_MasterForm')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		lOK = .F.
	ENDIF
ENDIF
IF USED('tmpPSTK_MasterForm')
	IF RECCOUNT('tmpPSTK_MasterForm') > 0
		cAlloy = tmpPSTK_MasterForm.Alloy
		cForm  = tmpPSTK_MasterForm.Form
	ENDIF
	USE IN tmpPSTK_MasterForm
ENDIF

PRIVATE nPU
*Proc_SQL:GetPUfromForm
nPU = GetPUfromForm(cForm, nConn)
DO CASE
CASE nPU = 1
	*Pounds
	*Proc_SQL:GetWeight
	nPriceUnits = GetWeight(nPC,cAlloy,cForm,nDim1,nDim2,nDim3, nConn)
CASE nPU = 2
	*Feet
	PRIVATE lUse3rdDim 
	lUse3rdDim = Uses3rdDim( cForm, nConn )
	IF lUse3rdDim 
		nPriceUnits = nPC * nDim3 /12
	ELSE
		nPriceUnits = nPC * nDim2 /12
	ENDIF
CASE nPU = 3
	*Pieces
	nPriceUnits = nPC
OTHERWISE
	nPriceUnits = 0
ENDCASE

*****

IF nConn != pConnHandle
	 = SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nPriceUnits 
ENDPROC

********************************* 
PROC getFormbyMasterID 
PARAMETER nID, cTBL, pConnHandle
*cForm = getFormbyMasterID( nID, cTBL, pConnHandle )

IF VARTYPE(nID) != "N"
	TrackError("Bad Parameter ID","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF

IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter cTBL","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF

PRIVATE cReturn
cReturn = ''

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	nConn = pConnHandle
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE cForm
cForm = '10'		&&be carefull

PRIVATE cSQL, nSQLEXEC, lOK, cMess
lOK = .T.
cMess = ""
PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_MasterForm')
	USE IN tmpPSTK_MasterForm
ENDIF

SELECT 0

*dbo.StockLst_Master dbo.BrokerLst_Master
cSQL="SELECT Form FROM "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + " dbo.StockLst_Master "
CASE cTBL = "B"
	cSQL = cSQL + " dbo.BrokerLst_Master "
CASE cTBL = "W"
	cSQL = cSQL + " dbo.WIPLst_Master "
OTHERWISE 
	TrackError("Bad Parameter nConn","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDCASE
cSQL = cSQL + " WHERE ID="+ALLTRIM(STR(nID))

nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_MasterForm')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_MasterForm' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MasterForm")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MasterForm")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_MasterForm')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		lOK = .F.
	ENDIF
ENDIF
IF USED('tmpPSTK_MasterForm')
	IF RECCOUNT('tmpPSTK_MasterForm') > 0
		cForm = PrepareSQLtxt(tmpPSTK_MasterForm.Form,'Form',2)
	ENDIF
	USE IN tmpPSTK_MasterForm
ENDIF
IF nConn != pConnHandle
	 = SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cForm
ENDPROC

********************************* 

PROC GetIDfromID_Detail 
PARAMETER nID_Detail, cTBL, pConnHandle
*nID = GetIDfromID_Detail( nID_Detail, cTBL, pConnHandle )

IF VARTYPE(nID_Detail) != "N"
	TrackError("Bad Parameter ID_Detail","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter cTBL","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF


PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	nConn = pConnHandle
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE nID
nID = 0

PRIVATE cSQL, nSQLEXEC, lOK, cMess
lOK = .T.
cMess = ""
PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_MasterForm')
	USE IN tmpPSTK_MasterForm
ENDIF

SELECT 0
*use HPAlloy_Archive incase Detail is gone
cSQL="SELECT DISTINCT ID FROM "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + " HPAlloy_Archive.dbo.Stocklst_Detail_History "
CASE cTBL = "B"
	cSQL = cSQL + " HPAlloy_Archive.dbo.Brokerlst_Detail_History "
CASE cTBL = "W"
	cSQL = cSQL + " HPAlloy_Archive.dbo.WIPlst_Detail_History "
OTHERWISE 
	TrackError("Bad Parameter nConn","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDCASE
cSQL = cSQL + " WHERE ID_Detail= "+STR(nID_Detail)

nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_MasterForm')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_MasterForm' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MasterForm")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MasterForm")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_MasterForm')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		lOK = .F.
	ENDIF
ENDIF
IF USED('tmpPSTK_MasterForm')
	IF RECCOUNT('tmpPSTK_MasterForm') > 0
		nID = tmpPSTK_MasterForm.ID
	ENDIF
	USE IN tmpPSTK_MasterForm
ENDIF

IF nConn != pConnHandle
	 = SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nID
ENDPROC

********************************* 

PROC GetID_DetailfromID_Detail_P
PARAMETER nID_Detail_P, cTBL, pConnHandle
*nID_Detail = GetID_DetailfromID_Detail_P( nID_Detail_P, cTBL, pConnHandle )

IF VARTYPE(nID_Detail_P) != "N"
	TrackError("Bad Parameter nID_Detail_Proc","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF


PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	nConn = pConnHandle
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE nID
nID = 0

PRIVATE cSQL, nSQLEXEC, lOK, cMess
lOK = .T.
cMess = ""
PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_MasterForm')
	USE IN tmpPSTK_MasterForm
ENDIF

SELECT 0

cSQL="SELECT DISTINCT ID_Detail FROM "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + " dbo.StockLst_Process "
CASE cTBL = "B"
	cSQL = cSQL + " dbo.BrokerLst_Process "
CASE cTBL = "W"
	cSQL = cSQL + " dbo.WIPLst_Process "
OTHERWISE 
	TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDCASE
cSQL = cSQL + " WHERE ID_Detail_Process= "+STR(nID_Detail_P)

nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_MasterForm')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_MasterForm' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MasterForm")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MasterForm")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_MasterForm')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		lOK = .F.
	ENDIF
ENDIF
IF USED('tmpPSTK_MasterForm')
	IF RECCOUNT('tmpPSTK_MasterForm') > 0
		nID = tmpPSTK_MasterForm.ID
	ENDIF
	USE IN tmpPSTK_MasterForm
ENDIF

IF nConn != pConnHandle
	 = SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nID
ENDPROC

*********************************  

PROC Get_top_ID_Detail_from_ID 
PARAMETER nID, cTBL, pConnHandle
*nID_Detail = Get_top_ID_Detail_from_ID( nID, cTBL, pConnHandle )

IF VARTYPE(nID) != "N"
	TrackError("Bad Parameter","Bad Parameter ID","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF


PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	nConn = pConnHandle
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE nID_Detail
nID_Detail = 0

PRIVATE cSQL, nSQLEXEC, lOK, cMess
lOK = .T.
cMess = ""
PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_MasterForm')
	USE IN tmpPSTK_MasterForm
ENDIF

SELECT 0

cSQL="SELECT TOP 1 ID_Detail FROM "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + " dbo.StockLst_Detail "
CASE cTBL = "B"
	cSQL = cSQL + " dbo.BrokerLst_Detail "
CASE cTBL = "W"
	cSQL = cSQL + " dbo.WIPLst_Detail "
OTHERWISE 
	TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDCASE
cSQL = cSQL + " WITH(NOLOCK) WHERE ID = "+STR(nID)

nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_MasterForm')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_MasterForm' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MasterForm")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MasterForm")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_MasterForm')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		lOK = .F.
	ENDIF
ENDIF

IF USED('tmpPSTK_MasterForm')
	IF RECCOUNT('tmpPSTK_MasterForm') > 0
		nID_Detail = PrepareSQLnum(tmpPSTK_MasterForm.ID_Detail,'ID_Detail',-3)
	ENDIF
	USE IN tmpPSTK_MasterForm
ENDIF

*** BEGIN look in to History
IF lOK AND nID_Detail =0
	cSQL="SELECT TOP 1 ID_Detail FROM "
	DO CASE
	CASE cTBL = "S"
		cSQL = cSQL + " HPAlloy_Archive.dbo.StockLst_Detail_History "
	CASE cTBL = "B"
		cSQL = cSQL + " HPAlloy_Archive.dbo.BrokerLst_Detail_History "
	CASE cTBL = "W"
		cSQL = cSQL + " HPAlloy_Archive.dbo.WIPLst_Detail_History "
	OTHERWISE 
		TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
		RETURN 0
	ENDCASE
	cSQL = cSQL + " WITH(NOLOCK) WHERE ID = "+STR(nID)
	cSQL = cSQL + " ORDER BY ReceivingID DESC, ID_Detail "
*--	cSQL = cSQL + " AND [What]='ADD' "
*--	cSQL = cSQL + " ORDER BY ID_Detail "

	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_MasterForm')
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_MasterForm' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MasterForm")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MasterForm")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_MasterForm')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
			lOK = .F.
		ENDIF
	ENDIF

	IF USED('tmpPSTK_MasterForm')
		IF RECCOUNT('tmpPSTK_MasterForm') > 0
			nID_Detail = PrepareSQLnum(tmpPSTK_MasterForm.ID_Detail,'ID_Detail',-3)
		ENDIF
		USE IN tmpPSTK_MasterForm
	ENDIF

ENDIF
*** END look in to History

IF nConn != pConnHandle
	 = SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nID_Detail
ENDPROC

********************************* 
PROC GetIDfromDeletedHistory_ID_History
PARAMETER nID_History, pConnHandle
*nID = GetIDfromDeletedHistory_ID_History(nID_History,ThisForm.nConnHandle)

IF VARTYPE(nID_History) != "N"
	TrackError("Bad Parameter","Bad Parameter ID","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

PRIVATE cReturn
cReturn = 0

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	nConn = pConnHandle
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE nID
nID=0

PRIVATE cSQL, nSQLEXEC, lOK, cMess
lOK = .T.
cMess = ""
PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_MasterDeletedID')
	USE IN tmpPSTK_MasterDeletedID
ENDIF

SELECT 0

cSQL="SELECT ID FROM [HPAlloy_Archive].[dbo].[Stocklst_Master_History]"
cSQL = cSQL + " WHERE ID_History="+ALLTRIM(STR(m.nID_History))

nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_MasterDeletedID')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_MasterDeletedID' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MasterDeletedID")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MasterDeletedID")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_MasterDeletedID')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		lOK = .F.
	ENDIF
ENDIF
IF USED('tmpPSTK_MasterDeletedID')
	IF RECCOUNT('tmpPSTK_MasterDeletedID') > 0
		nID = tmpPSTK_MasterDeletedID.ID
	ENDIF
	USE IN tmpPSTK_MasterDeletedID
ENDIF
IF nConn != pConnHandle
	 = SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nID
ENDPROC

**********************************
	
PROCEDURE get_POitem_StockLstID
PARAMETERS pnID, pSales_Detail_ID, cTbl, pConnHandle

*get_POitem_StockLstID(pnID,pSales_Detail_ID,'StockLst',ThisForm.nConnHandle)
*Returns POitem that bought the Stock

IF VARTYPE(pnID) != "N"
	TrackError("Bad Parameter","Bad Parameter ID","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF
IF VARTYPE(cTbl) != "C"
	TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF


IF VARTYPE(pSales_Detail_ID) != "N"
	pSales_Detail_ID = 0
ENDIF


IF UPPER(cTbl) = "STOCKLST"
	cTbl = "S"
ENDIF
IF UPPER(cTbl) = "BROKERLST"
	cTbl = "B"
ENDIF
IF UPPER(cTbl) = "WIPLST"
	cTbl = "W"
ENDIF

IF NOT ( cTbl = "S" OR cTbl = "B" OR cTbl = "W" )
	TrackError("Bad Parameter","Bad cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
	ENDIF
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_ID_POitem')
	USE IN tmpPSTK_ID_POitem
ENDIF

PRIVATE cPOitem
cPOitem = ''

PRIVATE cSQL, nSQLEXEC
DO CASE
CASE cTBL = "S"
	cSQL = "SELECT DISTINCT PO_Item AS 'PO_Item',P.Thck "
	cSQL = cSQL + " ,ISNULL(P.[Services],0) AS [Services], ISNULL(P.[Equipment],0) AS [Equipment], ISNULL(P.[ConvServ],0) AS [ConvServ], P.SOitem "
	cSQL = cSQL + " FROM "
	cSQL = cSQL + "("
	cSQL = cSQL + "SELECT PO_Item "
	cSQL = cSQL + "	FROM HPAlloy.dbo.StockLst_Master "
	cSQL = cSQL + "	WHERE ID="+ALLTRIM(STR( pnID ))
	cSQL = cSQL + "		AND LEN(PO_Item)>1 "
	cSQL = cSQL + "UNION ALL "
	cSQL = cSQL + "SELECT PO_Item "
	cSQL = cSQL + "	FROM HPAlloy_Archive.dbo.StockLst_Master_History "
	cSQL = cSQL + "	WHERE ID="+ALLTRIM(STR( pnID ))
	cSQL = cSQL + "		 AND LEN(PO_Item)>1"
	cSQL = cSQL + " )"
	cSQL = cSQL + " AS tmpPSTK_ "
	cSQL = cSQL + " INNER JOIN dbo.PurchaseOrder P ON p.POitem = PO_Item "
	cSQL = cSQL + " ORDER BY P.Thck, ISNULL(P.[Services],0), ISNULL(P.[Equipment],0) , ISNULL(P.[ConvServ],0)  "
CASE cTBL = "B"
	cSQL = "SELECT DISTINCT PO_Item AS 'PO_Item',P.Thck "
	cSQL = cSQL + " ,ISNULL(P.[Services],0) AS [Services], ISNULL(P.[Equipment],0) AS [Equipment], ISNULL(P.[ConvServ],0) AS [ConvServ], P.SOitem "
	cSQL = cSQL + "	FROM "
	cSQL = cSQL + "("
	cSQL = cSQL + "SELECT PO_Item "
	cSQL = cSQL + "	FROM HPAlloy.dbo.BrokerLst_Master "
	cSQL = cSQL + "	WHERE ID="+ALLTRIM(STR( pnID ))
	cSQL = cSQL + "		AND LEN(PO_Item)>1 "
	cSQL = cSQL + "UNION ALL "
	cSQL = cSQL + "SELECT PO_Item "
	cSQL = cSQL + "	FROM HPAlloy_Archive.dbo.BrokerLst_Master_History "
	cSQL = cSQL + "	WHERE ID="+ALLTRIM(STR( pnID ))
	cSQL = cSQL + "		 AND LEN(PO_Item)>1"
	cSQL = cSQL + " )"
	cSQL = cSQL + " AS tmpPSTK_ "
	cSQL = cSQL + " INNER JOIN dbo.PurchaseOrder P ON p.POitem = PO_Item "
	cSQL = cSQL + " ORDER BY P.Thck, ISNULL(P.[Services],0), ISNULL(P.[Equipment],0) , ISNULL(P.[ConvServ],0) "
CASE cTBL = "W"
	cSQL = "SELECT DISTINCT PO_Item AS 'PO_Item',P.Thck "
	cSQL = cSQL + " ,ISNULL(P.[Services],0) AS [Services], ISNULL(P.[Equipment],0) AS [Equipment], ISNULL(P.[ConvServ],0) AS [ConvServ], P.SOitem "
	cSQL = cSQL + "	FROM "
	cSQL = cSQL + "("
	cSQL = cSQL + "SELECT PO_Item "
	cSQL = cSQL + "	FROM HPAlloy.dbo.WIPLst_Master "
	cSQL = cSQL + "	WHERE ID="+ALLTRIM(STR( pnID ))
	cSQL = cSQL + "		AND LEN(PO_Item)>1 "
	cSQL = cSQL + "UNION ALL "
	cSQL = cSQL + "SELECT PO_Item "
	cSQL = cSQL + "	FROM HPAlloy_Archive.dbo.WIPLst_Master_History "
	cSQL = cSQL + "	WHERE ID="+ALLTRIM(STR( pnID ))
	cSQL = cSQL + "		 AND LEN(PO_Item)>1"
	cSQL = cSQL + " )"
	cSQL = cSQL + " AS tmpPSTK_ "
	cSQL = cSQL + " INNER JOIN dbo.PurchaseOrder P ON p.POitem = PO_Item "
	cSQL = cSQL + " ORDER BY P.Thck, ISNULL(P.[Services],0), ISNULL(P.[Equipment],0) , ISNULL(P.[ConvServ],0) "
ENDCASE

IF nConn > 0
	SELECT 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_ID_POitem' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_ID_POitem' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_ID_POitem")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_ID_POitem")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_ID_POitem')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_ID_POitem')
		IF RECCOUNT('tmpPSTK_ID_POitem')>0
			cPOitem = tmpPSTK_ID_POitem.PO_Item
			
			IF RECCOUNT('tmpPSTK_ID_POitem')>1	
			
				*Why is their more than 1 PO?
				*send email.
				SELECT tmpPSTK_ID_POitem
				
				LOCATE FOR STR(Thck,10,1) = STR(pThck,10,1)
				IF FOUND()
					IF cPOitem != tmpPSTK_ID_POitem.PO_Item
						*Update the POitem to return!
						cPOitem = tmpPSTK_ID_POitem.PO_Item
					ENDIF
				ELSE
					LOCATE FOR SOitem = 'STOCK'
					IF FOUND()
						IF cPOitem != tmpPSTK_ID_POitem.PO_Item
							*Update the POitem to return!
							cPOitem = tmpPSTK_ID_POitem.PO_Item
						ENDIF
					ENDIF
				ENDIF
				
				
				
				PRIVATE cBody
				cBody = cSQL +"<br/>"
				cBody = cBody+"<br/>"+ "Proc_StockLst:get_POitem_StockLstID()  ID="+ALLTRIM(STR(pnID))
				IF pSales_Detail_ID > 0
					cBody = cBody+"<br/>"+ "for dbo.Sales_Detail  Sales_Detail_ID="+ALLTRIM(STR(pSales_Detail_ID))
				ENDIF
				cBody = cBody+"<br/>"+ "Too many PO_items:"+ALLTRIM(STR(RECCOUNT('tmpPSTK_ID_POitem')))
				cBody = cBody+"<br/>"+ "Trying to find the POitem that bought the Stock"
				
				SCAN
				
					cBody = cBody+"<br/>"+ "PO_item: "+ALLTRIM(tmpPSTK_ID_POitem.PO_Item)
					cBody = cBody+", Thck: '"+ALLTRIM(STR( PrepareSQLnum(tmpPSTK_ID_POitem.Thck,'Thck',10,4),10,4))
					cBody = cBody+", SOitem: '"+tmpPSTK_ID_POitem.SOitem+"'"
					cBody = cBody+", Services: " +STR(PrepareSQLbit(tmpPSTK_ID_POitem.Services,'Services'))
					cBody = cBody+", Equipment: "+STR(PrepareSQLbit(tmpPSTK_ID_POitem.Equipment,'Equipment'))
					cBody = cBody+", ConvServ: " +STR(PrepareSQLbit(tmpPSTK_ID_POitem.ConvServ,'ConvServ'))
					
				ENDSCAN
				*GO TOP
				
				cBody = cBody+"<br/>"+"Using POitem:'"+cPOitem+"'"
				
				cBody = cBody+"<br/>"+"Machin-User = "+SYS(0)
				cBody = cBody+"<br/>"+ "Proc_StockLst:get_POitem_StockLstID()."

				Send_HTML_Email( 'VFP_Alert@hpalloys.com','David.Kirchner@hpalloy.scom','Too Many PO_items when trying to find the PO that Bought the Stock.',cBody,nConn,.T.,.F.)
			ENDIF
		ENDIF
		USE IN tmpPSTK_ID_POitem
	ENDIF
	IF nConn != pConnHandle
		SQLDISCONNECT( nConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:get_POitem_StockLstID",LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cPOitem

ENDPROC

*********************************
PROCEDURE GetUNITfromFORM 
PARAMETERS pForm, pConnHandle
*cUnit4 = GetUNITfromFORM(pForm, pConnHandle)
*returns CHAR(4) '$/#,$/FT,$/PC'
*See GetPUfromForm to get PriceUnit Number

IF VARTYPE(pForm)="N"
	pForm = STR(pForm,2,0)
ENDIF
IF VARTYPE(pForm)!="C"
	pForm = ''
ENDIF

PRIVATE cSQL, cUnit
cUnit = ''

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

IF USED('tmpPSTK_Forms')
	USE IN tmpPSTK_Forms
ENDIF
SELECT 0

IF nConn > 0
	cSQL = "SELECT Unit FROM dbo.Forms "
	cSQL = cSQL + " WHERE FormNumber='"+pForm+ "'"

	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Forms' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Forms' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Forms")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Forms")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_Forms' )
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_Forms')
		IF VARTYPE(tmpPSTK_Forms.UNIT) = 'C'
			cUnit = tmpPSTK_Forms.UNIT
		ENDIF
		USE IN tmpPSTK_Forms
	ENDIF

	IF lNewConn
		SQLDISCONNECT(nConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cUnit
ENDPROC

*********************************
PROCEDURE GetPRICEUNITfromFORM 
PARAMETERS pForm, pConnHandle
*cUnit = GetPRICEUNITfromFORM (pForm, pConnHandle)
*returns CHAR(4) '$/#,$/FT,$/PC'

*See Proc_SQL:GetPUfromForm to get_PU PriceUnit Number
*	nPU = GetPUfromForm(cForm, nConn)

IF VARTYPE(pForm)="N"
	pForm = STR(pForm,2,0)
ENDIF
IF VARTYPE(pForm)!="C"
	pForm = ''
ENDIF

PRIVATE cSQL, cPriceUnit
cPriceUnit = ''

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

IF USED('tmpPSTK_Forms')
	USE IN tmpPSTK_Forms
ENDIF
SELECT 0

IF nConn > 0
	cSQL = "SELECT [PRICE] FROM dbo.Forms "
	cSQL = cSQL + " WHERE FormNumber='"+pForm+ "'"

	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Forms' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Forms' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Forms")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Forms")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_Forms' )
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_Forms')
		IF VARTYPE(tmpPSTK_Forms.Price) = "C"
			cPriceUnit = tmpPSTK_Forms.Price
		ENDIF
		USE IN tmpPSTK_Forms
	ENDIF

	IF lNewConn
		SQLDISCONNECT(nConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cPriceUnit
ENDPROC

********************************* 
PROCEDURE Get_cPUfrom_nPU 
PARAMETERS nPU, pConnHandle
*cUnit = Get_cPUfrom_nPU(nPU, pConnHandle)
*cUnit = Proc_Quotes:Get_PUtext()
*returns CHAR(4) '$/#,$/FT,$/PC,$Lot'

IF VARTYPE(nPU)="C"
	nPU = VAL(nPU)
ENDIF
IF VARTYPE(nPU)!="N"
	nPU=0
ENDIF

PRIVATE cSQL, cPriceUnit
cPriceUnit = ''

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

IF USED('tmpPSTK_Forms')
	USE IN tmpPSTK_Forms
ENDIF
SELECT 0

IF nConn > 0
	cSQL = "SELECT [Unit] FROM dbo.PU "
	cSQL = cSQL + " WHERE PU="+STR(nPU)

	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Forms' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Forms' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Forms")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Forms")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_Forms' )
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_Forms')
		IF RECCOUNT('tmpPSTK_Forms') > 0
			cPriceUnit = PrepareSQLtxt(tmpPSTK_Forms.Unit,'Unit',4)
		ENDIF
		USE IN tmpPSTK_Forms
	ENDIF

	IF lNewConn
		SQLDISCONNECT(nConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cPriceUnit
ENDPROC


********************************* 
PROCEDURE Get_PUstr_from_nPU 
PARAMETERS nPU, pConnHandle
*cUnit = Get_PUstr_from_nPU(nPU, pConnHandle)
*cUnit = Proc_Quotes:Get_PUtext()
*returns CHAR(4) '$/#,$/FT,$/PC,$Lot'
*** or use Get_Label_from_nPU for Label

IF VARTYPE(nPU)="C"
	nPU = VAL(nPU)
ENDIF
IF VARTYPE(nPU)!="N"
	nPU=0
ENDIF

PRIVATE cSQL, cUnitStr
cUnitStr = ''

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

IF USED('tmpPSTK_Forms')
	USE IN tmpPSTK_Forms
ENDIF
SELECT 0

IF nConn > 0
	*cSQL = "SELECT dbo.f_GetPUstrPU("+STR(nPU)+") AS UNIT "
	cSQL = "SELECT [Unit] FROM dbo.PU WHERE PU="+STR(nPU)
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Forms' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Forms' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Forms")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Forms")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_Forms' )
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_Forms')
		IF RECCOUNT('tmpPSTK_Forms') > 0
			cUnitStr = PrepareSQLtxt(tmpPSTK_Forms.Unit,'Unit',4)
		ENDIF
		USE IN tmpPSTK_Forms
	ENDIF

	IF lNewConn
		SQLDISCONNECT(nConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cUnitStr
ENDPROC

********************************* 
PROCEDURE Get_Label_from_nPU 
PARAMETERS nPU, pConnHandle
*cLabel = Get_Label_from_nPU(nPU, pConnHandle)
*returns CHAR(7) 'Pounds,Feet,Pieces..
*OR try cUnit = Get_PUstr_from_nPU() for Unit

IF VARTYPE(nPU)="C"
	nPU = VAL(nPU)
ENDIF
IF VARTYPE(nPU)!="N"
	nPU=0
ENDIF

PRIVATE cSQL, cPUlabel
cPUlabel = ''

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

IF USED('tmpPSTK_Forms')
	USE IN tmpPSTK_Forms
ENDIF
SELECT 0

IF nConn > 0
	cSQL = "SELECT [Label] FROM dbo.PU WHERE PU="+STR(nPU)

	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Forms' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Forms' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Forms")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Forms")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_Forms' )
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_Forms')
		IF RECCOUNT('tmpPSTK_Forms') > 0
			cPUlabel = PrepareSQLtxt(tmpPSTK_Forms.Label,'Label',7)
		ENDIF
		USE IN tmpPSTK_Forms
	ENDIF

	IF lNewConn
		SQLDISCONNECT(nConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cPUlabel
ENDPROC

********************************* 
PROCEDURE Get_PriceU_from_nPU 
PARAMETERS nPU
*cUnit_Of_Measure = Get_PriceU_from_nPU(nPU)
*cUnit = Proc_Quotes:Get_PUtext()
*returns  UOM 'LB,FT,PC,Lot'

IF VARTYPE(nPU)="C"
	nPU = VAL(nPU)
ENDIF
IF VARTYPE(nPU)!="N"
	nPU=0
ENDIF

PRIVATE cSQL, cPriceUnit
cPriceUnit = ''

*!*	CASE nPU = 1
*!*		cPriceUnit = 'Lb'

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

IF USED('tmpPSTK_FUOM')
	USE IN tmpPSTK_FUOM
ENDIF
SELECT 0

IF nConn > 0

	cSQL = "SELECT [UOM] FROM dbo.PU WHERE PU="+STR(nPU)
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_FUOM' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_FUOM' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_FUOM")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_FUOM")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_FUOM' )
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_FUOM')
		IF RECCOUNT('tmpPSTK_FUOM') > 0
			cPriceUnit = PrepareSQLtxt(tmpPSTK_FUOM.UOM,'UOM',4)
		ENDIF
		USE IN tmpPSTK_FUOM
	ENDIF

	IF lNewConn
		SQLDISCONNECT(nConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cPriceUnit
ENDPROC

********************************* 
PROCEDURE Get_nPU_from_cUnit
PARAMETERS cUnit
*nPU = Get_nPU_from_cUnit(cUnit)

IF VARTYPE(cUnit)<>"C"
	RETURN 0
ENDIF

PRIVATE nPU
nPU = 0

*!*	CASE UPPER(cUnit) = "LB"
*!*		nPU = 1

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

IF USED('tmpPSTK_FUOM')
	USE IN tmpPSTK_FUOM
ENDIF
SELECT 0

IF nConn > 0

	cSQL = "SELECT TOP 1 [PU] FROM dbo.PU WHERE UOM='"+cUnit+"' ORDER BY PU DESC"
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_FUOM' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_FUOM' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_FUOM")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_FUOM")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_FUOM' )
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_FUOM')
		IF RECCOUNT('tmpPSTK_FUOM') > 0
			nPU = PrepareSQLnum(tmpPSTK_FUOM.PU,'PU',-1)
		ENDIF
		USE IN tmpPSTK_FUOM
	ENDIF

	IF lNewConn
		SQLDISCONNECT(nConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF


RETURN nPU
ENDPROC

********************************* 

PROCEDURE get_Max_P_fromPU 
PARAMETERS nPU, pConnHandle
*nMax_P = get_Max_P_fromPU (nPU, pConnHandle)

IF VARTYPE(nPU)="C"
	nPU = VAL(nPU)
ENDIF
IF VARTYPE(nPU)!="N"
	nPU=0
ENDIF

PRIVATE cSQL, nMax_P
nMax_P = 999999999


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

IF USED('tmpPSTK_Forms')
	USE IN tmpPSTK_Forms
ENDIF
SELECT 0

IF nConn > 0
	cSQL = "SELECT [Max_P] FROM dbo.PU "
	cSQL = cSQL + " WHERE PU="+STR(nPU)

	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Forms' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Forms' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Forms")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Forms")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_Forms' )
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_Forms')
		IF RECCOUNT('tmpPSTK_Forms') > 0
			nMax_P = PrepareSQLnum(tmpPSTK_Forms.Max_P,'Max_P',-5)
		ENDIF
		USE IN tmpPSTK_Forms
	ENDIF

	IF lNewConn
		SQLDISCONNECT(nConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nMax_P 
ENDPROC

*********************************
PROC get_TBL 
PARAMETER cTBL
*cTableName = get_TBL(cTBL)
*Returns TBL initial

IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF

IF LEN(cTBL) > 1
	cTBL = TBL_TableName(cTBL)
ELSE
	cTBL = UPPER(cTBL)
ENDIF

DO CASE
CASE cTBL ="S"
	*cTableName = "StockLst"
CASE cTBL ="B"
	*cTableName = "BrokerLst"
CASE cTBL="W"
	*cTableName = "WIPLst"
CASE cTBL ="N"
	*cTableName = "N/A"	
OTHERWISE
	cTBL = ""
	WAIT WINDOW "The Stock Table initial is blank"+CHR(13)+"This was not expected." TIMEOUT 2
ENDCASE

RETURN cTBL

*********************************
PROC TableName_TBL 
PARAMETER cTBL
*cTableName = TableName_TBL(cTBL)
*Returns TableName from TBL initial

IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF

PRIVATE cTableName 
cTableName = ''

DO CASE
CASE UPPER(cTBL) ="S"
	cTableName = "StockLst"
CASE UPPER(cTBL) ="B"
	cTableName = "BrokerLst"
CASE UPPER(cTBL)="W"
	cTableName = "WIPLst"
CASE UPPER(cTBL) ="N"
	cTableName = "N/A"	
CASE UPPER(cTBL)="STOCKLST"
	cTableName = "StockLst"
CASE UPPER(cTBL)="BROKERLST"
	cTableName = "BrokerLst"
CASE UPPER(cTBL)="WIPLST"
	cTableName = "WIPLst"
OTHERWISE
	TrackError("bad TableName_TBL","TBL Not Found '"+cTableName+"'","Proc_StockLst:TableName_TBL()",LINENO())
ENDCASE


RETURN cTableName 
ENDPROC

*********************************
PROC TBL_TableName 
PARAMETER pTableName
*cTBL = TBL_TableName("StockLst")

IF VARTYPE(pTableName) != "C"
	TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF

PRIVATE cTBL
cTBL = ''

DO CASE
CASE UPPER(pTableName) = "STOCKLST"
	cTBL="S"
CASE UPPER(pTableName) = "STOCK"
	cTBL="S"
CASE UPPER(pTableName) = "BROKERLST"
	cTBL="B"
CASE UPPER(pTableName) = "BROKER"
	cTBL="B"
CASE UPPER(pTableName) = "WIPLST"
	cTBL="W"
CASE UPPER(pTableName) = "WIP"
	cTBL="W"
CASE UPPER(pTableName) = "S"
	cTBL="S"
CASE UPPER(pTableName) = "B"
	cTBL="B"
CASE UPPER(pTableName) = "W"
	cTBL="W"
OTHERWISE
	TrackError("bad TBL_TableName","TableName Not Found '"+cTableName+"'","Proc_StockLst:TBL_TableName()",LINENO())
ENDCASE


RETURN cTBL 
ENDPROC

*********************************  
PROCEDURE get_TBLwithID_ID_Detail  
PARAMETERS pID, pID_Detail, pConnHandle, pWhat
*cTBL = get_TBLwithID_ID_Detail(ID,ID_Detail, pConnHandle)
*returns Table Init

PRIVATE nID, nID_Detail
IF VARTYPE(pID)!="N"
	TrackError("Bad Parameter nID","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ELSE
	nID = pID
ENDIF
IF VARTYPE(pID_Detail)!="N"
	TrackError("Bad Parameter nID_Detail","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ELSE
	nID_Detail = pID_Detail
ENDIF
PRIVATE cWhat
cWhat = PrepareSQLtxt(pWhat,'What',50)

PRIVATE cTBL 
cTBL = ''
PRIVATE cSQL, nSQLEXEC 

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

IF USED('tmpPSTK_SP')
	USE IN tmpPSTK_SP
ENDIF
SELECT 0

IF nConn > 0
	cSQL = "SELECT 'S' AS TBL FROM dbo.StockLst_Detail "
	cSQL = cSQL + " WHERE ID = "+STR(nID)+" AND ID_Detail ="+STR(nID_Detail)
	cSQL = cSQL + " UNION "
	cSQL = cSQL + " SELECT 'B' AS TBL FROM dbo.BrokerLst_Detail "
	cSQL = cSQL + " WHERE ID = "+STR(nID)+" AND ID_Detail ="+STR(nID_Detail)
	cSQL = cSQL + " UNION "
	cSQL = cSQL + " SELECT 'W' AS TBL FROM dbo.WIPLst_Detail "
	cSQL = cSQL + " WHERE ID = "+STR(nID)+" AND ID_Detail ="+STR(nID_Detail)
	
	IF CWhat = "NOCHECKHISTORY"
	
	ELSE
		*history	
		cSQL = cSQL + " UNION "
		cSQL = cSQL + " SELECT TOP 1 'SH' AS TBL FROM HPAlloy_Archive.dbo.StockLst_Detail_History "
		cSQL = cSQL + " WHERE ID = "+STR(nID)+" AND ID_Detail ="+STR(nID_Detail)+" AND [What] = 'DELETE'"
		cSQL = cSQL + " UNION "
		cSQL = cSQL + " SELECT TOP 1 'BH' AS TBL FROM HPAlloy_Archive.dbo.BrokerLst_Detail_History "
		cSQL = cSQL + " WHERE ID = "+STR(nID)+" AND ID_Detail ="+STR(nID_Detail)+" AND [What] = 'DELETE'"
		cSQL = cSQL + " UNION "
		cSQL = cSQL + " SELECT TOP 1 'WH' AS TBL FROM HPAlloy_Archive.dbo.WIPLst_Detail_History "
		cSQL = cSQL + " WHERE ID = "+STR(nID)+" AND ID_Detail ="+STR(nID_Detail)+" AND [What] = 'DELETE'"
		
	ENDIF
			
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_SP' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_SP' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_SP")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_SP")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_SP' )
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_SP')
		IF RECCOUNT('tmpPSTK_SP') > 0
			cTBL = tmpPSTK_SP.TBL
			LOCATE FOR LEN(tmpPSTK_SP.TBL) > 1
			IF FOUND('tmpPSTK_SP')
				cTBL = tmpPSTK_SP.TBL
			ENDIF
		ENDIF
		USE IN tmpPSTK_SP
	ENDIF
	

	****************
	IF lNewConn
		SQLDISCONNECT(nConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF


IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN UPPER(cTBL)
ENDPROC

*********************************  

PROCEDURE isForStock
PARAMETERS cString
*Returns T/F if a type of Stock
*lStockLst = isForStock(cStock)

PRIVATE lForStock
lForStock = .F.

IF VARTYPE(cString)!="C"
	TrackError("Need cString for isForStock() ","No Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN 
ENDIF

IF UPPER(ALLTRIM(cString)) $ "ALL FOR STOCK,MOSTLY STOCK,SOME STOCK,CUSTOM STOCK"
	lForStock = .T.
ENDIF

RETURN lForStock
ENDPROC

*********************************  
PROCEDURE getStock_P_ID_Detail_Process 
PARAMETERS nID_Detail_Process, pConnHandle
*Price = getStock_P-ID_Detail_Process(ID_Detail_Process, pConnHandle)
*returns Price

IF VARTYPE(nID_Detail_Process)!="N"
	TrackError("Bad Parameter nID_Detail_Process","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

PRIVATE cSQL, cPriceUnit,nID_Detail, nS_P
cPriceUnit = ''
nID_Detail = 0
nS_P = 0


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

IF USED('tmpPSTK_SP')
	USE IN tmpPSTK_SP
ENDIF
SELECT 0

IF nConn > 0
	cSQL = "SELECT ID_Detail FROM dbo.StockLst_Process "
	cSQL = cSQL + " WHERE ID_Detail_Process ="+STR(nID_Detail_Process)
*DO CASE
*CASE cTBL = "S"
*cSQL = cSQL + " dbo.StockLst_Process "
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_SP' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_SP' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_SP")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_SP")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_SP' )
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_SP')
		IF VARTYPE(tmpPSTK_SP.ID_Detail ) = 'N'
			nID_Detail = tmpPSTK_SP.ID_Detail 
		ENDIF
		USE IN tmpPSTK_SP
	ENDIF
	
	****************
	IF nID_Detail > 0
	
		cSQL = "SELECT S_P FROM dbo.StockLst_Detail "
		cSQL = cSQL + " WHERE ID_Detail ="+STR(nID_Detail)
*DO CASE
*CASE cTBL = "S"
*cSQL = cSQL + " dbo.StockLst_Process "
		
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_SP' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_SP' )
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_SP")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_SP")
				
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_SP' )
				RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
			ENDIF
		ENDIF
		
		IF USED('tmpPSTK_SP')
			IF VARTYPE(tmpPSTK_SP.S_P) = 'N'
				nS_P = tmpPSTK_SP.S_P
			ENDIF
			IF VARTYPE(tmpPSTK_SP.S_P) = 'Y'
				nS_P = tmpPSTK_SP.S_P
			ENDIF
			USE IN tmpPSTK_SP
		ENDIF
	ENDIF
	
	****************
	IF lNewConn
		SQLDISCONNECT(nConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF




IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nS_P
ENDPROC

*********************************  
PROCEDURE getStockTotal_SOitem
PARAMETERS cSOitem, pConnHandle
*Price = getStockTotal_SOitem(cSOitem, pConnHandle)
*returns StockPrice

IF VARTYPE(cSOitem)!="C"
	TrackError("Bad Parameter cSOitem","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

IF cSOitem = Proper_SO_Item("")
	TrackError("Bad Parameter cSOitem","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

PRIVATE cSQL, cPriceUnit, nStockTotal
cPriceUnit = ''
nStockTotal = 0


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

IF USED('tmpPSTK_SDP')
	USE IN tmpPSTK_SDP
ENDIF
SELECT 0

IF nConn > 0
*PU,QTY,Orered_QTY,Pounds,Prc_Q_QTY, Prc_Q_PU
	cSQL = "SELECT SUM(SP.QTY * SD.S_P ) AS StkCost "
	cSQL = cSQL + " FROM dbo.StockLst_Detail SD "
	cSQL = cSQL + " INNER JOIN dbo.StockLst_Process SP ON SP.ID_Detail = SD.ID_Detail "
	cSQL = cSQL + " WHERE SP.SOitem = dbo.f_ProperSOitem('"+cSOitem+"')"

	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_SDP' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_SDP' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_SDP")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_SDP")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_SDP' )
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_SDP')
		IF VARTYPE(tmpPSTK_SDP.StkCost) = "N" OR VARTYPE(tmpPSTK_SDP.StkCost) = "Y"
			nStockTotal = tmpPSTK_SDP.StkCost 
		ENDIF
		USE IN tmpPSTK_SDP
	ENDIF
	

	IF lNewConn
		SQLDISCONNECT(nConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF


IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nStockTotal
ENDPROC

*********************************  
PROCEDURE getSpecificStock_Order
PARAMETERS pWO, pSOitem, pConnHandle
*cReturnText = getSpecificStock_Order(nWO cSOitem, pConnHandle)
*RETURNS p.AllowSub, p.QTY, Prc_PCs, DescriptCL, D.[Weight], D.[Location],D.FloorStatus,D.Class,D.S_Qty 
* M.Heat,M.Lot,M.Specs,M.Cond,M.ID,M.Alloy,M.Form,M.CC, M.CL "

PRIVATE nWO
IF VARTYPE(pWO)!="N"
	TrackError("Bad Parameter WO","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ELSE
	nWO = PrepareSQLnum(pWO,'WO',-3)
ENDIF

PRIVATE cSOitem
IF VarType(pSOitem) != "C"
	TrackError("Bad Parameter cSOitem","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ELSE
	cSOitem = PrepareSQLtxt(pSOitem,'SOitem',10)
ENDIF


PRIVATE cSQL, cStockStr
cStockStr = ''

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

IF USED('tmpPSTK_SDP')
	USE IN tmpPSTK_SDP
ENDIF
SELECT 0

IF nConn > 0
	cSQL = "SELECT p.AllowSub, ISNULL(p.QTY,0) AS QTY  "
	*--,dbo.f_ItemDescription(P.Prc_Form,D.Dim1,P.Prc_Dim2,P.Prc_Dim3,P.QTY,0) AS ItemDescription "
	cSQL = cSQL + ",ISNULL(P.Prc_PCs,0) AS Prc_PCs "
	cSQL = cSQL + ",TRIM(dbo.f_DescriptCL(M.Alloy,M.CC,M.CL,P.Prc_Form,D.Dim1,P.Prc_Dim2,P.Prc_Dim3,P.QTY,0)) AS DescriptCL "
	*PU,QTY,Orered_QTY,Pounds,Prc_Q_QTY, Prc_Q_PU
	cSQL = cSQL + ",D.[Weight], D.[Location],D.FloorStatus,D.Class,D.S_Qty "
	cSQL = cSQL + ",M.Heat,M.Lot,M.Specs,M.Cond,M.ID,M.Alloy,M.Form,M.CC, M.CL "
	cSQL = cSQL + ",ISNULL(P.WO,0) AS WO, ISNULL(P.SOitem,'') AS SOitem, D.ID_Detail "
	cSQL = cSQL + " FROM dbo.StockLst_Process P "
	cSQL = cSQL + " inner join dbo.StockLst_Detail D ON P.ID_Detail = D.ID_Detail "
	cSQL = cSQL + " inner join dbo.StockLst_Master M ON D.ID = M.ID "
	IF nWO > 0
		cSQL = cSQL + " WHERE ( P.WO="+STR(nWO)
		IF Proper_SO_Item(cSOitem) != Proper_SO_Item("")
			cSQL = cSQL + " OR P.SOitem = dbo.f_ProperSOitem('"+cSOitem+"')" +")"
		ELSE
			cSQL = cSQL + " ) "
		ENDIF
	ELSE
		cSQL = cSQL + " WHERE P.SOitem = dbo.f_ProperSOitem('"+cSOitem+"')"
	ENDIF
*	cSQL = cSQL + " AND P.Process_ID = 'SELECTED'"
	cSQL = cSQL + " AND ( P.Process_ID = 'SELECTED' OR P.Process_ID='PARTSELECT' ) "


	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_SDP' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_SDP' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_SDP")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_SDP")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_SDP' )
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_SDP')
		IF RECCOUNT('tmpPSTK_SDP') > 0
			SCAN
				IF RECNO('tmpPSTK_SDP') > 1
					cStockStr = cStockStr + CHR(13)
				ENDIF
				
				IF UPPER(PrepareSQLtxt(tmpPSTK_SDP.AllowSub,'AllowSub',1)) = "Y"
					cStockStr = "Allow Sub."
				ELSE
					cStockStr = "Do Not Sub."
				ENDIF
				*cStockStr = cStockStr + "QTY "+ALLTRIM( STR(PrepareSQLnum(tmpPSTK_SDP.QTY,'QTY',-3),10,0) )
				cStockStr = cStockStr + " for "+ALLTRIM( ShowSQLtxt(tmpPSTK_SDP.QTY,'QTY',10) )
				IF PrepareSQLnum(tmpPSTK_SDP.Prc_PCs,'PCS',-3) > 0
					cStockStr = cStockStr + " PC="+ALLTRIM( ShowSQLtxt(tmpPSTK_SDP.Prc_PCs,'Prc_PCs',10) )
				ENDIF
				cStockStr = cStockStr + " "+ALLTRIM( ShowSQLtxt(tmpPSTK_SDP.DescriptCL,'DescriptCL',250) )
				
				cStockStr = cStockStr + " "+ALLTRIM( ShowSQLtxt(tmpPSTK_SDP.Weight,'Weight',10) )+"#"
				cStockStr = cStockStr + " at "+ALLTRIM( ShowSQLtxt(tmpPSTK_SDP.Location,'Location',10) )
				cStockStr = cStockStr + " "+ALLTRIM( ShowSQLtxt(tmpPSTK_SDP.S_Qty,'S_Qty',10) )+"#"
				
				cStockStr = cStockStr + " Heat "+ALLTRIM( ShowSQLtxt(tmpPSTK_SDP.Heat,'Heat',50) )
				cStockStr = cStockStr + " Lot:"+ALLTRIM( ShowSQLtxt(tmpPSTK_SDP.Lot,'Lot',10) )
				cStockStr = cStockStr + " Specs "+ALLTRIM( ShowSQLtxt(tmpPSTK_SDP.Specs,'Specs',160) )
				cStockStr = cStockStr + " Cond "+ALLTRIM( ShowSQLtxt(tmpPSTK_SDP.Cond,'Cond',50) )
				cStockStr = cStockStr + " Alloy "+ALLTRIM( ShowSQLtxt(tmpPSTK_SDP.Alloy,'Alloy',12) )
				cStockStr = cStockStr + " Form "+ALLTRIM( ShowSQLtxt(tmpPSTK_SDP.Form,'Form',2) )
				
				cStockStr = cStockStr + " "+ALLTRIM( ShowSQLtxt(tmpPSTK_SDP.CC,'CC',1) )
				cStockStr = cStockStr + ""+ALLTRIM( ShowSQLtxt(tmpPSTK_SDP.CL,'CL',1) )
				
				cStockStr = cStockStr + " "+ALLTRIM( ShowSQLtxt(tmpPSTK_SDP.FloorStatus,'FloorStatus',1) )
				cStockStr = cStockStr + ""+ALLTRIM( ShowSQLtxt(tmpPSTK_SDP.Class,'Class',1) )

				IF PrepareSQLnum(tmpPSTK_SDP.WO,'WO',-3) > 0
					cStockStr = cStockStr + " WO:"+ALLTRIM( STR( PrepareSQLnum(tmpPSTK_SDP.WO,'WO',-3) ) )
				ENDIF
				IF PrepareSQLtxt(tmpPSTK_SDP.SOitem,'SOitem',10) != Proper_SO_Item("")
					cStockStr = cStockStr + " SOitem:"+ALLTRIM( PrepareSQLtxt(tmpPSTK_SDP.SOitem,'SOitem',10) )
				ENDIF
				
				cStockStr = cStockStr + " ID_Detail:"+ALLTRIM( ShowSQLtxt(tmpPSTK_SDP.ID_Detail,'ID_Detail',10) )
			ENDSCAN			
		ENDIF
		USE IN tmpPSTK_SDP
	ENDIF
	

	IF lNewConn
		SQLDISCONNECT(nConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF


IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cStockStr
ENDPROC

*********************************  
PROCEDURE getSpecificStock_SOitem
PARAMETERS cSOitem, pConnHandle
*HeatLot = getSpecificStock_SOitem(cSOitem, pConnHandle)
*RETURNS SM.Heat,SM.Lot, SD.Location 
IF VARTYPE(cSOitem)!="C"
	TrackError("Bad Parameter cSOitem","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF

IF cSOitem = Proper_SO_Item("")
	TrackError("Bad Parameter cSOitem","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF

PRIVATE cSQL, cStockStr
cStockStr = ''

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

IF USED('tmpPSTK_SDP')
	USE IN tmpPSTK_SDP
ENDIF
SELECT 0

IF nConn > 0
	cSQL = "SELECT  " 
	cSQL = cSQL + " SM.Heat"
	cSQL = cSQL + ",SM.Lot"
	cSQL = cSQL + ",SD.[Location] "
	cSQL = cSQL + ",SD.ID_Detail "
	cSQL = cSQL + " FROM dbo.StockLst_Process SP "
	cSQL = cSQL + " INNER JOIN dbo.StockLst_Detail SD ON SD.ID_Detail = SP.ID_Detail "
	cSQL = cSQL + " INNER JOIN dbo.StockLst_Master SM ON SM.ID = SD.ID "
	cSQL = cSQL + " WHERE ( SP.Process_ID = 'SELECTED' OR SP.Process_ID='PARTSELECT' ) "
	cSQL = cSQL + " AND SP.SOitem = dbo.f_ProperSOitem('"+cSOitem+"')"

	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_SDP' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_SDP' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_SDP")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_SDP")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_SDP' )
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_SDP')
		IF RECCOUNT('tmpPSTK_SDP') > 0
			cStockStr = ""
			SCAN
				IF RECNO('tmpPSTK_SDP') > 1
					cStockStr = cStockStr + CHR(13)
				ENDIF
				cStockStr = cStockStr + "ID_Detail "+ALLTRIM(STR(ID_Detail))		
				cStockStr = cStockStr + " Heat "+ALLTRIM( ShowSQLtxt(tmpPSTK_SDP.Heat,'Heat', 50))
				IF LEN(ALLTRIM(tmpPSTK_SDP.Lot)) > 0
					cStockStr = cStockStr + " "+ALLTRIM( ShowSQLtxt(tmpPSTK_SDP.Lot,'Lot', 10))
				ENDIF
				IF LEN(ALLTRIM(tmpPSTK_SDP.Location)) > 0
					cStockStr = cStockStr + " Loc "+ALLTRIM( ShowSQLtxt(tmpPSTK_SDP.Location ,'Location ', 10))
				ENDIF
			ENDSCAN
		ENDIF
		USE IN tmpPSTK_SDP
	ENDIF
	

	IF lNewConn
		SQLDISCONNECT(nConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF


IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cStockStr
ENDPROC


*********************************  
PROCEDURE getSpecificStock_SOitem_WO
PARAMETERS pSOitem, pWO, pConnHandle
*HeatLot = getSpecificStock_SOitem(cSOitem, pConnHandle)
*RETURNS SM.Heat,SM.Lot, SD.Location 
IF VARTYPE(pSOitem)!="C"
	*TrackError("Bad Parameter cSOitem","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	*RETURN ''
ENDIF

PRIVATE cSOitem
cSOitem = Proper_SO_Item(pSOitem)
IF cSOitem = Proper_SO_Item("")
	*TrackError("Bad Parameter cSOitem","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	*RETURN ''
ENDIF
PRIVATE nWO
nWO = PrepareSQLnum(pWO,'WO',-3)

IF cSOitem = Proper_SO_Item("") AND nWO = 0
	RETURN ''
ENDIF

PRIVATE cSQL, cStockStr
cStockStr = ''

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

IF USED('tmpPSTK_SDP')
	USE IN tmpPSTK_SDP
ENDIF
SELECT 0

IF nConn > 0
	cSQL = "SELECT  " 
	cSQL = cSQL + " SM.Heat"
	cSQL = cSQL + ",SM.Lot"
	cSQL = cSQL + ",SD.[Location] "
	cSQL = cSQL + ",SD.ID_Detail "
	cSQL = cSQL + ",SP.AllowSub "
	cSQL = cSQL + " FROM dbo.StockLst_Process SP "
	cSQL = cSQL + " INNER JOIN dbo.StockLst_Detail SD ON SD.ID_Detail = SP.ID_Detail "
	cSQL = cSQL + " INNER JOIN dbo.StockLst_Master SM ON SM.ID = SD.ID "
	cSQL = cSQL + " WHERE ( SP.Process_ID = 'SELECTED' OR SP.Process_ID='PARTSELECT' ) "
	IF cSOitem != Proper_SO_Item("") 
		cSQL = cSQL + " AND ( SP.SOitem = dbo.f_ProperSOitem('"+cSOitem+"')"
		IF nWO > 0
			cSQL = cSQL + " OR SP.WO = "+STR(nWO)
		ENDIF
	ELSE
		cSQL = cSQL + " AND ( SP.WO = "+STR(nWO)
	ENDIF
	cSQL = cSQL + " ) "
*DO CASE
*CASE cTBL = "S"
*cSQL = cSQL + " dbo.StockLst_Process "	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_SDP' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_SDP' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_SDP")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_SDP")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_SDP' )
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_SDP')
		IF RECCOUNT('tmpPSTK_SDP') > 0
			cStockStr = ""
			SCAN
				IF RECNO('tmpPSTK_SDP') > 1
					cStockStr = cStockStr + CHR(13)
				ENDIF
				IF PrepareSQLtxt(tmpPSTK_SDP.AllowSub,'AllowSub',1) = "Y"
					cStockStr = cStockStr + "Possibly stock: "
				ELSE
					cStockStr = cStockStr + "Use this ONLY: "
				ENDIF
				cStockStr = cStockStr + "stkID_Detail "+ALLTRIM(STR(tmpPSTK_SDP.ID_Detail))		
				cStockStr = cStockStr + " Heat "+ALLTRIM( ShowSQLtxt(tmpPSTK_SDP.Heat,'Heat', 50))
				
				IF LEN(ALLTRIM(tmpPSTK_SDP.Lot)) > 0
					cStockStr = cStockStr + " "+ALLTRIM( ShowSQLtxt(tmpPSTK_SDP.Lot,'Lot', 10))
				ENDIF
				IF LEN(ALLTRIM(tmpPSTK_SDP.Location)) > 0
					cStockStr = cStockStr + " Loc "+ALLTRIM( ShowSQLtxt(tmpPSTK_SDP.Location ,'Location ', 10))
				ENDIF

			ENDSCAN
		ENDIF
		USE IN tmpPSTK_SDP
	ENDIF
	

	IF lNewConn
		SQLDISCONNECT(nConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF


IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cStockStr
ENDPROC

*********************************
PROCEDURE getReceivingIDfromHeat
PARAMETERS cHeat, pConnHandle
*nReceivingID = getReceivingIDfromHeat(cHeat,ThisFormSet.nConnHandle)
*returns ReceivingID

IF VARTYPE(cHeat)!="C"
	cHeat = ''
ENDIF

IF EMPTY(cHeat)
	RETURN 0
ENDIF


PRIVATE cSQL, nReceivingID
nReceivingID = 0

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

IF USED('tmpPSTK_RecvID')
	USE IN tmpPSTK_RecvID
ENDIF
SELECT 0

IF nConn > 0
	cSQL = "SELECT R.ID FROM dbo.Receiving R "
	cSQL = cSQL + " WHERE R.Heat = '"+cHeat+"'"
	cSQL = cSQL + " AND R.stockTable = 'N'"
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_RecvID' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_RecvID' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_RecvID")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_RecvID")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_RecvID' )
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_RecvID')
		IF VARTYPE(tmpPSTK_RecvID.ID) = "N"
			nReceivingID = tmpPSTK_RecvID.ID 
			IF nReceivingID > 0
				TrackMess("Found RID!, nReceivingID is now:"+ALLTRIM(STR(nReceivingID))+" Heat = '"+cHeat+"'"+" Proc_StockLst:getReceivingIDfromHeat")
				*TrackError("nReceivingID is now:"+ALLTRIM(STR(nReceivingID)),"Found RID!","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO() )
			ENDIF
		ENDIF
		USE IN tmpPSTK_RecvID
	ENDIF
	

	IF lNewConn
		SQLDISCONNECT(nConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF


IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nReceivingID
ENDPROC


*********************************  
PROCEDURE Get_ReceivingID_from_ID_Detail 
PARAMETERS nID_Detail, cTBL, pConnHandle
*nReceivingID = Get_ReceivingID_from_ID_Detail(nID_Detail, cTBL ,ThisFormSet.nConnHandle)
*returns ReceivingID

IF VARTYPE(nID_Detail)!="N"
	RETURN 0
ENDIF
IF VARTYPE(cTBL)!="C"
	cTBL= 'S'
ENDIF


PRIVATE cSQL, nReceivingID
nReceivingID = 0

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

IF USED('tmpPSTK_RecvID_H')
	USE IN tmpPSTK_RecvID_H
ENDIF
SELECT 0

IF nConn > 0
	cSQL = "SELECT TOP 1 ReceivingID "
	cSQL = cSQL + " FROM HPAlloy_Archive.dbo.StockLst_Detail_History "
	cSQL = cSQL + " WHERE ID_Detail = "+STR(nID_Detail)
	cSQL = cSQL + " AND ReceivingID IS NOT NULL "
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_RecvID_H' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_RecvID_H' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_RecvID_H")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_RecvID_H")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_RecvID_H' )
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_RecvID_H')
		IF RECCOUNT('tmpPSTK_RecvID_H') > 0 
			nReceivingID = PrepareSQLnum(tmpPSTK_RecvID_H.ReceivingID,'RID',-3)
		ENDIF
		USE IN tmpPSTK_RecvID_H
	ENDIF
	

	IF lNewConn
		SQLDISCONNECT(nConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF


IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nReceivingID
ENDPROC

******************     

PROC Count_Lst_Detail_by_Heat
PARAMETER pTBL, pHeat, pConnHandle
*nCount = Count_Lst_Detail_by_Heat(cTBL,cHeat,nConnHandle)

PRIVATE cTBL
cTBL = UPPER(PrepareSQLtxt(pTBL,"TBL",1))
DO CASE
CASE cTBL = "S"
CASE cTBL = "B"
CASE cTBL = "W"
OTHERWISE
	MESSAGEBOX("Function: Count_Lst_Detail_by_Heat()"+CHR(13)+"No TBL Parameter!",0,"Error")
	RecordError(0,"No TBL Parameter" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),"No TBL Parameter" )
	RETURN 0
ENDCASE

PRIVATE cHeat
IF VARTYPE(pHeat)!="C"
	TrackError("Bad Parameter Heat","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
cHeat = PrepareSQLtxt(pHeat,'Heat',50)
IF LEN(cHeat) < 1
	RETURN 0
ENDIF

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
	ENDIF
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE cSQL, nSQLEXEC
IF USED('tmpPSTK_CntD_Ht')
	USE IN tmpPSTK_CntD_Ht
ENDIF

PRIVATE cAlias 
cAlias = ALIAS()

SELECT 0
cSQL = "SELECT COUNT(*) AS Cntd "
DO CASE 
CASE cTBL = "S"
	cSQL = cSQL+" FROM dbo.StockLst_Master "
CASE cTBL = "B"
	cSQL = cSQL+" FROM dbo.BrokerLst_Master "
CASE cTBL = "W"
	cSQL = cSQL+" FROM dbo.WIPLst_Master "
OTHERWISE
	TrackError("Bad Parameter","Bad cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDCASE
cSQL = cSQL + " WITH(NOLOCK) " &&could be in transaction lock
cSQL = cSQL+" WHERE Heat like '"+ALLTRIM(cHeat)+"%'"

nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_CntD_Ht' )
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn,  cSQL, 'tmpPSTK_CntD_Ht' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CntD_Ht")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CntD_Ht")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpPSTK_CntD_Ht')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ELSE 
		nSQLEXEC = 1
	ENDIF
ENDIF

*PRIVATE lTranAlreadySet, nProp, lOK 
*nProp = SQLGETPROP(nConn, 'Transactions')
*lTranAlreadySet = (nProp = 2)
*lOK = .T.
PRIVATE nCount 
nCount = 0

IF nSQLEXEC > 0
	IF USED('tmpPSTK_CntD_Ht')
		IF RECCOUNT('tmpPSTK_CntD_Ht')> 0
			nCount = PrepareSQLnum(tmpPSTK_CntD_Ht.Cntd,'Cntd',-3)
		ENDIF
		USE IN tmpPSTK_CntD_Ht
	ENDIF
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nCount 
ENDPROC

******************     

PROC Count_Lst_by_ID 
PARAMETER pTBL, pID, pConnHandle
*nCount = Count_Lst_by_ID(cTBL,nID,nConnHandle)
*used to see if ID has not been deleted

PRIVATE cTBL
cTBL = UPPER(PrepareSQLtxt(pTBL,"TBL",1))
DO CASE
CASE cTBL = "S"
CASE cTBL = "B"
CASE cTBL = "W"
OTHERWISE
	MESSAGEBOX("Function: Count_Lst_by_ID()"+CHR(13)+"No TBL Parameter!",0,"Error")
	RecordError(0,"No TBL Parameter" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),"No TBL Parameter" )
	*RecordError( 0, 'Error Title', "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"VFP message: No nSoldCode Parameter" )

	RETURN 0
ENDCASE

PRIVATE nID
IF VARTYPE(pID)!="N"
	TrackError("Bad Parameter ID","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
nID = PrepareSQLnum(pID,'Master_ID',-3)


PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
	ENDIF
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE cSQL, nSQLEXEC
IF USED('tmpPSTK_CntL_ID')
	USE IN tmpPSTK_CntL_ID
ENDIF

PRIVATE cAlias 
cAlias = ALIAS()

SELECT 0
cSQL = "SELECT COUNT(*) AS Cntd "
DO CASE 
CASE cTBL = "S"
	cSQL = cSQL+" FROM dbo.StockLst_Master "
CASE cTBL = "B"
	cSQL = cSQL+" FROM dbo.BrokerLst_Master "
CASE cTBL = "W"
	cSQL = cSQL+" FROM dbo.WIPLst_Master "
ENDCASE
cSQL = cSQL+" WITH(NOLOCK) " &&could be in transaction lock
cSQL = cSQL+" WHERE ID="+STR(nID)

nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_CntL_ID' )
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn,  cSQL, 'tmpPSTK_CntL_ID' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CntL_ID")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CntL_ID")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpPSTK_CntL_ID')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ELSE 
		nSQLEXEC = 1
	ENDIF
ENDIF

*PRIVATE lTranAlreadySet, nProp, lOK 
*nProp = SQLGETPROP(nConn, 'Transactions')
*lTranAlreadySet = (nProp = 2)
*lOK = .T.
PRIVATE nCount 
nCount = 0

IF nSQLEXEC > 0
	IF USED('tmpPSTK_CntL_ID')
		IF RECCOUNT('tmpPSTK_CntL_ID')> 0
			nCount = PrepareSQLnum(tmpPSTK_CntL_ID.Cntd,'Cntd',-3)
		ENDIF
		USE IN tmpPSTK_CntL_ID
	ENDIF
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nCount 
ENDPROC

******************     

PROC Count_Lst_by_ID_Detail_Heat 
PARAMETER pTBL, pID_Detail, pHeat, pConnHandle
*nCount = Count_Lst_by_ID_Detail_Heat(cTBL,nID_Detail,cHeat,nConnHandle)

PRIVATE cTBL
cTBL = UPPER(PrepareSQLtxt(pTBL,"TBL",1))
DO CASE
CASE cTBL = "S"
CASE cTBL = "B"
CASE cTBL = "W"
OTHERWISE
	MESSAGEBOX("Function: Count_Lst_by_ID_Detail_Heat()"+CHR(13)+"No TBL Parameter!",0,"Error")
	RecordError(0,,"No TBL Parameter" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),,"No TBL Parameter" )
	RETURN .F.
ENDCASE

PRIVATE nID_Detail
IF VARTYPE(pID_Detail)!="N"
	TrackError("Bad Parameter ID_Detail","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

nID_Detail = PrepareSQLnum(pID_Detail,'ID_Detail',-3)
IF nID_Detail < 1
	RETURN 0
ENDIF

PRIVATE cHeat
IF VARTYPE(pHeat)!="C"
	TrackError("Bad Parameter Heat","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
cHeat = PrepareSQLtxt(pHeat,'Heat',50)
IF LEN(cHeat) < 1
	RETURN 0
ENDIF

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
	ENDIF
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE cSQL, nSQLEXEC
IF USED('tmpPSTK_CntL_IDD')
	USE IN tmpPSTK_CntL_IDD
ENDIF

PRIVATE cAlias 
cAlias = ALIAS()

SELECT 0
cSQL = "SELECT COUNT(*) AS Cntd "
DO CASE 
CASE cTBL = "S"
	cSQL = cSQL+" FROM dbo.StockLst_Detail D WITH(NOLOCK) "
	cSQL = cSQL+" INNER JOIN dbo.StockLst_Master M WITH(NOLOCK) ON D.ID = M.ID "
CASE cTBL = "B"
	cSQL = cSQL+" FROM dbo.BrokerLst_Detail D WITH(NOLOCK)  "
	cSQL = cSQL+" INNER JOIN dbo.BrokerLst_Master M WITH(NOLOCK) ON D.ID = M.ID "
CASE cTBL = "W"
	cSQL = cSQL+" FROM dbo.WIPLst_Detail D WITH(NOLOCK)  "
	cSQL = cSQL+" INNER JOIN dbo.WIPLst_Master M WITH(NOLOCK) ON D.ID = M.ID "
ENDCASE

cSQL = cSQL+" WHERE D.ID_Detail = "+ STR(nID_Detail)
cSQL = cSQL+" AND M.Heat like '"+ALLTRIM(cHeat)+"%'"


nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_CntL_IDD' )
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn,  cSQL, 'tmpPSTK_CntL_IDD' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CntL_IDD")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CntL_IDD")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpPSTK_CntL_IDD')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ELSE 
		nSQLEXEC = 1
	ENDIF
ENDIF

*PRIVATE lTranAlreadySet, nProp, lOK 
*nProp = SQLGETPROP(nConn, 'Transactions')
*lTranAlreadySet = (nProp = 2)
*lOK = .T.
PRIVATE nCount 
nCount = 0

IF nSQLEXEC > 0
	IF USED('tmpPSTK_CntL_IDD')
		IF RECCOUNT('tmpPSTK_CntL_IDD')> 0
			nCount = PrepareSQLnum(tmpPSTK_CntL_IDD.Cntd,'Cntd',-3)
		ENDIF
		USE IN tmpPSTK_CntL_IDD
	ENDIF
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nCount 
ENDPROC

******************  

PROC Count_Lst_Detail_by_ID 
PARAMETER pTBL, pID, pConnHandle
*nCount = Count_Lst_Detail_by_ID(cTBL,nID,nConnHandle)

PRIVATE cTBL
cTBL = UPPER(PrepareSQLtxt(pTBL,"TBL",2))
DO CASE
CASE cTBL == "S"
CASE cTBL == "B"
CASE cTBL == "W"
CASE cTBL == "SH"
CASE cTBL == "BH"
CASE cTBL == "WH"
OTHERWISE
	MESSAGEBOX("Function: Count_Lst_Detail_by_ID()"+CHR(13)+"No TBL Parameter!",0,"Error")
	RecordError(0,,"No TBL Parameter" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),,"No TBL Parameter" )
	RETURN .F.
ENDCASE

PRIVATE nID
IF VARTYPE(pID)!="N"
	TrackError("Bad Parameter ID","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF

nID = PrepareSQLnum(pID,'ID',-3)
IF nID < 1
	RETURN 0
ENDIF

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
	ENDIF
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE cSQL, nSQLEXEC
IF USED('tmpPSTK_CntDtbyID')
	USE IN tmpPSTK_CntDtbyID
ENDIF

PRIVATE cAlias 
cAlias = ALIAS()

SELECT 0
cSQL = "SELECT COUNT(*) AS Cntd "
DO CASE 
CASE cTBL == "S"
	cSQL = cSQL+" FROM dbo.StockLst_Detail "
	cSQL = cSQL+" WITH(NOLOCK) " &&could be in transaction lock
	cSQL = cSQL+" WHERE ID = "+ STR(nID)

CASE cTBL == "B"
	cSQL = cSQL+" FROM dbo.BrokerLst_Detail "
	cSQL = cSQL+" WITH(NOLOCK) " &&could be in transaction lock
	cSQL = cSQL+" WHERE ID = "+ STR(nID)

CASE cTBL == "W"
	cSQL = cSQL+" FROM dbo.WIPLst_Detail "
	cSQL = cSQL+" WITH(NOLOCK) " &&could be in transaction lock
	cSQL = cSQL+" WHERE ID = "+ STR(nID)

CASE cTBL == "SH"
	cSQL = cSQL+" FROM HPAlloy_Archive.dbo.StockLst_Detail_History "
	cSQL = cSQL+" WITH(NOLOCK) " &&could be in transaction lock
	cSQL = cSQL+" WHERE ID = "+ STR(nID)
	cSQL = cSQL+" AND [What]='DELETE'"
CASE cTBL == "BH"
	cSQL = cSQL+" FROM HPAlloy_Archive.dbo.BrokerLst_Detail_History "
	cSQL = cSQL+" WITH(NOLOCK) " &&could be in transaction lock
	cSQL = cSQL+" WHERE ID = "+ STR(nID)
	cSQL = cSQL+" AND [What]='DELETE'"
CASE cTBL == "WH"
	cSQL = cSQL+" FROM HPAlloy_Archive.dbo.WIPLst_Detail_History "
	cSQL = cSQL+" WITH(NOLOCK) " &&could be in transaction lock
	cSQL = cSQL+" WHERE ID = "+ STR(nID)
	cSQL = cSQL+" AND [What]='DELETE'"
ENDCASE


nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_CntDtbyID' )
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn,  cSQL, 'tmpPSTK_CntDtbyID' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CntDtbyID")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CntDtbyID")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpPSTK_CntDtbyID')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ELSE 
		nSQLEXEC = 1
	ENDIF
ENDIF

*PRIVATE lTranAlreadySet, nProp, lOK 
*nProp = SQLGETPROP(nConn, 'Transactions')
*lTranAlreadySet = (nProp = 2)
*lOK = .T.
PRIVATE nCount 
nCount = 0

IF nSQLEXEC > 0
	IF USED('tmpPSTK_CntDtbyID')
		IF RECCOUNT('tmpPSTK_CntDtbyID')> 0
			nCount = PrepareSQLnum(tmpPSTK_CntDtbyID.Cntd,'Cntd',-3)
		ENDIF
		USE IN tmpPSTK_CntDtbyID
	ENDIF
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nCount 
ENDPROC

******************  

PROC Count_Lst_Detail_by_ID_Detail 
PARAMETER pTBL, pID_Detail, pConnHandle
*nCount = Count_Lst_Detail_by_ID_Detail(cTBL,nID_Detail,nConnHandle)

PRIVATE cTBL
cTBL = UPPER(PrepareSQLtxt(pTBL,"TBL",2))
DO CASE
CASE cTBL == "S"
CASE cTBL == "B"
CASE cTBL == "W"
CASE cTBL == "SH"
CASE cTBL == "BH"
CASE cTBL == "WH"
OTHERWISE
	MESSAGEBOX("Function: Count_Lst_Detail_by_ID_Detail()"+CHR(13)+"No TBL Parameter!",0,"Error")
	RecordError(0,,"No TBL Parameter" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),,"No TBL Parameter" )
	RETURN 0
ENDCASE

PRIVATE nID_Detail
IF VARTYPE(pID_Detail)!="N"
	TrackError("Bad Parameter ID_Detail","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

nID_Detail = PrepareSQLnum(pID_Detail,'ID_Detail',-3)
IF nID_Detail < 1
	RETURN 0
ENDIF

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
	ENDIF
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE cSQL, nSQLEXEC
IF USED('tmpPSTK_CntDetails1')
	USE IN tmpPSTK_CntDetails1
ENDIF

PRIVATE cAlias 
cAlias = ALIAS()

SELECT 0
cSQL = "SELECT COUNT(*) AS Cntd "
DO CASE 
CASE cTBL == "S"
	cSQL = cSQL+" FROM dbo.StockLst_Detail "
	cSQL = cSQL+" WITH(NOLOCK) " &&could be in transaction lock
	cSQL = cSQL+" WHERE ID_Detail = "+ STR(nID_Detail)

CASE cTBL == "B"
	cSQL = cSQL+" FROM dbo.BrokerLst_Detail "
	cSQL = cSQL+" WITH(NOLOCK) " &&could be in transaction lock
	cSQL = cSQL+" WHERE ID_Detail = "+ STR(nID_Detail)

CASE cTBL == "W"
	cSQL = cSQL+" FROM dbo.WIPLst_Detail "
	cSQL = cSQL+" WITH(NOLOCK) " &&could be in transaction lock
	cSQL = cSQL+" WHERE ID_Detail = "+ STR(nID_Detail)

CASE cTBL == "SH"
	cSQL = cSQL+" FROM HPAlloy_Archive.dbo.StockLst_Detail_History "
	cSQL = cSQL+" WITH(NOLOCK) " &&could be in transaction lock
	cSQL = cSQL+" WHERE ID_Detail = "+ STR(nID_Detail)
	cSQL = cSQL+" AND [What]='DELETE'"
CASE cTBL == "BH"
	cSQL = cSQL+" FROM HPAlloy_Archive.dbo.BrokerLst_Detail_History "
	cSQL = cSQL+" WITH(NOLOCK) " &&could be in transaction lock
	cSQL = cSQL+" WHERE ID_Detail = "+ STR(nID_Detail)
	cSQL = cSQL+" AND [What]='DELETE'"
CASE cTBL == "WH"
	cSQL = cSQL+" FROM HPAlloy_Archive.dbo.WIPLst_Detail_History "
	cSQL = cSQL+" WITH(NOLOCK) " &&could be in transaction lock
	cSQL = cSQL+" WHERE ID_Detail = "+ STR(nID_Detail)
	cSQL = cSQL+" AND [What]='DELETE'"
ENDCASE


nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_CntDetails1' )
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn,  cSQL, 'tmpPSTK_CntDetails1' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CntDetails1")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CntDetails1")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpPSTK_CntDetails1')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ELSE 
		nSQLEXEC = 1
	ENDIF
ENDIF

*PRIVATE lTranAlreadySet, nProp, lOK 
*nProp = SQLGETPROP(nConn, 'Transactions')
*lTranAlreadySet = (nProp = 2)
*lOK = .T.
PRIVATE nCount 
nCount = 0

IF nSQLEXEC > 0
	IF USED('tmpPSTK_CntDetails1')
		IF RECCOUNT('tmpPSTK_CntDetails1')> 0
			nCount = PrepareSQLnum(tmpPSTK_CntDetails1.Cntd,'Cntd',-3)
		ENDIF
		USE IN tmpPSTK_CntDetails1
	ENDIF
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nCount 
ENDPROC

******************  

PROC Count_Lst_DetailS_by_ID_Detail 
PARAMETER pTBL, pID_Detail, pConnHandle
*nCount_DetailS = Count_Lst_DetailS_by_ID_Detail(cTBL,nID_Detail,nConnHandle)

PRIVATE cTBL
cTBL = UPPER(PrepareSQLtxt(pTBL,"TBL",2))
DO CASE
CASE cTBL == "S"
CASE cTBL == "B"
CASE cTBL == "W"
OTHERWISE
	MESSAGEBOX("Function: Count_Lst_DetailS_by_ID_Detail()"+CHR(13)+"No TBL Parameter!",0,"Error")
	RecordError(0,,"No TBL Parameter" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),,"No TBL Parameter" )
	RETURN .F.
ENDCASE

PRIVATE nID_Detail
IF VARTYPE(pID_Detail)!="N"
	TrackError("Bad Parameter ID_Detail","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF

nID_Detail = PrepareSQLnum(pID_Detail,'ID_Detail',-3)
IF nID_Detail < 1
	RETURN 0
ENDIF

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
	ENDIF
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE cSQL, nSQLEXEC
IF USED('tmpPSTK_CntDetbyID2')
	USE IN tmpPSTK_CntDetbyID2
ENDIF

PRIVATE cAlias 
cAlias = ALIAS()

SELECT 0
cSQL = "SELECT COUNT(*) AS Cntd "
DO CASE 
CASE cTBL == "S"
	cSQL = cSQL+" FROM dbo.StockLst_Master SM WITH(NOLOCK) "
	cSQL = cSQL+" inner join dbo.StockLst_Detail SD WITH(NOLOCK) ON SM.ID = SD.ID "
	cSQL = cSQL+" WHERE SM.ID = ( "
	cSQL = cSQL+" SELECT SD.ID FROM dbo.StockLst_Detail SD  WITH(NOLOCK) "
	cSQL = cSQL+" WHERE ID_Detail = "+ STR(nID_Detail)+")"

CASE cTBL == "B"
	cSQL = cSQL+" FROM dbo.BrokerLst_Master SM WITH(NOLOCK) "
	cSQL = cSQL+" inner join dbo.BrokerkLst_Detail SD WITH(NOLOCK) ON SM.ID = SD.ID "
	cSQL = cSQL+" WHERE SM.ID = ( "
	cSQL = cSQL+" SELECT SD.ID FROM dbo.BrokerLst_Detail SD  WITH(NOLOCK) "
	cSQL = cSQL+" WHERE ID_Detail = "+ STR(nID_Detail)+")"

CASE cTBL == "W"
	cSQL = cSQL+" FROM dbo.WIPLst_Master SM WITH(NOLOCK) "
	cSQL = cSQL+" inner join dbo.WIPLst_Detail SD WITH(NOLOCK) ON SM.ID = SD.ID "
	cSQL = cSQL+" WHERE SM.ID = ( "
	cSQL = cSQL+" SELECT SD.ID FROM dbo.WIPLst_Detail SD  WITH(NOLOCK) "
	cSQL = cSQL+" WHERE ID_Detail = "+ STR(nID_Detail)+")"

ENDCASE

nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_CntDetbyID2' )
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn,  cSQL, 'tmpPSTK_CntDetbyID2' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CntDetbyID2")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CntDetbyID2")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpPSTK_CntDetbyID2')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ELSE 
		nSQLEXEC = 1
	ENDIF
ENDIF

*PRIVATE lTranAlreadySet, nProp, lOK 
*nProp = SQLGETPROP(nConn, 'Transactions')
*lTranAlreadySet = (nProp = 2)
*lOK = .T.
PRIVATE nCount 
nCount = 0

IF nSQLEXEC > 0
	IF USED('tmpPSTK_CntDetbyID2')
		IF RECCOUNT('tmpPSTK_CntDetbyID2')> 0
			nCount = PrepareSQLnum(tmpPSTK_CntDetbyID2.Cntd,'Cntd',-3)
		ENDIF
		USE IN tmpPSTK_CntDetbyID2
	ENDIF
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nCount 
ENDPROC

******************  


PROC Count_Lst_Process_by_ID_Detail 
PARAMETER pTBL, pID_Detail, pConnHandle
*nCount = Count_Lst_Process_by_ID_Detail(cTBL,nID_Detail,nConnHandle)

PRIVATE cTBL
cTBL = UPPER(PrepareSQLtxt(pTBL,"TBL",2))
DO CASE
CASE cTBL == "S"
CASE cTBL == "B"
CASE cTBL == "W"
CASE cTBL == "SH"
CASE cTBL == "BH"
CASE cTBL == "WH"
OTHERWISE
	MESSAGEBOX("Function: Count_Lst_Process_by_ID_Detail()"+CHR(13)+"No TBL Parameter!",0,"Error")
	RecordError(0,,"No TBL Parameter" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),,"No TBL Parameter" )
	RETURN .F.
ENDCASE

PRIVATE nID_Detail
IF VARTYPE(pID_Detail)!="N"
	TrackError("Bad Parameter ID_Detail","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF

nID_Detail = PrepareSQLnum(pID_Detail,'ID_Detail',-3)
IF nID_Detail < 1
	RETURN 0
ENDIF

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
	ENDIF
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE cSQL, nSQLEXEC
IF USED('tmpPSTK_CntDetails1')
	USE IN tmpPSTK_CntDetails1
ENDIF

PRIVATE cAlias 
cAlias = ALIAS()

SELECT 0
cSQL = "SELECT COUNT(*) AS Cntd "
DO CASE 
CASE cTBL == "S"
	cSQL = cSQL+" FROM dbo.StockLst_Process "
	cSQL = cSQL+" WITH(NOLOCK) " &&could be in transaction lock
	cSQL = cSQL+" WHERE ID_Detail = "+ STR(nID_Detail)

CASE cTBL == "B"
	cSQL = cSQL+" FROM dbo.BrokerLst_Process "
	cSQL = cSQL+" WITH(NOLOCK) " &&could be in transaction lock
	cSQL = cSQL+" WHERE ID_Detail = "+ STR(nID_Detail)

CASE cTBL == "W"
	cSQL = cSQL+" FROM dbo.WIPLst_Process "
	cSQL = cSQL+" WITH(NOLOCK) " &&could be in transaction lock
	cSQL = cSQL+" WHERE ID_Detail = "+ STR(nID_Detail)

CASE cTBL == "SH"
	cSQL = cSQL+" FROM HPAlloy_Archive.dbo.StockLst_Process_History "
	cSQL = cSQL+" WITH(NOLOCK) " &&could be in transaction lock
	cSQL = cSQL+" WHERE ID_Detail = "+ STR(nID_Detail)
	cSQL = cSQL+" AND [What]='DELETE'"
CASE cTBL == "BH"
	cSQL = cSQL+" FROM HPAlloy_Archive.dbo.BrokerLst_Process_History "
	cSQL = cSQL+" WITH(NOLOCK) " &&could be in transaction lock
	cSQL = cSQL+" WHERE ID_Detail = "+ STR(nID_Detail)
	cSQL = cSQL+" AND [What]='DELETE'"
CASE cTBL == "WH"
	cSQL = cSQL+" FROM HPAlloy_Archive.dbo.WIPLst_Process_History "
	cSQL = cSQL+" WITH(NOLOCK) " &&could be in transaction lock
	cSQL = cSQL+" WHERE ID_Detail = "+ STR(nID_Detail)
	cSQL = cSQL+" AND [What]='DELETE'"
ENDCASE


nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_CntDetails1' )
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn,  cSQL, 'tmpPSTK_CntDetails1' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CntDetails1")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CntDetails1")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpPSTK_CntDetails1')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ELSE 
		nSQLEXEC = 1
	ENDIF
ENDIF

*PRIVATE lTranAlreadySet, nProp, lOK 
*nProp = SQLGETPROP(nConn, 'Transactions')
*lTranAlreadySet = (nProp = 2)
*lOK = .T.
PRIVATE nCount 
nCount = 0

IF nSQLEXEC > 0
	IF USED('tmpPSTK_CntDetails1')
		IF RECCOUNT('tmpPSTK_CntDetails1')> 0
			nCount = PrepareSQLnum(tmpPSTK_CntDetails1.Cntd,'Cntd',-3)
		ENDIF
		USE IN tmpPSTK_CntDetails1
	ENDIF
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nCount 
ENDPROC

******************  

PROC Remove_Lst_Detail_by_ID 
PARAMETER pTBL, pID, pConnHandle
*Remove_Lst_Detail_by_ID(cTBL,nID,nConnHandle)


PRIVATE cTBL
cTBL = UPPER(PrepareSQLtxt(pTBL,"TBL",1))
DO CASE
CASE cTBL = "S"
CASE cTBL = "B"
CASE cTBL = "W"
OTHERWISE
	MESSAGEBOX("Function: Remove_Lst_Detail_by_ID()"+CHR(13)+"No TBL Parameter!",0,"Error")
	RecordError(0,,"No TBL Parameter" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),,"No TBL Parameter" )
	RETURN .F.
ENDCASE

PRIVATE nID_Detail
IF VARTYPE(pID_Detail)!="N"
	RETURN .F.
	TrackError("Bad Parameter ID_Detail","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
ENDIF
nID_Detail = PrepareSQLnum(pID_Detail,'ID_Detail',-3)
IF nID_Detail < 1
	RETURN .F.
ENDIF


IF VARTYPE(pConnHandle)!="N"
	TrackError("Bad Parameter pConnHandle","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF


PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
	ENDIF
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF
nConn = CheckSQLConnection(nConn)


PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE nCountDetail
nCountDetail = Count_Lst_Detail_by_ID(cTBL,nID,nConn)
IF nCountDetail > 0
	*Last Detail deleted should trigger master delete.
	*lOK = .F.
	MESSAGEBOX("Could not delete ID:"+ALLTRIM(STR(nID))+CHR(13)+"There is still a detail record",0,"Cannot delete ID")
	TrackError("Could not delete ID:"+ALLTRIM(STR(nID))+CHR(13)+"There is still a detail record","Could not delete ID:"+ALLTRIM(STR(nID)), PROGRAM(), LINENO(1))
	RETURN .F.
ENDIF

PRIVATE lTranAlreadySet, nProp, lOK 
nProp = SQLGETPROP(nConn, 'Transactions')
lTranAlreadySet = (nProp = 2)
lOK = .T.

PRIVATE cSQL, nSQLEXEC

*IF MESSAGEBOX("Are you sure you want to delete the Detail Record"+IIF(tmpPSTK_CntDtbyID.CNTD >1,"s","")+"?",4+32,"Confirm Delete") = 6
PRIVATE cSQLd
cSQLd = "DELETE FROM "
DO CASE
CASE cTBL = "S"
	cSQLd = cSQLd + " dbo.StockLst_Master "
CASE cTBL = "B"
	cSQLd = cSQLd + " dbo.BrokerLst_Master "
CASE cTBL = "W"
	cSQLd = cSQLd + " dbo.WIPLst_Master "
ENDCASE
cSQLd = cSQLd + " WHERE ID = "+STR(nID)

nSQLEXEC = SQLEXEC(nConn, cSQLd )
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQLd )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQLd, "")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQLd, "")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF

IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQLd ,nConn,nSQLEXEC,'')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQLd )
	ELSE
		nSQLEXEC = 1
	ENDIF
ENDIF

IF nSQLEXEC > 0
	lOK = .T.
	IF NOT lTranAlreadySet
		= SQLCOMMIT(nConn)
		= SQLSETPROP(nConn, 'Transactions', 1)  && TRANSAUTO
	ENDIF
	TrackMess("Ran: Remove_Lst_Detail_by_ID: cTBL="+cTBL+CHR(13)+cSQLd )
ELSE
	lOK = .F.
	IF NOT lTranAlreadySet
		= SQLROLLBACK(nConn)
		= SQLSETPROP(nConn, 'Transactions', 1)  && 1AUTO, 2MANUAL Trans
	ENDIF
	TrackMess("Failed to: Remove_Lst_Detail_by_ID: cTBL="+cTBL+CHR(13)+cSQLd )
*	RETURN .F.
ENDIF


IF nConn != pConnHandle
	SQLDISCONNECT( nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lOK
ENDPROC		
		
		
******************  
PROC Remove_Lst_Detail_by_ID_Detail 
PARAMETER pTBL, pID_Detail, pConnHandle, pFrom, pWhy
*Remove_Lst_Detail_by_ID_Detail(cTBL,nID_Detail,nConnHandle,pFrom, pWhy)
*Saves NEW Process with Process_ID before deleteing

PRIVATE cTBL
cTBL = UPPER(PrepareSQLtxt(pTBL,"TBL",1))
DO CASE
CASE cTBL = "S"
CASE cTBL = "B"
CASE cTBL = "W"
OTHERWISE
	MESSAGEBOX("Function: Remove_Lst_Detail_by_ID_Detail()"+CHR(13)+"No TBL Parameter!",0,"Error")
	RecordError(0,,"No TBL Parameter" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),,"No TBL Parameter" )
	RETURN .F.
ENDCASE

PRIVATE nID_Detail
IF VARTYPE(pID_Detail)!="N"
	RETURN .F.
	TrackError("Bad Parameter ID_Detail","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
ENDIF
nID_Detail = PrepareSQLnum(pID_Detail,'ID_Detail',-3)
IF nID_Detail < 1
	RETURN .F.
ENDIF


IF VARTYPE(pConnHandle)!="N"
	TrackError("Bad Parameter pConnHandle","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF

IF VARTYPE(pFrom)!= "C"
	pFrom = ""
ENDIF
*IF VARTYPE(pWhy)!= "C"
pWhy = PrepareSQLtxt(pWhy,'WHY',-1)
*ENDIF

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
	ENDIF
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE m.nID, m.nID_Detail, m.nID_Detail_Process, m.nWeight, m.nPc, m.process_ID, m.processor, m.cComment
PRIVATE m.nWO, m.nWO_Detail, m.nO_QTY
PRIVATE cSQLi, cSQLid 
PRIVATE cSQL, nSQLEXEC
IF USED('tmpPSTK_CntDtbyID_D')
	USE IN tmpPSTK_CntDtbyID_D
ENDIF

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE nCountDetail
nCountDetail = Count_Lst_Detail_by_ID_Detail(cTBL,nID_Detail,nConn)


PRIVATE lTranAlreadySet, nProp, lOK 
nProp = SQLGETPROP(nConn, 'Transactions')
lTranAlreadySet = (nProp = 2)
lOK = .T.

IF USED('tmpPSTK_CntDtbyID_D')
	USE IN tmpPSTK_CntDtbyID_D
ENDIF


IF nCountDetail > 0
	
	IF LEN(pWhy)>1	&&Must create Reason Processes
	
		PRIVATE nDID, nDID_Detail, nDWeight, nDS_PU, nDS_QTY, nDReceivingID, nDWO, nMWO_Detail
		nDID  		=0
		nDID_Detail	=0 
		nDWeight	=0 
		nDS_PU		=0
		nDS_QTY		=0
		nDReceivingID =0
		nDWO		= 0
		nMWO_Detail	= 0
		
		*Get ID_Detail
		cSQL = "SELECT D.ID,D.ID_Detail,D.Weight,D.S_PU,D.S_QTY, D.ReceivingID "
		cSQL = cSQL + ", D.WO, M.WO_Detail, M.PO_item "
		DO CASE
		CASE cTBL = "S"
			cSQL = cSQL + " FROM dbo.StockLst_Detail D WITH(NOLOCK) "
			cSQL = cSQL + " INNER JOIN dbo.StockLst_Master M WITH(NOLOCK) ON D.ID = M.ID "
		CASE cTBL = "B"
			cSQL = cSQL + " FROM dbo.BrokerLst_Detail D WITH(NOLOCK) "
			cSQL = cSQL + " INNER JOIN dbo.BrokerLst_Master M WITH(NOLOCK) ON D.ID = M.ID "
		CASE cTBL = "W"
			cSQL = cSQL + " FROM dbo.WIPLst_Detail D WITH(NOLOCK) "
			cSQL = cSQL + " INNER JOIN dbo.WIPLst_Master M WITH(NOLOCK) ON D.ID = M.ID "
		ENDCASE
		cSQL = cSQL + " WHERE ID_Detail = "+ STR(nID_Detail)
		
		SELECT 0
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_CntDtbyID_D' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn,  cSQL, 'tmpPSTK_CntDtbyID_D' )
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CntDtbyID_D")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CntDtbyID_D")
				
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF	
		IF nSQLEXEC < 0
			IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpPSTK_CntDtbyID_D')
				RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
					
				IF USED('tmpPSTK_CntDtbyID_D')
					USE IN tmpPSTK_CntDtbyID_D
				ENDIF
				RETURN .F.
			ELSE 
				nSQLEXEC = 1
			ENDIF
		ENDIF
		
		IF nSQLEXEC > 0 
			
			PRIVATE m.nWeight,m.nPU,m.nQTY,m.nPounds,m.cProcess_ID,m.cProcessor,m.cComment
			PRIVATE m.nReceivingID, m.nWO, m.nWO_Detail, m.cPOitem
			
			IF USED('tmpPSTK_CntDtbyID_D')
				SELECT tmpPSTK_CntDtbyID_D
				SCAN
					m.nID		= PrepareSQLnum(tmpPSTK_CntDtbyID_D.ID,'ID',-3)
					m.nID_Detail = PrepareSQLnum(tmpPSTK_CntDtbyID_D.ID_Detail,'ID_Detail',-3)
					*m.nID_Detail_Process = PrepareSQLnum(tmpPSTK_CntDtbyID_D.ID_Detail_Process,'ID_Detail_Process',-3)
					m.nWeight	= PrepareSQLnum(tmpPSTK_CntDtbyID_D.Weight,'Weight',9,1)
					*m.nPc		= tmpPSTK_CntDtbyID_D.Pc
					m.nPU		= PrepareSQLnum(tmpPSTK_CntDtbyID_D.S_PU,'PU',-1)
					m.nQTY		= PrepareSQLnum(tmpPSTK_CntDtbyID_D.S_QTY,'QTY',-5)
					m.nPounds	= PrepareSQLnum(tmpPSTK_CntDtbyID_D.Weight,'weight',9,1)
					
									
					DO CASE
					CASE "CONSUME" $ UPPER(pWhy)
						m.cProcess_ID = "CONSUME"
					CASE "WO " $ UPPER(pWhy)
						m.cProcess_ID = "WorkOrder"
					CASE "POitem " $ UPPER(pWhy)
						m.cProcess_ID = "POitem Cancel"
					CASE "WOD Delete" $ UPPER(pWhy)
						m.cProcess_ID = "WOD Delete"
					OTHERWISE
						m.cProcess_ID = "CORRECTION"
					ENDCASE

					IF NOT ( EMPTY(pFrom) )
						m.cProcessor	= LEFT(pFrom,20)
					ELSE
						m.cProcessor	= ""
					ENDIF
					
					m.cComment 		= ALLTRIM(pFrom)+LEFT(pWhy,100)
					m.nReceivingID	= PrepareSQLnum(tmpPSTK_CntDtbyID_D.ReceivingID,'ReceivingID',-3)
					m.nWO			= PrepareSQLnum(tmpPSTK_CntDtbyID_D.WO,'WO',-3)
					m.nWO_Detail	= PrepareSQLnum(tmpPSTK_CntDtbyID_D.WO_Detail,'WO_Detail',-3)
					m.nO_QTY		= m.nQTY
					m.cPOitem		= PrepareSQLtxt(tmpPSTK_CntDtbyID_D.PO_item,'POitem',12)
					
					PRIVATE cSalesPerson
					cSalesPerson = ''
					IF m.cPOitem <> Proper_PO_item('')
						PRIVATE cSalesP
						cSalesP = Get_From_POitem(m.cPOitem, "SalesP", nConn )
						IF LEN(cSalesP) > 0
							cSalesPerson = AppSetup_Get_UserName(cSalesP)
						ENDIF
					ENDIF
					*****
					
					PRIVATE m.cPrc_Form, m.nPrc_PCs, m.nPrc_Dim1, m.nPrc_Dim2, m.nPrc_Dim3
					m.cPrc_Form = ''
					m.nPrc_PCs = 0
					m.nPrc_Dim1 = 0
					m.nPrc_Dim2 = 0
					m.nPrc_Dim3 = 0
					
					IF m.nID_Detail > 0
						SELECT 0
						Get_Stock_Detail(cTBL,m.nID_Detail,nConn)
						IF USED('tmpPSTK_Stock_Detail_Dim')
							m.cPrc_Form	= PrepareSQLtxt(tmpPSTK_Stock_Detail_Dim.Form,'Form',2)
							m.nPrc_PCs	= PrepareSQLnum(tmpPSTK_Stock_Detail_Dim.PC,'Pieces',-3)
							m.nPrc_Dim1	= PrepareSQLnum(tmpPSTK_Stock_Detail_Dim.Dim1,'Dim1',10,4)
							m.nPrc_Dim2	= PrepareSQLnum(tmpPSTK_Stock_Detail_Dim.Dim2,'Dim2',9,3)
							m.nPrc_Dim3	= PrepareSQLnum(tmpPSTK_Stock_Detail_Dim.Dim3,'Dim3',9,3)

							USE IN tmpPSTK_Stock_Detail_Dim
						ENDIF
					ENDIF
					
					
					************************************
					*Do do transaction here.  SQL cannot delete if in Manual
*					IF NOT lTranAlreadySet
*						= SQLSETPROP(nConn, 'Transactions', 2)  && Manual transactions
*					ENDIF
*					---------------------------------------------
*  					call [dbo].[p_Lst_Process_ins_Tran] instead!
*
					************************************
					IF USED("tmpPSTK_ID_Detail_Process")
						USE IN tmpPSTK_ID_Detail_Process
					ENDIF
					
					***
					*Save NEW Process with Process_ID 
					cSQLi = "EXEC dbo.p_Lst_Process_ins "
					cSQLi = cSQLi + " @TBL = '"+cTBL+"'"
					cSQLi = cSQLi + ",@ID_Detail = "+STR(m.nID_Detail)+""
					cSQLi = cSQLi + ",@SalesPerson = '"+cSalesPerson+"'"
					cSQLi = cSQLi + ",@StartDate = '"+TTOC(DATETIME())+"'"	&&GetDate()"
					cSQLi = cSQLi + ",@DueDate = '"+DTOC(DATE())+"'"
					cSQLi = cSQLi + ",@AllowSub = '"+"N"+"'"   &&'Y' Computer does not Select the Stock!
					cSQLi = cSQLi + ",@PU	="+STR(m.nPU)
					cSQLi = cSQLi + ",@QTY	="+STR(m.nQTY,18,4)
					cSQLi = cSQLi + ",@Pounds ="+STR(m.nPounds,9,1)
					
					cSQLi = cSQLi + ",@SOitem = '"+""+"'"
					cSQLi = cSQLi + ",@PO_item = '"+m.cPOitem+"'"
					cSQLi = cSQLi + ",@WO	= "+STR(m.nWO)+""
					cSQLi = cSQLi + ",@WO_Detail= "+STR(m.nWO_Detail)+""
					
					cSQLi = cSQLi + ",@Process_ID = '"+PrepareSQLtxt(cProcess_ID,'Process_ID',10)+"'"
					cSQLi = cSQLi + ",@Processor = '"+PrepareSQLtxt(cProcessor,'User',20)+"'"
					cSQLi = cSQLi + ",@Comment = '"+PrepareSQLtxt(cComment,'Comment',100)+"'"
					cSQLi = cSQLi + ",@ReceivingID ="+STR(m.nReceivingID)
					
					cSQLi = cSQLi + ",@Prc_Form = '"+m.cPrc_Form+"'"
					cSQLi = cSQLi + ",@Prc_PCs = "+STR(m.nPrc_PCs)
					cSQLi = cSQLi + ",@Prc_Dim1 = "+STR(m.nPrc_Dim1,10,4)
					cSQLi = cSQLi + ",@Prc_Dim2 = "+STR(m.nPrc_Dim2,9,3)
					cSQLi = cSQLi + ",@Prc_Dim3 = "+STR(m.nPrc_Dim3,9,3)
					
					cSQLi = cSQLi + ",@Ordered_QTY = "+STR(m.nO_QTY)
					cSQLi = cSQLi + ",@Ordered_P = "+STR(0)
					
					SELECT 0
					nSQLEXEC = SQLEXEC(nConn, cSQLi, 'tmpPSTK_ID_Detail_Process')
					DO WHILE nSQLEXEC = 0
						WAIT WINDOW 'SQL' TIMEOUT 1
						nSQLEXEC = SQLEXEC(nConn, cSQLi, 'tmpPSTK_ID_Detail_Process')
					ENDDO
					IF nSQLEXEC < 0 &&Try again!
						nSQLEXEC = SQLEXEC(nConn, cSQLi, "tmpPSTK_ID_Detail_Process")
						DO WHILE nSQLEXEC = 0
							WAIT WINDOW 'SQL 2' TIMEOUT 1
							nSQLEXEC = SQLEXEC(nConn, cSQLi, "tmpPSTK_ID_Detail_Process")
							
							IF nSQLEXEC < 0
								IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
									nSQLEXEC = 0
								ENDIF
							ENDIF
						ENDDO
					ENDIF
					IF nSQLEXEC < 0
						IF NOT SQLEXECError(cSQLi,nConn,nSQLEXEC, 'tmpPSTK_ID_Detail_Process')
							RecordError(nSQLEXEC,"SQL Error","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )	
						ENDIF
					ENDIF
					
					IF USED("tmpPSTK_ID_Detail_Process")
						m.nID_Detail_Process = PrepareSQLnum(tmpPSTK_ID_Detail_Process.Exp,'ID_Detail_Process',-3)
						USE IN tmpPSTK_ID_Detail_Process
					ELSE
						m.nID_Detail_Process = 0
					ENDIF
					**
					
					*Insert Process_Detail to inter-connect Processm as REMOVE
					IF m.nID_Detail_Process > 0
						DO CASE
						CASE cTBL = "S"
							cSQLid = "INSERT INTO dbo.StockLst_Process_Detail "
						CASE cTBL = "B"
							cSQLid = "INSERT INTO dbo.BrokerLst_Process_Detail "
						CASE cTBL = "W"
							cSQLid = "INSERT INTO dbo.WIPLst_Process_Detail "
						ENDCASE
						cSQLid = cSQLid+ "( ID, ID_Detail, ID_Detail_Process, What ) VALUES ("
						cSQLid = cSQLid+ ""+STR(m.nID)+""
						cSQLid = cSQLid+ ","+STR(m.nID_Detail)+""
						cSQLid = cSQLid+ ","+STR(m.nID_Detail_Process)+""
						cSQLid = cSQLid+ ",'"+"REMOVED"+"'"+")"
						*PU,QTY,Orered_QTY,Pounds,Prc_Q_QTY, Prc_Q_PU
						
						SELECT 0
						nSQLEXEC = SQLEXEC( nConn, cSQLid )
						DO WHILE nSQLEXEC = 0
							WAIT WINDOW 'SQL' TIMEOUT 1
							nSQLEXEC = SQLEXEC(nConn, cSQLid )
						ENDDO
						IF nSQLEXEC < 0 &&Try again!
							nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
							DO WHILE nSQLEXEC = 0
								WAIT WINDOW 'SQL 2' TIMEOUT 1
								nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
								
								IF nSQLEXEC < 0
									IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
										nSQLEXEC = 0
										*lOK = .F.
									ENDIF
								ENDIF
							ENDDO
						ENDIF
						IF nSQLEXEC < 0
							IF NOT SQLEXECError(cSQLid,nConn,nSQLEXEC,'' )
								RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQLid )
							ENDIF
						ENDIF
					
						*****************
						*Now Remove that new Process, and 
						DO CASE
						CASE cTBL = "S"
							cSQLid = "DELETE dbo.StockLst_Process "
						CASE cTBL = "B"
							cSQLid = "DELETE dbo.BrokerLst_Process "
						CASE cTBL = "W"
							cSQLid = "DELETE dbo.WIPLst_Process "
						ENDCASE
						*cSQLid = cSQLid+ " WHERE ID_Detail="+STR(m.nID_Detail)+""
						cSQLid = cSQLid+ " WHERE ID_Detail_Process="+STR(m.nID_Detail_Process)
						
						SELECT 0
						nSQLEXEC = SQLEXEC( nConn, cSQLid )
						DO WHILE nSQLEXEC = 0
							WAIT WINDOW 'SQL' TIMEOUT 1
							nSQLEXEC = SQLEXEC(nConn, cSQLid )
						ENDDO
						IF nSQLEXEC < 0 &&Try again!
							nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
							DO WHILE nSQLEXEC = 0
								WAIT WINDOW 'SQL 2' TIMEOUT 1
								nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
								
								IF nSQLEXEC < 0
									IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
										nSQLEXEC = 0
									ENDIF
								ENDIF
							ENDDO
						ENDIF
						IF nSQLEXEC < 0
							IF NOT SQLEXECError(cSQLid,nConn,nSQLEXEC,'' )
								RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQLid )
								lOK = .F.
							ENDIF
						ENDIF

						*****************						
						*Now Delete Process_Detail
						*Delete that  Process_Detail to inter-connect Process as REMOVE
						
						DO CASE
						CASE cTBL = "S"
							cSQLid = "DELETE dbo.StockLst_Process_Detail "
						CASE cTBL = "B"
							cSQLid = "DELETE dbo.BrokerLst_Process_Detail "
						CASE cTBL = "W"
							cSQLid = "DELETE dbo.WIPLst_Process_Detail "
						ENDCASE
						cSQLid = cSQLid+ " WHERE ID="+STR(m.nID)+""
						cSQLid = cSQLid+ " AND ID_Detail="+STR(m.nID_Detail)+""
						cSQLid = cSQLid+ " AND ID_Detail_Process="+STR(m.nID_Detail_Process)+""
						cSQLid = cSQLid+ " AND [What]='"+"REMOVED"+"'"
						
						SELECT 0
						nSQLEXEC = SQLEXEC( nConn, cSQLid )
						DO WHILE nSQLEXEC = 0
							WAIT WINDOW 'SQL' TIMEOUT 1
							nSQLEXEC = SQLEXEC(nConn, cSQLid )
						ENDDO
						IF nSQLEXEC < 0 &&Try again!
							nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
							DO WHILE nSQLEXEC = 0
								WAIT WINDOW 'SQL 2' TIMEOUT 1
								nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
								
								IF nSQLEXEC < 0
									IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
										nSQLEXEC = 0
									ENDIF
								ENDIF
							ENDDO
						ENDIF
						IF nSQLEXEC < 0
							IF NOT SQLEXECError(cSQLid,nConn,nSQLEXEC,'' )
								RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQLid )
								*lOK = .F.
							ENDIF
						ENDIF
						
						
					ENDIF
					SELECT tmpPSTK_CntDtbyID_D
					
				ENDSCAN
				
				*****************
				IF lOK
				
					PRIVATE nCountProces
					nCountProces = Count_Lst_Process_by_ID_Detail(cTBL,nID_Detail,nConn)  &&WITH(NOLOCK)
					

					IF nCountProces > 1
						*Delete ALL the Process' to the ID_Detail                          Remove_Lst_Detail_by_ID_Detail
						lOK = Remove_Lst_Process_by_ID_Detail(cTBL,nID_Detail,nConn, "Remove_Lst_Detail_by_ID_Detail", pWhy)
						*Remove_Lst_Process
						*Count again
						nCountProces = Count_Lst_Process_by_ID_Detail(cTBL,nID_Detail,nConn)  &&WITH(NOLOCK)
					ENDIF					
					
					
					IF nCountProces = 0
						*Now Delete the Detail
						*Last Detail deleted should trigger master delete.
				
						PRIVATE cSQLd
						cSQLd = "DELETE FROM "
						DO CASE
						CASE cTBL = "S"
							cSQLd = cSQLd + " dbo.StockLst_Detail "
						CASE cTBL = "B"
							cSQLd = cSQLd + " dbo.BrokerLst_Detail "
						CASE cTBL = "W"
							cSQLd = cSQLd + " dbo.WIPLst_Detail "
						ENDCASE
						
						*IF cFrom="Remove_Lst_Detail"
						
						cSQLd = cSQLd + " WHERE ID_Detail = "+STR(nID_Detail)
						
						nSQLEXEC = SQLEXEC(nConn, cSQLd )
						DO WHILE nSQLEXEC = 0
							WAIT WINDOW 'SQL' TIMEOUT 1
							nSQLEXEC = SQLEXEC(nConn, cSQLd )
						ENDDO
						IF nSQLEXEC < 0 &&Try again!
							nSQLEXEC = SQLEXEC(nConn, cSQLd, "")
							DO WHILE nSQLEXEC = 0
								WAIT WINDOW 'SQL 2' TIMEOUT 1
								nSQLEXEC = SQLEXEC(nConn, cSQLd, "")
								
								IF nSQLEXEC < 0
									IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
										nSQLEXEC = 0
									ENDIF
								ENDIF
							ENDDO
						ENDIF
						
						IF nSQLEXEC < 0
							IF NOT SQLEXECError(cSQLd ,nConn,nSQLEXEC,'')
								RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQLd )
								IF USED('tmpPSTK_CntDtbyID_D')
									USE IN tmpPSTK_CntDtbyID_D
								ENDIF
								*IF NOT lTranAlreadySet
								*	*= SQLROLLBACK(nConn)
								*	*= SQLSETPROP(nConn, 'Transactions', 1)  && 1AUTO, 2MANUAL Trans
								*ENDIF
								
								lOK = .F.
								*RETURN .F.
							ELSE
								nSQLEXEC = 1
							ENDIF
						ENDIF
						
						IF nSQLEXEC > 0
							lOK = .T.
							TrackMess("Ran: Remove_Lst_Detail_by_ID_Detail: cTBL="+cTBL+CHR(13)+cSQLd )
						ENDIF
					ENDIF
					
				ENDIF
								
				*****************
				IF lOK
					IF NOT pFrom="Remove_Lst_ID"
						*Now Delete ID if last one OR called from Remove_Lst_ID
						*nCountProces = Count_Lst_Process_by_ID_Detail(cTBL,nID_Detail,nConn)    &&WITH(NOLOCK)
						*nCountDetails = Count_Lst_Details_by_ID_Detail(cTBL,nID_Detail,nConn)
						nCountDetails = Count_Lst_Detail_by_ID(cTBL,nID,nConn)
						IF nCountDetails = 0
							*after deleteing the Detail of one, only Master stands
							SELECT 0
							*lForceDelete = .F.
							lOK = Remove_Lst_ID(cTBL, nID, nConn,.F.,pFrom,pWhy)
						ENDIF
					ENDIF
				ENDIF
								
				IF lOK
					IF NOT lTranAlreadySet
*						= SQLCOMMIT(nConn)
						= SQLSETPROP(nConn, 'Transactions', 1)  && TRANSAUTO
					ENDIF
				ELSE	&&lOK
					IF NOT lTranAlreadySet
*						= SQLROLLBACK(nConn)
						= SQLSETPROP(nConn, 'Transactions', 1)  && 1AUTO, 2MANUAL Trans
					ENDIF
					RETURN .F.
				ENDIF
				
				**************
			ENDIF	&&IF USED('tmpPSTK_CntDtbyID_D')
		ENDIF	&&IF nSQLEXEC > 0 
	ENDIF	&&IF NOT EMPTY(pWhy)	&&Must create Reason Processes

ELSE	&&IF tmpPSTK_CntDtbyID_D.Cntd >= 1
	IF pFrom = "Copy_Stock_WIP"
		*This was a redundant call
	ELSE
		MESSAGEBOX("No "+cTBL+" Lst Detail record found to Delete.",0,"Nothing to delete!")
	ENDIF
ENDIF

*****************************************************************

IF USED('tmpPSTK_CntDtbyID_D')
	USE IN tmpPSTK_CntDtbyID_D
ENDIF

IF nConn != pConnHandle
	SQLDISCONNECT( nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN .T.
ENDPROC		
		
******************  
PROC Remove_Lst_Process_by_ID_Detail 
PARAMETER pTBL, pID_Detail, pConnHandle, pFrom, pWhy
*lOK = Remove_Lst_Process_by_ID_Detail(cTBL,nID_Detail,nConnHandle,pFrom, pWhy)
*pFrom="Remove_Lst_Detail_by_ID_Detail"

PRIVATE cTBL
cTBL = UPPER(PrepareSQLtxt(pTBL,"TBL",1))
DO CASE
CASE cTBL = "S"
CASE cTBL = "B"
CASE cTBL = "W"
OTHERWISE
	MESSAGEBOX("Function: Remove_Lst_Process_by_ID_Detail()"+CHR(13)+"No TBL Parameter!",0,"Error")
	RecordError(0,,"No TBL Parameter" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),,"No TBL Parameter" )
	RETURN .F.
ENDCASE

PRIVATE nID_Detail
IF VARTYPE(pID_Detail)!="N"
	RETURN .F.
	TrackError("Bad Parameter ID_Detail","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
ENDIF
nID_Detail = PrepareSQLnum(pID_Detail,'ID_Detail',-3)
IF nID_Detail < 1
	RETURN .F.
ENDIF


IF VARTYPE(pConnHandle)!="N"
	TrackError("Bad Parameter pConnHandle","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF

IF VARTYPE(pFrom)!= "C"
	pFrom = ""
ENDIF
*IF VARTYPE(pWhy)!= "C"
pWhy = PrepareSQLtxt(pWhy,'WHY',-1)
*ENDIF

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
	ENDIF
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE cSQL, nSQLEXEC
IF USED('tmpPSTK_CntPtbyID_D')
	USE IN tmpPSTK_CntPtbyID_D
ENDIF

PRIVATE cAlias 
cAlias = ALIAS()


PRIVATE lTranAlreadySet, nProp, lOK 
nProp = SQLGETPROP(nConn, 'Transactions')
lTranAlreadySet = (nProp = 2)
lOK = .T.

PRIVATE cSQLd
cSQLd = "DELETE FROM "
DO CASE
CASE cTBL = "S"
	cSQLd = cSQLd + " dbo.StockLst_Process "
CASE cTBL = "B"
	cSQLd = cSQLd + " dbo.BrokerLst_Process "
CASE cTBL = "W"
	cSQLd = cSQLd + " dbo.WIPLst_Process "
ENDCASE
cSQLd = cSQLd + " WHERE ID_Detail = "+STR(nID_Detail)

nSQLEXEC = SQLEXEC(nConn, cSQLd )
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQLd )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQLd, "")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQLd, "")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
						
						
						
IF lOK
	IF NOT lTranAlreadySet
		= SQLCOMMIT(nConn)
		= SQLSETPROP(nConn, 'Transactions', 1)  && TRANSAUTO
	ENDIF
ELSE	&&lOK
	IF NOT lTranAlreadySet
		= SQLROLLBACK(nConn)
		= SQLSETPROP(nConn, 'Transactions', 1)  && 1AUTO, 2MANUAL Trans
	ENDIF
	RETURN .F.
ENDIF
		

IF nConn != pConnHandle
	SQLDISCONNECT( nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN .T.
ENDPROC		

******************     
******************     
*!*	*DEPRICATED
*!*	PROC Remove_StockLst_Detail_by_ID_Detail 
*!*	PARAMETER pID_Detail, pConnHandle ,pFrom, pWhy
*!*	*Remove_StockLst_Detail_by_ID_Detail(nID_Detail,nConnHandle,pFrom, pWhy)

*!*	IF VARTYPE(pID_Detail)!="N"
*!*		RETURN .F.
*!*	ENDIF
*!*	IF VARTYPE(pConnHandle)!="N"
*!*		RETURN .F.
*!*	ENDIF

*!*	IF VARTYPE(pFrom)!= "C"
*!*		pFrom = ""
*!*	ENDIF
*!*	IF VARTYPE(pWhy)!= "C"
*!*		pWhy= ""
*!*	ENDIF
*!*	pConnHandle = CheckSQLConnection(pConnHandle)

*!*	PRIVATE m.nID, m.nID_Detail, m.nWeight, m.nPc, m.process_ID,m.processor, m.cComment
*!*	PRIVATE cSQLi, cSQLid 
*!*	PRIVATE cSQL, nSQLEXEC
*!*	IF USED('tmpPSTK_CntPtbyID_D')
*!*		USE IN tmpPSTK_CntPtbyID_D
*!*	ENDIF

*!*	PRIVATE cAlias 
*!*	cAlias = ALIAS()

*!*	SELECT 0
*!*	cSQL = "SELECT COUNT(*) AS Cntd "
*!*	cSQL = cSQL+" FROM dbo.StockLst_Detail WHERE ID_Detail = "+ STR(pID_Detail)
*!*	nSQLEXEC = SQLEXEC(pConnHandle, cSQL, 'tmpPSTK_CntPtbyID_D' )
*!*	DO WHILE nSQLEXEC = 0
*!*		WAIT WINDOW 'SQL' TIMEOUT 1
*!*		nSQLEXEC = SQLEXEC(pConnHandle,  cSQL, 'tmpPSTK_CntPtbyID_D' )
*!*	ENDDO
*!*	IF nSQLEXEC < 0 &&Try again!
*!*					nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*					DO WHILE nSQLEXEC = 0
*!*						WAIT WINDOW 'SQL 2' TIMEOUT 1
*!*						nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*						
*!*						IF nSQLEXEC < 0
*!*							IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
*!*								nSQLEXEC = 0
*!*							ENDIF
*!*						ENDIF
*!*					ENDDO
*!*				ENDIF
*!*	IF nSQLEXEC < 0
*!*		IF NOT SQLEXECError(cSQL,pConnHandle,nSQLEXEC, 'tmpPSTK_CntPtbyID_D')
*		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
*!*		IF USED('tmpPSTK_CntPtbyID_D')
*!*			USE IN tmpPSTK_CntPtbyID_D
*!*		ENDIF
*!*		RETURN .F.
*!*	ELSE
*!*		IF USED('tmpPSTK_CntPtbyID_D')
*!*			IF tmpPSTK_CntPtbyID_D.Cntd = 1
*!*				IF NOT EMPTY(pWhy)	&&Must have Reason
*!*					*Get ID_Detail
*!*					cSQL = "SELECT ID,ID_Detail,Weight,S_PU,S_QTY "
*!*					cSQL = cSQL + " FROM dbo.StockLst_Detail "
*!*					cSQL = cSQL + " WHERE ID_Detail = "+ STR(pID_Detail)
*!*					
*!*					nSQLEXEC = SQLEXEC(pConnHandle, cSQL, 'tmpPSTK_CntPtbyID_D' )
*!*					DO WHILE nSQLEXEC = 0
*!*						WAIT WINDOW 'SQL' TIMEOUT 1
*!*						nSQLEXEC = SQLEXEC(pConnHandle,  cSQL, 'tmpPSTK_CntPtbyID_D' )
*!*					ENDDO	
*!*	IF nSQLEXEC < 0 &&Try again!
*!*					nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*					DO WHILE nSQLEXEC = 0
*!*						WAIT WINDOW 'SQL 2' TIMEOUT 1
*!*						nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*						
*!*						IF nSQLEXEC < 0
*!*							IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
*!*								nSQLEXEC = 0
*!*							ENDIF
*!*						ENDIF
*!*					ENDDO
*!*				ENDIF			
*!*					IF nSQLEXEC < 0
*!*						IF NOT SQLEXECError(cSQL,pConnHandle,nSQLEXEC, 'tmpPSTK_CntPtbyID_D')
*		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
*!*						IF USED('tmpPSTK_CntPtbyID_D')
*!*							USE IN tmpPSTK_CntPtbyID_D
*!*						ENDIF
*!*						RETURN .F.
*!*					ELSE 

*!*						PRIVATE lTranAlreadySet, nProp 
*!*						nProp = SQLGETPROP(nConn, 'Transactions')
*!*						lTranAlreadySet = (nProp = 2)
*!*	
*!*						IF NOT lTranAlreadySet
*!*							= SQLSETPROP(pConnHandle, 'Transactions', 2)  && Manual transactions
*!*						ENDIF
*!*						
*!*						PRIVATE m.nID_Detail,m.nWeight,m.nPU,m.nQTY,m.nPounds,m.cProcess_ID,m.cProcessor,m.cComment
*!*						
*!*						IF USED('tmpPSTK_CntPtbyID_D')
*!*							SELECT tmpPSTK_CntPtbyID_D
*!*							SCAN
*!*								m.nID		= PrepareSQLnum(tmpPSTK_CntPtbyID_D.ID,'ID',-3)
*!*								m.nID_Detail = PrepareSQLnum(tmpPSTK_CntPtbyID_D.ID_Detail,'ID_Detail',-3)
*!*								m.nWeight	= PrepareSQLnum(tmpPSTK_CntPtbyID_D.Weight,'Weight',9,1)
*!*								*m.nPc		= tmpPSTK_CntPtbyID_D.Pc
*!*								m.nPU		= PrepareSQLnum(tmpPSTK_CntPtbyID_D.S_PU,'PU',-1)
*!*								m.nQTY		= PrepareSQLnum(tmpPSTK_CntPtbyID_D.S_QTY,'QTY',-5)
*!*								m.nPounds	= PrepareSQLnum(tmpPSTK_CntPtbyID_D.Weight,'weight',9,1)

*!*								IF "CONSUME" $ UPPER(pWhy)
*!*									m.cProcess_ID = "CONSUME"
*!*								ELSE
*!*									IF "WO " $ UPPER(pWhy)
*!*										m.cProcess_ID = "WorkOrder"
*!*									ELSE
*!*										m.cProcess_ID = "CORRECTION"
*!*									ENDIF
*!*								ENDIF

*!*								IF NOT ( EMPTY(pFrom) )
*!*									m.cProcessor	= LEFT(pFrom,20)
*!*								ELSE
*!*									m.cProcessor	= ""
*!*								ENDIF
*!*								
*!*								m.cComment = ALLTRIM(pFrom)+LEFT(pWhy,100)
*!*								

*!*								IF nSQLEXEC < 0 &&Try again!
*!*					nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*					DO WHILE nSQLEXEC = 0
*!*						WAIT WINDOW 'SQL 2' TIMEOUT 1
*!*						nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*						
*!*						IF nSQLEXEC < 0
*!*							IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
*!*								nSQLEXEC = 0
*!*							ENDIF
*!*						ENDIF
*!*					ENDDO
*!*				ENDIF
*!*								
*!*							ENDSCAN
*!*							
*!*	*						IF nSQLEXEC < 0
*!*	*							IF NOT SQLEXECError(cSQLi,pConnHandle,nSQLEXEC, 'tmpPSTK_ID_Detail_Process')
*		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQLi )
*!*	*							TrackError("Could not EXEC dbo.p_Lst_Process_ins","p_Lst_Process_ins","Proc_StockLst:Remove_StockLst_Detail_by_ID_Detail",LINENO())
*!*	*						ELSE
*!*								IF USED("tmpPSTK_ID_Detail_Process")
*!*									m.nID_Detail_Process = tmpPSTK_ID_Detail_Process.Exp
*!*									USE IN tmpPSTK_ID_Detail_Process
*!*								ENDIF
*!*	*						ENDIF

*!*							cSQLid = "INSERT INTO dbo.StockLst_Process_Detail ("
*!*							cSQLid = cSQLid+ "ID, ID_Detail, ID_Detail_Process, What ) VALUES ("
*!*							cSQLid = cSQLid+ ""+STR(m.nID)+""
*!*							cSQLid = cSQLid+ ","+STR(m.nID_Detail)+""
*!*							cSQLid = cSQLid+ ","+STR(m.nID_Detail_Process)+""
*!*							cSQLid = cSQLid+ ",'"+"REMOVED"+"'"+")"
*!*							
*!*							nSQLEXEC = SQLEXEC( pConnHandle, cSQLid )
*!*							DO WHILE nSQLEXEC = 0
*!*								WAIT WINDOW 'SQL' TIMEOUT 1
*!*								nSQLEXEC = SQLEXEC(pConnHandle, cSQLid )
*!*							ENDDO
*!*	IF nSQLEXEC < 0 &&Try again!
*!*					nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*					DO WHILE nSQLEXEC = 0
*!*						WAIT WINDOW 'SQL 2' TIMEOUT 1
*!*						nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*						
*!*						IF nSQLEXEC < 0
*!*							IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
*!*								nSQLEXEC = 0
*!*							ENDIF
*!*						ENDIF
*!*					ENDDO
*!*				ENDIF
*!*							IF nSQLEXEC < 0
*!*								IF NOT SQLEXECError(cSQLid,pConnHandle,nSQLEXEC,'' )
*		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQLid )
*!*							ENDIF
*!*							
*!*							*****************
*!*							
*!*							cSQLid = "DELETE dbo.StockLst_Process_Detail WHERE "
*!*							cSQLid = cSQLid+ " ID="+STR(m.nID)+""
*!*							cSQLid = cSQLid+ " AND ID_Detail="+STR(m.nID_Detail)+""
*!*							cSQLid = cSQLid+ " AND ID_Detail_Process="+STR(m.nID_Detail_Process)+""
*!*							cSQLid = cSQLid+ " AND [What]='"+"REMOVED"+"'"
*!*							
*!*							nSQLEXEC = SQLEXEC( pConnHandle, cSQLid )
*!*							DO WHILE nSQLEXEC = 0
*!*								WAIT WINDOW 'SQL' TIMEOUT 1
*!*								nSQLEXEC = SQLEXEC(pConnHandle, cSQLid )
*!*							ENDDO
*!*	IF nSQLEXEC < 0 &&Try again!
*!*					nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*					DO WHILE nSQLEXEC = 0
*!*						WAIT WINDOW 'SQL 2' TIMEOUT 1
*!*						nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*						
*!*						IF nSQLEXEC < 0
*!*							IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
*!*								nSQLEXEC = 0
*!*							ENDIF
*!*						ENDIF
*!*					ENDDO
*!*				ENDIF
*!*							IF nSQLEXEC < 0
*!*								IF NOT SQLEXECError(cSQLid,pConnHandle,nSQLEXEC,'' )
*								RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQLid )
*!*							ENDIF
*!*							
*!*				
*!*							*****************
*!*							
*!*						ENDIF
*!*					ENDIF
*!*				ENDIF


*!*				*IF MESSAGEBOX("Are you sure you want to delete the Detail Record"+IIF(tmpPSTK_CntPtbyID_D.CNTD >1,"s","")+"?",4+32,"Confirm Delete") = 6
*!*				cSQL_Delete="DELETE FROM dbo.StockLst_Detail WHERE ID_Detail = "+STR(pID_Detail)
*!*				nSQLEXEC = SQLEXEC(pConnHandle, cSQL_Delete )
*!*				DO WHILE nSQLEXEC = 0
*!*					WAIT WINDOW 'SQL' TIMEOUT 1
*!*					nSQLEXEC = SQLEXEC(pConnHandle, cSQL_Delete )
*!*				ENDDO
*!*	IF nSQLEXEC < 0 &&Try again!
*!*					nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*					DO WHILE nSQLEXEC = 0
*!*						WAIT WINDOW 'SQL 2' TIMEOUT 1
*!*						nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*						
*!*						IF nSQLEXEC < 0
*!*							IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
*!*								nSQLEXEC = 0
*!*							ENDIF
*!*						ENDIF
*!*					ENDDO
*!*				ENDIF
*!*				IF nSQLEXEC < 0
*!*					IF NOT SQLEXECError(cSQL_Delete,pConnHandle,nSQLEXEC,'')
*		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
*!*					IF USED('tmpPSTK_CntPtbyID_D')
*!*						USE IN tmpPSTK_CntPtbyID_D
*!*					ENDIF
*!*				IF NOT lTranAlreadySet
*!*					= SQLROLLBACK(pConnHandle)
*!*					= SQLSETPROP(pConnHandle, 'Transactions', 1)  && 1AUTO, 2MANUAL Trans
*!*				ENDIF
*!*					RETURN .F.
*!*				ELSE
	*				IF NOT lTranAlreadySet
*!*					=SQLCOMMIT(pConnHandle)
*!*					= SQLSETPROP(pConnHandle, 'Transactions', 1)  && TRANSAUTO
*ENDIF
*!*					TrackMess("Remove_StockLst_Detail_by_ID_Detail: "+cSQL_Delete)
*!*					
*!*	*!*					IF pFrom = "Edit PO"
*!*	*!*						cSQL_Delete="DELETE FROM HPAlloy_Archive.dbo.StockLst_Detail_History WHERE ID_Detail = "+STR(pID_Detail)
*!*	*!*						nSQLEXEC = SQLEXEC(pConnHandle, cSQL_Delete )
*!*	*!*						DO WHILE nSQLEXEC = 0
*!*	*!*							WAIT WINDOW 'SQL' TIMEOUT 1
*!*	*!*							nSQLEXEC = SQLEXEC(pConnHandle, cSQL_Delete )
*!*	*!*						ENDDO
*!*	IF nSQLEXEC < 0 &&Try again!
*!*					nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*					DO WHILE nSQLEXEC = 0
*!*						WAIT WINDOW 'SQL 2' TIMEOUT 1
*!*						nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*						
*!*						IF nSQLEXEC < 0
*!*							IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
*!*								nSQLEXEC = 0
*!*							ENDIF
*!*						ENDIF
*!*					ENDDO
*!*				ENDIF
*!*	*!*						IF nSQLEXEC < 0
*!*	*!*							IF NOT SQLEXECError(cSQL_Delete,pConnHandle,nSQLEXEC,'')
*		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
*!*	*!*						ELSE
*!*	*!*							TrackMess(cSQL_Delete)
*!*	*!*						ENDIF

*!*	*!*						*WHERE dbo.ProperPO(PO_Item) = dbo.ProperPO('
*!*	*!*					ENDIF
*!*					
*!*				ENDIF

*!*			ELSE
*!*				MESSAGEBOX("No StockLst Detail record found to Delete.",0,"Nothing to delete!")
*!*			ENDIF
*!*			IF USED('tmpPSTK_CntPtbyID_D')
*!*				USE IN tmpPSTK_CntPtbyID_D
*!*			ENDIF
*!*		ENDIF
*!*	ENDIF

*!*	IF NOT EMPTY(cAlias)
*!*		IF USED(cAlias)
*!*			SELECT (cAlias)
*!*		ELSE
*		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
*ENDIF
*!*	ENDIF

*!*	RETURN .T.
*!*	ENDPROC		
		
		

******************   
*!*	*DEPRICATED
*!*	PROC Remove_BrokerLst_Detail_by_ID_Detail 
*!*	PARAMETER pID_Detail, pConnHandle ,pFrom, pWhy
*!*	*Remove_BrokerLst_Detail_by_ID_Detail(nID_Detail,nConnHandle,pFrom, pWhy)

*!*	IF VARTYPE(pID_Detail)!="N"
*!*		RETURN .F.
*!*	ENDIF
*!*	IF VARTYPE(pConnHandle)!="N"
*!*		RETURN .F.
*!*	ENDIF

*!*	IF VARTYPE(pFrom)!= "C"
*!*		pFrom = ""
*!*	ENDIF
*!*	IF VARTYPE(pWhy)!= "C"
*!*		pWhy= ""
*!*	ENDIF
*!*	pConnHandle = CheckSQLConnection(pConnHandle)

*!*	PRIVATE m.nID, m.nID_Detail, m.nWeight, m.nPc, m.process_ID,m.processor, m.cComment
*!*	PRIVATE cSQLi, cSQLid 
*!*	PRIVATE cSQL, nSQLEXEC
*!*	IF USED('tmpPSTK_CntPtbyID_D')
*!*		USE IN tmpPSTK_CntPtbyID_D
*!*	ENDIF

*!*	PRIVATE cAlias 
*!*	cAlias = ALIAS()

*!*	SELECT 0
*!*	cSQL = "SELECT COUNT(*) AS Cntd "
*!*	cSQL = cSQL+" FROM dbo.BrokerLst_Detail WHERE ID_Detail = "+ STR(pID_Detail)
*!*	nSQLEXEC = SQLEXEC(pConnHandle, cSQL, 'tmpPSTK_CntPtbyID_D' )
*!*	DO WHILE nSQLEXEC = 0
*!*		WAIT WINDOW 'SQL' TIMEOUT 1
*!*		nSQLEXEC = SQLEXEC(pConnHandle, cSQL, 'tmpPSTK_CntPtbyID_D' )
*!*	ENDDO
*!*	IF nSQLEXEC < 0 &&Try again!
*!*		nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*		DO WHILE nSQLEXEC = 0
*!*			WAIT WINDOW 'SQL 2' TIMEOUT 1
*!*			nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*			
*!*			IF nSQLEXEC < 0
*!*				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
*!*					nSQLEXEC = 0
*!*				ENDIF
*!*			ENDIF
*!*		ENDDO
*!*	ENDIF
*!*	IF nSQLEXEC < 0
*!*		IF NOT SQLEXECError(cSQL,pConnHandle,nSQLEXEC, 'tmpPSTK_CntPtbyID_D')
*		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
*!*		IF USED('tmpPSTK_CntPtbyID_D')
*!*			USE IN tmpPSTK_CntPtbyID_D
*!*		ENDIF
*!*		RETURN .F.
*!*	ELSE
*!*		IF USED('tmpPSTK_CntPtbyID_D')
*!*			IF tmpPSTK_CntPtbyID_D.Cntd = 1
*!*				IF NOT ( EMPTY(pWhy) )	&&Must have Reason
*!*					*Get ID_Detail
*!*					cSQL = "SELECT ID,ID_Detail,Weight,S_PU,S_QTY "
*!*					cSQL = cSQL+" FROM dbo.BrokerLst_Detail WHERE ID_Detail = "+ STR(pID_Detail)
*!*					
*!*					nSQLEXEC = SQLEXEC(pConnHandle, cSQL, 'tmpPSTK_CntPtbyID_D' )
*!*					DO WHILE nSQLEXEC = 0
*!*						WAIT WINDOW 'SQL' TIMEOUT 1
*!*						nSQLEXEC = SQLEXEC(pConnHandle, cSQL, 'tmpPSTK_CntPtbyID_D' )
*!*					ENDDO	
*!*	IF nSQLEXEC < 0 &&Try again!
*!*		nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*		DO WHILE nSQLEXEC = 0
*!*			WAIT WINDOW 'SQL 2' TIMEOUT 1
*!*			nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*			
*!*			IF nSQLEXEC < 0
*!*				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
*!*					nSQLEXEC = 0
*!*				ENDIF
*!*			ENDIF
*!*		ENDDO
*!*	ENDIF			
*!*					IF nSQLEXEC < 0
*!*						IF NOT SQLEXECError(cSQL,pConnHandle,nSQLEXEC, 'tmpPSTK_CntPtbyID_D')
*		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
*!*						IF USED('tmpPSTK_CntPtbyID_D')
*!*							USE IN tmpPSTK_CntPtbyID_D
*!*						ENDIF
*!*						RETURN .F.
*!*					ELSE 

*!*	PRIVATE lTranAlreadySet, nProp 
*!*	nProp = SQLGETPROP(nConn, 'Transactions')
*!*	lTranAlreadySet = (nProp = 2)
*!*			
*!*	IF NOT lTranAlreadySet
*!*						= SQLSETPROP(pConnHandle, 'Transactions', 2)  && Manual transactions
*!*						
*!*						IF USED('tmpPSTK_CntPtbyID_D')
*!*							SELECT tmpPSTK_CntPtbyID_D
*!*							m.nID		= PrepareSQLnum(tmpPSTK_CntPtbyID_D.ID,'ID',-3)
*!*							m.nID_Detail = PrepareSQLnum(tmpPSTK_CntPtbyID_D.ID_Detail,'ID_Detail',-3)
*!*							m.nWeight	= PrepareSQLnum(tmpPSTK_CntPtbyID_D.Weight,'Weight',9,1)
*!*							*m.nPc		= tmpPSTK_CntPtbyID_D.Pc
*!*							m.nPU		= PrepareSQLnum(tmpPSTK_CntPtbyID_D.S_PU,'PU',-1)
*!*							m.nQTY		= PrepareSQLnum(tmpPSTK_CntPtbyID_D.S_QTY,'QTY',-5)
*!*							m.nPounds	= PrepareSQLnum(tmpPSTK_CntPtbyID_D.Weight,'weight',9,1)
*!*							
*!*							IF "CONSUME" $ UPPER(pWhy)
*!*								m.cProcess_ID = "CONSUME"
*!*							ELSE
*!*								IF "WO " $ UPPER(pWhy)
*!*									m.cProcess_ID = "WorkOrder"
*!*								ELSE
*!*									m.cProcess_ID = "CORRECTION"
*!*								ENDIF
*!*							ENDIF


*!*							IF NOT ( EMPTY(pFrom) )
*!*								m.cProcessor = LEFT(pFrom,20)
*!*							ELSE
*!*								m.cProcessor = ""
*!*							ENDIF
*!*							
*!*							m.cComment = ALLTRIM(pFrom)+LEFT(pWhy,100)
*!*							
*!*							*Save Process
*!*							cSQLi = "EXEC dbo.p_BrokerLst_Process_ins4 "
*!*							cSQLi = cSQLi + " @ID_Detail = "+STR(m.nID_Detail)+""
*!*							cSQLi = cSQLi + ",@SalesPerson = '"+"-"+"'"
*!*							cSQLi = cSQLi + ",@StartDate = '"+TTOC(DATETIME())+"'"
*!*							cSQLi = cSQLi + ",@DueDate = '"+DTOC(DATE())+"'"
*!*							cSQLi = cSQLi + ",@AllowSub = '"+"N"+"'"
*!*							cSQLi = cSQLi + ",@PU = "+STR(m.nPU)
*!*							cSQLi = cSQLi + ",@QTY = "+STR(m.nQTY)
*!*							cSQLi = cSQLi + ",@Pounds = "+STR(m.nPounds,9,1)
*!*							cSQLi = cSQLi + ",@SOitem = '"+""+"'"
*!*							cSQLi = cSQLi + ",@PO_Item = '"+""+"'"
*!*							cSQLi = cSQLi + ",@Process_id = '"+STRTRAN(m.cProcess_ID,"'","''")+"'"
*!*							cSQLi = cSQLi + ",@Processor = '"+STRTRAN(m.cProcessor,"'","''")+"'"
*!*							cSQLi = cSQLi + ",@Comment = '"+STRTRAN(m.cComment,"'","''")+"'"

*!*							nSQLEXEC = SQLEXEC(pConnHandle, cSQLi, 'tmpPSTK_ID_Detail_Process')
*!*							DO WHILE nSQLEXEC = 0
*!*								WAIT WINDOW 'SQL' TIMEOUT 1
*!*								nSQLEXEC = SQLEXEC(pConnHandle, cSQLi, 'tmpPSTK_ID_Detail_Process')
*!*							ENDDO

*!*	IF nSQLEXEC < 0 &&Try again!
*!*		nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*		DO WHILE nSQLEXEC = 0
*!*			WAIT WINDOW 'SQL 2' TIMEOUT 1
*!*			nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*			
*!*			IF nSQLEXEC < 0
*!*				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
*!*					nSQLEXEC = 0
*!*				ENDIF
*!*			ENDIF
*!*		ENDDO
*!*	ENDIF
*!*							IF nSQLEXEC < 0
*!*								IF NOT SQLEXECError(cSQLi,pConnHandle,nSQLEXEC, 'tmpPSTK_ID_Detail_Process')
*		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
*!*							ELSE
*!*								IF USED("tmpPSTK_ID_Detail_Process")
*!*									m.nID_Detail_Process = tmpPSTK_ID_Detail_Process.Exp
*!*									USE IN tmpPSTK_ID_Detail_Process
*!*								ENDIF
*!*							ENDIF

*!*							cSQLid = "INSERT INTO dbo.BrokerLst_Process_detail ("
*!*							cSQLid = cSQLid+ "ID, ID_Detail, ID_Detail_Process, What ) VALUES ("
*!*							cSQLid = cSQLid+ ""+STR(m.nID)+","
*!*							cSQLid = cSQLid+ ""+STR(m.nID_Detail)+","
*!*							cSQLid = cSQLid+ ""+STR(m.nID_Detail_Process)+","
*!*							cSQLid = cSQLid+ "'"+"REMOVED"+"'"	+")"
*!*							
*!*							nSQLEXEC = SQLEXEC( pConnHandle, cSQLid )
*!*							DO WHILE nSQLEXEC = 0
*!*								WAIT WINDOW 'SQL' TIMEOUT 1
*!*								nSQLEXEC = SQLEXEC(pConnHandle, cSQLid )
*!*							ENDDO
*!*	IF nSQLEXEC < 0 &&Try again!
*!*		nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*		DO WHILE nSQLEXEC = 0
*!*			WAIT WINDOW 'SQL 2' TIMEOUT 1
*!*			nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*			
*!*			IF nSQLEXEC < 0
*!*				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
*!*					nSQLEXEC = 0
*!*				ENDIF
*!*			ENDIF
*!*		ENDDO
*!*	ENDIF
*!*							IF nSQLEXEC < 0
*!*								IF NOT SQLEXECError(cSQLid,pConnHandle,nSQLEXEC,'' )
*		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQLid )
*!*							ENDIF
*!*							
*!*							*****************
*!*							
*!*							cSQLid = "DELETE dbo.BrokerLst_Process_detail WHERE "
*!*							cSQLid = cSQLid+ "ID="+STR(m.nID)+""
*!*							cSQLid = cSQLid+ " AND ID_Detail="+STR(m.nID_Detail)+""
*!*							cSQLid = cSQLid+ " AND ID_Detail_Process="+STR(m.nID_Detail_Process)+""
*!*							cSQLid = cSQLid+ " AND [What]='"+"REMOVED"+"'"	
*!*							
*!*							nSQLEXEC = SQLEXEC( pConnHandle, cSQLid )
*!*							DO WHILE nSQLEXEC = 0
*!*								WAIT WINDOW 'SQL' TIMEOUT 1
*!*								nSQLEXEC = SQLEXEC(pConnHandle, cSQLid )
*!*							ENDDO
*!*	IF nSQLEXEC < 0 &&Try again!
*!*		nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*		DO WHILE nSQLEXEC = 0
*!*			WAIT WINDOW 'SQL 2' TIMEOUT 1
*!*			nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*			
*!*			IF nSQLEXEC < 0
*!*				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
*!*					nSQLEXEC = 0
*!*				ENDIF
*!*			ENDIF
*!*		ENDDO
*!*	ENDIF
*!*							IF nSQLEXEC < 0
*!*								IF NOT SQLEXECError(cSQLid,pConnHandle,nSQLEXEC,'' )
*		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
*!*							ENDIF
*!*							

*!*							*****************
*!*							
*!*							IF USED('tmpPSTK_CntPtbyID_D')
*!*								USE IN tmpPSTK_CntPtbyID_D
*!*							ENDIF
*!*						ENDIF
*!*					ENDIF
*!*				ENDIF

*!*				
*!*				*IF MESSAGEBOX("Are you sure you want to delete the Detail Record"+IIF(tmpPSTK_CntPtbyID_D.Cntd >1,"s","")+"?",4+32,"Confirm Delete") = 6
*!*				cSQL_Delete="DELETE FROM dbo.BrokerLst_Detail WHERE ID_Detail = "+STR(pID_Detail)
*!*				nSQLEXEC = SQLEXEC(pConnHandle, cSQL_Delete )
*!*				DO WHILE nSQLEXEC = 0
*!*					WAIT WINDOW 'SQL' TIMEOUT 1
*!*					nSQLEXEC = SQLEXEC(pConnHandle, cSQL_Delete )
*!*				ENDDO
*!*	IF nSQLEXEC < 0 &&Try again!
*!*		nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*		DO WHILE nSQLEXEC = 0
*!*			WAIT WINDOW 'SQL 2' TIMEOUT 1
*!*			nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*			
*!*			IF nSQLEXEC < 0
*!*				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
*!*					nSQLEXEC = 0
*!*				ENDIF
*!*			ENDIF
*!*		ENDDO
*!*	ENDIF
*!*				IF nSQLEXEC < 0
*!*					IF NOT SQLEXECError(cSQL_Delete,pConnHandle,nSQLEXEC,'')
*		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL_Delete )
*!*					IF USED('tmpPSTK_CntPtbyID_D')
*!*						USE IN tmpPSTK_CntPtbyID_D
*!*					ENDIF
*!*					= SQLROLLBACK(pConnHandle)
*!*					= SQLSETPROP(pConnHandle, 'Transactions', 1)  && 1AUTO, 2MANUAL Trans
*!*					RETURN .F.
*!*				ELSE
*!*					= SQLCOMMIT(pConnHandle)
*!*					= SQLSETPROP(pConnHandle, 'Transactions', 1)  && TRANSAUTO
*!*					TrackMess("Remove_BrokerLst_Detail_by_ID_Detail: "+cSQL_Delete)
*!*					
*!*	*!*					IF pFrom = "Edit PO"
*!*	*!*						cSQL_Delete="DELETE FROM HPAlloy_Archive.dbo.BrokerLst_Detail_History WHERE ID_Detail = "+STR(pID_Detail)
*!*	*!*						nSQLEXEC = SQLEXEC(pConnHandle, cSQL_Delete )
*!*	*!*						DO WHILE nSQLEXEC = 0
*!*	*!*							WAIT WINDOW 'SQL' TIMEOUT 1
*!*	*!*							nSQLEXEC = SQLEXEC(pConnHandle, cSQL_Delete )
*!*	*!*						ENDDO
*!*	IF nSQLEXEC < 0 &&Try again!
*!*		nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*		DO WHILE nSQLEXEC = 0
*!*			WAIT WINDOW 'SQL 2' TIMEOUT 1
*!*			nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*			
*!*			IF nSQLEXEC < 0
*!*				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
*!*					nSQLEXEC = 0
*!*				ENDIF
*!*			ENDIF
*!*		ENDDO
*!*	ENDIF
*!*	*!*						IF nSQLEXEC < 0
*!*	*!*							IF NOT SQLEXECError(cSQL_Delete,pConnHandle,nSQLEXEC,'')
*		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
*!*	*!*						ENDIF

*!*	*!*						*WHERE dbo.ProperPO(PO_Item) = dbo.ProperPO('
*!*	*!*					ENDIF
*!*				ENDIF

*!*			ELSE
*!*				MESSAGEBOX("No BrokerLst Detail record found to Delete!.",0,"Nothing to delete!")
*!*			ENDIF
*!*			IF USED('tmpPSTK_CntPtbyID_D')
*!*				USE IN tmpPSTK_CntPtbyID_D
*!*			ENDIF
*!*		ENDIF
*!*	ENDIF

*!*	IF NOT EMPTY(cAlias)
*!*		IF USED(cAlias)
*!*			SELECT (cAlias)
*!*		ENDIF
*!*	ENDIF

*!*	RETURN .T.
*!*	ENDPROC		
		

******************   
*!*	*DEPRICATED
*!*	PROC Remove_WIPLst_Detail_by_ID_Detail 
*!*	PARAMETER pID_Detail, pConnHandle ,pFrom, pWhy
*!*	*Remove_WIPLst_Detail_by_ID_Detail(nID_Detail,nConnHandle,pFrom, pWhy)

*!*	IF VARTYPE(pID_Detail)!="N"
*!*		RETURN .F.
*!*	ENDIF
*!*	IF VARTYPE(pConnHandle)!="N"
*!*		RETURN .F.
*!*	ENDIF

*!*	IF VARTYPE(pFrom)!= "C"
*!*		pFrom = ""
*!*	ENDIF
*!*	IF VARTYPE(pWhy)!= "C"
*!*		pWhy= ""
*!*	ENDIF
*!*	pConnHandle = CheckSQLConnection(pConnHandle)

*!*	PRIVATE m.nID, m.nID_Detail, m.nWeight, m.nPc, m.process_ID,m.processor, m.cComment
*!*	PRIVATE cSQLi, cSQLid 
*!*	PRIVATE cSQL, nSQLEXEC
*!*	IF USED('tmpPSTK_CntPtbyID_D')
*!*		USE IN tmpPSTK_CntPtbyID_D
*!*	ENDIF

*!*	PRIVATE cAlias 
*!*	cAlias = ALIAS()

*!*	SELECT 0
*!*	cSQL = "SELECT COUNT(*) AS Cntd "
*!*	cSQL = cSQL+" FROM dbo.WIPLst_Detail WHERE ID_Detail = "+ STR(pID_Detail)
*!*	nSQLEXEC = SQLEXEC(pConnHandle, cSQL, 'tmpPSTK_CntLW_IDD' )
*!*	DO WHILE nSQLEXEC = 0
*!*		WAIT WINDOW 'SQL' TIMEOUT 1
*!*		nSQLEXEC = SQLEXEC(pConnHandle, cSQL, 'tmpPSTK_CntLW_IDD' )
*!*	ENDDO
*!*	IF nSQLEXEC < 0 &&Try again!
*!*		nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*		DO WHILE nSQLEXEC = 0
*!*			WAIT WINDOW 'SQL 2' TIMEOUT 1
*!*			nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*			
*!*			IF nSQLEXEC < 0
*!*				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
*!*					nSQLEXEC = 0
*!*				ENDIF
*!*			ENDIF
*!*		ENDDO
*!*	ENDIF
*!*	IF nSQLEXEC < 0
*!*		IF NOT SQLEXECError(cSQL,pConnHandle,nSQLEXEC, 'tmpPSTK_CntLW_IDD')
*		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
*!*		IF USED('tmpPSTK_CntLW_IDD')
*!*			USE IN tmpPSTK_CntLW_IDD
*!*		ENDIF
*!*		RETURN .F.
*!*	ELSE
*!*		IF USED('tmpPSTK_CntLW_IDD')
*!*			IF tmpPSTK_CntLW_IDD.Cntd = 1
*!*				IF NOT ( EMPTY(pWhy) )	&&Must have Reason
*!*					*Get ID_Detail
*!*					cSQL = "SELECT ID,ID_Detail,Weight,S_PU,S_QTY "
*!*					cSQL = cSQL+" FROM dbo.WIPLst_Detail WHERE ID_Detail = "+ STR(pID_Detail)
*!*					
*!*					nSQLEXEC = SQLEXEC(pConnHandle, cSQL, 'tmpPSTK_CntLW_IDD' )
*!*					DO WHILE nSQLEXEC = 0
*!*						WAIT WINDOW 'SQL' TIMEOUT 1
*!*						nSQLEXEC = SQLEXEC(pConnHandle, cSQL, 'tmpPSTK_CntLW_IDD' )
*!*					ENDDO	
*!*	IF nSQLEXEC < 0 &&Try again!
*!*		nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*		DO WHILE nSQLEXEC = 0
*!*			WAIT WINDOW 'SQL 2' TIMEOUT 1
*!*			nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*			
*!*			IF nSQLEXEC < 0
*!*				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
*!*					nSQLEXEC = 0
*!*				ENDIF
*!*			ENDIF
*!*		ENDDO
*!*	ENDIF			
*!*					IF nSQLEXEC < 0
*!*						IF NOT SQLEXECError(cSQL,pConnHandle,nSQLEXEC, 'tmpPSTK_CntLW_IDD')
*		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
*!*						IF USED('tmpPSTK_CntLW_IDD')
*!*							USE IN tmpPSTK_CntLW_IDD
*!*						ENDIF
*!*						RETURN .F.
*!*					ELSE 
*!*						= SQLSETPROP(pConnHandle, 'Transactions', 2)  && Manual transactions
*!*						
*!*						IF USED('tmpPSTK_CntLW_IDD')
*!*							SELECT tmpPSTK_CntLW_IDD
*!*							m.nID		= PrepareSQLnum(tmpPSTK_CntLW_IDD.ID,'ID',-3)
*!*							m.nID_Detail = PrepareSQLnum(tmpPSTK_CntLW_IDD.ID_Detail,'ID_Detail',-3)
*!*							m.nWeight	= PrepareSQLnum(tmpPSTK_CntLW_IDD.Weight,'Weight',9,1)
*!*							*m.nPc		= tmpPSTK_CntLW_IDD.Pc
*!*							m.nPU		= PrepareSQLnum(tmpPSTK_CntLW_IDD.S_PU,'PU',-1)
*!*							m.nQTY		= PrepareSQLnum(tmpPSTK_CntLW_IDD.S_QTY,'QTY',-5)
*!*							m.nPounds	= PrepareSQLnum(tmpPSTK_CntLW_IDD.Weight,'weight',9,1)
*!*							
*!*							IF "CONSUME" $ UPPER(pWhy)
*!*								m.cProcess_ID = "CONSUME"
*!*							ELSE
*!*								IF "WO " $ UPPER(pWhy)
*!*									m.cProcess_ID = "WorkOrder"
*!*								ELSE
*!*									m.cProcess_ID = "CORRECTION"
*!*								ENDIF
*!*							ENDIF


*!*							IF NOT ( EMPTY(pFrom) )
*!*								m.cProcessor = LEFT(pFrom,20)
*!*							ELSE
*!*								m.cProcessor = ""
*!*							ENDIF
*!*							
*!*							m.cComment = ALLTRIM(pFrom)+LEFT(pWhy,100)
*!*							
*!*							*Save Process
*!*							cSQLi = "EXEC dbo.p_WIPLst_Process_ins4 "
*!*							cSQLi = cSQLi + " @ID_Detail = "+STR(m.nID_Detail)+""
*!*							cSQLi = cSQLi + ",@SalesPerson = '"+"-"+"'"
*!*							cSQLi = cSQLi + ",@StartDate = '"+TTOC(DATETIME())+"'"
*!*							cSQLi = cSQLi + ",@DueDate = '"+DTOC(DATE())+"'"
*!*							cSQLi = cSQLi + ",@AllowSub = '"+"N"+"'"
*!*							cSQLi = cSQLi + ",@PU = "+STR(m.nPU)
*!*							cSQLi = cSQLi + ",@QTY = "+STR(m.nQTY)
*!*							cSQLi = cSQLi + ",@Pounds = "+STR(m.nPounds,9,1)
*!*							cSQLi = cSQLi + ",@SOitem = '"+""+"'"
*!*							cSQLi = cSQLi + ",@PO_Item = '"+""+"'"
*!*							cSQLi = cSQLi + ",@Process_id = '"+STRTRAN(m.cProcess_ID,"'","''")+"'"
*!*							cSQLi = cSQLi + ",@Processor = '"+STRTRAN(m.cProcessor,"'","''")+"'"
*!*							cSQLi = cSQLi + ",@Comment = '"+STRTRAN(m.cComment,"'","''")+"'"

*!*							nSQLEXEC = SQLEXEC(pConnHandle, cSQLi, 'tmpPSTK_ID_Detail_Process')
*!*							DO WHILE nSQLEXEC = 0
*!*								WAIT WINDOW 'SQL' TIMEOUT 1
*!*								nSQLEXEC = SQLEXEC(pConnHandle, cSQLi, 'tmpPSTK_ID_Detail_Process')
*!*							ENDDO

*!*	IF nSQLEXEC < 0 &&Try again!
*!*		nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*		DO WHILE nSQLEXEC = 0
*!*			WAIT WINDOW 'SQL 2' TIMEOUT 1
*!*			nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*			
*!*			IF nSQLEXEC < 0
*!*				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
*!*					nSQLEXEC = 0
*!*				ENDIF
*!*			ENDIF
*!*		ENDDO
*!*	ENDIF

*!*							IF nSQLEXEC < 0
*!*								IF NOT SQLEXECError(cSQLi,pConnHandle,nSQLEXEC, 'tmpPSTK_ID_Detail_Process')
*		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
*!*							ELSE
*!*								IF USED("tmpPSTK_ID_Detail_Process")
*!*									m.nID_Detail_Process = tmpPSTK_ID_Detail_Process.Exp
*!*									USE IN tmpPSTK_ID_Detail_Process
*!*								ENDIF
*!*							ENDIF

*!*							cSQLid = "INSERT INTO dbo.WIPLst_Process_detail ("
*!*							cSQLid = cSQLid+ "ID, ID_Detail, ID_Detail_Process, What ) VALUES ("
*!*							cSQLid = cSQLid+ ""+STR(m.nID)+","
*!*							cSQLid = cSQLid+ ""+STR(m.nID_Detail)+","
*!*							cSQLid = cSQLid+ ""+STR(m.nID_Detail_Process)+","
*!*							cSQLid = cSQLid+ "'"+"REMOVED"+"'"	+")"
*!*							
*!*							nSQLEXEC = SQLEXEC( pConnHandle, cSQLid )
*!*							DO WHILE nSQLEXEC = 0
*!*								WAIT WINDOW 'SQL' TIMEOUT 1
*!*								nSQLEXEC = SQLEXEC(pConnHandle, cSQLid )
*!*							ENDDO
*!*	IF nSQLEXEC < 0 &&Try again!
*!*		nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*		DO WHILE nSQLEXEC = 0
*!*			WAIT WINDOW 'SQL 2' TIMEOUT 1
*!*			nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*			
*!*			IF nSQLEXEC < 0
*!*				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
*!*					nSQLEXEC = 0
*!*				ENDIF
*!*			ENDIF
*!*		ENDDO
*!*	ENDIF
*!*							IF nSQLEXEC < 0
*!*								IF NOT SQLEXECError(cSQLid,pConnHandle,nSQLEXEC,'' )
*		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
*!*							ENDIF
*!*							
*!*	*!*							*****************
*!*	*!*							
*!*	*!*							cSQLid = "DELETE dbo.StockLst_Process_Detail WHERE "
*!*	*!*							cSQLid = cSQLid+ " ID="+STR(m.nID)+""
*!*	*!*							cSQLid = cSQLid+ " AND ID_Detail="+STR(m.nID_Detail)+""
*!*	*!*							cSQLid = cSQLid+ " AND ID_Detail_Process="+STR(m.nID_Detail_Process)+""
*!*	*!*							cSQLid = cSQLid+ " AND [What]='"+"REMOVED"+"'"	
*!*	*!*							
*!*	*!*							nSQLEXEC = SQLEXEC( pConnHandle, cSQLid )
*!*	*!*							DO WHILE nSQLEXEC = 0
*!*	*!*								WAIT WINDOW 'SQL' TIMEOUT 1
*!*	*!*								nSQLEXEC = SQLEXEC(pConnHandle, cSQLid )
*!*	*!*							ENDDO
*!*	IF nSQLEXEC < 0 &&Try again!
*!*		nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*		DO WHILE nSQLEXEC = 0
*!*			WAIT WINDOW 'SQL 2' TIMEOUT 1
*!*			nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*			
*!*			IF nSQLEXEC < 0
*!*				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
*!*					nSQLEXEC = 0
*!*				ENDIF
*!*			ENDIF
*!*		ENDDO
*!*	ENDIF
*!*	*!*							IF nSQLEXEC < 0
*!*	*!*								IF NOT SQLEXECError(cSQLid,pConnHandle,nSQLEXEC,'' )
*		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
*!*	*!*							ENDIF
*!*	*!*							
*!*	*!*							*****************
*!*	*!*							
*!*	*!*							cSQLid = "DELETE dbo.BrokerLst_Process_Detail WHERE "
*!*	*!*							cSQLid = cSQLid+ " ID="+STR(m.nID)+""
*!*	*!*							cSQLid = cSQLid+ " AND ID_Detail="+STR(m.nID_Detail)+""
*!*	*!*							cSQLid = cSQLid+ " AND ID_Detail_Process="+STR(m.nID_Detail_Process)+""
*!*	*!*							cSQLid = cSQLid+ " AND [What]='"+"REMOVED"+"'"	
*!*	*!*							
*!*	*!*							nSQLEXEC = SQLEXEC( pConnHandle, cSQLid )
*!*	*!*							DO WHILE nSQLEXEC = 0
*!*	*!*								WAIT WINDOW 'SQL' TIMEOUT 1
*!*	*!*								nSQLEXEC = SQLEXEC(pConnHandle, cSQLid )
*!*	*!*							ENDDO
*!*	IF nSQLEXEC < 0 &&Try again!
*!*		nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*		DO WHILE nSQLEXEC = 0
*!*			WAIT WINDOW 'SQL 2' TIMEOUT 1
*!*			nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*			
*!*			IF nSQLEXEC < 0
*!*				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
*!*					nSQLEXEC = 0
*!*				ENDIF
*!*			ENDIF
*!*		ENDDO
*!*	ENDIF
*!*	*!*							IF nSQLEXEC < 0
*!*	*!*								IF NOT SQLEXECError(cSQLid,pConnHandle,nSQLEXEC,'' )
*		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
*!*	*!*							ENDIF
*!*	*!*							
*!*							*****************
*!*							
*!*							cSQLid = "DELETE dbo.WIPLst_Process_Detail WHERE "
*!*							cSQLid = cSQLid+ " ID="+STR(m.nID)+""
*!*							cSQLid = cSQLid+ " AND ID_Detail="+STR(m.nID_Detail)+""
*!*							cSQLid = cSQLid+ " AND ID_Detail_Process="+STR(m.nID_Detail_Process)+""
*!*							cSQLid = cSQLid+ " AND [What]='"+"REMOVED"+"'"	
*!*							
*!*							nSQLEXEC = SQLEXEC( pConnHandle, cSQLid )
*!*							DO WHILE nSQLEXEC = 0
*!*								WAIT WINDOW 'SQL' TIMEOUT 1
*!*								nSQLEXEC = SQLEXEC(pConnHandle, cSQLid )
*!*							ENDDO
*!*	IF nSQLEXEC < 0 &&Try again!
*!*		nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*		DO WHILE nSQLEXEC = 0
*!*			WAIT WINDOW 'SQL 2' TIMEOUT 1
*!*			nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*			
*!*			IF nSQLEXEC < 0
*!*				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
*!*					nSQLEXEC = 0
*!*				ENDIF
*!*			ENDIF
*!*		ENDDO
*!*	ENDIF
*!*							IF nSQLEXEC < 0
*!*								IF NOT SQLEXECError(cSQLid,pConnHandle,nSQLEXEC,'' )
*		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
*!*							ENDIF
*!*							
*!*							*****************
*!*							
*!*							IF USED('tmpPSTK_CntLW_IDD')
*!*								USE IN tmpPSTK_CntLW_IDD
*!*							ENDIF
*!*						ENDIF
*!*					ENDIF
*!*				ENDIF

*!*				
*!*				*IF MESSAGEBOX("Are you sure you want to delete the Detail Record"+IIF(tmpPSTK_CntLW_IDD.Cntd >1,"s","")+"?",4+32,"Confirm Delete") = 6
*!*				cSQL_Delete="DELETE FROM dbo.WIPLst_Detail WHERE ID_Detail = "+STR(pID_Detail)
*!*				nSQLEXEC = SQLEXEC(pConnHandle, cSQL_Delete )
*!*				DO WHILE nSQLEXEC = 0
*!*					WAIT WINDOW 'SQL' TIMEOUT 1
*!*					nSQLEXEC = SQLEXEC(pConnHandle, cSQL_Delete )
*!*				ENDDO
*!*	IF nSQLEXEC < 0 &&Try again!
*!*		nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*		DO WHILE nSQLEXEC = 0
*!*			WAIT WINDOW 'SQL 2' TIMEOUT 1
*!*			nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*			
*!*			IF nSQLEXEC < 0
*!*				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
*!*					nSQLEXEC = 0
*!*				ENDIF
*!*			ENDIF
*!*		ENDDO
*!*	ENDIF
*!*				IF nSQLEXEC < 0
*!*					IF NOT SQLEXECError(cSQL_Delete,pConnHandle,nSQLEXEC,'')
*		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
*!*					IF USED('tmpPSTK_CntLW_IDD')
*!*						USE IN tmpPSTK_CntLW_IDD
*!*					ENDIF
*!*					= SQLROLLBACK(pConnHandle)
*!*					= SQLSETPROP(pConnHandle, 'Transactions', 1)  && 1AUTO, 2MANUAL Trans
*!*					RETURN .F.
*!*				ELSE
*!*					=SQLCOMMIT(pConnHandle)
*!*					= SQLSETPROP(pConnHandle, 'Transactions', 1)  && TRANSAUTO
*!*					TrackMess("Remove_WIPLst_Detail_by_ID_Detail: "+cSQL_Delete)
*!*					
*!*	*!*					IF pFrom = "Edit PO"
*!*	*!*						cSQL_Delete="DELETE FROM HPAlloy_Archive.dbo.WIPLst_Detail_History WHERE ID_Detail = "+STR(pID_Detail)
*!*	*!*						nSQLEXEC = SQLEXEC(pConnHandle, cSQL_Delete )
*!*	*!*						DO WHILE nSQLEXEC = 0
*!*	*!*							WAIT WINDOW 'SQL' TIMEOUT 1
*!*	*!*							nSQLEXEC = SQLEXEC(pConnHandle, cSQL_Delete )
*!*	*!*						ENDDO
*!*	IF nSQLEXEC < 0 &&Try again!
*!*		nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*		DO WHILE nSQLEXEC = 0
*!*			WAIT WINDOW 'SQL 2' TIMEOUT 1
*!*			nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
*!*			
*!*			IF nSQLEXEC < 0
*!*				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
*!*					nSQLEXEC = 0
*!*				ENDIF
*!*			ENDIF
*!*		ENDDO
*!*	ENDIF
*!*	*!*						IF nSQLEXEC < 0
*!*	*!*							IF NOT SQLEXECError(cSQL_Delete,pConnHandle,nSQLEXEC,'')
*		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
*!*	*!*						ENDIF

*!*	*!*						*WHERE dbo.ProperPO(PO_Item) = dbo.ProperPO('
*!*	*!*					ENDIF
*!*				ENDIF

*!*			ELSE
*!*				MESSAGEBOX("No WIPLst Detail record found to Delete!.",0,"Nothing to delete!")
*!*			ENDIF
*!*			IF USED('tmpPSTK_CntLW_IDD')
*!*				USE IN tmpPSTK_CntLW_IDD
*!*			ENDIF
*!*		ENDIF
*!*	ENDIF

*!*	IF NOT EMPTY(cAlias)
*!*		IF USED(cAlias)
*!*			SELECT (cAlias)
*!*		ENDIF
*!*	ENDIF

*!*	RETURN .T.
*!*	ENDPROC		
		

*********************************  
PROCEDURE getInvoiceValue_ID_Detail
PARAMETERS nID_Detail, cTBL, pConnHandle
*nReceivingID = getInvoiceValue_ID_Detail(nID_Detail, cTBL, ThisFormSet.nConnHandle)
*returns 

IF VARTYPE(nID_Detail)!="N"
	TrackError("Bad Parameter nID_Detail","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF VARTYPE(cTBL)!="C"
	cTBL = "S"
ENDIF
IF NOT ( cTbl = "S" OR cTbl = "B" OR cTbl = "W" )
	TrackError("Bad Parameter","Bad cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF


PRIVATE cSQL, nInvoiceValue, nS_P, nCostValue
nInvoiceValue = 0
nS_P = 0
nCostValue = 0

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

IF USED('tmpPSTK_InvVal')
	USE IN tmpPSTK_InvVal
ENDIF
SELECT 0


IF nConn > 0
	cSQL = "SELECT InvoiceValue, S_P, CostValue "
	DO CASE
	CASE cTBL = "S"
		cSQL = cSQL + " FROM dbo.StockLst_Detail "
	CASE cTBL = "B"
		cSQL = cSQL + " FROM dbo.BrokerLst_Detail "
	CASE cTBL = "W"
		cSQL = cSQL + " FROM dbo.WIPLst_Detail "
	ENDCASE
	cSQL = cSQL + " WHERE ID_Detail="+STR(nID_Detail)
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_InvVal' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_InvVal' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_InvVal")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_InvVal")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_InvVal")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_InvVal")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_InvVal' )
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ELSE
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_InvVal')
		IF RECCOUNT('tmpPSTK_InvVal') > 0
			nInvoiceValue = PrepareSQLnum(tmpPSTK_InvVal.InvoiceValue,'InvoiceValue',-5)
			nS_P 		= PrepareSQLnum(tmpPSTK_InvVal.S_P,'S_P',-5)
			nCostValue  = PrepareSQLnum(tmpPSTK_InvVal.CostValue,'CostValue',-5)
		ENDIF
		USE IN tmpPSTK_InvVal
	ENDIF
	

	IF lNewConn
		SQLDISCONNECT(nConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF


IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

IF nInvoiceValue = 0
	*Use S_P
	nInvoiceValue = nS_P
ENDIF
IF nInvoiceValue = 0
	*Use nCostValue
	nInvoiceValue = nCostValue
ENDIF

RETURN nInvoiceValue
ENDPROC

********************************** 
PROCEDURE get_Info_Lst_Master 
PARAMETERS nID, cTBL, pConnHandle
*get_Info_Lst_Master(nID,cTBL,pConn)

PRIVATE cReturn
cReturn = ''

IF VARTYPE(nID) != "N"
	TrackError("Bad Parameter nID","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF

IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter cTBL","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
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

IF USED("tmpPSTK_Desc")
	USE IN tmpPSTK_Desc
ENDIF

cSQL = "SELECT M.* "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + " FROM dbo.StockLst_Master M "
CASE cTBL = "B"
	cSQL = cSQL + " FROM dbo.BrokerLst_Master M "
CASE cTBL = "W"
	cSQL = cSQL + " FROM dbo.WIPLst_Master M "
ENDCASE

cSQL = cSQL + " WHERE ID = "+STR(nID)

SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Desc')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_Desc' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Desc")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Desc")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_Desc')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

IF USED('tmpPSTK_Desc')
	IF RECCOUNT('tmpPSTK_Desc') > 0
		cReturn = ""+ShowSQLtxt(tmpPSTK_Desc.Alloy,'Alloy',12,.T.)
		cReturn = cReturn +"  Frm_"+ ShowSQLtxt(tmpPSTK_Desc.Form,'Form',2)
		cReturn = cReturn +" CC_"+ ShowSQLtxt(tmpPSTK_Desc.CC,'CC',1)
		IF NOT EMPTY(tmpPSTK_Desc.CL)
			cReturn = cReturn +"  CL_"+ ShowSQLtxt(tmpPSTK_Desc.CL,'CL',1)
		ENDIF
		cReturn = cReturn +"  Size="+Remove0(PrepareSQLnum(tmpPSTK_Desc.Size,'Size',9,3) ,9,3)+'"'
		cReturn = cReturn +"  Ht='"+ ShowSQLtxt(tmpPSTK_Desc.Heat,'Heat',50)+"'"
		IF NOT EMPTY(tmpPSTK_Desc.Lot)
			IF NOT ALLTRIM(tmpPSTK_Desc.Lot) = "0"
				cReturn = cReturn +"  "+ ShowSQLtxt(tmpPSTK_Desc.Lot,'Lot',10)+""
			ENDIF
		ENDIF
		IF NOT EMPTY(tmpPSTK_Desc.Cond)
			cReturn = cReturn +"  Cond='"+ ShowSQLtxt(tmpPSTK_Desc.Cond,'Cond',50)+"'"
		ENDIF
	ENDIF
ENDIF

IF USED('tmpPSTK_Desc')
	USE IN tmpPSTK_Desc
ENDIF

IF lNewConn
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cReturn 
ENDPROC

********************************** 

PROCEDURE get_Description_ID_Detail 
PARAMETERS nID_Detail, cTBL, pConnHandle, lAddAlloy, lAddAll
*cDesc = get_Description_ID_Detail(nID_Detail,cTBL,ThisForm.nConnHandle,lAddAlloy,lAddAll)
*

PRIVATE cReturn
cReturn = ''

IF VARTYPE(nID_Detail) != "N"
	TrackError("Bad Parameter ID_Detail","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF

IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter cTBL","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF
IF NOT ( cTbl = "S" OR cTbl = "B" OR cTbl = "W" )
	TrackError("Bad Parameter","Bad cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF

IF VARTYPE(lAddAlloy) != "L"
	lAddAlloy = .F.
ENDIF
IF VARTYPE(lAddAll) != "L"
	lAddAll = .F.
ENDIF
IF lAddAll
	*must turn this option off
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

IF USED("tmpPSTK_Desc")
	USE IN tmpPSTK_Desc
ENDIF

cSQL = "SELECT "
IF lAddAlloy
	cSQL = cSQL + " SM.Alloy, SM.CC, SD.PC, "
ENDIF
IF lAddAll
	cSQL = cSQL + " SM.Alloy, SM.CC, SD.*, "
ENDIF
cSQL = cSQL + " dbo.f_ItemDescriptionMetric(SM.Form,SD.Dim1,SD.Dim2,SD.Dim3,SD.Weight,SD.RandLen,0,'','','') AS ItemDescription "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + " FROM dbo.StockLst_Detail SD "
	cSQL = cSQL + " INNER JOIN dbo.StockLst_Master SM ON SM.ID = SD.ID "
CASE cTBL = "B"
	cSQL = cSQL + " FROM dbo.BrokerLst_Detail SD "
	cSQL = cSQL + " INNER JOIN dbo.BrokerLst_Master SM ON SM.ID = SD.ID "
CASE cTBL = "W"
	cSQL = cSQL + " FROM dbo.WIPLst_Detail SD "
	cSQL = cSQL + " INNER JOIN dbo.WIPLst_Master SM ON SM.ID = SD.ID "
OTHERWISE
	TrackError("Bad Parameter cTBL- Not S B or W","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDCASE

cSQL = cSQL + " WHERE ID_Detail = "+STR(nID_Detail)

SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Desc')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_Desc' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Desc")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Desc")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL,nConn, nSQLEXEC, 'tmpPSTK_Desc')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

IF USED('tmpPSTK_Desc')
	IF VARTYPE(tmpPSTK_Desc.ItemDescription)="C"
		*cReturn = ALLTRIM(tmpPSTK_Desc.ItemDescription)
		IF lAddAlloy
			IF tmpPSTK_Desc.CC = '1'
				cReturn = ALLTRIM(tmpPSTK_Desc.Alloy) +" "
			ELSE
				cReturn = ALLTRIM(tmpPSTK_Desc.Alloy) +" CC:"+tmpPSTK_Desc.CC + " " 
			ENDIF

			PRIVATE nPCS
			nPCS = PrepareSQLnum(tmpPSTK_Desc.PC,'PC',3)
			IF nPCS > 0
				cReturn = cReturn + ALLTRIM(STR(nPCS,10,0))+" PC"
				IF nPCS > 1
					cReturn = cReturn + "s "
				ELSE
					cReturn = cReturn + " "
				ENDIF
			ENDIF
			cReturn = cReturn + ALLTRIM(tmpPSTK_Desc.ItemDescription )
		ELSE
			IF lAddAll
				IF tmpPSTK_Desc.CC = '1'
					cReturn = ALLTRIM(tmpPSTK_Desc.Alloy) +" "
				ELSE
					cReturn = ALLTRIM(tmpPSTK_Desc.Alloy) +" CC:"+tmpPSTK_Desc.CC + " " 
				ENDIF

				PRIVATE nPCS
				nPCS = PrepareSQLnum(tmpPSTK_Desc.PC,'PC',3)
				IF nPCS > 0
					cReturn = cReturn + ALLTRIM(STR(nPCS,10,0))+" PC"
					IF nPCS > 1
						cReturn = cReturn + "s "
					ELSE
						cReturn = cReturn + " "
					ENDIF
				ENDIF
				
				cReturn = cReturn + ALLTRIM(tmpPSTK_Desc.ItemDescription )
				
				PRIVATE lRandLEN
				lRandLen = PrepareSQLlogic(tmpPSTK_Desc.RandLen,'RandLen',.F.)
				IF lRandLen 
					cReturn = cReturn + " RandLengths "
				ENDIF
				
				PRIVATE nDIM1, nTolH, nTolL
				nDim1	= PrepareSQLnum(tmpPSTK_Desc.Dim1,'Dim1',9,4)
				nTolH	= PrepareSQLnum(tmpPSTK_Desc.Size_H,'Size_H',9,4)
				nTolL	= PrepareSQLnum(tmpPSTK_Desc.Size_L,'Size_L',9,4)
				
				IF nTolH > 0 AND nDim1 <> nTolH
					cReturn = cReturn + " Tol High "+STR(nTolH,9,4)
				ENDIF
				IF nTolL > 0 AND nDim1 <> nTolL
					IF nTolH > 0 AND nDim1 <> nTolH
						cReturn = cReturn + "/ Low "+STR(nTolL,9,4)
					ELSE
						cReturn = cReturn + " Tol Low "+STR(nTolL,9,4)
					ENDIF
				ENDIF
				
				PRIVATE dInvCheck
				dInvCheck = PrepareSQLdate(tmpPSTK_Desc.InvCheck,'InvCheck')
				cReturn = cReturn + " '"+DTOC(dInvCheck)+"' "
				
				PRIVATE cLocation, cClass
				cLocation = ShowSQLtxt(tmpPSTK_Desc.Location,'Location',10)
				cClass	= ShowSQLtxt(tmpPSTK_Desc.Class,'Class',1)
				
				IF NOT EMPTY(cLocation)
					cReturn = cReturn + " Loc'"+cLocation+"'"
				ENDIF
				IF NOT EMPTY(cClass)
					cReturn = cReturn + " Class="+cClass+""
				ENDIF
				
				PRIVATE lLiveCheck, lQuarantine, lPrime
				lLiveCheck = PrepareSQLlogic(tmpPSTK_Desc.LiveCheck,'LiveCheck',.F.)
				lQuarantine = PrepareSQLlogic(tmpPSTK_Desc.Quarantine,'Quarantine',.F.)
				lPrime = PrepareSQLlogic(tmpPSTK_Desc.Prime,'Prime',.F.)
				
				*IF lLiveCheck 
				*	cReturn = cReturn + " 'LiveCheck'"
				*ENDIF
				IF lQuarantine 
					cReturn = cReturn + " 'In Quarantine' "
				ENDIF
				IF lPrime 
					cReturn = cReturn + " 'Prime'"
				ENDIF
				
				
			ELSE
				cReturn = ALLTRIM(tmpPSTK_Desc.ItemDescription )	
			ENDIF
		ENDIF
		
	ENDIF
ENDIF

IF USED('tmpPSTK_Desc')
	USE IN tmpPSTK_Desc
ENDIF

IF lNewConn
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cReturn 
ENDPROC

********************************** 

PROCEDURE get_Comment_ID_Detail_Process 
PARAMETERS nID_Detail_P, cTBL, pConnHandle
*cDesc_ID_Detail_P get_Comment_ID_Detail_Process(nID_Detail_P,cTBL,ThisForm.nConnHandle)

PRIVATE cReturn
cReturn = ''

IF VARTYPE(nID_Detail_P) != "N"
	TrackError("Bad Parameter ID_Detail_P","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF

IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter cTBL","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF
IF NOT ( cTBL= "S" OR cTBL= "B" OR cTBL= "W" )
	TrackError("Bad Parameter","Bad cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
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

IF USED("tmpPSTK_Desc")
	USE IN tmpPSTK_Desc
ENDIF

cSQL = "SELECT [Comment] AS Descript, AllowSub "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + " FROM dbo.StockLst_Process WITH(NOLOCK) "
CASE cTBL = "B"
	cSQL = cSQL + " FROM dbo.BrokerLst_Process WITH(NOLOCK) "
CASE cTBL = "W"
	cSQL = cSQL + " FROM dbo.WIPLst_Process WITH(NOLOCK) "
OTHERWISE
	TrackError("Bad Parameter cTBL- Not S B or W","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDCASE

cSQL = cSQL + " WHERE ID_Detail_Process = "+STR(nID_Detail_P)

SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Desc')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_Desc' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Desc")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Desc")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL,nConn, nSQLEXEC, 'tmpPSTK_Desc')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

IF USED('tmpPSTK_Desc')
	IF RECCOUNT('tmpPSTK_Desc') > 0
		*cReturn = ALLTRIM(tmpPSTK_Desc.ItemDescription)
		cReturn = ALLTRIM(tmpPSTK_Desc.Descript)
		IF UPPER(tmpPSTK_Desc.AllowSub) = "Y"
			cReturn = ALLTRIM(cReturn) + " -AllowSUB"
		ELSE
			cReturn = ALLTRIM(cReturn) + " -Do Not SUB"
		ENDIF
	ENDIF

	USE IN tmpPSTK_Desc
ENDIF

IF lNewConn
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cReturn 
ENDPROC

**********************************
PROCEDURE get_Pounds_ID_Detail 
PARAMETERS nID_Detail, cTBL, pConnHandle
*get_Pounds_ID_Detail(nID_Detail,cTBL,ThisForm.nConnHandle)

PRIVATE nReturn 
nReturn = 0

IF VARTYPE(nID_Detail) != "N"
	TrackError("Bad Parameter nID_Detail ","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF nID_Detail < 1 
	TrackError("Bad Parameter nID_Detail ","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

IF VARTYPE(cTBL) != 'C'
	TrackError("Bad Parameter cTBL","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF NOT ( cTBL= "S" OR cTBL= "B" OR cTBL= "W" )
	TrackError("Bad Parameter","Bad cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
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

PRIVATE cSQL, nSQLEXEC 

IF USED("tmpPSTK_Desc")
	USE IN tmpPSTK_Desc
ENDIF

cSQL = "SELECT Weight "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + " FROM dbo.StockLst_Detail D "
CASE cTBL = "B"
	cSQL = cSQL + " FROM dbo.BrokerLst_Detail D "
CASE cTBL = "W"
	cSQL = cSQL + " FROM dbo.WIPLst_Detail D "
ENDCASE
cSQL = cSQL + " WHERE D.ID_Detail = "+STR(nID_Detail)

SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Desc')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_Desc' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Desc")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Desc")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_Desc')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

IF USED('tmpPSTK_Desc')
	IF RECCOUNT('tmpPSTK_Desc') > 0
		nReturn = PrepareSQLnum(tmpPSTK_Desc.Weight,'Weight',9,1)
	ENDIF
	USE IN tmpPSTK_Desc
ENDIF

IF lNewConn
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nReturn 
ENDPROC

********************************** 
PROCEDURE get_QTY_ID_Detail 
PARAMETERS nID_Detail, cTBL, pConnHandle
*get_QTY_ID_Detail(nID_Detail,cTBL,ThisForm.nConnHandle)

PRIVATE nReturn 
nReturn = 0

IF VARTYPE(nID_Detail) != "N"
	TrackError("Bad Parameter","Bad Parameter nID_Detail","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF nID_Detail < 1 
	TrackError("Bad Parameter","Bad Parameter nID_Detail","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

IF VARTYPE(cTBL) != 'C'
	TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF NOT ( cTBL= "S" OR cTBL= "B" OR cTBL= "W" )
	TrackError("Bad Parameter","Bad cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
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

PRIVATE cSQL, nSQLEXEC 

IF USED("tmpPSTK_Desc")
	USE IN tmpPSTK_Desc
ENDIF

cSQL = "SELECT QTY "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + " FROM dbo.StockLst_Detail D "
CASE cTBL = "B"
	cSQL = cSQL + " FROM dbo.BrokerLst_Detail D "
CASE cTBL = "W"
	cSQL = cSQL + " FROM dbo.WIPLst_Detail D "
ENDCASE
cSQL = cSQL + " WHERE D.ID_Detail = "+STR(nID_Detail)

SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Desc')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_Desc' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Desc")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Desc")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_Desc')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

IF USED('tmpPSTK_Desc')
	IF RECCOUNT('tmpPSTK_Desc') > 0
		nReturn = PrepareSQLnum(tmpPSTK_Desc.QTY,'QTY',-5)
	ENDIF
	USE IN tmpPSTK_Desc
ENDIF

IF lNewConn
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nReturn 
ENDPROC

********************************** 
PROCEDURE get_QTY_ID_D_P
PARAMETERS nID_D_P, cTBL, pConnHandle
*nQTY=get_QTY_ID_D_P(nID_D_P,cTBL,ThisForm.nConnHandle)

PRIVATE nReturn 
nReturn = 0

IF VARTYPE(nID_D_P) != "N"
	TrackError("Bad Parameter nID_D_P is not a number, VarType:"+VARTYPE(nID_D_P),"Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF nID_D_P< 1 
*	TrackError("Bad Parameter","Bad Parameter nID_D_P is less than 1","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

IF VARTYPE(cTBL) != 'C'
	TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF NOT ( cTBL= "S" OR cTBL= "B" OR cTBL= "W" )
	TrackError("Bad Parameter","Bad cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
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

PRIVATE cSQL, nSQLEXEC 

IF USED("tmpPSTK_Desc")
	USE IN tmpPSTK_Desc
ENDIF

cSQL = "SELECT S_QTY "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + " FROM dbo.StockLst_Detail D "
	cSQL = cSQL + " WHERE D.ID_Detail = "
	cSQL = cSQL + " (SELECT DISTINCT ID_Detail FROM dbo.StockLst_Process WHERE ID_Detail_Process = "+STR(nID_D_P)+"  )"
CASE cTBL = "B"
	cSQL = cSQL + " FROM dbo.BrokerLst_Detail D "
	cSQL = cSQL + " WHERE D.ID_Detail = "
	cSQL = cSQL + " (SELECT DISTINCT ID_Detail FROM dbo.BrokerLst_Process WHERE ID_Detail_Process = "+STR(nID_D_P)+"  )"
CASE cTBL = "W"
	cSQL = cSQL + " FROM dbo.WIPLst_Detail D "
	cSQL = cSQL + " WHERE D.ID_Detail = "
	cSQL = cSQL + " (SELECT DISTINCT ID_Detail FROM dbo.WIPLst_Process WHERE ID_Detail_Process = "+STR(nID_D_P)+"  )"
ENDCASE

SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Desc')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_Desc' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Desc")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Desc")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_Desc')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

IF USED('tmpPSTK_Desc')
	IF RECCOUNT('tmpPSTK_Desc') > 0
		nReturn = PrepareSQLnum(tmpPSTK_Desc.S_QTY,'QTY',-5)
	ENDIF
	USE IN tmpPSTK_Desc
ENDIF

IF lNewConn
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nReturn 
ENDPROC

********************************** 
PROCEDURE get_QTY_Grab 
PARAMETERS cTBL, pSOitem, pWO, pConnHandle
*nQTY=get_QTY_Grab(cTBL, pSOitem,pWO, ThisForm.nConnHandle)


IF VARTYPE(cSOitem) != "C"
	cSOitem = ''
ENDIF

IF VARTYPE(pWO) != "N"
	nWO = 0
ELSE
	nWO = pWO
ENDIF

PRIVATE lHaveSOitem
IF Proper_SO_Item(cSOItem) = Proper_SO_Item("")
	lHaveSOitem = .F.
ELSE
	lHaveSOitem = .T.
ENDIF


IF Proper_SO_Item(cSOItem) = Proper_SO_Item("")  AND nWO=0
	RETURN 0
ENDIF

PRIVATE nReturn 
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

PRIVATE cAlias
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC 

IF USED("tmpPSTK_Q_Grab")
	USE IN tmpPSTK_Q_Grab
ENDIF

cSQL = "SELECT SUM(QTY) AS QTY "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + " FROM dbo.StockLst_Process_Grab "
CASE cTBL = "B"
	cSQL = cSQL + " FROM dbo.BrokerLst_Process_Grab "
CASE cTBL = "W"
	cSQL = cSQL + " FROM dbo.WIPLst_Process_Grab "
ENDCASE
IF lHaveSOitem
	IF nWO > 0
		cSQL = cSQL + "	WHERE WO = "+STR(nWO)+" OR SOitem=dbo.f_ProperSOitem('"+cSOitem+"')"
	ELSE
		cSQL = cSQL + "	WHERE SOitem=dbo.f_ProperSOitem('"+cSOitem+"')"
	ENDIF
ELSE
	IF nWO > 0
		cSQL = cSQL + "	WHERE WO = "+STR(nWO)
	ENDIF
ENDIF
cSQL = cSQL + " AND (Process_ID = 'SELECTED' OR Process_ID = 'PARTSELECT')"


SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Q_Grab')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_Q_Grab' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Q_Grab")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Q_Grab")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_Q_Grab')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

PRIVATE nReturn 
nReturn = 0
IF USED('tmpPSTK_Q_Grab')
	IF RECCOUNT('tmpPSTK_Q_Grab') > 0
		nReturn = PrepareSQLnum(tmpPSTK_Q_Grab.QTY,'QTY',-3)
	ENDIF
	USE IN tmpPSTK_Q_Grab
ENDIF

IF lNewConn
	SQLDISCONNECT(nConn )
ENDIF


IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nReturn 
ENDPROC

********************************** get_QTY_Grab
PROCEDURE get_QTY_ID_Detail 
PARAMETERS nID_Detail, cTBL, pConnHandle
*get_QTY_ID_Detail(nID_Detail,cTBL,ThisForm.nConnHandle)

PRIVATE nReturn 
nReturn = 0

IF VARTYPE(nID_Detail) != "N"
	TrackError("Bad Parameter","Bad Parameter nID_Detail","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF nID_Detail < 1 
	TrackError("Bad Parameter","Bad Parameter nID_Detail","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

IF VARTYPE(cTBL) != 'C'
	TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF NOT ( cTBL= "S" OR cTBL= "B" OR cTBL= "W" )
	TrackError("Bad Parameter","Bad cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
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

PRIVATE cSQL, nSQLEXEC 

IF USED("tmpPSTK_Desc")
	USE IN tmpPSTK_Desc
ENDIF

cSQL = "SELECT QTY "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + " FROM dbo.StockLst_Detail D "
CASE cTBL = "B"
	cSQL = cSQL + " FROM dbo.BrokerLst_Detail D "
CASE cTBL = "W"
	cSQL = cSQL + " FROM dbo.WIPLst_Detail D "
ENDCASE
cSQL = cSQL + " WHERE D.ID_Detail = "+STR(nID_Detail)

SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Desc')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_Desc' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Desc")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Desc")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_Desc')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

IF USED('tmpPSTK_Desc')
	IF RECCOUNT('tmpPSTK_Desc') > 0
		nReturn = PrepareSQLnum(tmpPSTK_Desc.QTY,'QTY',-5)
	ENDIF
	USE IN tmpPSTK_Desc
ENDIF

IF lNewConn
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nReturn 
ENDPROC


********************************** 
PROCEDURE get_PricePaid_ID_Detail
PARAMETERS cTBL, nID_Detail, pConnHandle
*nPaid = get_PricePaid_ID_Detail(cTBL,nID_Detail,ThisForm.nConnHandle)
*-NOT- getStkPaid_SOitem 

PRIVATE nReturn 
nReturn = 0

IF VARTYPE(nID_Detail) != "N"
	TrackError("Bad Parameter nID_Detail "+VARTYPE(nID_Detail),"Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF nID_Detail < 1 
	TrackError("Bad Parameter nID_Detail","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

IF VARTYPE(cTBL) != 'C'
	TrackError("Bad Parameter cTBL "+VARTYPE(nID_Detail),"Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF NOT ( cTBL= "S" OR cTBL= "B" OR cTBL= "W" )
	TrackError("Bad cTBL","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
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

PRIVATE cSQL, nSQLEXEC 

IF USED("tmpPSTK_Desc3")
	USE IN tmpPSTK_Desc3
ENDIF

cSQL = "SELECT ISNULL(M.Paid,0) AS [Paid] "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + " FROM dbo.StockLst_Detail D "
	cSQL = cSQL + " inner join dbo.StockLst_Master M ON D.ID=M.ID "
CASE cTBL = "B"
	cSQL = cSQL + " FROM dbo.BrokerLst_Detail D "
	cSQL = cSQL + " inner join dbo.BrokerLst_Master M ON D.ID=M.ID "
CASE cTBL = "W"
	cSQL = cSQL + " FROM dbo.WIPLst_Detail D "
	cSQL = cSQL + " inner join dbo.WIPLst_Master M ON D.ID=M.ID "
ENDCASE
cSQL = cSQL + " WHERE D.ID_Detail = "+STR(nID_Detail)

SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Desc3')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_Desc3' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Desc3")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Desc3")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_Desc3')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

IF USED('tmpPSTK_Desc3')
	IF RECCOUNT('tmpPSTK_Desc3') > 0
		nReturn = PrepareSQLnum(tmpPSTK_Desc3.Paid,'Paid',-5)
	ENDIF
	USE IN tmpPSTK_Desc3
ENDIF

IF lNewConn
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nReturn 
ENDPROC

********************************** 
PROCEDURE get_Price_ID_Detail 
PARAMETERS cTBL, nID_Detail, pConnHandle
*nS_P = get_Price_ID_Detail(cTBL,nID_Detail,ThisForm.nConnHandle)
*-NOT- getStkPaid_SOitem 

PRIVATE nReturn 
nReturn = 0

IF VARTYPE(nID_Detail) != "N"
	*TrackError("Bad Parameter nID_Detail "+VARTYPE(nID_Detail),"Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	*ran from PackingSlip Print
	RETURN 0
ENDIF
IF nID_Detail < 1 
	*TrackError("Bad Parameter nID_Detail","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

IF VARTYPE(cTBL) != 'C'
	*TrackError("Bad Parameter cTBL "+VARTYPE(nID_Detail),"Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	*ran from PackingSlip Print
	RETURN 0
ENDIF
IF NOT ( cTBL= "S" OR cTBL= "B" OR cTBL= "W" )
	TrackError("Bad cTBL","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
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

PRIVATE cSQL, nSQLEXEC 

IF USED("tmpPSTK_Desc3")
	USE IN tmpPSTK_Desc3
ENDIF

cSQL = "SELECT S_P "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + " FROM dbo.StockLst_Detail D "
CASE cTBL = "B"
	cSQL = cSQL + " FROM dbo.BrokerLst_Detail D "
CASE cTBL = "W"
	cSQL = cSQL + " FROM dbo.WIPLst_Detail D "
ENDCASE
cSQL = cSQL + " WHERE D.ID_Detail = "+STR(nID_Detail)

SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Desc3')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_Desc3' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Desc3")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Desc3")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_Desc3')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

IF USED('tmpPSTK_Desc3')
	IF RECCOUNT('tmpPSTK_Desc3') > 0
		nReturn = PrepareSQLnum(tmpPSTK_Desc3.S_P,'S_P',-5)
	ENDIF
	USE IN tmpPSTK_Desc3
ENDIF

IF lNewConn
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nReturn 
ENDPROC

**********************************
PROCEDURE getPUfromID_Detail
PARAMETERS pnID_Detail, cTBL, pConnHandle
*getPUfromID_Detail(pnID_Detail,cTBL,ThisForm.nConnHandle)

PRIVATE nReturn
nReturn = 0

IF VARTYPE(pnID_Detail) != "N"
	TrackError("Bad Parameter","Bad Parameter pnID_Detail","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

IF VARTYPE(cTBL) != 'C'
	TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF NOT ( cTBL= "S" OR cTBL= "B" OR cTBL= "W" )
	TrackError("Bad Parameter","Bad cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
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

PRIVATE cSQL, nSQLEXEC 


IF USED("tmpPSTK_StockLstD")
	USE IN tmpPSTK_StockLstD
ENDIF

PRIVATE cSQL, nSQLEXEC
cSQL = "SELECT d.S_PU "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + " FROM dbo.StockLst_Detail d "
CASE cTBL = "B"
	cSQL = cSQL + " FROM dbo.BrokerLst_Detail d "
CASE cTBL = "W"
	cSQL = cSQL + " FROM dbo.WIPLst_Detail d "
ENDCASE
cSQL = cSQL + " WHERE d.ID_Detail = "+STR(pnID_Detail)

SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_StockLstD')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_StockLstD')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_StockLstD")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_StockLstD")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_StockLstD')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ELSE
	IF USED("tmpPSTK_StockLstD")
		IF VARTYPE(tmpPSTK_StockLstD.S_PU)="N"
			nReturn = tmpPSTK_StockLstD.S_PU
		ENDIF
	ENDIF
ENDIF

IF USED('tmpPSTK_StockLstD')
	USE IN tmpPSTK_StockLstD
ENDIF

IF lNewConn
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nReturn 
ENDPROC

**********************************
PROCEDURE get_Description_WO 
PARAMETERS nWO, pConnHandle, lAddAlloy
*get_Description_WO(nWO,ThisForm.nConnHandle)

PRIVATE cReturn
cReturn = ''

IF VARTYPE(nWO) != "N"
	TrackError("Bad Parameter","Bad Parameter nWO ","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF
IF nWO < 1
	TrackError("Bad Parameter","Bad Parameter nWO ","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF
*!*	IF VARTYPE(cTBL) != "C"
*!*		TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
*!*		RETURN ''
*!*	ENDIF
*!*	IF NOT ( cTBL= "S" OR cTBL= "B" OR cTBL= "W" )
*!*		TrackError("Bad Parameter","Bad cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
*!*		RETURN ''
*!*	ENDIF

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

IF USED("tmpPSTK_Desc4")
	USE IN tmpPSTK_Desc4
ENDIF

cSQL = "SELECT "
cSQL = cSQL + "sPieces,sAlloy,sCC,sCL"
cSQL = cSQL + ",WOD.fSOitem, WO.POitem "
cSQL = cSQL + ",dbo.f_ItemDescriptionMetric(sForm,sThck,sSz2,sSz3,sWeight,1,0,'','','') AS ItemDescription "
cSQL = cSQL + " FROM dbo.WorkOrder WO "
cSQL = cSQL + " INNER JOIN dbo.WorkOrder_Detail WOD ON WO.WO=WOD.WO"
cSQL = cSQL + " WHERE WO.WO = "+STR(nWO)

SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Desc4')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_Desc4' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Desc4")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Desc4")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_Desc4')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

IF USED('tmpPSTK_Desc4')
	IF VARTYPE(tmpPSTK_Desc4.ItemDescription)="C"
		cReturn = ALLTRIM(tmpPSTK_Desc4.ItemDescription)
*		IF lAddAlloy
		nPieces = PrepareSQLnum(tmpPSTK_Desc4.sPieces,'sPieces',-3)
		cPieces = ALLTRIM(STR(nPieces))
		IF tmpPSTK_Desc4.sCC = '1'
			cReturn = ALLTRIM(tmpPSTK_Desc4.sAlloy) +" "+cPieces+"Pc "+ cReturn
		ELSE
			IF EMPTY(tmpPSTK_Desc4.sCL)
				cReturn = ALLTRIM(tmpPSTK_Desc4.sAlloy) +cPieces+"Pc "+" CC:"+tmpPSTK_Desc4.sCC+" " + cReturn
			ELSE
				cReturn = ALLTRIM(tmpPSTK_Desc4.sAlloy) +cPieces+"Pc "+" CC:"+tmpPSTK_Desc4.sCC +" CL:"+tmpPSTK_Desc4.sCL+ " " + cReturn
			ENDIF
		ENDIF
			
		IF PrepareSQLtxt(tmpPSTK_Desc4.fSOitem,'SOitem',10) != PrepareSQLtxt('','SOitem',10)
			cReturn = cReturn + " SOitem:"+PrepareSQLtxt(tmpPSTK_Desc4.fSOitem,'SOitem',10) 
		ENDIF
		IF PrepareSQLtxt(tmpPSTK_Desc4.POitem,'POitem',12) != PrepareSQLtxt('','POitem',12)
			cReturn = cReturn + " POitem:"+PrepareSQLtxt(tmpPSTK_Desc4.POitem,'POitem',12) 
		ENDIF
		
*		ENDIF
	ENDIF
ENDIF

IF USED('tmpPSTK_Desc4')
	USE IN tmpPSTK_Desc4
ENDIF

IF lNewConn
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cReturn 
ENDPROC

**********************************
PROCEDURE get_Description_WOD 
PARAMETERS nWO_Detail, pConnHandle, lAddAlloy
*get_Description_WOD(nWO_Detail,ThisForm.nConnHandle)

PRIVATE cReturn
cReturn = ''

IF VARTYPE(nWO_Detail) != "N"
	TrackError("Bad Parameter","Bad Parameter nWO_Detail ","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF
IF nWO_Detail< 1
	TrackError("Bad Parameter","Bad Parameter nWO_Detail ","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
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

IF USED("tmpPSTK_Desc4D")
	USE IN tmpPSTK_Desc4D
ENDIF

cSQL = "SELECT "
cSQL = cSQL + " fPieces,sAlloy,fCC,fCL "
cSQL = cSQL + " ,WOD.fSOitem, WO.POitem "
cSQL = cSQL + " ,dbo.f_ItemDescriptionMetric(fForm,fThck,fSz2,fSz3,fWeight,1,0,'','','') AS ItemDescription "
cSQL = cSQL + " FROM dbo.WorkOrder WO "
cSQL = cSQL + " INNER JOIN dbo.WorkOrder_Detail WOD ON WO.WO=WOD.WO "
cSQL = cSQL + " WHERE WOD.WO_Detail ="+STR(nWO_Detail)

SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Desc4D')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_Desc4D' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Desc4D")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Desc4D")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_Desc4D')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

IF USED('tmpPSTK_Desc4D')
	IF VARTYPE(tmpPSTK_Desc4D.ItemDescription)="C"
		cReturn = ALLTRIM(tmpPSTK_Desc4D.ItemDescription)
*		IF lAddAlloy
		nPieces = PrepareSQLnum(tmpPSTK_Desc4D.fPieces,'Pieces',-3)
		cPieces = ALLTRIM(STR(nPieces))
		IF tmpPSTK_Desc4D.fCC = '1'
			cReturn = ALLTRIM(tmpPSTK_Desc4D.sAlloy) +" "+cPieces+"Pc "+ cReturn
		ELSE
			IF EMPTY(tmpPSTK_Desc4D.fCL)
				cReturn = ALLTRIM(tmpPSTK_Desc4D.sAlloy) +cPieces+"Pc "+" CC:"+tmpPSTK_Desc4D.fCC+" " + cReturn
			ELSE
				cReturn = ALLTRIM(tmpPSTK_Desc4D.sAlloy) +cPieces+"Pc "+" CC:"+tmpPSTK_Desc4D.fCC +" CL:"+tmpPSTK_Desc4D.fCL+ " " + cReturn
			ENDIF
		ENDIF
			
		IF PrepareSQLtxt(tmpPSTK_Desc4D.fSOitem,'SOitem',10) != PrepareSQLtxt('','SOitem',10)
			cReturn = cReturn + " SOitem:"+PrepareSQLtxt(tmpPSTK_Desc4D.fSOitem,'SOitem',10) 
		ENDIF
		IF PrepareSQLtxt(tmpPSTK_Desc4D.POitem,'POitem',12) != PrepareSQLtxt('','POitem',12)
			cReturn = cReturn + " POitem:"+PrepareSQLtxt(tmpPSTK_Desc4D.POitem,'POitem',12) 
		ENDIF
		
*		ENDIF
	ENDIF
ENDIF

IF USED('tmpPSTK_Desc4D')
	USE IN tmpPSTK_Desc4D
ENDIF

IF lNewConn
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cReturn 
ENDPROC

**********************************
PROCEDURE StockLst_Process_Remove_WO
PARAMETERS nID_Detail_Process, pConnHandle
*lOK = StockLst_Process_Remove_WO(nID_Detail_Process, ThisForm.nConnHandle)
* returns T if the WO can be removed and SOitem kept.
PRIVATE lReturn
lReturn = .T.

IF VARTYPE(nID_Detail_Process) != "N"
	TrackError("Bad Parameter","Bad Parameter nID_Detail_Process","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
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

PRIVATE cAlias
cAlias = ALIAS()

PRIVATE cTestSOitem, nTestWO
cTestSOitem = ''
nTestWO = 0

IF USED("tmpPSTK_SOitemWO")
	USE IN tmpPSTK_SOitemWO
ENDIF

PRIVATE cSQL, nSQLEXEC
cSQL = "SELECT SOitem,WO FROM dbo.StockLst_Process "
cSQL = cSQL + " WHERE ID_Detail_Process = "+STR(nID_Detail_Process)

SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_SOitemWO')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_SOitemWO')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_SOitemWO")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_SOitemWO")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_SOitemWO')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ELSE
	IF USED("tmpPSTK_SOitemWO")
		IF RECCOUNT('tmpPSTK_SOitemWO') > 0
			IF VARTYPE(tmpPSTK_SOitemWO.SOitem)="C"
				cTestSOitem = PrepareSQLtxt(tmpPSTK_SOitemWO.SOitem,'SOitem',10)
			ENDIF
			IF VARTYPE(tmpPSTK_SOitemWO.WO)="N"
				nTestWO = PrepareSQLnum(tmpPSTK_SOitemWO.WO,'WO',-3)
			ENDIF
		ENDIF
	ENDIF
ENDIF

IF USED('tmpPSTK_SOitemWO')
	USE IN tmpPSTK_SOitemWO
ENDIF


***************************
PRIVATE lOK
lOK = .T.

IF nTestWO = 0
	IF Proper_SO_item(cTestSOitem) = Proper_SO_item('')
		MESSAGEBOX("Cannot have a StockLst_Process without a SOitem"+CHR(13)+" and without a WO!",48,"Cannot remove WO!")
		lOK = .F.
		lReturn = .F.
	ENDIF
ENDIF

IF lOK
	IF NOT Proper_SO_item(cTestSOitem) = Proper_SO_item('')
		*Remove WO, keep SOitem
		cSQL = "UPDATE dbo.StockLst_Process "
		cSQL = cSQL + " SET WO = 0"
		cSQL = cSQL + " WHERE ID_Detail_Process = "+STR(nID_Detail_Process)

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
			IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC )
				RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
				lReturn = .F.
			ENDIF
		ENDIF
	ENDIF
ENDIF

******************



IF lNewConn
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lReturn
ENDPROC

**********************************
PROCEDURE StockLst_Process_Delete 
PARAMETERS nID_Detail_Process, cTBL, pConnHandle
*lOK = StockLst_Process_Delete( nID_Detail_Process, cTBL, ThisForm.nConnHandle)

PRIVATE lReturn
lReturn = .T.

IF VARTYPE(nID_Detail_Process) != "N"
	TrackError("Bad Parameter","Bad Parameter nID_Detail_Process","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF

IF VARTYPE(cTbl) != "C"
	TrackError("Bad Parameter","Bad Parameter cTbl","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF NOT ( cTBL= "S" OR cTBL= "B" OR cTBL= "W" )
	TrackError("Bad Parameter","Bad cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
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

PRIVATE lOK 
lOK = .T.

******************
*Get ID,ID_Detail
PRIVATE nID_Detail,nID
nID_Detail = GetID_DetailfromID_Detail_P( nID_Detail_Process, cTBL, nConn)
IF nID_Detail > 0
	nID = GetIDfromID_Detail( nID_Detail, cTBL, nConn)
ELSE
	nID = 0
ENDIF

IF nID > 0
	*Mark Process_Detail as being Removed. Detail is an inter-Connect with Process

	PRIVATE cSQL, nSQLEXEC
	DO CASE
	CASE cTBL = "S"
		cSQL= "INSERT INTO dbo.StockLst_Process_Detail ("
	CASE cTBL = "B"
		cSQL= "INSERT INTO dbo.BrokerLst_Process_Detail ("
	CASE cTBL = "W"
		cSQL= "INSERT INTO dbo.WIPLst_Process_Detail ("
	ENDCASE
	cSQL= cSQL+ "ID, ID_Detail, ID_Detail_Process, What ) VALUES ("
	cSQL= cSQL+ ""+STR(nID)+","
	cSQL= cSQL+ ""+STR(nID_Detail)+","
	cSQL= cSQL+ ""+STR(nID_Detail_Process)+","
	cSQL= cSQL+ "'"+"REMOVED"+"'"	+")"

	SELECT 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, '')
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, '')
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
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, '')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ELSE
			nSQLEXEC = 1
		ENDIF
	ENDIF
	IF nSQLEXEC > 0
		lOK = .T.
	ENDIF
ENDIF

*****************************
*After creating a History trail, Delete the Actual Process.
DO CASE
CASE cTBL = "S"
	cSQL= "DELETE FROM dbo.StockLst_Process "
CASE cTBL = "B"
	cSQL= "DELETE FROM dbo.BrokerLst_Process "
CASE cTBL = "W"
	cSQL= "DELETE FROM dbo.WIPLst_Process "
ENDCASE
cSQL= cSQL+ " WHERE ID_Detail_Process="+STR(nID_Detail_Process)


SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, '')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, '')
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
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, '')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ELSE
		nSQLEXEC = 1
	ENDIF
ENDIF
IF nSQLEXEC > 0
	lOK = .T.
ENDIF

IF lOK
	IF nID_Detail_Process > 0
		*Delete the Process_Detail 
		
		DO CASE
		CASE cTBL = "S"
			cSQL= "DELETE dbo.StockLst_Process_Detail "
		CASE cTBL = "B"
			cSQL= "DELETE FROM dbo.BrokerLst_Process_Detail "
		CASE cTBL = "W"
			cSQL= "DELETE FROM dbo.WIPLst_Process_Detail "
		ENDCASE
		cSQL= cSQL+ " WHERE ID_Detail_Process="+STR(nID_Detail_Process)
		cSQL= cSQL+ " AND [What]='REMOVED'"

		SELECT 0
		nSQLEXEC = SQLEXEC(nConn, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, '')
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
			IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, '')
				RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
			ELSE
				nSQLEXEC = 1
			ENDIF
		ENDIF
		IF nSQLEXEC > 0
			lOK = .T.
		ENDIF
	ENDIF
ENDIF

IF lNewConn
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lReturn
ENDPROC

********************************** 
PROCEDURE StockLst_Process_Add_WO
PARAMETERS nID_Detail_Process, nWO, pConnHandle
*lOK = StockLst_Process_Add_WO( nID_Detail_Process, nWO, ThisForm.nConnHandle)

PRIVATE lReturn
lReturn = .T.

IF VARTYPE(nID_Detail_Process) != "N"
	TrackError("Bad Parameter","Bad Parameter nID_Detail_Process","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
IF VARTYPE(nWO) != "N"
	TrackError("Bad Parameter","Bad Parameter nWO","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
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

PRIVATE cAlias
cAlias = ALIAS()

	cSQL = "UPDATE dbo.StockLst_Process "
	cSQL = cSQL + " SET WO = "+STR(nWO)
	cSQL = cSQL + " WHERE ID_Detail_Process = "+STR(nID_Detail_Process)

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
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC )
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
			lReturn = .F.
		ELSE
			lReturn = .T.
		ENDIF
	ELSE
		lReturn = .T.
	ENDIF


IF lNewConn
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lReturn
ENDPROC

********************************** 
PROCEDURE StockLst_Process_Count_SOitem 
PARAMETERS cSOitem, cTBL, pConnHandle, cAndSome
*nCNTD = StockLst_Process_Count_SOitem( cSOitem, cTBL, ThisForm.nConnHandle, cAndSome)

PRIVATE nReturn
nReturn = 0

IF VARTYPE(cSOitem) != "C"
	TrackError("Bad Parameter","Bad Parameter cSOitem","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF VARTYPE(cTbl) != "C"
	TrackError("Bad Parameter","Bad Parameter cTbl","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF NOT ( cTBL= "S" OR cTBL= "B" OR cTBL= "W" )
	TrackError("Bad Parameter","Bad cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

IF VARTYPE(cAndSome) != "C"
	cAndSome = ''
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
IF USED('tmpPSTK_CntSOi')
	USE IN tmpPSTK_CntSOi
ENDIF

PRIVATE cAlias 
cAlias = ALIAS()

SELECT 0
cSQL = "SELECT COUNT(*) AS Cntd FROM "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + " dbo.StockLst_Process "
CASE cTBL = "B"
	cSQL = cSQL + " dbo.BrokerLst_Process "
CASE cTBL = "W"
	cSQL = cSQL + " dbo.WIPLst_Process "
ENDCASE
cSQL = cSQL + " WHERE SOitem = dbo.f_ProperSOitem('"+cSOitem+"')"
IF cAndSome = "INCOMING"
	cSQL = cSQL + " AND Process_ID = 'INCOMING'"
ENDIF
IF cAndSome = "INCOMINGNOT2HPA"
	cSQL = cSQL + " AND (Process_ID = 'INCOMING' OR Process_ID = 'NOT2HPA' ) "
ENDIF
IF cAndSome = "SELECTED"
	cSQL = cSQL + " AND ( Process_ID = 'SELECTED' OR Process_ID = 'PARTSELECT') "
ENDIF
*CANCELLED,CORRECTION,INCOMING,PARTSELECT ,RECEIVED,SELECTED,Sell Stock,Shipped,SUBED,Receiving,PARTRECV

nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_CntSOi' )
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_CntSOi' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CntSOi")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CntSOi")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn,nSQLEXEC, 'tmpPSTK_CntSOi')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		
		IF USED('tmpPSTK_CntSOi')
			USE IN tmpPSTK_CntSOi
		ENDIF
		RETURN 0
	ELSE
		nSQLEXEC = 1
	ENDIF
ENDIF

IF nSQLEXEC > 0
	IF USED('tmpPSTK_CntSOi')
		IF tmpPSTK_CntSOi.Cntd > 0
			nReturn = tmpPSTK_CntSOi.Cntd
		ENDIF
		USE IN tmpPSTK_CntSOi
	ENDIF
ENDIF

IF lNewConn
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nReturn
ENDPROC

********************************** 
PROCEDURE StockLst_Process_Count_POitem 
PARAMETERS cPOitem, cTBL, pConnHandle, cAndSome
*nCNTD = StockLst_Process_Count_POitem( cPOitem, cTBL, ThisForm.nConnHandle, cAndSome)

PRIVATE nReturn
nReturn = 0

IF VARTYPE(cPOitem) != "C"
	TrackError("Bad Parameter","Bad Parameter cPOitem","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF VARTYPE(cTbl) != "C"
	TrackError("Bad Parameter","Bad Parameter cTbl","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF NOT ( cTBL= "S" OR cTBL= "B" OR cTBL= "W" )
	TrackError("Bad Parameter","Bad cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

IF VARTYPE(cAndSome) != "C"
	cAndSome = ''
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
IF USED('tmpPSTK_CntPOi')
	USE IN tmpPSTK_CntPOi
ENDIF

PRIVATE cAlias 
cAlias = ALIAS()

SELECT 0
cSQL = "SELECT COUNT(*) AS Cntd FROM "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + " dbo.StockLst_Process "
CASE cTBL = "B"
	cSQL = cSQL + " dbo.BrokerLst_Process "
CASE cTBL = "W"
	cSQL = cSQL + " dbo.WIPLst_Process "
ENDCASE
cSQL = cSQL + " WHERE PO_item = dbo.f_ProperPOitem('"+cPOitem+"')"
IF cAndSome = "INCOMING"
	cSQL = cSQL + " AND ( Process_ID = 'INCOMING' OR Process_ID = 'PARTRECV' OR Process_ID = 'NOT2HPA' )"
ENDIF
IF cAndSome = "INCOMINGNOT2HPA"
	cSQL = cSQL + " AND (Process_ID = 'INCOMING' OR Process_ID = 'NOT2HPA' ) "
ENDIF
IF cAndSome = "SELECTED"
	cSQL = cSQL + " AND ( Process_ID = 'SELECTED' OR Process_ID = 'PARTSELECT') "
ENDIF
*CANCELLED,CORRECTION,INCOMING,PARTSELECT ,RECEIVED,SELECTED,Sell Stock,Shipped,SUBED,Receiving,PARTRECV

nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_CntPOi' )
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_CntPOi' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CntPOi")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CntPOi")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn,nSQLEXEC, 'tmpPSTK_CntPOi')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		
		IF USED('tmpPSTK_CntPOi')
			USE IN tmpPSTK_CntPOi
		ENDIF
		RETURN 0
	ELSE
		nSQLEXEC = 1
	ENDIF
ENDIF

IF nSQLEXEC > 0
	IF USED('tmpPSTK_CntPOi')
		IF tmpPSTK_CntPOi.Cntd > 0
			nReturn = tmpPSTK_CntPOi.Cntd
		ENDIF
		USE IN tmpPSTK_CntPOi
	ENDIF
ENDIF

IF lNewConn
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nReturn
ENDPROC

********************************** 
PROCEDURE StockLst_Process_Count_WO 
PARAMETERS nWO, cTBL, pConnHandle, cAndSome
*nCNTD = StockLst_Process_Count_WO( nWO, cTBL, ThisForm.nConnHandle, cAndSome)

PRIVATE nReturn
nReturn = 0

IF VARTYPE(nWO) != "N"
	TrackError("Bad Parameter","Bad Parameter nWO","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF VARTYPE(cTbl) != "C"
	TrackError("Bad Parameter","Bad Parameter cTbl","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF NOT ( cTBL= "S" OR cTBL= "B" OR cTBL= "W" )
	TrackError("Bad Parameter","Bad cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

IF VARTYPE(cAndSome) != "C"
	cAndSome = ''
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
IF USED('tmpPSTK_CntP_WO')
	USE IN tmpPSTK_CntP_WO
ENDIF

PRIVATE cAlias 
cAlias = ALIAS()

SELECT 0
cSQL = "SELECT COUNT(*) AS Cntd FROM "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + " dbo.StockLst_Process "
CASE cTBL = "B"
	cSQL = cSQL + " dbo.BrokerLst_Process "
CASE cTBL = "W"
	cSQL = cSQL + " dbo.WIPLst_Process "
ENDCASE
cSQL = cSQL + " WHERE WO = "+STR(nWO)

IF cAndSome = "INCOMING"
	cSQL = cSQL + " AND Process_ID = 'INCOMING'"
ENDIF
IF cAndSome = "INCOMINGNOT2HPA"
	cSQL = cSQL + " AND (Process_ID = 'INCOMING' OR Process_ID = 'NOT2HPA' ) "
ENDIF
IF cAndSome = "SELECTED"
	cSQL = cSQL + " AND ( Process_ID = 'SELECTED' OR Process_ID = 'PARTSELECT') "
ENDIF



*CANCELLED,CORRECTION,INCOMING,PARTSELECT ,RECEIVED,SELECTED,Sell Stock,Shipped,SUBED,Receiving,PARTRECV

nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_CntP_WO' )
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_CntP_WO' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CntP_WO")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CntP_WO")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn,nSQLEXEC, 'tmpPSTK_CntP_WO')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		
		IF USED('tmpPSTK_CntP_WO')
			USE IN tmpPSTK_CntP_WO
		ENDIF
		RETURN 0
	ELSE
		nSQLEXEC = 1
	ENDIF
ENDIF

IF nSQLEXEC > 0
	IF USED('tmpPSTK_CntP_WO')
		IF tmpPSTK_CntP_WO.Cntd > 0
			nReturn = tmpPSTK_CntP_WO.Cntd
		ENDIF
		USE IN tmpPSTK_CntP_WO
	ENDIF
ENDIF

IF lNewConn
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nReturn
ENDPROC

********************************** 
PROCEDURE getID_D_P_with_POitem 
PARAMETERS cPOitem, cTBL, pConnHandle, cAndSome
*nID_D_P = getID_D_P_with_POitem( cPOitem, cTBL, ThisForm.nConnHandle, cAndSome)

PRIVATE nReturn
nReturn = 0

IF VARTYPE(cPOitem) != "C"
	TrackError("Bad Parameter","Bad Parameter cPOitem","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF VARTYPE(cTbl) != "C"
	TrackError("Bad Parameter","Bad Parameter cTbl","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF NOT ( cTBL= "S" OR cTBL= "B" OR cTBL= "W" )
	TrackError("Bad Parameter","Bad cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

IF VARTYPE(cAndSome) != "C"
	cAndSome = ''
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
IF USED('tmpPSTK_Get_ID_D_P')
	USE IN tmpPSTK_Get_ID_D_P
ENDIF

PRIVATE cAlias 
cAlias = ALIAS()

SELECT 0
cSQL = "SELECT ID_Detail_Process FROM "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + " dbo.StockLst_Process "
CASE cTBL = "B"
	cSQL = cSQL + " dbo.BrokerLst_Process "
CASE cTBL = "W"
	cSQL = cSQL + " dbo.WIPLst_Process "
ENDCASE
cSQL = cSQL + " WHERE PO_item = dbo.f_ProperPOitem('"+cPOitem+"')"
*IF cAndSome = "INCOMING"
*	cSQL = cSQL + " AND ( Process_ID = 'INCOMING' OR Process_ID = 'PARTRECV' OR Process_ID = 'NOT2HPA' )"
*ENDIF
*CANCELLED,CORRECTION,INCOMING,PARTSELECT ,RECEIVED,SELECTED,Sell Stock,Shipped,SUBED,Receiving,PARTRECV

nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Get_ID_D_P' )
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Get_ID_D_P' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Get_ID_D_P")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Get_ID_D_P")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn,nSQLEXEC, 'tmpPSTK_Get_ID_D_P')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		
		IF USED('tmpPSTK_Get_ID_D_P')
			USE IN tmpPSTK_Get_ID_D_P
		ENDIF
		RETURN 0
	ELSE
		nSQLEXEC = 1
	ENDIF
ENDIF

IF nSQLEXEC > 0
	IF USED('tmpPSTK_Get_ID_D_P')
		IF RECCOUNT('tmpPSTK_Get_ID_D_P') > 0
			nReturn = tmpPSTK_Get_ID_D_P.ID_Detail_Process 
		ENDIF
		USE IN tmpPSTK_Get_ID_D_P
	ENDIF
ENDIF

IF lNewConn
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nReturn
ENDPROC

********************************** 
PROCEDURE WO_Detail
PARAMETERS cPOitem, cTBL, pConnHandle, cAndSome
*nCNTD = WO_Detail( cPOitem, cTBL, ThisForm.nConnHandle, cAndSome)

PRIVATE nReturn
nReturn = 0

IF VARTYPE(cPOitem) != "C"
	TrackError("Bad Parameter","Bad Parameter cPOitem","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF VARTYPE(cTbl) != "C"
	TrackError("Bad Parameter","Bad Parameter cTbl","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF NOT ( cTBL= "S" OR cTBL= "B" OR cTBL= "W" )
	TrackError("Bad Parameter","Bad cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

IF VARTYPE(cAndSome) != "C"
	cAndSome = ''
ENDIF

PRIVATE nConn, lNewConn
lNewConn = .F.
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		pConn = get_SQLSTRINGCONNECT()
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
IF USED('tmpPSTK_CountDetails')
	USE IN tmpPSTK_CntP_WOD
ENDIF

PRIVATE cAlias 
cAlias = ALIAS()

SELECT 0
cSQL = "SELECT COUNT(*) AS Cntd FROM "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + " dbo.StockLst_Process "
CASE cTBL = "B"
	cSQL = cSQL + " dbo.BrokerLst_Process "
CASE cTBL = "W"
	cSQL = cSQL + " dbo.WIPLst_Process "
ENDCASE
cSQL = cSQL + " WHERE PO_item = dbo.f_ProperPOitem('"+cPOitem+"')"
IF cAndSome == "INCOMING"
	cSQL = cSQL + " AND Process_ID = 'INCOMING' "
ENDIF
IF cAndSome = "INCOMINGNOT2HPA"
	cSQL = cSQL + " AND (Process_ID = 'INCOMING' OR Process_ID = 'NOT2HPA' )"
ENDIF
IF cAndSome = "SELECTED"
	cSQL = cSQL + " AND ( Process_ID = 'SELECTED' OR Process_ID = 'PARTSELECT' ) "
ENDIF
*CANCELLED,CORRECTION,INCOMING,NOT2HPA,PARTSELECT ,RECEIVED,SELECTED,Sell Stock,Shipped,SUBED,Receiving,PARTRECV

nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_CntP_WOD' )
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_CntP_WOD' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CntP_WOD")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CntP_WOD")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn,nSQLEXEC, 'tmpPSTK_CntP_WOD')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		IF USED('tmpPSTK_CntP_WOD')
			USE IN tmpPSTK_CntP_WOD
		ENDIF
		RETURN 0
	ELSE
		nSQLEXEC  = 1
	ENDIF
ENDIF
IF nSQLEXEC  > 0
	IF USED('tmpPSTK_CntP_WOD')
		IF tmpPSTK_CntP_WOD.Cntd > 0
			nReturn = tmpPSTK_CntP_WOD.Cntd
		ENDIF
		USE IN tmpPSTK_CntP_WOD
	ENDIF
ENDIF

IF lNewConn
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nReturn
ENDPROC

********************************** 
PROCEDURE StockLst_Process_Count_WO
PARAMETERS nWO, cTBL, pConnHandle, cAndSome
*nCNTD = StockLst_Process_Count_WO( nWO, cTBL, ThisForm.nConnHandle, cAndSome)

PRIVATE nReturn
nReturn = 0

IF VARTYPE(nWO) != "N"
	TrackError("Bad Parameter","Bad Parameter nWO","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF VARTYPE(cTbl) != "C"
	TrackError("Bad Parameter","Bad Parameter cTbl","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF NOT ( cTBL= "S" OR cTBL= "B" OR cTBL= "W" )
	TrackError("Bad Parameter","Bad cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

IF VARTYPE(cAndSome) != "C"
	cAndSome = ''
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
IF USED('tmpPSTK_CntSP_WO')
	USE IN tmpPSTK_CntSP_WO
ENDIF

PRIVATE cAlias 
cAlias = ALIAS()

SELECT 0
cSQL = "SELECT COUNT(*) AS Cntd FROM "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + " dbo.StockLst_Process "
CASE cTBL = "B"
	cSQL = cSQL + " dbo.BrokerLst_Process "
CASE cTBL = "W"
	cSQL = cSQL + " dbo.WIPLst_Process "
ENDCASE
cSQL = cSQL + " WHERE WO="+STR(nWO)
IF cAndSome == "INCOMING"
	cSQL = cSQL + " AND Process_ID = 'INCOMING'"
ENDIF
IF cAndSome = "INCOMINGNOT2HPA"
	cSQL = cSQL + " AND (Process_ID = 'INCOMING' OR Process_ID = 'NOT2HPA' ) "
ENDIF
IF cAndSome = "SELECTED"
	cSQL = cSQL + " AND ( Process_ID = 'SELECTED' OR Process_ID = 'PARTSELECT') "
ENDIF
*CANCELLED,CORRECTION,INCOMING,NOT2HPA,PARTSELECT ,RECEIVED,SELECTED,Sell Stock,Shipped,SUBED,Receiving,PARTRECV
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_CntSP_WO' )
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_CntSP_WO' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CntSP_WO")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CntSP_WO")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn,nSQLEXEC, 'tmpPSTK_CntSP_WO')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		IF USED('tmpPSTK_CntSP_WO')
			USE IN tmpPSTK_CntSP_WO
		ENDIF
		RETURN 0
	ELSE
		nSQLEXEC  = 1
	ENDIF
ENDIF
IF nSQLEXEC > 0
	IF USED('tmpPSTK_CntSP_WO')
		IF tmpPSTK_CntSP_WO.Cntd > 0
			nReturn = tmpPSTK_CntSP_WO.Cntd
		ENDIF
		USE IN tmpPSTK_CntSP_WO
	ENDIF
ENDIF

IF lNewConn
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nReturn
ENDPROC

********************************** 

PROCEDURE StockLst_Process_Count_WOD 
PARAMETERS nWO_Detail, cTBL, pConnHandle, cAndSome
*nCNTD = StockLst_Process_Count_WOD( nWO_Detail, cTBL, ThisForm.nConnHandle, cAndSome)

PRIVATE nReturn
nReturn = 0

IF VARTYPE(nWO_Detail) != "N"
	TrackError("Bad Parameter","Bad Parameter nWO_Detail","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF VARTYPE(cTbl) != "C"
	TrackError("Bad Parameter","Bad Parameter cTbl","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF NOT ( cTBL= "S" OR cTBL= "B" OR cTBL= "W" )
	TrackError("Bad Parameter","Bad cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

IF VARTYPE(cAndSome) != "C"
	cAndSome = ''
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
IF USED('tmpPSTK_CntSP_WOD')
	USE IN tmpPSTK_CntSP_WOD
ENDIF

PRIVATE cAlias 
cAlias = ALIAS()

SELECT 0
cSQL = "SELECT COUNT(*) AS Cntd FROM "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + " dbo.StockLst_Process "
CASE cTBL = "B"
	cSQL = cSQL + " dbo.BrokerLst_Process "
CASE cTBL = "W"
	cSQL = cSQL + " dbo.WIPLst_Process "
ENDCASE
cSQL = cSQL + " WHERE WO_Detail="+STR(nWO_Detail)

IF cAndSome == "INCOMING"
	cSQL = cSQL + " AND Process_ID = 'INCOMING'"
ENDIF
IF cAndSome = "INCOMINGNOT2HPA"
	cSQL = cSQL + " AND (Process_ID = 'INCOMING' OR Process_ID = 'NOT2HPA' ) "
ENDIF
IF cAndSome = "SELECTED"
	cSQL = cSQL + " AND ( Process_ID = 'SELECTED' OR Process_ID = 'PARTSELECT') "
ENDIF
*CANCELLED,CORRECTION,INCOMING,NOT2HPA,PARTSELECT ,RECEIVED,SELECTED,Sell Stock,Shipped,SUBED,Receiving,PARTRECV
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_CntSP_WOD' )
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_CntSP_WOD' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CntSP_WOD")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CntSP_WOD")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn,nSQLEXEC, 'tmpPSTK_CntSP_WOD')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		IF USED('tmpPSTK_CntSP_WOD')
			USE IN tmpPSTK_CntSP_WOD
		ENDIF
		RETURN 0
	ELSE
		nSQLEXEC  = 1
	ENDIF
ENDIF
IF nSQLEXEC > 0
	IF USED('tmpPSTK_CntSP_WOD')
		IF tmpPSTK_CntSP_WOD.Cntd > 0
			nReturn = tmpPSTK_CntSP_WOD.Cntd
		ENDIF
		USE IN tmpPSTK_CntSP_WOD
	ENDIF
ENDIF

IF lNewConn
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nReturn
ENDPROC

********************************* 
PROC CalcDetail_QTY 
PARAMETERS pID_Detail, pTBL, pConnHandle
*nQTY = CalcDetail_QTY( nID_Detail, cTBL, nConn)

*Calculates S_QTY for ID_Detail passed in
*Do not return NULL, must return at least a 0

IF VARTYPE(pID_Detail) != "N"
	TrackError("Bad Parameter","Bad Parameter pID_Detail","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF VARTYPE(pTBL) != "C"
	TrackError("Bad Parameter","Bad Parameter cTbl","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

PRIVATE cTBL, nID_Detail
cTBL = pTBL
nID_Detail = pID_Detail


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

PRIVATE nQTY 
nQTY = 0

*****
IF NOT "PROC_SQL" $ SET("PROCEDURE")  &&Added for when Quotes is run without HPA menu.
	SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
ENDIF


PRIVATE cAlias 
cAlias = ALIAS()
PRIVATE cSQL, nSQLEXEC 
**
IF USED("tmpPSTK_calc_S_QTY")
	USE IN tmpPSTK_calc_S_QTY
ENDIF

cSQL = "SELECT S_QTY FROM "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + " dbo.StockLst_Detail "
CASE cTBL = "B"
	cSQL = cSQL + " dbo.BrokerLst_Detail "
CASE cTBL = "B"
	cSQL = cSQL + " dbo.WIPLst_Detail "
OTHERWISE
*	cSQL = cSQL + " dbo.StockLst_Master "
ENDCASE
cSQL = cSQL + " WHERE ID_Detail = "+STR(nID_Detail)

SELECT 0
nSQLEXEC = SQLEXEC( nConn, cSQL, 'calc_S_QTY')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_calc_S_QTY')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_calc_S_QTY")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_calc_S_QTY")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_calc_S_QTY')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

IF USED("tmpPSTK_calc_S_QTY")
	IF RECCOUNT('tmpPSTK_calc_S_QTY') > 0
		nQTY = PrepareSQLnum(tmpPSTK_calc_S_QTY.S_QTY,'S_QTY',-5)
	ENDIF
	USE IN tmpPSTK_calc_S_QTY
ENDIF
**

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

***

IF lNewConn 
	 = SQLDISCONNECT(nConn )
ENDIF

RETURN nQTY 
ENDPROC


********************************* 
PROC CalcDetail_LBS 
PARAMETERS pID_Detail, pTBL, pConnHandle
*nLBS = CalcDetail_LBS( nID_Detail, cTBL, nConn)

*Calculates LBS for ID_Detail passed in
*Do not return NULL, must return at least a 0

IF VARTYPE(pID_Detail) != "N"
	TrackError("Bad Parameter","Bad Parameter pID_Detail","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF VARTYPE(pTBL) != "C"
	TrackError("Bad Parameter","Bad Parameter cTbl","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

PRIVATE cTBL, nID_Detail
cTBL = pTBL
nID_Detail = pID_Detail

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

PRIVATE nLBS 
nLBS = 0

*****
IF NOT "PROC_SQL" $ SET("PROCEDURE")  &&Added for when Quotes is run without HPA menu.
	SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
ENDIF


PRIVATE cAlias 
cAlias = ALIAS()
PRIVATE cSQL, nSQLEXEC 
**
IF USED("tmpPSTK_calc_S_QTY")
	USE IN tmpPSTK_calc_S_QTY
ENDIF
cSQL = "SELECT Weight FROM "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + " dbo.StockLst_Detail "
CASE cTBL = "B"
	cSQL = cSQL + " dbo.BrokerLst_Detail "
CASE cTBL = "B"
	cSQL = cSQL + " dbo.WIPLst_Detail "
OTHERWISE
*	cSQL = cSQL + " dbo.StockLst_Master "
ENDCASE
cSQL = cSQL + " WHERE ID_Detail = "+STR(nID_Detail)

SELECT 0
nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_calc_S_QTY')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_calc_S_QTY')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_calc_S_QTY")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_calc_S_QTY")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_calc_S_QTY')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

IF USED("tmpPSTK_calc_S_QTY")
	IF RECCOUNT('tmpPSTK_calc_S_QTY') > 0
		nLBS = PrepareSQLnum(tmpPSTK_calc_S_QTY.Weight,'Weight',9,1)
	ENDIF
	USE IN tmpPSTK_calc_S_QTY
ENDIF
**

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

***

IF lNewConn 
	 = SQLDISCONNECT(nConn )
ENDIF

RETURN nLBS 
ENDPROC



********************************* 
PROC Calc_Weight
PARAMETER pAlloy, pForm, pPC, pDim1, pDim2, pDim3, pConnHandle
*Calculates Pounds for item passed in,  this can be different than QTY depending on form.
*nLBS = Calc_Weight( pAlloy, pForm, pPC, pDim1, pDim2, pDim3, pConn)

IF VARTYPE(pAlloy) != "C"
	TrackError("Bad Parameter","Bad Parameter pAlloy","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF VARTYPE(pForm) != "C"
	TrackError("Bad Parameter","Bad Parameter pForm","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

PRIVATE cAlloy, cForm
cAlloy	 = PrepareSQLtxt(pAlloy,'Alloy',12)
cForm	 = PrepareSQLtxt(pForm,'Form',2)

PRIVATE nPC, nDim1, nDim2, nDim3
nPC	= PrepareSQLnum(pPC,'PC',-3)
nDim1 = PrepareSQLnum(pDim1,'Dim1',10,4)
nDim2 = PrepareSQLnum(pDim2,'Dim2',9,3)
nDim3 = PrepareSQLnum(pDim3,'Dim3',9,3)

PRIVATE nLBS 
nLBS = 0

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



*****
IF NOT "PROC_SQL" $ SET("PROCEDURE")  &&Added for when Quotes is run without HPA menu.
	SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
ENDIF

*Proc_SQL:GetWeight
nLBS = GetWeight(nPC,cAlloy,cForm,nDim1,nDim2,nDim3, nConn)
*****

IF lNewConn 
	 = SQLDISCONNECT(nConn)
ENDIF

RETURN nLBS 
ENDPROC

*********************************

PROC Calc_StockLst_QTY
PARAMETER cAlloy, cForm, cCC, cCL, nThick

*Calc_StockLst_QTY(cAlloy, cForm, cCC, cCL, nThick)
*Calc_StockLst_QTY('HPA N60','10','1',' ', 3.00)  Acct Stnd QTY in StockLst
*Returns Prime QTY in Stock.

IF VARTYPE(cAlloy) != "C"
	*RecordError( 0, 'Calc_StockLst_QTY', 'Proc_StockLst:'+"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No ID" )
	TrackError("No parameter Alloy","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO() )
	RETURN 0
ENDIF
IF VARTYPE(cForm) != "C"
	TrackError("No parameter Form","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO() )
	RETURN 0
ENDIF
IF VARTYPE(cCC) != "C"
	cCC = '1'
ENDIF
IF VARTYPE(cCL) != "C"
	cCL = ' '
ENDIF
IF VARTYPE(nThick) != "N"
	TrackError("No parameter Thickness","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO() )
	RETURN 0
ENDIF


PRIVATE sql_SP
PRIVATE nConn, lNewConn, cSQL
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

IF USED('tmpPSTK_csQTY')
	USE IN tmpPSTK_csQTY
ENDIF

PRIVATE nmS_QTY 
nmS_QTY = 0

IF nConn > 0
	cSQL = "SELECT SUM(ISNULL(SD.S_QTY,0)) AS S_QTY "
*	IF 	cTableName = "STOCKLST"
		cSQL = cSQL + " FROM dbo.StockLst_Master SM "
		cSQL = cSQL + " INNER JOIN dbo.StockLst_Detail SD ON SM.ID=SD.ID "
*	ELSE
*		cSQL = cSQL + " FROM dbo.BrokerLst_Detail "
*	ENDIF
	cSQL = cSQL + " WHERE SM.Alloy = '"+cAlloy+"'"
	cSQL = cSQL + " AND SM.Form = '"+cForm+"'"
*	cSQL = cSQL + " AND SM.CC = '"+cCC+"'"
	cSQL = cSQL + " AND dbo.f_CCStandard(SM.CC) = dbo.f_CCStandard('"+cCC+"') "
	cSQL = cSQL + " AND SM.CL = '"+cCL+"'"
	cSQL = cSQL + " AND SM.Size = "+STR(nThick,9,3)
	cSQL = cSQL + " AND ISNULL(SM.POStatus,'') != 'D'"
*	cSQL = cSQL + " AND ISNULL(SD.Prime,0) = 1"	Not Ready!!!
	cSQL = cSQL + " AND SD.Quarantine = 0"
	cSQL = cSQL + " AND SD.Size_H IS NOT NULL "
	cSQL = cSQL + " AND SD.Size_L IS NOT NULL "

	SELECT 0
	nSQLEXEC = SQLEXEC(nConn,cSQL, 'tmpPSTK_csQTY' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_csQTY' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_csQTY")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_csQTY")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_csQTY')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF lNewConn 
		SQLDISCONNECT(nConn )
	ENDIF
	
	IF USED('tmpPSTK_csQTY')
		IF VARTYPE(tmpPSTK_csQTY.S_QTY) = "N" OR VARTYPE(tmpPSTK_csQTY.S_QTY) = "Y"
			nmS_QTY = tmpPSTK_csQTY.S_QTY
		ELSE
			nmS_QTY = 0
		ENDIF
		USE IN tmpPSTK_csQTY
	ENDIF
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nmS_QTY 
ENDPROC

*********************************

PROC Calc_Master_QTY 
PARAMETER nID, cTBL, pConnHandle
*mS_QTY  = Calc_Master_QTY(nID, cTBL, pConnHandle)
*Progs\Proc_SQL has CalcMasterWeight

IF VARTYPE(nID) != "N"
*	TrackError("Bad Parameter","Bad Parameter pForm","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RecordError( 0, 'Calc_Master_QTY ', "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No ID" )
	RETURN 0
ENDIF
IF VARTYPE(cTBL) != "C"
	cTBL = "S"
ENDIF
cTBL = UPPER(cTBL)
IF NOT ( cTBL= "S" OR cTBL= "B" OR cTBL= "W" )
	TrackError("Bad Parameter","Bad cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF


PRIVATE sql_SP
PRIVATE nConn, lNewConn, cSQL
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

IF USED('tmpPSTK_cmQTY')
	USE IN tmpPSTK_cmQTY
ENDIF

PRIVATE nmS_QTY 
nmS_QTY = 0

IF nConn > 0
	cSQL = "SELECT SUM(S_QTY) AS S_QTY "
	DO CASE
	CASE cTBL = "S"
		cSQL = cSQL + " FROM dbo.StockLst_Detail "
	CASE cTBL= "B"
		cSQL = cSQL + " FROM dbo.BrokerLst_Detail "
	CASE cTBL= "W"
		cSQL = cSQL + " FROM dbo.WIPLst_Detail "
	ENDCASE
	cSQL = cSQL + " WHERE ID = "+ ALLTRIM(STR(nID))

	
	SELECT 0
	nSQLEXEC = SQLEXEC(nConn,cSQL, 'tmpPSTK_cmQTY' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_cmQTY' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_cmQTY")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_cmQTY")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_cmQTY')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF lNewConn 
		SQLDISCONNECT(nConn )
	ENDIF
	
	IF USED('tmpPSTK_cmQTY')
		IF VARTYPE(tmpPSTK_cmQTY.S_QTY) = "N" OR VARTYPE(tmpPSTK_cmQTY.S_QTY) = "Y"
			nmS_QTY = tmpPSTK_cmQTY.S_QTY
		ELSE
			nmS_QTY = 0
		ENDIF
		USE IN tmpPSTK_cmQTY
	ENDIF
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nmS_QTY 
ENDPROC

*********************************
PROCEDURE Cancel_Detail_Process_SOitem 
PARAMETERS pSOitem, pConnHandle
*Cancel_Detail_Process_SOitem(cSOitem,nConnHandle)
*Used in when cancelling a SOitem

cSOitem = PrepareSQLtxt(pSOitem,'SOitem',10)

IF Proper_SO_item(cSOitem) = Proper_SO_item('')
	MESSAGEBOX("Function: Cancel_Detail_Process_SOitem()"+CHR(13)+"No pSOitem Parameter!",0,"Error")
	RecordError(0,"No SOitem Parameter" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),"No SOitem Parameter" )
	RETURN .T.
ENDIF


PRIVATE nConn, lNewConn, cAlias
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

PRIVATE lOK
lOK = .T.

IF USED('tmpPSTK_tID_Detail_Pr')
	USE IN tmpPSTK_tID_Detail_Pr
ENDIF

PRIVATE cSQL, nSQLEXEC
cSQL = "SELECT ID_Detail,ID_Detail_Process, 'S' AS TBL FROM dbo.StockLst_Process "
cSQL = cSQL +" WHERE SOitem = dbo.f_ProperSOitem('"+cSOitem+"')"
cSQL = cSQL +" UNION "
cSQL = cSQL +" SELECT ID_Detail,ID_Detail_Process, 'B' AS TBL FROM dbo.BrokerLst_Process "
cSQL = cSQL +" WHERE SOitem = dbo.f_ProperSOitem('"+cSOitem+"')"
cSQL = cSQL +" UNION "
cSQL = cSQL +" SELECT ID_Detail,ID_Detail_Process, 'W' AS TBL FROM dbo.WIPLst_Process "
cSQL = cSQL +" WHERE SOitem = dbo.f_ProperSOitem('"+cSOitem+"')"

nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_tID_Detail_Pr')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_tID_Detail_Pr' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_tID_Detail_Pr")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_tID_Detail_Pr")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_tID_Detail_Pr')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

IF USED('tmpPSTK_tID_Detail_Pr')
	IF RECCOUNT('tmpPSTK_tID_Detail_Pr') > 0
		SCAN
		IF tmpPSTK_tID_Detail_Pr.ID_Detail_Process > 0
		
			nID_Detail_Process = tmpPSTK_tID_Detail_Pr.ID_Detail_Process
			cTBL = tmpPSTK_tID_Detail_Pr.TBL
			
			IF Remove_ID_Detail_Process(nID_Detail_Process, "SOitem", cSOitem, cTBL, nConn, 'CANCELLED')

			ELSE
				lOK=.F.
			ENDIF
		ENDIF
		ENDSCAN
	ENDIF
	USE IN tmpPSTK_tID_Detail_Pr
ENDIF

IF lNewConn 
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF	
			
RETURN lOK
ENDPROC

********************************* 
PROCEDURE Cancel_Detail_Process_POitem
PARAMETERS pPOitem, pConnHandle
*Cancel_Detail_Process_POitem(cPOitem,nConnHandle)
*Used in when cancelling a POitem


IF NOT "PROC_SQL" $ SET("PROCEDURE")  &&Added for when Quotes is run without HPA menu.
	SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
ENDIF

cPOitem = PrepareSQLtxt(pPOitem,'POitem',12)

IF Proper_PO_item(cPOitem) = Proper_PO_item('')
	MESSAGEBOX("Function: Cancel_Detail_Process_POitem()"+CHR(13)+"No pPOitem Parameter!",0,"Error")
	RecordError(0,"No POitem Parameter" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),"No pPOitem Parameter" )
	RETURN .T.
ENDIF


PRIVATE nConn, lNewConn, cAlias
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

PRIVATE lOK
lOK = .T.

IF USED('tmpPSTK_tID_D_Pr')
	USE IN tmpPSTK_tID_D_Pr
ENDIF

PRIVATE cSQL, nSQLEXEC
cSQL = "SELECT ID_Detail_Process, 'S' AS TBL FROM dbo.StockLst_Process "
cSQL = cSQL +" WHERE PO_item = dbo.f_ProperPOitem('"+cPOitem+"')"
cSQL = cSQL +" UNION "
cSQL = cSQL +" SELECT ID_Detail_Process, 'B' AS TBL FROM dbo.BrokerLst_Process "
cSQL = cSQL +" WHERE PO_item = dbo.f_ProperPOitem('"+cPOitem+"')"
cSQL = cSQL +" UNION "
cSQL = cSQL +" SELECT ID_Detail_Process, 'W' AS TBL FROM dbo.WIPLst_Process "
cSQL = cSQL +" WHERE PO_item = dbo.f_ProperPOitem('"+cPOitem+"')"

nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_tID_D_Pr')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_tID_D_Pr' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_tID_D_Pr")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_tID_D_Pr")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_tID_D_Pr')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

IF USED('tmpPSTK_tID_D_Pr')
	IF RECCOUNT('tmpPSTK_tID_D_Pr') > 0
		SCAN
		IF tmpPSTK_tID_D_Pr.ID_Detail_Process > 0
		
			nID_Detail_Process = tmpPSTK_tID_D_Pr.ID_Detail_Process
			cTBL = tmpPSTK_tID_D_Pr.TBL
			
			*Does this PO stock have anything Selected off it!



*			cSQL = "SELECT ID_Detail_Process, 'S' AS TBL FROM dbo.StockLst_Process "
*			cSQL = cSQL +" WHERE PO_item = dbo.f_ProperPOitem('"+cPOitem+"')"
*			cSQL = cSQL +" UNION "
*			cSQL = cSQL +" SELECT ID_Detail_Process, 'B' AS TBL FROM dbo.BrokerLst_Process
			
			
			
			IF Remove_ID_Detail_Process(nID_Detail_Process, 'POitem', cPOitem, cTBL, nConn, 'CANCELLED')
				
			ELSE
				lOK=.F.
			ENDIF
		ENDIF
		ENDSCAN
	ENDIF
	USE IN tmpPSTK_tID_D_Pr
ENDIF

IF lNewConn 
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF	
			
RETURN lOK
ENDPROC
*********************************


*********************************

PROCEDURE Cancel_Detail_Process_WO 
PARAMETERS pWO, pConnHandle
*Cancel_Detail_Process_WO(nWO,nConnHandle)
*Used in when cancelling a WO
*Removes Process

PRIVATE nWO
nWO = PrepareSQLnum(pWO,'WO',-3)

IF nWO = 0
	MESSAGEBOX("Function: Cancel_Detail_Process_WO()"+CHR(13)+"No pWO Parameter!",0,"Error")
	TrackError("Bad Parameter","Bad Parameter WO","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
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

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE lOK
lOK = .T.

IF USED('tmpPSTK_tID_Detail_Pr')
	USE IN tmpPSTK_tID_Detail_Pr
ENDIF

PRIVATE cSQL, nSQLEXEC
cSQL = "SELECT ID_Detail_Process, 'S' AS TBL FROM dbo.StockLst_Process "
cSQL = cSQL +" WHERE WO = "+STR(nWO)
cSQL = cSQL +" UNION "
cSQL = cSQL +" SELECT ID_Detail_Process, 'B' AS TBL FROM dbo.BrokerLst_Process "
cSQL = cSQL +" WHERE WO = "+STR(nWO)
cSQL = cSQL +" UNION "
cSQL = cSQL +" SELECT ID_Detail_Process, 'W' AS TBL FROM dbo.WIPLst_Process "
cSQL = cSQL +" WHERE WO = "+STR(nWO)

nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_tID_Detail_Pr')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_tID_Detail_Pr' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_tID_Detail_Pr")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_tID_Detail_Pr")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_tID_Detail_Pr')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

IF USED('tmpPSTK_tID_Detail_Pr')
	IF RECCOUNT('tmpPSTK_tID_Detail_Pr') > 0
		SCAN
		IF tmpPSTK_tID_Detail_Pr.ID_Detail_Process > 0
		
			nID_Detail_Process = tmpPSTK_tID_Detail_Pr.ID_Detail_Process
			cTBL = tmpPSTK_tID_Detail_Pr.TBL
			
			IF Remove_ID_Detail_Process(nID_Detail_Process, "WO", nWO, cTBL, nConn, 'CANCELLED')
				
			ELSE
				lOK=.F.
			ENDIF
		ENDIF
		ENDSCAN
	ENDIF
	USE IN tmpPSTK_tID_Detail_Pr
ENDIF

IF lNewConn 
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF	
			
RETURN lOK
ENDPROC

*********************************

PROCEDURE Remove_Stock_listed_POitem
PARAMETERS pPOitem, pConnHandle
*Remove_Stock_listed_POitem(cPOitem,nConnHandle)
*Used in when cancelling a POitem
*Removes Stock and Broker INCOMMING and SELECT Process
*-* A PurchaseOrder Trigger should be deleting this, So do not expect to see data deleted here.

IF NOT "PROC_SQL" $ SET("PROCEDURE")  &&Added for when Quotes is run without HPA menu.
	SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
ENDIF

cPOitem = PrepareSQLtxt(pPOitem,'POitem',12)

IF Proper_PO_item(cPOitem) = Proper_PO_item('')
	MESSAGEBOX("Function: Cancel_Detail_Process_POitem()"+CHR(13)+"No pPOitem Parameter!",0,"Error")
	RecordError(0,"No POitem Parameter" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),"No pPOitem Parameter" )
	RETURN .T.
ENDIF


PRIVATE nConn, lNewConn, cAlias
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

PRIVATE lOK
lOK = .T.

IF USED('tmpPSTK_tID_D_Pr')
	USE IN tmpPSTK_tID_D_Pr
ENDIF

PRIVATE cSQL, nSQLEXEC
cSQL = "SELECT ID_Detail,ID_Detail_Process, 'S' AS TBL FROM dbo.StockLst_Process "
cSQL = cSQL +" WHERE PO_item = dbo.f_ProperPOitem('"+cPOitem+"')"
cSQL = cSQL +" UNION "
cSQL = cSQL +" SELECT ID_Detail,ID_Detail_Process, 'B' AS TBL FROM dbo.BrokerLst_Process "
cSQL = cSQL +" WHERE PO_item = dbo.f_ProperPOitem('"+cPOitem+"')"
cSQL = cSQL +" UNION "
cSQL = cSQL +" SELECT ID_Detail,ID_Detail_Process, 'W' AS TBL FROM dbo.WIPLst_Process "
cSQL = cSQL +" WHERE PO_item = dbo.f_ProperPOitem('"+cPOitem+"')"

nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_tID_D_Pr')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_tID_D_Pr' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_tID_D_Pr")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_tID_D_Pr")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_tID_D_Pr')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

IF USED('tmpPSTK_tID_D_Pr')
	IF RECCOUNT('tmpPSTK_tID_D_Pr') > 0
		PRIVATE nID_Detail, nID_Detail_Process, cTBL
		SCAN
		IF tmpPSTK_tID_D_Pr.ID_Detail_Process > 0
		
			nID_Detail 			= tmpPSTK_tID_D_Pr.ID_Detail
			nID_Detail_Process  = tmpPSTK_tID_D_Pr.ID_Detail_Process
			cTBL 				= tmpPSTK_tID_D_Pr.TBL
			
			IF Remove_ID_Detail_Process(nID_Detail_Process, 'POitem', cPOitem, cTBL, nConn, 'CANCELLED')
				*This is called earlier in PurchaseOrder_POitem_Remove_StockLst.
				*If this is OK, then continue removing Process, Detail and Master.
							
			ELSE
				lOK=.F.
				EXIT
			ENDIF
			
		ENDIF
		ENDSCAN
	ENDIF
	USE IN tmpPSTK_tID_D_Pr
ENDIF

IF lNewConn 
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF	
			
RETURN lOK
ENDPROC
*********************************

PROC Remove_ID_Detail_Process 
PARAMETER pID_Detail_Process, pOrderType, pOrderNumber, pTbl, pConnHandle, cWhat
*lOK = Remove_ID_Detail_Process(nID_Detail_Process, pOrderType, pOrderNumber ,cTbl,pConnHandle,pWhat)
*Also used in Shop_StockLst_Edit
*Used in Modify_StockLst_Detail.scx
*INSERT INTO dbo.StockLst_Process_Detail a WHY record before Deleteing Process

IF TYPE("pID_Detail_Process") != "N"
	MESSAGEBOX("Function: Remove_ID_Detail_Process()"+CHR(13)+"No pID_Detail_Process, pSOitem or pTbl Parameter!",0,"Error")
	*\Progs\ErrorHandlerlog(0,"No pID_Detail_Process, pSOitem or pTbl Parameter","No pID_Detail_Process, pSOitem or pTbl Parameter","Proc_StockLst:Remove_ID_Detail_Process",LINENO())
	RecordError(0,"No pID_Detail_Process, pSOitem or pTbl Parameter" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),"No pID_Detail_Process" )
	RETURN .F.
ENDIF

PRIVATE nID_Detail_Process

IF NOT "PROC_SQL" $ SET("PROCEDURE")  &&Added for when Quotes is run without HPA menu.
	SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
ENDIF

IF VARTYPE(pOrderType) != "C"
	MESSAGEBOX("Function: Remove_ID_Detail_Process()"+CHR(13)+"No pOrderType Parameter!",0,"Error")
	RecordError(0,"No pOrderType  Parameter" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),"No pOrderType " )
	RETURN .F.
ELSE
	PRIVATE nID_Detail_Process 
	nID_Detail_Process = PrepareSQLnum(pID_Detail_Process,"ID_Detail_Process",-3)
ENDIF

PRIVATE cOrderType, cOrderNumber, nOrderNumber
cOrderType	= PrepareSQLtxt(pOrderType,'OrderType',10)


cWhat = PrepareSQLtxt(cWhat,"WHAT",-1)

DO CASE
CASE cOrderType = "SOitem"
	cOrderNumber = PrepareSQLtxt(pOrderNumber,"SOitem",10)
	nOrderNumber = 0
CASE cOrderType = "POitem"
	cOrderNumber = PrepareSQLtxt(pOrderNumber,"POitem",12)
	nOrderNumber = 0
CASE cOrderType = "WO"
	cOrderNumber = ''
	nOrderNumber = PrepareSQLnum(pOrderNumber,'WO',-3)
OTHERWISE
	IF cWhat = "CORRECTION" OR cWhat = "CANCELLED"
		cOrderType = "CORRECTION"
		cOrderNumber = ''
		nOrderNumber = 0
	ELSE
		MESSAGEBOX("Function: Remove_ID_Detail_Process()"+CHR(13)+"No pOrderType Parameter!",0,"Error")
		*RecordError(0,"No pOrderType Parameter" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),"No pOrderType Parameter" )
		TrackError("No pOrderType Parameter"+CHR(13)+"Function: Remove_ID_Detail_Process()" ,"Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
		RETURN .F.
	ENDIF
ENDCASE


PRIVATE cTBL
cTBL = UPPER(PrepareSQLtxt(pTBL,"TBL",1))
DO CASE
CASE cTBL = "S"
CASE cTBL = "B"
CASE cTBL = "W"
OTHERWISE
	MESSAGEBOX("Function: Remove_ID_Detail_Process()"+CHR(13)+"No TBL Parameter!",0,"Error")
	RecordError(0,"No TBL Parameter" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),"No TBL Parameter" )
	RETURN .F.
ENDCASE

PRIVATE cSQLid, nSQLEXEC
PRIVATE nConn, lNewConn, cAlias
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

PRIVATE lOK
lOK = .T.

*----------------------------
PRIVATE lTranAlreadySet, nProp 
nProp = SQLGETPROP(nConn, 'Transactions')
lTranAlreadySet = (nProp = 2)
		
IF NOT lTranAlreadySet
	= SQLSETPROP(nConn, 'Transactions', 2)  && 1Auto 2Manual transactions
ENDIF

*seed the _Detail properties
DO CASE
CASE cTBL = "S"
	cSQLid = "INSERT INTO dbo.StockLst_Process_Detail "
	cSQLid = cSQLid+ "(ID, ID_Detail, ID_Detail_Process, What, SOitem, WO ) "
	cSQLid = cSQLid+ " SELECT dbo.f_Get_StockLst_ID(SP.ID_Detail) AS ID "
	cSQLid = cSQLid+ ",SP.ID_Detail, SP.ID_Detail_Process "
	cSQLid = cSQLid+ ",'"+cWhat+"' AS [What]"
	cSQLid = cSQLid+ ", dbo.f_ProperSOitem(SP.SOitem) AS SOitem, SP.WO "
	cSQLid = cSQLid+ " FROM dbo.StockLst_Process SP "
	cSQLid = cSQLid+ " WHERE SP.ID_Detail_Process = "+STR(nID_Detail_Process)
CASE cTBL = "B"
	cSQLid = "INSERT INTO dbo.BrokerLst_Process_Detail "
	cSQLid = cSQLid+ "(ID, ID_Detail, ID_Detail_Process, What, SOitem, WO ) "
	cSQLid = cSQLid+ " SELECT dbo.f_Get_BrokerLst_ID(SP.ID_Detail) AS ID "
	cSQLid = cSQLid+ ",SP.ID_Detail, SP.ID_Detail_Process "
	cSQLid = cSQLid+ ",'"+cWhat+"' AS [What]"
	cSQLid = cSQLid+ ", dbo.f_ProperSOitem(SP.SOitem) AS SOitem, SP.WO "
	cSQLid = cSQLid+ " FROM dbo.BrokerLst_Process SP "
	cSQLid = cSQLid+ " WHERE SP.ID_Detail_Process = "+STR(nID_Detail_Process)
CASE cTBL = "W"
	cSQLid = "INSERT INTO dbo.WIPLst_Process_Detail "
	cSQLid = cSQLid+ "(ID, ID_Detail, ID_Detail_Process, What, SOitem, WO ) "
	cSQLid = cSQLid+ " SELECT dbo.f_Get_BrokerLst_ID(SP.ID_Detail) AS ID "
	cSQLid = cSQLid+ ",SP.ID_Detail, SP.ID_Detail_Process "
	cSQLid = cSQLid+ ",'"+cWhat+"' AS [What]"
	cSQLid = cSQLid+ ", dbo.f_ProperSOitem(SP.SOitem) AS SOitem, SP.WO "
	cSQLid = cSQLid+ " FROM dbo.WIPLst_Process SP "
	cSQLid = cSQLid+ " WHERE SP.ID_Detail_Process = "+STR(nID_Detail_Process)
ENDCASE

nSQLEXEC = SQLEXEC(nConn, cSQLid )
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQLid )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQLid, nConn, nSQLEXEC)
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQLid )
		
		IF NOT lTranAlreadySet
			SQLROLLBACK(nConn)
		ENDIF
		
		PRIVATE cMess
		cMess = "Proc_StockLst:Remove_ID_Detail_Process."+CHR(13)
		DO CASE
		CASE cOrderType = "SOitem"
			cMess=cMess+ HTML_SOitem(cOrderNumber,.F.)
		CASE cOrderType = "POitem"
			cMess=cMess+ HTML_POitem(cOrderNumber,.F.)
		CASE cOrderType = "WO"
			cMess=cMess+ HTML_WO(nOrderNumber,.F.)
		CASE cOrderType = "CORRECTION"
			cMess=cMess+ "CORRECTION"
		ENDCASE
		
		cMess=cMess+CHR(13)+cSQLid+CHR(13)+ALLTRIM(SYS(0))+"." +CHR(13)+"Proc_StockLst:Remove_ID_Detail_Process()"
		
		*Do not hold up the Transaction with an Email send!
		*Send_HTML_Email( 'Admin@hpalloy.com',get_Server_Email(),'HPA App Alert', cMess, nConn,.T.,.F.)
		lOK =.F.
	ELSE
		nSQLEXEC = 1
	ENDIF
ENDIF
*--------------------------

PRIVATE cSQLd, cSQL
cSQLd= ''
cSQL = ''

IF lOK
	DO CASE
	CASE cTBL = "S"
		cSQLd = "DELETE FROM dbo.StockLst_Process "
	CASE cTBL = "B"
		cSQLd = "DELETE FROM dbo.BrokerLst_Process "
	CASE cTBL = "W"
		cSQLd = "DELETE FROM dbo.WIPLst_Process "
	ENDCASE
	cSQLd  = cSQLd + " WHERE ID_Detail_Process = "+ALLTRIM(STR(nID_Detail_Process))
	
	nSQLEXEC = SQLEXEC(nConn, cSQLd)
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQLd)
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQLd, "")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQLd, "")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQLd, nConn, nSQLEXEC, '')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQLd )
			lOK = .F.
			RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Failed to Delete ID_Detail_Process."+CHR(13)+cSQLd )
		ELSE 
			nSQLEXEC = 1
		ENDIF
	ENDIF
	
	IF nSQLEXEC > 0
		WAIT WINDOW "Deleted Process!" NOWAIT
		*See if another Table show a Process as marked
		
		DO CASE
		CASE cOrderType = "SOitem"
			PRIVATE cSOitem
			cSOitem = cOrderNumber
			
			IF USED('tmpPSTK_cntSales_5')
				USE IN tmpPSTK_cntSales_5
			ENDIF

			*PRIVATE cSQL 
			cSQL = "SELECT COUNT(*) AS Cntd FROM dbo.Sales WITH(NOLOCK) "
			cSQL = cSQL +" WHERE SOitem = dbo.f_ProperSOitem('"+cSOitem+"')"
			cSQL = cSQL +" AND ( Inv=1 OR GFM=1 OR Roll=1 OR Mach=1 OR CG=1 OR Plasma=1 )"

			nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_cntSales_5')

			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL' TIMEOUT 1
				nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_cntSales_5' )
			ENDDO
			IF nSQLEXEC < 0 &&Try again!
				nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_cntSales_5")
				DO WHILE nSQLEXEC = 0
					WAIT WINDOW 'SQL 2' TIMEOUT 1
					nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_cntSales_5")
					
					IF nSQLEXEC < 0
						IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
							nSQLEXEC = 0
						ENDIF
					ENDIF
				ENDDO
			ENDIF
			IF nSQLEXEC < 0
				IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_cntSales_5')
					RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
				ENDIF
			ENDIF
			
			IF Proper_SO_Item(cSOItem) = Proper_SO_Item("")
				RecordTest("Record Test Data.", PROGRAM(), LINENO(1),"cOrderType = SOitem, but cSOitem is Empty in Remove_ID_Detail_Process() "+CHR(13)+cSQL ) 
			ELSE
				IF USED('tmpPSTK_cntSales_5')
					IF tmpPSTK_cntSales_5.Cntd > 0
						*UPDATE Sales SET prcp = .T., prcd = .F. WHERE SOitem = (cSOitem)
						Update_PrcpPrcdinSales( .T.,.F.,cSOitem, nConn )
					ELSE
						*UPDATE Sales SET prcp = .F., prcd = .T. WHERE SOitem = (cSOitem)
						Update_PrcpPrcdinSales( .F.,.T.,cSOitem, nConn )
					ENDIF
					USE IN tmpPSTK_cntSales_5
				ELSE
					*UPDATE Sales SET prcp = .F., prcd = .T. WHERE SOitem = (cSOitem)
					Update_PrcpPrcdinSales( .F.,.T.,cSOitem, nConn )
				ENDIF
			ENDIF
		
		CASE cOrderType = "POitem"
			PRIVATE cPOitem
			cPOitem = cOrderNumber
			
			IF USED('tmpPSTK_cntSales_5')
				USE IN tmpPSTK_cntSales_5
			ENDIF

			*PRIVATE cSQL 
			cSQL = "SELECT COUNT(*) AS Cntd FROM dbo.PurchaseOrder WITH(NOLOCK) "
			cSQL = cSQL +" WHERE POitem = dbo.f_ProperPOitem('"+cPOitem+"')"

			nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_cntSales_5')

			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL' TIMEOUT 1
				nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_cntSales_5' )
			ENDDO
			IF nSQLEXEC < 0 &&Try again!
				nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_cntSales_5")
				DO WHILE nSQLEXEC = 0
					WAIT WINDOW 'SQL 2' TIMEOUT 1
					nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_cntSales_5")
					
					IF nSQLEXEC < 0
						IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
							nSQLEXEC = 0
						ENDIF
					ENDIF
				ENDDO
			ENDIF
			IF nSQLEXEC < 0
				IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_cntSales_5')
					RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
				ENDIF
			ENDIF
		
			IF USED('tmpPSTK_cntSales_5')
				IF tmpPSTK_cntSales_5.Cntd > 0
					*Found POitem
					*Update_PrcpPrcdinSales( .T.,.F.,cSOitem, nConn )
				ELSE
					*Did not Find
				ENDIF
				USE IN tmpPSTK_cntSales_5
			ENDIF						
			
		CASE cOrderType = "WO"
			*PRIVATE cSQL 
			cSQL = "SELECT COUNT(*) AS Cntd FROM dbo.WorkOrder WITH(NOLOCK) "
			cSQL = cSQL +" WHERE WO = "+STR(nOrderNumber)

			nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_cntSales_5')

			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL' TIMEOUT 1
				nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_cntSales_5' )
			ENDDO
			IF nSQLEXEC < 0 &&Try again!
				nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_cntSales_5")
				DO WHILE nSQLEXEC = 0
					WAIT WINDOW 'SQL 2' TIMEOUT 1
					nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_cntSales_5")
					
					IF nSQLEXEC < 0
						IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
							nSQLEXEC = 0
						ENDIF
					ENDIF
				ENDDO
			ENDIF
			IF nSQLEXEC < 0
				IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_cntSales_5')
					RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
				ENDIF
			ENDIF
		
			IF USED('tmpPSTK_cntSales_5')
				IF tmpPSTK_cntSales_5.Cntd > 0
					*Found WO
					*Update_PrcpPrcdinSales( .T.,.F.,cSOitem, nConn )
				ELSE
					*Did not Find
				ENDIF
				USE IN tmpPSTK_cntSales_5
			ENDIF						
			*
			*
			*
		CASE cOrderType = "CORRECTION"
			cSQL = "cOrderType = 'CORRECTION'"
		ENDCASE
		
	ENDIF
	IF lOK	
		IF NOT lTranAlreadySet
			= SQLCOMMIT(nConn)
		ENDIF
*		Send_HTML_Email( 'Admin@hpalloy.com',get_Server_Email(),'HPA App Alert', cMess, nConn,.T.,.F.)
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(1),cSQL )
	ENDIF
ENDIF
IF lOK
	IF NOT lTranAlreadySet
		= SQLSETPROP(nConn, 'Transactions', 1)  && 1Auto 2Manual transactions
	ENDIF
ELSE
	IF NOT lTranAlreadySet
		= SQLROLLBACK(nConn)
	ENDIF
ENDIF


IF lNewConn 
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lOK
ENDPROC

**********************************
	
PROCEDURE Get_TBL_by_ReceivingID 
PARAMETERS pnReceiveID, pConnHandle

*cTBL = Get_TBL_by_ReceivingID(nReceivingID,ThisForm.nConnHandle)


IF VARTYPE(pnReceiveID) != "N"
	TrackError("Bad Parameter","Bad Parameter pnReceiveID","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
	ENDIF
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_TBL')
	USE IN tmpPSTK_TBL
ENDIF

PRIVATE cTBL
cTBL = ''

PRIVATE cSQL, nSQLEXEC
cSQL = ''

cSQL = "SELECT 'S' as TBL FROM dbo.StockLst_Detail WHERE ReceivingID = "+ALLTRIM(STR( pnReceiveID ))
cSQL = cSQL + " UNION "
cSQL = cSQL + "SELECT 'B' as TBL FROM dbo.BrokerLst_Detail WHERE ReceivingID = "+ALLTRIM(STR( pnReceiveID ))
cSQL = cSQL + " UNION "
cSQL = cSQL + "SELECT 'W' as TBL FROM dbo.WIPLst_Detail WHERE ReceivingID = "+ALLTRIM(STR( pnReceiveID ))

IF nConn > 0 AND LEN(cSQL) > 0
	SELECT 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_TBL' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_TBL' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_TBL")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_TBL")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_TBL')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_TBL')
		IF RECCOUNT('tmpPSTK_TBL') > 0
			cTBL = PrepareSQLtxt(tmpPSTK_TBL.TBL,'TBL',1)
		ENDIF
		USE IN tmpPSTK_TBL
	ENDIF
	IF nConn != pConnHandle
		SQLDISCONNECT( nConn )
	ENDIF

ELSE
	*Error on Connection String
	IF LEN(cSQL) > 0
		TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:Get_TBL_by_ReceivingID",LINENO())
	ENDIF
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

*IF lNewConn 
*	SQLDISCONNECT(nConn )
*ENDIF

RETURN cTBL

ENDPROC

**********************************
	
PROCEDURE Get_ID_Detail_by_ReceivingID 
PARAMETERS pnReceiveID, cTBL, pConnHandle

*nID_Detail = Get_ID_Detail_by_ReceivingID(pnReceivingID,"S",ThisForm.nConnHandle)


IF VARTYPE(pnReceiveID) != "N"
	TrackError("Bad Parameter","Bad Parameter pnReceiveID","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF VARTYPE(cTBL) != "C"
	*TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF NOT ( cTBL= "S" OR cTBL= "B" OR cTBL= "W" )
	*TrackError("Bad Parameter","Bad cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF


IF UPPER(cTBL) = "STOCKLST"
	cTBL = "S"
ENDIF
IF UPPER(cTBL) = "BROKERLST"
	cTBL = "B"
ENDIF
IF UPPER(cTBL) = "WIPLST"
	cTBL = "W"
ENDIF

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
	ENDIF
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_ID_Detail')
	USE IN tmpPSTK_ID_Detail
ENDIF

PRIVATE nID_Detail
nID_Detail = 0

PRIVATE cSQL, nSQLEXEC
cSQL = ''

DO CASE
CASE cTBL = "S"
	cSQL = "SELECT ID_Detail FROM dbo.StockLst_Detail WHERE ReceivingID = "+ALLTRIM(STR( pnReceiveID ))
CASE cTBL = "B"
	cSQL = "SELECT ID_Detail FROM dbo.BrokerLst_Detail WHERE ReceivingID = "+ALLTRIM(STR( pnReceiveID ))
CASE cTBL = "W"
	cSQL = "SELECT ID_Detail FROM dbo.WIPLst_Detail WHERE ReceivingID = "+ALLTRIM(STR( pnReceiveID ))
OTHERWISE
	cSQL = ''
	*TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
ENDCASE

IF nConn > 0 AND LEN(cSQL) > 0
	SELECT 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_ID_Detail' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_ID_Detail' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_ID_Detail")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_ID_Detail")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_ID_Detail')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_ID_Detail')
		IF VARTYPE(tmpPSTK_ID_Detail.ID_Detail) = "N"
			nID_Detail = tmpPSTK_ID_Detail.ID_Detail
		ENDIF
		USE IN tmpPSTK_ID_Detail
	ENDIF
	IF nConn != pConnHandle
		SQLDISCONNECT( nConn )
	ENDIF

ELSE
	*Error on Connection String
	IF LEN(cSQL) > 0
		TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:Get_ID_Detail_by_ReceivingID",LINENO())
	ENDIF
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

*IF lNewConn 
*	SQLDISCONNECT(nConn )
*ENDIF

RETURN nID_Detail 

ENDPROC
**********************************
	
PROCEDURE Get_ID_Detail_Process_by_ReceivingID 
PARAMETERS pnReceiveID, cTBL, pConnHandle

*nID_Detail_Process = Get_ID_Detail_Process_by_ReceivingID(pnReceivingID,"S",ThisForm.nConnHandle)


IF VARTYPE(pnReceiveID) != "N"
	TrackError("Bad Parameter","Bad Parameter pnReceiveID","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF VARTYPE(cTBL) != "C"
	*TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF NOT ( cTBL= "S" OR cTBL= "B" OR cTBL= "W" )
	*TrackError("Bad Parameter","Bad cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF


IF UPPER(cTBL) = "STOCKLST"
	cTBL = "S"
ENDIF
IF UPPER(cTBL) = "BROKERLST"
	cTBL = "B"
ENDIF
IF UPPER(cTBL) = "WIPLST"
	cTBL = "W"
ENDIF

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
	ENDIF
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_ID_Detail')
	USE IN tmpPSTK_ID_Detail
ENDIF

PRIVATE nID_Detail_Process
nID_Detail_Process = 0

PRIVATE cSQL, nSQLEXEC
cSQL = ''

DO CASE
CASE cTBL = "S"
	cSQL = "SELECT TOP 1 "
	cSQL = cSQL+" P.ID_Detail_Process "
	cSQL = cSQL+" FROM HPAlloy_Archive.dbo.StockLst_Process_History P "
	cSQL = cSQL+" INNER JOIN HPAlloy_Archive.dbo.StockLst_Detail_History D ON P.ID_Detail = D.ID_Detail "
	cSQL = cSQL+" WHERE P.Process_ID='INCOMING  '"
	cSQL = cSQL+" AND P.[what] = 'ADD' "
	cSQL = cSQL+" AND D.ReceivingID = "+ALLTRIM(STR( pnReceiveID ))
CASE cTBL = "B"
	cSQL = "SELECT TOP 1 "
	cSQL = cSQL+" P.ID_Detail_Process "
	cSQL = cSQL+" FROM HPAlloy_Archive.dbo.BrokerLst_Process_History P "
	cSQL = cSQL+" INNER JOIN HPAlloy_Archive.dbo.BrokerLst_Detail_History D ON P.ID_Detail = D.ID_Detail "
	cSQL = cSQL+" WHERE P.Process_ID='INCOMING  '"
	cSQL = cSQL+" AND P.[what] = 'ADD' "
	cSQL = cSQL+" AND D.ReceivingID = "+ALLTRIM(STR( pnReceiveID ))

CASE cTBL = "W"
	cSQL = "SELECT TOP 1 "
	cSQL = cSQL+" P.ID_Detail_Process "
	cSQL = cSQL+" FROM HPAlloy_Archive.dbo.WIPLst_Process_History P "
	cSQL = cSQL+" INNER JOIN HPAlloy_Archive.dbo.WIPLst_Detail_History D ON P.ID_Detail = D.ID_Detail "
	cSQL = cSQL+" WHERE P.Process_ID='INCOMING  '"
	cSQL = cSQL+" AND P.[what] = 'ADD' "
	cSQL = cSQL+" AND D.ReceivingID = "+ALLTRIM(STR( pnReceiveID ))

OTHERWISE
	cSQL = ''
	*TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
ENDCASE

IF nConn > 0 AND LEN(cSQL) > 0
	SELECT 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_ID_Detail' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_ID_Detail' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_ID_Detail")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_ID_Detail")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_ID_Detail')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_ID_Detail')
		IF RECCOUNT('tmpPSTK_ID_Detail') > 0
			nID_Detail_Process = PrepareSQLnum(tmpPSTK_ID_Detail.ID_Detail_Process,'ID_Detail_Process',-3)
		ENDIF
		USE IN tmpPSTK_ID_Detail
	ENDIF
	IF nConn != pConnHandle
		SQLDISCONNECT( nConn )
	ENDIF

ELSE
	*Error on Connection String
	IF LEN(cSQL) > 0
		TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:Get_ID_Detail_by_ReceivingID",LINENO())
	ENDIF
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

*IF lNewConn 
*	SQLDISCONNECT(nConn )
*ENDIF

RETURN nID_Detail_Process

ENDPROC

********************************** 
	
PROCEDURE Get_ID_Master_by_ReceivingID 
PARAMETERS pnReceiveID, cTBL, pConnHandle

*ID=Get_ID_Master_by_ReceivingID(pnReceivingID,"S",ThisForm.nConnHandle)


IF VARTYPE(pnReceiveID) != "N"
	TrackError("Bad Parameter RID","Bad Parameter RID","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter cTBL","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF NOT ( cTBL= "S" OR cTBL= "B" OR cTBL= "W" )
	TrackError("Bad Parameter","Bad cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

DO CASE
CASE UPPER(LEFT(cTBL,1)) = "S"
	cTBL = "S"
CASE UPPER(LEFT(cTBL,1)) = "B"
	cTBL = "B"
CASE UPPER(LEFT(cTBL,1)) = "W"
	cTBL = "W"
CASE UPPER(LEFT(cTBL,1)) = "N"
	RETURN 0
OTHERWISE
	TrackError("Bad Parameter, unknown cTBL","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDCASE

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
	ENDIF
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF

nConn = CheckSQLConnection(nConn)

PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_ID')
	USE IN tmpPSTK_ID
ENDIF

PRIVATE nID
nID = 0

PRIVATE cSQL, nSQLEXEC
DO CASE
CASE cTBL = "S"
	cSQL = "SELECT ID FROM dbo.StockLst_Detail WHERE ReceivingID = "+ALLTRIM(STR( pnReceiveID ))
CASE cTBL = "B"
	cSQL = "SELECT ID FROM dbo.BrokerLst_Detail WHERE ReceivingID = "+ALLTRIM(STR( pnReceiveID ))
CASE cTBL = "W"
	cSQL = "SELECT ID FROM dbo.WIPLst_Detail WHERE ReceivingID = "+ALLTRIM(STR( pnReceiveID ))
ENDCASE

IF nConn > 0
	SELECT 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_ID' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_ID' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_ID")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_ID")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF

	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_ID')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_ID')
		IF VARTYPE(tmpPSTK_ID.ID) = "N"
			nID = tmpPSTK_ID.ID
		ENDIF
		USE IN tmpPSTK_ID
	ENDIF
	IF nConn != pConnHandle
		SQLDISCONNECT( nConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:Get_ID_Master_by_ReceivingID",LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nID 

ENDPROC

********************************** 
	
PROCEDURE Get_ID_Detail_Prc_by_Received_hist
PARAMETERS cTBL, pnID_Detail, pConnHandle

IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF NOT ( cTBL= "S" OR cTBL= "B" OR cTBL= "W" )
	TrackError("Bad Parameter","Bad cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

IF VARTYPE(pnID_Detail) != "N"
	TrackError("Bad Parameter","Bad Parameter ID_Detail","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF


IF UPPER(LEFT(cTBL,1)) = "S"
	cTBL = "S"
ENDIF
IF UPPER(LEFT(cTBL,1)) = "B"
	cTBL = "B"
ENDIF
IF UPPER(LEFT(cTBL,1)) = "W"
	cTBL = "W"
ENDIF

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
	ENDIF
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF

nConn = CheckSQLConnection(nConn)

PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_ID')
	USE IN tmpPSTK_ID
ENDIF

PRIVATE nID_Detail_Process
nID_Detail_Process = 0

PRIVATE cSQL, nSQLEXEC
cSQL = "SELECT ID_Detail_Process FROM "
DO CASE
CASE cTBL = "S"
	cSQL=cSQL+" HPAlloy_Archive.dbo.Stocklst_Detail_History "
CASE cTBL = "B"
	cSQL=cSQL+" HPAlloy_Archive.dbo.BrokerLst_Detail_History "
CASE cTBL = "W"
	cSQL=cSQL+" HPAlloy_Archive.dbo.WIPLst_Detail_History "
ENDCASE
cSQL=cSQL+" WHERE ID_Detail ="+STR(pnID_Detail)
cSQL=cSQL+" AND ISNULL(ID_Detail_Process,0) >0 "
cSQL=cSQL+" ORDER BY [When] DESC "

IF nConn > 0
	SELECT 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_ID' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_ID' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_ID")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_ID")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF

	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_ID')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_ID')
		IF VARTYPE(tmpPSTK_ID.ID_Detail_Process) = "N"
			nID_Detail_Process = tmpPSTK_ID.ID_Detail_Process 
		ENDIF
		USE IN tmpPSTK_ID
	ENDIF
	IF nConn != pConnHandle
		SQLDISCONNECT( nConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:Get_ID_Master_by_ReceivingID",LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nID_Detail_Process  

ENDPROC

**********************************
********************************** 
	
PROCEDURE Get_ID_Detail_Prc_by_ID_Detail
PARAMETERS pnID_Detail, pcTBL, pcProcess_ID, pConnHandle

IF VARTYPE(pnID_Detail) != "N"
	TrackError("Bad Parameter","Bad Parameter ID_Detail","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF VARTYPE(pcTBL) != "C"
	TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF VARTYPE(pcProcess_ID) != "C"
	TrackError("Bad Parameter","Bad Parameter pcProcess_ID","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

PRIVATE cTBL
IF UPPER(LEFT(pcTBL,1)) = "S"
	cTBL = "S"
ENDIF
IF UPPER(LEFT(pcTBL,1)) = "B"
	cTBL = "B"
ENDIF
IF UPPER(LEFT(pcTBL,1)) = "W"
	cTBL = "W"
ENDIF

PRIVATE cProcess_ID
cProcess_ID = PrepareSQLtxt(pcProcess_ID,'Process_ID',10)

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
	ENDIF
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF

nConn = CheckSQLConnection(nConn)

PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_ID')
	USE IN tmpPSTK_ID
ENDIF

PRIVATE nID_Detail_Process
nID_Detail_Process = 0

PRIVATE cSQL, nSQLEXEC
cSQL = "SELECT ID_Detail_Process FROM "
DO CASE
CASE cTBL = "S"
	cSQL=cSQL+" dbo.Stocklst_Process "
CASE cTBL = "B"
	cSQL=cSQL+" dbo.BrokerLst_Process "
CASE cTBL = "W"
	cSQL=cSQL+" dbo.WIPLst_Process "
ENDCASE
cSQL=cSQL+" WHERE ID_Detail ="+STR(pnID_Detail)
cSQL=cSQL+" AND Process_ID = '"+cProcess_ID +"'"
cSQL=cSQL+" ORDER BY ID_Detail_Process DESC "

IF nConn > 0
	SELECT 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_ID' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_ID' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_ID")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_ID")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF

	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_ID')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_ID')
		IF VARTYPE(tmpPSTK_ID.ID_Detail_Process) = "N"
			nID_Detail_Process = tmpPSTK_ID.ID_Detail_Process 
		ENDIF
		USE IN tmpPSTK_ID
	ENDIF
	IF nConn != pConnHandle
		SQLDISCONNECT( nConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:Get_ID_Master_by_ReceivingID",LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nID_Detail_Process  

ENDPROC

**********************************	
PROCEDURE get_ID_Master_with_ID_Detail 
PARAMETERS nID_Detail, cTBL, nConn
*nID = Get_ID_Master_with_ID_Detail(nID_Detail, cTBL, nConn) 

IF VARTYPE(nID_Detail) != "N"
	TrackError("Bad Parameter","Bad Parameter nID_Detail","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter","Bad Parameter cTBL is NOT a char type.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF NOT ( cTBL= "S" OR cTBL= "B" OR cTBL= "W" )
	cTBL = PrepareSQLtxt(cTBL,'NotTBL',10)	&&try to pass what the Bad TBL is
	TrackError("Bad Parameter","Bad cTBL '"+cTBL+"'","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

IF VARTYPE(nConn) != "N"
	TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

nConn = CheckSQLConnection(nConn)
PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_ID_DetailPO')
	USE IN tmpPSTK_ID_DetailPO
ENDIF

PRIVATE cSQL, nSQLEXEC
cSQL = ""

cSQL = "SELECT ID FROM "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + "	dbo.StockLst_Detail D "
CASE cTBL = "B"
	cSQL = cSQL + "	dbo.BrokerLst_Detail D "
CASE cTBL = "W"
	cSQL = cSQL + "	dbo.WIPLst_Detail D "
OTHERWISE 
	TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDCASE

cSQL = cSQL + " WITH(NOLOCK) "	
cSQL = cSQL + "	WHERE D.ID_Detail = "+STR(nID_Detail)

SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_ID_DetailPO')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_ID_DetailPO')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_ID_DetailPO")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_ID_DetailPO")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn,nSQLEXEC, 'tmpPSTK_ID_DetailPO')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

PRIVATE nReturnID
nReturnID = 0

IF USED('tmpPSTK_ID_DetailPO')
	IF VARTYPE(tmpPSTK_ID_DetailPO.ID ) = "N"
		IF tmpPSTK_ID_DetailPO.ID > 0
			nReturnID = tmpPSTK_ID_DetailPO.ID
		ENDIF
	ENDIF

	USE IN tmpPSTK_ID_DetailPO
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nReturnID
ENDPROC
**********************************
	
PROCEDURE Get_ID_Master_with_POitem 
PARAMETERS cPOitem, cTBL, nConn, cHeat,lPOstatus, nRID
*nID = Get_ID_Master_with_POitem(cPOitem, cTBL, nConn, cHeat, lPOStatus, nRID ) 

IF VARTYPE(cPOitem) != "C"
	TrackError("Bad Parameter","Bad Parameter cPOitem","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF NOT ( cTBL= "S" OR cTBL= "B" OR cTBL= "W" )
	TrackError("Bad Parameter","Bad cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

IF VARTYPE(nConn) != "N"
	TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF VARTYPE(cHeat) != "C"
	cHeat=''
ENDIF

IF Proper_PO_Item(cPOItem) = Proper_PO_Item("0-00")
	RETURN 0
ENDIF
IF VARTYPE(lPOStatus) != "L"
	lPOstatus = .F.
ENDIF
IF VARTYPE(nRID) != "N"
	nRID = 0
ENDIF

nConn = CheckSQLConnection(nConn)
PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_ID_DetailPO')
	USE IN tmpPSTK_ID_DetailPO
ENDIF

PRIVATE cSQL, nSQLEXEC
cSQL = ""
IF nRID > 0
	cSQL = "SELECT ID FROM "
	DO CASE
	CASE cTBL = "S"
		cSQL = cSQL + "	dbo.StockLst_Detail D "
		cSQL = cSQL + "	INNER JOIN dbo.StockLst_Process P ON D.ID_Detail = P.ID_Detail"
	CASE cTBL = "B"
		cSQL = cSQL + "	dbo.BrokerLst_Detail D "
		cSQL = cSQL + "	INNER JOIN dbo.BrokerLst_Process P ON D.ID_Detail = P.ID_Detail"
	CASE cTBL = "W"
		cSQL = cSQL + "	dbo.WIPLst_Detail D "
		cSQL = cSQL + "	INNER JOIN dbo.WIPLst_Process P ON D.ID_Detail = P.ID_Detail"
	OTHERWISE 
 		TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
		RETURN 0
	ENDCASE
	cSQL = cSQL + "	WHERE D.ReceivingID = "+STR(nRID)
	cSQL = cSQL + " UNION "
ENDIF
cSQL = cSQL + "SELECT M.ID FROM "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + "	dbo.StockLst_Master M "
	cSQL = cSQL + "	INNER JOIN dbo.StockLst_Detail D ON M.ID = D.ID "
	cSQL = cSQL + "	INNER JOIN dbo.StockLst_Process P ON D.ID_Detail = P.ID_Detail "
CASE cTBL = "B"
	cSQL = cSQL + "	dbo.BrokerLst_Master M "
	cSQL = cSQL + "	INNER JOIN dbo.BrokerLst_Detail D ON M.ID = D.ID "
	cSQL = cSQL + "	INNER JOIN dbo.BrokerLst_Process P ON D.ID_Detail = P.ID_Detail "
CASE cTBL = "W"
	cSQL = cSQL + "	dbo.WIPLst_Master M "
	cSQL = cSQL + "	INNER JOIN dbo.WIPLst_Detail D ON M.ID = D.ID "
	cSQL = cSQL + "	INNER JOIN dbo.WIPLst_Process P ON D.ID_Detail = P.ID_Detail "
ENDCASE
cSQL = cSQL + "	WHERE M.PO_item = dbo.f_ProperPOitem('"+cPOItem+"')"

IF NOT EMPTY(cHeat)
	cSQL = cSQL + " AND (M.Heat LIKE '%"+cHeat+"%' OR M.Heat = 'DUE IN') " 
ENDIF
IF lPOstatus
	cSQL = cSQL + " AND ( M.POStatus LIKE 'D' OR M.POStatus LIKE 'P' OR M.POStatus IS NULL )"
ENDIF

SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_ID_DetailPO')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_ID_DetailPO')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_ID_DetailPO")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_ID_DetailPO")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn,nSQLEXEC, 'tmpPSTK_ID_DetailPO')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

PRIVATE nReturnID
nReturnID = 0

IF USED('tmpPSTK_ID_DetailPO')
	IF VARTYPE(tmpPSTK_ID_DetailPO.ID ) = "N"
		IF tmpPSTK_ID_DetailPO.ID > 0
			nReturnID = tmpPSTK_ID_DetailPO.ID
		ENDIF
	ENDIF

	USE IN tmpPSTK_ID_DetailPO
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nReturnID
ENDPROC

**********************************
	
PROCEDURE get_ID_Detail_with_POitem 
PARAMETERS cPOitem, cTBL, nConn, lPOstatus
*nID_Detail = get_ID_Detail_with_POitem(cPOitem, cTBL, nConn, .F.)
IF VARTYPE(cPOitem) != "C"
	TrackError("Bad Parameter","Bad Parameter POitem","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF NOT ( cTBL= "S" OR cTBL= "B" OR cTBL= "W" )
	TrackError("Bad Parameter","Bad cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

IF VARTYPE(nConn) != "N"
	TrackError("Bad Parameter","Bad Parameter nconn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF Proper_PO_Item(cPOItem) = Proper_PO_Item("0-00")
	TrackError("Bad Parameter","Bad Parameter POitem","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF VARTYPE(lPOStatus) = "U"
	lPOstatus = .F.
ENDIF

nConn = CheckSQLConnection(nConn)
PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_ID_DetailPO')
	USE IN tmpPSTK_ID_DetailPO
ENDIF

PRIVATE cSQL, nSQLEXEC
cSQL = "SELECT TOP 1 ID_Detail FROM "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + "	dbo.StockLst_Master M INNER JOIN dbo.StockLst_Detail D ON m.ID = D.ID "
CASE cTBL = "B"
	cSQL = cSQL + "	dbo.BrokerLst_Master M INNER JOIN dbo.BrokerLst_Detail D ON m.ID = D.ID "
CASE cTBL = "W"
	cSQL = cSQL + "	dbo.WIPLst_Master M INNER JOIN dbo.WIPLst_Detail D ON m.ID = D.ID "
OTHERWISE 
	TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDCASE


cSQL = cSQL + "	WHERE PO_item = dbo.f_ProperPOitem('"+cPOitem+"')"
IF lPOstatus
	cSQL = cSQL + " AND ( POStatus LIKE 'D' OR POStatus LIKE 'P' OR POStatus IS NULL )"
ENDIF

SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_ID_DetailPO')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_ID_DetailPO')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_ID_DetailPO")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_ID_DetailPO")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_ID_DetailPO')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

PRIVATE nReturnID_Detail
nReturnID_Detail= 0

IF USED('tmpPSTK_ID_DetailPO')
	IF VARTYPE(tmpPSTK_ID_DetailPO.ID_Detail ) = "N"
		IF tmpPSTK_ID_DetailPO.ID_Detail > 0
			nReturnID_Detail = tmpPSTK_ID_DetailPO.ID_Detail
		ENDIF
	ENDIF

	USE IN tmpPSTK_ID_DetailPO
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nReturnID_Detail
ENDPROC

**********************************

PROCEDURE get_ID_Detail_with_SOitem 
PARAMETERS cSOitem, cTBL, cProcess_ID, pConnHandle	
*nID_Detail = get_ID_Detail_with_SOitem(cSOitem, cTBL, cProcess_ID, nConn)
*Returns ID_Detail FROM Process table for SOitem

IF VARTYPE(cSOitem) != "C"
	TrackError("Bad Parameter","Bad Parameter cSOitem","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF Proper_SO_Item(cSOItem) = Proper_SO_Item("")
	TrackError("Bad Parameter","Bad Parameter SOitem","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF NOT ( cTBL= "S" OR cTBL= "B" OR cTBL= "W" )
	TrackError("Bad Parameter","Bad cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

IF VARTYPE(cProcess_ID) != "C"
	cProcess_ID = ''
ENDIF

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
	ENDIF
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF
nConn = CheckSQLConnection(nConn)

IF USED('tmpPSTK_ID_DetailSO')
	USE IN tmpPSTK_ID_DetailSO
ENDIF

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC
cSQL = "SELECT TOP 1 ID_Detail FROM "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + " dbo.StockLst_Process "
CASE cTBL = "B"
	cSQL = cSQL + " dbo.BrokerLst_Process "
CASE cTBL = "W"
	cSQL = cSQL + " dbo.WIPLst_Process "
OTHERWISE 
	TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0

ENDCASE
cSQL = cSQL + "	WHERE SOitem = dbo.f_ProperSOitem('"+cSOitem+"')"

DO CASE
CASE cProcess_ID = "SELECTED"
	cSQL = cSQL + " AND ( Process_ID = 'SELECTED' OR Process_ID='PARTSELECT' )"
CASE cProcess_ID == "INCOMING"
*	cSQL = cSQL + " AND Process_ID = 'INCOMING' "
	cSQL = cSQL + " AND ( Process_ID = 'INCOMING' OR Process_ID = 'PARTRECV' )"
ENDCASE
IF cProcess_ID = "INCOMINGNOT2HPA"
	cSQL = cSQL + " AND (Process_ID = 'INCOMING' OR Process_ID = 'NOT2HPA' OR Process_ID = 'PARTRECV' ) "
ENDIF
*Could have been taken off StockLst
IF cTBL = "S" AND cProcess_ID = "SELECTED"
	cSQL = cSQL + " UNION " 
	cSQL = cSQL + " SELECT StockLst_ID_Detail AS ID_Detail FROM dbo.Sales_Stock WITH(NOLOCK) "
	cSQL = cSQL + "	WHERE SOitem = dbo.f_ProperSOitem('"+cSOitem+"')"
ENDIF
*cSQL = cSQL + " ORDER BY Process_ID "


SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_ID_DetailSO')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_ID_DetailSO')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_ID_DetailSO")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_ID_DetailSO")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_ID_DetailSO')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

PRIVATE nReturnID_Detail
nReturnID_Detail= 0

IF USED('tmpPSTK_ID_DetailSO')
	IF VARTYPE(tmpPSTK_ID_DetailSO.ID_Detail) = "N"
		IF tmpPSTK_ID_DetailSO.ID_Detail > 0
			nReturnID_Detail = tmpPSTK_ID_DetailSO.ID_Detail
		ENDIF
	ENDIF

	USE IN tmpPSTK_ID_DetailSO
ENDIF

IF nConn != pConnHandle
	SQLDISCONNECT( nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nReturnID_Detail
ENDPROC

**********************************

PROCEDURE get_ID_Detail_with_WO 
PARAMETERS nWO, cTBL, nConn	
*nID_Detail = get_ID_Detail_with_WO(nWO, cTBL, nConn)
*Returns ID_Detail FROM Detail table for WO

IF VARTYPE(nWO) != "N"
	TrackError("Bad Parameter","Bad Parameter nWO","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF NOT ( cTBL= "S" OR cTBL= "B" OR cTBL= "W" )
	TrackError("Bad Parameter","Bad cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

IF VARTYPE(nConn) != "N"
	TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF USED('tmpPSTK_ID_DetailSO')
	USE IN tmpPSTK_ID_DetailSO
ENDIF
nConn = CheckSQLConnection(nConn)
PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC
cSQL = "SELECT TOP 1 ID_Detail FROM "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + " dbo.StockLst_Detail "	
CASE cTBL = "B"
	cSQL = cSQL + " dbo.BrokerLst_Detail "
CASE cTBL = "W"
	cSQL = cSQL + " dbo.WIPLst_Detail "
OTHERWISE 
	TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDCASE

cSQL = cSQL + "	WHERE WO = "+STR(nWO)

SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_ID_DetailSO')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_ID_DetailSO')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_ID_DetailSO")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_ID_DetailSO")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_ID_DetailSO')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

PRIVATE nReturnID_Detail
nReturnID_Detail= 0

IF USED('tmpPSTK_ID_DetailSO')
	IF VARTYPE(tmpPSTK_ID_DetailSO.ID_Detail) = "N"
		IF tmpPSTK_ID_DetailSO.ID_Detail > 0
			nReturnID_Detail = tmpPSTK_ID_DetailSO.ID_Detail
		ENDIF
	ENDIF

	USE IN tmpPSTK_ID_DetailSO
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nReturnID_Detail
ENDPROC
**********************************

PROCEDURE get_ID_with_WO_Detail 
PARAMETERS nWO_Detail, cTBL, nConn	
*nID = get_ID_with_WO_Detail(nWO_Detail, cTBL, nConn)
*Returns ID FROM Master table for WO_Detail

IF VARTYPE(nWO_Detail) != "N"
	TrackError("Bad Parameter","Bad Parameter nWO_Detail","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF NOT ( cTBL= "S" OR cTBL= "B" OR cTBL= "W" )
	TrackError("Bad Parameter","Bad cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

IF VARTYPE(nConn) != "N"
	TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

IF USED('tmpPSTK_ID_WODetail')
	USE IN tmpPSTK_ID_WODetail
ENDIF
nConn = CheckSQLConnection(nConn)
PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC
cSQL = "SELECT TOP 1 ID_Detail FROM "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + " dbo.StockLst_Master "	
CASE cTBL = "B"
	cSQL = cSQL + " dbo.BrokerLst_Master "
CASE cTBL = "W"
	cSQL = cSQL + " dbo.WIPLst_Master "
OTHERWISE 
	TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0

ENDCASE

cSQL = cSQL + "	WHERE WO_Detail = "+STR(nWO)

SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_ID_WODetail')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_ID_WODetail')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_ID_WODetail")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_ID_WODetail")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_ID_WODetail')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

PRIVATE nReturnID
nReturnID = 0

IF USED('tmpPSTK_ID_WODetail')
	IF VARTYPE(tmpPSTK_ID_WODetail.ID) = "N"
		IF tmpPSTK_ID_WODetail.ID > 0
			nReturnID = tmpPSTK_ID_WODetail.ID
		ENDIF
	ENDIF

	USE IN tmpPSTK_ID_WODetail
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nReturnID
ENDPROC
********************************** 
	
PROCEDURE getTBL_Process_POitem
PARAMETERS cPOitem, nConn
*cTBL = getTBL_Process_POitem(cPOitem, nConn ) 

IF VARTYPE(cPOitem) != "C"
	TrackError("Bad Parameter","Bad Parameter POitem","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

IF VARTYPE(nConn) != "N"
	TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

IF Proper_PO_Item(cPOItem) = Proper_PO_Item("0-00")
	TrackError("Bad Parameter","Bad Parameter POitem","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

nConn = CheckSQLConnection(nConn)
PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_TBL_POi')
	USE IN tmpPSTK_TBL_POi
ENDIF
PRIVATE cTBL
cTBL = ''

**check for an 'INCOMING', if not found the Select any Process.
PRIVATE cSQL, nSQLEXEC
cSQL =        "	IF EXISTS( "
cSQL = cSQL + "	"
cSQL = cSQL + "	SELECT P.ID_Detail "
cSQL = cSQL + "	FROM 	dbo.BrokerLst_Process P "
cSQL = cSQL + "	WHERE PO_item = dbo.f_ProperPOitem('"+cPOItem+"')" 
cSQL = cSQL + "	AND (P.Process_ID = 'Incoming' OR P.Process_ID = 'NOT2HPA' )"
cSQL = cSQL + "	"
cSQL = cSQL + "	UNION  "
cSQL = cSQL + "	SELECT P.ID_Detail "
cSQL = cSQL + "	FROM  	dbo.WIPLst_Process P "
cSQL = cSQL + "	WHERE PO_item = dbo.f_ProperPOitem('"+cPOItem+"')" 
cSQL = cSQL + "	AND (P.Process_ID = 'Incoming' OR P.Process_ID = 'NOT2HPA' )"
cSQL = cSQL + "	"
cSQL = cSQL + "	UNION  "
cSQL = cSQL + "	SELECT P.ID_Detail "
cSQL = cSQL + "	FROM  	dbo.StockLst_Process P "
cSQL = cSQL + "	WHERE PO_item = dbo.f_ProperPOitem('"+cPOItem+"')"
cSQL = cSQL + "	AND (P.Process_ID = 'Incoming' OR P.Process_ID = 'NOT2HPA' )"
cSQL = cSQL + "	) "
cSQL = cSQL + "	begin "
cSQL = cSQL + "	"
cSQL = cSQL + "	SELECT 'B' AS TBL, '1' AS SortOrder ,P.Process_ID "
cSQL = cSQL + "	FROM 	dbo.BrokerLst_Process P "
cSQL = cSQL + "	WHERE PO_item = dbo.f_ProperPOitem('"+cPOItem+"')" 
cSQL = cSQL + "	AND (P.Process_ID = 'Incoming' OR P.Process_ID = 'NOT2HPA' )"
cSQL = cSQL + "	"
cSQL = cSQL + "	UNION  "
cSQL = cSQL + "	SELECT 'W' AS TBL , '2' AS SortOrder,P.Process_ID "
cSQL = cSQL + "	FROM  	dbo.WIPLst_Process P "
cSQL = cSQL + "	WHERE PO_item = dbo.f_ProperPOitem('"+cPOItem+"')"
cSQL = cSQL + "	AND (P.Process_ID = 'Incoming' OR P.Process_ID = 'NOT2HPA' )"
cSQL = cSQL + "	"
cSQL = cSQL + "	UNION  "
cSQL = cSQL + "	SELECT 'S' AS TBL, '3' AS SortOrder,P.Process_ID "
cSQL = cSQL + "	FROM  	dbo.StockLst_Process P "
cSQL = cSQL + "	WHERE PO_item = dbo.f_ProperPOitem('"+cPOItem+"')"
cSQL = cSQL + "	AND (P.Process_ID = 'Incoming' OR P.Process_ID = 'NOT2HPA' )"
cSQL = cSQL + "	ORDER BY SortOrder "
cSQL = cSQL + "	"
cSQL = cSQL + "	end "
cSQL = cSQL + "	"
cSQL = cSQL + "	ELSE "
cSQL = cSQL + "	"
cSQL = cSQL + "	begin "
cSQL = cSQL + "	"
cSQL = cSQL + "	SELECT DISTINCT 'B' AS TBL, '1' AS SortOrder ,P.Process_ID "
cSQL = cSQL + "	FROM 	dbo.BrokerLst_Process P "
cSQL = cSQL + "	WHERE PO_item = dbo.f_ProperPOitem('"+cPOItem+"')"
cSQL = cSQL + "	"
cSQL = cSQL + "	UNION  "
cSQL = cSQL + "	SELECT DISTINCT 'W' AS TBL , '2' AS SortOrder,P.Process_ID "
cSQL = cSQL + "	FROM  	dbo.WIPLst_Process P "
cSQL = cSQL + "	WHERE PO_item = dbo.f_ProperPOitem('"+cPOItem+"')"
cSQL = cSQL + "	"
cSQL = cSQL + "	UNION  "
cSQL = cSQL + "	SELECT DISTINCT 'S' AS TBL, '3' AS SortOrder,P.Process_ID "
cSQL = cSQL + "	FROM  	dbo.StockLst_Process P "
cSQL = cSQL + "	WHERE PO_item = dbo.f_ProperPOitem('"+cPOItem+"')"
cSQL = cSQL + "	ORDER BY SortOrder "
cSQL = cSQL + "	"
cSQL = cSQL + "	end "


SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_TBL_POi')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_TBL_POi')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_TBL_POi")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_TBL_POi")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpPSTK_TBL_POi')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

PRIVATE nReturnID
nReturnID = 0

IF USED('tmpPSTK_TBL_POi')
	IF RECCOUNT('tmpPSTK_TBL_POi') > 0
		cTBL = PrepareSQLtxt(tmpPSTK_TBL_POi.TBL,'TBL',1)
		
		IF RECCOUNT('tmpPSTK_TBL_POi') > 1
			SELECT tmpPSTK_TBL_POi
			SKIP
			cTBL2 = PrepareSQLtxt(tmpPSTK_TBL_POi.TBL,'TBL',1)
			PRIVATE cMess
			cMess = "Found POitem '"+cPOItem+"' in more than 1 table!"+CHR(13)
			cMess = cMess + "First in Table "+cTBL+" "+CHR(13)
			cMess = cMess + "Second in Table "+cTBL2+" "+CHR(13)+CHR(13)
			cMess = cMess + "Verify StockLst and Broker entries."+CHR(13)
			cMess = cMess + "Something is wrong here."+CHR(13)+CHR(13)
			cMess = cMess +"Function is just returning Table '"+cTBL+"'."
			TrackError( cMess+CHR(13)+cSQL ,"Extra Tables","Proc_StockLst:getTBL_Process_POitem()",LINENO())
			
			MESSAGEBOX( cMess,0+48,"Bad, make sure Stock is correct!!")
			
			Send_Chatter('Stock Issue',0,cPOItem,"The POitem ("+cPoitem+") is found in more than 1 Stocking table.",nConn)
			*           pcType_Name, pnNumber, pcNumber, pcMessage, pConnHandle
		ENDIF

	ENDIF

	USE IN tmpPSTK_TBL_POi
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cTBL
ENDPROC

********************************** 
	
PROCEDURE getTBL_ReceivingID 
PARAMETERS nReceivingID, nConn
*cTBL = getTBL_ReceivingID(ReceivingID, nConn ) 

IF VARTYPE(nReceivingID) != "N"
	TrackError("Bad Parameter","Bad Parameter RID","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF

IF nReceivingID < 1
	TrackError("Bad Parameter","Bad Parameter RID","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF

IF VARTYPE(nConn) != "N"
	TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF

nConn = CheckSQLConnection(nConn)
PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_TBL_POi')
	USE IN tmpPSTK_TBL_POi
ENDIF
PRIVATE cTBL
cTBL = ''

PRIVATE cSQL, nSQLEXEC

**************************************
** check current Detail
cSQL = "SELECT DISTINCT t.TBL FROM ("
cSQL = cSQL + " SELECT 'S' AS TBL FROM dbo.StockLst_Detail WHERE ReceivingID = "+STR(nReceivingID)
cSQL = cSQL + " UNION "
cSQL = cSQL + " SELECT 'B' AS TBL FROM dbo.BrokerLst_Detail WHERE ReceivingID = "+STR(nReceivingID)
cSQL = cSQL + " UNION "
cSQL = cSQL + " SELECT 'W' AS TBL FROM dbo.WIPLst_Detail WHERE ReceivingID = "+STR(nReceivingID)

cSQL = cSQL + " ) t "


SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_TBL_POi')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_TBL_POi')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_TBL_POi")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_TBL_POi")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpPSTK_TBL_POi')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

IF USED('tmpPSTK_TBL_POi')
	IF RECCOUNT('tmpPSTK_TBL_POi') > 0
		cTBL = PrepareSQLtxt(tmpPSTK_TBL_POi.TBL,'TBL',1)
		
		IF RECCOUNT('tmpPSTK_TBL_POi') > 1
			TrackError("Extra Tables","Found ReceiveID "+ALLTRIM(STR(nReceivingID))+" in _Detail in more than 1 table!"+CHR(13)+"Be carefull."+CHR(13)+"Function is returning Table '"+cTBL+"'.","Proc_StockLst:getTBL_ReceivingID()",LINENO())
			MESSAGEBOX( "Found ReceiveID "+ALLTRIM(STR(nReceivingID))+" in more than 1 table!"+CHR(13)+"Be carefull. getTBL_ReceivingID()"+CHR(13)+"Function is returning Table '"+cTBL+"'.",0+48,"Warning")
		ENDIF

	ENDIF

	USE IN tmpPSTK_TBL_POi
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

IF NOT LEN(cTBL)=0
	RETURN cTBL
ENDIF

**************************************
**Check Process History


cSQL =        " SELECT 'S' AS TBL FROM HPAlloy_Archive.dbo.StockLst_Process_History WHERE ReceivingID = "+STR(nReceivingID)
cSQL = cSQL + " UNION "
cSQL = cSQL + " SELECT 'B' AS TBL FROM HPAlloy_Archive.dbo.BrokerLst_Process_History WHERE ReceivingID = "+STR(nReceivingID)
cSQL = cSQL + " UNION "
cSQL = cSQL + " SELECT 'W' AS TBL FROM HPAlloy_Archive.dbo.WIPLst_Process_History WHERE ReceivingID = "+STR(nReceivingID)


SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_TBL_POi')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_TBL_POi')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_TBL_POi")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_TBL_POi")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpPSTK_TBL_POi')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

IF USED('tmpPSTK_TBL_POi')
	IF RECCOUNT('tmpPSTK_TBL_POi') > 0
		cTBL = PrepareSQLtxt(tmpPSTK_TBL_POi.TBL,'TBL',1)
		
		IF RECCOUNT('tmpPSTK_TBL_POi') > 1
			TrackError("Extra Tables","Found ReceiveID "+ALLTRIM(STR(nReceivingID))+" in HPAlloy_Archive in more than 1 table!"+CHR(13)+"Be carefull."+CHR(13)+"Function is returning Table '"+cTBL+"'.","Proc_StockLst:getTBL_ReceivingID()",LINENO())
			MESSAGEBOX( "Found ReceiveID "+ALLTRIM(STR(nReceivingID))+" in HPAlloy_Archive in more than 1 table!"+CHR(13)+"Be carefull. getTBL_ReceivingID()"+CHR(13)+"Function is returning Table '"+cTBL+"'.",0+48,"Warning")
		ENDIF

	ENDIF

	USE IN tmpPSTK_TBL_POi
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

IF NOT LEN(cTBL)=0
	RETURN cTBL
ENDIF

**************************************
**Check Detail History

cSQL =        " SELECT 'S' AS TBL FROM dbo.StockLst_Detail WHERE ReceivingID = "+STR(nReceivingID)
cSQL = cSQL + " UNION "
cSQL = cSQL + " SELECT 'B' AS TBL FROM dbo.BrokerLst_Detail WHERE ReceivingID = "+STR(nReceivingID)
cSQL = cSQL + " UNION "
cSQL = cSQL + " SELECT 'W' AS TBL FROM dbo.WIPLst_Detail WHERE ReceivingID = "+STR(nReceivingID)


SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_TBL_POi')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_TBL_POi')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_TBL_POi")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_TBL_POi")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpPSTK_TBL_POi')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

IF USED('tmpPSTK_TBL_POi')
	IF RECCOUNT('tmpPSTK_TBL_POi') > 0
		cTBL = PrepareSQLtxt(tmpPSTK_TBL_POi.TBL,'TBL',1)
		
		IF RECCOUNT('tmpPSTK_TBL_POi') > 1
			TrackError("Extra Tables","Found ReceiveID "+ALLTRIM(STR(nReceivingID))+" in _Detail in more than 1 table!"+CHR(13)+"Be carefull."+CHR(13)+"Function is returning Table '"+cTBL+"'.","Proc_StockLst:getTBL_ReceivingID()",LINENO())
			MESSAGEBOX( "Found ReceiveID "+ALLTRIM(STR(nReceivingID))+" in _Detail in more than 1 table!"+CHR(13)+"Be carefull. getTBL_ReceivingID()"+CHR(13)+"Function is returning Table '"+cTBL+"'.",0+48,"Warning")
		ENDIF

	ENDIF

	USE IN tmpPSTK_TBL_POi
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

IF NOT LEN(cTBL)=0
	RETURN cTBL
ENDIF

**************************************
** check WO and WOD

cSQL = 	      "SELECT TBL FROM dbo.WorkOrder WHERE sReceivingID = "+STR(nReceivingID)
cSQL = cSQL + " UNION "
cSQL = cSQL + "SELECT fTBL AS TBL FROM dbo.WorkOrder_Detail WHERE fReceivingID = "+STR(nReceivingID)


SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_TBL_POi')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_TBL_POi')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_TBL_POi")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_TBL_POi")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpPSTK_TBL_POi')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

IF USED('tmpPSTK_TBL_POi')
	IF RECCOUNT('tmpPSTK_TBL_POi') > 0
		cTBL = PrepareSQLtxt(tmpPSTK_TBL_POi.TBL,'TBL',1)
		
		IF RECCOUNT('tmpPSTK_TBL_POi') > 1
			TrackError("Extra Tables","Found ReceiveID "+ALLTRIM(STR(nReceivingID))+" in WO or WOD in more than 1 table!"+CHR(13)+"Be carefull."+CHR(13)+"Function is returning Table '"+cTBL+"'.","Proc_StockLst:getTBL_ReceivingID()",LINENO())
			MESSAGEBOX( "Found ReceiveID "+ALLTRIM(STR(nReceivingID))+" in more than 1 table!"+CHR(13)+"Be carefull. getTBL_ReceivingID()"+CHR(13)+"Function is returning Table '"+cTBL+"'.",0+48,"Warning")
		ENDIF

	ENDIF

	USE IN tmpPSTK_TBL_POi
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cTBL

ENDPROC


********************************** 
	
PROCEDURE getTBL_WO 
PARAMETERS nWO, nConn
*cTBL = getTBL_WO(nWO, nConn ) 

IF VARTYPE(nWO) != "N"
	TrackError("Bad Parameter","Bad Parameter nWO","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF

IF nWO  < 1
	TrackError("Bad Parameter","Bad Parameter nWO","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF

IF VARTYPE(nConn) != "N"
	TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF

nConn = CheckSQLConnection(nConn)
PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_TBL_POi')
	USE IN tmpPSTK_TBL_POi
ENDIF
PRIVATE cTBL
cTBL = ''

PRIVATE cSQL, nSQLEXEC


cSQL = " SELECT DISTINCT TBL FROM dbo.WorkOrder WHERE WO = "+STR(nWO)


SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_TBL_POi')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_TBL_POi')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_TBL_POi")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_TBL_POi")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpPSTK_TBL_POi')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

IF USED('tmpPSTK_TBL_POi')
	IF RECCOUNT('tmpPSTK_TBL_POi') > 0
		cTBL = PrepareSQLtxt(tmpPSTK_TBL_POi.TBL,'TBL',1)
		
		IF RECCOUNT('tmpPSTK_TBL_POi') > 1
			TrackError("Extra Tables","Found WO "+ALLTRIM(STR(nWO))+" as more than 1 table!"+CHR(13)+"Be carefull."+CHR(13)+"Function is returning Table '"+cTBL+"'.","Proc_StockLst:getTBL_WO()",LINENO())
			MESSAGEBOX( "Found WO "+ALLTRIM(STR(nWO))+" as more than 1 table!"+CHR(13)+"Be carefull. getTBL_WO()"+CHR(13)+"Function is returning Table '"+cTBL+"'.",0+48,"Warning")
		ENDIF

	ENDIF

	USE IN tmpPSTK_TBL_POi
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF


RETURN cTBL

ENDPROC

********************************** 
	
PROCEDURE getTBL_WOD_WO 
PARAMETERS nWO, nConn
*cTBL = getTBL_WO(nWO, nConn ) 

IF VARTYPE(nWO) != "N"
	TrackError("Bad Parameter","Bad Parameter nWO","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF

IF nWO  < 1
	TrackError("Bad Parameter","Bad Parameter WO","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF

IF VARTYPE(nConn) != "N"
	TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF

nConn = CheckSQLConnection(nConn)
PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_TBL_POi')
	USE IN tmpPSTK_TBL_POi
ENDIF
PRIVATE cTBL
cTBL = ''

PRIVATE cSQL, nSQLEXEC


cSQL = " SELECT DISTINCT WOD.fTBL AS TBL "
cSQL = cSQL + " FROM dbo.WorkOrder WO "
cSQL = cSQL + " INNER JOIN dbo.WorkOrder_Detail WOD ON WO.WO = WOD.WO "
cSQL = cSQL + " WHERE WOD.WO_Detail = "+STR(nWO_Detail)


SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_TBL_POi')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_TBL_POi')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_TBL_POi")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_TBL_POi")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn,nSQLEXEC, 'tmpPSTK_TBL_POi')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

IF USED('tmpPSTK_TBL_POi')
	IF RECCOUNT('tmpPSTK_TBL_POi') > 0
		cTBL = PrepareSQLtxt(tmpPSTK_TBL_POi.TBL,'TBL',1)
		
		IF RECCOUNT('tmpPSTK_TBL_POi') > 1
			TrackError("Extra Tables","Found WO_Detail "+ALLTRIM(STR(nWO_Detail))+" as more than 1 table!"+CHR(13)+"Be carefull."+CHR(13)+"Function is returning Table '"+cTBL+"'.","Proc_StockLst:getTBL_WOD_WO()",LINENO())
			MESSAGEBOX( "Found WO_Detail "+ALLTRIM(STR(nWO_Detail))+" as more than 1 table!"+CHR(13)+"Be carefull. getTBL_WOD_WO()"+CHR(13)+"Function is returning Table '"+cTBL+"'.",0+48,"Warning")
		ENDIF

	ENDIF

	USE IN tmpPSTK_TBL_POi
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF


RETURN cTBL

ENDPROC
********************************** 
	
PROCEDURE getTBL_WO_Detail 
PARAMETERS nWO_Detail, nConn
*cTBL = getTBL_WO_Detail(nWO_Detail, nConn ) 

IF VARTYPE(nWO_Detail) != "N"
	TrackError("Bad Parameter","Bad Parameter nWO_Detail","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF

IF nWO_Detail  < 1
	TrackError("Bad Parameter","Bad Parameter WO_Detail","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF

IF VARTYPE(nConn) != "N"
	TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF

nConn = CheckSQLConnection(nConn)
PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_TBL_POi')
	USE IN tmpPSTK_TBL_POi
ENDIF
PRIVATE cTBL
cTBL = ''

PRIVATE cSQL, nSQLEXEC


cSQL = " SELECT DISTINCT fTBL AS TBL FROM dbo.WorkOrder_Detail WHERE WO_Detail = "+STR(nWO_Detail)


SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_TBL_POi')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_TBL_POi')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_TBL_POi")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_TBL_POi")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn,nSQLEXEC, 'tmpPSTK_TBL_POi')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

IF USED('tmpPSTK_TBL_POi')
	IF RECCOUNT('tmpPSTK_TBL_POi') > 0
		cTBL = PrepareSQLtxt(tmpPSTK_TBL_POi.TBL,'TBL',1)
		
		IF RECCOUNT('tmpPSTK_TBL_POi') > 1
			TrackError("Found WO_Detail "+ALLTRIM(STR(nWO_Detail))+" as more than 1 table!"+CHR(13)+"Be carefull."+CHR(13)+"Function is returning Table '"+cTBL+"'.","Found too much data.","Proc_StockLst:getTBL_WO_Detail()",LINENO())
			MESSAGEBOX( "Found WO_Detail "+ALLTRIM(STR(nWO_Detail))+" as more than 1 table!"+CHR(13)+"Be carefull. getTBL_WO_Detail()"+CHR(13)+"Function is returning Table '"+cTBL+"'.",0+48,"Warning")
		ENDIF

	ENDIF

	USE IN tmpPSTK_TBL_POi
ENDIF

RETURN cTBL

ENDPROC
***
********************************** 
	
PROCEDURE getTBL_WOD 
PARAMETERS nWO_Detail, pConnHandle
*cTBL = getTBL_WO(nWO_Detail, pConnHandle) 


IF VARTYPE(nWO_Detail) != "N"
	TrackError("Bad Parameter","Bad Parameter nWO_Detail","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF

IF nWO_Detail < 1
	TrackError("Bad Parameter","Bad Parameter WO_Detail","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF


PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	nConn = pConnHandle
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_TBL_POi')
	USE IN tmpPSTK_TBL_POi
ENDIF
PRIVATE cTBL
cTBL = ''

PRIVATE cSQL, nSQLEXEC
cSQL = " SELECT TBL FROM dbo.PurchaseOrder "
cSQL = cSQL + " WHERE WO_Detail ="+STR(nWO_Detail)
cSQL = cSQL + " AND LEN(TBL)>0 "

SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_TBL_POi')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_TBL_POi')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_TBL_POi")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_TBL_POi")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpPSTK_TBL_POi')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

IF USED('tmpPSTK_TBL_POi')
	IF RECCOUNT('tmpPSTK_TBL_POi') > 0
		cTBL = PrepareSQLtxt(tmpPSTK_TBL_POi.TBL,'TBL',1)
		RecordTest( 'Record Test Data.', "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"getTBL_WOD ("+STR(nWO_Detail)+") First try = '"+cTBL+"'"+CHR(13)+cSQL )
	ENDIF

	USE IN tmpPSTK_TBL_POi
ENDIF

IF LEN(cTBL) = 0
	*Second Try, INCOMING Process 
	cSQL = "SELECT 'S' AS TBL FROM dbo.StockLst_Process "
	cSQL = cSQL+" WHERE WO_Detail = "+STR(nWO_Detail)
	cSQL = cSQL+" AND ( Process_ID='INCOMING' )"

	cSQL = cSQL+" UNION "
	cSQL = cSQL+" SELECT 'B' AS TBL FROM dbo.BrokerLst_Process "
	cSQL = cSQL+" WHERE WO_Detail = "+STR(nWO_Detail)
	cSQL = cSQL+" AND Process_ID='INCOMING'  "

	cSQL = cSQL+" UNION "
	cSQL = cSQL+" SELECT 'W' AS TBL FROM dbo.WIPLst_Process "
	cSQL = cSQL+" WHERE WO_Detail = "+STR(nWO_Detail)
	cSQL = cSQL+" AND Process_ID='INCOMING' "

	SELECT 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_TBL_POi')

	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_TBL_POi')
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_TBL_POi")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_TBL_POi")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpPSTK_TBL_POi')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF

	IF USED('tmpPSTK_TBL_POi')
		IF RECCOUNT('tmpPSTK_TBL_POi') > 0
			cTBL = PrepareSQLtxt(tmpPSTK_TBL_POi.TBL,'TBL',1)
			RecordTest( 'Record Test Data.', "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"getTBL_WOD('"+cPOitem+"') Second try = '"+cTBL+"'"+CHR(13)+HTML_POitem(cPOitem,.T.)+CHR(13)+cSQL )
	*		IF RECCOUNT('tmpPSTK_TBL_POi') > 1
	*			TrackError("Extra Tables","Found WO_Detail "+ALLTRIM(STR(nWO_Detail))+" as more than 1 table!"+CHR(13)+"Be carefull."+CHR(13)+"Function is returning Table '"+cTBL+"'.","Proc_StockLst:getTBL_WOD()",LINENO())
	*			MESSAGEBOX( "Found WO_Detail "+ALLTRIM(STR(nWO_Detail))+" as more than 1 table!"+CHR(13)+"Be carefull. getTBL_WOD()"+CHR(13)+"Function is returning Table '"+cTBL+"'.",0+48,"Warning")
	*		ENDIF

		ENDIF

		USE IN tmpPSTK_TBL_POi
	ENDIF
ENDIF

************************
IF LEN(cTBL)=0
	*try again 3rd Stock_Master
	cSQL = "SELECT 'S' AS TBL FROM dbo.StockLst_Master "
	cSQL = cSQL+" WHERE WO_Detail = "+STR(nWO_Detail)
	
	cSQL = cSQL+" UNION "
	cSQL = cSQL+" SELECT 'B' AS TBL FROM dbo.BrokerLst_Master "
	cSQL = cSQL+" WHERE WO_Detail = "+STR(nWO_Detail)
	
	cSQL = cSQL+" UNION "
	cSQL = cSQL+" SELECT 'W' AS TBL FROM dbo.WIPLst_Master "
	cSQL = cSQL+" WHERE WO_Detail = "+STR(nWO_Detail)
	
	SELECT 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_TBL_POi')

	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_TBL_POi')
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_TBL_POi")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_TBL_POi")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpPSTK_TBL_POi')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF

	IF USED('tmpPSTK_TBL_POi')
		IF RECCOUNT('tmpPSTK_TBL_POi') > 0
			cTBL = PrepareSQLtxt(tmpPSTK_TBL_POi.TBL,'TBL',1)
			RecordTest( 'Record Test Data.', "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"getTBL_WOD('"+cPOitem+"') Third try = '"+cTBL+"'"+CHR(13)+cSQL )
		ENDIF

		USE IN tmpPSTK_TBL_POi
	ENDIF
ENDIF


IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF


RETURN cTBL

ENDPROC

********************************** 
	
PROCEDURE getTBL_POitem 
PARAMETERS cPOitem, pConnHandle
*cTBL = getTBL_POitem(cPOitem, pConnHandle) 
**Also see isTBL_PO_Valid() and dbo.f_GetPOItem_TBL()

IF VARTYPE(cPOitem) != "C"
	TrackError("Bad Parameter","Bad Parameter cPOitem","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF

IF Proper_PO_item(cPOitem) = Proper_PO_item("")
	TrackError("Bad Parameter","Bad Parameter POitem","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF


PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	nConn = pConnHandle
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_TBL_POi')
	USE IN tmpPSTK_TBL_POi
ENDIF
PRIVATE cTBL
cTBL = ''

PRIVATE cSQL, nSQLEXEC
*First Try
cSQL = " SELECT TBL FROM dbo.PurchaseOrder WHERE POitem = dbo.f_ProperPOitem('"+cPOitem+"')"
cSQL = cSQL + " AND LEN(TBL)>0 "

SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_TBL_POi')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_TBL_POi')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_TBL_POi")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_TBL_POi")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpPSTK_TBL_POi')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

IF USED('tmpPSTK_TBL_POi')
	IF RECCOUNT('tmpPSTK_TBL_POi') > 0
		cTBL = PrepareSQLtxt(tmpPSTK_TBL_POi.TBL,'TBL',1)
		RecordTest( 'Record Test Data.', "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"getTBL_POitem('"+cPOitem+"') First try = '"+cTBL+"'"+CHR(13)+HTML_POitem(cPOitem,.T.)+CHR(13)+cSQL )
	ENDIF

	USE IN tmpPSTK_TBL_POi
ENDIF

***********************************
IF NOT (cTBL="S" OR cTBL="B" OR cTBL="W")
	*Second Try -try Receiving Table
	cSQL = " SELECT StockTable AS TBL " 
	cSQL = cSQL + " FROM dbo.Receiving "
	cSQL = cSQL + " WHERE POitem = dbo.f_ProperPOitem('"+cPOitem+"')"
	cSQL = cSQL + " AND LEN( ISNULL(StockTable,'') )>0 "
	cSQL = cSQL + " AND StockTable <>'N' "

	SELECT 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_TBL_POi')

	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_TBL_POi')
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_TBL_POi")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_TBL_POi")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpPSTK_TBL_POi')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF

	IF USED('tmpPSTK_TBL_POi')
		IF RECCOUNT('tmpPSTK_TBL_POi') > 0
			cTBL = PrepareSQLtxt(tmpPSTK_TBL_POi.TBL,'TBL',1)
			RecordTest( 'Record Test Data.', "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"getTBL_POitem('"+cPOitem+"') Second try = '"+cTBL+"'"+CHR(13)+HTML_POitem(cPOitem,.T.)+CHR(13)+cSQL )
		ENDIF

		USE IN tmpPSTK_TBL_POi
	ENDIF
ENDIF

***************************

IF LEN(cTBL)=0
	*Third Try, INCOMING Process 
	cSQL = "SELECT 'S' AS TBL FROM dbo.StockLst_Process "
	cSQL = cSQL+" WHERE PO_item = dbo.f_ProperPOitem('"+cPOitem+"')"
	cSQL = cSQL+" AND ( Process_ID='INCOMING' OR Process_ID='NOT2HPA' )"

	cSQL = cSQL+" UNION "
	cSQL = cSQL+" SELECT 'B' AS TBL FROM dbo.BrokerLst_Process "
	cSQL = cSQL+" WHERE PO_item = dbo.f_ProperPOitem('"+cPOitem+"')"
	cSQL = cSQL+" AND Process_ID='INCOMING' "

	cSQL = cSQL+" UNION "
	cSQL = cSQL+" SELECT 'W' AS TBL FROM dbo.WIPLst_Process "
	cSQL = cSQL+" WHERE PO_item = dbo.f_ProperPOitem('"+cPOitem+"')"
	cSQL = cSQL+" AND Process_ID='INCOMING'"

	SELECT 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_TBL_POi')

	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_TBL_POi')
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_TBL_POi")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_TBL_POi")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpPSTK_TBL_POi')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF

	IF USED('tmpPSTK_TBL_POi')
		IF RECCOUNT('tmpPSTK_TBL_POi') > 0
			cTBL = PrepareSQLtxt(tmpPSTK_TBL_POi.TBL,'TBL',1)
			RecordTest( 'Record Test Data.', "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"getTBL_POitem('"+cPOitem+"') Third try = '"+cTBL+"'"+CHR(13)+HTML_POitem(cPOitem,.T.)+CHR(13)+cSQL )
	*		IF RECCOUNT('tmpPSTK_TBL_POi') > 1
	*			TrackError("Extra Tables","Found WO_Detail "+ALLTRIM(STR(nWO_Detail))+" as more than 1 table!"+CHR(13)+"Be carefull."+CHR(13)+"Function is returning Table '"+cTBL+"'.","Proc_StockLst:getTBL_POitem()",LINENO())
	*			MESSAGEBOX( "Found WO_Detail "+ALLTRIM(STR(nWO_Detail))+" as more than 1 table!"+CHR(13)+"Be carefull. getTBL_POitem()"+CHR(13)+"Function is returning Table '"+cTBL+"'.",0+48,"Warning")
	*		ENDIF

		ENDIF

		USE IN tmpPSTK_TBL_POi
	ENDIF
ENDIF

************************
IF LEN(cTBL)=0
	*try again 4rd Stock_Master
	cSQL = "SELECT 'S' AS TBL FROM dbo.StockLst_Master "
	cSQL = cSQL+" WHERE PO_item = dbo.f_ProperPOitem('"+cPOitem+"')"
	
	cSQL = cSQL+" UNION "
	cSQL = cSQL+" SELECT 'B' AS TBL FROM dbo.BrokerLst_Master "
	cSQL = cSQL+" WHERE PO_item = dbo.f_ProperPOitem('"+cPOitem+"')"
	
	cSQL = cSQL+" UNION "
	cSQL = cSQL+" SELECT 'W' AS TBL FROM dbo.WIPLst_Master "
	cSQL = cSQL+" WHERE PO_item = dbo.f_ProperPOitem('"+cPOitem+"')"
	
	SELECT 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_TBL_POi')

	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_TBL_POi')
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_TBL_POi")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_TBL_POi")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpPSTK_TBL_POi')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF

	IF USED('tmpPSTK_TBL_POi')
		IF RECCOUNT('tmpPSTK_TBL_POi') > 0
			cTBL = PrepareSQLtxt(tmpPSTK_TBL_POi.TBL,'TBL',1)
			RecordTest( 'Record Test Data.', "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"getTBL_POitem('"+cPOitem+"') Fourth try = '"+cTBL+"'"+CHR(13)+HTML_POitem(cPOitem,.T.)+CHR(13)+cSQL )
		ENDIF

		USE IN tmpPSTK_TBL_POi
	ENDIF
ENDIF

*********************

IF LEN(cTBL)=0
	*try again 5th PO type
	cSQL = " SELECT TBL = dbo.f_GetPOItem_TBL( dbo.f_ProperPOitem('"+cPOitem+"') )"
	
	SELECT 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_TBL_POi')

	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_TBL_POi')
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_TBL_POi")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_TBL_POi")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpPSTK_TBL_POi')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF

	IF USED('tmpPSTK_TBL_POi')
		IF RECCOUNT('tmpPSTK_TBL_POi') > 0
			cTBL = PrepareSQLtxt(tmpPSTK_TBL_POi.TBL,'TBL',1)
			RecordTest( 'Record Test Data.', "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"getTBL_POitem('"+cPOitem+"') Fifth try = '"+cTBL+"'"+CHR(13)+HTML_POitem(cPOitem,.T.)+CHR(13)+cSQL )
		ENDIF

		USE IN tmpPSTK_TBL_POi
	ENDIF
ENDIF

IF nConn != pConnHandle
	 = SQLDISCONNECT(nConn )
ENDIF

***
IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF


RETURN cTBL

ENDPROC
********************************** 
	
PROCEDURE getTBL_WO_SelectedProcess
PARAMETERS nWO, pConnHandle
*cTBL = getTBL_WO(nWO, pConnHandle) 


IF VARTYPE(nWO) != "N"
	TrackError("Bad Parameter","Bad Parameter nWO","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF

IF nWO < 1
	RETURN ''
ENDIF


PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	nConn = pConnHandle
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_TBL_POi')
	USE IN tmpPSTK_TBL_POi
ENDIF
PRIVATE cTBL
cTBL = ''

PRIVATE cSQL, nSQLEXEC


*INCOMING Process 
cSQL = "SELECT 'S' AS TBL FROM dbo.StockLst_Process "
cSQL = cSQL+" WHERE WO = "+STR(nWO)
cSQL = cSQL+" AND ( Process_ID='SELECTED' )"

cSQL = cSQL+" UNION "
cSQL = cSQL+" SELECT 'B' AS TBL FROM dbo.BrokerLst_Process "
cSQL = cSQL+" WHERE WO = "+STR(nWO)
cSQL = cSQL+" AND Process_ID='SELECTED'  "

cSQL = cSQL+" UNION "
cSQL = cSQL+" SELECT 'W' AS TBL FROM dbo.WIPLst_Process "
cSQL = cSQL+" WHERE WO = "+STR(nWO)
cSQL = cSQL+" AND Process_ID='SELECTED' "

SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_TBL_POi')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_TBL_POi')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_TBL_POi")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_TBL_POi")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpPSTK_TBL_POi')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

IF USED('tmpPSTK_TBL_POi')
	IF RECCOUNT('tmpPSTK_TBL_POi') > 0
		cTBL = PrepareSQLtxt(tmpPSTK_TBL_POi.TBL,'TBL',1)
		RecordTest( 'Record Test Data.', "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"getTBL_WO("+STR(nWO)+"') Second try = '"+cTBL+"'"+CHR(13)+cSQL )
*		IF RECCOUNT('tmpPSTK_TBL_POi') > 1
*			TrackError("Extra Tables","Found WO_Detail "+ALLTRIM(STR(nWO_Detail))+" as more than 1 table!"+CHR(13)+"Be carefull."+CHR(13)+"Function is returning Table '"+cTBL+"'.","Proc_StockLst:getTBL_POitem()",LINENO())
*			MESSAGEBOX( "Found WO_Detail "+ALLTRIM(STR(nWO_Detail))+" as more than 1 table!"+CHR(13)+"Be carefull. getTBL_POitem()"+CHR(13)+"Function is returning Table '"+cTBL+"'.",0+48,"Warning")
*		ENDIF

	ENDIF

	USE IN tmpPSTK_TBL_POi
ENDIF

****
IF nConn != pConnHandle
	 = SQLDISCONNECT(nConn )
ENDIF

****
IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF


RETURN cTBL

ENDPROC



********************************** 

PROCEDURE Is_Detail_Process
PARAMETERS cTBL, nID_Detail, pProcess_ID, nConn	
*logic = Is_Detail_Process("S",nID_Detail,'INCOMING', nConn)

IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter cTBL","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
IF NOT ( cTBL= "S" OR cTBL= "B" OR cTBL= "W" )
	TrackError("Bad Parameter","Bad cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF

IF NOT VARTYPE(nID_Detail)="N" 
	TrackError("Bad Parameter nID_Detail","Bad Parameter nID_Detail","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
IF nID_Detail < 1
	TrackError("Bad Parameter nID_Detail<1","Bad Parameter ID_Detail < 1","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
PRIVATE cProcess_ID
cProcess_ID = UPPER( PrepareSQLtxt(pProcess_ID,'Process_ID',10) )

IF VARTYPE(nConn) != "N"
	TrackError("Bad Parameter nConn","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
IF nID_Detail = 0
	TrackError("Bad Parameter nID_Detail =0","Bad Parameter ID_Detail","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF

************************
IF USED('tmpPSTK_cntID_Detail_Prc')
	USE IN tmpPSTK_cntID_Detail_Prc
ENDIF
nConn = CheckSQLConnection(nConn)
PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC

cSQL = "SELECT COUNT(*) AS CNTD FROM "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + " dbo.StockLst_Process "
CASE cTBL = "B"
	cSQL = cSQL + " dbo.BrokerLst_Process "
CASE cTBL = "W"
	cSQL = cSQL + " dbo.WIPLst_Process "
OTHERWISE 
	TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.

ENDCASE
cSQL = cSQL + " WHERE ID_Detail = "+STR(nID_Detail)
cSQL = cSQL + " AND Process_ID='"+cProcess_ID+"'"


SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_cntID_Detail_Prc')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_cntID_Detail_Prc')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_cntID_Detail_Prc")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_cntID_Detail_Prc")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_cntID_Detail_Prc')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

PRIVATE lFound
lFound = .F.

IF USED('tmpPSTK_cntID_Detail_Prc')
	IF RECCOUNT('tmpPSTK_cntID_Detail_Prc') > 0
		IF tmpPSTK_cntID_Detail_Prc.CNTD > 0
			lFound = .T.
		ENDIF
	ENDIF

	USE IN tmpPSTK_cntID_Detail_Prc
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lFound
ENDPROC

********************************** 

PROCEDURE Is_ID_Detail_SELECTED_SOitem 
PARAMETERS nID_Detail,cSOitem, cTBL, nConn	
*logic = Is_ID_Detail_SELECTED_SOitem(nID_Detail, cSOitem, cTBL, nConn)
IF NOT VARTYPE(nID_Detail)="N" 
	TrackError("Bad Parameter nID_Detail","Bad Parameter nID_Detail","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
IF nID_Detail < 1
	TrackError("Bad Parameter nID_Detail<1","Bad Parameter ID_Detail < 1","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF

IF VARTYPE(cSOitem) != "C"
	TrackError("Bad Parameter cSOitem","Bad Parameter cSOitem","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
IF Proper_SO_Item(cSOItem) = Proper_SO_Item("")
	IF Proper_InqNumP(cSOItem) = Proper_InqNumP('')
		TrackError("Bad Parameter cSOitem='' ","Bad Parameter SOitem or InqNumP","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
		RETURN .F.
	ENDIF	
ENDIF

IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter cTBL","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
IF NOT ( cTBL= "S" OR cTBL= "B" OR cTBL= "W" )
	TrackError("Bad Parameter","Bad cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF

IF VARTYPE(nConn) != "N"
	TrackError("Bad Parameter nConn","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
IF nID_Detail = 0
	TrackError("Bad Parameter nID_Detail =0","Bad Parameter ID_Detail","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF

************************
IF USED('tmpPSTK_cntID_DetailSO')
	USE IN tmpPSTK_cntID_DetailSO
ENDIF
nConn = CheckSQLConnection(nConn)
PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC

cSQL = "SELECT COUNT(*) AS CNTD FROM "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + " dbo.StockLst_Process "
CASE cTBL = "B"
	cSQL = cSQL + " dbo.BrokerLst_Process "
CASE cTBL = "W"
	cSQL = cSQL + " dbo.WIPLst_Process "
OTHERWISE 
	TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.

ENDCASE
cSQL = cSQL + " WHERE ID_Detail = "+STR(nID_Detail)
IF Proper_SO_Item(cSOItem) <> Proper_SO_Item("")
	cSQL = cSQL + " AND SOitem = dbo.f_ProperSOitem('"+cSOitem+"')"
ELSE
	IF Proper_InqNumP(cSOItem) <> Proper_InqNumP('')
		cSQL = cSQL + " AND InqNumP = '"+Proper_InqNumP(cSOItem)+"'"
	ENDIF
ENDIF

*Check dbo.Sales_Stock to see if Selected Stock has been processed.


SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_cntID_DetailSO')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_cntID_DetailSO')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_cntID_DetailSO")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_cntID_DetailSO")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_cntID_DetailSO')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

PRIVATE lFound
lFound = .F.

IF USED('tmpPSTK_cntID_DetailSO')
	IF RECCOUNT('tmpPSTK_cntID_DetailSO') > 0
		IF tmpPSTK_cntID_DetailSO.CNTD > 0
			lFound = .T.
		ENDIF
	ENDIF

	USE IN tmpPSTK_cntID_DetailSO
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lFound
ENDPROC
**********************************

PROCEDURE Is_ID_Detail_SELECTED_WO  
PARAMETERS nID_Detail ,nWO, cTBL, nConn	
*logic = Is_ID_Detail_SELECTED_WO(nID_Detail, nWO, cTBL, nConn)
IF NOT VARTYPE(nID_Detail)="N" 
	TrackError("Bad Parameter","Bad Parameter nID_Detail","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
IF nID_Detail < 1
*	TrackError("Bad Parameter","Bad Parameter nID_Detail","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF

IF VARTYPE(nWO) != "N"
	TrackError("Bad Parameter","Bad Parameter nWO","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
IF NOT ( cTBL= "S" OR cTBL= "B" OR cTBL= "W" )
	TrackError("Bad Parameter","Bad cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF

IF VARTYPE(nConn) != "N"
	TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF

IF nWO = 0 OR nID_Detail < 0
	*TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF

**********************************************
IF USED('tmpPSTK_cntID_DetailSO')
	USE IN tmpPSTK_cntID_DetailSO
ENDIF
nConn = CheckSQLConnection(nConn)
PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC

cSQL = "SELECT COUNT(*) AS CNTD FROM "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + " dbo.StockLst_Process "
CASE cTBL = "B"
	cSQL = cSQL + " dbo.BrokerLst_Process "
CASE cTBL = "W"
	cSQL = cSQL + " dbo.WIPLst_Process "
OTHERWISE 
	TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDCASE
cSQL = cSQL + " WHERE ID_Detail = "+STR(nID_Detail)
cSQL = cSQL + " AND WO = "+STR(nWO)

*Check dbo.Sales_Stock to see if Selected Stock has been processed.


SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_cntID_DetailSO')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_cntID_DetailSO')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_cntID_DetailSO")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_cntID_DetailSO")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_cntID_DetailSO')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

PRIVATE lFound
lFound = .F.

IF USED('tmpPSTK_cntID_DetailSO')
	IF RECCOUNT('tmpPSTK_cntID_DetailSO') > 0
		IF tmpPSTK_cntID_DetailSO.CNTD > 0
			lFound = .T.
		ENDIF
	ENDIF

	USE IN tmpPSTK_cntID_DetailSO
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lFound
ENDPROC

**********************************

PROCEDURE Is_ID_Detail_SELECTED_InqNumP  
PARAMETERS nID_Detail,cInqNumP, cTBL, nConn	
*logic = Is_ID_Detail_SELECTED_InqNumP(nID_Detail, cInqNumP, cTBL, nConn)
IF NOT VARTYPE(nID_Detail)="N" 
	TrackError("Bad Parameter nID_Detail","Bad Parameter nID_Detail","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
IF nID_Detail < 1
	TrackError("Bad Parameter nID_Detail<1","Bad Parameter ID_Detail < 1","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF

IF VARTYPE(cInqNumP) != "C"
	TrackError("Bad Parameter cInqNumP","Bad Parameter cInqNumP","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF

IF Proper_InqNumP(cInqNumP) = Proper_InqNumP('')
*	TrackError("Bad Parameter cInqNumP='' ","Bad Parameter cInqNumP","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	** Run even with no InqNumP, Just return that False that InqNumP was found
	RETURN .F.
ENDIF	
cInqNumP = Proper_InqNumP(cInqNumP)

IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter cTBL","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
IF NOT ( cTBL= "S" OR cTBL= "B" OR cTBL= "W" )
	TrackError("Bad Parameter","Bad cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF

IF VARTYPE(nConn) != "N"
	TrackError("Bad Parameter nConn","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
IF nID_Detail = 0
	TrackError("Bad Parameter nID_Detail =0","Bad Parameter ID_Detail","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF

************************
IF USED('tmpPSTK_cntID_DetailSO')
	USE IN tmpPSTK_cntID_DetailSO
ENDIF
nConn = CheckSQLConnection(nConn)
PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC

cSQL = "SELECT COUNT(*) AS CNTD FROM "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + " dbo.StockLst_Process "
CASE cTBL = "B"
	cSQL = cSQL + " dbo.BrokerLst_Process "
CASE cTBL = "W"
	cSQL = cSQL + " dbo.WIPLst_Process "
OTHERWISE 
	TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDCASE
cSQL = cSQL + " WHERE ID_Detail = "+STR(nID_Detail)

IF Proper_InqNumP(cInqNumP) != Proper_InqNumP('')
	cSQL = cSQL + " AND InqNumP = '"+Proper_InqNumP(cSOItem)+"'"
ENDIF

*Check dbo.Sales_Stock to see if Selected Stock has been processed.


SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_cntID_DetailSO')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_cntID_DetailSO')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_cntID_DetailSO")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_cntID_DetailSO")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_cntID_DetailSO')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

PRIVATE lFound
lFound = .F.

IF USED('tmpPSTK_cntID_DetailSO')
	IF RECCOUNT('tmpPSTK_cntID_DetailSO') > 0
		IF tmpPSTK_cntID_DetailSO.CNTD > 0
			lFound = .T.
		ENDIF
	ENDIF

	USE IN tmpPSTK_cntID_DetailSO
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lFound
ENDPROC

**********************************

PROCEDURE Is_SOitem_Process_SELECTED 
PARAMETERS pSOitem, cTBL, nConn	
*logic = Is_SOitem_Process_SELECTED(cSOitem, cTBL, nConn)


IF VARTYPE(pSOitem) != "C"
	TrackError("Bad Parameter cSOitem","Bad Parameter cSOitem","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF

IF VARTYPE(nConn) != "N"
	TrackError("Bad Parameter nConn","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF

IF VARTYPE(cTBL) != "C"
	cTBL=''
ENDIF
IF NOT ( cTBL= "S" OR cTBL= "B" OR cTBL= "W" )
ENDIF

PRIVATE cSOitem
cSOitem = PrepareSQLtxt(pSOitem,'SOitem',10)

*******
IF USED('tmpPSTK_cntISEL_SOi')
	USE IN tmpPSTK_cntISEL_SOi
ENDIF
nConn = CheckSQLConnection(nConn)
PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC

cSQL = "SELECT TBL FROM ("

cSQL = cSQL + "SELECT 'S' AS TBL FROM dbo.StockLst_Process WITH(NOLOCK) "
cSQL = cSQL + " WHERE SOitem = dbo.f_ProperSOitem('"+cSOItem+"') AND Process_ID='SELECTED  '"
cSQL = cSQL + " UNION "
cSQL = cSQL + "SELECT 'B' AS TBL FROM dbo.BrokerLst_Process WITH(NOLOCK) "
cSQL = cSQL + " WHERE SOitem = dbo.f_ProperSOitem('"+cSOItem+"') AND Process_ID='SELECTED  '"
cSQL = cSQL + " UNION "
cSQL = cSQL + "SELECT 'W' AS TBL FROM dbo.WIPLst_Process WITH(NOLOCK) "
cSQL = cSQL + " WHERE SOitem = dbo.f_ProperSOitem('"+cSOItem+"') AND Process_ID='SELECTED  '"
cSQL = cSQL + " ) t "


*Check dbo.Sales_Stock to see if Selected Stock has been processed.


SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_cntISEL_SOi')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_cntISEL_SOi')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_cntISEL_SOi")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_cntISEL_SOi")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_cntISEL_SOi')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

PRIVATE lFound, lFoundStock, lFoundBroker 
lFound = .F.
lFoundStock = .F.
lFoundBroker = .F.

IF USED('tmpPSTK_cntISEL_SOi')
	IF RECCOUNT('tmpPSTK_cntISEL_SOi') > 0

		SCAN
			IF tmpPSTK_cntISEL_SOi.TBL="S"
				lFoundStock = .T.
			ENDIF
			IF tmpPSTK_cntISEL_SOi.TBL="B"
				lFoundBroker = .T.
			ENDIF
		ENDSCAN
		lFound = .T.

	ENDIF

	USE IN tmpPSTK_cntISEL_SOi
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

IF cTBL= "S" 
	RETURN lFoundStock 
ENDIF
IF cTBL= "B" 
	RETURN lFoundBroker 
ENDIF

RETURN lFound
ENDPROC

****************************************
PROCEDURE get_ID_Master_with_WO_Detail 
PARAMETERS nWO_Detail, cTBL, pConnHandle

*nID=get_ID_Master_with_WO_Detail (pnReceivingID,'S',ThisForm.nConnHandle)


IF VARTYPE(nWO_Detail) != "N"
	TrackError("Bad Parameter","Bad Parameter nWO_Detail","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF NOT ( cTBL= "S" OR cTBL= "B" OR cTBL= "W" )
	TrackError("Bad Parameter","Bad cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF


IF UPPER(cTBL) = "STOCKLST"
	cTBL = "S"
ENDIF
IF UPPER(cTBL) = "BROKERLST"
	cTBL = "B"
ENDIF

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
	ENDIF
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF

nConn = CheckSQLConnection(nConn)

PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_ID')
	USE IN tmpPSTK_ID
ENDIF

PRIVATE nID
nID = 0

PRIVATE cSQL, nSQLEXEC
DO CASE
CASE cTBL = "S"
	cSQL = "SELECT ID FROM dbo.StockLst_Master"
CASE cTBL = "B"
	cSQL = "SELECT ID FROM dbo.BrokerLst_Master"
CASE cTBL = "W"
	cSQL = "SELECT ID FROM dbo.WIPLst_Master"
OTHERWISE 
	TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDCASE
cSQL = cSQL + " WHERE WO_Detail = "+ALLTRIM(STR(nWO_Detail))


IF nConn > 0
	SELECT 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_ID' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_ID' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_ID")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_ID")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_ID')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_ID')
		IF VARTYPE(tmpPSTK_ID.ID) = "N"
			nID = tmpPSTK_ID.ID
		ENDIF
		USE IN tmpPSTK_ID
	ENDIF
	IF nConn != pConnHandle
		SQLDISCONNECT( nConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:get_ID_Master_with_WO_Detail",LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nID 

ENDPROC

****************************

PROCEDURE get_ID_Detail_with_WO_Detail 
PARAMETERS nWO_Detail, cTBL, pConnHandle

*nID=get_ID_Detail_with_WO_Detail (pnReceivingID,'S',ThisForm.nConnHandle)


IF VARTYPE(nWO_Detail) != "N"
	TrackError("Bad Parameter","Bad Parameter nWO_Detail","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF


IF UPPER(cTBL) = "STOCKLST"
	cTBL = "S"
ENDIF
IF UPPER(cTBL) = "BROKERLST"
	cTBL = "B"
ENDIF

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
	ENDIF
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF

nConn = CheckSQLConnection(nConn)

PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_ID_detail')
	USE IN tmpPSTK_ID_Detail
ENDIF

PRIVATE nID_Detail
nID_Detail = 0

PRIVATE cSQL, nSQLEXEC
DO CASE
CASE cTBL = "S"
	cSQL = "SELECT TOP 1 ID_Detail FROM dbo.StockLst_Master M "
	cSQL = cSQL + " INNER JOIN dbo.StockLst_Detail D ON M.ID = D.ID "
CASE cTBL = "B"
	cSQL = "SELECT TOP 1 ID_Detail FROM dbo.BrokerLst_Master M "
	cSQL = cSQL + " INNER JOIN dbo.BrokerLst_Detail D ON M.ID = D.ID "
CASE cTBL = "B"
	cSQL = "SELECT TOP 1 ID_Detail FROM dbo.WIPLst_Master M "
	cSQL = cSQL + " INNER JOIN dbo.WIPLst_Detail D ON M.ID = D.ID "
OTHERWISE 
	TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDCASE
cSQL = cSQL + " WHERE WO_Detail = "+ALLTRIM(STR(nWO_Detail))
cSQL = cSQL + " ORDER BY S_QTY DESC"

IF nConn > 0
	SELECT 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_ID_Detail' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_ID_Detail' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_ID_Detail")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_ID_Detail")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_ID_Detail')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_ID_Detail')
		IF VARTYPE(tmpPSTK_ID_Detail.ID_Detail) = "N"
			nID_Detail = tmpPSTK_ID_Detail.ID_Detail
		ENDIF
		USE IN tmpPSTK_ID_Detail
	ENDIF
	IF nConn != pConnHandle
		SQLDISCONNECT( nConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:get_ID_Detail_with_WO_Detail",LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nID_Detail 

ENDPROC
********************************** 
	
PROCEDURE ID_Detail_Exists 
PARAMETERS pnID_Detail, cTBL, pConnHandle, pWhat, pNum

*lExists = ID_Detail_Exists(pnID_Detail,'StockLst',ThisForm.nConnHandle, pWhat, pNum)


IF VARTYPE(pnID_Detail) != "N"
	TrackError("Bad Parameter","Bad Parameter ID_Detail","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF


IF UPPER(LEFT(cTBL,1)) = "S"
	cTBL = "S"
ENDIF
IF UPPER(LEFT(cTBL,1)) = "B"
	cTBL = "B"
ENDIF

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
	ENDIF
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF



PRIVATE cWhat, nNum
cWhat = PrepareSQLtxt(pWhat,'What',10)
nNum  = PrepareSQLnum(pNum,'Num',-3)

nConn = CheckSQLConnection(nConn)

PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_ID_Detail_Exists')
	USE IN tmpPSTK_ID_Detail_Exists
ENDIF
SELECT 0

PRIVATE lExists
lExists = .F.

PRIVATE cSQL, nSQLEXEC
DO CASE
CASE cTBL = "S"
	cSQL = "SELECT COUNT(ID) AS CNTD FROM dbo.StockLst_Detail WHERE ID_Detail = "+ALLTRIM(STR( pnID_Detail))
CASE cTBL = "B"
	cSQL = "SELECT COUNT(ID) AS CNTD FROM dbo.BrokerLst_Detail WHERE ID_Detail = "+ALLTRIM(STR( pnID_Detail))
CASE cTBL = "W"
	cSQL = "SELECT COUNT(ID) AS CNTD FROM dbo.WIPLst_Detail WHERE ID_Detail = "+ALLTRIM(STR( pnID_Detail))
OTHERWISE
	*return
	IF nConn != pConnHandle
		SQLDISCONNECT( nConn )
	ENDIF
	IF NOT EMPTY(cAlias)
		IF USED(cAlias)
			SELECT (cAlias)
		ELSE
			RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
		ENDIF
	ENDIF

	RETURN .F.
ENDCASE
***
IF cWhat == "WO"
	 cSQL = cSQL + " AND WO="+STR(nNum)	 
ENDIF
IF cWhat = "WO_Detail"
ENDIF

***
IF nConn > 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_ID_Detail_Exists' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_ID_Detail_Exists' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_ID_Detail_Exists")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_ID_Detail_Exists")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_ID_Detail_Exists')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_ID_Detail_Exists')
		IF RECCOUNT('tmpPSTK_ID_Detail_Exists')>0
			IF tmpPSTK_ID_Detail_Exists.CNTD >  0
				lExists = .T.
			ENDIF
		ENDIF
		USE IN tmpPSTK_ID_Detail_Exists
	ENDIF
	IF nConn != pConnHandle
		SQLDISCONNECT( nConn )
	ENDIF

ELSE
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lExists 

ENDPROC
********************************** 
	
PROCEDURE Sales_Stock_Exists 
PARAMETERS pnNumber, pcField, pConnHandle

*lExists = Sales_Stock_Exists(nRMA_Detail,'RMA_Detail',ThisForm.nConnHandle)


IF VARTYPE(pnNumber) != "N"
	TrackError("Bad Parameter","Bad Parameter nNumber","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
IF VARTYPE(pcField) != "C"
	TrackError("Bad Parameter","Bad Parameter pcField","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF


PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
	ENDIF
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF

nConn = CheckSQLConnection(nConn)

PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_SSl_Exists')
	USE IN tmpPSTK_SSl_Exists
ENDIF
SELECT 0

PRIVATE lExists
lExists = .F.

PRIVATE cSQL, nSQLEXEC

cSQL = "SELECT COUNT(ID) AS CNTD FROM dbo.Sales_Stock WITH(NOLOCK) "
DO CASE
CASE pcField = 'RMA_Detail'
	cSQL = cSQL + " WHERE RMA_Detail_ID = "+ALLTRIM(STR( pnNumber ))
OTHERWISE
	TrackError("Bad Parameter","Bad Parameter pcField not programed. "+pcField ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDCASE

IF nConn > 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_SSl_Exists' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_SSl_Exists' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_SSl_Exists")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_SSl_Exists")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_SSl_Exists')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_SSl_Exists')
		IF RECCOUNT('tmpPSTK_SSl_Exists')>0
			IF tmpPSTK_SSl_Exists.CNTD >  0
				lExists = .T.
			ENDIF
		ENDIF
		USE IN tmpPSTK_SSl_Exists
	ENDIF
	IF nConn != pConnHandle
		SQLDISCONNECT( nConn )
	ENDIF

ELSE
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lExists 

ENDPROC

*********************************

PROCEDURE Remove_Incoming_Process_RID  
PARAMETERS cPOItem, nPieces, nActualW, nQTY, nPU, nConn, nPOcomplete, pReceivingID, pTBL 
*Return .T. on Complete
*lOK = Remove_Incoming_Process_RID(cPOItem,nPieces,nActualW,nPU,nQTY,nConn, nPOcomplete, pReceivingID, pTBL )
*Updates with ReceivingID before deleting.

PRIVATE lCloseConn
lCloseConn = .F.
IF VARTYPE(cPOItem) != "C"
	*TrackError("Bad Parameter","Bad Parameter cPOitem","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	*RETURN .F.
	*This Proc is about RID, ignore a missing POitem!
	cPOItem = Proper_PO_Item("")
ENDIF
*IF Proper_PO_Item(cPOItem) = Proper_PO_Item("")
*	*TrackError("Bad Parameter","Bad Parameter cPOItem","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
*	*RETURN .F.
*ENDIF
IF NOT( VARTYPE(nPieces) = "N" OR VARTYPE(nPieces) = "Y" )
	TrackError("Bad Parameter","Bad Parameter nPieces","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
IF NOT( VARTYPE(nActualW) = "N" OR VARTYPE(nActualW) = "Y" )
	TrackError("Bad Parameter","Bad Parameter nActualW","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
IF NOT( VARTYPE(nQTY) = "N" OR VARTYPE(nQTY) = "Y" )
	TrackError("Bad Parameter","Bad Parameter nQTY","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF

IF VARTYPE(nPOcomplete) != "N"
	nPOcomplete = 0 &&Not found
	*nPOcomplete = 1 &&Partail
	*nPOcomplete = 2 &&Complete
ENDIF
IF VARTYPE(pReceivingID) != "N"
	TrackError("Bad Parameter","Bad Parameter pReceivingID","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
nReceivingID = pReceivingID
IF nReceivingID < 1
	TrackError("Bad Parameter","Bad Parameter pReceivingID","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF

PRIVATE cTBL
IF VARTYPE(pTBL) != "C"
	cTBL = ''
ELSE
	cTBL = pTBL
ENDIF

IF VARTYPE(nConn) != "N"
	nConn = 0 
ENDIF
IF nConn < 1
	nConn = get_SQLSTRINGCONNECT() 
	lCloseConn = .T.
ENDIF
PRIVATE lFoundPO_item, lPOitemComplete 
lFoundPO_item = .F.
lPOitemComplete = .F.

nConn = CheckSQLConnection(nConn)
PRIVATE cAlias 
cAlias = ALIAS()

IF NOT( cTBL = "S" OR cTBL = "B" OR cTBL = "W" )
	cTBL = ""
	TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF

*Find POitem and\or TBL
PRIVATE cSQL, nSQLEXEC
cSQL =        "SELECT  'S' AS STK FROM dbo.StockLst_Process WITH(NOLOCK) "
cSQL = cSQL + " WHERE PO_Item = dbo.f_ProperPOitem('"+cPOitem+"')"
cSQL = cSQL + " AND ( Process_ID = 'INCOMING' OR Process_ID = 'PARTRECV' OR Process_ID = 'Receiving') "
cSQL = cSQL + " UNION "
cSQL = cSQL + " SELECT  'B' AS STK FROM dbo.BrokerLst_Process WITH(NOLOCK) "
cSQL = cSQL + " WHERE PO_Item = dbo.f_ProperPOitem('"+cPOitem+"')"
cSQL = cSQL + " AND ( Process_ID = 'INCOMING' OR Process_ID = 'PARTRECV' OR Process_ID = 'Receiving')"
cSQL = cSQL + " UNION "
cSQL = cSQL + " SELECT  'W' AS STK FROM dbo.WIPLst_Process WITH(NOLOCK) "
cSQL = cSQL + " WHERE PO_Item = dbo.f_ProperPOitem('"+cPOitem+"')"
cSQL = cSQL + " AND ( Process_ID = 'INCOMING' OR Process_ID = 'PARTRECV' OR Process_ID = 'Receiving')"
 
*cSQL = "SELECT COUNT(*) AS Cntd FROM dbo.StockLst_Process WHERE "  &&ID_Detail_Process
*cSQL = cSQL + " PO_Item = dbo.f_ProperPOitem('"+cPOitem+"') AND ( Process_ID = 'INCOMING' OR Process_ID = 'Receiving')"

IF USED("tmpPSTK_ID_Detail_Process")
	USE IN tmpPSTK_ID_Detail_Process
ENDIF
SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_ID_Detail_Process')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_ID_Detail_Process')
ENDDO
IF nSQLEXEC < 1
	SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_ID_Detail_Process')
	RecordError(nSQLEXEC,"SQL Error","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
ENDIF

IF USED('tmpPSTK_ID_Detail_Process')
	IF RECCOUNT('tmpPSTK_ID_Detail_Process') > 0
	
		SELECT tmpPSTK_ID_Detail_Process
		IF LEN(cTBL)>0
			LOCATE FOR STK = cTBL
			IF FOUND('tmpPSTK_ID_Detail_Process')
				lFoundPO_item = .T.
			ENDIF
		ELSE
			cTBL = UPPER(ShowSQLtxt(tmpPSTK_ID_Detail_Process.STK,'STK',1))
			lFoundPO_item = .T.
		ENDIF
		
	ENDIF
	USE IN tmpPSTK_ID_Detail_Process
ENDIF

*!*	IF NOT lFoundPO_item 
*!*		*Wait till end to close connection and reset Alias
*!*		TrackError("Did not find INCOMING Process TBL="+cTBL+" for POitem '"+cPOitem+"'"+CHR(13)+"Remove_Incoming_Process_RID() for ReceivingID = "+STR(nReceivingID)+CHR(13)+cSQL ,"did not find POitem in Process", "Proc_StockLst:"+PROGRAM(), LINENO(1))
*!*		*RecordError(nSQLEXEC,"SQL Error","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
*!*	ENDIF


DO CASE
CASE nPOcomplete = 2
	lPOitemComplete = .T.
CASE nPOcomplete = 1
	lPOitemComplete = .F.
OTHERWISE
	lPOitemComplete = .F.
ENDCASE

***
IF lFoundPO_item &&AND nReceivingID > 0
	*Stamp the ReceivingID on the Process
	cSQL = "UPDATE "
	DO CASE
	CASE cTBL = "S"
		cSQL = cSQL + " dbo.StockLst_Process "
	CASE cTBL = "B"
		cSQL = cSQL + " dbo.BrokerLst_Process "
	CASE cTBL = "W"
		cSQL = cSQL + " dbo.WIPLst_Process "
	
	ENDCASE
	cSQL = cSQL + " SET ReceivingID = "+STR(nReceivingID)
	cSQL = cSQL + " WHERE PO_Item = dbo.f_ProperPOitem('"+cPOitem+"')"
	cSQL = cSQL + " AND ( Process_ID = 'INCOMING' OR Process_ID = 'PARTRECV' OR Process_ID = 'Receiving')"
	cSQL = cSQL + " AND ISNULL(ReceivingID,0) = 0 "
	*Process_ID = 'Receiving' 
	
	nSQLEXEC = SQLEXEC(nConn, cSQL )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL )
	ENDDO
	IF nSQLEXEC < 1
		SQLEXECError(cSQL, nConn, nSQLEXEC )
		RecordError(nSQLEXEC,"SQL Error","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF		
ENDIF		

***	
PRIVATE cSOitem,cSalesPerson,dtStartDate,dDueDated,cComment,nProcess_ID
PRIVATE cProcessor,cAllowSub
PRIVATE nPU,nQTY,nPounds,nID_Detail,nID_Detail_Process,nOldReceivingID,nWO

***
IF lFoundPO_item 
	IF nPOcomplete = 1	&&Receive NOT complete
		IF USED('tmpPSTK_ProcessWeight')
			USE IN tmpPSTK_ProcessWeight
		ENDIF
		SELECT 0
		
		*Need to get old data before deleting Process
		cSQL = "SELECT * "
		*SOitem,[PO_item],[SalesPerson]"
		*cSQL = cSQL + ",[StartDate],[DueDate],[Comment],[Process_ID]"
		*cSQL = cSQL + ",[Processor],[AllowSub]"
		*cSQL = cSQL + ",[PU],[QTY],[Pounds],[ID_Detail],[ID_Detail_Process],[ReceivingID],[WO]"
		*cSQL = cSQL + ",[WO_Detail],[QTY_Due],[Prc_Form],[Prc_PCs],[Prc_Dim2],[Prc_Dim3]"
		*PU,QTY,Orered_QTY,Pounds,Prc_Q_QTY, Prc_Q_PU
		DO CASE
		CASE cTBL = "S"
			cSQL = cSQL + " FROM dbo.StockLst_Process WITH(NOLOCK) "
		CASE cTBL = "B"
			cSQL = cSQL + " FROM dbo.BrokerLst_Process WITH(NOLOCK) "
		CASE cTBL = "W"
			cSQL = cSQL + " FROM dbo.WIPLst_Process WITH(NOLOCK) "
		ENDCASE
		
		cSQL = cSQL + " WHERE PO_Item = dbo.f_ProperPOitem('"+cPOitem+"')"
		cSQL = cSQL + " AND ( Process_ID = 'INCOMING' OR Process_ID = 'PARTRECV' OR Process_ID = 'Receiving')"
		cSQL = cSQL + " AND ISNULL(ReceivingID,0) = 0 "
		
		nSQLEXEC = SQLEXEC(nConn, cSQL )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_ProcessWeight')
		ENDDO
		IF nSQLEXEC < 1
			SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_ProcessWeight')
			RecordError(nSQLEXEC,"SQL Error","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ELSE
			
			IF USED('tmpPSTK_ProcessWeight')
				IF RECCOUNT('tmpPSTK_ProcessWeight')>0
					IF RECCOUNT('tmpPSTK_ProcessWeight')>1
						IF nReceivingID > 0
							SELECT tmpPSTK_ProcessWeight
							LOCATE FOR ReceivingID = nReceivingID
							
							IF FOUND()
								TrackError(cSQL+CHR(13)+ "Found more than 1 Lst_Process, nReceivingID= "+ALLTRIM(STR(nReceivingID)),"Too much data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
								*TrackError("Problem","message","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
							ELSE
								TrackError(cSQL+CHR(13)+ "Found more than 1 Lst_Process, nReceivingID= "+ALLTRIM(STR(nReceivingID))+" was not FOUDND!"+". ","Too much data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
								*TrackError("Problem","message","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
							ENDIF
						ELSE
							TrackError(cSQL+CHR(13)+"Found more than 1 Lst_Process, nReceivingID is 0"+". ","Too much data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
							*TrackError("Problem","message","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
						ENDIF
					ENDIF
					
*!*						cSOitem			= PrepareSQLtxt(tmpPSTK_ProcessWeight.SOitem,'SOitem',10)
*!*						*cPO_item		= PrepareSQLtxt(tmpPSTK_ProcessWeight.PO_item,'PO_item',12) Use the passed in cPOitem
*!*						cSalesPerson	= PrepareSQLtxt(tmpPSTK_ProcessWeight.SalesPerson,'SalesPerson',20)
*!*						dtStartDate		= PrepareSQLdateTime(tmpPSTK_ProcessWeight.StartDate,'StartDate')
*!*						dDueDated		= PrepareSQLdate(tmpPSTK_ProcessWeight.DueDate,'DueDate',.F.,.T.)
*!*						cComment		= PrepareSQLtxt(tmpPSTK_ProcessWeight.Comment,'Comment',100)
*!*						nProcess_ID		= PrepareSQLnum(tmpPSTK_ProcessWeight.Process_ID,'Process_ID',-3)
*!*						cProcessor		= PrepareSQLtxt(tmpPSTK_ProcessWeight.Processor,'Processor',20)
*!*						cAllowSub		= PrepareSQLtxt(tmpPSTK_ProcessWeight.AllowSub,'AllowSub',1)
*!*						nPU			= PrepareSQLnum(tmpPSTK_ProcessWeight.PU,'PU',-1)
*!*						nQTY		= PrepareSQLnum(tmpPSTK_ProcessWeight.QTY,'QTY',-3)
*!*						nOrdered_QTY= PrepareSQLnum(tmpPSTK_ProcessWeight.Ordered_QTY,'Ordered_QTY',-5)
*!*						nOrdered_P	= PrepareSQLnum(tmpPSTK_ProcessWeight.Ordered_P,'Ordered_P',-5)
*!*						nPounds		= PrepareSQLnum(tmpPSTK_ProcessWeight.Pounds,'Pounds',7,1)
*!*						nID_Detail	= PrepareSQLnum(tmpPSTK_ProcessWeight.ID_Detail,'ID_Detail',-3)
*!*						nID_Detail_Process	= PrepareSQLnum(tmpPSTK_ProcessWeight.ID_Detail_Process,'ID_Detail_Process',-3)
*!*						nOldReceivingID	= PrepareSQLnum(tmpPSTK_ProcessWeight.ReceivingID,'ReceivingID',-3)
*!*						nWO				= PrepareSQLnum(tmpPSTK_ProcessWeight.WO,'WO',-3)
*!*	,[Prc_Form],[Prc_PCs],[Prc_Dim1],[Prc_Dim2],[Prc_Dim3]					
				ENDIF							
			
				USE IN tmpPSTK_ProcessWeight
			ENDIF
		ENDIF
	ENDIF
ENDIF

IF lFoundPO_item 
	*IF nPOcomplete = 2 OR nPOcomplete = 1	
		****************************************************
		*Remove the INCOMING process 
		cSQL = "DELETE FROM "
		DO CASE 
		CASE cTBL = "S"
			cSQL = cSQL + " dbo.StockLst_Process "
		CASE cTBL = "B"
			cSQL = cSQL + " dbo.BrokerLst_Process "
		CASE cTBL = "W"
			cSQL = cSQL + " dbo.WIPLst_Process "
		ENDCASE
		cSQL = cSQL + " WHERE PO_Item = dbo.f_ProperPOitem('"+cPOitem+"')"
		cSQL = cSQL + " AND ( Process_ID = 'INCOMING' OR Process_ID = 'PARTRECV' OR Process_ID = 'Receiving')"
		cSQL = cSQL + " AND ISNULL(ReceivingID,0) = "+STR(nReceivingID)

		nSQLEXEC = SQLEXEC(nConn, cSQL )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL )
		ENDDO
		IF nSQLEXEC < 1
			SQLEXECError(cSQL, nConn, nSQLEXEC )
			RecordError(nSQLEXEC,"SQL Error","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ELSE
			TrackMess(cSQL+ CHR(13)+SYS(16,1))
		ENDIF
	*ENDIF
ENDIF


IF lCloseConn
	SQLDISCONNECT( nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN .T.
ENDPROC
*********************************

PROCEDURE Remove_Incoming_Process_by_WO_Detail_RID  
PARAMETERS nWO_Detail, nPieces, nActualW, nQTY, nPU, nConn, nWODcomplete, pReceivingID, pTBL 
*Return .T. on Complete
*lOK = Remove_Incoming_Process_by_WO_Detail_RID(cPOItem,nPieces,nActualW,nPU,nQTY,nConn, nWODcomplete, pReceivingID, pTBL )
*Updates with ReceivingID before deleting.

PRIVATE lCloseConn
lCloseConn = .F.
nWO_Detail = PrepareSQLnum(nWO_Detail,'WO_Detail',-3)

IF NOT( VARTYPE(nPieces) = "N" OR VARTYPE(nPieces) = "Y" )
	TrackError("Bad Parameter","Bad Parameter nPieces","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
IF NOT( VARTYPE(nActualW) = "N" OR VARTYPE(nActualW) = "Y" )
	TrackError("Bad Parameter","Bad Parameter nActualW","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
IF NOT( VARTYPE(nQTY) = "N" OR VARTYPE(nQTY) = "Y" )
	TrackError("Bad Parameter","Bad Parameter nQTY","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF

nPOcomplete = PrepareSQLnum(nPOcomplete,'POcomplete',-1)
IF VARTYPE(pReceivingID) != "N"
	TrackError("Bad Parameter","Bad Parameter pReceivingID","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
nReceivingID = pReceivingID
IF nReceivingID < 1
	TrackError("Bad Parameter","Bad Parameter pReceivingID","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF

PRIVATE cTBL
IF VARTYPE(pTBL) != "C"
	cTBL = ''
ELSE
	cTBL = pTBL
ENDIF

IF VARTYPE(nConn) != "N"
	nConn = 0 
ENDIF
IF nConn < 1
	nConn = get_SQLSTRINGCONNECT() 
	lCloseConn = .T.
ENDIF

PRIVATE lFoundWO_Detail, lWO_DetailComplete 
lFoundWO_Detail = .F.
lWO_DetailComplete = .F.

nConn = CheckSQLConnection(nConn)
PRIVATE cAlias 
cAlias = ALIAS()

IF NOT( cTBL = "S" OR cTBL = "B" OR cTBL = "W" )
	cTBL = ""
ELSE 
	TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF

*Find WO_Detail and\or TBL
PRIVATE cSQL, nSQLEXEC
cSQL =        "SELECT  'S' AS STK FROM dbo.StockLst_Process WITH(NOLOCK) "
cSQL = cSQL + " WHERE WO_Detail ="+STR(nWO_Detail)
cSQL = cSQL + " AND ( Process_ID = 'INCOMING' OR Process_ID = 'PARTRECV' OR Process_ID = 'Receiving') "
cSQL = cSQL + " UNION "
cSQL = cSQL + " SELECT  'B' AS STK FROM dbo.BrokerLst_Process WITH(NOLOCK) "
cSQL = cSQL + " WHERE WO_Detail ="+STR(nWO_Detail)
cSQL = cSQL + " AND ( Process_ID = 'INCOMING' OR Process_ID = 'PARTRECV' OR Process_ID = 'Receiving')"
cSQL = cSQL + " UNION "
cSQL = cSQL + " SELECT  'W' AS STK FROM dbo.WIPLst_Process WITH(NOLOCK) "
cSQL = cSQL + " WHERE WO_Detail ="+STR(nWO_Detail)
cSQL = cSQL + " AND ( Process_ID = 'INCOMING' OR Process_ID = 'PARTRECV' OR Process_ID = 'Receiving')"
 
*cSQL = "SELECT COUNT(*) AS Cntd FROM dbo.StockLst_Process WHERE "  &&ID_Detail_Process
*cSQL = cSQL + " PO_Item = dbo.f_ProperPOitem('"+cPOitem+"') AND ( Process_ID = 'INCOMING' OR Process_ID = 'Receiving')"

IF USED("tmpPSTK_ID_Detail_Process")
	USE IN tmpPSTK_ID_Detail_Process
ENDIF
SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_ID_Detail_Process')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_ID_Detail_Process')
ENDDO
IF nSQLEXEC < 1
	SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_ID_Detail_Process')
	RecordError(nSQLEXEC,"SQL Error","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
ENDIF

IF USED('tmpPSTK_ID_Detail_Process')
	IF RECCOUNT('tmpPSTK_ID_Detail_Process') > 0
	
		SELECT tmpPSTK_ID_Detail_Process
		IF LEN(cTBL)>0
			LOCATE FOR STK = cTBL
			IF FOUND('tmpPSTK_ID_Detail_Process')
				lFoundWO_Detail = .T.
			ENDIF
		ELSE
			cTBL = UPPER(ShowSQLtxt(tmpPSTK_ID_Detail_Process.STK,'STK',1))
			lFoundWO_Detail = .T.
		ENDIF
		
	ENDIF
	USE IN tmpPSTK_ID_Detail_Process
ENDIF

*!*	IF NOT lFoundWO_Detail 
*!*		*Wait till end to close connection and reset Alias
*!*		TrackError("Did not find INCOMING Process TBL="+cTBL+" for POitem '"+cPOitem+"'"+CHR(13)+"Remove_Incoming_Process_RID() for ReceivingID = "+STR(nReceivingID)+CHR(13)+cSQL ,"did not find POitem in Process", "Proc_StockLst:"+PROGRAM(), LINENO(1))
*!*		*RecordError(nSQLEXEC,"SQL Error","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
*!*	ENDIF


DO CASE
CASE nWODcomplete = 2
	lWO_DetailComplete = .T.
CASE nWODcomplete = 1
	lWO_DetailComplete = .F.
OTHERWISE
	lWO_DetailComplete = .F.
ENDCASE

***
IF lFoundWO_Detail &&AND nReceivingID > 0
	*Stamp the ReceivingID on the Process
	cSQL = "UPDATE "
	DO CASE
	CASE cTBL = "S"
		cSQL = cSQL + " dbo.StockLst_Process "
	CASE cTBL = "B"
		cSQL = cSQL + " dbo.BrokerLst_Process "
	CASE cTBL = "W"
		cSQL = cSQL + " dbo.WIPLst_Process "
	ENDCASE
	cSQL = cSQL + " SET ReceivingID = "+STR(nReceivingID)
	cSQL = cSQL + " WHERE PO_Item = dbo.f_ProperPOitem('"+cPOitem+"')"
	cSQL = cSQL + " AND ( Process_ID = 'INCOMING' OR Process_ID = 'PARTRECV' OR Process_ID = 'Receiving')"
	cSQL = cSQL + " AND ISNULL(ReceivingID,0) = 0 "
	*Process_ID = 'Receiving' 
	
	nSQLEXEC = SQLEXEC(nConn, cSQL )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL )
	ENDDO
	IF nSQLEXEC < 1
		SQLEXECError(cSQL, nConn, nSQLEXEC )
		RecordError(nSQLEXEC,"SQL Error","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF		
ENDIF		

***	
PRIVATE cSOitem,cSalesPerson,dtStartDate,dDueDated,cComment,nProcess_ID
PRIVATE cProcessor,cAllowSub
PRIVATE nPU,nQTY,nPounds,nID_Detail,nID_Detail_Process,nOldReceivingID,nWO

***
IF lFoundWO_Detail 
	IF nWODcomplete = 1	&&Receive NOT complete
		IF USED('tmpPSTK_ProcessWeight')
			USE IN tmpPSTK_ProcessWeight
		ENDIF
		SELECT 0
		
		*Need to get old data before deleting Process
		cSQL = "SELECT SOitem,[PO_item],[SalesPerson]"
		cSQL = cSQL + ",[StartDate],[DueDate],[Comment],[Process_ID]"
		cSQL = cSQL + ",[Processor],[AllowSub]"
		cSQL = cSQL + ",[PU],[QTY],[Pounds],[ID_Detail],[ID_Detail_Process]"
		cSQL = cSQL + ",[ReceivingID],[WO],[WO_Detail]"
		*cSQL = cSQL + ",[QTY_Due],[Prc_Form],[Prc_PCs],[Prc_Dim2],[Prc_Dim3]"
		*PU,QTY,Orered_QTY,Pounds,Prc_Q_QTY, Prc_Q_PU
		DO CASE
		CASE cTBL = "S"
			cSQL = cSQL + " FROM dbo.StockLst_Process WITH(NOLOCK) "
		CASE cTBL = "B"
			cSQL = cSQL + " FROM dbo.BrokerLst_Process WITH(NOLOCK) "
		CASE cTBL = "W"
			cSQL = cSQL + " FROM dbo.WIPLst_Process WITH(NOLOCK) "
		ENDCASE
		
		cSQL = cSQL + " WHERE PO_Item = dbo.f_ProperPOitem('"+cPOitem+"')"
		cSQL = cSQL + " AND ( Process_ID = 'INCOMING' OR Process_ID = 'PARTRECV' OR Process_ID = 'Receiving')"
		cSQL = cSQL + " AND ISNULL(ReceivingID,0) = 0 "
		
		nSQLEXEC = SQLEXEC(nConn, cSQL )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_ProcessWeight')
		ENDDO
		IF nSQLEXEC < 1
			SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_ProcessWeight')
			RecordError(nSQLEXEC,"SQL Error","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ELSE
			
			IF USED('tmpPSTK_ProcessWeight')
				IF RECCOUNT('tmpPSTK_ProcessWeight')>0
					IF RECCOUNT('tmpPSTK_ProcessWeight')>1
						IF nReceivingID > 0
							SELECT tmpPSTK_ProcessWeight
							LOCATE FOR ReceivingID = nReceivingID
							
							IF FOUND()
								TrackError(cSQL+CHR(13)+ "Found more than 1 Lst_Process, pReceivID = "+ALLTRIM(STR(pReceivID)),"Too much data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
								*TrackError("Problem","message","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
							ELSE
								TrackError(cSQL+CHR(13)+ "Found more than 1 Lst_Process, pReceivID = "+ALLTRIM(STR(pReceivID))+" was not FOUDND!"+". ","Too much data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
								*TrackError("Problem","message","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
							ENDIF
						ELSE
							TrackError(cSQL+CHR(13)+"Found more than 1 Lst_Process, pReceivID is 0"+". ","Too much data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
							*TrackError("Problem","message","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
						ENDIF
					ENDIF
					
					cSOitem			= PrepareSQLtxt(tmpPSTK_ProcessWeight.SOitem,'SOitem',10)
					*cPO_item		= PrepareSQLtxt(tmpPSTK_ProcessWeight.PO_item,'PO_item',12) Use the passed in cPOitem
					cSalesPerson	= PrepareSQLtxt(tmpPSTK_ProcessWeight.SalesPerson,'SalesPerson',20)
					dtStartDate		= PrepareSQLdateTime(tmpPSTK_ProcessWeight.StartDate,'StartDate')
					dDueDated		= PrepareSQLdate(tmpPSTK_ProcessWeight.DueDate,'DueDate',.F.,.T.)
					cComment		= PrepareSQLtxt(tmpPSTK_ProcessWeight.Comment,'Comment',100)
					nProcess_ID		= PrepareSQLnum(tmpPSTK_ProcessWeight.Process_ID,'Process_ID',-3)
					cProcessor		= PrepareSQLtxt(tmpPSTK_ProcessWeight.Processor,'Processor',20)
					cAllowSub		= PrepareSQLtxt(tmpPSTK_ProcessWeight.AllowSub,'AllowSub',1)
					*nPWeight		= PrepareSQLnum(tmpPSTK_ProcessWeight.PWeight,'PWeight',-5)
					*nPPc		= PrepareSQLnum(tmpPSTK_ProcessWeight.PPc,'PPC',-3)
					nPU			= PrepareSQLnum(tmpPSTK_ProcessWeight.PU,'PU',-1)
					nQTY		= PrepareSQLnum(tmpPSTK_ProcessWeight.QTY,'QTY',-3)
					nPounds		= PrepareSQLnum(tmpPSTK_ProcessWeight.Pounds,'Pounds',7,1)
					nID_Detail	= PrepareSQLnum(tmpPSTK_ProcessWeight.ID_Detail,'ID_Detail',-3)
					nID_Detail_Process	= PrepareSQLnum(tmpPSTK_ProcessWeight.ID_Detail_Process,'ID_Detail_Process',-3)
					nOldReceivingID	= PrepareSQLnum(tmpPSTK_ProcessWeight.ReceivingID,'ReceivingID',-3)
					nWO				= PrepareSQLnum(tmpPSTK_ProcessWeight.WO,'WO',-3)
					
				ENDIF							
			
				USE IN tmpPSTK_ProcessWeight
			ENDIF
		ENDIF
	ENDIF
ENDIF

IF lFoundWO_Detail 
	*IF nWODcomplete = 2 OR nWODcomplete = 1	
		****************************************************
		*Remove the INCOMING process 
		cSQL = "DELETE FROM "
		DO CASE 
		CASE cTBL = "S"
			cSQL = cSQL + " dbo.StockLst_Process "
		CASE cTBL = "B"
			cSQL = cSQL + " dbo.BrokerLst_Process "
		CASE cTBL = "W"
			cSQL = cSQL + " dbo.WIPLst_Process "
		ENDCASE
		cSQL = cSQL + " WHERE WO_Detail ="+STR(nWO_Detail)
		cSQL = cSQL + " AND ( Process_ID = 'INCOMING' OR Process_ID = 'PARTRECV' OR Process_ID = 'Receiving')"
		cSQL = cSQL + " AND ISNULL(ReceivingID,0) = "+STR(nReceivingID)

		nSQLEXEC = SQLEXEC(nConn, cSQL )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL )
		ENDDO
		IF nSQLEXEC < 1
			SQLEXECError(cSQL, nConn, nSQLEXEC )
			RecordError(nSQLEXEC,"SQL Error","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ELSE
			TrackMess(cSQL+ CHR(13)+SYS(16,1))
		ENDIF
	*ENDIF
ENDIF


IF lCloseConn
	SQLDISCONNECT( nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN .T.
ENDPROC
******************************************* 


     
PROCEDURE Remove_Incoming_Process_by_POitem 
PARAMETER pPOitem, pConnHandle
*lOK = Remove_Incoming_Process_by_POitem(pPOitem, pConnHandle)
*Deletes INCOMING across all Tables for POitem, nothing about ReceivingID

IF VARTYPE(pPOitem)!="C"
	RecordError( 0, 'Remove_Incoming_Process_by_POitem', "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No Poitem" )
	RETURN .F.
ENDIF
IF VARTYPE(pConnHandle)!="N"
	RecordError( 0, 'Remove_Incoming_Process_by_POitem', "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No pConnHandle" )
	RETURN .F.
ENDIF
IF Proper_PO_Item(pPOItem) = Proper_PO_Item("0-00") OR Proper_PO_Item(pPOItem) = Proper_PO_Item("")
	RecordError( 0, 'Remove_Incoming_Process_by_POitem', "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"EMPTY POitem" )
	RETURN .F.
ENDIF

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
	ENDIF
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF
nConn = CheckSQLConnection(nConn)


PRIVATE lRETURN 
lRETURN = .T.

PRIVATE cSQL, nSQLEXEC

*DELETE FROM all Lst_Process Tables

cSQL = "DELETE FROM "
cSQL = cSQL + " dbo.StockLst_Process "
cSQL = cSQL + " WHERE ( Process_ID = 'INCOMING' OR Process_ID = 'NOT2HPA' OR Process_ID = 'PARTRECV' )"
cSQL = cSQL + " AND dbo.f_ProperPOitem(PO_item) = dbo.f_ProperPOitem('"+pPOitem+"')"

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
	IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC)
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		RETURN .F.
	ENDIF
ENDIF

*DELETE FROM all Lst_Process Tables

cSQL = "DELETE FROM "
cSQL = cSQL + " dbo.BrokerLst_Process "
cSQL = cSQL + " WHERE ( Process_ID = 'INCOMING' OR Process_ID = 'NOT2HPA' OR Process_ID = 'PARTRECV' )"
cSQL = cSQL + " AND dbo.f_ProperPOitem(PO_item) = dbo.f_ProperPOitem('"+pPOitem+"')"

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
	IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC)
		lRETURN = .F.
		RecordError(nSQLEXEC,"Failed to Remove_Incoming_Process_by_POitem","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(), cSQL )
	ELSE
	ENDIF
ENDIF

IF lRETURN 
	*DELETE FROM all Lst_Process Tables

	cSQL = "DELETE FROM "
	cSQL = cSQL + " dbo.WIPLst_Process "
	cSQL = cSQL + " WHERE ( Process_ID = 'INCOMING' OR Process_ID = 'NOT2HPA' OR Process_ID = 'PARTRECV' )"
	cSQL = cSQL + " AND dbo.f_ProperPOitem(PO_item) = dbo.f_ProperPOitem('"+pPOitem+"')"

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
		IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC)
			RecordError(nSQLEXEC,"Failed to Remove_Incoming_Process_by_POitem","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(), cSQL )
			lRETURN = .F.
		ELSE
			TrackMess( "Remove_Incoming_Process_by_POitem: Delete FROM dbo.StockLst_Process/BrokerLst_Process/WIPLst_Process  WHERE 'INCOMING' or 'PARTRECV' for POitem:"+ALLTRIM(cPOitem)+".")
		ENDIF
	ELSE
		TrackMess( "Remove_Incoming_Process_by_POitem: Delete FROM dbo.StockLst_Process/BrokerLst_Process/WIPLst_Process  WHERE 'INCOMING' or 'PARTRECV' for POitem:"+ALLTRIM(cPOitem)+".")
	ENDIF
ENDIF

IF nConn != pConnHandle
	SQLDISCONNECT( nConn )
ENDIF

RETURN lRETURN 
ENDPROC		

*******************

PROCEDURE Select_before_Remove_Incoming_Process_by_ID_Detail
PARAMETER pTBL, nID_Detail, pOrderType, pOrderNum, nReceivingID, pConnHandle
*lOK = Select_before_Remove_Incoming_Process_by_ID_Detail(pTBL, nID_Detail, pOrderType, pOrderNum, nReceivingID, pConnHandle)
*Creates a 'SELECTED' from 'INCOMING' ??????

IF VARTYPE(pTBL)!="C"
	TrackError("Bad Parameter","Bad Parameter pTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN .F.
ENDIF
PRIVATE cTBL
cTBL = UPPER(pTBL)
IF NOT ( pTBL="S" OR pTBL="B" OR pTBL="W" )
	TrackError("Bad Parameter","Bad Parameter pTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN .F.
ENDIF

IF VARTYPE(nID_Detail)!= "N"
	TrackError("Bad Parameter","Bad Parameter nID_Detail","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN .F.
ENDIF
**********
PRIVATE cOrderType, cOrderNum, nOrderNum
IF VARTYPE(pOrderType) != "C"
	TrackError("Bad Parameter","Bad Parameter pOrderType","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN .F.
ENDIF

DO CASE
CASE pOrderType = "POitem"
	cOrderNum = PrepareSQLtxt(pOrderNum,'POitem',13)
	nOrderNum = 0
CASE pOrderType = "SOitem"
	cOrderNum = PrepareSQLtxt(pOrderNum,'SOitem',10)
	nOrderNum = 0
CASE pOrderType = "WO_Detail"
	cOrderNum = ''
	nOrderNum = PrepareSQLnum(pOrderNum,'WO_Detail',-3)
CASE pOrderType = "WO"
	cOrderNum = ''
	nOrderNum = PrepareSQLnum(pOrderNum,'WO',-3)
OTHERWISE
	TrackError("Bad Parameter","Bad Parameter pOrderType","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN .F.
ENDCASE

nReceivingID = PrepareSQLnum(nReceivingID,'ReceivingID',-3)

***************
PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
	ENDIF
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE lReturn
lReturn = .T.

PRIVATE cSQL, nSQLEXEC

PRIVATE lFoundSelect
lFoundSelect = .F.

IF USED("tmpPSTK_cntSelect")
	USE IN tmpPSTK_cntSelect
ENDIF

SELECT 0

cSQL = "SELECT COUNT(*) AS CNTD FROM "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + " dbo.StockLst_Process "
CASE cTBL = "B"
	cSQL = cSQL + " dbo.BrokerLst_Process "
CASE cTBL = "W"
	cSQL = cSQL + " dbo.WIPLst_Process "
OTHERWISE 
	TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDCASE
cSQL = cSQL + " WHERE ID_Detail = "+STR(nID_Detail)
*cSQL = cSQL + " AND ( Process_ID = 'SELECTED' OR Process_ID = 'PARTSELECT' OR Process_ID = 'NOT2HPA' )"
cSQL = cSQL + " AND ( Process_ID = 'INCOMING' OR Process_ID = 'PARTRECV' OR Process_ID = 'NOT2HPA')"

nSQLEXEC = SQLEXEC(nConn, cSQL, 'cntSelect' )
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_cntSelect' )
ENDDO
IF nSQLEXEC < 1
	SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_cntSelect' )
	RecordError(nSQLEXEC,"SQL Error","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
ENDIF	
IF USED('tmpPSTK_cntSelect')
	IF RECCOUNT('tmpPSTK_cntSelect') > 0
		lFoundSelect = ( tmpPSTK_cntSelect.CNTD > 0 )
	ENDIF
	USE IN tmpPSTK_cntSelect
ENDIF

PRIVATE lActiveOrder
lActiveOrder = .F.
IF NOT lFoundSelect 
	*Is Order Still Active
	DO CASE
	CASE pOrderType = "POitem"
		lActiveOrder = ( Count_POIteminPurchaseOrder(cOrderNum, nConn,'ACTIVE' ) > 0)
	CASE pOrderType = "SOitem"
		lActiveOrder = ( Count_SOIteminSales(cOrderNum, nConn, 'ACTIVE' )>0 )
		*= ( Count_SOIteminSales(cOrderNum, nConn, 'CONVERSIONSERVICE' )>0 )
	CASE pOrderType = "WO_Detail"
		lActiveOrder = ( Count_WODinWO_Detail( nOrderNum, nConn, 'ACTIVE' )>0 )
	CASE pOrderType = "WO"	
		lActiveOrder = ( Count_WOinWO( nOrderNum, nConn, 'ACTIVE' )>0 )
	ENDCASE
ENDIF


IF NOT lFoundSelect AND lActiveOrder
***
	cSQL = "INSERT INTO "
	DO CASE
	CASE pTBL = "S"
		cSQL = cSQL + " dbo.StockLst_Process "
	CASE pTBL = "B"
		cSQL = cSQL + " dbo.BrokerLst_Process "
	CASE pTBL = "W"
		cSQL = cSQL + " dbo.WIPLst_Process "
	ENDCASE
	cSQL = cSQL + " ([SOitem]"
	cSQL = cSQL + ",[PO_item]"
	cSQL = cSQL + ",[SalesPerson]"
	cSQL = cSQL + ",[StartDate]"
	cSQL = cSQL + ",[DueDate]"
	cSQL = cSQL + ",[Comment]"
	cSQL = cSQL + ",[Process_ID]"
	cSQL = cSQL + ",[Processor]"
	cSQL = cSQL + ",[AllowSub]"

	cSQL = cSQL + ",[PU]"
	cSQL = cSQL + ",[QTY]"
	cSQL = cSQL + ",[Pounds]"
	cSQL = cSQL + ",[Ordered_QTY]"
	cSQL = cSQL + ",[Ordered_P]"
*Prc_Q_QTY, Prc_Q_PU
	cSQL = cSQL + ",[ID_Detail]"
	*cSQL = cSQL + ",[ID_Detail_Process]"
	cSQL = cSQL + ",[ReceivingID]"
	cSQL = cSQL + ",[WO]"
	cSQL = cSQL + ",[WO_Detail]"
*	cSQL = cSQL + ",[QTY_Due]"

	cSQL = cSQL + ",[Prc_Form]"
	cSQL = cSQL + ",[Prc_PCs]"
	cSQL = cSQL + ",[Prc_Dim1]"
	cSQL = cSQL + ",[Prc_Dim2]"
	cSQL = cSQL + ",[Prc_Dim3] ) "

	cSQL = cSQL + " SELECT dbo.f_ProperSOitem(SOitem) AS SOitem "
	cSQL = cSQL + ",dbo.f_ProperPOitem(PO_item) AS PO_Item "
	cSQL = cSQL + ",[SalesPerson]"
	cSQL = cSQL + ",[StartDate]"
	cSQL = cSQL + ",[DueDate]"
	cSQL = cSQL + ",[Comment]"
	cSQL = cSQL + ",'SELECTED'"	&&Process_ID
	cSQL = cSQL + ",'Receive Edit'"	&&[Processor]"
	cSQL = cSQL + ",'N'"	&&[AllowSub]"
	cSQL = cSQL + ",[PU]"
	cSQL = cSQL + ",[QTY]"
	cSQL = cSQL + ",[Pounds]"
	cSQL = cSQL + ",[Ordered_QTY]"
	cSQL = cSQL + ",[Ordered_P]"
	cSQL = cSQL + ",[ID_Detail]"
	*cSQL = cSQL + ",[ID_Detail_Process]"
	cSQL = cSQL + ","+STR(nReceivingID )	&&[ReceivingID]"
	cSQL = cSQL + ",[WO]"
	cSQL = cSQL + ",[WO_Detail]"
*	cSQL = cSQL + ",[QTY_Due]"

	cSQL = cSQL + ",[Prc_Form]"
	cSQL = cSQL + ",[Prc_PCs]"
	cSQL = cSQL + ",[Prc_Dim1]"
	cSQL = cSQL + ",[Prc_Dim2]"
	cSQL = cSQL + ",[Prc_Dim3]"
	DO CASE
	CASE pTBL = "S"
		cSQL = cSQL + " FROM dbo.StockLst_Process "
	CASE pTBL = "B"
		cSQL = cSQL + " FROM dbo.BrokerLst_Process "
	CASE pTBL = "W"
		cSQL = cSQL + " FROM dbo.WIPLst_Process "
	ENDCASE
	cSQL = cSQL + " WHERE ID_Detail = "+STR(nID_Detail)
	cSQL = cSQL + " AND ( Process_ID = 'INCOMING' OR Process_ID = 'PARTRECV' OR Process_ID = 'NOT2HPA')"
		
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
		IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC)
			RecordError(nSQLEXEC,"Failed to add SELECT Process","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(), cSQL )
			lReturn = .F.
		ELSE
			TrackMess( "Created a SELECT process before deleting the INCOMING: FROM "+TableName_TBL(cTBL)+" WHERE 'INCOMING' or 'NOT2HPA' or 'PARTRECV' for ID_Detail = "+STR(nID_Detail)+".")
		ENDIF
	ELSE
		TrackMess( "Created a SELECT process before deleting the INCOMING: FROM "+TableName_TBL(cTBL)+" WHERE 'INCOMING' or 'NOT2HPA' or 'PARTRECV' for ID_Detail = "+STR(nID_Detail)+".")
		IF pOrderType = "SOitem"
			Save_SOitem_Status( cOrderNum, VAL(cOrderNum), 'Select STK', 'Before Receiving Deleted the Incoming Process, a SELECT was created', nConn )
			*Save_Sales_Status( nSO, cWhat, cComment, nConn )
		ENDIF
	ENDIF
ELSE
	*NOT lFoundSelect AND lActiveOrder
ENDIF
IF nConn != pConnHandle
	SQLDISCONNECT( nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF


RETURN lReturn 
ENDPROC	

*******************

PROCEDURE Remove_Incoming_Process_by_ID_Detail 
PARAMETER pTBL, nID_Detail, pReceivingID, pConnHandle
*lOK = Remove_Incoming_Process_by_ID_Detail(cTBL, ID_Detail, pReceivingID, pConnHandle)

IF VARTYPE(pTBL)!="C"
	TrackError("Bad Parameter","Bad Parameter pTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN .F.
ENDIF
PRIVATE cTBL
cTBL = UPPER(pTBL)
IF NOT ( pTBL="S" OR pTBL="B" OR pTBL="W" )
	TrackError("Bad Parameter","Bad Parameter pTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN .F.
ENDIF

IF VARTYPE(nID_Detail)!= "N"
	TrackError("Bad Parameter","Bad Parameter nID_Detail","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN .F.
ENDIF
PRIVATE nReceivingID 
IF VARTYPE(pReceivingID) != "N"
	pReceivingID = 0
	nReceivingID = 0
ELSE
	nReceivingID = pReceivingID
ENDIF


PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
	ENDIF
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE lReturn
lReturn = .T.

PRIVATE cSQL, nSQLEXEC

IF nReceivingID > 0
	*Record nReceivingID before deleting ID_Detail Process
	*Stamp the ReceivingID on the Process
	cSQL = "UPDATE "
	DO CASE
	CASE cTBL = "S"
		cSQL = cSQL + " dbo.StockLst_Process "
	CASE cTBL = "B"
		cSQL = cSQL + " dbo.BrokerLst_Process "
	CASE cTBL = "W"
		cSQL = cSQL + " dbo.WIPLst_Process "
	ENDCASE
	cSQL = cSQL + " SET ReceivingID = "+STR(nReceivingID)
	cSQL = cSQL + ",Process_ID = 'RECEIVED' "
	cSQL = cSQL + " WHERE ID_Detail = "+STR(nID_Detail)
	cSQL = cSQL + " AND ( Process_ID = 'INCOMING' OR Process_ID = 'PARTRECV' OR Process_ID = 'Receiving' OR Process_ID = 'NOT2HPA')"
	cSQL = cSQL + " AND ISNULL(ReceivingID,0) = 0 "
	
	nSQLEXEC = SQLEXEC(nConn, cSQL )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL )
	ENDDO
	IF nSQLEXEC < 1
		SQLEXECError(cSQL, nConn, nSQLEXEC )
		RecordError(nSQLEXEC,"SQL Error","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF	
ENDIF

********************* Backup Delete
cSQL = "DELETE FROM "
DO CASE
CASE pTBL = "S"
	cSQL = cSQL + " dbo.StockLst_Process "
CASE pTBL = "B"
	cSQL = cSQL + " dbo.BrokerLst_Process "
CASE pTBL = "W"
	cSQL = cSQL + " dbo.WIPLst_Process "
ENDCASE
cSQL = cSQL + " WHERE ID_Detail = "+STR(nID_Detail)
cSQL = cSQL + " AND ( Process_ID = 'INCOMING' OR Process_ID = 'PARTRECV' OR Process_ID = 'Receiving' OR Process_ID = 'NOT2HPA')"
cSQL = cSQL + " AND ISNULL(ReceivingID,0) = "+STR(nReceivingID)

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
	IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC)
		RecordError(nSQLEXEC,"Failed to Remove_Incoming_Process_by_ID_Detail","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(), cSQL )
		lReturn = .F.
	ELSE
		TrackMess( "Remove_Incoming_Process_by_ID_Detail: Delete FROM "+TableName_TBL(cTBL)+" WHERE 'INCOMING' or 'NOT2HPA' or 'PARTRECV' for ID_Detail = "+STR(nID_Detail)+".")
	ENDIF
ELSE
	TrackMess( "Remove_Incoming_Process_by_ID_Detail: Delete FROM "+TableName_TBL(cTBL)+" WHERE 'INCOMING' or 'NOT2HPA' or 'PARTRECV' for ID_Detail = "+STR(nID_Detail)+".")
ENDIF

IF nConn != pConnHandle
	SQLDISCONNECT( nConn )
ENDIF


RETURN lReturn 
ENDPROC	

*******************

PROC Remove_Lst_ID 
PARAMETER pTBL, pID, pConnHandle, plForceDelete,pFrom,pWhy

PRIVATE cTBL
cTBL = UPPER(PrepareSQLtxt(pTBL,"TBL",1))
DO CASE
CASE cTBL = "S"
CASE cTBL = "B"
CASE cTBL = "W"
OTHERWISE
	MESSAGEBOX("Function: Remove_Lst_ID_Detail()"+CHR(13)+"No TBL Parameter!",0,"Error")
	RecordError(0,"No TBL Parameter" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),"No TBL Parameter" )
	RETURN .F.
ENDCASE

IF VARTYPE(pID)!="N"
	RecordError( 0, 'Remove_Lst_ID ', "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No pDI" )
	RETURN .F.
ENDIF
IF VARTYPE(pConnHandle)!="N"
	RecordError( 0, 'Remove_Lst_ID ', "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No pConnHandle" )
	RETURN .F.
ENDIF
IF VARTYPE(plForceDelete) != "L"
	lForceDelete = .F.
ELSE
	lForceDelete = plForceDelete
ENDIF

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
	ENDIF
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF
nConn = CheckSQLConnection(nConn)


IF VARTYPE(pFrom)!= "C"
	pFrom = "PROC Remove_Lst_ID "
ENDIF
IF VARTYPE(pWhy)!= "C"
	pWhy = ""
ENDIF

PRIVATE lReturn
lReturn = .T.
PRIVATE lTranAlreadySet, nProp, lSQLtranOK 	
lTranAlreadySet = .F.
nProp = 0 
lSQLtranOK = .T.
			
PRIVATE cSQL, nSQLEXEC 
**Check for Detail First
IF USED('tmpPSTK_del_ID')
	USE IN tmpPSTK_del_ID
ENDIF

PRIVATE cAlias 
cAlias = ALIAS()

SELECT 0
cSQL = "SELECT ID_Detail FROM "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + " dbo.StockLst_Detail "
CASE cTBL = "B"
	cSQL = cSQL + " dbo.BrokerLst_Detail "
CASE cTBL = "W"
	cSQL = cSQL + " dbo.WIPLst_Detail "
ENDCASE
cSQL = cSQL + " WHERE ID = "+ STR(pID)

nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_del_ID' )
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_del_ID' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_del_ID")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_del_ID")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpPSTK_del_ID')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		IF USED('tmpPSTK_del_ID')
			USE IN tmpPSTK_del_ID
		ENDIF
		lReturn = .F.
		lSQLtranOK = .F.
	ELSE 
		nSQLEXEC = 1
		lSQLtranOK = .T.
	ENDIF
ENDIF
IF nSQLEXEC > 0
	IF USED('tmpPSTK_del_ID')
		IF RECCOUNT('tmpPSTK_del_ID') > 0
		
		
			*Transaction
			nProp = SQLGETPROP(nConn, 'Transactions')
			lTranAlreadySet = (nProp = 2)
			
			IF NOT lTranAlreadySet
				= SQLSETPROP(nConn, 'Transactions', 2)  && Manual transactions
			ENDIF
	
			SCAN
			*ID_Detail's that point to nID
				IF lForceDelete
					SELECT tmpPSTK_del_ID
					*  Kept losing tabel tmpPSTK_del_ID
					SELECT 0		&&Move from this Table so it exists when Remove_Lst_Detail_by_ID_Detail is Done
														  *tmpPSTK_del_ID
					IF Remove_Lst_Detail_by_ID_Detail(cTBL,tmpPSTK_del_ID.ID_Detail,nConn,"Remove_Lst_ID", pWhy)
						SELECT tmpPSTK_del_ID
						lSQLOK = .T.
						LOOP
					ELSE
						*Could not remove Detail
						lReturn = .F.
						lSQLtranOK = .F.
						SELECT tmpPSTK_del_ID
						EXIT 
					ENDIF
					SELECT tmpPSTK_del_ID
				ELSE
					
					MESSAGEBOX("A Detail record is dependant on this Master record."+CHR(13)+"You must remove the detail record first.",0,"You cannot delete!")
					TrackError("A Detail record is dependant on this Master record."+CHR(13)+"You must remove the detail record first"+CHR(13)+cSQL ,"Cannot delete Master", "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
					*IF USED('tmpPSTK_del_ID')
					*	USE IN tmpPSTK_del_ID
					*ENDIF
					lReturn = .F.
					EXIT
				ENDIF
			ENDSCAN
		ENDIF
		
		*******************************************************
		********* now remove the ID record
		
		IF lReturn
		*	IF RECCOUNT('tmpPSTK_del_ID') > 0
	*			IF MESSAGEBOX("Are you sure you want to delete this Master Record?",4+32,"Confirm Delete") = 6
				DO CASE
				CASE cTBL = "S"
					cSQL_Delete="DELETE FROM dbo.StockLst_Master "
				CASE cTBL = "B"
					cSQL_Delete="DELETE FROM dbo.BrokerLst_Master "
				CASE cTBL = "W"
					cSQL_Delete="DELETE FROM dbo.WIPLst_Master "
				ENDCASE
				cSQL_Delete=cSQL_Delete+" WHERE ID = "+STR(pID)
				
				nSQLEXEC = SQLEXEC(nConn, cSQL_Delete )
				DO WHILE nSQLEXEC = 0
					WAIT WINDOW 'SQL' TIMEOUT 1
					nSQLEXEC = SQLEXEC(nConn, cSQL_Delete )
				ENDDO
				IF nSQLEXEC < 0 &&Try again!
					nSQLEXEC = SQLEXEC(nConn, cSQL_Delete , "")
					DO WHILE nSQLEXEC = 0
						WAIT WINDOW 'SQL 2' TIMEOUT 1
						nSQLEXEC = SQLEXEC(nConn, cSQL_Delete , "")
						
						IF nSQLEXEC < 0
							IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
								nSQLEXEC = 0
							ENDIF
						ENDIF
					ENDDO
				ENDIF
				IF nSQLEXEC < 0
					IF NOT SQLEXECError(cSQL_Delete ,nConn,nSQLEXEC,'')
						RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL_Delete )
						IF USED('tmpPSTK_del_ID')
							USE IN tmpPSTK_del_ID
						ENDIF
						lReturn = .F.
						lSQLtranOK = .F.
					ENDIF
				ELSE
*					=SQLCOMMIT(nConn)
					TrackMess("Remove_Lst_ID: "+cSQL_Delete)
				ENDIF
			*ENDIF
		
		ENDIF
		IF USED('tmpPSTK_del_ID')
			USE IN tmpPSTK_del_ID
		ENDIF
	ENDIF
ENDIF


IF nProp > 0
	IF lSQLtranOK
		= SQLCOMMIT(nConn)
	ELSE
		= SQLROLLBACK(nConn)
	ENDIF
	
	IF NOT lTranAlreadySet
		= SQLSETPROP(nConn, 'Transactions', 1)  && 1AUTO, 2MANUAL Trans
		*= SQLSETPROP(nConn, 'Transactions', 2)  && Manual transactions
	ENDIF
ENDIF	
	
			
IF nConn != pConnHandle
	SQLDISCONNECT( nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lReturn
ENDPROC

*!*	*******************
*!*	PROC Remove_StockLst_ID 
*!*	PARAMETER pID, pConn, plForceDelete,pFrom,pWhy
*!*	*Remove_StockLst_ID(nMaster_ID,nConnHandle,lForceDelete,pFrom,pWhy)

*!*	IF VARTYPE(pID)!="N"
*!*		RecordError( 0, 'Remove_StockLst_ID ', "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No pDI" )
*!*		RETURN .F.
*!*	ENDIF
*!*	IF VARTYPE(pConn)!="N"
*!*		RecordError( 0, 'Remove_StockLst_ID ', "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No pConn" )
*!*		RETURN .F.
*!*	ENDIF
*!*	IF VARTYPE(plForceDelete) != "L"
*!*		lForceDelete = .F.
*!*	ELSE
*!*		lForceDelete = plForceDelete
*!*	ENDIF
*!*	pConn = CheckSQLConnection(pConn)

*!*	IF VARTYPE(pFrom)!= "C"
*!*		pFrom = ""
*!*	ENDIF
*!*	IF VARTYPE(pWhy)!= "C"
*!*		pWhy = ""
*!*	ENDIF

*!*	PRIVATE cSQL, nSQLEXEC 
*!*	**Check for Detail First
*!*	IF USED('tmpPSTK_CountDetail')
*!*		USE IN tmpPSTK_CountDetail
*!*	ENDIF

*!*	PRIVATE cAlias 
*!*	cAlias = ALIAS()

*!*	SELECT 0
*!*	cSQL = "SELECT COUNT(*) AS Cntd FROM dbo.StockLst_Detail WHERE ID = "+ STR(pID)
*!*	nSQLEXEC = SQLEXEC(pConn, cSQL, 'tmpPSTK_CountDetail' )
*!*	DO WHILE nSQLEXEC = 0
*!*		WAIT WINDOW 'SQL' TIMEOUT 1
*!*		nSQLEXEC = SQLEXEC(pConn, cSQL, 'tmpPSTK_CountDetail' )
*!*	ENDDO
*!*	IF nSQLEXEC < 0 &&Try again!
*!*		nSQLEXEC = SQLEXEC(nConn, cSQL_Delete , "")
*!*		DO WHILE nSQLEXEC = 0
*!*			WAIT WINDOW 'SQL 2' TIMEOUT 1
*!*			nSQLEXEC = SQLEXEC(nConn, cSQL_Delete , "")
*!*			
*!*			IF nSQLEXEC < 0
*!*				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
*!*					nSQLEXEC = 0
*!*				ENDIF
*!*			ENDIF
*!*		ENDDO
*!*	ENDIF
*!*	IF nSQLEXEC < 0
*!*		IF NOT SQLEXECError(cSQL,pConn,nSQLEXEC, 'tmpPSTK_CountDetail')
*!*		IF USED('tmpPSTK_CountDetail')
*!*			USE IN tmpPSTK_CountDetail
*!*		ENDIF
*!*		RETURN .F.
*!*	ELSE
*!*		IF USED('tmpPSTK_CountDetail')
*!*			DO WHILE tmpPSTK_CountDetail.Cntd > 0
*!*				IF lForceDelete
*!*					*Remove Detail and Count again
*!*					IF Remove_Lst_Detail_by_MasterID(cTBL,pID,pConn,pFrom,pWhy)
*!*						
*!*						IF USED('tmpPSTK_CountDetail')
*!*							USE IN tmpPSTK_CountDetail
*!*						ENDIF

*!*						SELECT 0
*!*						cSQL = "SELECT COUNT(*) AS Cntd FROM dbo.StockLst_Detail WHERE ID = "+ STR(pID)
*!*						nSQLEXEC = SQLEXEC(pConn, cSQL, 'tmpPSTK_CountDetail' )
*!*						DO WHILE nSQLEXEC = 0
*!*							WAIT WINDOW 'SQL' TIMEOUT 1
*!*							nSQLEXEC = SQLEXEC(pConn, cSQL, 'tmpPSTK_CountDetail' )
*!*						ENDDO
*!*	IF nSQLEXEC < 0 &&Try again!
*!*		nSQLEXEC = SQLEXEC(nConn, cSQL_Delete , "")
*!*		DO WHILE nSQLEXEC = 0
*!*			WAIT WINDOW 'SQL 2' TIMEOUT 1
*!*			nSQLEXEC = SQLEXEC(nConn, cSQL_Delete , "")
*!*			
*!*			IF nSQLEXEC < 0
*!*				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
*!*					nSQLEXEC = 0
*!*				ENDIF
*!*			ENDIF
*!*		ENDDO
*!*	ENDIF
*!*						IF nSQLEXEC < 0
*!*							IF NOT SQLEXECError(cSQL,pConn,nSQLEXEC, 'tmpPSTK_CountDetail')
*!*							IF USED('tmpPSTK_CountDetail')
*!*								USE IN tmpPSTK_CountDetail
*!*							ENDIF
*!*							RETURN .F.
*!*						ENDIF
*!*					ELSE
*!*						*Could not remove Detail
*!*						RETURN .F.
*!*					ENDIF
*!*				ELSE
*!*					MESSAGEBOX("A Detail record is dependant on this Master record."+CHR(13)+;
*!*					  "You must remove the detail record first.",0,"You cannot delete!")
*!*					IF USED('tmpPSTK_CountDetail')
*!*						USE IN tmpPSTK_CountDetail
*!*					ENDIF
*!*					RETURN .F.
*!*				ENDIF
*!*			ENDDO
*!*			
*!*			
*!*			IF tmpPSTK_CountDetail.Cntd = 0
*!*	*			IF MESSAGEBOX("Are you sure you want to delete this Master Record?",4+32,"Confirm Delete") = 6
*!*				cSQL_Delete="DELETE FROM dbo.StockLst_Master WHERE ID = "+STR(pID)
*!*				nSQLEXEC = SQLEXEC(pConn, cSQL_Delete )
*!*				DO WHILE nSQLEXEC = 0
*!*					WAIT WINDOW 'SQL' TIMEOUT 1
*!*					nSQLEXEC = SQLEXEC(pConn, cSQL_Delete )
*!*				ENDDO
*!*	IF nSQLEXEC < 0 &&Try again!
*!*		nSQLEXEC = SQLEXEC(nConn, cSQL_Delete , "")
*!*		DO WHILE nSQLEXEC = 0
*!*			WAIT WINDOW 'SQL 2' TIMEOUT 1
*!*			nSQLEXEC = SQLEXEC(nConn, cSQL_Delete , "")
*!*			
*!*			IF nSQLEXEC < 0
*!*				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
*!*					nSQLEXEC = 0
*!*				ENDIF
*!*			ENDIF
*!*		ENDDO
*!*	ENDIF
*!*				IF nSQLEXEC < 0
*!*					IF NOT SQLEXECError(cSQL_Delete ,pConn,nSQLEXEC,'')
*!*					IF USED('tmpPSTK_CountDetail')
*!*						USE IN tmpPSTK_CountDetail
*!*					ENDIF
*!*					RETURN .F.
*!*				ELSE
*!*					=SQLCOMMIT(pConn)
*!*					TrackMess("Remove_StockLst_ID: "+cSQL)
*!*					*IF pFrom = "Edit PO"
*!*					*ENDIF

*!*				ENDIF
*!*			ENDIF
*!*			USE IN tmpPSTK_CountDetail
*!*		ENDIF
*!*	ENDIF

*!*	IF NOT EMPTY(cAlias)
*!*		IF USED(cAlias)
*!*			SELECT (cAlias)
*!*		ELSE
*		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
*ENDIF
*!*	ENDIF

*!*	RETURN .T.
*!*	ENDPROC

*!*	******************

*!*	PROC Remove_BrokerLst_ID 
*!*	PARAMETER pID, pConn, plForceDelete,pFrom,pWhy
*!*	*Remove_BrokerLst_ID(nMaster_ID,nConnHandle,lForceDelete,pFrom,pWhy)

*!*	IF VARTYPE(pID)!="N"
*!*		RecordError( 0, 'Remove_BrokerLst_ID', "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No pDI" )
*!*		RETURN .F.
*!*	ENDIF
*!*	IF VARTYPE(pConn)!="N"
*!*		RecordError( 0, 'Remove_BrokerLst_ID', "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No pConn" )
*!*		RETURN .F.
*!*	ENDIF
*!*	IF VARTYPE(plForceDelete) != "L"
*!*		lForceDelete = .F.
*!*	ELSE
*!*		lForceDelete = plForceDelete
*!*	ENDIF
*!*	pConn = CheckSQLConnection(pConn)

*!*	IF VARTYPE(pFrom)!= "C"
*!*		pFrom = ""
*!*	ENDIF
*!*	IF VARTYPE(pWhy)!= "C"
*!*		pWhy = ""
*!*	ENDIF

*!*	PRIVATE cSQL, nSQLEXEC 
*!*	**Check for Detail First
*!*	IF USED('tmpPSTK_CountDetail')
*!*		USE IN tmpPSTK_CountDetail
*!*	ENDIF

*!*	PRIVATE cAlias 
*!*	cAlias = ALIAS()

*!*	SELECT 0
*!*	cSQL = "SELECT COUNT(*) AS Cntd FROM dbo.BrokerLst_Detail WHERE ID = "+ STR(pID)
*!*	nSQLEXEC = SQLEXEC(pConn, cSQL, 'tmpPSTK_CountDetail' )
*!*	DO WHILE nSQLEXEC = 0
*!*		WAIT WINDOW 'SQL' TIMEOUT 1
*!*		nSQLEXEC = SQLEXEC(pConn, cSQL, 'tmpPSTK_CountDetail' )
*!*	ENDDO
*!*	IF nSQLEXEC < 0 &&Try again!
*!*		nSQLEXEC = SQLEXEC(nConn, cSQL_Delete , "")
*!*		DO WHILE nSQLEXEC = 0
*!*			WAIT WINDOW 'SQL 2' TIMEOUT 1
*!*			nSQLEXEC = SQLEXEC(nConn, cSQL_Delete , "")
*!*			
*!*			IF nSQLEXEC < 0
*!*				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
*!*					nSQLEXEC = 0
*!*				ENDIF
*!*			ENDIF
*!*		ENDDO
*!*	ENDIF
*!*	IF nSQLEXEC < 0
*!*		IF NOT SQLEXECError(cSQL,pConn,nSQLEXEC, 'tmpPSTK_CountDetail')
*!*		IF USED('tmpPSTK_CountDetail')
*!*			USE IN tmpPSTK_CountDetail
*!*		ENDIF
*!*		RETURN .F.
*!*	ELSE
*!*		IF USED('tmpPSTK_CountDetail')
*!*			DO WHILE tmpPSTK_CountDetail.Cntd > 0
*!*				IF lForceDelete
*!*					*Remove Detail and Count again
*!*					IF Remove_BrokerLst_Detail_by_MasterID(pID,pConn,pFrom,pWhy)
*!*						*Remove_Lst_Detail_by_MasterID(nMaster_ID,nConnHandle,pFrom,pWhy)
*!*						IF USED('tmpPSTK_CountDetail')
*!*							USE IN tmpPSTK_CountDetail
*!*						ENDIF

*!*						SELECT 0
*!*						cSQL = "SELECT COUNT(*) AS Cntd FROM dbo.StockLst_Detail WHERE ID = "+ STR(pID)
*!*						nSQLEXEC = SQLEXEC(pConn, cSQL, 'tmpPSTK_CountDetail' )
*!*						DO WHILE nSQLEXEC = 0
*!*							WAIT WINDOW 'SQL' TIMEOUT 1
*!*							nSQLEXEC = SQLEXEC(pConn, cSQL, 'tmpPSTK_CountDetail' )
*!*						ENDDO
*!*						IF nSQLEXEC < 0
*!*							IF NOT SQLEXECError(cSQL,pConn,nSQLEXEC, 'tmpPSTK_CountDetail')
*!*							IF USED('tmpPSTK_CountDetail')
*!*								USE IN tmpPSTK_CountDetail
*!*							ENDIF
*!*							RETURN .F.
*!*						ENDIF
*!*					ELSE
*!*						*Could not remove Detail
*!*						RETURN .F.
*!*					ENDIF
*!*				ELSE
*!*					MESSAGEBOX("A Detail record is dependant on this Master record."+CHR(13)+;
*!*					  "You must remove the detail record first.",0,"You cannot delete!")
*!*					IF USED('tmpPSTK_CountDetail')
*!*						USE IN tmpPSTK_CountDetail
*!*					ENDIF
*!*					RETURN .F.
*!*				ENDIF
*!*			ENDDO
*!*			
*!*			
*!*			IF tmpPSTK_CountDetail.Cntd = 0
*!*				cSQL_Delete="DELETE FROM dbo.BrokerLst_Master WHERE ID = "+STR(pID)
*!*				nSQLEXEC = SQLEXEC(pConn, cSQL_Delete )
*!*				DO WHILE nSQLEXEC = 0
*!*					WAIT WINDOW 'SQL' TIMEOUT 1
*!*					nSQLEXEC = SQLEXEC(pConn, cSQL_Delete )
*!*				ENDDO
*!*	IF nSQLEXEC < 0 &&Try again!
*!*		nSQLEXEC = SQLEXEC(nConn, cSQL_Delete , "")
*!*		DO WHILE nSQLEXEC = 0
*!*			WAIT WINDOW 'SQL 2' TIMEOUT 1
*!*			nSQLEXEC = SQLEXEC(nConn, cSQL_Delete , "")
*!*			
*!*			IF nSQLEXEC < 0
*!*				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
*!*					nSQLEXEC = 0
*!*				ENDIF
*!*			ENDIF
*!*		ENDDO
*!*	ENDIF
*!*				IF nSQLEXEC < 0
*!*					IF NOT SQLEXECError(cSQL_Delete ,pConn,nSQLEXEC,'')
*!*					IF USED('tmpPSTK_CountDetail')
*!*						USE IN tmpPSTK_CountDetail
*!*					ENDIF
*!*					RETURN .F.
*!*				ELSE
*!*					=SQLCOMMIT(pConn)
*!*					TrackMess("Remove_BrokerLst_ID: "+cSQL)
*!*	*				IF pFrom = "Edit PO"
*!*	*				ENDIF
*!*					**Check for rogue StockLst Process
*!*				ENDIF
*!*			ENDIF
*!*			USE IN tmpPSTK_CountDetail
*!*		ENDIF
*!*	ENDIF

*!*	IF NOT EMPTY(cAlias)
*!*		IF USED(cAlias)
*!*			SELECT (cAlias)
*!*		ENDIF
*!*	ENDIF

*!*	RETURN .T.
*!*	ENDPROC

*******************

*!*	PROC Remove_WIPLst_ID 
*!*	PARAMETER pID, pConn, plForceDelete,pFrom,pWhy
*!*	*Remove_WIPLst_ID(nMaster_ID,nConnHandle,lForceDelete,pFrom,pWhy)

*!*	IF VARTYPE(pID)!="N"
*!*		RecordError( 0, 'Remove_WIPLst_ID', "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No pDI" )
*!*		RETURN .F.
*!*	ENDIF
*!*	IF VARTYPE(pConn)!="N"
*!*		RecordError( 0, 'Remove_WIPLst_ID', "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"No pConn" )
*!*		RETURN .F.
*!*	ENDIF
*!*	IF VARTYPE(plForceDelete) != "L"
*!*		lForceDelete = .F.
*!*	ELSE
*!*		lForceDelete = plForceDelete
*!*	ENDIF
*!*	pConn = CheckSQLConnection(pConn)

*!*	IF VARTYPE(pFrom)!= "C"
*!*		pFrom = ""
*!*	ENDIF
*!*	IF VARTYPE(pWhy)!= "C"
*!*		pWhy = ""
*!*	ENDIF

*!*	PRIVATE cSQL, nSQLEXEC 
*!*	**Check for Detail First
*!*	IF USED('tmpPSTK_CountDetail')
*!*		USE IN tmpPSTK_CountDetail
*!*	ENDIF

*!*	PRIVATE cAlias 
*!*	cAlias = ALIAS()

*!*	SELECT 0
*!*	cSQL = "SELECT COUNT(*) AS Cntd FROM dbo.WIPLst_Detail WHERE ID = "+ STR(pID)
*!*	nSQLEXEC = SQLEXEC(pConn, cSQL, 'tmpPSTK_CountDetail' )
*!*	DO WHILE nSQLEXEC = 0
*!*		WAIT WINDOW 'SQL' TIMEOUT 1
*!*		nSQLEXEC = SQLEXEC(pConn, cSQL, 'tmpPSTK_CountDetail' )
*!*	ENDDO
*!*	IF nSQLEXEC < 0 &&Try again!
*!*		nSQLEXEC = SQLEXEC(nConn, cSQL_Delete , "")
*!*		DO WHILE nSQLEXEC = 0
*!*			WAIT WINDOW 'SQL 2' TIMEOUT 1
*!*			nSQLEXEC = SQLEXEC(nConn, cSQL_Delete , "")
*!*			
*!*			IF nSQLEXEC < 0
*!*				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
*!*					nSQLEXEC = 0
*!*				ENDIF
*!*			ENDIF
*!*		ENDDO
*!*	ENDIF
*!*	IF nSQLEXEC < 0
*!*		IF NOT SQLEXECError(cSQL,pConn,nSQLEXEC, 'tmpPSTK_CountDetail')
*!*		IF USED('tmpPSTK_CountDetail')
*!*			USE IN tmpPSTK_CountDetail
*!*		ENDIF
*!*		RETURN .F.
*!*	ELSE
*!*		IF USED('tmpPSTK_CountDetail')
*!*			DO WHILE tmpPSTK_CountDetail.Cntd > 0
*!*				IF lForceDelete
*!*					*Remove Detail and Count again
*!*					IF Remove_WIPLst_Detail_by_MasterID(pID,pConn,pFrom,pWhy)
*!*						*Remove_Lst_Detail_by_MasterID(nMaster_ID,nConnHandle,pFrom,pWhy)
*!*						IF USED('tmpPSTK_CountDetail')
*!*							USE IN tmpPSTK_CountDetail
*!*						ENDIF

*!*						SELECT 0
*!*						cSQL = "SELECT COUNT(*) AS Cntd FROM dbo.WIPLst_Detail WHERE ID = "+ STR(pID)
*!*						nSQLEXEC = SQLEXEC(pConn, cSQL, 'tmpPSTK_CountDetail' )
*!*						DO WHILE nSQLEXEC = 0
*!*							WAIT WINDOW 'SQL' TIMEOUT 1
*!*							nSQLEXEC = SQLEXEC(pConn, cSQL, 'tmpPSTK_CountDetail' )
*!*						ENDDO
*!*	IF nSQLEXEC < 0 &&Try again!
*!*		nSQLEXEC = SQLEXEC(nConn, cSQL_Delete , "")
*!*		DO WHILE nSQLEXEC = 0
*!*			WAIT WINDOW 'SQL 2' TIMEOUT 1
*!*			nSQLEXEC = SQLEXEC(nConn, cSQL_Delete , "")
*!*			
*!*			IF nSQLEXEC < 0
*!*				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
*!*					nSQLEXEC = 0
*!*				ENDIF
*!*			ENDIF
*!*		ENDDO
*!*	ENDIF

*!*						IF nSQLEXEC < 0
*!*							IF NOT SQLEXECError(cSQL,pConn,nSQLEXEC, 'tmpPSTK_CountDetail')
*!*							IF USED('tmpPSTK_CountDetail')
*!*								USE IN tmpPSTK_CountDetail
*!*							ENDIF
*!*							RETURN .F.
*!*						ENDIF
*!*					ELSE
*!*						*Could not remove Detail
*!*						RETURN .F.
*!*					ENDIF
*!*				ELSE
*!*					MESSAGEBOX("A Detail record is dependant on this Master record."+CHR(13)+;
*!*					  "You must remove the detail record first.",0,"You cannot delete!")
*!*					IF USED('tmpPSTK_CountDetail')
*!*						USE IN tmpPSTK_CountDetail
*!*					ENDIF
*!*					RETURN .F.
*!*				ENDIF
*!*			ENDDO
*!*			
*!*			
*!*			IF tmpPSTK_CountDetail.Cntd = 0
*!*	*			IF MESSAGEBOX("Are you sure you want to delete this Master Record?",4+32,"Confirm Delete") = 6
*!*				cSQL_Delete="DELETE FROM dbo.WIPLst_Master WHERE ID = "+STR(pID)
*!*				nSQLEXEC = SQLEXEC(pConn, cSQL_Delete )
*!*				DO WHILE nSQLEXEC = 0
*!*					WAIT WINDOW 'SQL' TIMEOUT 1
*!*					nSQLEXEC = SQLEXEC(pConn, cSQL_Delete )
*!*				ENDDO
*!*	IF nSQLEXEC < 0 &&Try again!
*!*		nSQLEXEC = SQLEXEC(nConn, cSQL_Delete , "")
*!*		DO WHILE nSQLEXEC = 0
*!*			WAIT WINDOW 'SQL 2' TIMEOUT 1
*!*			nSQLEXEC = SQLEXEC(nConn, cSQL_Delete , "")
*!*			
*!*			IF nSQLEXEC < 0
*!*				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
*!*					nSQLEXEC = 0
*!*				ENDIF
*!*			ENDIF
*!*		ENDDO
*!*	ENDIF

*!*				IF nSQLEXEC < 0
*!*					IF NOT SQLEXECError(cSQL_Delete ,pConn,nSQLEXEC,'')
*!*					IF USED('tmpPSTK_CountDetail')
*!*						USE IN tmpPSTK_CountDetail
*!*					ENDIF
*!*					RETURN .F.
*!*				ELSE
*!*					=SQLCOMMIT(pConn)
*!*					TrackMess("Remove_WIPLst_ID: "+cSQL)
*!*				ENDIF
*!*			ENDIF
*!*			USE IN tmpPSTK_CountDetail
*!*		ENDIF
*!*	ENDIF

*!*	IF NOT EMPTY(cAlias)
*!*		IF USED(cAlias)
*!*			SELECT (cAlias)
*!*		ENDIF
*!*	ENDIF

*!*	RETURN .T.
*!*	ENDPROC

******************

**********************************************************************************************

PROC Remove_Lst_Detail_by_MasterID 
PARAMETER pTBL,pID,pConnHandle,pFrom,pWhy 
*Remove_Lst_Detail_by_MasterID (cTBL,nMaster_ID,pConnHandle,pFrom,pWhy)

PRIVATE cTBL
cTBL = UPPER(PrepareSQLtxt(pTBL,"TBL",1))
DO CASE
CASE cTBL = "S"
CASE cTBL = "B"
CASE cTBL = "W"
OTHERWISE
	MESSAGEBOX("Function: Remove_Lst_Detail_by_MaterID()"+CHR(13)+"No TBL Parameter!",0,"Error")
	TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDCASE

IF VARTYPE(pID)!="N"
	TrackError("Bad Parameter","Bad Parameter pID","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
IF VARTYPE(pConnHandle)!="N"
	TrackError("Bad Parameter","Bad Parameter Conn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
IF VARTYPE(lForceDelete) != "L"
	lForceDelete = .F.
ENDIF

IF VARTYPE(pFrom)!= "C"
	pFrom = ""
ENDIF
IF VARTYPE(pWhy)!= "C"
	pWhy = "Remove_Lst_Detail_by_MasterID(nMaster_ID,nConnHandle,pFrom,pWhy)"
ENDIF

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
	ENDIF
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE cSQL, nSQLEXEC
IF USED('tmpPSTK_CntD_ID')
	USE IN tmpPSTK_CntD_ID
ENDIF

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE lOK
lOK = .T.

SELECT 0
cSQL = "SELECT COUNT(*) AS Cntd FROM "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + "dbo.StockLst_Detail "
CASE cTBL = "B"
	cSQL = cSQL + "dbo.BrokerLst_Detail "
CASE cTBL = "W"
	cSQL = cSQL + "dbo.WIPLst_Detail "
ENDCASE
cSQL = cSQL + " WHERE ID = "+ STR(pID)

nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_CntD_ID' )
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_CntD_ID' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CntD_ID")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CntD_ID")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF

IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpPSTK_CntD_ID')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		IF USED('tmpPSTK_CntD_ID')
			USE IN tmpPSTK_CntD_ID
		ENDIF
		lOK = .F.
	ELSE 
		nSQLEXEC = 1
	ENDIF
ENDIF
IF nSQLEXEC > 0
	IF USED('tmpPSTK_CntD_ID')
		IF tmpPSTK_CntD_ID.Cntd > 0
			*********************
			*Get PO or WO_Detail
			PRIVATE cSalesPerson, dDueDate, cPOitem
			cSalesPerson = ''
			*dDueDate = CTOD('') 
			dDueDate = DATE()
			cPOitem = ''
			
			IF 'PO Item ' $ pWhy
				cPOitem = SUBSTR(pWhy, AT('PO Item ',pWhy)+10,12)
				cPOitem = Proper_PO_item(cPOitem)
				
				IF cPOitem <> Proper_PO_item('')
					PRIVATE cSalesP
					cSalesP = Get_From_POitem (cPOitem, "SalesP", nConn )
					cSalesPerson = AppSetup_Get_UserName(cSalesP)
					
					*find a dueDate
					PRIVATE dtDue_Min, dtDue_Max, dtHPA_Due_Min, dtHPA_Due_Max, dtReceived 
					dtDue_Min = PrepareSQLdateTime( Get_From_POitem (cPOitem, "Due_Min", nConn ),'Due_Min')
					dtDue_Max = PrepareSQLdateTime( Get_From_POitem (cPOitem, "Due_Max", nConn),'Due_Max')
					dtHPA_Due_Min = PrepareSQLdateTime( Get_From_POitem (cPOitem, "HPA_Due_Min", nConn ),'HPA_Due_Min')
					dtHPA_Due_Max = PrepareSQLdateTime( Get_From_POitem (cPOitem, "HPA_Due_Max", nConn ),'HPA_Due_Max')
					dtReceived = PrepareSQLdateTime( Get_From_POitem (cPOitem, "Received", nConn ),'Received')
					
					DO CASE
					CASE NOT ISNULL(dtReceived) AND NOT EMPTY(dtReceived)
						dDueDate = TTOD(dtReceived)
					CASE NOT ISNULL(dtHPA_Due_Max) AND NOT NOT EMPTY(dtHPA_Due_Max)
						dDueDate = TTOD(dtHPA_Due_Max)
					CASE NOT ISNULL(dtHPA_Due_Min) AND NOT NOT EMPTY(dtHPA_Due_Min)
						dDueDate = TTOD(dtHPA_Due_Min)
					CASE NOT ISNULL(dtDue_Max) AND NOT NOT EMPTY(dtDue_Max)
						dDueDate = TTOD(dtDue_Max)
					CASE NOT ISNULL(dtDue_Min) AND NOT NOT EMPTY(dtDue_Min)
						dDueDate = TTOD(dtDue_Min)
					ENDCASE	
				ENDIF
			ENDIF
			
			***************
			*Get ID_Detail
			cSQL = "SELECT * FROM "
			DO CASE
			CASE cTBL = "S"
				cSQL = cSQL + " dbo.StockLst_Detail "
			CASE cTBL = "B"
				cSQL = cSQL + " dbo.BrokerLst_Detail "
			CASE cTBL = "W"
				cSQL = cSQL + " dbo.WIPLst_Detail "
			ENDCASE
			cSQL = cSQL + " WHERE ID = "+ STR(pID)
			
			nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_CntD_ID' )
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL' TIMEOUT 1
				nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_CntD_ID' )
			ENDDO
			IF nSQLEXEC < 0 &&Try again!
				nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CntD_ID")
				DO WHILE nSQLEXEC = 0
					WAIT WINDOW 'SQL 2' TIMEOUT 1
					nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CntD_ID")
					
					IF nSQLEXEC < 0
						IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
							nSQLEXEC = 0
						ENDIF
					ENDIF
				ENDDO
			ENDIF	
			IF nSQLEXEC < 0
				IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpPSTK_CntD_ID')
					RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
					IF USED('tmpPSTK_CntD_ID')
						USE IN tmpPSTK_CntD_ID
					ENDIF
					lOK = .F.
				ELSE
					nSQLEXEC = 1
				ENDIF
			ENDIF 
			IF nSQLEXEC > 0
				PRIVATE lTranAlreadySet, nProp 
				nProp = SQLGETPROP(nConn, 'Transactions')
				lTranAlreadySet = (nProp = 2)
						
				IF NOT lTranAlreadySet
					= SQLSETPROP(nConn, 'Transactions', 2)  && Manual transactions
				ENDIF
				
							
				PRIVATE m.nID_Detail,m.nWeight,m.nPU,m.nQTY,m.nPounds,m.cProcess_ID,m.cProcessor,m.cComment,m.nReceivingID
				PRIVATE cPrc_Form, nPrc_PCs, nPrc_Dim1, nPrc_Dim2, nPrc_Dim3, nOrdered_QTY, nOrdered_P 
				PRIVATE cSOitem, cPOitem, nWO, nWO_Detail, cLocation
				PRIVATE m.nID_Detail_Process
				
				IF USED('tmpPSTK_CntD_ID')
					SELECT tmpPSTK_CntD_ID
					m.nID_Detail_Process = 0
					SCAN
						m.nID_Detail = PrepareSQLnum(tmpPSTK_CntD_ID.ID_Detail,'ID_Detail',-3)
						m.nWeight	= PrepareSQLnum(tmpPSTK_CntD_ID.Weight,'Weight',9,1)

						m.nPU		= PrepareSQLnum(tmpPSTK_CntD_ID.S_PU,'PU',-1)
						m.nQTY		= PrepareSQLnum(tmpPSTK_CntD_ID.S_QTY,'QTY',-5)
						m.nPounds	= PrepareSQLnum(tmpPSTK_CntD_ID.Weight,'weight',9,1)
						m.nReceivingID = PrepareSQLnum(tmpPSTK_CntD_ID.ReceivingID,'ReceivingID',-3)
						
						*cSOitem	= PrepareSQLnum(tmpPSTK_CntD_ID.SOitem,'SOitem',10)
						*cPOitem	= PrepareSQLnum(tmpPSTK_CntD_ID.PO_item,'PO_item',12)
						*nWO		= PrepareSQLnum(tmpPSTK_CntD_ID.WO,'WO',-1)
						*nWO_Detail	= PrepareSQLnum(tmpPSTK_CntD_ID.WO_Detail,'WO_Detail',-1)
						
						*cPrc_Form = PrepareSQLtxt(tmpPSTK_CntD_ID.Prc_Form,'Prc_Form',2)
						nPrc_PCs  = PrepareSQLnum(tmpPSTK_CntD_ID.PC,'PCs',-1)
						nPrc_Dim1 = PrepareSQLnum(tmpPSTK_CntD_ID.Dim1,'Dim1',10,4)
						nPrc_Dim2 = PrepareSQLnum(tmpPSTK_CntD_ID.Dim2,'Dim2',9,3)
						nPrc_Dim3 = PrepareSQLnum(tmpPSTK_CntD_ID.Dim3,'Dim3',9,3)
						nOrdered_QTY = PrepareSQLnum(tmpPSTK_CntD_ID.S_QTY,'S_QTY',-5)
						nOrdered_P = PrepareSQLnum(tmpPSTK_CntD_ID.S_P,'S_P',-5)
						
						cLocation = PrepareSQLtxt(tmpPSTK_CntD_ID.Location,'Location',10)
						IF "CONSUME" $ UPPER(pFrom)
							m.cProcess_ID = "CONSUME"
						ELSE
							m.cProcess_ID = "CORRECTION"
						ENDIF
						
						IF NOT ( EMPTY(pFrom) )
							m.cProcessor	= LEFT(pFrom,20)
						ELSE
							m.cProcessor	= ""
						ENDIF
						m.cComment = LEFT(pWhy+", loc "+cLocation ,100)
						
						*Save Process as Consume or Correction
						*p_Lst_Process_ins
						
						cSQLi = "EXEC dbo.p_Lst_Process_ins "
						cSQLi = cSQLi + " @TBL = '"+cTBL+"'"
						cSQLi = cSQLi + ",@ID_Detail ="+STR(m.nID_Detail)+""
						cSQLi = cSQLi + ",@SalesPerson = '"+cSalesPerson+"'"
						cSQLi = cSQLi + ",@StartDate = '"+TTOC(DATETIME())+"'"	&&GetDate()"
						cSQLi = cSQLi + ",@DueDate = '"+TTOC(DATETIME())+"'"
						cSQLi = cSQLi + ",@AllowSub = '"+"N"+"'"   &&'Y' Computer does not Select the Stock!
						
						cSQLi = cSQLi + ",@PU	= "+STR(m.nPU)
						cSQLi = cSQLi + ",@QTY	= "+STR(m.nQTY,18,4)
						cSQLi = cSQLi + ",@Pounds ="+STR(m.nPounds,18,4)
						
						cSQLi = cSQLi + ",@SOitem = ''"	&&+cSOitem+"'" 
						cSQLi = cSQLi + ",@PO_Item = ''" &&+cPOitem+"'"
						cSQLi = cSQLi + ",@WO 	= 0" &&+STR(nWO)
						cSQLi = cSQLi + ",@WO_Detail= 0" &&+STR(nWO_Detail)	
						
						cSQLi = cSQLi + ",@Process_ID = '"+PrepareSQLtxt(cProcess_ID,'Process_ID',10)+"'"
						cSQLi = cSQLi + ",@Processor = '"+PrepareSQLtxt(cProcessor,'User',20)+"'"
						cSQLi = cSQLi + ",@Comment = '"+PrepareSQLtxt(cComment,'Comment',100)+"'"
						cSQLi = cSQLi + ",@ReceivingID ="+STR(m.nReceivingID)
						
						cSQLi = cSQLi + ",@Prc_Form = ''" &&+cPrc_Form+"'"
						cSQLi = cSQLi + ",@Prc_PCs = "+STR(nPrc_PCs)
						cSQLi = cSQLi + ",@Prc_Dim1 = "+STR(nPrc_Dim1,10,4)
						cSQLi = cSQLi + ",@Prc_Dim2 = "+STR(nPrc_Dim2,9,3)
						cSQLi = cSQLi + ",@Prc_Dim3 = "+STR(nPrc_Dim3,9,4)
						
						cSQLi = cSQLi + ",@Ordered_QTY = "+STR(nOrdered_QTY,18,8)
						cSQLi = cSQLi + ",@Ordered_P = "+STR(nOrdered_P,18,8)
						
						
						nSQLEXEC = SQLEXEC(nConn, cSQLi, 'tmpPSTK_ID_Detail_Process')
						DO WHILE nSQLEXEC = 0
							WAIT WINDOW 'SQL' TIMEOUT 1
							nSQLEXEC = SQLEXEC(nConn, cSQLi, 'tmpPSTK_ID_Detail_Process')
						ENDDO
						IF nSQLEXEC < 0 &&Try again!
							nSQLEXEC = SQLEXEC(nConn, cSQLi, "tmpPSTK_ID_Detail_Process")
							DO WHILE nSQLEXEC = 0
								WAIT WINDOW 'SQL 2' TIMEOUT 1
								nSQLEXEC = SQLEXEC(nConn, cSQLi, "tmpPSTK_ID_Detail_Process")
								
								IF nSQLEXEC < 0
									IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
										nSQLEXEC = 0
									ENDIF
								ENDIF
							ENDDO
						ENDIF
						IF nSQLEXEC < 0
							IF NOT SQLEXECError(cSQLi,nConn,nSQLEXEC, 'tmpPSTK_ID_Detail_Process')
								RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
								TrackError("Could not EXEC dbo.p_Lst_Process_ins "+CHR(13)+cSQLi,"p_Lst_Process_ins ","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
							ELSE
								nSQLEXEC = 1
							ENDIF
						ENDIF
						IF nSQLEXEC > 0
							IF USED("tmpPSTK_ID_Detail_Process")
								m.nID_Detail_Process = PrepareSQLnum(tmpPSTK_ID_Detail_Process.Exp,'ID_Detail_Process',-3)
								USE IN tmpPSTK_ID_Detail_Process
							ENDIF
						ENDIF
						
						DO CASE
						CASE cTBL = "S"
							cSQLid = "INSERT INTO dbo.StockLst_Process_Detail "
						CASE cTBL = "B"
							cSQLid = "INSERT INTO dbo.BrokerLst_Process_Detail "
						CASE cTBL = "W"
							cSQLid = "INSERT INTO dbo.WIPLst_Process_Detail "
						ENDCASE
						cSQLid = cSQLid+ "(ID, ID_Detail, ID_Detail_Process, What ) VALUES ("
						cSQLid = cSQLid+ ""+STR(pID)+","
						cSQLid = cSQLid+ ""+STR(m.nID_Detail)+","
						cSQLid = cSQLid+ ""+STR(m.nID_Detail_Process)+","
						cSQLid = cSQLid+ "'"+"REMOVED"+"'"	+")"
						
						nSQLEXEC = SQLEXEC( nConn, cSQLid )
						DO WHILE nSQLEXEC = 0
							WAIT WINDOW 'SQL' TIMEOUT 1
							nSQLEXEC = SQLEXEC(nConn, cSQLid )
						ENDDO
						IF nSQLEXEC < 0 &&Try again!
							nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
							DO WHILE nSQLEXEC = 0
								WAIT WINDOW 'SQL 2' TIMEOUT 1
								nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
								
								IF nSQLEXEC < 0
									IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
										nSQLEXEC = 0
									ENDIF
								ENDIF
							ENDDO
						ENDIF
						IF nSQLEXEC < 0
							IF NOT SQLEXECError(cSQLid,nConn,nSQLEXEC,'' )
								RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQLid )
							ENDIF
						ENDIF
						
						*****************
						DO CASE
						CASE cTBL = "S"
							cSQLid = "DELETE dbo.StockLst_Process_Detail "
						CASE cTBL = "B"
							cSQLid = "DELETE dbo.BrokerLst_Process_Detail "
						CASE cTBL = "W"
							cSQLid = "DELETE dbo.WIPLst_Process_Detail "
						ENDCASE
						cSQLid = cSQLid+ " WHERE ID="+STR(pID)+""
						cSQLid = cSQLid+ " AND ID_Detail="+STR(m.nID_Detail)+""
						*cSQLid = cSQLid+ " AND ID_Detail_Process="+STR(m.nID_Detail_Process)+""
						*cSQLid = cSQLid+ " AND [What]='"+"REMOVED"+"'"	
						*--Remove all Process for this ID_Detail.
						
						nSQLEXEC = SQLEXEC( nConn, cSQLid )
						DO WHILE nSQLEXEC = 0
							WAIT WINDOW 'SQL' TIMEOUT 1
							nSQLEXEC = SQLEXEC(nConn, cSQLid )
						ENDDO
						IF nSQLEXEC < 0 &&Try again!
							nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
							DO WHILE nSQLEXEC = 0
								WAIT WINDOW 'SQL 2' TIMEOUT 1
								nSQLEXEC = SQLEXEC(nConn, cSQLid, "")
								
								IF nSQLEXEC < 0
									IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
										nSQLEXEC = 0
									ENDIF
								ENDIF
							ENDDO
						ENDIF
						IF nSQLEXEC < 0
							IF NOT SQLEXECError(cSQLid,nConn,nSQLEXEC,'' )
								RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQLid )
								*lOK = .F.
							ENDIF
						ENDIF
						
						DO CASE
						CASE cTBL = "S"
							cSQL_Delete="DELETE FROM dbo.StockLst_Detail "
						CASE cTBL = "B"
							cSQL_Delete="DELETE FROM dbo.BrokerLst_Detail "
						CASE cTBL = "W"
							cSQL_Delete="DELETE FROM dbo.WIPLst_Detail "
						ENDCASE
						cSQL_Delete=cSQL_Delete+" WHERE ID_Detail = "+STR(m.nID_Detail)
						
						nSQLEXEC = SQLEXEC(nConn, cSQL_Delete )
						DO WHILE nSQLEXEC = 0
							WAIT WINDOW 'SQL' TIMEOUT 1
							nSQLEXEC = SQLEXEC(nConn,  cSQL_Delete )
							*lOK = .F.
						ENDDO
						
					ENDSCAN
					IF USED('tmpPSTK_CntD_ID')
						USE IN tmpPSTK_CntD_ID
					ENDIF
					
					IF lOK
						IF NOT lTranAlreadySet
							=SQLCOMMIT(nConn)
							= SQLSETPROP(nConn, 'Transactions', 1)  && TRANSAUTO
						ENDIF
						TrackMess("Proc_StockLst:Remove_Lst_Detail_by_MasterID: "+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1)+cSQL_Delete)
					ELSE	
						IF NOT lTranAlreadySet			
							= SQLROLLBACK(nConn)
							= SQLSETPROP(nConn, 'Transactions', 1)  && 1AUTO, 2MANUAL Trans
						ENDIF
					ENDIF
				ENDIF
			ENDIF
		ELSE
			MESSAGEBOX("No Lst Detail record found to Delete.",0,"Nothing to delete!")
		ENDIF
		IF USED('tmpPSTK_CntD_ID')
			USE IN tmpPSTK_CntD_ID
		ENDIF
	ENDIF
ENDIF

IF nConn != pConnHandle
	SQLDISCONNECT( nConn )
ENDIF


IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lOK
ENDPROC	




*!*	******************     
*!*	PROC Remove_BrokerLst_Detail_by_MasterID 
*!*	PARAMETER pID, pConn ,pFrom, pWhy
*!*	*Remove_BrokerLst_Detail_by_MasterID(nMaster_ID,nConnHandle,pFrom, pWhy)

			
**********************************
	
PROCEDURE Check_PS_Entry
PARAMETERS cSOitem, nWO, pConnHandle
*Find Sales_Stock_ID
*Sales_Stock_ID = Check_PS_Entry(cSOitem,nWO,ThisForm.nConnHandle)
*Check for "'PackingSlip," in HEAT field

IF VARTYPE(cSOitem) != "C"
	TrackError("Bad Parameter","Bad Parameter cSOitem","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
IF VARTYPE(nWO) != "N"
	TrackError("Bad Parameter","Bad Parameter nWO","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	nWO = 0
ENDIF


PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
	ENDIF
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF

nConn = CheckSQLConnection(nConn)

PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_SS')
	USE IN tmpPSTK_SS
ENDIF
SELECT 0

PRIVATE nReturnID 
nReturnID = 0

PRIVATE cSQL, nSQLEXEC
cSQL = ''
IF Proper_SO_item(cSOItem) <> Proper_SO_item('')
	cSQL = "SELECT ID FROM dbo.Sales_Stock WITH(NOLOCK) "
	cSQL = cSQL + " WHERE SOitem = dbo.f_ProperSOitem('"+cSOItem+"')"
	IF nWO > 0
*		cSQL = cSQL + " AND WO="+STR(nWO)
	ENDIF
	cSQL = cSQL + " AND Heat LIKE 'PackingSlip,%'"
	cSQL = cSQL + " AND NOT ISNULL(Invoice,0) > 0"
ELSE
	IF nWO > 0
		cSQL = "SELECT ID FROM dbo.Sales_Stock WITH(NOLOCK) "
		cSQL = cSQL + " WHERE WO="+STR(nWO)
		cSQL = cSQL + " AND Heat LIKE 'PackingSlip,%'"
		cSQL = cSQL + " AND NOT ISNULL(Invoice,0) > 0"
	ENDIF
ENDIF

IF nConn > 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_SS' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_SS' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_SS")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_SS")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_SS')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_SS')
		IF RECCOUNT('tmpPSTK_SS')=1
			IF tmpPSTK_SS.ID >  0
				nReturnID = tmpPSTK_SS.ID
			ENDIF
		ENDIF
		IF RECCOUNT('tmpPSTK_SS')=>1 AND nWO>0
			nReturnID = tmpPSTK_SS.ID  &&Record atleast 1
			LOCATE FOR WO=nWO
			IF FOUND()
				IF tmpPSTK_SS.ID >  0
					nReturnID = tmpPSTK_SS.ID
				ENDIF
			ENDIF
		ENDIF		
		
		USE IN tmpPSTK_SS
	ENDIF
	IF nConn != pConnHandle
		SQLDISCONNECT( nConn )
	ENDIF

ELSE
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nReturnID 

ENDPROC
********************************** 
	
PROCEDURE Check_PS_Entry_SID
PARAMETERS cSOitem, nWO, nDim1,nDim2,nDim3, pConnHandle
*Sales_Item_Detail SID	--Depricated.  Only used on Shop_StockLst_edit_OLD

*SID_ID = Check_PS_Entry_SID(cSOitem,nWO,nDim1,nDim2,nDim3,ThisForm.nConnHandle)


IF VARTYPE(cSOitem) != "C"
	TrackError("Bad Parameter","Bad Parameter cSOitem","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
IF VARTYPE(nWO) != "N"
	TrackError("Bad Parameter","Bad Parameter nWO","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	nWO = 0
ENDIF

nDim1 = PrepareSQLnum(nDim1,'Dim1',10,4)
nDim2 = PrepareSQLnum(nDim2,'Dim2',9,3)
nDim3 = PrepareSQLnum(nDim3,'Dim3',9,3)

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
	ENDIF
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF

nConn = CheckSQLConnection(nConn)

PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_SS')
	USE IN tmpPSTK_SS
ENDIF
SELECT 0

PRIVATE nReturnID 
nReturnID = 0

PRIVATE cSQL, nSQLEXEC
cSQL = "SELECT SID_ID,Dim1,Dim2,Dim3 FROM dbo.Sales_Item_Detail "
cSQL = cSQL + " WITH(NOLOCK) WHERE "
IF Proper_SO_item(cSOItem) <> Proper_SO_item('')
	cSQL = cSQL + " SOitem = dbo.f_ProperSOitem('"+cSOItem+"')"
	IF nWO > 0
		cSQL = cSQL + " AND WO="+STR(nWO)
	ENDIF
ELSE
	cSQL = cSQL + " WO="+STR(nWO)
ENDIF
cSQL = cSQL + " AND ISNULL(PackingSlip,0) > 0 "
cSQL = cSQL + " AND Heat LIKE 'PackingSlip,%'"
cSQL = cSQL + " AND ISNULL(ID_Master,0) = 0"

IF nConn > 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_SS' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_SS' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_SS")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_SS")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_SS')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_SS')
		IF RECCOUNT('tmpPSTK_SS')=1
			nReturnID = tmpPSTK_SS.SID_ID 
		ELSE
			IF RECCOUNT('tmpPSTK_SS')>0
				SCAN
					IF Dim1 = nDim1 AND Dim2 = nDim2
						nReturnID = tmpPSTK_SS.SID_ID 
					ENDIF
				ENDSCAN
			ENDIF
		ENDIF
		USE IN tmpPSTK_SS
	ENDIF
	IF nConn != pConnHandle
		SQLDISCONNECT( nConn )
	ENDIF

ELSE
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nReturnID 

ENDPROC
*******************************************
	
PROCEDURE CheckChangeDetailPrice
PARAMETERS nID_Detail, nCostValue, nS_P, cTBL, pConnHandle, cWhat

* CheckChangeDetailPrice(nID_Detail, nCostValue, nS_P, cTBL, pConnHandle, "StockLst_Detail")
**Compares parameter against StockLst_Detail
*Return if whether Detail price was changed

IF VARTYPE(nID_Detail) != "N"
	TrackError("Bad Parameter","Bad Parameter nID_Detail","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN .F.
ENDIF
IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF

IF NOT ( UPPER(cTBL) = "S" OR UPPER(cTBL) = "B" OR UPPER(cTBL) = "W")
	TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ELSE
	cTBL = UPPER(cTBL)
ENDIF
IF NOT ( VARTYPE(nCostValue) = "N" OR VARTYPE(nCostValue) = "Y" )
	nCostValue = 0
ENDIF
IF NOT ( VARTYPE(nS_P) = "N" OR VARTYPE(nS_P) = "Y" )
	nS_P = 0
ENDIF
IF VARTYPE(cWHAT) != "C"
	TrackError("Bad Parameter","Bad Parameter cWHAT ","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
	
PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
	ENDIF
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF

nConn = CheckSQLConnection(nConn)

PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_SD_Change')
	USE IN tmpPSTK_SD_Change
ENDIF
SELECT 0

PRIVATE lPriceChange
lPriceChange = .F.

PRIVATE cSQL,cSQL2, nSQLEXEC

cSQL = "SELECT COUNT(*) AS Cntd "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL+ " FROM dbo.StockLst_Detail "
CASE cTBL = "B"
	cSQL = cSQL+ " FROM dbo.BrokerLst_Detail "
CASE cTBL = "W"
	cSQL = cSQL+ " FROM dbo.WIPLst_Detail "
OTHERWISE 
	TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDCASE
cSQL = cSQL+ " WHERE ID_Detail="+STR(nID_Detail)
cSQL = cSQL+ " AND ROUND(CostValue+10,-1) <> ROUND("+STR(nCostValue+10)+",-1)"
**ROUND to 10's of Dollars. (CostValue+10,-1)  +add 10 to both sides
*Remove Decimals as Round can throw 'Arithmetic overflow error converting expression to data type numeric.'

nSQLEXEC = SQLEXEC(nConn , cSQL, 'tmpPSTK_SD_Change' )
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn , cSQL, 'tmpPSTK_SD_Change' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_SD_Change")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_SD_Change")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL,nConn , nSQLEXEC, 'tmpPSTK_SD_Change')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	ELSE
		nSQLEXEC = 1
	ENDIF
ENDIF
IF nSQLEXEC > 0
	IF USED('tmpPSTK_SD_Change')
		IF RECCOUNT('tmpPSTK_SD_Change')>0
			IF tmpPSTK_SD_Change.Cntd >  0
				lPriceChange = .T.
				IF nCostValue > 0
					*Changing CostValue
				ELSE
					*Changing to 0
				ENDIF
			ENDIF
		ENDIF
		USE IN tmpPSTK_SD_Change
	ENDIF
	*************************
	
	IF USED('tmpPSTK_SD_Change')
		USE IN tmpPSTK_SD_Change
	ENDIF
	SELECT 0
	cSQL2= "SELECT COUNT(*) AS Cntd "

	DO CASE
	CASE cTBL = "S"
		cSQL2= cSQL2+ " FROM dbo.StockLst_Detail "
	CASE cTBL = "B"
		cSQL2 = cSQL2+ " FROM dbo.BrokerLst_Detail "
	CASE cTBL = "W"
		cSQL2 = cSQL2+ " FROM dbo.WIPLst_Detail "
	ENDCASE	
	cSQL2 = cSQL2+ " WHERE ID_Detail="+STR(nID_Detail)
	cSQL2 = cSQL2+ " AND ROUND(S_P+10,-1) <> ROUND("+STR(nS_P+10)+",-1)"
	**ROUND to 10's of Dollars. ( +10,-1)  +add 10 to both sides
	*Remove Decimals as Round can throw 'Arithmetic overflow error converting expression to data type numeric.'
		
	nSQLEXEC = SQLEXEC(nConn, cSQL2, 'tmpPSTK_SD_Change' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL2, 'tmpPSTK_SD_Change' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL2, "tmpPSTK_SD_Change")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL2, "tmpPSTK_SD_Change")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL2, nConn, nSQLEXEC, 'tmpPSTK_SD_Change')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL2 )
		ELSE
			nSQLEXEC = 1
		ENDIF
	ENDIF
	IF nSQLEXEC > 0
		IF USED('tmpPSTK_SD_Change')
			IF RECCOUNT('tmpPSTK_SD_Change')>0
				IF tmpPSTK_SD_Change.Cntd > 0
					lPriceChange = .T.
					IF nS_P > 0
						*Changing S_P
					ELSE
						*Changing S_P to 0
					ENDIF
				ENDIF
			ENDIF
			USE IN tmpPSTK_SD_Change
		ENDIF
	ENDIF

	*************************	
	IF nConn != pConnHandle
		SQLDISCONNECT( nConn )
	ENDIF

ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

IF lPriceChange
	*Where did they come from?
	DO CASE
	CASE cWhat = "StockLst_Detail"
		*Do they have Permission?
		DO FORM Forms\StockLst_Detail_Cost.scx WITH nID_Detail, nCostValue, nS_P, cTBL
		
	CASE cWhat = "PO_Finalize"
	
	ENDCASE
ELSE
	*TrackError( "Using both of these queries still could not tell if Detail price was changed. cSQL:"+cSQL+CHR(13)+"cSQL2:"+cSQL2,"CheckChangeDetailPrice is bad", PROGRAM(), LINENO(1))
ENDIF

RETURN lPriceChange

ENDPROC

*******************************************
	
PROCEDURE Check_Process 
PARAMETERS pProcess_ID, cTBL, pConnHandle, pSOitem, pPO_Item, pWO

* lFound = Check_Process(pProcess_ID, pTBL, pConnHandle,  cSOitem, cPO_Item, nWO)
* Counts process, use to find out a process exists in a certain Process_ID

PRIVATE cProcess_ID
IF VARTYPE(pProcess_ID) != "C"
	TrackError("Bad Parameter","Bad Parameter cProcess_ID","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ELSE 	
	cProcess_ID = pProcess_ID
ENDIF

IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
IF NOT ( UPPER(cTBL) = "S" OR UPPER(cTBL) = "B" OR UPPER(cTBL) = "W")
	TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ELSE
	cTBL = UPPER(cTBL)
ENDIF

PRIVATE cSOitem, cPO_Item, nWO
IF VARTYPE(pSOitem) = "C" 
	cSOitem = Proper_SO_item(pSOitem)
ELSE
	cSOitem = Proper_SO_item("")
ENDIF
IF VARTYPE(pPO_Item) = "C" 
	cPO_Item = Proper_PO_item(pPO_Item)
ELSE
	cPO_Item = Proper_PO_item("")
ENDIF
IF VARTYPE(pWO) = "N" 
	nWO = pWO
ELSE
	nWO = 0
ENDIF

	
PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
	ENDIF
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF

nConn = CheckSQLConnection(nConn)

PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_Count_Process')
	USE IN tmpPSTK_Count_Process
ENDIF
SELECT 0

PRIVATE lReturn 
lReturn = .F.

PRIVATE cSQL, nSQLEXEC

cSQL = "SELECT COUNT(*) AS Cntd "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL+ " FROM dbo.StockLst_Detail "
CASE cTBL = "B"
	cSQL = cSQL+ " FROM dbo.BrokerLst_Detail "
CASE cTBL = "W"
	cSQL = cSQL+ " FROM dbo.WIPLst_Detail "
OTHERWISE 
	TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDCASE

*Full matrix, not sure if WO is should use an OR with PO or SO
DO CASE
CASE cSOitem != Proper_SO_item('') AND cPO_Item != Proper_PO_item('') AND nWO > 0
	cSQL = cSQL+ " AND SOitem = dbo.f_ProperSOitem('"+cSOItem+"')"
	cSQL = cSQL+ " AND PO_item = dbo.f_ProperPOitem('"+cPO_Item+"')"
	cSQL = cSQL+ " AND WO = "+ALLTRIM(STR(nWO))
	
CASE cSOitem != Proper_SO_item('') AND cPO_Item != Proper_PO_item('') AND nWO = 0
	cSQL = cSQL+ " AND SOitem = dbo.f_ProperSOitem('"+cSOItem+"')"
	cSQL = cSQL+ " AND PO_item = dbo.f_ProperPOitem('"+cPO_Item+"')"

CASE cSOitem != Proper_SO_item('') AND cPO_Item = Proper_PO_item('') AND nWO > 0
	cSQL = cSQL+ " AND SOitem = dbo.f_ProperSOitem('"+cSOItem+"')"
	cSQL = cSQL+ " AND WO = "+ALLTRIM(STR(nWO))
	
CASE cSOitem = Proper_SO_item('') AND cPO_Item != Proper_PO_item('') AND nWO > 0
	cSQL = cSQL+ " AND PO_item = dbo.f_ProperPOitem('"+cPO_Item+"')"
	cSQL = cSQL+ " AND WO = "+ALLTRIM(STR(nWO))

CASE cSOitem != Proper_SO_item('') AND cPO_Item = Proper_PO_item('') AND nWO = 0
	cSQL = cSQL+ " AND SOitem = dbo.f_ProperSOitem('"+cSOItem+"')"
		
CASE cSOitem = Proper_SO_item('') AND cPO_Item != Proper_PO_item('') AND nWO = 0
	cSQL = cSQL+ " AND PO_item = dbo.f_ProperPOitem('"+cPO_Item+"')"

CASE cSOitem = Proper_SO_item('') AND cPO_Item = Proper_PO_item('') AND nWO > 0
	cSQL = cSQL+ " AND WO = "+ALLTRIM(STR(nWO))
	
ENDCASE


nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Count_Process' )
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Count_Process' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Count_Process")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Count_Process")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL,nConn , nSQLEXEC, 'tmpPSTK_Count_Process')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:CheckChangeDetailPrice",LINENO())
	ELSE
		nSQLEXEC = 1
	ENDIF
ENDIF
IF nSQLEXEC  > 0
	IF USED('tmpPSTK_Count_Process')
		IF RECCOUNT('tmpPSTK_Count_Process')>0
			IF tmpPSTK_Count_Process.Cntd >  0
				lReturn = .T.
			ENDIF
		ENDIF
		USE IN tmpPSTK_Count_Process
	ENDIF

ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

IF nConn != pConnHandle
	SQLDISCONNECT( nConn )
ENDIF

RETURN lReturn 

ENDPROC

*********************************  
PROC MarkedAsRMAreceived
PARAMETER nRMA_No, dReceived, pConnHandle
*lTrue = MarkedAsRMAreceived( nRMA_No, dReceived, pConnHandle)

IF VARTYPE(nRMA_No) != "N"
	TrackError("Bad Parameter","Bad Parameter nRMA_NO","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF


PRIVATE lReturn
lReturn = .F.

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	nConn = pConnHandle
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConn = 0
ENDIF
nConn = CheckSQLConnection(nConn)

PRIVATE cSQL, nSQLEXEC, lOK, cMess
lOK = .T.
cMess = ""

PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_cntRMA_Detail')
	USE IN tmpPSTK_cntRMA_Detail
ENDIF

SELECT 0

cSQL="UPDATE dbo.RMA_Detail  "
cSQL = cSQL + " SET Returned = '"+IIF(EMPTY(dReceived),'',DTOC(dReceived))+"'"
cSQL = cSQL + " WHERE RMA_No="+ALLTRIM(STR(nRMA_No))

nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_cntRMA_Detail')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_cntRMA_Detail' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_cntRMA_Detail")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_cntRMA_Detail")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	lOK = .F.
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_cntRMA_Detail')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF
IF USED('tmpPSTK_cntRMA_Detail')
	IF RECCOUNT('tmpPSTK_cntRMA_Detail') > 0
		lReturn = .T.
	ENDIF
	USE IN tmpPSTK_cntRMA_Detail
ENDIF
IF nConn != pConnHandle
	 = SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lReturn 
ENDPROC


********************************* 
PROC GetID_Detail_Process_With_POitem
PARAMETER pPOitem, cTBL, cHeat, pConnHandle
*nID_Detail_Process = GetID_Detail_Process_With_POitem( nID, cTBL, cHeat, pConnHandle )

IF VARTYPE(pPOitem) != "C"
	TrackError("Bad Parameter","Bad Parameter POitem","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF VARTYPE(cHeat) != "C"
	cHeat = ''
ENDIF


PRIVATE nID_Detail_Process
nID_Detail_Process = 0

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	nConn = pConnHandle
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF
nConn = CheckSQLConnection(nConn)


PRIVATE cSQL, nSQLEXEC, lOK, cMess
lOK = .T.
cMess = ""
PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_ID_Detail_Process')
	USE IN tmpPSTK_ID_Detail_Process
ENDIF

SELECT 0

DO CASE
CASE cTBL = "S"
cSQL = "SELECT DISTINCT 'S' AS TBL, P.ID_Detail, P.ID_Detail_Process "
cSQL = cSQL + " FROM dbo.StockLst_Process P "
cSQL = cSQL + " INNER JOIN dbo.Stocklst_Detail D ON P.ID_Detail = D.ID_Detail "
cSQL = cSQL + " INNER JOIN dbo.Stocklst_Master M ON D.ID = M.ID "

CASE cTBL = "B"
cSQL = "SELECT DISTINCT 'B' AS TBL, P.ID_Detail, P.ID_Detail_Process "
cSQL = cSQL + " FROM dbo.BrokerLst_Process P "
cSQL = cSQL + " INNER JOIN dbo.Brokerlst_Detail D ON P.ID_Detail = D.ID_Detail "
cSQL = cSQL + " INNER JOIN dbo.Brokerlst_Master M ON D.ID = M.ID "

CASE cTBL = "W"
cSQL = "SELECT DISTINCT 'W' AS TBL, P.ID_Detail, P.ID_Detail_Process "
cSQL = cSQL + " FROM dbo.WIPLst_Process P "
cSQL = cSQL + " INNER JOIN dbo.WIPlst_Detail D ON P.ID_Detail = D.ID_Detail "
cSQL = cSQL + " INNER JOIN dbo.WIPlst_Master M ON D.ID = M.ID "

OTHERWISE 
	TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDCASE

*cSQL = cSQL + " WHERE Process_ID = 'INCOMING  ' "
cSQL = cSQL + " WHERE ( P.Process_ID = 'INCOMING' OR P.Process_ID = 'NOT2HPA' OR P.Process_ID = 'PARTRECV' )"
cSQL = cSQL + " AND P.PO_Item = HPAlloy.dbo.f_ProperPOitem('"+pPOitem+"')"
IF LEN(cHeat) > 0
	cSQL = cSQL + " AND M.Heat = '"+cHeat+"'"
ENDIF

cSQL = cSQL + " UNION "

DO CASE
CASE cTBL = "S"
cSQL = cSQL + " SELECT DISTINCT 'S' AS TBL, P.ID_Detail, P.ID_Detail_Process "
cSQL = cSQL + " FROM HPAlloy_Archive.dbo.StockLst_Process_History P "
cSQL = cSQL + " INNER JOIN HPAlloy_Archive.dbo.Stocklst_Detail_History D ON P.ID_Detail = D.ID_Detail "
cSQL = cSQL + " INNER JOIN HPAlloy_Archive.dbo.Stocklst_Master_History M ON D.ID = M.ID "

CASE cTBL = "B"
cSQL = cSQL + " SELECT DISTINCT 'B' AS TBL, P.ID_Detail, P.ID_Detail_Process "
cSQL = cSQL + " FROM HPAlloy_Archive.dbo.BrokerLst_Process_History P "
cSQL = cSQL + " INNER JOIN HPAlloy_Archive.dbo.Brokerlst_Detail_History D ON P.ID_Detail = D.ID_Detail "
cSQL = cSQL + " INNER JOIN HPAlloy_Archive.dbo.Brokerlst_Master_History M ON D.ID = M.ID "

CASE cTBL = "W"
cSQL = cSQL + " SELECT DISTINCT 'W' AS TBL, P.ID_Detail, P.ID_Detail_Process "
cSQL = cSQL + " FROM HPAlloy_Archive.dbo.WIPLst_Process_History P "
cSQL = cSQL + " INNER JOIN HPAlloy_Archive.dbo.WIPlst_Detail_History D ON P.ID_Detail = D.ID_Detail "
cSQL = cSQL + " INNER JOIN HPAlloy_Archive.dbo.WIPlst_Master_History M ON D.ID = M.ID "
ENDCASE

cSQL = cSQL + " WHERE ( P.Process_ID = 'INCOMING' OR P.Process_ID = 'NOT2HPA' OR P.Process_ID = 'PARTRECV' )"
cSQL = cSQL + " AND P.WHAT = 'DELETE' AND P.PO_Item = HPAlloy.dbo.f_ProperPOitem('"+pPOitem+"')"
IF LEN(cHeat) > 0
	cSQL = cSQL + " AND M.Heat = '"+cHeat+"'"
ENDIF

nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_ID_Detail_Process')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_ID_Detail_Process' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_ID_Detail_Process")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_ID_Detail_Process")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	lOK = .F.
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_ID_Detail_Process')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF
IF USED('tmpPSTK_ID_Detail_Process')
	IF RECCOUNT('tmpPSTK_ID_Detail_Process') > 0
		nID_Detail_Process = tmpPSTK_ID_Detail_Process.ID_Detail_Process
	ENDIF
	USE IN tmpPSTK_ID_Detail_Process
ENDIF
IF nConn != pConnHandle
	 = SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nID_Detail_Process
ENDPROC

********************************* 
PROC GetID_Detail_Process_With_WO_Detail 
PARAMETER pWO_Detail, cTBL, cHeat, pConnHandle
*nID_Detail_Process = GetID_Detail_Process_With_WO_Detail( pWO_Detail, cTBL, cHeat, pConnHandle )

IF VARTYPE(pWO_Detail) != "N"
	TrackError("Bad Parameter","Bad Parameter WO_Detail","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF VARTYPE(cHeat) != "C"
	cHeat = ''
ENDIF


PRIVATE nID_Detail_Process
nID_Detail_Process = 0

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	nConn = pConnHandle
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF
nConn = CheckSQLConnection(nConn)


PRIVATE cSQL, nSQLEXEC, lOK, cMess
lOK = .T.
cMess = ""
PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_ID_Detail_Process')
	USE IN tmpPSTK_ID_Detail_Process
ENDIF

SELECT 0

DO CASE
CASE cTBL = "S"
cSQL = "SELECT DISTINCT 'S' AS TBL, P.ID_Detail, P.ID_Detail_Process "
cSQL = cSQL + " FROM dbo.StockLst_Process P "
cSQL = cSQL + " INNER JOIN dbo.Stocklst_Detail D ON P.ID_Detail = D.ID_Detail "
cSQL = cSQL + " INNER JOIN dbo.Stocklst_Master M ON D.ID = M.ID "

CASE cTBL = "B"
cSQL = "SELECT DISTINCT 'B' AS TBL, P.ID_Detail, P.ID_Detail_Process "
cSQL = cSQL + " FROM dbo.BrokerLst_Process P "
cSQL = cSQL + " INNER JOIN dbo.Brokerlst_Detail D ON P.ID_Detail = D.ID_Detail "
cSQL = cSQL + " INNER JOIN dbo.Brokerlst_Master M ON D.ID = M.ID "

CASE cTBL = "W"
cSQL = "SELECT DISTINCT 'W' AS TBL, P.ID_Detail, P.ID_Detail_Process "
cSQL = cSQL + " FROM dbo.WIPLst_Process P "
cSQL = cSQL + " INNER JOIN dbo.WIPlst_Detail D ON P.ID_Detail = D.ID_Detail "
cSQL = cSQL + " INNER JOIN dbo.WIPlst_Master M ON D.ID = M.ID "
OTHERWISE 
	TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDCASE

*cSQL = cSQL + " WHERE Process_ID = 'INCOMING  ' "
cSQL = cSQL + " WHERE ( P.Process_ID = 'INCOMING' OR P.Process_ID = 'NOT2HPA' OR P.Process_ID = 'PARTRECV' )"
cSQL = cSQL + " AND P.WO_Detail = "+STR(pWO_Detail)
IF LEN(cHeat) > 0
	cSQL = cSQL + " AND M.Heat = '"+cHeat+"'"
ENDIF

cSQL = cSQL + " UNION "

DO CASE
CASE cTBL = "S"
cSQL = cSQL + " SELECT DISTINCT 'S' AS TBL, P.ID_Detail, P.ID_Detail_Process "
cSQL = cSQL + " FROM HPAlloy_Archive.dbo.StockLst_Process_History P "
cSQL = cSQL + " INNER JOIN HPAlloy_Archive.dbo.Stocklst_Detail_History D ON P.ID_Detail = D.ID_Detail "
cSQL = cSQL + " INNER JOIN HPAlloy_Archive.dbo.Stocklst_Master_History M ON D.ID = M.ID "

CASE cTBL = "B"
cSQL = cSQL + " SELECT DISTINCT 'B' AS TBL, P.ID_Detail, P.ID_Detail_Process "
cSQL = cSQL + " FROM HPAlloy_Archive.dbo.BrokerLst_Process_History P "
cSQL = cSQL + " INNER JOIN HPAlloy_Archive.dbo.Brokerlst_Detail_History D ON P.ID_Detail = D.ID_Detail "
cSQL = cSQL + " INNER JOIN HPAlloy_Archive.dbo.Brokerlst_Master_History M ON D.ID = M.ID "

CASE cTBL = "W"
cSQL = cSQL + " SELECT DISTINCT 'W' AS TBL, P.ID_Detail, P.ID_Detail_Process "
cSQL = cSQL + " FROM HPAlloy_Archive.dbo.WIPLst_Process_History P "
cSQL = cSQL + " INNER JOIN HPAlloy_Archive.dbo.WIPlst_Detail_History D ON P.ID_Detail = D.ID_Detail "
cSQL = cSQL + " INNER JOIN HPAlloy_Archive.dbo.WIPlst_Master_History M ON D.ID = M.ID "
ENDCASE

cSQL = cSQL + " WHERE ( P.Process_ID = 'INCOMING' OR P.Process_ID = 'NOT2HPA' OR P.Process_ID = 'PARTRECV' )"
cSQL = cSQL + " AND P.WHAT = 'DELETE' "
*cSQL = cSQL + " AND AND P.PO_Item = HPAlloy.dbo.f_ProperPOitem('"+pPOitem+"')"
cSQL = cSQL + " AND P.WO_Detail = "+STR(pWO_Detail)
IF LEN(cHeat) > 0
	cSQL = cSQL + " AND M.Heat = '"+cHeat+"'"
ENDIF

nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_ID_Detail_Process')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_ID_Detail_Process' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_ID_Detail_Process")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_ID_Detail_Process")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	lOK = .F.
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_ID_Detail_Process')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF
IF USED('tmpPSTK_ID_Detail_Process')
	IF RECCOUNT('tmpPSTK_ID_Detail_Process') > 0
		nID_Detail_Process = tmpPSTK_ID_Detail_Process.ID_Detail_Process
	ENDIF
	USE IN tmpPSTK_ID_Detail_Process
ENDIF
IF nConn != pConnHandle
	 = SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nID_Detail_Process
ENDPROC



********************************* 
PROC GetID_Detail_With_ID_Detail_Process
PARAMETER nID_Detail_Process, cTBL, pConnHandle
*nID_Detail = GetID_Detail_With_ID_Detail_Process( nID_Detail_Process, cTBL, pConnHandle )


IF VARTYPE(nID_Detail_Process) != "N"
	TrackError("Bad Parameter","Bad Parameter nID_Detail_Process","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

PRIVATE nID_Detail
nID_Detail = 0

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	nConn = pConnHandle
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF
nConn = CheckSQLConnection(nConn)


PRIVATE cSQL, nSQLEXEC, lOK, cMess
lOK = .T.
cMess = ""
PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_ID_Detail_Process')
	USE IN tmpPSTK_ID_Detail_Process
ENDIF

SELECT 0

DO CASE
CASE cTBL = "S"
cSQL = "SELECT 'S' AS TBL, ID_Detail FROM dbo.StockLst_Process "
CASE cTBL = "B"
cSQL = "SELECT 'B' AS TBL, ID_Detail FROM dbo.BrokerLst_Process "
CASE cTBL = "W"
cSQL = "SELECT 'W' AS TBL, ID_Detail FROM dbo.WIPLst_Process "
OTHERWISE 
	TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDCASE
cSQL = cSQL + " WHERE ID_Detail_Process = "+STR(nID_Detail_Process)
cSQL = cSQL + " UNION "

DO CASE
CASE cTBL = "S"
cSQL = cSQL + " SELECT 'S' AS TBL, ID_Detail FROM HPAlloy_Archive.dbo.StockLst_Process_History "
CASE cTBL = "B"
cSQL = cSQL + " SELECT 'B' AS TBL, ID_Detail FROM HPAlloy_Archive.dbo.BrokerLst_Process_History "
CASE cTBL = "W"
cSQL = cSQL + " SELECT 'W' AS TBL, ID_Detail FROM HPAlloy_Archive.dbo.WIPLst_Process_History "
ENDCASE
cSQL = cSQL + " WHERE ID_Detail_Process = "+STR(nID_Detail_Process)+" AND WHAT = 'DELETE'"


nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_ID_Detail_Process')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_ID_Detail_Process' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_ID_Detail_Process")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_ID_Detail_Process")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	lOK = .F.
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_ID_Detail_Process')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF
IF USED('tmpPSTK_ID_Detail_Process')
	IF RECCOUNT('tmpPSTK_ID_Detail_Process') > 0
		nID_Detail = PrepareSQLnum(tmpPSTK_ID_Detail_Process.ID_Detail,'ID_Detail',-3)
	ENDIF
	USE IN tmpPSTK_ID_Detail_Process
ENDIF
IF nConn != pConnHandle
	 = SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nID_Detail
ENDPROC

********************************* 
PROC Has_ID_Detail_History
PARAMETER nID_Detail, cTBL, pConnHandle
*lOK = Has_ID_Detail_History( nID_Detail, cTBL, pConnHandle )
*Check for history before updateing

IF VARTYPE(nID_Detail) != "N"
	TrackError("Bad Parameter","Bad Parameter nID_Detail","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF

PRIVATE lHas_Hist
lHas_Hist = .F.

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	nConn = pConnHandle
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF
nConn = CheckSQLConnection(nConn)


PRIVATE cSQL, nSQLEXEC, lOK, cMess
lOK = .T.
cMess = ""
PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_ID_Detail_Hist')
	USE IN tmpPSTK_ID_Detail_Hist
ENDIF

SELECT 0

cSQL = " SELECT COUNT(*) AS CNT FROM "
DO CASE
CASE cTBL = "S"
	cSQL = cSQL + " HPAlloy_Archive.dbo.StockLst_Detail_History WITH(NOLOCK) "
CASE cTBL = "B"
	cSQL = cSQL + " HPAlloy_Archive.dbo.BrokerLst_Detail_History WITH(NOLOCK) "
CASE cTBL = "W"
	cSQL = cSQL + " HPAlloy_Archive.dbo.WIPLst_Detail_History WITH(NOLOCK) "
OTHERWISE 
	TrackError("Bad Parameter","Bad Parameter cTBL="+cTBL,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDCASE

cSQL = cSQL + " WHERE ID_Detail = "+STR(nID_Detail )
cSQL = cSQL+" AND [What] <> 'Add'"
cSQL = cSQL+" AND ( ISNULL(Size_H,0) > 0 OR ISNULL(Size_L,0) > 0 )"

nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_ID_Detail_Hist')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_ID_Detail_Hist' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_ID_Detail_Hist")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_ID_Detail_Hist")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	lOK = .F.
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_ID_Detail_Hist')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF
IF USED('tmpPSTK_ID_Detail_Hist')
	IF RECCOUNT('tmpPSTK_ID_Detail_Hist') > 0
		IF tmpPSTK_ID_Detail_Hist.CNT > 0
			lHas_Hist = .T.
		ENDIF
	ENDIF
	USE IN tmpPSTK_ID_Detail_Hist
ENDIF
IF nConn != pConnHandle
	 = SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lHas_Hist
ENDPROC
**********************************
PROCEDURE get_Starting_Stock_Desc
PARAMETERS cSOitem, pConnHandle
*get_Starting_Stock_Desc( cSOitem,ThisForm.nConnHandle)

PRIVATE cReturn
cReturn = ''

IF VARTYPE(cSOitem) != "C"
	TrackError("Bad Parameter","Bad Parameter SOitem","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
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

IF USED("tmpPSTK_Desc5")
	USE IN tmpPSTK_Desc5
ENDIF

cSQL = "SELECT "
cSQL = cSQL + " dbo.f_ItemDescriptionMetric(SD.Form,SD.Thck,SD.Sz2,SD.Sz3,SD.Weight,SD.RandLen,SD.Metric,'','','') AS ItemDescription "
cSQL = cSQL + " FROM dbo.StartingStock SD "
cSQL = cSQL + " WHERE SOitem = dbo.f_ProperSOitem('"+cSOItem+"')"

SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Desc5')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_Desc5' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Desc5")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Desc5")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL,nConn, nSQLEXEC, 'tmpPSTK_Desc5')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

IF USED('tmpPSTK_Desc5')
	IF VARTYPE(tmpPSTK_Desc5.ItemDescription)="C"
		cReturn = ALLTRIM(tmpPSTK_Desc5.ItemDescription)
	ENDIF
ENDIF

IF USED('tmpPSTK_Desc5')
	USE IN tmpPSTK_Desc5
ENDIF

IF LEN(cReturn) = 0

	cSQL = "SELECT "
	cSQL = cSQL + " dbo.f_ItemDescriptionMetric(SD.Form,SD.Thck,SD.Sz2,SD.Sz3,SD.Weight,SD.RandLen,SD.Metric,Sz1orig,Sz2orig,Sz3orig) AS ItemDescription "
	cSQL = cSQL + " FROM dbo.AllQuotes SD "
	cSQL = cSQL + " WHERE SOitem = dbo.f_ProperSOitem('"+cSOItem+"')"

	SELECT 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Desc5')

	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_Desc5' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Desc5")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Desc5")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL,nConn, nSQLEXEC, 'tmpPSTK_Desc5')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF

	IF USED('tmpPSTK_Desc5')
		IF VARTYPE(tmpPSTK_Desc5.ItemDescription)="C"
			cReturn = ALLTRIM(tmpPSTK_Desc5.ItemDescription)
			MESSAGEBOX("This PO is marked as a 'Conversion Service'"+CHR(13)+"Conversion usually require a 'Starting Stock'"+CHR(13)+"No Starting stock entry was found!"+CHR(13)+CHR(13)+"Use the Starting Stock option in Quote tab"+CHR(13)+"so shop knows what to send!" ,0+48,"Why no Starting Stock?")
		ENDIF
	ENDIF

	IF USED('tmpPSTK_Desc5')
		USE IN tmpPSTK_Desc5
	ENDIF

ENDIF


IF lNewConn
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cReturn 
ENDPROC


******************************** 
PROCEDURE Move_Lst_POitem
PARAMETERS cPOitem, cOldTBL, cNewTBL, nConn
*nID_Detail_Process =Move_Lst_POitem( cPOitem, cOldTBL, cNewTBL, nConn )
*Returns New ID_Detail_Process

IF VARTYPE(cPOitem) != "C"
	TrackError("Bad Parameter","Bad Parameter cPOitem","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF VARTYPE(cOldTBL) != "C"
	TrackError("Bad Parameter","Bad Parameter cOldTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF NOT (cOldTBL = 'S' OR cOldTBL = 'B' OR cOldTBL = 'W' )
	TrackError("Bad Parameter","Bad Parameter cOldTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

IF VARTYPE(cNewTBL) != "C"
	TrackError("Bad Parameter","Bad Parameter cNewTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF NOT (cNewTBL= 'S' OR cNewTBL= 'B' OR cNewTBL= 'W' )
	TrackError("Bad Parameter","Bad Parameter cNewTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

IF VARTYPE(nConn) != "N"
	TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF VARTYPE(nID_Detail) != "N"
	TrackError("Bad Parameter","Bad Parameter nID_Detail ","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF nID_Detail = 0
	TrackError("Bad Parameter","Bad Parameter nID_Detail ","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

nConn = CheckSQLConnection(nConn)
PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_Mov_Cnt')
	USE IN tmpPSTK_Mov_Cnt
ENDIF

PRIVATE nNewID_Detail_Process 
nNewID_Detail_Process = 0

*BREAK Move_Lst_POitem

* test for Heat is 'Due In'
PRIVATE cSQL, nSQLEXEC
cSQL = "SELECT M.Heat, M.ID "
DO CASE
CASE cOldTBL = "S"
	cSQL = cSQL + " from dbo.StockLst_Master M "
	cSQL = cSQL + " Inner join dbo.StockLst_Detail D ON M.ID = D.ID "
CASE cOldTBL = "B"
	cSQL = cSQL + " from dbo.BrokerLst_Master M "
	cSQL = cSQL + " Inner join dbo.BrokerLst_Detail D ON M.ID = D.ID "
CASE cOldTBL = "W"
	cSQL = cSQL + " from dbo.WIPLst_Master M "
	cSQL = cSQL + " Inner join dbo.WIPLst_Detail D ON M.ID = D.ID "
ENDCASE
cSQL = cSQL + " WHERE D.ID_Detail ="+STR(nID_Detail)

SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Mov_Cnt')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_Mov_Cnt')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Mov_Cnt")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Mov_Cnt")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpPSTK_Mov_Cnt')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

PRIVATE lCanMoveStock, nOldID, nNewID
lCanMoveStock = .F.
nOldID = 0
nNewID = 0
IF USED('tmpPSTK_Mov_Cnt')
	IF RECCOUNT('tmpPSTK_Mov_Cnt') > 0
		IF UPPER(tmpPSTK_Mov_Cnt.Heat) = "DUE IN"
			lCanMoveStock = .T.
		ENDIF
		nOldID = tmpPSTK_Mov_Cnt.ID
	ENDIF
	
	USE IN tmpPSTK_Mov_Cnt
ENDIF

IF lCanMoveStock 
	DO CASE 
	CASE cOldTBL="B" AND cNewTBL="S"
		nNewID_Detail_Process = Move_BrokerLst_StockLst(nOldID,nID_Detail,nConn )
	CASE cOldTBL="S" AND cNewTBL="B"
		nNewID_Detail_Process = Move_StockLst_BrokerLst(nOldID,nID_Detail,nConn )
	CASE cOldTBL="W" AND cNewTBL="S"
		nNewID_Detail_Process = Move_WIPLst_StockLst(nOldID,nID_Detail,nConn )
	*	p_Move_WIPLst_StockLst
	OTHERWISE
		TrackError("Not Programed -Move '"+cOldTBL+"' to '"+cNewTBL+"' is not Programed","Move StockLst", PROGRAM(), LINENO(1))	
	ENDCASE
ENDIF


IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

nNewID = nNewID_Detail_Process 
DO CASE
CASE nNewID = 0
*!*			--RETURN CODES
	TrackMess( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail)+") No new SCOPE IDENTITY")
	TrackError( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail)+") No new SCOPE IDENTITY"+CHR(13)+cSQL,"EXEC dbo.p_Move_BrokerLst_StockLst","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
	MESSAGEBOX( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail)+") No new SCOPE_IDENTITY",0,"SQL Proc Error")
CASE nNewID = -1
*!*			--RETURN CODES
*!*			-- 1 NO ID
	TrackMess( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail)+") ID Not Found")
	TrackError( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail)+") ID Not Found"+CHR(13)+cSQL,"EXEC dbo.p_Move_BrokerLst_StockLst ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
	MESSAGEBOX( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail)+") ID Not Found",0,"SQL Proc Error")
CASE nNewID = -2
*!*			-- 2 NO ID_Detail
	TrackMess( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") ID_Detail Not found")
	TrackError( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") ID_Detail Not found"+CHR(13)+cSQL,"EXEC dbo.p_Move_BrokerLst_StockLst ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
	MESSAGEBOX( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") ID_Detail Not found",0,"SQL Proc Error")
CASE nNewID = -3
*!*			-- 3 NO ID_Detail_Process
	TrackMess( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") ID_Detail_Process not found")
	TrackError( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") ID_Detail_Process not found"+CHR(13)+cSQL,"EXEC dbo.p_Move_BrokerLst_StockLst ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
	MESSAGEBOX("Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") ID_Detail_Process not found",0,"SQL Proc Error")
CASE nNewID = -4
*!*			-- 4 StockLst_Master Did not Insert
	TrackMess( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Did not Insert")
	TrackError( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Did not Insert"+CHR(13)+cSQL,"EXEC dbo.p_Move_BrokerLst_StockLst ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
	MESSAGEBOX("Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Did not Insert",0,"SQL Proc Error")
CASE nNewID = -5
*!*			-- 5 StockLst_Detail Did not Insert
	TrackMess( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Did not Insert Detail")
	TrackError( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Did not Insert Detail"+CHR(13)+cSQL,"EXEC dbo.p_Move_BrokerLst_StockLst ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
	MESSAGEBOX( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Did not Insert Detail",0,"SQL Proc Error")
CASE nNewID = -6
*!*			-- 6 StockLst_Process Did not Insert
	TrackMess( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Did not Insert Process")
	TrackError( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Did not Insert Process"+CHR(13)+cSQL,"EXEC dbo.p_Move_BrokerLst_StockLst ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
	MESSAGEBOX( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Did not Insert Process",0,"SQL Proc Error")
CASE nNewID = -7
*!*			-- 7 StockLst_Detail_Process Did not Insert
	TrackMess( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Did not insert Detail_Process")
	TrackError( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Did not insert Detail_Process"+CHR(13)+cSQL,"EXEC dbo.p_Move_BrokerLst_StockLst ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
	MESSAGEBOX( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Did not insert Detail_Process",0,"SQL Proc Error")
CASE nNewID = -8
*!*			-- 8 Could not Delete BrokerLst_Process
	TrackMess( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not DELETE BrokerLst Process")
	TrackError( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not DELETE BrokerLst Process"+CHR(13)+cSQL,"EXEC dbo.p_Move_BrokerLst_StockLst ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
	MESSAGEBOX( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not DELETE BrokerLst Process",0,"SQL Proc Error")
CASE nNewID = -9
*!*			-- 9 Could not UPDATE BrokerLst_Process_History  
	TrackMess( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not UPDATE BrokerLst_Process_History")
	TrackError( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not UPDATE BrokerLst_Process_History"+CHR(13)+cSQL,"EXEC dbo.p_Move_BrokerLst_StockLst ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
	MESSAGEBOX( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not UPDATE BrokerLst_Process_History",0,"SQL Proc Error")
CASE nNewID = -10
*!*			-- 10 Could not Delete BrokerLst_Process_Detail
	TrackMess( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not Delete BrokerLst_Process_Detail")
	TrackError( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not Delete BrokerLst_Process_Detail"+CHR(13)+cSQL,"EXEC dbo.p_Move_BrokerLst_StockLst ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
	MESSAGEBOX( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not Delete BrokerLst_Process_Detail",0,"SQL Proc Error")
CASE nNewID = -11
*!*			-- 11 Could not Delete BrokerLst_Detail
	TrackMess( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not Delete BrokerLst_Detail")
	TrackError( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not Delete BrokerLst_Detail"+CHR(13)+cSQL,"EXEC dbo.p_Move_BrokerLst_StockLst ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
	MESSAGEBOX( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not Delete BrokerLst_Detail",0,"SQL Proc Error")
CASE nNewID = -12
*!*			-- 12 Could not Delete BrokerLst_Master
	TrackMess( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not Delete BrokerLst_Master")
	TrackError( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not Delete BrokerLst_Master"+CHR(13)+cSQL,"EXEC dbo.p_Move_BrokerLst_StockLst ","Proc_StockLst:Move_BrokerLst_StockLst","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
	MESSAGEBOX( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not Delete BrokerLst_Master",0,"SQL Proc Error")
ENDCASE
		
RETURN nNewID_Detail_Process 
ENDPROC

******************************** 
PROCEDURE Move_BrokerLst_StockLst 
PARAMETERS nID,nID_Detail,nConn
*nNewID = Move_BrokerLst_StockLst( nID,nID_Detail,nConn )
*Returns New StockLst Master ID

IF VARTYPE(nConn) != "N"
	TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF VARTYPE(nID) != "N"
	TrackError("Bad Parameter","Bad Parameter nID","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF VARTYPE(nID_Detail) != "N"
	TrackError("Bad Parameter","Bad Parameter nID_Detail ","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

IF nID = 0
	TrackError("Bad Parameter","Bad Parameter nID ","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF nID_Detail = 0
	TrackError("Bad Parameter","Bad Parameter nID_Detail ","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

nConn = CheckSQLConnection(nConn)
PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_MoveBrokerStock')
	USE IN tmpPSTK_MoveBrokerStock
ENDIF

PRIVATE nNewID
nNewID = 0

*nID,nID_Detail
PRIVATE cSQL, nSQLEXEC
cSQL = "EXEC dbo.p_Move_BrokerLst_StockLst "
cSQL = cSQL + " @ID = "+STR(nID)
cSQL = cSQL + " ,@ID_Detail ="+STR(nID_Detail)

SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_MoveBrokerStock')

*!*	BEGIN TRANSACTION Move_BrokerLst_StockLst
*!*	INSERT INTO dbo.StockLst_Master 
*!*		([Alloy],[Form],[cc],[CL],[Size],[Cond],[MWeight],[specs],[Heat],[Lot],[PAID],[PO_Item]
*!*		,[PODueDate],[Mill],[StkDate],[History],[Num],[POStatus],[BrandName],[From_ID],MillTrace 
*!*		,Melt,mS_QTY,WO_Detail)
	
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_MoveBrokerStock')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MoveBrokerStock")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MoveBrokerStock")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpPSTK_MoveBrokerStock')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

TrackMess(cSQL)

IF USED('tmpPSTK_MoveBrokerStock')
	IF VARTYPE(tmpPSTK_MoveBrokerStock.EXP)="N"
		nNewID = tmpPSTK_MoveBrokerStock.EXP
		
		DO CASE
		CASE nNewID = 0
*!*			--RETURN CODES
			TrackMess( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail)+") No new SCOPE IDENTITY")
			TrackError( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail)+") No new SCOPE IDENTITY"+CHR(13)+cSQL,"EXEC dbo.p_Move_BrokerLst_StockLst","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail)+") No new SCOPE_IDENTITY",0,"SQL Proc Error")
		CASE nNewID = -1
*!*			--RETURN CODES
*!*			-- 1 NO ID
			TrackMess( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail)+") ID Not Found")
			TrackError( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail)+") ID Not Found"+CHR(13)+cSQL,"EXEC dbo.p_Move_BrokerLst_StockLst ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail)+") ID Not Found",0,"SQL Proc Error")
		CASE nNewID = -2
*!*			-- 2 NO ID_Detail
			TrackMess( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") ID_Detail Not found")
			TrackError( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") ID_Detail Not found"+CHR(13)+cSQL,"EXEC dbo.p_Move_BrokerLst_StockLst ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") ID_Detail Not found",0,"SQL Proc Error")
		CASE nNewID = -3
*!*			-- 3 NO ID_Detail_Process
			TrackMess( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") ID_Detail_Process not found")
			TrackError( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") ID_Detail_Process not found"+CHR(13)+cSQL,"EXEC dbo.p_Move_BrokerLst_StockLst ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
			MESSAGEBOX("Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") ID_Detail_Process not found",0,"SQL Proc Error")
		CASE nNewID = -4
*!*			-- 4 StockLst_Master Did not Insert
			TrackMess( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Did not Insert")
			TrackError( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Did not Insert"+CHR(13)+cSQL,"EXEC dbo.p_Move_BrokerLst_StockLst ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
			MESSAGEBOX("Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Did not Insert",0,"SQL Proc Error")
		CASE nNewID = -5
*!*			-- 5 StockLst_Detail Did not Insert
			TrackMess( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Did not Insert Detail")
			TrackError( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Did not Insert Detail"+CHR(13)+cSQL,"EXEC dbo.p_Move_BrokerLst_StockLst ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Did not Insert Detail",0,"SQL Proc Error")
		CASE nNewID = -6
*!*			-- 6 StockLst_Process Did not Insert
			TrackMess( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Did not Insert Process")
			TrackError( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Did not Insert Process"+CHR(13)+cSQL,"EXEC dbo.p_Move_BrokerLst_StockLst ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Did not Insert Process",0,"SQL Proc Error")
		CASE nNewID = -7
*!*			-- 7 StockLst_Detail_Process Did not Insert
			TrackMess( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Did not insert Detail_Process")
			TrackError( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Did not insert Detail_Process"+CHR(13)+cSQL,"EXEC dbo.p_Move_BrokerLst_StockLst ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Did not insert Detail_Process",0,"SQL Proc Error")
		CASE nNewID = -8
*!*			-- 8 Could not Delete BrokerLst_Process
			TrackMess( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not DELETE BrokerLst Process")
			TrackError( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not DELETE BrokerLst Process"+CHR(13)+cSQL,"EXEC dbo.p_Move_BrokerLst_StockLst ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not DELETE BrokerLst Process",0,"SQL Proc Error")
		CASE nNewID = -9
*!*			-- 9 Could not UPDATE BrokerLst_Process_History  
			TrackMess( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not UPDATE BrokerLst_Process_History")
			TrackError( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not UPDATE BrokerLst_Process_History"+CHR(13)+cSQL,"EXEC dbo.p_Move_BrokerLst_StockLst ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not UPDATE BrokerLst_Process_History",0,"SQL Proc Error")
		CASE nNewID = -10
*!*			-- 10 Could not Delete BrokerLst_Process_Detail
			TrackMess( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not Delete BrokerLst_Process_Detail")
			TrackError( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not Delete BrokerLst_Process_Detail"+CHR(13)+cSQL,"EXEC dbo.p_Move_BrokerLst_StockLst ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not Delete BrokerLst_Process_Detail",0,"SQL Proc Error")
		CASE nNewID = -11
*!*			-- 11 Could not Delete BrokerLst_Detail
			TrackMess( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not Delete BrokerLst_Detail")
			TrackError( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not Delete BrokerLst_Detail"+CHR(13)+cSQL,"EXEC dbo.p_Move_BrokerLst_StockLst ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not Delete BrokerLst_Detail",0,"SQL Proc Error")
		CASE nNewID = -12
*!*			-- 12 Could not Delete BrokerLst_Master
			TrackMess( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not Delete BrokerLst_Master")
			TrackError( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not Delete BrokerLst_Master"+CHR(13)+cSQL,"EXEC dbo.p_Move_BrokerLst_StockLst ","Proc_StockLst:Move_BrokerLst_StockLst","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Move_BrokerLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not Delete BrokerLst_Master",0,"SQL Proc Error")
		ENDCASE
		
		*INSERT INTO dbo.StockLst_Process  
		*SELECT 'Moved from BrokerLst' AS [comment] 
		*AND NOT ( [SOitem] LIKE 'STOCK%' OR [SOitem] LIKE 'ConvertSVC%' ) -Added 7/17/2013
		*Found non SOitems having processes against Moved Stock! so added the NOT STOCK cluase while adding StockLst_Process'
		
		IF nNewID < 1
			IF nSQLEXEC < 0
			*	IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpPSTK_MoveBrokerStock')
					RecordError(nSQLEXEC,"SQL Error","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
			*	ENDIF
			ENDIF
		ENDIF
	ENDIF
	
	USE IN tmpPSTK_MoveBrokerStock
ENDIF

IF nNewID > 0
	*Remove any Process in BrokerLst - Done in p_Move_BrokerLst_StockLst 
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nNewID
ENDPROC

******************************** 
PROCEDURE Move_StockLst_BrokerLst
PARAMETERS nID,nID_Detail,nConn
*nNewID = Move_StockLst_BrokerLst( nID,nID_Detail,nConn )
*Returns New BrokerLst Process ID

IF VARTYPE(nConn) != "N"
	TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF VARTYPE(nID) != "N"
	TrackError("Bad Parameter","Bad Parameter nID","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF VARTYPE(nID_Detail) != "N"
	TrackError("Bad Parameter","Bad Parameter nID_Detail ","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

IF nID = 0
	TrackError("Bad Parameter","Bad Parameter nID ","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF nID_Detail = 0
	TrackError("Bad Parameter","Bad Parameter nID_Detail ","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

nConn = CheckSQLConnection(nConn)
PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_MoveStockBroker')
	USE IN tmpPSTK_MoveStockBroker
ENDIF

PRIVATE nNewID
nNewID = 0

*nID,nID_Detail
PRIVATE cSQL, nSQLEXEC
cSQL = "EXEC dbo.p_Move_StockLst_BrokerLst "
cSQL = cSQL + " @ID = "+STR(nID)
cSQL = cSQL + " ,@ID_Detail ="+STR(nID_Detail)

SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_MoveStockBroker')

*!*	BEGIN TRANSACTION Move_BrokerLst_StockLst
*!*	INSERT INTO dbo.StockLst_Master 
*!*		([Alloy],[Form],[cc],[CL],[Size],[Cond],[MWeight],[specs],[Heat],[Lot],[PAID],[PO_Item]
*!*		,[PODueDate],[Mill],[StkDate],[History],[Num],[POStatus],[BrandName],[From_ID],MillTrace 
*!*		,Melt,mS_QTY,WO_Detail)
	
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_MoveStockBroker')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MoveStockBroker")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MoveStockBroker")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpPSTK_MoveStockBroker')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

TrackMess(cSQL)

IF USED('tmpPSTK_MoveStockBroker')
	IF VARTYPE(tmpPSTK_MoveStockBroker.EXP)="N"
		nNewID = tmpPSTK_MoveStockBroker.EXP
		
		DO CASE
		CASE nNewID = 0
*!*			--RETURN CODES
			TrackMess( "Proc_StockLst:p_Move_StockLst_BrokerLst("+STR(nID)+","+STR(nID_Detail)+") No new SCOPE IDENTITY")
			TrackError( "Proc_StockLst:p_Move_StockLst_BrokerLst("+STR(nID)+","+STR(nID_Detail)+") No new SCOPE IDENTITY"+CHR(13)+cSQL,"EXEC dbo.p_Move_StockLst_BrokerLst","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Move_StockLst_BrokerLst("+STR(nID)+","+STR(nID_Detail)+") No new SCOPE_IDENTITY",0,"SQL Proc Error")
		CASE nNewID = -1
*!*			--RETURN CODES
*!*			-- 1 NO ID
			TrackMess( "Proc_StockLst:p_Move_StockLst_BrokerLst("+STR(nID)+","+STR(nID_Detail)+") ID Not Found")
			TrackError( "Proc_StockLst:p_Move_StockLst_BrokerLst("+STR(nID)+","+STR(nID_Detail)+") ID Not Found"+CHR(13)+cSQL,"EXEC dbo.p_Move_StockLst_BrokerLst ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Move_StockLst_BrokerLst("+STR(nID)+","+STR(nID_Detail)+") ID Not Found",0,"SQL Proc Error")
		CASE nNewID = -2
*!*			-- 2 NO ID_Detail
			TrackMess( "Proc_StockLst:p_Move_StockLst_BrokerLst("+STR(nID)+","+STR(nID_Detail) +") ID_Detail Not found")
			TrackError( "Proc_StockLst:p_Move_StockLst_BrokerLst("+STR(nID)+","+STR(nID_Detail) +") ID_Detail Not found"+CHR(13)+cSQL,"EXEC dbo.p_Move_StockLst_BrokerLst ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Move_StockLst_BrokerLst("+STR(nID)+","+STR(nID_Detail) +") ID_Detail Not found",0,"SQL Proc Error")
		CASE nNewID = -3
*!*			-- 3 NO ID_Detail_Process
			TrackMess( "Proc_StockLst:p_Move_StockLst_BrokerLst("+STR(nID)+","+STR(nID_Detail) +") ID_Detail_Process not found")
			TrackError( "Proc_StockLst:p_Move_StockLst_BrokerLst("+STR(nID)+","+STR(nID_Detail) +") ID_Detail_Process not found"+CHR(13)+cSQL,"EXEC dbo.p_Move_StockLst_BrokerLst ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
			MESSAGEBOX("Proc_StockLst:p_Move_StockLst_BrokerLst("+STR(nID)+","+STR(nID_Detail) +") ID_Detail_Process not found",0,"SQL Proc Error")
		CASE nNewID = -4
*!*			-- 4 StockLst_Master Did not Insert
			TrackMess( "Proc_StockLst:p_Move_StockLst_BrokerLst("+STR(nID)+","+STR(nID_Detail) +") Did not Insert")
			TrackError( "Proc_StockLst:p_Move_StockLst_BrokerLst("+STR(nID)+","+STR(nID_Detail) +") Did not Insert"+CHR(13)+cSQL,"EXEC dbo.p_Move_StockLst_BrokerLst ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
			MESSAGEBOX("Proc_StockLst:p_Move_StockLst_BrokerLst("+STR(nID)+","+STR(nID_Detail) +") Did not Insert",0,"SQL Proc Error")
		CASE nNewID = -5
*!*			-- 5 StockLst_Detail Did not Insert
			TrackMess( "Proc_StockLst:p_Move_StockLst_BrokerLst("+STR(nID)+","+STR(nID_Detail) +") Did not Insert Detail")
			TrackError( "Proc_StockLst:p_Move_StockLst_BrokerLst("+STR(nID)+","+STR(nID_Detail) +") Did not Insert Detail"+CHR(13)+cSQL,"EXEC dbo.p_Move_StockLst_BrokerLst ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Move_StockLst_BrokerLst("+STR(nID)+","+STR(nID_Detail) +") Did not Insert Detail",0,"SQL Proc Error")
		CASE nNewID = -6
*!*			-- 6 StockLst_Process Did not Insert
			TrackMess( "Proc_StockLst:p_Move_StockLst_BrokerLst("+STR(nID)+","+STR(nID_Detail) +") Did not Insert Process")
			TrackError( "Proc_StockLst:p_Move_StockLst_BrokerLst("+STR(nID)+","+STR(nID_Detail) +") Did not Insert Process"+CHR(13)+cSQL,"EXEC dbo.p_Move_StockLst_BrokerLst ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Move_StockLst_BrokerLst("+STR(nID)+","+STR(nID_Detail) +") Did not Insert Process",0,"SQL Proc Error")
		CASE nNewID = -7
*!*			-- 7 StockLst_Detail_Process Did not Insert
			TrackMess( "Proc_StockLst:p_Move_StockLst_BrokerLst("+STR(nID)+","+STR(nID_Detail) +") Did not insert Detail_Process")
			TrackError( "Proc_StockLst:p_Move_StockLst_BrokerLst("+STR(nID)+","+STR(nID_Detail) +") Did not insert Detail_Process"+CHR(13)+cSQL,"EXEC dbo.p_Move_StockLst_BrokerLst ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Move_StockLst_BrokerLst("+STR(nID)+","+STR(nID_Detail) +") Did not insert Detail_Process",0,"SQL Proc Error")
		CASE nNewID = -8
*!*			-- 8 Could not Delete BrokerLst_Process
			TrackMess( "Proc_StockLst:p_Move_StockLst_BrokerLst("+STR(nID)+","+STR(nID_Detail) +") Could not DELETE BrokerLst Process")
			TrackError( "Proc_StockLst:p_Move_StockLst_BrokerLst("+STR(nID)+","+STR(nID_Detail) +") Could not DELETE BrokerLst Process"+CHR(13)+cSQL,"EXEC dbo.p_Move_StockLst_BrokerLst ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Move_StockLst_BrokerLst("+STR(nID)+","+STR(nID_Detail) +") Could not DELETE BrokerLst Process",0,"SQL Proc Error")
		CASE nNewID = -9
*!*			-- 9 Could not UPDATE BrokerLst_Process_History  
			TrackMess( "Proc_StockLst:p_Move_StockLst_BrokerLst("+STR(nID)+","+STR(nID_Detail) +") Could not UPDATE BrokerLst_Process_History")
			TrackError( "Proc_StockLst:p_Move_StockLst_BrokerLst("+STR(nID)+","+STR(nID_Detail) +") Could not UPDATE BrokerLst_Process_History"+CHR(13)+cSQL,"EXEC dbo.p_Move_StockLst_BrokerLst ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Move_StockLst_BrokerLst("+STR(nID)+","+STR(nID_Detail) +") Could not UPDATE BrokerLst_Process_History",0,"SQL Proc Error")
		CASE nNewID = -10
*!*			-- 10 Could not Delete BrokerLst_Process_Detail
			TrackMess( "Proc_StockLst:p_Move_StockLst_BrokerLst("+STR(nID)+","+STR(nID_Detail) +") Could not Delete BrokerLst_Process_Detail")
			TrackError( "Proc_StockLst:p_Move_StockLst_BrokerLst("+STR(nID)+","+STR(nID_Detail) +") Could not Delete BrokerLst_Process_Detail"+CHR(13)+cSQL,"EXEC dbo.p_Move_StockLst_BrokerLst ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Move_StockLst_BrokerLst("+STR(nID)+","+STR(nID_Detail) +") Could not Delete BrokerLst_Process_Detail",0,"SQL Proc Error")
		CASE nNewID = -11
*!*			-- 11 Could not Delete BrokerLst_Detail
			TrackMess( "Proc_StockLst:p_Move_StockLst_BrokerLst("+STR(nID)+","+STR(nID_Detail) +") Could not Delete BrokerLst_Detail")
			TrackError( "Proc_StockLst:p_Move_StockLst_BrokerLst("+STR(nID)+","+STR(nID_Detail) +") Could not Delete BrokerLst_Detail"+CHR(13)+cSQL,"EXEC dbo.p_Move_StockLst_BrokerLst ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Move_StockLst_BrokerLst("+STR(nID)+","+STR(nID_Detail) +") Could not Delete BrokerLst_Detail",0,"SQL Proc Error")
		CASE nNewID = -12
*!*			-- 12 Could not Delete BrokerLst_Master
			TrackMess( "Proc_StockLst:p_Move_StockLst_BrokerLst("+STR(nID)+","+STR(nID_Detail) +") Could not Delete BrokerLst_Master")
			TrackError( "Proc_StockLst:p_Move_StockLst_BrokerLst("+STR(nID)+","+STR(nID_Detail) +") Could not Delete BrokerLst_Master"+CHR(13)+cSQL,"EXEC dbo.p_Move_StockLst_BrokerLst ","Proc_StockLst:Move_BrokerLst_StockLst","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Move_StockLst_BrokerLst("+STR(nID)+","+STR(nID_Detail) +") Could not Delete BrokerLst_Master",0,"SQL Proc Error")
		ENDCASE
		
		*INSERT INTO dbo.StockLst_Process  
		*SELECT 'Moved from BrokerLst' AS [comment] 
		*AND NOT ( [SOitem] LIKE 'STOCK%' OR [SOitem] LIKE 'ConvertSVC%' ) -Added 7/17/2013
		*Found non SOitems having processes against Moved Stock! so added the NOT STOCK cluase while adding StockLst_Process'
		
		IF nNewID < 1
			IF nSQLEXEC < 0
			*	IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpPSTK_MoveStockBroker')
					RecordError(nSQLEXEC,"SQL Error","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
			*	ENDIF
			ENDIF
		ENDIF
	ENDIF
	
	USE IN tmpPSTK_MoveStockBroker
ENDIF

IF nNewID > 0
	*Remove any Process in BrokerLst - Done in p_Move_StockLst_BrokerLst 
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nNewID
ENDPROC

******************************** 
PROCEDURE Create_StockLstRMA_From_Broker_History
PARAMETERS nID,nConn
*Create_StockLstRMA_From_Broker_History( nID,nConn )
*Returns New StockLst Master ID

IF VARTYPE(nConn) != "N"
	TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF VARTYPE(nID) != "N"
	TrackError("Bad Parameter","Bad Parameter nID","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

IF nID = 0
	TrackError("Bad Parameter","Bad Parameter nID ","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF


nConn = CheckSQLConnection(nConn)
PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_StockRMA')
	USE IN tmpPSTK_StockRMA
ENDIF

PRIVATE nNewID
nNewID = 0

*nID,nID_Detail
PRIVATE cSQL, nSQLEXEC
cSQL = "EXEC dbo.p_Create_StockLstRMA_From_Broker_History "
cSQL = cSQL + " @ID = "+STR(nID)


SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_StockRMA')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_StockRMA')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_StockRMA")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_StockRMA")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpPSTK_StockRMA')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

TrackMess(cSQL)

IF USED('tmpPSTK_StockRMA')
	IF VARTYPE(tmpPSTK_StockRMA.EXP)="N"
		nNewID = tmpPSTK_StockRMA.EXP
		
		DO CASE
		CASE nNewID = 0
*!*			--RETURN CODES
			TrackMess( "Proc_StockLst:p_Create_StockLstRMA_From_Broker_History ("+STR(nID)+"} No new SCOPE IDENTITY")
			TrackError( "Proc_StockLst:p_Create_StockLstRMA_From_Broker_History ("+STR(nID)+"} No new SCOPE IDENTITY"+CHR(13)+cSQL,"EXEC dbo.p_Create_StockLstRMA_From_Broker_History ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Create_StockLstRMA_From_Broker_History ("+STR(nID)+"} No new SCOPE_IDENTITY",0,"SQL Proc Error")
		CASE nNewID = -1
*!*			--RETURN CODES
*!*			-- 1 NO ID
			TrackMess( "Proc_StockLst:p_Create_StockLstRMA_From_Broker_History ("+STR(nID)+") ID Not Found")
			TrackError( "Proc_StockLst:p_Create_StockLstRMA_From_Broker_History ("+STR(nID)+") ID Not Found"+CHR(13)+cSQL,"EXEC dbo.p_Create_StockLstRMA_From_Broker_History  ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Create_StockLstRMA_From_Broker_History ("+STR(nID)+") ID Not Found",0,"SQL Proc Error")
		CASE nNewID = -2
*!*			-- 2 NO ID_Detail
			TrackMess( "Proc_StockLst:p_Create_StockLstRMA_From_Broker_History ("+STR(nID) +") ID_Detail Not found")
			TrackError( "Proc_StockLst:p_Create_StockLstRMA_From_Broker_History ("+STR(nID) +") ID_Detail Not found"+CHR(13)+cSQL,"EXEC dbo.p_Create_StockLstRMA_From_Broker_History  ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Create_StockLstRMA_From_Broker_History ("+STR(nID) +") ID_Detail Not found",0,"SQL Proc Error")
		CASE nNewID = -3
*!*			-- 3 NO ID_Detail_Process
			TrackMess( "Proc_StockLst:p_Create_StockLstRMA_From_Broker_History ("+STR(nID) +") ID_Detail_Process not found")
			TrackError( "Proc_StockLst:p_Create_StockLstRMA_From_Broker_History ("+STR(nID) +") ID_Detail_Process not found"+CHR(13)+cSQL,"EXEC dbo.p_Create_StockLstRMA_From_Broker_History  ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
			MESSAGEBOX("Proc_StockLst:p_Create_StockLstRMA_From_Broker_History ("+STR(nID) +") ID_Detail_Process not found",0,"SQL Proc Error")
		CASE nNewID = -4
*!*			-- 4 StockLst_Master Did not Insert
			TrackMess( "Proc_StockLst:p_Create_StockLstRMA_From_Broker_History ("+STR(nID) +") Did not Insert")
			TrackError( "Proc_StockLst:p_Create_StockLstRMA_From_Broker_History ("+STR(nID) +") Did not Insert"+CHR(13)+cSQL,"EXEC dbo.p_Create_StockLstRMA_From_Broker_History  ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
			MESSAGEBOX("Proc_StockLst:p_Create_StockLstRMA_From_Broker_History ("+STR(nID) +") Did not Insert",0,"SQL Proc Error")
		CASE nNewID = -5
*!*			-- 5 StockLst_Detail Did not Insert
			TrackMess( "Proc_StockLst:p_Create_StockLstRMA_From_Broker_History ("+STR(nID) +") Did not Insert Detail")
			TrackError( "Proc_StockLst:p_Create_StockLstRMA_From_Broker_History ("+STR(nID) +") Did not Insert Detail"+CHR(13)+cSQL,"EXEC dbo.p_Create_StockLstRMA_From_Broker_History  ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Create_StockLstRMA_From_Broker_History ("+STR(nID) +") Did not Insert Detail",0,"SQL Proc Error")
		CASE nNewID = -6
*!*			-- 6 StockLst_Process Did not Insert
			TrackMess( "Proc_StockLst:p_Create_StockLstRMA_From_Broker_History ("+STR(nID) +") Did not Insert Process")
			TrackError( "Proc_StockLst:p_Create_StockLstRMA_From_Broker_History ("+STR(nID) +") Did not Insert Process"+CHR(13)+cSQL,"EXEC dbo.p_Create_StockLstRMA_From_Broker_History  ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Create_StockLstRMA_From_Broker_History ("+STR(nID) +") Did not Insert Process",0,"SQL Proc Error")
		CASE nNewID = -7
*!*			-- 7 StockLst_Detail_Process Did not Insert
			TrackMess( "Proc_StockLst:p_Create_StockLstRMA_From_Broker_History ("+STR(nID) +") Did not insert Detail_Process")
			TrackError( "Proc_StockLst:p_Create_StockLstRMA_From_Broker_History ("+STR(nID) +") Did not insert Detail_Process"+CHR(13)+cSQL,"EXEC dbo.p_Create_StockLstRMA_From_Broker_History  ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Create_StockLstRMA_From_Broker_History ("+STR(nID) +") Did not insert Detail_Process",0,"SQL Proc Error")
		CASE nNewID = -8
*!*			-- 8 Could not Delete BrokerLst_Process
			TrackMess( "Proc_StockLst:p_Create_StockLstRMA_From_Broker_History ("+STR(nID) +") Could not DELETE BrokerLst Process")
			TrackError( "Proc_StockLst:p_Create_StockLstRMA_From_Broker_History ("+STR(nID) +") Could not DELETE BrokerLst Process"+CHR(13)+cSQL,"EXEC dbo.p_Create_StockLstRMA_From_Broker_History  ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Create_StockLstRMA_From_Broker_History ("+STR(nID) +") Could not DELETE BrokerLst Process",0,"SQL Proc Error")
		CASE nNewID = -9
*!*			-- 9 Could not UPDATE BrokerLst_Process_History  
			TrackMess( "Proc_StockLst:p_Create_StockLstRMA_From_Broker_History ("+STR(nID) +") Could not UPDATE BrokerLst_Process_History")
			TrackError( "Proc_StockLst:p_Create_StockLstRMA_From_Broker_History ("+STR(nID) +") Could not UPDATE BrokerLst_Process_History"+CHR(13)+cSQL,"EXEC dbo.p_Create_StockLstRMA_From_Broker_History  ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Create_StockLstRMA_From_Broker_History ("+STR(nID) +") Could not UPDATE BrokerLst_Process_History",0,"SQL Proc Error")
		CASE nNewID = -10
*!*			-- 10 Could not Delete BrokerLst_Process_Detail
			TrackMess( "Proc_StockLst:p_Create_StockLstRMA_From_Broker_History ("+STR(nID) +") Could not Delete BrokerLst_Process_Detail")
			TrackError( "Proc_StockLst:p_Create_StockLstRMA_From_Broker_History ("+STR(nID) +") Could not Delete BrokerLst_Process_Detail"+CHR(13)+cSQL,"EXEC dbo.p_Create_StockLstRMA_From_Broker_History  ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Create_StockLstRMA_From_Broker_History ("+STR(nID) +") Could not Delete BrokerLst_Process_Detail",0,"SQL Proc Error")
		CASE nNewID = -11
*!*			-- 11 Could not Delete BrokerLst_Detail
			TrackMess( "Proc_StockLst:p_Create_StockLstRMA_From_Broker_History ("+STR(nID) +") Could not Delete BrokerLst_Detail")
			TrackError( "Proc_StockLst:p_Create_StockLstRMA_From_Broker_History ("+STR(nID) +") Could not Delete BrokerLst_Detail"+CHR(13)+cSQL,"EXEC dbo.p_Create_StockLstRMA_From_Broker_History  ","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Create_StockLstRMA_From_Broker_History ("+STR(nID) +") Could not Delete BrokerLst_Detail",0,"SQL Proc Error")
		CASE nNewID = -12
*!*			-- 12 Could not Delete BrokerLst_Master
			TrackMess( "Proc_StockLst:p_Create_StockLstRMA_From_Broker_History ("+STR(nID) +") Could not Delete BrokerLst_Master")
			TrackError( "Proc_StockLst:p_Create_StockLstRMA_From_Broker_History ("+STR(nID) +") Could not Delete BrokerLst_Master"+CHR(13)+cSQL,"EXEC dbo.p_Create_StockLstRMA_From_Broker_History  ","Proc_StockLst:Move_BrokerLst_StockLst","Proc_StockLst:Move_BrokerLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Create_StockLstRMA_From_Broker_History ("+STR(nID) +") Could not Delete BrokerLst_Master",0,"SQL Proc Error")
		ENDCASE
		
		*INSERT INTO dbo.StockLst_Process  
		*SELECT 'Moved from BrokerLst' AS [comment] 
		*AND NOT ( [SOitem] LIKE 'STOCK%' OR [SOitem] LIKE 'ConvertSVC%' ) -Added 7/17/2013
		*Found non SOitems having processes against Moved Stock! so added the NOT STOCK cluase while adding StockLst_Process'
		
		IF nNewID < 1
			IF nSQLEXEC < 0
			*	IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpPSTK_StockRMA')
					RecordError(nSQLEXEC,"SQL Error","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
			*	ENDIF
			ENDIF
		ENDIF
	ENDIF
	
	USE IN tmpPSTK_StockRMA
ENDIF

IF nNewID > 0
	*Remove any Process in BrokerLst - Done in p_Create_StockLstRMA_From_Broker_History  
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nNewID
ENDPROC


******************************** 
PROCEDURE Move_WIPLst_StockLst 
PARAMETERS nID,nID_Detail,nConn
*Move_WIPLst_StockLst( nID,nID_Detail,nConn )
*Returns New StockLst Master ID

IF VARTYPE(nConn) != "N"
	TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF VARTYPE(nID) != "N"
	TrackError("Bad Parameter","Bad Parameter nID ","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF VARTYPE(nID_Detail) != "N"
	TrackError("Bad Parameter","Bad Parameter nID_Detail ","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

IF nID = 0
	TrackError("Bad Parameter","Bad Parameter nID ","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF nID_Detail = 0
	TrackError("Bad Parameter","Bad Parameter nID_Detail ","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

nConn = CheckSQLConnection(nConn)
PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_MoveWIP_Stock')
	USE IN tmpPSTK_MoveWIP_Stock
ENDIF

PRIVATE nNewID
nNewID = 0

*nID,nID_Detail
PRIVATE cSQL, nSQLEXEC
cSQL = "EXEC dbo.p_Move_WIPLst_StockLst "
cSQL = cSQL + " @ID = "+STR(nID)
cSQL = cSQL + " ,@ID_Detail ="+STR(nID_Detail)

SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_MoveWIP_Stock')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_MoveWIP_Stock')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MoveWIP_Stock")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MoveWIP_Stock")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpPSTK_MoveWIP_Stock')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

TrackMess(cSQL)

IF USED('tmpPSTK_MoveWIP_Stock')
	IF VARTYPE(tmpPSTK_MoveWIP_Stock.EXP)="N"
		nNewID = tmpPSTK_MoveWIP_Stock.EXP
		
		DO CASE
		CASE nNewID = 0
*!*			--RETURN CODES
			TrackMess( "Proc_StockLst:p_Move_WIPLst_StockLst("+STR(nID)+","+STR(nID_Detail)+") No new SCOPE IDENTITY")
			TrackError( "Proc_StockLst:p_Move_WIPLst_StockLst("+STR(nID)+","+STR(nID_Detail)+") No new SCOPE IDENTITY"+CHR(13)+cSQL,"EXEC dbo.p_Move_WIPLst_StockLst","Proc_StockLst:Move_WIPLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Move_WIPLst_StockLst("+STR(nID)+","+STR(nID_Detail)+") No new SCOPE_IDENTITY",0,"SQL Proc Error")
		CASE nNewID = -1
*!*			--RETURN CODES
*!*			-- 1 NO ID
			TrackMess( "Proc_StockLst:p_Move_WIPLst_StockLst("+STR(nID)+","+STR(nID_Detail)+") ID Not Found")
			TrackError( "Proc_StockLst:p_Move_WIPLst_StockLst("+STR(nID)+","+STR(nID_Detail)+") ID Not Found"+CHR(13)+cSQL,"EXEC dbo.p_Move_WIPLst_StockLst","Proc_StockLst:Move_WIPLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Move_WIPLst_StockLst("+STR(nID)+","+STR(nID_Detail)+") ID Not Found",0,"SQL Proc Error")
		CASE nNewID = -2
*!*			-- 2 NO ID_Detail
			TrackMess( "Proc_StockLst:p_Move_WIPLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") ID_Detail Not found")
			TrackError( "Proc_StockLst:p_Move_WIPLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") ID_Detail Not found"+CHR(13)+cSQL,"EXEC dbo.p_Move_WIPLst_StockLst","Proc_StockLst:Move_WIPLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Move_WIPLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") ID_Detail Not found",0,"SQL Proc Error")
		CASE nNewID = -3
*!*			-- 3 NO ID_Detail_Process
			TrackMess( "Proc_StockLst:p_Move_WIPLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") ID_Detail_Process not found")
			TrackError( "Proc_StockLst:p_Move_WIPLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") ID_Detail_Process not found"+CHR(13)+cSQL,"EXEC dbo.p_Move_WIPLst_StockLst","Proc_StockLst:Move_WIPLst_StockLst",LINENO() )
			MESSAGEBOX("Proc_StockLst:p_Move_WIPLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") ID_Detail_Process not found",0,"SQL Proc Error")
		CASE nNewID = -4
*!*			-- 4 StockLst_Master Did not Insert
			TrackMess( "Proc_StockLst:p_Move_WIPLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Did not Insert")
			TrackError( "Proc_StockLst:p_Move_WIPLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Did not Insert"+CHR(13)+cSQL,"EXEC dbo.p_Move_WIPLst_StockLst","Proc_StockLst:Move_WIPLst_StockLst",LINENO() )
			MESSAGEBOX("Proc_StockLst:p_Move_WIPLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Did not Insert",0,"SQL Proc Error")
		CASE nNewID = -5
*!*			-- 5 StockLst_Detail Did not Insert
			TrackMess( "Proc_StockLst:p_Move_WIPLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Did not Insert Detail")
			TrackError( "Proc_StockLst:p_Move_WIPLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Did not Insert Detail"+CHR(13)+cSQL,"EXEC dbo.p_Move_WIPLst_StockLst","Proc_StockLst:Move_WIPLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Move_WIPLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Did not Insert Detail",0,"SQL Proc Error")
		CASE nNewID = -6
*!*			-- 6 StockLst_Process Did not Insert
			TrackMess( "Proc_StockLst:p_Move_WIPLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Did not Insert Process")
			TrackError( "Proc_StockLst:p_Move_WIPLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Did not Insert Process"+CHR(13)+cSQL,"EXEC dbo.p_Move_WIPLst_StockLst","Proc_StockLst:Move_WIPLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Move_WIPLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Did not Insert Process",0,"SQL Proc Error")
		CASE nNewID = -7
*!*			-- 7 StockLst_Detail_Process Did not Insert
			TrackMess( "Proc_StockLst:p_Move_WIPLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Did not insert Detail_Process")
			TrackError( "Proc_StockLst:p_Move_WIPLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Did not insert Detail_Process"+CHR(13)+cSQL,"EXEC dbo.p_Move_WIPLst_StockLst","Proc_StockLst:Move_WIPLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Move_WIPLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Did not insert Detail_Process",0,"SQL Proc Error")
		CASE nNewID = -8
*!*			-- 8 Could not Delete WIPLst_Process
			TrackMess( "Proc_StockLst:p_Move_WIPLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not DELETE WIPLst Process")
			TrackError( "Proc_StockLst:p_Move_WIPLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not DELETE WIPLst Process"+CHR(13)+cSQL,"EXEC dbo.p_Move_WIPLst_StockLst","Proc_StockLst:Move_WIPLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Move_WIPLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not DELETE WIPLst Process",0,"SQL Proc Error")
		CASE nNewID = -9
*!*			-- 9 Could not UPDATE WIPLst_Process_History  
			TrackMess( "Proc_StockLst:p_Move_WIPLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not UPDATE WIPLst_Process_History")
			TrackError( "Proc_StockLst:p_Move_WIPLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not UPDATE WIPLst_Process_History"+CHR(13)+cSQL,"EXEC dbo.p_Move_WIPLst_StockLst","Proc_StockLst:Move_WIPLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Move_WIPLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not UPDATE WIPLst_Process_History",0,"SQL Proc Error")
		CASE nNewID = -10
*!*			-- 10 Could not Delete WIPLst_Process_Detail
			TrackMess( "Proc_StockLst:p_Move_WIPLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not Delete WIPLst_Process_Detail")
			TrackError( "Proc_StockLst:p_Move_WIPLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not Delete WIPLst_Process_Detail"+CHR(13)+cSQL,"EXEC dbo.p_Move_WIPLst_StockLst","Proc_StockLst:Move_WIPLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Move_WIPLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not Delete WIPLst_Process_Detail",0,"SQL Proc Error")
		CASE nNewID = -11
*!*			-- 11 Could not Delete WIPLst_Detail
			TrackMess( "Proc_StockLst:p_Move_WIPLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not Delete WIPLst_Detail")
			TrackError( "Proc_StockLst:p_Move_WIPLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not Delete WIPLst_Detail"+CHR(13)+cSQL,"EXEC dbo.p_Move_WIPLst_StockLst","Proc_StockLst:Move_WIPLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Move_WIPLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not Delete WIPLst_Detail",0,"SQL Proc Error")
		CASE nNewID = -12
*!*			-- 12 Could not Delete WIPLst_Master
			TrackMess( "Proc_StockLst:p_Move_WIPLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not Delete WIPLst_Master")
			TrackError( "Proc_StockLst:p_Move_WIPLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not Delete WIPLst_Master"+CHR(13)+cSQL,"EXEC dbo.p_Move_WIPLst_StockLst","Proc_StockLst:Move_WIPLst_StockLst","Proc_StockLst:Move_WIPLst_StockLst",LINENO() )
			MESSAGEBOX( "Proc_StockLst:p_Move_WIPLst_StockLst("+STR(nID)+","+STR(nID_Detail) +") Could not Delete WIPLst_Master",0,"SQL Proc Error")
		ENDCASE
		
		*INSERT INTO dbo.StockLst_Process  
		*SELECT 'Moved from WIPLst' AS [comment] 
		*AND NOT ( [SOitem] LIKE 'STOCK%' OR [SOitem] LIKE 'ConvertSVC%' ) -Added 7/17/2013
		*Found non SOitems having processes against Moved Stock! so added the NOT STOCK cluase while adding StockLst_Process'
		
		IF nNewID < 1
			IF nSQLEXEC < 0
			*	IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpPSTK_MoveWIP_Stock')
					RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
			*	ENDIF
			ENDIF
		ENDIF
	ENDIF
	
	USE IN tmpPSTK_MoveWIP_Stock
ENDIF

IF nNewID > 0
	*Remove any Process in WIPLst
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nNewID
ENDPROC

********************************** 
	
PROCEDURE isCL_CC
PARAMETERS cCL, cCC, pConnHandle

*lisCL_CC = isCL_CC(CL,CC,ThisForm.nConnHandle)


IF VARTYPE(cCL) != "C"
	TrackError("Bad Parameter","Bad Parameter cCL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
IF VARTYPE(cCC) != "C"
	TrackError("Bad Parameter","Bad Parameter cCC","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF

IF EMPTY(cCC)
	*TrackError("Bad Parameter","Bad Parameter cCC","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
IF EMPTY(cCL)
	*CL is allowed to be Empty
ENDIF

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
	ENDIF
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF

nConn = CheckSQLConnection(nConn)

PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_SS')
	USE IN tmpPSTK_SS
ENDIF
SELECT 0

PRIVATE lReturn 
lReturn = .F.

PRIVATE cSQL, nSQLEXEC
cSQL = "SELECT ISNULL(CL,'') AS CL FROM dbo.ConditionLevel "
cSQL = cSQL + " WHERE CC='"+cCC+"'"
IF NOT EMPTY(cCL)
	cSQL = cSQL + " AND CL='"+cCL+"'"
ENDIF

IF nConn > 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_SS' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_SS' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_SS")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_SS")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_SS')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_SS')
		IF RECCOUNT('tmpPSTK_SS')>0
			IF cCL = PrepareSQLtxt(tmpPSTK_SS.CL,'CL',1)
				lReturn = .T.
			ENDIF
		ELSE
			IF EMPTY(cCL)
				*Empty is a match
				lReturn = .T.
			ENDIF
		ENDIF
		USE IN tmpPSTK_SS
	ENDIF
	IF nConn != pConnHandle
		SQLDISCONNECT( nConn )
	ENDIF

ELSE
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lReturn 

ENDPROC

********************************** 
	
PROCEDURE Default_CL_CC 
PARAMETERS cCC, pConnHandle

*cDefault_CL = Default_CL_CC(CC,ThisForm.nConnHandle)

IF VARTYPE(cCC) != "C"
	TrackError("Bad Parameter","Bad Parameter cCC","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
	ENDIF
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF

nConn = CheckSQLConnection(nConn)

PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_CCCL')
	USE IN tmpPSTK_CCCL
ENDIF
SELECT 0

PRIVATE cDefault_CL
cDefault_CL = ''

PRIVATE cSQL, nSQLEXEC
cSQL = "SELECT TOP 1 ISNULL(CL,'') AS CL FROM dbo.ConditionLevel "
cSQL = cSQL + " WHERE CC='"+cCC+"'"
cSQL = cSQL + " ORDER BY ISNULL(CL,'') "

IF nConn > 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_CCCL' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_CCCL' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CCCL")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CCCL")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_CCCL')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_CCCL')
		IF RECCOUNT('tmpPSTK_CCCL')>0
			cDefault_CL = PrepareSQLtxt(tmpPSTK_CCCL.CL,'CL',1)
		ENDIF
		USE IN tmpPSTK_CCCL
	ENDIF
	IF nConn != pConnHandle
		SQLDISCONNECT( nConn )
	ENDIF

ELSE
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cDefault_CL

ENDPROC

********************************** 
	
PROCEDURE ConditionLevelText
PARAMETERS cCC, cCL

*cText = ConditionLevelText(CC,CL)
*dbo.f_ConditionCodeLevelText('1','')

IF VARTYPE(cCC) != "C"
	TrackError("Bad Parameter","Bad Parameter cCC","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF

IF NOT "PROC_SETUP" $ SET("PROCEDURE")  &&Added for when Quotes is run without HPA menu.
	SET PROCEDURE TO Progs\Proc_Setup ADDITIVEF
ENDIF
IF NOT "PROC_SQL" $ SET("PROCEDURE")  &&Added for when Quotes is run without HPA menu.
	SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
ENDIF

PRIVATE nConn
nConn = get_SQLSTRINGCONNECT()

PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_CL')
	USE IN tmpPSTK_CL
ENDIF
SELECT 0

PRIVATE cText
cText = ''

PRIVATE cSQL, nSQLEXEC
cSQL = "SELECT dbo.f_ConditionCodeLevelText('"+cCC+"','"+cCL+"')"
cSQL = cSQL + " AS [cText] "

*!*	SELECT @cConditionCodeText=
*!*	( (CASE WHEN CC.useText = 1 THEN RTRIM(CC.[text])+' ' ELSE '' END) + RTRIM(ISNULL(CL.[Text],'')) ) 
*!*		FROM dbo.ConditionCode CC
*!*		LEFT OUTER JOIN dbo.ConditionLevel CL ON CC.CC = CL.CC
*!*		WHERE CC.CC = @cCC AND CL.CL = @cCL


*Add CC='2', CL='' to dbo.ConditionLevel on 05/21/2018 

IF nConn > 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_CL' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_CL' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CL")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CL")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_CL')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_CL')
		IF RECCOUNT('tmpPSTK_CL')>0
			cText = PrepareSQLtxt(tmpPSTK_CL.cText,'Text',28)
		ENDIF
		USE IN tmpPSTK_CL
	ENDIF

ELSE
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

IF nConn > 0
	SQLDISCONNECT( nConn )
ENDIF

RETURN cText

ENDPROC

********************************** 
	
PROCEDURE NewCC_CL
PARAMETERS cCC

*? NewCC_CL("B")

IF VARTYPE(cCC) != "C"
	TrackError("Bad Parameter","Bad Parameter cCC","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF
PRIVATE nConn
nConn = get_SQLSTRINGCONNECT()

PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_CL')
	USE IN tmpPSTK_CL
ENDIF
SELECT 0

PRIVATE cNewCCCL 
cNewCCCL = ''

PRIVATE cSQL, nSQLEXEC
cSQL = "SELECT newCCCL FROM dbo.ConditionCode"
cSQL = cSQL + " WHERE CC = '"+cCC+"'"

IF nConn > 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_CL' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_CL' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CL")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CL")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_CL')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_CL')
		IF RECCOUNT('tmpPSTK_CL')>0
			cNewCCCL = PrepareSQLtxt(tmpPSTK_CL.newCCCL ,'newCCCL',2)
		ENDIF
		USE IN tmpPSTK_CL
	ENDIF

ELSE
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

IF nConn > 0
	SQLDISCONNECT( nConn )
ENDIF

RETURN cNewCCCL 

ENDPROC

********************************** 
	
PROCEDURE CC_CLsort 
PARAMETERS cCC, cCL, pConnHandle

*? CC_CLsort('A','')

IF VARTYPE(cCC) != "C"
*	TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN '  '
ENDIF
IF VARTYPE(cCL) != "C"
*	TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN '  '
ENDIF
IF EMPTY(cCL)
	*must use a space
	cCL = " "
ENDIF

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
	ENDIF
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF

nConn = CheckSQLConnection(nConn)


PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_CL')
	USE IN tmpPSTK_CL
ENDIF
SELECT 0

PRIVATE cNewCC_CLsort
cNewCC_CLsort= ''

PRIVATE cSQL, nSQLEXEC
cSQL = "SELECT newCCCL  FROM dbo.ConditionCode"
cSQL = cSQL + " WHERE CC = '"+cCC+"'"

IF nConn > 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_CL' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_CL' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CL")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CL")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_CL')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_CL')
		IF RECCOUNT('tmpPSTK_CL')>0
			cNewCC_CLsort = PrepareSQLtxt(tmpPSTK_CL.newCCCL ,'newCCCL',2)
		ENDIF
		USE IN tmpPSTK_CL
	ENDIF

	IF nConn != pConnHandle
		SQLDISCONNECT( nConn )
	ENDIF
	
ELSE
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF
********

IF LEN(cNewCC_CLsort) = 1
	cNewCC_CLsort = cNewCC_CLsort + cCL
ELSE
	IF LEN(cNewCC_CLsort) = 2
		cNewCC_CLsort = cNewCC_CLsort
	ENDIF
ENDIF
********


RETURN cNewCC_CLsort

ENDPROC
********************************** 
	
PROCEDURE C2_Sort
PARAMETERS cCC, pConnHandle


IF VARTYPE(cCC) != "C"
*	TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ' '
ENDIF

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		nConn = get_SQLSTRINGCONNECT()
	ENDIF
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF

nConn = CheckSQLConnection(nConn)


PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_CL')
	USE IN tmpPSTK_CL
ENDIF
SELECT 0

PRIVATE cNewC2
cNewC2= '0'

PRIVATE cSQL, nSQLEXEC
cSQL = "SELECT C2 FROM dbo.ConditionCode"
cSQL = cSQL + " WHERE CC = '"+cCC+"'"

IF nConn > 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_CL' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_CL' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CL")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CL")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_CL')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_CL')
		IF RECCOUNT('tmpPSTK_CL')>0
			cNewC2 = PrepareSQLtxt(tmpPSTK_CL.C2 ,'C2',1)
		ENDIF
		USE IN tmpPSTK_CL
	ENDIF

	IF nConn != pConnHandle
		SQLDISCONNECT( nConn )
	ENDIF
	
ELSE
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF
********

RETURN cNewC2

ENDPROC

*********************************
PROCEDURE CCSortValue
PARAMETER pCC, pConnHandle
*CCSortValue( pCC, pConnHandle )
*Return an Interger

IF VARTYPE(pCC) != "C"
	TrackError("Need pCC for CCSortValue() ","No Parameter","Proc_StockLst:CCSortValue",LINENO())
	RETURN ''
ENDIF

PRIVATE nCCSortValue
nCCSortValue=0

PRIVATE nConn , lNewConn
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

PRIVATE cSQL, nSQLEXEC
PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_CCSortValue')
	USE IN tmpPSTK_CCSortValue
ENDIF
SELECT 0

IF nConn > 0
	cSQL = "SELECT dbo.f_GetCCSortValue("
	cSQL = cSQL + "'"+ pCC+ "'"
	cSQL = cSQL + ")"
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_CCSortValue' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_CCSortValue' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CCSortValue")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CCSortValue")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpPSTK_CCSortValue' )
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF lNewConn
		SQLDISCONNECT(nConn )
	ENDIF
	
	IF USED('tmpPSTK_CCSortValue')
		IF ISNULL(tmpPSTK_CCSortValue.EXP)
			nCCSortValue= 0
		ELSE
			nCCSortValue= PrepareSQLnum(tmpPSTK_CCSortValue.EXP,'ccSort',1,0)
		ENDIF
		
		USE IN tmpPSTK_CCSortValue
	ENDIF
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:CCSortValue",LINENO())
ENDIF

IF lNewConn 
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nCCSortValue
ENDPROC

*********************************
PROCEDURE CCSort
PARAMETER pCC, pConnHandle
*CCSort( pCC, pConnHandle )
*Returns Char(1), not number.

IF VARTYPE(pCC) != "C"
	TrackError("Bad Parameter","Bad Parameter pCC","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF

PRIVATE cCCSort
cCCSort = ''

PRIVATE nConn , lNewConn
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

PRIVATE cSQL, nSQLEXEC
PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_CCSortValue')
	USE IN tmpPSTK_CCSortValue
ENDIF
SELECT 0

IF nConn > 0
	*cSQL = "SELECT dbo.f_GetCCSortValue("
	cSQL = "SELECT dbo.f_GetCCSort("
	cSQL = cSQL + "'"+ pCC+ "'"
	cSQL = cSQL + ")"
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_CCSortValue' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_CCSortValue' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CCSortValue")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_CCSortValue")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpPSTK_CCSortValue' )
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF lNewConn
		SQLDISCONNECT(nConn )
	ENDIF
	
	IF USED('tmpPSTK_CCSortValue')
		IF ISNULL(tmpPSTK_CCSortValue.EXP)
			cCCSort = '1'
		ELSE
			cCCSort = PrepareSQLtxt(tmpPSTK_CCSortValue.EXP,'CCSort',2)
			*Keep as CHAR(2) SO CL can be added in if needed.
		ENDIF
		
		USE IN tmpPSTK_CCSortValue
	ENDIF
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:CCSort",LINENO())
ENDIF

IF lNewConn 
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cCCSort
ENDPROC

********************************* 

PROC isTBL_PO_NotStock 
PARAMETER lServicesPO,lEquipment,lIntP,lConvServ
*lOK = isTBL_PO_NotStock(lServicesPO,lEquipment,lIntP,lConvServ)
* N is Not Stock like Lab Service

IF VARTYPE(lServicesPO) != "L"
	TrackError("Bad Parameter","Bad Parameter lServicesPO","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .T.
ENDIF
IF VARTYPE(lEquipment) != "L"
	TrackError("Bad Parameter","Bad Parameter lEquipment","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .T.
ENDIF
IF VARTYPE(lIntP) != "L"
	TrackError("Bad Parameter","Bad Parameter lIntP","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .T.
ENDIF
IF VARTYPE(lConvServ) != "L"
	TrackError("Bad Parameter","Bad Parameter lConvServ","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .T.
ENDIF


PRIVATE lOK
*lServicesPO,lEquipment,lIntP,lConvServ

IF lServicesPO
	lOK = .T.
	RETURN lOK
ENDIF

IF lEquipment
	lOK = .T.
	RETURN lOK
ENDIF

IF lIntP		&&depricated
	lOK = .T.
	RETURN lOK
ENDIF

IF lConvServ
	lOK = .F.
	RETURN lOK
ENDIF


*Cannot tell, default to .F.
RETURN .F.
ENDPROC

********************************* 

PROC isTBL_PO_Valid 
PARAMETER lServicesPO,lEquipment,lIntP,lConvServ,cTBL,cStock,nShipwhere, pConnHandle
*lOK = TBL_PO_Valid(lServicesPO,lEquipment,lIntP,lConvServ,cTBL,cStock,nShipwhere, pConnHandle)
*checks logics before sending to PurchaseOrder_Allow_TBL()
*Rules for Stock, Broker and WIP on PurchaseOrder
* N is Not Stock like Lab Service
*Also see getTBL_POitem() and dbo.f_GetPOItem_TBL()

IF VARTYPE(lServicesPO) != "L"
	TrackError("Bad Parameter","Bad Parameter lServicesPO","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
IF VARTYPE(lEquipment) != "L"
	TrackError("Bad Parameter","Bad Parameter lEquipment","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
IF VARTYPE(lIntP) != "L"
	TrackError("Bad Parameter","Bad Parameter lIntP","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
IF VARTYPE(lConvServ) != "L"
	TrackError("Bad Parameter","Bad Parameter lConvServ","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF


IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF

IF NOT (cTBL="S" OR cTBL="B" OR cTBL="W" OR cTBL="N")
	TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF

IF VARTYPE(cStock) != "C"
	TrackError("Bad Parameter","Bad Parameter cStock","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF

IF VARTYPE(nShipwhere) != "N"
	TrackError("Bad Parameter","Bad Parameter nShipwhere","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF

PRIVATE lOK
*lServicesPO,lEquipment,lIntP,lConvServ

IF lServicesPO
	IF cTBL = "N"
		lOK = .T.
		RETURN lOK
	ENDIF
ENDIF

IF lEquipment
	IF cTBL = "N"
		lOK = .T.
		RETURN lOK
	ENDIF
ENDIF

IF lIntP		&&depricated
	IF cTBL = "N"
		lOK = .T.
		RETURN lOK
	ENDIF
ENDIF

IF lConvServ
	*ConvServ would be of Stock, Service has no stock
	IF cTBL = "N"
		lOK = .F.
		RETURN lOK
	ENDIF
ENDIF

pConnHandle = CheckSQLConnection(pConnHandle)

lOK = PurchaseOrder_Allow_TBL(cTBL,cStock,nShipwhere, pConnHandle)

RETURN lOK
ENDPROC


********************************* 
PROC PurchaseOrder_Allow_TBL
PARAMETER cTBL,cStock,nShipwhere, pConnHandle
*lOK = PurchaseOrder_Allow_TBL(cTBL,cStock,nShipwhere, pConnHandle)
*Rules for Stock, Broker and WIP on PurchaseOrder
* N is Not Stock like Lab Service
IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN .F.
ENDIF

IF NOT (cTBL="S" OR cTBL="B" OR cTBL="W" OR cTBL="N")
	*routinly sends blank TBL
	*TrackError("Bad Parameter","Bad Parameter TBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF

IF VARTYPE(cStock) != "C"
	*TrackError("Bad Parameter","Bad Parameter cStock","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF

IF VARTYPE(nShipwhere) != "N"
	*TrackError("Bad Parameter","Bad Parameter nShipwhere","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF

PRIVATE lOK
lOK = .T.

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	nConn = pConnHandle
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF
nConn = CheckSQLConnection(nConn)


PRIVATE cSQL, nSQLEXEC, lOK, cMess
lOK = .F.
cMess = ""
PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_StockLst_Def')
	USE IN tmpPSTK_StockLst_Def
ENDIF

SELECT 0

cSQL="SELECT COUNT(*) AS CNTD FROM dbo.PO_StockLst_Def "
cSQL = cSQL + " WHERE TBL='"+cTBL+"'"
cSQL = cSQL + " AND Stock = '"+cStock+"'"
cSQL = cSQL + " AND ShipWhere = "+STR(nShipWhere)

nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_StockLst_Def')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_StockLst_Def' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_StockLst_Def")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_StockLst_Def")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_StockLst_Def')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		lOK = .F.
	ENDIF
ENDIF
IF USED('tmpPSTK_StockLst_Def')
	IF RECCOUNT('tmpPSTK_StockLst_Def') > 0
		IF tmpPSTK_StockLst_Def.CNTD > 0
			lOK = .T.
		ENDIF
	ENDIF
	USE IN tmpPSTK_StockLst_Def
ENDIF

IF nConn != pConnHandle
	 = SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lOK
ENDPROC

*********************************************

PROC ReceivingTBL_POitem
PARAMETER pPOitem, pConnHandle
*cTBL = ReceivingTBL_POitem(cPOitem, pConnHandle)
*TBL used in Recieving by POitem

IF VARTYPE(pPOitem) != "C"
	TrackError("Bad Parameter","Bad Parameter pPOitem","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF
IF Proper_PO_item(pPOitem) = Proper_PO_item('')
	TrackError("Bad Parameter","Bad Parameter POitem","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN ''
ENDIF

PRIVATE lOK
lOK = .T.

PRIVATE nConn
IF VARTYPE(pConnHandle) = "N"
	nConn = pConnHandle
ELSE
	nConn = get_SQLSTRINGCONNECT()
	pConnHandle = 0
ENDIF
nConn = CheckSQLConnection(nConn)


PRIVATE cSQL, nSQLEXEC, lOK, cMess
lOK = .F.
cMess = ""
PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cTBL
cTBL = ""

IF USED("tmpPSTK_ReceivePO")
	USE IN tmpPSTK_ReceivePO
ENDIF
SELECT 0

cSQL_cPO=" SELECT StockTable AS TBL "
cSQL_cPO=cSQL_cPO+" FROM dbo.Receiving "
cSQL_cPO=cSQL_cPO+" WHERE POItem = dbo.f_ProperPOitem('"+pPOitem+"') "
cSQL_cPO=cSQL_cPO+" AND [Cancelled]=0"
cSQL_cPO=cSQL_cPO+" AND LEN(StockTable) > 0"

nSQLEXEC = SQLEXEC( nConn, cSQL_cPO, 'tmpPSTK_ReceivePO')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL_cPO, 'tmpPSTK_ReceivePO' )
ENDDO
IF nSQLEXEC < 1
	IF NOT SQLEXECError(cSQL_cPO, nConn, nSQLEXEC, 'tmpPSTK_ReceivePO')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL_cPO )
	ELSE
		nSQLEXEC = 1
	ENDIF
ENDIF
IF nSQLEXEC > 0
	IF USED("tmpPSTK_ReceivePO")
		IF RECCOUNT('tmpPSTK_ReceivePO') > 0
			*SCAN
				cTBL = PrepareSQLtxt(tmpPSTK_ReceivePO.TBL,'TBL',1)
			*ENDSCAN
		ENDIF
		USE IN tmpPSTK_ReceivePO
	ENDIF
ENDIF

IF nConn != pConnHandle
	 = SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cTBL
ENDPROC

*********************************************
PROCEDURE Count_ProcessbyID_Detail_Process
PARAMETERS nID_Detail_Process, cTBL, pConnHandle, cAndSome
*Count_ProcessbyID_Detail_Process( nID_Detail_Process, cTBL, ThisForm.ConnHandle, 'NOSUB' )
*Returns Count

IF VARTYPE(nID_Detail_Process) != "N"
	TrackError("Bad Parameter","Bad Parameter nID_Detail_Process","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
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
nConn = CheckSQLConnection(nConn)

IF VARTYPE(cAndSome) != "C"
	cAndSome = ''
ENDIF

PRIVATE cAlias
cAlias = ALIAS()

IF USED("tmpPSTK_cntSO")
	USE IN tmpPSTK_cntSO
ENDIF

PRIVATE cSQL, nSQLEXEC
cSQL = "SELECT COUNT(*) AS Cntd "
DO CASE
CASE UPPER(cTBL) = "S"
	cSQL = cSQL + " FROM dbo.StockLst_Process "
CASE UPPER(cTBL) = "B"
	cSQL = cSQL + " FROM dbo.BrokerLst_Process "
CASE UPPER(cTBL) = "W"
	cSQL = cSQL + " FROM dbo.WIPLst_Process "
OTHERWISE
	RETURN 0
ENDCASE
	
cSQL = cSQL + " WHERE ID_Detail_Process = "+STR(nID_Detail_Process)
IF UPPER(cAndSome) = "NOSUB"
	cSQL = cSQL + " AND ( Process_ID = 'SELECTED' OR Process_ID='PARTSELECT' )"
	cSQL = cSQL + " AND AllowSub = 'N'"
ENDIF
IF UPPER(cAndSome) = "ALLOWSUB"
	cSQL = cSQL + " AND AllowSub = 'Y'"
ENDIF
IF UPPER(cAndSome) = "SELECTED"
	cSQL = cSQL + " AND Process_ID = 'SELECTED'"
ENDIF

SELECT 0
nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_cntSO')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_cntSO')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_cntSO")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_cntSO")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_cntSO')
		RecordError(nSQLEXEC,"SQL Error","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

PRIVATE nReturn
nReturn = 0
IF USED("tmpPSTK_cntSO")
	IF VARTYPE(tmpPSTK_cntSO.Cntd) = "N"
		nReturn = tmpPSTK_cntSO.Cntd
	ELSE
		nReturn = 0
	ENDIF
	USE IN tmpPSTK_cntSO
ENDIF


IF lNewConn
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nReturn
ENDPROC

******************************************
PROCEDURE Count_POItem_DueIn
PARAMETERS pPOitem, nConn
*Count_POItem_DueIn( cPOitem, ThisForm.nConnHandle )

IF VARTYPE(pPOitem) != "C"
	TrackError("Bad Parameter","Bad Parameter pPOitem","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF
PRIVATE cPOitem
cPOitem = Proper_PO_item(pPOitem)

IF VARTYPE(nConn) != "N"
	TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 0
ENDIF

PRIVATE nCount
nCount = 0

PRIVATE cAlias 
cAlias = ALIAS()
PRIVATE cSQL, nSQLEXEC 
**
IF USED("tmpPSTK_cntPO")
	USE IN tmpPSTK_cntPO
ENDIF
cSQL = "SELECT 'S' AS TBL FROM dbo.StockLst_Master WITH(NOLOCK) "
cSQL = cSQL + " WHERE PO_Item = dbo.f_ProperPOitem('"+cPOitem+"')"
cSQL = cSQL + " AND Heat = 'DUE IN'"
cSQL = cSQL + " UNION "
cSQL = cSQL + " SELECT 'B' AS TBL FROM dbo.BrokerLst_Master WITH(NOLOCK) "
cSQL = cSQL + " WHERE PO_Item = dbo.f_ProperPOitem('"+cPOitem+"')"
cSQL = cSQL + " AND Heat = 'DUE IN'"
cSQL = cSQL + " UNION "
cSQL = cSQL + " SELECT 'W' AS TBL FROM dbo.WIPLst_Master WITH(NOLOCK) "
cSQL = cSQL + " WHERE PO_Item = dbo.f_ProperPOitem('"+cPOitem+"')"
cSQL = cSQL + "-- AND Heat = 'DUE IN'"

SELECT 0
nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_cntPO')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_cntPO')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_cntPO")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_cntPO")

		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_cntPO')
		RecordError(nSQLEXEC,"SQL Error","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

IF USED("tmpPSTK_cntPO")
	IF RECCOUNT("tmpPSTK_cntPO") > 0
		*cTBL = tmpPSTK_cntPO.TBL
		nCount = RECCOUNT("tmpPSTK_cntPO")
	ENDIF
	USE IN tmpPSTK_cntPO
ENDIF

**
IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.", "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nCount
ENDPROC


*********************************************
PROCEDURE AcctCosting_Start
PARAMETERS pConnHandle
*AcctCosting_Start(nConnHandle)
*Returns nAC_ID: The next ID to use only!

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


PRIVATE lOK
lOK = .T.

PRIVATE cSQL, nSQLEXEC
PRIVATE nAC_ID
nAC_ID = 0

IF USED("tmpPSTK_AcctCosting_INS")
	USE IN tmpPSTK_AcctCosting_INS
ENDIF

cSQL = "EXEC dbo.p_AcctCosting_ins "

SELECT 0
nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_AcctCosting_INS')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_AcctCosting_INS' )
ENDDO
IF nSQLEXEC < 1
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_AcctCosting_INS')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL)
	ELSE
		nSQLEXEC = 1
	ENDIF
ENDIF
lOk = .F.
IF nSQLEXEC > 0
	IF USED("tmpPSTK_AcctCosting_INS")
		IF RECCOUNT('tmpPSTK_AcctCosting_INS') > 0
			nAC_ID = PrepareSQLnum(tmpPSTK_AcctCosting_INS.Exp,'ID',-3)
			lOK = .T.
		ENDIF
		USE IN tmpPSTK_AcctCosting_INS
		
	ENDIF
ENDIF


IF NOT lOk 
	RETURN 0
ENDIF

*************

IF lNewConn
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nAC_ID
ENDPROC

*********************************************

PROCEDURE AcctCosting_Alert
PARAMETERS pAC_ID, pMachineLog, pLogID, pConnHandle
*AcctCosting_Alert(nAcctCosting_ID,"GFM_Log",nID,ThisForm.nConnHandle)

PRIVATE nAC_ID, cMachineLog, nLogID
IF VARTYPE(pAC_ID) != "N"
	TrackError("Bad Parameter","Bad Parameter pAC_ID","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 
ELSE
	nAC_ID = pAC_ID
ENDIF

IF VARTYPE(pMachineLog) != "C"
	TrackError("Bad Parameter","Bad Parameter pMachineLog","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 
ELSE
	cMachineLog = pMachineLog
ENDIF

IF VARTYPE(pLogID) != "N"
	TrackError("Bad Parameter","Bad Parameter pLogID","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN 
ELSE
	nLogID = pLogID
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


PRIVATE lOK
lOK = .T.

*******

IF nAC_ID > 0
	DO CASE
	CASE cMachineLog = "Draw_log"
	CASE cMachineLog = "HPA Cert"
	CASE cMachineLog = "GFM_Log"	
	CASE cMachineLog = "Wire_Log"	
	CASE cMachineLog = "Swage_Log"	
	ENDCASE
	
*!*		PRIVATE cSQL, nSQLEXEC
*!*		IF USED("cntAcctCost")
*!*			USE IN cntAcctCost
*!*		ENDIF

*!*		cSQL = "SELECT COUNT(*) AS CNTD FROM dbo.AcctCost_POitem WHERE AC_ID = "+STR(nAC_ID)+""
*!*		cSQL = cSQL + " AND POitem = '"+cPOitem+"'"
*!*		
*!*		SELECT 0
*!*		nSQLEXEC = SQLEXEC( nConn, cSQL, 'v')
*!*		DO WHILE nSQLEXEC = 0
*!*			WAIT WINDOW 'SQL' TIMEOUT 1
*!*			nSQLEXEC = SQLEXEC( nConn, cSQL, 'cntAcctCost' )
*!*		ENDDO
*!*		IF nSQLEXEC < 1
*!*			IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'cntAcctCost')
*!*				RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL)
*!*			ELSE
*!*				nSQLEXEC = 1
*!*			ENDIF
*!*		ENDIF

*!*		IF nSQLEXEC > 0
*!*			IF USED("cntAcctCost")
*!*				IF RECCOUNT('cntAcctCost') > 0
*!*					IF PrepareSQLnum(cntAcctCost.CNTD,'CNTD',-3) > 0
*!*						lFound = .T.
*!*					ENDIF
*!*				ENDIF
*!*				USE IN cntAcctCost
*!*			ENDIF
*!*		ENDIF
*!*		
*!*	ENDIF

ENDIF

IF lNewConn
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN 

ENDPROC
*********************************************

PROCEDURE AcctCosting_POitem_Update
PARAMETERS nAC_ID, cPOitem, pConnHandle
**AcctCosting_POitem_Update(nAC_ID,cPOitem,pConnHandle)
*used after a POitem was Edited

*Returns True
IF VARTYPE(cPOitem) != 'C'
	TrackError("Bad Parameter","Bad Parameter cPOitem","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	cPOitem = ''
ENDIF
IF VARTYPE(nAC_ID) != 'N'
	TrackError("Bad Parameter","Bad Parameter pAC_ID","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	nAC_ID= 0
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


PRIVATE lOK
lOK = .T.

PRIVATE cSQL, nSQLEXEC

*******
*Cleanse 
cPOitem	= PrepareSQLtxt(cPOitem,'POitem',12)
PRIVATE lFound
lFound = .F.

IF nAC_ID > 0
	*compare with old data
	
	IF USED("cntAcctCost")
		USE IN cntAcctCost
	ENDIF

	cSQL = "SELECT COUNT(*) AS CNTD FROM dbo.AcctCost_POitem WHERE AC_ID = "+STR(nAC_ID)+""
	cSQL = cSQL + " AND POitem = '"+cPOitem+"'"
	
	SELECT 0
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'cntAcctCost')
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'cntAcctCost' )
	ENDDO
	IF nSQLEXEC < 1
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'cntAcctCost')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL)
		ELSE
			nSQLEXEC = 1
		ENDIF
	ENDIF

	IF nSQLEXEC > 0
		IF USED("cntAcctCost")
			IF RECCOUNT('cntAcctCost') > 0
				IF PrepareSQLnum(cntAcctCost.CNTD,'CNTD',-3) > 0
					lFound = .T.
				ENDIF
			ENDIF
			USE IN cntAcctCost
		ENDIF
	ENDIF
	
	
	IF lFound
		RETURN .T.
	ENDIF
	
	*************
	*Check to see if Update is allowed 
	*lOld_Complete	
	*lOld_Cancelled
	*************

	*UPDATE POitem
	
	cSQL = "INSERT INTO dbo.AcctCost_POitem (POitem,AC_ID) VALUES ("
	cSQL = cSQL + "'"+cPOitem+"',"+STR(nAC_ID)+")"

		
	nSQLEXEC = SQLEXEC( nConn, cSQL, '')
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, '' )
	ENDDO
	IF nSQLEXEC < 1
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, '')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL)
		ELSE
			nSQLEXEC = 1
		ENDIF
	ENDIF
ENDIF

IF lNewConn 
	SQLDISCONNECT(nConn )
ENDIF

RETURN lOK
ENDPROC

*********************************************

PROCEDURE AcctCosting_SOitem_Update
PARAMETERS nAC_ID, cSOitem, pConnHandle
**AcctCosting_SOitem_Update(nAC_ID,cSOitem,pConnHandle)
*used after a SOitem was Edited

*Returns True
IF VARTYPE(cSOitem) != 'C'
	cSOitem = ''
ENDIF
IF VARTYPE(nAC_ID) != 'N'
	nAC_ID= 0
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


PRIVATE lOK
lOK = .T.

PRIVATE cSQL, nSQLEXEC

*******
*Cleanse 
cSOitem	= PrepareSQLtxt(cSOitem,'SOitem',10)
PRIVATE lFound
lFound = .F.

IF nAC_ID > 0
	
	IF USED("tmpPSTK_cntAcctCost")
		USE IN tmpPSTK_cntAcctCost
	ENDIF

	cSQL = "SELECT COUNT(*) AS CNTD FROM dbo.AcctCost_SOitem WHERE AC_ID = "+STR(nAC_ID)+""
	cSQL = cSQL + " AND SOitem = '"+cSOitem+"'"
	
	SELECT 0
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_cntAcctCost')
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_cntAcctCost' )
	ENDDO
	IF nSQLEXEC < 1
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_cntAcctCost')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL)
		ELSE
			nSQLEXEC = 1
		ENDIF
	ENDIF

	IF nSQLEXEC > 0
		IF USED("tmpPSTK_cntAcctCost")
			IF RECCOUNT('tmpPSTK_cntAcctCost') > 0
				IF PrepareSQLnum(tmpPSTK_cntAcctCost.CNTD,'CNTD',-3) > 0
					lFound = .T.
				ENDIF
			ENDIF
			USE IN tmpPSTK_cntAcctCost
		ENDIF
	ENDIF
	
	
	IF lFound
		RETURN .T.
	ENDIF
	
	*************
	*Check to see if Update is allowed 
	*lOld_Complete	
	*lOld_Cancelled
	*************

	*UPDATE SOitem
	
	cSQL = "INSERT INTO dbo.AcctCost_SOitem (SOitem,AC_ID) VALUES ("
	cSQL = cSQL + "'"+cSOitem+"',"+STR(nAC_ID)+")"
	
	nSQLEXEC = SQLEXEC( nConn, cSQL, '')
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, '' )
	ENDDO
	IF nSQLEXEC < 1
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, '')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL)
		ELSE
			nSQLEXEC = 1
		ENDIF
	ENDIF
ENDIF

IF lNewConn 
	SQLDISCONNECT(nConn )
ENDIF

RETURN lOK
ENDPROC

*********************************************

PROCEDURE AcctCosting_WO_Update
PARAMETERS nAC_ID, nWO, pConnHandle
**AcctCosting_WO_Update(nAC_ID,nWO,pConnHandle)
*used after a WO was Edited

*Returns True
IF VARTYPE(nWO) != "N"
	nWO = 0
ENDIF

IF VARTYPE(nAC_ID) != 'N'
	nAC_ID= 0
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

PRIVATE lOK
lOK = .T.

PRIVATE cSQL, nSQLEXEC

*******
*Cleanse 
nWO	= PrepareSQLnum(nWO,'WO',-3)

PRIVATE lFound
lFound = .F.

IF nAC_ID > 0
	
	IF USED("tmpPSTK_cntAcctCost_WO")
		USE IN tmpPSTK_cntAcctCost_WO
	ENDIF

	cSQL = "SELECT COUNT(*) AS CNTD FROM dbo.AcctCost_WO WHERE AC_ID = "+STR(nAC_ID)+""
	cSQL = cSQL + " AND WO = "+STR(nWO)
	
	SELECT 0
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_cntAcctCost_WO')
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_cntAcctCost_WO' )
	ENDDO
	IF nSQLEXEC < 1
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_AcctCost_WO')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL)
		ELSE
			nSQLEXEC = 1
		ENDIF
	ENDIF

	IF nSQLEXEC > 0
		IF USED("tmpPSTK_cntAcctCost_WO")
			IF RECCOUNT('tmpPSTK_cntAcctCost_WO') > 0
				IF PrepareSQLnum(tmpPSTK_cntAcctCost_WO.CNTD,'CNTD',-3) > 0
					lFound = .T.
				ENDIF
			ENDIF
			USE IN tmpPSTK_cntAcctCost_WO
		ENDIF
	ENDIF
	
	
	IF lFound
		RETURN .T.
	ENDIF
	
	*************
	*Check to see if Update is allowed 
	*lOld_Complete	
	*lOld_Cancelled
	*************

	*UPDATE nWO_Detail
	
	cSQL = "INSERT INTO dbo.AcctCost_WO (WO,AC_ID) VALUES ("
	cSQL = cSQL + STR(nWO)+","+STR(nAC_ID)+")"
	
	nSQLEXEC = SQLEXEC( nConn, cSQL, '')
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, '' )
	ENDDO
	IF nSQLEXEC < 1
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, '')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL)
		ELSE
			nSQLEXEC = 1
		ENDIF
	ENDIF
ENDIF

IF lNewConn 
	SQLDISCONNECT(nConn )
ENDIF

RETURN lOK
ENDPROC


*********************************************

PROCEDURE AcctCosting_WOD_Update
PARAMETERS nAC_ID, nWO_Detail, pConnHandle
**AcctCosting_WOD_Update(nAC_ID,nWO_Detail,pConnHandle)
*used after a Log was Edited

*Returns True
IF VARTYPE(nWO_Detail) != "N"
	nWO_Detail = 0
ENDIF

IF VARTYPE(nAC_ID) != 'N'
	nAC_ID= 0
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

PRIVATE lOK
lOK = .T.

PRIVATE cSQL, nSQLEXEC

*******
*Cleanse 
nWO_Detail	= PrepareSQLnum(nWO_Detail,'WO_Detail',-3)

PRIVATE lFound
lFound = .F.

IF nAC_ID > 0
	
	IF USED("tmpPSTK_cntAcctCost_WOD")
		USE IN tmpPSTK_cntAcctCost_WOD
	ENDIF

	cSQL = "SELECT COUNT(*) AS CNTD FROM dbo.AcctCost_WOD WHERE AC_ID = "+STR(nAC_ID)+""
	cSQL = cSQL + " AND WO_Detail = "+STR(nWO_Detail)
	
	SELECT 0
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_cntAcctCost_WOD')
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_cntAcctCost_WOD' )
	ENDDO
	IF nSQLEXEC < 1
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_cntAcctCost_WOD')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL)
		ELSE
			nSQLEXEC = 1
		ENDIF
	ENDIF

	IF nSQLEXEC > 0
		IF USED("tmpPSTK_cntAcctCost_WOD")
			IF RECCOUNT('tmpPSTK_cntAcctCost_WOD') > 0
				IF PrepareSQLnum(tmpPSTK_cntAcctCost_WOD.CNTD,'CNTD',-3) > 0
					lFound = .T.
				ENDIF
			ENDIF
			USE IN tmpPSTK_cntAcctCost_WOD
		ENDIF
	ENDIF
	
	
	IF lFound
		RETURN .T.
	ENDIF
	
	*************
	*Check to see if Update is allowed 
	*lOld_Complete	
	*lOld_Cancelled
	*************

	*UPDATE nWO_Detail
	
	cSQL = "INSERT INTO dbo.AcctCost_WOD (WO_Detail,AC_ID) VALUES ("
	cSQL = cSQL + STR(nWO_Detail)+","+STR(nAC_ID)+")"
	
	nSQLEXEC = SQLEXEC( nConn, cSQL, '')
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, '' )
	ENDDO
	IF nSQLEXEC < 1
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, '')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL)
		ELSE
			nSQLEXEC = 1
		ENDIF
	ENDIF
ENDIF

IF lNewConn 
	SQLDISCONNECT(nConn )
ENDIF

RETURN lOK
ENDPROC

*********************************************
PROCEDURE AcctCost_MachineLot_Update
PARAMETERS nAC_ID, cMachine, nLot, pConnHandle
**AcctCost_MachineLot_Update(nAC_ID,"GFM",nLot,nConnHandle)
*Sets AC_ID in GFMlog, Starts an AcctCosting Record to be Filled by Accountants

*Returns nAC_ID

IF VARTYPE(cMachine) != "C"
	TrackError("Bad Parameter","Bad Parameter cMachine","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
IF VARTYPE(nLot) != "N"
	TrackError("Bad Parameter","Bad Parameter nLot","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
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

PRIVATE cAlias
cAlias = ALIAS()


PRIVATE lOK
lOK = .T.

PRIVATE cSQL, nSQLEXEC
PRIVATE nAC_ID
nAC_ID = 0
*******
*Check for exisiting AC_ID

IF USED("tmpPSTK_AC_ID")
	USE IN tmpPSTK_AC_ID
ENDIF

cSQL = "SELECT AC_ID FROM dbo.AcctCost_Mach WHERE Machine = '"+cMachine+"' AND Lot = "+STR(nLot)

SELECT 0
nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_AC_ID')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_AC_ID')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_AC_ID")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_AC_ID")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_AC_ID')
		RecordError(nSQLEXEC,"SQL Error","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

IF USED("tmpPSTK_AC_ID")
	IF VARTYPE(tmpPSTK_AC_ID.AC_ID) = "N"
		nAC_ID = PrepareSQLnum(tmpPSTK_AC_ID.AC_ID,'AC_ID',-3)
	ELSE
		nAC_ID = 0
	ENDIF
	USE IN tmpPSTK_AC_ID
ENDIF

IF nAC_ID > 0
	IF lNewConn 
		SQLDISCONNECT(nConn )
	ENDIF
	RETURN nAC_ID
ENDIF


*******
*Check for exisiting AC_ID thru Machine Log entries

DO CASE
CASE UPPER(cMachine) = 'GFM'
	cSQL = "SELECT AC_IDs AS AC_ID FROM dbo.TVF_AC_ID_GFM_Lot("+STR(nLot)+")"
CASE UPPER(cMachine) = 'HT'
	cSQL = "SELECT AC_IDs AS AC_ID FROM dbo.TVF_AC_ID_HT_Lot("+STR(nLot)+")"
CASE UPPER(cMachine) = 'LAKEERIE'
	cSQL = "SELECT AC_IDs AS AC_ID FROM dbo.TVF_AC_ID_LakeErie_Lot("+STR(nLot)+")"
CASE UPPER(cMachine) = 'ROLL'
	cSQL = "SELECT AC_IDs AS AC_ID FROM dbo.TVF_AC_ID_ROLL_Lot("+STR(nLot)+")"
OTHERWISE
	MESSAGEBOX("Machine Type not Programmed",0,"Problem")
	TrackError("Problem Memo","Machine Type not Programmed", PROGRAM(), LINENO(1))
ENDCASE

IF USED("tmpPSTK_AC_ID")
	USE IN tmpPSTK_AC_ID
ENDIF

SELECT 0
nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_AC_ID')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_AC_ID')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_AC_ID")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_AC_ID")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_AC_ID')
		RecordError(nSQLEXEC,"SQL Error","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

IF USED("tmpPSTK_AC_ID")
	IF VARTYPE(tmpPSTK_AC_ID.AC_ID) = "N"
		nAC_ID = PrepareSQLnum(tmpPSTK_AC_ID.AC_ID,'AC_ID',-3)
	ELSE
		nAC_ID = 0
	ENDIF
	USE IN tmpPSTK_AC_ID
ENDIF

IF nAC_ID > 0
	IF lNewConn 
		SQLDISCONNECT(nConn )
	ENDIF
	RETURN nAC_ID
ENDIF


*******
IF USED("tmpPSTK_AcctCosting_INS")
	USE IN tmpPSTK_AcctCosting_INS
ENDIF

PRIVATE nID
nID = 0
*PRIVATE nWO
*nWO = GetWO_WO_Detail( nWO_Detail, nConn )
*IF nWO = 0
*	nWO = GetWO_SOitem( cSOitem, nConn )
*ENDIF

cSQL = "EXEC dbo.p_AcctCosting_ins "

SELECT 0
nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_AcctCosting_INS')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_AcctCosting_INS' )
ENDDO
IF nSQLEXEC < 1
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_AcctCosting_INS')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL)
	ELSE
		nSQLEXEC = 1
	ENDIF
ENDIF
lOk = .F.
IF nSQLEXEC > 0
	IF USED("tmpPSTK_AcctCosting_INS")
		IF RECCOUNT('tmpPSTK_AcctCosting_INS') > 0
			nID = PrepareSQLnum(tmpPSTK_AcctCosting_INS.Exp,'ID',-3)
			lOK = .T.
		ENDIF
		USE IN tmpPSTK_AcctCosting_INS
		
	ENDIF
ENDIF

IF NOT lOk OR nID < 1
	IF lNewConn 
		SQLDISCONNECT(nConn )
	ENDIF
	RETURN 0
ENDIF

****************************

IF lOK	
	cSQL = "INSERT INTO dbo.AcctCost_Mach (AC_ID, Machine, Lot) VALUES "
	cSQL = cSQL + "("
	cSQL = cSQL + ALLTRIM(STR(nID))
	cSQL = cSQL + ",'"+cMachine+"'"
	cSQL = cSQL + ","+STR(nLot)+")"
	
	nSQLEXEC = SQLEXEC( nConn, cSQL, '')
	
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, '')
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
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, '')
			RecordError(nSQLEXEC,"SQL Error","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
			lOk = .F.
		ENDIF
	ENDIF
ENDIF

IF NOT lOk 
	IF lNewConn 
		SQLDISCONNECT(nConn )
	ENDIF
	RETURN 0
ENDIF


*************

IF lNewConn
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lOK
ENDPROC


*********************************************

PROCEDURE AcctCosting_get_dtCreate_ID
PARAMETERS nAC_ID, pConnHandle
**dtCreate = AcctCosting_get_dtCreate_ID(nAcctCosting_ID,pConnHandle)

IF VARTYPE(nAC_ID) != "N"
	RETURN CTOT('')
ENDIF
IF nAC_ID < 1
	RETURN CTOT('')
ENDIF

PRIVATE dtCreate
dtCreate = CTOT('')


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

IF USED('tmpPSTK_AC_Created')
	USE IN tmpPSTK_AC_Created
ENDIF


IF nConn > 0 

	cSQL = "SELECT dtCreated "
	cSQL = cSQL+" FROM dbo.AcctCosting "
	cSQL = cSQL+" WHERE AC_ID = "+STR(nAC_ID)
	
	SELECT 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_AC_Created' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn,  cSQL, 'tmpPSTK_AC_Created' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_AC_Created")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_AC_Created")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_AC_Created')
			RecordError(nSQLEXEC,"SQL Error","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )	
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_AC_Created')
		IF RECCOUNT('tmpPSTK_AC_Created') > 0
			dtCreate = PrepareSQLdatetime(tmpPSTK_AC_Created.dtCreated,'dtCreated')
		ENDIF
		USE IN tmpPSTK_AC_Created
	ENDIF
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM(),LINENO())
ENDIF

IF lNewConn 
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM(), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN dtCreate

*********************************************

PROCEDURE AcctCosting_Check_WO
PARAMETERS nAC_ID, nWO, pConnHandle
**AcctCosting_Check_WO(nWO,nConnHandle)
*Return AC_ID of anything related with WO has already has a AC_ID

IF VARTYPE(nWO) != "N"
	nWO = 0
ENDIF

IF VARTYPE(nAC_ID) != 'N'
	nAC_ID= 0
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

PRIVATE lOK
lOK = .T.

PRIVATE cSQL, nSQLEXEC

*******
*Cleanse 
nWO	= PrepareSQLnum(nWO,'WO',-3)

PRIVATE lFound
lFound = .F.

IF nAC_ID > 0
	
	IF USED("tmpPSTK_cntAcctCost_WO")
		USE IN tmpPSTK_cntAcctCost_WO
	ENDIF

	cSQL = "SELECT COUNT(*) AS CNTD FROM dbo.AcctCost_WO WHERE AC_ID = "+STR(nAC_ID)+""
	cSQL = cSQL + " AND WO = "+STR(nWO)
	
	SELECT 0
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_cntAcctCost_WO')
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_cntAcctCost_WO' )
	ENDDO
	IF nSQLEXEC < 1
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_cntAcctCost_WO')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL)
		ELSE
			nSQLEXEC = 1
		ENDIF
	ENDIF

	IF nSQLEXEC > 0
		IF USED("tmpPSTK_cntAcctCost_WO")
			IF RECCOUNT('tmpPSTK_cntAcctCost_WO') > 0
				IF PrepareSQLnum(tmpPSTK_cntAcctCost_WO.CNTD,'CNTD',-3) > 0
					lFound = .T.
				ENDIF
			ENDIF
			USE IN tmpPSTK_cntAcctCost_WO
		ENDIF
	ENDIF
	
	
	IF lFound
		IF lNewConn 
			SQLDISCONNECT(nConn )
		ENDIF
		RETURN .T.
	ENDIF
	
	*************
	*Check to see if Update is allowed 
	*lOld_Complete	
	*lOld_Cancelled
	*************

	*UPDATE nWO_Detail
	
	cSQL = "INSERT INTO dbo.AcctCost_WO (WO,AC_ID) VALUES ("
	cSQL = cSQL + STR(nWO)+","+STR(nAC_ID)+")"
	
	nSQLEXEC = SQLEXEC( nConn, cSQL, '')
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, '' )
	ENDDO
	IF nSQLEXEC < 1
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, '')
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL)
		ELSE
			nSQLEXEC = 1
		ENDIF
	ENDIF
ENDIF

IF lNewConn 
	SQLDISCONNECT(nConn )
ENDIF

RETURN lOK
ENDPROC

*
*
**AcctCosting_Check_WOD(nWO_detail)
*
*
*

*********************************************

PROCEDURE Is_InvoiceValue_Valid
PARAMETERS nInvoiceValue, nPU, pConnHandle
**lOK = Is_InvoiceValue_Valid(nInvoiceValue,nS_PU,pConnHandle)

IF NOT ( VARTYPE(nInvoiceValue) = "N" OR VARTYPE(nInvoiceValue) = "Y" )
	TrackError("Bad Parameter","Bad Parameter nInvoiceValue","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
IF NOT VARTYPE(nPU) = "N" 
	TrackError("Bad Parameter","Bad Parameter nPU","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF

PRIVATE nMaxP, lPassInvVal
nMaxP = 0
lPassInvVal = .F.

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

IF USED('tmpPSTK_MaxP')
	USE IN tmpPSTK_MaxP
ENDIF


IF nConn > 0 

	cSQL = "SELECT Max_P "
	cSQL = cSQL+" FROM dbo.PU "
	cSQL = cSQL+" WHERE PU = "+STR(nPU)
	
	SELECT 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_MaxP' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_MaxP' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MaxP")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MaxP")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_MaxP')
			RecordError(nSQLEXEC,"SQL Error","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )	
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_MaxP')
		IF RECCOUNT('tmpPSTK_MaxP') > 0
			nMaxP = PrepareSQLnum(tmpPSTK_MaxP.Max_P,'S_P',-5)
			
			IF nMaxP > 0
				IF nInvoiceValue < nMaxP 
					lPassInvVal = .T.
				ENDIF
			ENDIF
			
		ENDIF
		USE IN tmpPSTK_MaxP
	ENDIF
	
	IF lNewConn 
		SQLDISCONNECT( nConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM(),LINENO())
ENDIF

IF lNewConn 
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM(), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lPassInvVal

*********************************  
PROCEDURE get_SD_ID 
PARAMETERS cSOitem,cTBL,nID,nID_Detail,nID_D_P, pConnHandle
*nSD_ID = get_SD_ID(cSOitem,PackingSlipItem.TBL,PackingSlipItem.SL_ID,PackingSlipItem.SL_ID_D,PackingSlipItem.ID_D_Proc,pConnHandle)
*returns ID from dbo.Sales_Detail for cTBL,nID,nID_Detail,nID_D_P

IF VARTYPE(cSOitem)!="C"
	TrackError("Bad Parameter","Bad Parameter SOitem","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RecordTest("Record Test Data.", "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(1),"Bad Parameter SOitem"+CHR(13)+"was trying to connect PackingSli to the dbo.Sales_Detail") 
	RETURN 0
ENDIF
IF VARTYPE(cTBL)!="C"
	TrackError("Bad Parameter","Bad Parameter TBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RecordTest("Record Test Data.", "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(1),"Bad Parameter TBL"+CHR(13)+"was trying to connect PackingSli to the dbo.Sales_Detail") 
	RETURN 0
ENDIF
IF VARTYPE(nID)!="N"
	TrackError("Bad Parameter","Bad Parameter nID","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RecordTest("Record Test Data.", "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(1),"Bad Parameter nID"+CHR(13)+"was trying to connect PackingSli to the dbo.Sales_Detail") 
	RETURN 0
ENDIF
IF VARTYPE(nID_Detail)!="N"
	TrackError("Bad Parameter","Bad Parameter nID_Detail","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RecordTest("Record Test Data.", "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(1),"Bad Parameter nID_Detail"+CHR(13)+"was trying to connect PackingSli to the dbo.Sales_Detail") 
	RETURN 0
ENDIF
IF VARTYPE(nID_D_P)!="N"
*	TrackError("Bad Parameter ","Bad Parameter nID_D_P","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RecordTest("Record Test Data.", "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(1),"Bad Parameter nID_D_P") 
*	RETURN 0
	nID_D_P = 0
ENDIF

PRIVATE cSQL, nSQLEXEC, nSD_ID
nSD_ID = 0
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

IF USED('tmpPSTK_SP')
	USE IN tmpPSTK_SP
ENDIF
SELECT 0

IF nConn > 0

	cSQL = "SELECT ID, SOitem,PackingSli,ID_Detail_Process,Heat,Lot "
	cSQL = cSQL + " FROM dbo.Sales_Detail "
	cSQL = cSQL + " WHERE TBL = '"+cTBL+"'"
	cSQL = cSQL + " AND StockLst_ID = "+STR(nID)
	cSQL = cSQL + " AND StockLst_ID_Detail = "+STR(nID_Detail)
	
	cSQL = cSQL + " AND SOitem = '"+cSOitem+"'"
	*cSQL = cSQL + " AND ID_Detail_Process = "+STR(nID_D_P)
	
	cSQL = cSQL + " ORDER BY ID"
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_SP' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_SP' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_SP")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_SP")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_SP' )
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_SP')
		IF VARTYPE(tmpPSTK_SP.ID ) = 'N'
			nSD_ID = tmpPSTK_SP.ID 
		ENDIF
		USE IN tmpPSTK_SP
	ENDIF
	

	
	****************
	IF lNewConn
		SQLDISCONNECT(nConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF




IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nSD_ID
ENDPROC

*********************************  
PROCEDURE get_SS_IDfrom_ID_D_P 
PARAMETERS cTBL,nID_D_P, pConnHandle
*nSS_ID = get_SS_IDfrom_ID_D_P(TBL,ID_D_Proc,pConnHandle)
*returns ID from dbo.Sales_Stock

IF VARTYPE(cTBL)!="C"
	TrackError("Bad Parameter","Bad Parameter TBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RecordTest("Record Test Data.", "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(1),"Bad Parameter TBL"+CHR(13)+"was trying to connect PackingSli to the dbo.Sales_Detail") 
	RETURN 0
ENDIF
IF VARTYPE(nID_D_P)!="N"
	TrackError("Bad Parameter ","Bad Parameter nID_D_P","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RecordTest("Record Test Data.", "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(1),"Bad Parameter nID_D_P") 
	RETURN 0
ENDIF

PRIVATE nSS_ID 
nSS_ID = 0

PRIVATE cSQL, nSQLEXEC

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

IF USED('tmpPSTK_SS_ID_P')
	USE IN tmpPSTK_SS_ID_P
ENDIF
SELECT 0

IF nConn > 0
	cSQL = "SELECT ID "
	cSQL = cSQL + " FROM dbo.Sales_Stock "
	cSQL = cSQL + " WHERE TBL = '"+cTBL+"'"
	cSQL = cSQL + " AND ID_Detail_Process = "+STR(nID_D_P)

	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_SS_ID_P' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_SS_ID_P' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_SS_ID_P")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_SS_ID_P")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_SS_ID_P' )
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_SS_ID_P')
		IF VARTYPE(tmpPSTK_SS_ID_P.ID ) = 'N'
			nSS_ID = tmpPSTK_SS_ID_P.ID 
		ENDIF
		USE IN tmpPSTK_SS_ID_P
	ENDIF
	

	
	****************
	IF lNewConn
		SQLDISCONNECT(nConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF


IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nSS_ID
ENDPROC

*********************************  
PROCEDURE get_SD_IDfrom_ID_D_P 
PARAMETERS cTBL,nID_D_P, pConnHandle
*nSD_ID = get_SD_IDfrom_ID_D_P(TBL,ID_D_Proc,pConnHandle)
*returns ID from dbo.Sales_Detail

IF VARTYPE(cTBL)!="C"
	TrackError("Bad Parameter","Bad Parameter TBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RecordTest("Record Test Data.", "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(1),"Bad Parameter TBL"+CHR(13)+"was trying to connect PackingSli to the dbo.Sales_Detail") 
	RETURN 0
ENDIF
IF VARTYPE(nID_D_P)!="N"
	TrackError("Bad Parameter ","Bad Parameter nID_D_P","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RecordTest("Record Test Data.", "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(1),"Bad Parameter nID_D_P") 
	RETURN 0
ENDIF

PRIVATE nSD_ID 
nSD_ID = 0

PRIVATE cSQL, nSQLEXEC

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

IF USED('tmpPSTK_SD_ID_P')
	USE IN tmpPSTK_SD_ID_P
ENDIF
SELECT 0

IF nConn > 0
	cSQL = "SELECT Sales_Detail_ID "
	cSQL = cSQL + " FROM dbo.Sales_Stock "
	cSQL = cSQL + " WHERE TBL = '"+cTBL+"'"
	cSQL = cSQL + " AND ID_Detail_Process = "+STR(nID_D_P)

	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_SD_ID_P' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_SD_ID_P' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_SD_ID_P")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_SD_ID_P")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_SD_ID_P' )
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_SD_ID_P')
		IF VARTYPE(tmpPSTK_SD_ID_P.Sales_Detail_ID ) = 'N'
			nSD_ID = tmpPSTK_SD_ID_P.Sales_Detail_ID 
		ENDIF
		USE IN tmpPSTK_SD_ID_P
	ENDIF
	

	IF nSD_ID = 0
	* try Stock_Detail table
		IF USED('tmpPSTK_SD_ID_P')
			USE IN tmpPSTK_SD_ID_P
		ENDIF
		SELECT 0
	
		cSQL = "SELECT ID "
		cSQL = cSQL + " FROM dbo.Sales_Detail "
		cSQL = cSQL + " WHERE TBL = '"+cTBL+"'"
		cSQL = cSQL + " AND ID_Detail_Process = "+STR(nID_D_P)

		
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_SD_ID_P' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_SD_ID_P' )
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_SD_ID_P")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_SD_ID_P")
				
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_SD_ID_P' )
				RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
			ENDIF
		ENDIF
		
		IF USED('tmpPSTK_SD_ID_P')
			IF VARTYPE(tmpPSTK_SD_ID_P.ID ) = 'N'
				nSD_ID = tmpPSTK_SD_ID_P.ID 
			ENDIF
			USE IN tmpPSTK_SD_ID_P
		ENDIF
		
	ENDIF
	
	****************
	IF lNewConn
		SQLDISCONNECT(nConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF


IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nSD_ID
ENDPROC


*********************************

PROCEDURE Calc_Vend_QTYleft_PO
PARAMETERS pPOitem, pConnHandle
*nCustQTY = Calc_Vend_QTYleft_PO(cPOitem,nConnHandle)
*Used in Receive_Edit


IF NOT "PROC_SQL" $ SET("PROCEDURE")  &&Added for when Quotes is run without HPA menu.
	SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
ENDIF

cPOitem = PrepareSQLtxt(pPOitem,'POitem',12)

IF Proper_PO_item(cPOitem) = Proper_PO_item('')
	*Sometimes Receive_Edit is by SO or WO
	
*	MESSAGEBOX("Function: Calc_Cust_QTYleft_PO()"+CHR(13)+"No pPOitem Parameter!",0,"Error")
*	RecordError(0,"No POitem Parameter" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),"No pPOitem Parameter" )
	RETURN 0
ENDIF


PRIVATE nConn, lNewConn, cAlias
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

PRIVATE nQTYleft
nQTYleft = 0

IF USED('tmpPSTK_tCustQTY')
	USE IN tmpPSTK_tCustQTY
ENDIF

PRIVATE cSQL, nSQLEXEC
SELECT 0
cSQL = "SELECT SUM(PO_QTY) AS sumPO_QTY, SUM(R_QTY) AS sumR_QTY "
cSQL = cSQL +" FROM dbo.Receiving "
cSQL = cSQL +" WHERE POitem = dbo.f_ProperPOitem('"+cPOitem+"')"
cSQL = cSQL +" AND ISNULL(Cancelled,0) = 0 "

nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_tCustQTY')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_tCustQTY' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_tCustQTY")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_tCustQTY")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_tCustQTY')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

PRIVATE nSumPO_QTYrecv
nSumPO_QTYrecv= 0

IF USED('tmpPSTK_tCustQTY')
	IF RECCOUNT('tmpPSTK_tCustQTY') > 0
		nSumR_QTYrecv = PrepareSQLnum(tmpPSTK_tCustQTY.sumR_QTY,'R_QTY',-5) &&Acct QTY Received
		nSumPO_QTYrecv= PrepareSQLnum(tmpPSTK_tCustQTY.sumPO_QTY,'PO_QTY',-5) &&Vendor QTY Received
	ENDIF
	USE IN tmpPSTK_tCustQTY
ENDIF

**********
** Compare to PO's Order_QTY
PRIVATE nCust_QTYorder 
nCust_QTYorder = PrepareSQLnum( Get_From_POitem(cPOitem,nConn,'Order_QTY') ,'Order_QTY',-5) &&Cust QTY Ordered.


IF nSumPO_QTYrecv = 0
	nQTYleft = 0
ELSE
	IF nCust_QTYorder > 0
		nQTYleft = nCust_QTYorder - nSumPO_QTYrecv 
	ELSE
		nQTYleft = nCust_QTYorder 
	ENDIF
ENDIF

************	

IF lNewConn 
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF	
			
RETURN nQTYleft
ENDPROC

*********************************

PROCEDURE Calc_Vend_PiecesLeft_PO
PARAMETERS pPOitem, pConnHandle
*nCustPCleft = Calc_Vend_PiecesLeft_PO(cPOitem,nConnHandle)
*Used in Receive_Edit


IF NOT "PROC_SQL" $ SET("PROCEDURE")  &&Added for when Quotes is run without HPA menu.
	SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
ENDIF

cPOitem = PrepareSQLtxt(pPOitem,'POitem',12)

IF Proper_PO_item(cPOitem) = Proper_PO_item('')
	*Sometimes Receive_Edit is by SO or WO
	
*	MESSAGEBOX("Function: Calc_Cust_QTYleft_PO()"+CHR(13)+"No pPOitem Parameter!",0,"Error")
*	RecordError(0,"No POitem Parameter" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),"No pPOitem Parameter" )
	RETURN 0
ENDIF


PRIVATE nConn, lNewConn, cAlias
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

PRIVATE nQTYleft, nCustPCleft 
nQTYleft = 0
nCustPCleft = 0


*Is the Customer PU PCs?
PRIVATE nCust_PU
nCust_PU = PrepareSQLnum( Get_From_POitem(cPOitem,nConn,'Order_PU') ,'Order_PU',-1) &&Vend PU.
IF nCust_PU = 0
	IF lNewConn 
		SQLDISCONNECT(nConn )
	ENDIF
	RETURN 0
ENDIF

*!*	IF nCust_PU = 3		&&PC

*******************
* use QTY to estimate PC left if not PU=3

IF USED('tmpPSTK_tCustQTY')
	USE IN tmpPSTK_tCustQTY
ENDIF

PRIVATE cSQL, nSQLEXEC
SELECT 0
cSQL = "SELECT SUM(PO_QTY) AS sumPO_QTY "
cSQL = cSQL +",SUM(Pieces) AS sumPieces "
cSQL = cSQL +" FROM dbo.Receiving "
cSQL = cSQL +" WHERE POitem = dbo.f_ProperPOitem('"+cPOitem+"')"
cSQL = cSQL +" AND ISNULL(Cancelled,0) = 0 "

nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_tCustQTY')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_tCustQTY' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_tCustQTY")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_tCustQTY")
		
		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_tCustQTY')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
ENDIF

PRIVATE nSumPO_QTYrecv, nSumPiecesRecv 
nSumPO_QTYrecv = 0
nSumPiecesRecv = 0

IF USED('tmpPSTK_tCustQTY')
	IF RECCOUNT('tmpPSTK_tCustQTY') > 0
		nSumPO_QTYrecv = PrepareSQLnum(tmpPSTK_tCustQTY.sumPO_QTY,'PO_QTY',-5) &&Vendor QTY Received
		nSumPiecesRecv = PrepareSQLnum(tmpPSTK_tCustQTY.sumPieces,'Pieces',-3) &&Pieces Received
	ENDIF
	USE IN tmpPSTK_tCustQTY
ENDIF

*******************************************************
** Compare to PO's Order_QTY
PRIVATE nCust_QTYorder, nPiecesOrder
nCust_QTYorder	= PrepareSQLnum( Get_From_POitem(cPOitem,nConn,'Order_QTY') ,'Order_QTY',-5) &&Cust QTY Ordered.
nPiecesOrder	=  PrepareSQLnum( Get_From_POitem(cPOitem,nConn,'Pieces') ,'Pieces',-3)


IF nCust_PU = 3
	*Simple
	nCustPCleft = IIF(nPiecesOrder - nSumPiecesRecv > 0 ,nPiecesOrder - nSumPiecesRecv , 0)
	
ELSE
	*Complex
	IF nSumPO_QTYrecv = 0
		nQTYleft = 0
	ELSE
		IF nCust_QTYorder > 0
			nQTYleft = nCust_QTYorder - nSumPO_QTYrecv 
		ELSE
			nQTYleft = nCust_QTYorder 
		ENDIF
	ENDIF
	
	IF nQTYleft = 0
		nCustPCleft = 0
	ELSE
		IF nCust_QTYorder  = 0
			nCustPCleft = 0
		ELSE
			nCustPCleft = ROUND(nPiecesOrder * (nSumPO_QTYrecv/nCust_QTYorder),0)
		ENDIF
	ENDIF
ENDIF
*******	

IF lNewConn 
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF	
			
RETURN nCustPCleft 
ENDPROC

*********************************  
PROCEDURE Get_Stock_Detail 
PARAMETERS cTBL,nID_Detail,pConnHandle
*Table = Get_Stock_Detail(cTBL,nID_Detail,pConnHandle)
*returns cPrc_Form, nPrc_PCs, nPrc_Dim1, nPrc_Dim2, nPrc_Dim3

IF VARTYPE(cTBL)!="C"
	TrackError("Bad Parameter","Bad Parameter TBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RecordTest("Record Test Data.", "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(1),"Bad Parameter TBL"+CHR(13)+"was trying to connect PackingSli to the dbo.Sales_Detail") 
	RETURN 0
ENDIF
IF VARTYPE(nID_Detail)!="N"
	TrackError("Bad Parameter","Bad Parameter nID_Detail","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RecordTest("Record Test Data.", "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(1),"Bad Parameter nID_Detail"+CHR(13)+"was trying to connect PackingSli to the dbo.Sales_Detail") 
	RETURN 0
ENDIF

PRIVATE cSQL, nSQLEXEC, nSD_ID
nSD_ID = 0
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

*PRIVATE cAlias
*cAlias = ALIAS()

IF USED('tmpPSTK_Stock_Detail_Dim')
	TrackError("Table tmpPSTK_Stock_Detail_Dim was already in use.","Table tmpPSTK_Stock_Detail_Dim was already in use.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	USE IN tmpPSTK_Stock_Detail_Dim
ENDIF
SELECT 0

IF nConn > 0
*Prc_Form, nPrc_PCs, nPrc_Dim1, nPrc_Dim2, nPrc_Dim3

	cSQL = "SELECT M.Form, D.PC, D.Dim1, D.Dim2, D.Dim3 "
	DO CASE
	CASE cTBL = "S"
		cSQL = cSQL + " FROM dbo.StockLst_Master M WITH(NOLOCK) "
		cSQL = cSQL + " INNER JOIN dbo.StockLst_Detail D WITH(NOLOCK) ON M.ID = D.ID "
	CASE cTBL = "B"
		cSQL = cSQL + " FROM dbo.BrokerLst_Master M WITH(NOLOCK) "
		cSQL = cSQL + " INNER JOIN dbo.BrokerLst_Detail D WITH(NOLOCK) ON M.ID = D.ID "
	CASE cTBL = "W"
		cSQL = cSQL + " FROM dbo.WIPLst_Master M WITH(NOLOCK) "
		cSQL = cSQL + " INNER JOIN dbo.WIPLst_Detail D WITH(NOLOCK) ON M.ID = D.ID "
	OTHERWISE 
		TrackError("Bad Parameter","Bad Parameter TBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
		RETURN .F.
	ENDCASE
	
	cSQL = cSQL + " WHERE D.ID_Detail = "+STR(nID_Detail)

	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Stock_Detail_Dim' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Stock_Detail_Dim' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Stock_Detail_Dim")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Stock_Detail_Dim")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_Stock_Detail_Dim' )
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF

	
	****************
	IF lNewConn
		SQLDISCONNECT(nConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF


*!*	IF NOT EMPTY(cAlias)
*!*		IF USED(cAlias)
*!*			SELECT (cAlias)
*!*		ELSE
*!*			RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
*!*		ENDIF
*!*	ENDIF

RETURN 
ENDPROC


*********************************

PROCEDURE get_ID_D_P_forReceivingID
PARAMETERS cTBL,nReceivingID,pConnHandle
*nID_Detail_Proc = get_ID_D_P_forReceivingID(cTBL,nReceivingID,pConnHandle)

IF VARTYPE(cTBL)!="C"
	TrackError("Bad Parameter","Bad Parameter TBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RecordTest("Record Test Data.", "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(1),"Bad Parameter TBL"+CHR(13)+"was trying to connect PackingSli to the dbo.Sales_Detail") 
	RETURN 0
ENDIF
IF VARTYPE(nReceivingID)!="N"
	TrackError("Bad Parameter","Bad Parameter nReceivingID","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RecordTest("Record Test Data.", "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(1),"Bad Parameter nID_Detail"+CHR(13)+"was trying to connect PackingSli to the dbo.Sales_Detail") 
	RETURN 0
ENDIF

PRIVATE cSQL, nSQLEXEC, nID_Detail_Proc 
nID_Detail_Proc = 0
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

IF nConn > 0
	IF USED('tmpPSTK_Stock_Proc')
		USE IN tmpPSTK_Stock_Proc
	ENDIF
	SELECT 0
	
	DO CASE
	CASE cTBL = "S"
		cSQL = "SELECT P.ID_Detail_Process "
		cSQL = cSQL + " FROM dbo.StockLst_Process P WITH(NOLOCK) "
		cSQL = cSQL + " WHERE P.ReceivingID = "+STR(nReceivingID)
	CASE cTBL = "B"
		cSQL = "SELECT P.ID_Detail_Process "
		cSQL = cSQL + " FROM dbo.BrokerLst_Process P WITH(NOLOCK) "
		cSQL = cSQL + " WHERE P.ReceivingID = "+STR(nReceivingID)
	CASE cTBL = "W"
		cSQL = "SELECT P.ID_Detail_Process "
		cSQL = cSQL + " FROM dbo.WIPLst_Process P WITH(NOLOCK) "
		cSQL = cSQL + " WHERE P.ReceivingID = "+STR(nReceivingID)
	CASE cTBL = ""
		cSQL = "SELECT P.ID_Detail_Process, 'S' as TBL "
		cSQL = cSQL + " FROM dbo.StockLst_Process P WITH(NOLOCK) "
		cSQL = cSQL + " WHERE P.ReceivingID = "+STR(nReceivingID)
		cSQL = cSQL + " UNION "
		cSQL = cSQL + "SELECT P.ID_Detail_Process, 'B' AS TBL "
		cSQL = cSQL + " FROM dbo.BrokerLst_Process P WITH(NOLOCK) "
		cSQL = cSQL + " WHERE P.ReceivingID = "+STR(nReceivingID)
		cSQL = cSQL + " Union "
		cSQL = cSQL + "SELECT P.ID_Detail_Process, 'W' AS TBL "
		cSQL = cSQL + " FROM dbo.WIPLst_Process P WITH(NOLOCK) "
		cSQL = cSQL + " WHERE P.ReceivingID = "+STR(nReceivingID)
	OTHERWISE 
		TrackError("Bad Parameter","Bad Parameter TBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
		RETURN 0
	ENDCASE
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Stock_Proc' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Stock_Proc' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Stock_Proc")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Stock_Proc")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_Stock_Proc' )
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	IF USED('tmpPSTK_Stock_Proc')
		IF RECCOUNT('tmpPSTK_Stock_Proc')>0
			nID_Detail_Proc = PrepareSQLnum(tmpPSTK_Stock_Proc.ID_Detail_Process,'ID_Detail_Process',-3)
		ENDIF
		IF RECCOUNT('tmpPSTK_Stock_Proc')>0
			RecordError(0,'SQL Query count',PROGRAM(),LINENO(1), "get_ID_D_P_forReceivingID() returned more that one answer."+CHR(13)+"ReceivingID="+STR(nReceivingID)+CHR(13)+cSQL)
		ENDIF 
		USE IN tmpPSTK_Stock_Proc
	ENDIF
	
	****************
	IF lNewConn
		SQLDISCONNECT(nConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF


IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nID_Detail_Proc
ENDPROC


*********************************

PROCEDURE get_ID_Detail_from_PRC
PARAMETERS cTBL,nID_Detail_PRC,pConnHandle
*nID_Detail = get_ID_D_P_forReceivingID(cTBL,nID_Detail_PRC,pConnHandle)

IF VARTYPE(cTBL)!="C"
	TrackError("Bad Parameter","Bad Parameter TBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RecordTest("Record Test Data.", "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(1),"Bad Parameter TBL"+CHR(13)+"was trying to connect PackingSli to the dbo.Sales_Detail") 
	RETURN 0
ENDIF
IF VARTYPE(nID_Detail_PRC)!="N"
	TrackError("Bad Parameter","Bad Parameter nID_Detail_PRC","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RecordTest("Record Test Data.", "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(1),"Bad Parameter nID_Detail"+CHR(13)+"was trying to connect PackingSli to the dbo.Sales_Detail") 
	RETURN 0
ENDIF

PRIVATE cSQL, nSQLEXEC, nID_Detail
nID_Detail = 0

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

IF nConn > 0
	IF USED('tmpPSTK_Stock_Proc')
		USE IN tmpPSTK_Stock_Proc
	ENDIF
	SELECT 0
	cSQL = "SELECT P.ID_Detail "
	DO CASE
	CASE cTBL = "S"
		cSQL = cSQL + " FROM dbo.StockLst_Process P WITH(NOLOCK) "
	CASE cTBL = "B"
		cSQL = cSQL + " FROM dbo.BrokerLst_Process P WITH(NOLOCK) "
	CASE cTBL = "W"
		cSQL = cSQL + " FROM dbo.WIPLst_Process P WITH(NOLOCK) "
	OTHERWISE 
		TrackError("Bad Parameter","Bad Parameter TBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
		RETURN .F.
	ENDCASE
	
	cSQL = cSQL + " WHERE P.ID_Detail_Process= "+STR(nID_Detail_PRC)

	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Stock_Proc' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Stock_Proc' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Stock_Proc")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Stock_Proc")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_Stock_Proc' )
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	IF USED('tmpPSTK_Stock_Proc')
		IF RECCOUNT('tmpPSTK_Stock_Proc')>0
			nID_Detail = PrepareSQLnum(tmpPSTK_Stock_Proc.ID_Detail,'ID_Detail',-3)
		ENDIF
		USE IN tmpPSTK_Stock_Proc
	ENDIF
	
	****************
	IF lNewConn
		SQLDISCONNECT(nConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF


IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN PrepareSQLnum(nID_Detail,'ID_Detail',-3)
ENDPROC


*********************************

PROCEDURE get_ID_Detail_from_RMA_Detail 
PARAMETERS nRMA_Detail,pConnHandle,pcHeat
*nID_Detail = get_ID_Detail_from_RMA_Detail(nRMA_Detail,pConnHandle,pcHeat)

IF VARTYPE(nRMA_Detail)!="N"
	TrackError("Bad Parameter","Bad Parameter nRMA_Detail","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RecordTest("Record Test Data.", "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(1),"Bad Parameter nID_Detail"+CHR(13)+"was trying to connect PackingSli to the dbo.Sales_Detail") 
	RETURN 0
ENDIF
PRIVATE cHeat
cHeat = PrepareSQLtxt(pcHeat,'Heat',50)

PRIVATE cSQL, nSQLEXEC, cTBL, nID_Master, nID_Detail
cSQL = ""
cTBL=''
nID_Master = 0
nID_Detail = 0

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

IF nConn > 0
	IF USED('tmpPSTK_Stock_RMA')
		USE IN tmpPSTK_Stock_RMA
	ENDIF
	SELECT 0
	
	IF LEN(cHeat) > 0
		cSQL = "SELECT SS.TBL,SS.StockLst_ID,SS.StockLst_ID_Detail,SS.Heat "
		cSQL = cSQL + " FROM dbo.RMA_Receive RMAR WITH(NOLOCK) "
		*cSQL = cSQL + " INNER JOIN dbo.Sales_Stock SS WITH(NOLOCK) ON RMAR.SOitem = SS.SOitem"
		cSQL = cSQL + " INNER JOIN dbo.Sales_Stock SS WITH(NOLOCK) ON RMAR.RMA_Detail_ID  = SS.RMA_Detail_ID "
		cSQL = cSQL + " WHERE RMAR.RMA_Detail_ID = "+STR(nRMA_Detail)
		*cSQL = cSQL + " AND SS.Heat = '"+cHeat+"'"
		
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Stock_RMA' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Stock_RMA' )
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Stock_RMA")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Stock_RMA")
				
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_Stock_RMA' )
				RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
			ENDIF
		ENDIF
		IF USED('tmpPSTK_Stock_RMA')
			IF RECCOUNT('tmpPSTK_Stock_RMA')>0
				LOCATE FOR Heat = cHeat
				IF NOT FOUND()
					GO TOP
				ENDIF
				*cTBL	= PrepareSQLtxt(tmpPSTK_Stock_RMA.TBL,'TBL',1)
				*nID_Master = PrepareSQLnum(tmpPSTK_Stock_RMA.StockLst_ID_Master,'ID_Master',-3)
				nID_Detail = PrepareSQLnum(tmpPSTK_Stock_RMA.StockLst_ID_Detail,'ID_Detail',-3)
				IF RECCOUNT('tmpPSTK_Stock_RMA')>1
					RecordTest("Record Test Data.", PROGRAM(), LINENO(1),"too many records "+CHR(13)+"Heat = '"+cHeat+"'"+CHR(13)+cSQL ) 
				ELSE
					RecordTest("Record Test Data.", PROGRAM(), LINENO(1),"Perfect RMA find! "+CHR(13)+cSQL ) 
				ENDIF
			ENDIF
		ENDIF			
	ENDIF	
	
	IF nID_Detail = 0
		cSQL = "SELECT DISTINCT StockLst_ID_Detail FROM "
		cSQL = cSQL + "( "
		cSQL = cSQL + " SELECT StockLst_ID_Detail "
		cSQL = cSQL + " FROM dbo.Sales_Stock WITH(NOLOCK) "
		cSQL = cSQL + " WHERE RMA_Detail_ID = "+STR(nRMA_Detail)
		cSQL = cSQL + " AND ISNULL(StockLst_ID_Detail,0) > 0 "
		
		cSQL = cSQL + " UNION "
		cSQL = cSQL + " SELECT Stk_ID_Detail AS StockLst_ID_Detail "
		cSQL = cSQL + " FROM dbo.RMA_Receive WITH(NOLOCK) "
		cSQL = cSQL + " WHERE RMA_Detail_ID = "+STR(nRMA_Detail)
		cSQL = cSQL + " AND ISNULL(Stk_ID_Detail,0) > 0 "
		
		cSQL = cSQL + " UNION "
		cSQL = cSQL + " SELECT Stk_ID_Detail AS StockLst_ID_Detail "
		cSQL = cSQL + " FROM dbo.RMA_Receive WITH(NOLOCK) "
		cSQL = cSQL + " WHERE RMA_Detail_ID = "+STR(nRMA_Detail)
		cSQL = cSQL + " AND ISNULL(Stk_ID_Detail,0) > 0 "
		
		cSQL = cSQL + " ) t "
		cSQL = cSQL + " ORDER BY StockLst_ID_Detail "

		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Stock_RMA' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Stock_RMA' )
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Stock_RMA")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Stock_RMA")
				
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_Stock_RMA' )
				RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
			ENDIF
		ENDIF
		IF USED('tmpPSTK_Stock_RMA')
			IF RECCOUNT('tmpPSTK_Stock_RMA')>0
				nID_Detail = PrepareSQLnum(tmpPSTK_Stock_RMA.StockLst_ID_Detail,'ID_Detail',-3)
				IF RECCOUNT('tmpPSTK_Stock_RMA')>1
					RecordTest("Record Test Data.", PROGRAM(), LINENO(1),"too many records "+CHR(13)+cSQL ) 
				ENDIF
			ENDIF
			USE IN tmpPSTK_Stock_RMA
		ENDIF
	ENDIF
	
	****************
	IF lNewConn
		SQLDISCONNECT(nConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF


IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN PrepareSQLnum(nID_Detail,'ID_Detail',-3)
ENDPROC


*********************************
PROCEDURE get_ID_Detail_from_WOD
PARAMETERS nWO_Detail,pConnHandle
*nID_Detail = get_ID_Detail_from_WOD(nWO_Detail,pConnHandle)

IF VARTYPE(nWO_Detail)!="N"
	TrackError("Bad Parameter","Bad Parameter nWO_Detail","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RecordTest("Record Test Data.", "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(1),"Bad Parameter nWO_Detail"+CHR(13)+"was trying to connect PackingSli to the dbo.Sales_Detail") 
	RETURN 0
ENDIF

PRIVATE cSQL, nSQLEXEC, nID_Detail
nID_Detail = 0

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

IF nConn > 0
	IF USED('tmpPSTK_Stock_WOD')
		USE IN tmpPSTK_Stock_WOD
	ENDIF
	SELECT 0
	cSQL = "SELECT fID_Detail "
	cSQL = cSQL + " FROM dbo.WorkOrder_Detail WITH(NOLOCK) "
	cSQL = cSQL + " WHERE WO_Detail= "+STR(nWO_Detail)

	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Stock_WOD' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Stock_WOD' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Stock_WOD")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Stock_WOD")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_Stock_WOD' )
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	IF USED('tmpPSTK_Stock_WOD')
		IF RECCOUNT('tmpPSTK_Stock_WOD')>0
			nID_Detail = PrepareSQLnum(tmpPSTK_Stock_WOD.fID_Detail,'ID_Detail',-3)
		ENDIF
		USE IN tmpPSTK_Stock_WOD
	ENDIF
	
	****************
	IF lNewConn
		SQLDISCONNECT(nConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF


IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN PrepareSQLnum(nID_Detail,'ID_Detail',-3)
ENDPROC

*********************************

PROCEDURE BringBack_DeletedLst
PARAMETERS pID,pTBL,pConnHandle
*lOK = BringBack_DeletedLst(nID,pTBL,pConnHandle)
*Pass ID of Deleted Stock found in history

IF VARTYPE(pID)!="N"
	TrackError("Bad Parameter","Bad Parameter pID","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RecordTest("Record Test Data.", "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(1),"Bad Parameter ID") 
	RETURN .F.
ENDIF
PRIVATE nID,cTBL
nID = PrepareSQLnum(pID,'ID',-3)
IF nID = 0
	TrackError("Bad Parameter","Bad Parameter pID=0","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RecordTest("Record Test Data.", "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(1),"Bad Parameter ID=0") 
	RETURN .F.
ENDIF

cTBL = PrepareSQLtxt(pTBL,'TBL',1)
IF NOT (cTBL = "S" OR cTBL = "B" OR cTBL = "W" )
	TrackError("Bad Parameter","Bad Parameter TBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RecordTest("Record Test Data.", "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(1),"Bad Parameter TBL") 
	RETURN .F.
ENDIF


PRIVATE cSQL, nSQLEXEC
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

PRIVATE nCount, lOK
nCount = 0
lOK = .T.

IF nConn > 0
	*Look for the 'DELETE' in history
	IF USED('tmpPSTK_BrBk')
		USE IN tmpPSTK_BrBk
	ENDIF
	SELECT 0
	
	cSQL = "SELECT COUNT(*) AS CNTD "
	DO CASE
	CASE cTBL = "S"
		cSQL=cSQL+" FROM HPAlloy_Archive.dbo.StockLst_Master_History WITH(NOLOCK) "
	CASE cTBL = "B"
		cSQL=cSQL+" FROM HPAlloy_Archive.dbo.BrokerLst_Master_History WITH(NOLOCK) "
	CASE cTBL = "W"
		cSQL=cSQL+" FROM HPAlloy_Archive.dbo.WIPLst_Master_History WITH(NOLOCK) "
	OTHERWISE 
		TrackError("Bad Parameter","Bad Parameter nConn","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
		RETURN .F.
	ENDCASE
	cSQL=cSQL+" WHERE ID = "+STR(nID) 
	cSQL=cSQL+" AND [WHAT]='DELETE'"
	
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_BrBk' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_BrBk' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_BrBk")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_BrBk")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_BrBk' )
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
			lOK = .F.
		ENDIF
	ENDIF
	IF USED('tmpPSTK_BrBk')
		IF RECCOUNT('tmpPSTK_BrBk')>0
			nCount = PrepareSQLnum(tmpPSTK_BrBk.CNTD,'CNTD',-3)
		ELSE
			lOK = .F.
		ENDIF
		USE IN tmpPSTK_BrBk
	ENDIF
	
	
	PRIVATE nID_History
	nID_History = 0
	****************
	IF lOK AND nCount > 0
		*Get the History ID nID_History 
		IF USED('tmpPSTK_BrBk')
			USE IN tmpPSTK_BrBk
		ENDIF
		SELECT 0
		
		cSQL = "SELECT TOP 1 ID_History "
		DO CASE
		CASE cTBL = "S"
			cSQL=cSQL+" FROM HPAlloy_Archive.dbo.StockLst_Master_History WITH(NOLOCK) "
		CASE cTBL = "B"
			cSQL=cSQL+" FROM HPAlloy_Archive.dbo.BrokerLst_Master_History WITH(NOLOCK) "
		CASE cTBL = "W"
			cSQL=cSQL+" FROM HPAlloy_Archive.dbo.WIPLst_Master_History WITH(NOLOCK) "
		ENDCASE
		cSQL=cSQL+" WHERE ID = "+STR(nID) 
		cSQL=cSQL+" AND [WHAT]='DELETE'"
		
		
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_BrBk' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_BrBk' )
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_BrBk")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_BrBk")
				
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_BrBk' )
				RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
				lOK = .F.
			ENDIF
		ENDIF
		IF USED('tmpPSTK_BrBk')
			IF RECCOUNT('tmpPSTK_BrBk')>0
				nID_History = PrepareSQLnum(tmpPSTK_BrBk.ID_History,'ID_History',-3)
			ELSE
				lOK = .F.
			ENDIF
			USE IN tmpPSTK_BrBk
		ENDIF
	ENDIF
	
	****************
	IF lOK AND nID_History > 0
		cSQLi="SET IDENTITY_INSERT "
		DO CASE 
		CASE cTBL = "S"
			cSQLi=cSQLi+" dbo.StockLst_Master ON; "
			cSQLi=cSQLi+" INSERT INTO dbo.StockLst_Master "
		CASE cTBL = "B"
			cSQLi=cSQLi+" dbo.BrokerLst_Master ON; "
			cSQLi=cSQLi+" INSERT INTO dbo.BrokerLst_Master "
		CASE cTBL = "W"
			cSQLi=cSQLi+" dbo.WIPLst_Master ON; "
			cSQLi=cSQLi+" INSERT INTO dbo.WIPLst_Master "
		ENDCASE	
		
		cSQLi=cSQLi+" ([ID],[alloy],[form],[size],[heat]) VALUES ("+STR(nID)+",'','',0,'') ;"	&&The required min fields
		
		nSQLEXEC = SQLEXEC(nConn, cSQLi )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn,  cSQLi )
		ENDDO
		IF nSQLEXEC < 0
			SQLEXECError(cSQLi, nConn, nSQLEXEC )
			lOK = .F.
		ELSE
			cSQLi = "SET IDENTITY_INSERT "
			DO CASE 
			CASE cTBL = "S"
				cSQLi=cSQLi+" dbo.StockLst_Master OFF; "
			CASE cTBL = "B"
				cSQLi=cSQLi+" dbo.BrokerLst_Master OFF; "
			CASE cTBL = "W"
				cSQLi=cSQLi+" dbo.WIPLst_Master OFF; "
			ENDCASE	
			
			nSQLEXEC = SQLEXEC(nConn, cSQLi )
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL' TIMEOUT 1
				nSQLEXEC = SQLEXEC(nConn,  cSQLi )
			ENDDO
			
			***
			WAIT WINDOW " Inserted Blank into ?LstMaster. " NOWAIT
		ENDIF
		
		*****
		
		
		*Fill in ALL fields now
		
		DO CASE 
		CASE cTBL = "S"
			cSQL = "UPDATE dbo.StockLst_Master "
		CASE cTBL = "B"
			cSQL = "UPDATE dbo.BrokerLst_Master "
		CASE cTBL = "W"
			cSQL = "UPDATE dbo.WIPLst_Master "
		ENDCASE	
		cSQL =  cSQL + " SET [Alloy] = SM4.[Alloy] "
		cSQL =  cSQL + ",[form]=SM4.[form]"
		cSQL =  cSQL + ",[cc]=SM4.[cc]"
		cSQL =  cSQL + ",[cl]=SM4.[cl]"
		cSQL =  cSQL + ",[size]=SM4.[size]"
		cSQL =  cSQL + ",[cond]=SM4.[cond]"
		cSQL =  cSQL + ",[mweight]=0"	&&SM4.[mWeight]"
		cSQL =  cSQL + ",[specs]=SM4.[specs]"
		cSQL =  cSQL + ",[heat]=SM4.[heat]"
		cSQL =  cSQL + ",[lot]=SM4.[lot]"
		cSQL =  cSQL + ",[Paid]=SM4.[paid]"
		cSQL =  cSQL + ",[po_item]=SM4.[PO_Item]"
		cSQL =  cSQL + ",[poduedate]=SM4.[poduedate]"
		cSQL =  cSQL + ",[mill]=SM4.[mill]"
		cSQL =  cSQL + ",[stkdate]=SM4.[stkdate]"
		cSQL =  cSQL + ",[history]='Restored from Delete'"
		cSQL =  cSQL + ",[num]=SM4.[num]"
		cSQL =  cSQL + ",[POStatus]=SM4.[POStatus]"
		cSQL =  cSQL + ",[BrandName]=SM4.[BrandName]"
		cSQL =  cSQL + ",[MillTrace]=SM4.[MillTrace]"
		cSQL =  cSQL + ",[FROM_ID]=SM4.[FROM_ID]"
		
		cSQL =  cSQL + ",[Melt]=SM4.[Melt]"
		cSQL =  cSQL + ",[mS_QTY]=0 "	&&SM4.[mS_QTY]"
		cSQL =  cSQL + ",[WO_Detail]=SM4.[WO_Detail]"
		cSQL =  cSQL + ",[ProjID]=SM4.[ProjID]"
		
		DO CASE 
		CASE cTBL = "S"
			cSQL = cSQL + " FROM HPAlloy_Archive.dbo.StockLst_Master_History SM4 "
			cSQL = cSQL + " WHERE StockLst_Master.ID = "+STR(nID)
		CASE cTBL = "B"
			cSQL = cSQL + " FROM HPAlloy_Archive.dbo.BrokerLst_Master_History SM4 "
			cSQL = cSQL + " WHERE BrokerLst_Master.ID = "+STR(nID)
		CASE cTBL = "B"
			cSQL = cSQL + " FROM HPAlloy_Archive.dbo.WIPLst_Master_History SM4 "
			cSQL = cSQL + " WHERE BrokerLst_Master.ID = "+STR(nID)
		ENDCASE	
		cSQL =  cSQL + " AND SM4.ID_History = "+STR(nID_History)
*		cSQL =  cSQL + " AND SM4.[WHAT]='DELETE' " 

		
		nSQLEXEC = SQLEXEC(nConn, cSQL )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 2
			nSQLEXEC = SQLEXEC(nConn,  cSQL )
		ENDDO
		IF nSQLEXEC < 0

			TrackError(cSQL,"Could not restore ID:"+ALLTRIM(STR( nID ))+" with History ID:"+ALLTRIM(STR( nID_History )), PROGRAM(), LINENO(1))
			
			SQLEXECError(cSQL, nConn, nSQLEXEC )
			lOK = .F.
		ELSE
			TrackMess("Master record restored from History ID:"+ALLTRIM(STR( nID ))+" History ID:"+ALLTRIM(STR( nID_History ))+" "+CHR(13)+SYS(16,1))
			MESSAGEBOX("Master record restored"+CHR(13)+" ID:"+ALLTRIM(STR( nID ))+CHR(13)+"History ID:"+ALLTRIM(STR( nID_History )),0,"Succes")
		ENDIF
	
	
	ENDIF
		
	****************
	
	IF lNewConn
		SQLDISCONNECT(nConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF


IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lOK 
ENDPROC

*******************************************************
PROCEDURE p_Lst_Detail_Clone
PARAMETERS nID_Master, nID_Detail, cTBL, nQTY, pConnHandle 
*nID_Detail = p_Lst_Detail_Clone(nID_Master, nID_Detail, cTBL, pConnHandle )

IF PrepareSQLnum(nID_Master,'ID_Master',-3)= 0
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


*See if old ID_Detail still in TBL
PRIVATE nCount
nCount = Count_Lst_Detail_by_ID_Detail(cTBL,nID_Detail,nConn)
IF nCount = 0
	nCount = Count_Lst_Detail_by_ID_Detail(cTBL+"H",nID_Detail,nConn)
	IF nCount > 0
		*Clone this History
		cTBL = cTBL+"H"
	ELSE
		TrackError("Could not run New_ID_Detail","New_ID_Detail", PROGRAM(), LINENO(1))
		RETURN 0
	ENDIF
ENDIF

IF USED('tmp_New_ID_Detail')
	USE IN tmp_New_ID_Detail
ENDIF

SELECT 0

cSQL = " EXEC dbo.p_Lst_Detail_Clone "

cSQL = cSQL +" @ID="+STR(nID_Master)
cSQL = cSQL +",@ID_Detail="+STR(nID_Detail)
cSQL = cSQL +",@TBL='"+cTBL+"'"
cSQL = cSQL +",@mS_QTY="+STR(nQTY)


nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmp_New_ID_Detail' )
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmp_New_ID_Detail' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmp_New_ID_Detail")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmp_New_ID_Detail")

		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	SQLEXECError(cSQL ,nConn, nSQLEXEC, 'tmp_New_ID_Detail')
ENDIF

PRIVATE nNew_ID_Detail
nNew_ID_Detail = 0

IF USED('tmp_New_ID_Detail')
	IF RECCOUNT('tmp_New_ID_Detail') > 0
		nNew_ID_Detail = PrepareSQLnum(tmp_New_ID_Detail.EXP,'ID_Detail',-3)	

	ENDIF



	IF lNewConn
		SQLDISCONNECT(nConn)
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF


IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF


RETURN nNew_ID_Detail

*******************************************************
PROCEDURE p_Lst_Detail_Clone_WIP
PARAMETERS nID_Master, nID_Detail, cTBL, nQTY, pConnHandle 
*nID_Detail = p_Lst_Detail_Clone_WIP(nID_Master, nID_Detail, cTBL, pConnHandle )

IF PrepareSQLnum(nID_Master,'ID_Master',-3)= 0
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


*See if old ID_Detail still in TBL
PRIVATE nCount
nCount = Count_Lst_Detail_by_ID_Detail(cTBL,nID_Detail,nConn)
IF nCount = 0
	nCount = Count_Lst_Detail_by_ID_Detail(cTBL+"H",nID_Detail,nConn)
	IF nCount > 0
		*Clone this History
		cTBL = cTBL+"H"
	ELSE
		TrackError("Could not run New_ID_Detail","New_ID_Detail", PROGRAM(), LINENO(1))
		RETURN 0
	ENDIF
ENDIF

IF USED('tmp_New_ID_Detail')
	USE IN tmp_New_ID_Detail
ENDIF

SELECT 0

cSQL = " EXEC dbo.p_Lst_Detail_Clone_WIP "
cSQL = cSQL +" @ID="+STR(nID_Master)
cSQL = cSQL +",@ID_Detail="+STR(nID_Detail)
cSQL = cSQL +",@TBL='"+cTBL+"'"
cSQL = cSQL +",@mS_QTY="+STR(nQTY)


nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmp_New_ID_Detail' )
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmp_New_ID_Detail' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmp_New_ID_Detail")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmp_New_ID_Detail")

		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	SQLEXECError(cSQL ,nConn, nSQLEXEC, 'tmp_New_ID_Detail')
ENDIF

PRIVATE nNew_ID_Detail
nNew_ID_Detail = 0

IF USED('tmp_New_ID_Detail')
	IF RECCOUNT('tmp_New_ID_Detail') > 0
		nNew_ID_Detail = PrepareSQLnum(tmp_New_ID_Detail.EXP,'ID_Detail',-3)	

	ENDIF



	IF lNewConn
		SQLDISCONNECT(nConn)
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF


IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF


RETURN nNew_ID_Detail


*******************************************************
PROCEDURE Receiving_Stock_MillTrace
PARAMETERS lMark, nReceivingID, pConnHandle 
*lOK = Receiving_Stock_MillTrace(lMark, nReceivingID, pConnHandle )

IF PrepareSQLnum(nReceivingID,'ReceivingID',-3)= 0
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

PRIVATE cAlias
cAlias = ALIAS()


*Get Receiving Table, ID, ID_Detail
PRIVATE cTBL,lOK_TBL, nID, nID_Detail, lMillTrace, lOK
lOK = .F.
lOK_TBL = .T.

IF USED('tmpPSTK_SMD')
	USE IN tmpPSTK_SMD
ENDIF

SELECT 0

cSQL = " SELECT StockTable, ID_Master, ID_Detail, "
cSQL = cSQL +" Pass, GoodPapers, Cancelled, Hold, Services, ConvServ, Equipment, MillTrace "
cSQL = cSQL +" FROM dbo.Receiving "
cSQL = cSQL +" WHERE ID = "+STR(nReceivingID)

nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_SMD' )
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_SMD' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_SMD")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_SMD")

		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	SQLEXECError(cSQL ,nConn, nSQLEXEC, 'tmpPSTK_SMD')
ENDIF

PRIVATE nNew_ID_Detail
nNew_ID_Detail = 0

IF USED('tmpPSTK_SMD')
	IF RECCOUNT('tmpPSTK_SMD') > 0
		cTBL		= PrepareSQLtxt(tmpPSTK_SMD.StockTable,'StockTable',1)
		nID			= PrepareSQLnum(tmpPSTK_SMD.ID_Master,'ID_Master',-3)	
		nID_Detail	= PrepareSQLnum(tmpPSTK_SMD.ID_Detail,'ID_Detail',-3)	
		lMillTrace	= PrepareSQLlogic(tmpPSTK_SMD.MillTrace,'MillTrace')
		
		USE IN tmpPSTK_SMD
		
		IF cTBL = 'N' OR LEN(cTBL)=0
			*No stock TableName to change
			lOK_TBL = .F.
		ELSE
			lOK_TBL = .T.
			lOK = Stock_Mark_MillTrace(lMark, nReceivingID, cTBL, nID, nID_Detail, nConn )	
		ENDIF
	ELSE 
		USE IN tmpPSTK_SMD
	ENDIF
	
	
	
	cSQL = ''
	IF lOK OR NOT lOK_TBL
		IF lMark
			IF lMillTrace
				*Good
			ELSE
				*Update
				cSQL = "UPDATE dbo.Receiving SET MillTrace = 1 "
				cSQL = cSQL +" WHERE ID = "+STR(nReceivingID)
			ENDIF
		ELSE
			IF lMillTrace
				*Update
				cSQL = "UPDATE dbo.Receiving SET MillTrace = 0 "
				cSQL = cSQL +" WHERE ID = "+STR(nReceivingID)
			ELSE
				*Good
			ENDIF
		ENDIF
		
		IF LEN(cSQL) > 0
			nSQLEXEC = SQLEXEC(nConn, cSQL, '' )
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL' TIMEOUT 1
				nSQLEXEC = SQLEXEC(nConn, cSQL, '' )
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
				SQLEXECError(cSQL ,nConn, nSQLEXEC, '')
				RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Failed to Update:"+cSQL )
			ENDIF		
		ENDIF
	ENDIF
	
	IF lNewConn
		SQLDISCONNECT(nConn)
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF


IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF


RETURN lOK

*******************************************************
PROCEDURE Stock_Mark_MillTrace
PARAMETERS pMark, nReceivingID, pTBL, nID, nID_Detail, pConnHandle 
*lOK = Stock_Mark_MillTrace(lMark, nReceivingID, cTBL, nID, nID_Detail, nConn )

PRIVATE lMark
lMark = PrepareSQLlogic(pMark,'Mark')

IF PrepareSQLnum(nReceivingID,'ReceivingID',-3)= 0
	MESSAGEBOX("Bad Parameter nReceivingID",0+16,"Bad Parameter nReceivingID")
	RETURN .F.
ENDIF
cTBL = UPPER(PrepareSQLtxt(pTBL,'TBL',1))
IF NOT (cTBL = "S" OR cTBL = "B" OR cTBL = "W" )
	IF cTBL = "N"
		*Probably a Not Stock like a Test 
	ELSE
		TrackError("Bad Parameter","Bad Parameter TBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
		RecordTest("Record Test Data.", "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(1),"Bad Parameter TBL") 
		MESSAGEBOX("Bad Parameter TBL",0+16,"Bad Parameter TBL")
	ENDIF
	RETURN .F.
ENDIF

IF PrepareSQLnum(nID,'ID_Master',-3)= 0
	MESSAGEBOX("Bad Parameter nID",0+16,"Bad Parameter")
	RETURN .F.
ENDIF
IF PrepareSQLnum(nID_Detail,'ID_Detail',-3)= 0
	MESSAGEBOX("Bad Parameter nID_Detail",0+16,"Bad Parameter")
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

PRIVATE cAlias
cAlias = ALIAS()

PRIVATE lOK
lOK = .F.

IF USED('tmpPSTK_Cnt_SMD')
	USE IN tmpPSTK_Cnt_SMD
ENDIF

cSQL = "SELECT MillTrace "
cSQL = cSQL+",case when MillTrace IS NULL then 'N'"
cSQL = cSQL+" when Milltrace = 1 then '1' "
cSQL = cSQL+" when MillTrace = 0 then '0' end "
cSQL = cSQL+" AS cMillTrace "


SELECT 0
DO CASE
CASE cTBL = "S"
	cSQL = cSQL+" FROM dbo.StockLst_Master "
CASE cTBL = "B"
	cSQL = cSQL+" FROM dbo.BrokerLst_Detail "
CASE cTBL = "W"
	cSQL = cSQL+" FROM dbo.WIPLst_Detail "
OTHERWISE
	cSQL = ''
	TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDCASE

cSQL = cSQL + " WHERE ID = "+STR(nID)
*cSQL = cSQL + " AND ReceivingID = "+ALLTRIM(STR( pnReceiveID ))

nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Cnt_SMD' )
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Cnt_SMD' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Cnt_SMD")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Cnt_SMD")

		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	SQLEXECError(cSQL ,nConn, nSQLEXEC, 'tmpPSTK_Cnt_SMD')
ENDIF

PRIVATE lCurrTrace, lFoundSTK
lCurrTrace = .F.
lFoundSTK = .F.

IF USED('tmpPSTK_Cnt_SMD')
	IF RECCOUNT('tmpPSTK_Cnt_SMD') > 0
		*lCurrTrace	= PrepareSQLlogic(tmpPSTK_SMD.MillTrace,'MillTrace')
		cMillTrace = PrepareSQLtxt(tmpPSTK_Cnt_SMD.cMillTrace,'cMillTrace',1)
		DO CASE
		CASE cMillTrace = 'N'
			lCurrTrace = NULL
		CASE cMillTrace = '0'
			lCurrTrace = 0
		CASE cMillTrace = '1'
			lCurrTrace = 1
		ENDCASE
		
		lFoundSTK = .T.
	ENDIF
	
	USE IN tmpPSTK_Cnt_SMD
	IF lNewConn
		SQLDISCONNECT(nConn)
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF


IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF
*************
IF lFoundSTK 
	IF lMark
		*Mark as MillTrace
		IF cMillTrace = '1'
			MESSAGEBOX("Stock was already marked as MillTrace"+CHR(13)+"Complete",0,"Done")
			lOK = .T.
		ELSE
			*Mark as MillTrace
			DO CASE
			CASE cTBL = "S"
				cSQL = "UPDATE dbo.StockLst_Master "
			CASE cTBL = "B"
				cSQL = "UPDATE dbo.BrokerLst_Master "
			CASE cTBL = "W"
				cSQL = "UPDATE dbo.WIPLst_Master "
			ENDCASE
			
			cSQL = cSQL + " Set MillTrace = 1 "
			cSQL = cSQL + " WHERE ID = "+STR(nID)
			
			nSQLEXEC = SQLEXEC(nConn, cSQL, '' )
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL' TIMEOUT 1
				nSQLEXEC = SQLEXEC(nConn, cSQL, '' )
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
				SQLEXECError(cSQL ,nConn, nSQLEXEC, '')
			ELSE
				MESSAGEBOX("Stock marked as MillTrace"+CHR(13)+"Complete",0,"Done")
				lOK = .T.
			ENDIF

		ENDIF
	ELSE
		*Unmark as MillTrace
		IF cMillTrace = '0'
			MESSAGEBOX("Stock was already NOT marked as MillTrace"+CHR(13)+"Complete",0,"Done")
			lOK = .T.
		ELSE
			*Unmark as MillTrace
			DO CASE
			CASE cTBL = "S"
				cSQL = "UPDATE dbo.StockLst_Master "
			CASE cTBL = "B"
				cSQL = "UPDATE dbo.BrokerLst_Master "
			CASE cTBL = "W"
				cSQL = "UPDATE dbo.WIPLst_Master "
			ENDCASE
			
			cSQL = cSQL + " Set MillTrace = 0 "
			cSQL = cSQL + " WHERE ID = "+STR(nID)
			
			nSQLEXEC = SQLEXEC(nConn, cSQL, '' )
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL' TIMEOUT 1
				nSQLEXEC = SQLEXEC(nConn, cSQL, '' )
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
				SQLEXECError(cSQL ,nConn, nSQLEXEC, '')
			ELSE
				MESSAGEBOX("Stock un marked as MillTrace"+CHR(13)+"Complete",0,"Done")
				lOK = .T.
			ENDIF
			
		ENDIF
	
	ENDIF	
ELSE
	MESSAGEBOX("No Stock was Found",0,"Error")
	lOK = .F.
ENDIF

RETURN lOK

ENDPROC

*********************************
PROCEDURE MaxLBS_Location
PARAMETER pLocation, pConnHandle
*MaxLBS_Location( pLocation, pConnHandle )
*Returns INT

IF VARTYPE(pLocation) != "C"
	TrackError("Bad Parameter","Bad Parameter pLocation","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN -1
ENDIF
PRIVATE cLocation
cLocation = PrepareSQLtxt(pLocation,'Location',10)

PRIVATE nMaxLBS
nMaxLBS = 0

PRIVATE nConn , lNewConn
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

PRIVATE cSQL, nSQLEXEC
PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_MaxLBS')
	USE IN tmpPSTK_MaxLBS
ENDIF
SELECT 0

IF nConn > 0
	*cSQL = "SELECT dbo.f_LBS_At_Location("
	cSQL = "SELECT dbo.f_MaxLBS_Location("
	cSQL = cSQL + "'"+ cLocation+ "'"
	cSQL = cSQL + ")"
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_MaxLBS' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_MaxLBS' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MaxLBS")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_MaxLBS")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpPSTK_MaxLBS' )
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
		
	IF USED('tmpPSTK_MaxLBS')
		IF ISNULL(tmpPSTK_MaxLBS.EXP)
			nMaxLBS = 0
		ELSE
			nMaxLBS = PrepareSQLnum(tmpPSTK_MaxLBS.EXP,'MaxLBS',-3)

		ENDIF
		
		USE IN tmpPSTK_MaxLBS
	ENDIF
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:CCSort",LINENO())
ENDIF

IF lNewConn 
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nMaxLBS 
ENDPROC

********************************* 

PROCEDURE LBS_Location
PARAMETER pLocation, pConnHandle
*LBS_Location( pLocation, pConnHandle )
*Returns INT

IF VARTYPE(pLocation) != "C"
	TrackError("Bad Parameter","Bad Parameter pLocation","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN -1
ENDIF
PRIVATE cLocation
cLocation = PrepareSQLtxt(pLocation,'Location',10)

PRIVATE nMaxLBS
nMaxLBS = 0

PRIVATE nConn , lNewConn
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

PRIVATE cSQL, nSQLEXEC
PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_SumLBS')
	USE IN tmpPSTK_SumLBS
ENDIF
SELECT 0

IF nConn > 0
	*cSQL = "SELECT dbo.f_LBS_At_Location('"+cLocation+"') AS LBS"
	cSQL = "SELECT SUM(Weight) AS LBS "
	cSQL = cSQL + " FROM dbo.StockLst_Detail WITH(NOLOCK) "
	cSQL = cSQL + " WHERE Location = '"+cLocation+"'"
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_SumLBS' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_SumLBS' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_SumLBS")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_SumLBS")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpPSTK_SumLBS' )
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_SumLBS')
		IF ISNULL(tmpPSTK_SumLBS.LBS )
			nMaxLBS = 0
		ELSE
			nMaxLBS = PrepareSQLnum(tmpPSTK_SumLBS.LBS ,'MaxLBS',-3)

		ENDIF
		
		USE IN tmpPSTK_SumLBS
	ENDIF
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:CCSort",LINENO())
ENDIF

IF lNewConn 

	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nMaxLBS 
ENDPROC
********************************* 

PROCEDURE Location_CNT
PARAMETER pLocation, pConnHandle
*Location_CNT( pLocation, pConnHandle )
*Returns INT

IF VARTYPE(pLocation) != "C"
	TrackError("Bad Parameter","Bad Parameter pLocation","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN -1
ENDIF
PRIVATE cLocation
cLocation = PrepareSQLtxt(pLocation,'Location',10)

PRIVATE nCount
nCount = 0

PRIVATE nConn , lNewConn
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

PRIVATE cSQL, nSQLEXEC
PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPSTK_SumCNT')
	USE IN tmpPSTK_SumCNT
ENDIF
SELECT 0

IF nConn > 0
	*cSQL = "SELECT dbo.f_LBS_At_Location('"+cLocation+"') AS LBS"
	cSQL = "SELECT COUNT(*) AS CNT "
	cSQL = cSQL + " FROM dbo.StockLst_Detail WITH(NOLOCK) "
	cSQL = cSQL + " WHERE Location = '"+cLocation+"'"
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_SumCNT' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_SumCNT' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_SumCNT")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_SumCNT")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpPSTK_SumCNT' )
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_SumCNT')
		IF ISNULL(tmpPSTK_SumCNT.CNT )
			nCount = 0
		ELSE
			nCount = PrepareSQLnum(tmpPSTK_SumCNT.CNT ,'Count',-3)

		ENDIF
		
		USE IN tmpPSTK_SumCNT
	ENDIF
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:CCSort",LINENO())
ENDIF

IF lNewConn 

	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nCount 
ENDPROC

********************************* 

PROCEDURE Update_PurchaseOrder_Set_TBL_IDDP 
PARAMETER cPOitem, cTBL, nID_Detail_Process, pConnHandle
*lOK = Update_PurchaseOrder_Set_TBL_IDDP( cPOitem, cTBL, nID_Detail_Process, pConnHandle )
*a Puchase Order Item only has 1 INCOMING process. SELECTS can have many Processes

IF VARTYPE(cPOitem) != "C"
	TrackError("Bad Parameter","Bad Parameter cPOitem","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
IF VARTYPE(nID_Detail_Process) != "N"
	TrackError("Bad Parameter","Bad Parameter nID_Detail_Process","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
cPOitem = Proper_PO_item(cPOitem)

PRIVATE nConn , lNewConn
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

PRIVATE lOK
lOK = .F.

PRIVATE cSQL, nSQLEXEC
IF nConn > 0

	cSQL = "UPDATE dbo.PurchaseOrder"
	cSQL = cSQL + " SET TBL='"+cTBL+"'"
	cSQL = cSQL + " ,ID_Detail_Process="+STR(nID_Detail_Process)
	cSQL = cSQL + " WHERE POitem = dbo.f_ProperPOitem('"+cPOitem+"')"
	cSQL = cSQL + " AND TBL<>'"+cTBL+"' "
	cSQL = cSQL + " AND ID_Detail_Process<>"+STR(nID_Detail_Process)
			
	nSQLEXEC = SQLEXEC(nConn, cSQL, '' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, '' )
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
		IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, '' )
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ELSE
		lOK = .T.
	ENDIF
	

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:CCSort",LINENO())
ENDIF

IF lNewConn 

	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lOK 
ENDPROC
********************************* 

PROCEDURE Update_WOD_Set_TBL_IDDP
PARAMETER nWO_Detail, cTBL, nID_Detail_Process, pConnHandle
*lOK = Update_WOD_Set_TBL_IDDP( nWO_Detail, cTBL, nID_Detail_Process, pConnHandle )


IF VARTYPE(nWO_Detail) != "N"
	TrackError("Bad Parameter","Bad Parameter nWO_Detail","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
IF nWO_Detail = 0
	RETURN .T.
ENDIF
IF VARTYPE(cTBL) != "C"
	TrackError("Bad Parameter","Bad Parameter cTBL","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
IF VARTYPE(nID_Detail_Process) != "N"
	TrackError("Bad Parameter","Bad Parameter nID_Detail_Process","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF

PRIVATE nConn , lNewConn
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

PRIVATE lOK
lOK = .F.

PRIVATE cSQL, nSQLEXEC
IF nConn > 0

	cSQL = "UPDATE dbo.WorkOrder_Detail "
	cSQL = cSQL + " SET TBL='"+cTBL+"'"
	cSQL = cSQL + " ,ID_Detail_Process="+STR(nID_Detail_Process)
	cSQL = cSQL + " WHERE WO_Detail = "+STR(nWO_Detail)
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, '' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, '' )
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
		IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, '' )
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ELSE
		lOK = .T.
	ENDIF
	

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:CCSort",LINENO())
ENDIF

IF lNewConn 

	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lOK 
ENDPROC

********************************* 

PROCEDURE is_POitem_Received
PARAMETER cPOitem, pConnHandle
*lOK = is_POitem_Received( cPOitem, pConnHandle )


IF VARTYPE(cPOitem) != "C"
	TrackError("Bad Parameter","Bad Parameter cPOitem","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ENDIF
cPOitem = Proper_PO_item(cPOitem)

PRIVATE nConn , lNewConn
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

IF USED('tmpPSTK_PO_R')
	USE IN tmpPSTK_PO_R
ENDIF
SELECT 0

PRIVATE lOK, nRID 
lOK = .F.
nRID = 0

PRIVATE cSQL, nSQLEXEC
IF nConn > 0

	cSQL = "SELECT ID "
	cSQL = cSQL + " FROM dbo.Receiving "
	cSQL = cSQL + " WHERE POitem = dbo.f_ProperPOitem('"+cPOitem+"')"
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_PO_R' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_PO_R' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_PO_R")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_PO_R")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpPSTK_PO_R' )
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ELSE
		lOK = .T.
	ENDIF
	IF USED('tmpPSTK_PO_R')
		IF RECCOUNT('tmpPSTK_PO_R') > 0
			nRID = PrepareSQLnum(tmpPSTK_PO_R.ID,'RID',-3)
		ENDIF
		USE IN tmpPSTK_PO_R
	ENDIF
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:CCSort",LINENO())
ENDIF

IF lNewConn 
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nRID 
ENDPROC


**********************************
*Proc_SQL.Get_QShippedinSales 

PROCEDURE get_PS_Qty 
PARAMETERS cSOItem, nConn
*nCount = get_PS_Qty(cSOItem, ThisForm.nConnHandle)

PRIVATE lCloseConn

IF VARTYPE(cSOItem) != "C"
	RecordError( 0, 'PARAMETERS ', "Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"VFP message: No cSOItem Parameter" )
	RETURN 0
ENDIF
IF Proper_SO_Item(cSOItem) = Proper_SO_item("")
	RecordError( 0, 'PARAMETERS ', "Proc_SQL:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"VFP message: Bad cSOItem Parameter" )
	RETURN 0
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

IF USED("tmpPSTK_PS_Qty")
	USE IN tmpPSTK_PS_Qty
ENDIF
cSQL=" SELECT dbo.fvSales_PS_QTY( dbo.f_ProperSOitem('"+cSOItem+"') ) AS PS_Qty "

SELECT 0
nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_PS_Qty')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPSTK_PS_Qty')
ENDDO
IF nSQLEXEC < 0
	SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_PS_Qty')
	RecordError(nSQLEXEC,"SQL Error","Proc_SQL:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.", "Proc_SQL:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

PRIVATE nReturn
nReturn = 0

IF USED("tmpPSTK_PS_Qty")
	IF VARTYPE(tmpPSTK_PS_Qty.PS_Qty )= "N"
		nReturn = tmpPSTK_PS_Qty.PS_Qty 
	ENDIF
	USE IN tmpPSTK_PS_Qty
ENDIF

IF lCloseConn
	SQLDISCONNECT( nConn )
ENDIF

RETURN nReturn
ENDPROC

*********************************  
PROCEDURE is_Order_Stock_Process
PARAMETERS pWO, pSOitem, pConnHandle
*lAnswer = is_Order_Stock_Process(nWO, cSOitem,  pConnHandle)
*RETURNS logic

PRIVATE nWO
IF VARTYPE(pWO)!="N"
	TrackError("Bad Parameter WO","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ELSE
	nWO = PrepareSQLnum(pWO,'WO',-3)
ENDIF

PRIVATE cSOitem
IF VarType(pSOitem) != "C"
	TrackError("Bad Parameter cSOitem","Bad Parameter","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())	
	RETURN .F.
ELSE
	cSOitem = PrepareSQLtxt(pSOitem,'SOitem',10)
ENDIF

PRIVATE lAnswer
lAnswer = .F.

IF nWO > 0
	lAnswer = .T.
ELSE
	IF Proper_SO_Item(cSOitem) != Proper_SO_Item("")
		lAnswer = .T.
	ENDIF
ENDIF
IF lAnswer = .F.
	RETURN .F.
ENDIF
lAnswer = .F.

PRIVATE cSQL, cStockStr
cStockStr = ''

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

IF USED('tmpPSTK_Order')
	USE IN tmpPSTK_Order
ENDIF
SELECT 0

IF nConn > 0
	cSQL = "SELECT P.ID_Detail_Process "
	cSQL = cSQL + " FROM dbo.StockLst_Process P "
	cSQL = cSQL + " inner join dbo.StockLst_Detail D ON P.ID_Detail = D.ID_Detail "
	cSQL = cSQL + " inner join dbo.StockLst_Master M ON D.ID = M.ID "

	IF nWO > 0
		cSQL = cSQL + " WHERE ( P.WO="+STR(nWO)
		IF Proper_SO_Item(cSOitem) != Proper_SO_Item("")
			cSQL = cSQL + " OR P.SOitem = dbo.f_ProperSOitem('"+cSOitem+"')" 
		ENDIF
		cSQL = cSQL + " ) "
	ELSE
		IF Proper_SO_Item(cSOitem) != Proper_SO_Item("")
			cSQL = cSQL + " WHERE P.SOitem = dbo.f_ProperSOitem('"+cSOitem+"')"
		ENDIF
	ENDIF
	
*	cSQL = cSQL + " AND P.Process_ID = 'SELECTED'"
	cSQL = cSQL + " AND ( P.Process_ID = 'SELECTED' OR P.Process_ID='PARTSELECT' ) "

	cSQL = cSQL + " UNION "
	cSQL = cSQL + " SELECT P.ID_Detail_Process "
	cSQL = cSQL + " FROM dbo.BrokerLst_Process P "
	cSQL = cSQL + " inner join dbo.BrokerLst_Detail D ON P.ID_Detail = D.ID_Detail "
	cSQL = cSQL + " inner join dbo.BrokerLst_Master M ON D.ID = M.ID "

	IF nWO > 0
		cSQL = cSQL + " WHERE ( P.WO="+STR(nWO)
		IF Proper_SO_Item(cSOitem) != Proper_SO_Item("")
			cSQL = cSQL + " OR P.SOitem = dbo.f_ProperSOitem('"+cSOitem+"')" 
		ENDIF
		cSQL = cSQL + " ) "
	ELSE
		IF Proper_SO_Item(cSOitem) != Proper_SO_Item("")
			cSQL = cSQL + " WHERE P.SOitem = dbo.f_ProperSOitem('"+cSOitem+"')"
		ENDIF
	ENDIF
	
*	cSQL = cSQL + " AND P.Process_ID = 'SELECTED'"
	cSQL = cSQL + " AND ( P.Process_ID = 'SELECTED' OR P.Process_ID='PARTSELECT' ) "

	cSQL = cSQL + " UNION "
	cSQL = cSQL + " SELECT P.ID_Detail_Process "
	cSQL = cSQL + " FROM dbo.WIPLst_Process P "
	cSQL = cSQL + " inner join dbo.WIPLst_Detail D ON P.ID_Detail = D.ID_Detail "
	cSQL = cSQL + " inner join dbo.WIPLst_Master M ON D.ID = M.ID "

	IF nWO > 0
		cSQL = cSQL + " WHERE ( P.WO="+STR(nWO)
		IF Proper_SO_Item(cSOitem) != Proper_SO_Item("")
			cSQL = cSQL + " OR P.SOitem = dbo.f_ProperSOitem('"+cSOitem+"')" 
		ENDIF
		cSQL = cSQL + " ) "
	ELSE
		IF Proper_SO_Item(cSOitem) != Proper_SO_Item("")
			cSQL = cSQL + " WHERE P.SOitem = dbo.f_ProperSOitem('"+cSOitem+"')"
		ENDIF
	ENDIF
	
*	cSQL = cSQL + " AND P.Process_ID = 'SELECTED'"
	cSQL = cSQL + " AND ( P.Process_ID = 'SELECTED' OR P.Process_ID='PARTSELECT' ) "




	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Order' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPSTK_Order' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Order")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPSTK_Order")
			
			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		IF NOT SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPSTK_Order' )
			RecordError(nSQLEXEC,"SQL Error" ,"Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
	ENDIF
	
	IF USED('tmpPSTK_Order')
		IF RECCOUNT('tmpPSTK_Order') > 0
			lAnswer = .T.
			*
		ENDIF
		USE IN tmpPSTK_Order
	ENDIF
	
	IF lAnswer = .T.
		*Found more Selected entries.
	ELSE
	*IF NOT SELECTED Process are Found
		*Could check to see if Order looks complete
		*PRIVATE is_Order_Complete()
		*Answer is F
	ENDIF
	
	
	IF lNewConn
		SQLDISCONNECT(nConn )
	ENDIF

ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF


IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_StockLst:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lAnswer
ENDPROC
********************************* 
