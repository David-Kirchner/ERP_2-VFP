PARAMETER pID, pConn

IF TYPE("pID")!="N"
	RETURN .F.
ENDIF
IF TYPE("pConn")!="N"
	RETURN .F.
ENDIF
IF TYPE("lForceDelete") != "L"
	lForceDelete = .F.
ENDIF

PRIVATE cSQL, nSQLEXEC
IF USED('tmpCountDetails')
	USE IN tmpCountDetails
ENDIF

SELECT 0
cSQL = "SELECT COUNT(*) AS CNT FROM dbo.StockLst_Detail WHERE ID = "+ STR(pID)
nSQLEXEC = SQLEXEC(pConn, cSQL, 'tmpCountDetails' )

IF nSQLEXEC < 1
	SQLEXECError(cSQL)
	IF USED('tmpCountDetails')
		USE IN tmpCountDetails
	ENDIF
	RETURN .F.
ELSE
	IF USED('tmpCountDetails')
		IF tmpCountDetails.CNT > 0
			*IF MESSAGEBOX("Are you sure you want to delete the Detail Record"+IIF(tmpCountDetails.CNT>1,"s","")+"?",4+32,"Confirm Delete") = 6
			IF .T.
				cSQL_Delete="DELETE FROM dbo.StockLst_Detail WHERE ID = "+STR(pID)
				nSQLEXEC = SQLEXEC(pConn, cSQL_Delete )
				IF nSQLEXEC < 1
					SQLEXECError(cSQL_Delete)
					IF USED('tmpCountDetails')
						USE IN tmpCountDetails
					ENDIF
					RETURN .F.
				ELSE
					=SQLCOMMIT(pConn)
				ENDIF
			ENDIF
		ELSE
			MESSAGEBOX("No Detail record found.",0,"Nothing to delete!")
		ENDIF
		USE IN tmpCountDetails
	ENDIF
ENDIF

RETURN .T.
