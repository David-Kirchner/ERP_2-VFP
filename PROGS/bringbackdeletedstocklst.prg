*Bring back deletes StockLst records.

PRIVATE  lNewConn, cSQL, nID
lNewConn = .F.
nID = 0
? "------------------------------------------------------------------------------------------"
IF NOT "PROC_SQL" $ SET("PROCEDURE")  &&Added for when Quotes is run without HPA menu.
	SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
ENDIF

pConn = get_SQLSTRINGCONNECT()

IF pConn  < 1
	MESSAGEBOX('Could not make connection')
	RETURN .F.
ENDIF

lNewConn = .T.

IF USED('tmpMissingID')
	USE IN tmpMissingID
ENDIF
SELECT 0

cSQL = "SELECT ID_Detail FROM dbo.[AR.StockLst_Process_History] WITH(NOLOCK) WHERE [When] > '2008-05-22' AND [Who] = 'WINDFALL\David Kirchner' AND [WHAT]='DELETE' AND Process_ID = 'CORRECTION'"

nSQLEXEC = SQLEXEC(pConn, cSQL, 'tmpMissingID' )
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(pConn,  cSQL, 'tmpMissingID' )
ENDDO
IF nSQLEXEC < 0
	SQLEXECError(cSQL, pConn, nSQLEXEC, 'tmpMissingID')
ENDIF

