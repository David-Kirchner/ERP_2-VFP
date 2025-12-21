PARAMETER pID, pConn, plForceDelete
*Remove_StockLst_ID(nMaster_ID,nConnHandle,lForceDelete)

IF TYPE("pID")!="N"
	RETURN .F.
ENDIF
IF TYPE("pConn")!="N"
	RETURN .F.
ENDIF
IF TYPE("plForceDelete") != "L"
	lForceDelete = .F.
ELSE
	lForceDelete = plForceDelete
ENDIF

PRIVATE cSQL, nSQLEXEC 
**Check for Detail First
IF USED('tmpCountDetail')
	USE IN tmpCountDetail
ENDIF

SELECT 0
cSQL = "SELECT COUNT(*) AS CNT FROM dbo.StockLst_Detail WHERE ID = "+ STR(pID)
nSQLEXEC = SQLEXEC(pConn, cSQL, 'tmpCountDetail' )

IF nSQLEXEC < 1
	SQLEXECError(cSQL)
	IF USED('tmpCountDetail')
		USE IN tmpCountDetail
	ENDIF
	RETURN .F.
ELSE
	IF USED('tmpCountDetail')
		DO WHILE tmpCountDetail.CNT > 0
			IF lForceDelete
				*Remove Detail and Count again
				Remove_StockLst_Detail_by_MasterID(pID,pConn)
				IF USED('tmpCountDetail')
					USE IN tmpCountDetail
				ENDIF

				SELECT 0
				cSQL = "SELECT COUNT(*) AS CNT FROM dbo.StockLst_Detail WHERE ID = "+ STR(pID)
				nSQLEXEC = SQLEXEC(pConn, cSQL, 'tmpCountDetail' )

				IF nSQLEXEC < 1
					SQLEXECError(cSQL)
					IF USED('tmpCountDetail')
						USE IN tmpCountDetail
					ENDIF
					RETURN .F.
				ENDIF
			ELSE
				MESSAGEBOX("A Detail record is dependant on this Master record."+CHR(13)+;
				  "You must remove the detail record first.",0,"You cannot delete!")
				IF USED('tmpCountDetail')
					USE IN tmpCountDetail
				ENDIF
				RETURN .F.
			ENDIF
		ENDDO
		
		
		IF tmpCountDetail.CNT = 0
*			IF MESSAGEBOX("Are you sure you want to delete this Master Record?",4+32,"Confirm Delete") = 6
			cSQL_Delete="DELETE FROM StockLst_Master WHERE ID = "+STR(pID)
			nSQLEXEC = SQLEXEC(pConn, cSQL_Delete )
			IF nSQLEXEC < 1
				SQLEXECError(cSQL_Delete )
				IF USED('tmpCountDetail')
					USE IN tmpCountDetail
				ENDIF
				RETURN .F.
			ELSE
				=SQLCOMMIT(pConn)
			ENDIF
		ENDIF
		USE IN tmpCountDetail
	ENDIF
ENDIF

RETURN .T.