IF USED('tmpMissingID')
	SCAN
		? RECNO('tmpMissingID')
		***
		nID_Detail = tmpMissingID.ID_Detail
		
		IF nID_Detail = 1815
			Loop	
		ENDIF
		
		IF USED('tmpMasterID')
			USE IN tmpMasterID
		ENDIF
		SELECT 0
	
		*Get Master ID
		cSQL =  "SELECT ID FROM HPAlloy4.dbo.StockLst_Detail WHERE ID_Detail = "+STR( nID_Detail )
		
		nSQLEXEC = SQLEXEC(pConn, cSQL, 'tmpMasterID' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(pConn,  cSQL, 'tmpMasterID' )
		ENDDO
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, pConn, nSQLEXEC, 'tmpMasterID')
		ENDIF		
		nMasterID = 0
		IF USED('tmpMasterID')
			nMasterID = tmpMasterID.ID
		ENDIF
		
		IF nMasterID = 0
			*Get Master ID From History
			cSQL =  "SELECT ID FROM dbo.[AR.StockLst_Detail_History] WITH(NOLOCK) WHERE ID_Detail = "+STR( nID_Detail )
			
			nSQLEXEC = SQLEXEC(pConn, cSQL, 'tmpMasterID' )
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL' TIMEOUT 1
				nSQLEXEC = SQLEXEC(pConn,  cSQL, 'tmpMasterID' )
			ENDDO
			IF nSQLEXEC < 0
				SQLEXECError(cSQL, pConn, nSQLEXEC, 'tmpMasterID')
			ENDIF		
			IF USED('tmpMasterID')
				nMasterID = tmpMasterID.ID
				IF nMasterID > 0
					?? "Got Master ID From History "+ALLTRIM(STR(nMasterID))
				ENDIF
			ENDIF
		ENDIF
		
		IF nMasterID > 0
			*Check to see if Master ID exists
		
			IF USED('tmpCntMasterID')
				USE IN tmpCntMasterID
			ENDIF
			SELECT 0
		
			*Get Master ID
			cSQL =  "SELECT COUNT(*) AS CNTD FROM dbo.StockLst_Master WHERE ID = "+STR(nMasterID)
			
			nSQLEXEC = SQLEXEC(pConn, cSQL, 'tmpCntMasterID' )
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL' TIMEOUT 1
				nSQLEXEC = SQLEXEC(pConn,  cSQL, 'tmpCntMasterID' )
			ENDDO
			IF nSQLEXEC < 0
				SQLEXECError(cSQL, pConn, nSQLEXEC, 'tmpCntMasterID')
			ENDIF		

			IF USED('tmpCntMasterID')
				IF tmpCntMasterID.CNTD = 0
					*Add Master
					
					IF USED('tmpMasterID4')
						USE IN tmpMasterID4
					ENDIF
					SELECT 0
					
					*Count in hpalloy4
					cSQL =  "SELECT COUNT(*) AS Cntd FROM HPAlloy4.dbo.StockLst_Master WHERE ID = "+STR(nMasterID)
					nSQLEXEC = SQLEXEC(pConn, cSQL, 'tmpMasterID4' )
					DO WHILE nSQLEXEC = 0
						WAIT WINDOW 'SQL' TIMEOUT 1
						nSQLEXEC = SQLEXEC(pConn,  cSQL, 'tmpMasterID4' )
					ENDDO
					IF nSQLEXEC < 0
						SQLEXECError(cSQL, pConn, nSQLEXEC, 'tmpMasterID4' )
					ENDIF
					
					nMasterID4 = 0
					IF USED('tmpMasterID4')
						nMasterID4 = tmpMasterID4.Cntd
					ENDIF
					IF nMasterID4 > 0
						cSQLi = "SET IDENTITY_INSERT dbo.StockLst_Master ON "
						cSQLi = cSQLi + " INSERT INTO dbo.StockLst_Master ([ID],[alloy],[form],[size],[heat]) VALUES ("+STR(nMasterID)+",'','',0,'')"
						nSQLEXEC = SQLEXEC(pConn, cSQLi )
						DO WHILE nSQLEXEC = 0
							WAIT WINDOW 'SQL' TIMEOUT 1
							nSQLEXEC = SQLEXEC(pConn,  cSQLi )
						ENDDO
						IF nSQLEXEC < 0
							SQLEXECError(cSQLi, pConn, nSQLEXEC )
						ELSE
							?? " Inserted Blank StockLstMaster. "
						ENDIF
						
						
						cSQLi = "SET IDENTITY_INSERT dbo.StockLst_Master OFF "
						nSQLEXEC = SQLEXEC(pConn, cSQLi )
						DO WHILE nSQLEXEC = 0
							WAIT WINDOW 'SQL' TIMEOUT 1
							nSQLEXEC = SQLEXEC(pConn,  cSQLi )
						ENDDO
						
						cSQL = "UPDATE dbo.StockLst_Master SET "
						cSQL =  cSQL + " [Alloy] = SM4.[Alloy] "
						cSQL =  cSQL + ",[form]=SM4.[form]"
						cSQL =  cSQL + ",[cc]=SM4.[cc]"
						cSQL =  cSQL + ",[size]=SM4.[size]"
						cSQL =  cSQL + ",[cond]=SM4.[cond]"
						cSQL =  cSQL + ",[mweight]=SM4.[mWeight]"
						cSQL =  cSQL + ",[specs]=SM4.[specs]"
						cSQL =  cSQL + ",[heat]=SM4.[heat]"
						cSQL =  cSQL + ",[lot]=SM4.[lot]"
						cSQL =  cSQL + ",[Paid]=SM4.[paid]"
						cSQL =  cSQL + ",[po_item]=SM4.[PO_Item]"
						cSQL =  cSQL + ",[poduedate]=SM4.[poduedate]"
						cSQL =  cSQL + ",[mill]=SM4.[mill]"
						cSQL =  cSQL + ",[stkdate]=SM4.[stkdate]"
						cSQL =  cSQL + ",[history]=SM4.[history]"
						cSQL =  cSQL + ",[num]=SM4.[num]"
						cSQL =  cSQL + ",[POStatus]=SM4.[POStatus]"
						cSQL =  cSQL + ",[BrandName]=SM4.[BrandName]"
						cSQL =  cSQL + ",[FROM_ID]=SM4.[FROM_ID]"
						cSQL =  cSQL + " FROM HPALLOY4.dbo.StockLst_MASTER SM4 "
						cSQL =  cSQL + " WHERE StockLst_Master.ID = SM4.ID"
						cSQL =  cSQL + " AND StockLst_Master.ID = "+STR(nMasterID)

						nSQLEXEC = SQLEXEC(pConn, cSQL )
						DO WHILE nSQLEXEC = 0
							WAIT WINDOW 'SQL' TIMEOUT 1
							nSQLEXEC = SQLEXEC(pConn,  cSQL )
						ENDDO
						IF nSQLEXEC < 0
							SQLEXECError(cSQL, pConn, nSQLEXEC )
						ELSE
							?? " Master added for ID Detail:"+ALLTRIM(STR( nID_Detail ))
						ENDIF
					ELSE
						*Check History
						*Count in hpalloy4
						IF USED('tmpMasterID4Hist')
							USE IN tmpMasterID4Hist
						ENDIF
						SELECT 0
						
						cSQL = " SELECT COUNT(*) AS CNTD FROM dbo.[AR.StockLst_Master_History] WITH(NOLOCK) WHERE [ID] = "+STR(nMasterID)
						cSQL = cSQL + " AND [WHAT] = 'ADD    '"
						nSQLEXEC = SQLEXEC(pConn, cSQL, 'tmpMasterID4Hist' )
						DO WHILE nSQLEXEC = 0
							WAIT WINDOW 'SQL' TIMEOUT 1
							nSQLEXEC = SQLEXEC(pConn,  cSQL, 'tmpMasterID4Hist' )
						ENDDO
						IF nSQLEXEC < 0
							SQLEXECError(cSQL, pConn, nSQLEXEC, 'tmpMasterID4Hist' )
						ENDIF
						
						nMasterID4H = 0
						IF USED('tmpMasterID4Hist')
							nMasterID4H = tmpMasterID4Hist.Cntd
						ENDIF
						
						IF nMasterID4H > 0
							cSQLi = "SET IDENTITY_INSERT dbo.StockLst_Master ON "
							cSQLi = cSQLi + " INSERT INTO dbo.StockLst_Master ([ID],[alloy],[form],[size],[heat]) VALUES ("+STR(nMasterID)+",'','',0,'')"
							nSQLEXEC = SQLEXEC(pConn, cSQLi )
							DO WHILE nSQLEXEC = 0
								WAIT WINDOW 'SQL' TIMEOUT 1
								nSQLEXEC = SQLEXEC(pConn,  cSQLi )
							ENDDO
							IF nSQLEXEC < 0
								SQLEXECError(cSQLi, pConn, nSQLEXEC )
							ELSE
								?? " Inserted Blank StockLst_Master. "
							ENDIF
							
							cSQLi = "SET IDENTITY_INSERT dbo.StockLst_Master OFF "
							nSQLEXEC = SQLEXEC(pConn, cSQLi )
							DO WHILE nSQLEXEC = 0
								WAIT WINDOW 'SQL' TIMEOUT 1
								nSQLEXEC = SQLEXEC(pConn,  cSQLi )
							ENDDO
							
							
							*********
							**Check - It found the Wrong data to update! 
							**Use Hpalloy4.dbo.StockLst_Master over dbo.[AR.StockLst_MASTER_History] SMH WITH (NOLOCK) "
							**  AND SMH.[WHAT] = 'DELETE    '
							
							cSQL = "UPDATE dbo.StockLst_Master SET "
							cSQL =  cSQL + " [Alloy]=SMH.[Alloy]"
							cSQL =  cSQL + ",[form]=SMH.[form]"
							cSQL =  cSQL + ",[cc]=SMH.[cc]"
							cSQL =  cSQL + ",[size]=SMH.[size]"
							cSQL =  cSQL + ",[cond]=SMH.[cond]"
							cSQL =  cSQL + ",[mweight]=SMH.[mWeight]"
							cSQL =  cSQL + ",[specs]=SMH.[specs]"
							cSQL =  cSQL + ",[heat]=SMH.[heat]"
							cSQL =  cSQL + ",[lot]=SMH.[lot]"
							cSQL =  cSQL + ",[Paid]=SMH.[paid]"
							cSQL =  cSQL + ",[po_item]=SMH.[PO_Item]"
							cSQL =  cSQL + ",[poduedate]=SMH.[poduedate]"
							cSQL =  cSQL + ",[mill]=SMH.[mill]"
							cSQL =  cSQL + ",[stkdate]=SMH.[stkdate]"
							cSQL =  cSQL + ",[history]=SMH.[history]"
							cSQL =  cSQL + ",[num]=SMH.[num]"
							cSQL =  cSQL + ",[POStatus]=SMH.[POStatus]"
							cSQL =  cSQL + ",[BrandName]=SMH.[BrandName]"
							cSQL =  cSQL + ",[FROM_ID]=SMH.[FROM_ID]"
							cSQL =  cSQL + " FROM dbo.[Ar.StockLst_MASTER_history] SMH WITH(NOLOCK) "
							cSQL =  cSQL + " WHERE StockLst_Master.ID = SMH.ID"
							cSQL =  cSQL + " AND SMH.[WHAT] = 'ADD    '"
							cSQL =  cSQL + " AND StockLst_Master.ID = "+STR(nMasterID)
							
							
							nSQLEXEC = SQLEXEC(pConn, cSQL )
							DO WHILE nSQLEXEC = 0
								WAIT WINDOW 'SQL' TIMEOUT 1
								nSQLEXEC = SQLEXEC(pConn,  cSQL )
							ENDDO
							IF nSQLEXEC < 0
								SQLEXECError(cSQL, pConn, nSQLEXEC )
							ELSE
								?? " Master Updated from history for ID Detail:"+ALLTRIM(STR( nID_Detail ))
							ENDIF
							
						ELSE
							?? "- Master not added for ID Detail:"+ALLTRIM(STR( nID_Detail ))+" Master not found in History"
						ENDIF
					ENDIF
					
				ELSE
					?? " Master found for ID Detail:"+ALLTRIM(STR( nID_Detail ))
					
					*Check Master ID Alloy, etc...
				
						cSQL = "UPDATE dbo.StockLst_Master SET "
						cSQL =  cSQL + " [Alloy]=SMH.[Alloy]"
						cSQL =  cSQL + ",[form]=SMH.[form]"
						cSQL =  cSQL + ",[cc]=SMH.[cc]"
						cSQL =  cSQL + ",[size]=SMH.[size]"
						cSQL =  cSQL + ",[cond]=SMH.[cond]"
						cSQL =  cSQL + ",[mweight]=SMH.[mWeight]"
						cSQL =  cSQL + ",[specs]=SMH.[specs]"
						cSQL =  cSQL + ",[heat]=SMH.[heat]"
						cSQL =  cSQL + ",[lot]=SMH.[lot]"
						cSQL =  cSQL + ",[Paid]=SMH.[paid]"
						cSQL =  cSQL + ",[po_item]=SMH.[PO_Item]"
						cSQL =  cSQL + ",[poduedate]=SMH.[poduedate]"
						cSQL =  cSQL + ",[mill]=SMH.[mill]"
						cSQL =  cSQL + ",[stkdate]=SMH.[stkdate]"
						cSQL =  cSQL + ",[history]=SMH.[history]"
						cSQL =  cSQL + ",[num]=SMH.[num]"
						cSQL =  cSQL + ",[POStatus]=SMH.[POStatus]"
						cSQL =  cSQL + ",[BrandName]=SMH.[BrandName]"
						cSQL =  cSQL + ",[FROM_ID]=SMH.[FROM_ID]"
						cSQL =  cSQL + " FROM Hpalloy4.dbo.StockLst_Master SMH "
						cSQL =  cSQL + " WHERE StockLst_Master.ID = SMH.ID"
						cSQL =  cSQL + " AND StockLst_Master.ID = "+STR(nMasterID)
						
						
						nSQLEXEC = SQLEXEC(pConn, cSQL )
						DO WHILE nSQLEXEC = 0
							WAIT WINDOW 'SQL' TIMEOUT 1
							nSQLEXEC = SQLEXEC(pConn,  cSQL )
						ENDDO
						IF nSQLEXEC < 0
							SQLEXECError(cSQL, pConn, nSQLEXEC )
						ELSE
							?? " Master rewritten! "
						ENDIF
				
				
					
				ENDIF
			ELSE
				?? "- Master not found for ID Detail:"+ALLTRIM(STR( nID_Detail ))+", Table 'tmpCntMasterID' not opened."
			ENDIF
		ELSE
			?? "- Master not found for ID Detail:"+ALLTRIM(STR( nID_Detail ))+", Master ID = 0"
		ENDIF
		
		IF nMasterID > 0
			*** Add Detail
			
			*Check for Detail
			IF USED('tmpCntDetail')
				USE IN tmpCntDetail
			ENDIF
			SELECT 0
			
			cSQL =  "SELECT COUNT(*) AS CNTD FROM dbo.StockLst_Detail WHERE ID_Detail = "+STR( nID_Detail )
			
			nSQLEXEC = SQLEXEC(pConn, cSQL, 'tmpCntDetail' )
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL' TIMEOUT 1
				nSQLEXEC = SQLEXEC(pConn,  cSQL, 'tmpCntDetail' )
			ENDDO
			IF nSQLEXEC < 0
				SQLEXECError(cSQL, pConn, nSQLEXEC, 'tmpCntDetail')
			ENDIF		
			
			IF USED('tmpCntDetail')
				IF tmpCntDetail.Cntd > 0
					?? " Detail found for Detail ID:"+ALLTRIM(STR( nID_Detail ))
				ELSE
					** Add Detail	
					cSQLi = "SET IDENTITY_INSERT dbo.StockLst_Detail ON "
					cSQLi = cSQLi + CHR(10)+CHR(13)
					cSQLi = cSQLi + " INSERT INTO dbo.StockLst_Detail ([DIM1],[Weight],[S_P],[ID],[ID_Detail]) VALUES (0,0,0,"+STR(nMasterID)+","+STR(nID_Detail)+")"
					nSQLEXEC = SQLEXEC(pConn, cSQLi )
					DO WHILE nSQLEXEC = 0
						WAIT WINDOW 'SQL' TIMEOUT 1
						nSQLEXEC = SQLEXEC(pConn,  cSQLi )
					ENDDO
					IF nSQLEXEC < 0
						SQLEXECError(cSQLi, pConn, nSQLEXEC )
					ELSE
						?? " Inserted Blank StockLst_Detail. "
					ENDIF
					
					cSQLi = "SET IDENTITY_INSERT dbo.StockLst_Detail OFF "
					nSQLEXEC = SQLEXEC(pConn, cSQLi )
					DO WHILE nSQLEXEC = 0
						WAIT WINDOW 'SQL' TIMEOUT 1
						nSQLEXEC = SQLEXEC(pConn,  cSQLi )
					ENDDO
					
					cSQL = "UPDATE dbo.StockLst_Detail SET "
					cSQL =  cSQL + "[size_h]=SD.[size_h]"
					cSQL =  cSQL + ",[size_l]=SD.[size_l]"
					cSQL =  cSQL + ",[pc]=SD.[pc]"
					cSQL =  cSQL + ",[dim1]=SD.[dim1]"
					cSQL =  cSQL + ",[dim2]=SD.[dim2]"
					cSQL =  cSQL + ",[dim3]=SD.[dim3]"
					cSQL =  cSQL + ",[length]=SD.[length]"
					cSQL =  cSQL + ",[weight]=SD.[weight]"
					*cSQL =  cSQL + ",[costvalue]=SD.[costvalue]"
					cSQL =  cSQL + ",[descript]=SD.[descript]"
					cSQL =  cSQL + ",[location]=SD.[location]"
					cSQL =  cSQL + ",[floorstatus]=SD.[floorstatus]"
					cSQL =  cSQL + ",[class]=SD.[class]"
					cSQL =  cSQL + ",[unit]=SD.[unit]"
					cSQL =  cSQL + ",[RandLen]=SD.[RandLen]"
					cSQL =  cSQL + ",[InvCheck]=SD.[InvCheck]"
					cSQL =  cSQL + ",[id]=SD.[id]"
					cSQL =  cSQL + ",[ReceivingID]=SD.[ReceivingID]"
					
					cSQL =  cSQL + ",S_QTY=SD.S_QTY"
					cSQL =  cSQL + ",S_P= ISNULL(SD.S_P,SD.CostValue) "
					cSQL =  cSQL + ",S_Total= ISNULL(SD.S_Total,(SD.S_QTY*ISNULL(SD.S_P,SD.CostValue)))"
					cSQL =  cSQL + ",S_PU=SD.S_PU"
					
					cSQL =  cSQL + " FROM dbo.[Ar.StockLst_Detail_History] SD WITH(NOLOCK) "
					cSQL =  cSQL + " WHERE StockLst_Detail.ID_Detail = SD.ID_Detail"
					cSQL =  cSQL + " AND SD.[WHAT] = 'DELETE    '"
					cSQL =  cSQL + " AND StockLst_Detail.ID_Detail = "+STR( nID_Detail )


					nSQLEXEC = SQLEXEC(pConn, cSQL )
					DO WHILE nSQLEXEC = 0
						WAIT WINDOW 'SQL' TIMEOUT 1
						nSQLEXEC = SQLEXEC(pConn,  cSQL )
					ENDDO
					IF nSQLEXEC < 0
						SQLEXECError(cSQL, pConn, nSQLEXEC )
					ELSE
						?? "Detail Updated for Detail ID:"+ALLTRIM(STR( nID_Detail ))
					ENDIF
				
				ENDIF
			ELSE
				?? "- Table 'tmpCntDetail' not opened"
			ENDIF
		ELSE
			?? "- Detail Skipped Since Master ID = 0"
		ENDIF
		
		IF MESSAGEBOX("Do you want to continue?",4+32,"Continue") != 6
			RETURN
		ENDIF
		
		SELECT tmpMissingID
	ENDSCAN
	USE IN tmpMissingID
ENDIF

IF lNewConn 
	SQLDISCONNECT(pConn )
ENDIF