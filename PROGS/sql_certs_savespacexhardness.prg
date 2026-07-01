* Ensure spacex form helper is available
IF TYPE('SqlCerts_GetFrmSpaceX') = 'U'
	SET PROCEDURE TO PROGS\sql_certs_spacex_form ADDITIVE
ENDIF

* sql_certs_savespacexhardness.prg - extracted from sql_certs (savespacexhardness); was >64KB in .sct memo
LPARAMETERS toFormSet
LOCAL loFrmSpaceX
loFrmSpaceX = SqlCerts_GetFrmSpaceX(toFormSet)

		*toFormSet.SaveSpaceXHardness
		
		PRIVATE lOK
		lOK = .T.
		PRIVATE cSQL	
		PRIVATE nSQLEXEC
		
		PRIVATE nCertID, nRockC
		nCertID	= PrepareSQLnum(toFormSet.ERPCert.PF1.pgCert.txtID.Value,'ID',-3)
		
		**********************************************************************
		IF loFrmSpaceX.txtN3875.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch= -3.875"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtN3875.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,-3.875"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtN3750.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch= -3.750"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtN3750.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,-3.750"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
		    *AND U.RockC=T.RockC "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET "
		    *T.CertID = U.CertID, T.Positive = U.Positive, T.Inch = U.Inch,"
		    cSQL = cSQL + " T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		
		IF loFrmSpaceX.txtN3625.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch= -3.625"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtN3625.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,-3.625"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtN3500.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch= -3.500"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtN3500.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,-3.500"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtN3375.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch= -3.375"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtN3375.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,-3.375"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtN3250.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch= -3.250"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtN3250.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,-3.250"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtN3125.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch= -3.125"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtN3125.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,-3.125"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtN3000.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch= -3.000"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtN3000.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,-3.000"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		**********************************************************************
		**********************************************************************
		
		IF loFrmSpaceX.txtN2875.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch= -2.875"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtN2875.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,-2.875"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtN2750.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch= -2.750"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtN2750.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,-2.750"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtN2625.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch= -2.625"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtN2625.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,-2.625"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtN2500.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch= -2.500"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtN2500.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,-2.500"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtN2375.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch= -2.375"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtN2375.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,-2.375"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtN2250.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch= -2.250"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtN2250.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,-2.250"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtN2125.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch= -2.125"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtN2125.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,-2.125"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtN2000.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch= -2.000"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtN2000.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,-2.000"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		**********************************************************************
		**********************************************************************
		
		IF loFrmSpaceX.txtN1875.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch= -1.875"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtN1875.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,-1.875"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtN1750.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch= -1.750"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtN1750.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,-1.750"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtN1625.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch= -1.625"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtN1625.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,-1.625"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtN1500.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch= -1.500"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtN1500.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,-1.500"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtN1375.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch= -1.375"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtN1375.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,-1.375"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtN1250.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch= -1.250"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtN1250.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,-1.250"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
				DO WHILE nSQLEXEC = 0
					WAIT WINDOW 'SQL 2' TIMEOUT 1
					nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
					IF nSQLEXEC < 0
						IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
							nSQLEXEC = 0
						ENDIF
					ENDIF
				ENDDO
			ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtN1125.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch= -1.125"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtN1125.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,-1.125"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
				DO WHILE nSQLEXEC = 0
					WAIT WINDOW 'SQL 2' TIMEOUT 1
					nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
					IF nSQLEXEC < 0
						IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
							nSQLEXEC = 0
						ENDIF
					ENDIF
				ENDDO
			ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtN1000.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch= -1.000"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtN1000.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,-1.000"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		**********************************************************************
		**********************************************************************
		
		IF loFrmSpaceX.txtN0875.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch= -0.875"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtN0875.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,-0.875"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtN0750.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch= -0.750"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtN0750.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,-0.750"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		
		IF loFrmSpaceX.txtN0625.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch= -0.625"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtN0625.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,-0.625"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtN0500.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch= -0.500"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtN0500.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,-0.500"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtN0375.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch= -0.375"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtN0375.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,-0.375"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtN0250.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch= -0.250"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtN0250.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,-0.250"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtN0125.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch= -0.125"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtN0125.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,-0.125"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		**********************************************************************
		*lPositive = .T.
		**********************************************************************
		
		IF loFrmSpaceX.txt0000.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch=0.000"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txt0000.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,0.000"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtP0125.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch=0.125"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtP0125.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,0.125"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtP0250.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch=0.250"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtP0250.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,0.250"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtP0375.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch=0.375"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtP0375.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,0.375"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtP0500.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch=0.500"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtP0500.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,0.500"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtP0625.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch=0.625"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtP0625.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,0.625"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtP0750.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch=0.750"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtP0750.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,0.750"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtP0875.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch=0.875"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtP0875.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,0.875"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtP1000.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch=1.000"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtP1000.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,1.000"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		**********************************************************************
		
		IF loFrmSpaceX.txtP1125.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch=1.125"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtP1125.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,1.125"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtP1250.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch=1.250"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtP1250.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,1.250"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtP1375.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch=1.375"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtP1375.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,1.375"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtP1500.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch=1.500"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtP1500.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,1.500"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtP1625.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch=1.625"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtP1625.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,1.625"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtP1750.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch=1.750"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtP1750.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,1.750"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtP1875.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch=1.875"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtP1875.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,1.875"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		**********************************************************************
		
		IF loFrmSpaceX.txtP2000.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch=2.000"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtP2000.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,2.000"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtP2125.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch=2.125"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtP2125.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,2.125"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtP2250.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch=2.250"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtP2250.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,2.250"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtP2375.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch=2.375"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtP2375.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,2.375"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtP2500.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch=2.500"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtP2500.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,2.500"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtP2625.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch=2.625"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtP2625.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,2.625"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtP2750.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch=2.750"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtP2750.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,2.750"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtP2875.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch=2.875"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtP2875.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,2.875"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		**********************************************************************
		
		IF loFrmSpaceX.txtP3000.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch=3.000"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtP3000.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,3.000"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtP3125.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch=3.125"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtP3125.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,3.125"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtP3250.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch=3.250"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtP3250.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,3.250"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtP3375.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch=3.375"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtP3375.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,3.375"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtP3500.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch=3.500"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtP3500.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,3.500"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtP3625.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch=3.625"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtP3625.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,3.625"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtP3750.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch=3.750"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtP3750.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,3.750"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		IF loFrmSpaceX.txtP3875.Value = 0
			cSQL = "DELETE FROM dbo.Cert_RC_profile WHERE CertID="+ALLTRIM(STR(nCertID))+" AND Inch=3.875"
		ELSE
			nRockC = PrepareSQLnum(loFrmSpaceX.txtP3875.Value,'RockC',4,1)
			cSQL = " MERGE dbo.Cert_RC_profile WITH (SERIALIZABLE) AS T "
			cSQL = cSQL + " USING (VALUES ("
			cSQL = cSQL + " "+STR(nCertID)
			cSQL = cSQL + " ,3.875"
			cSQL = cSQL + " ,"+STR(nRockC,4,1)
			cSQL = cSQL + " )) AS U (CertID, Inch, RockC)"
		    cSQL = cSQL + "		ON U.CertID=T.CertID AND U.Inch = T.Inch "
			cSQL = cSQL + " WHEN MATCHED THEN "
		    cSQL = cSQL + " 	UPDATE SET T.RockC = U.RockC "
			cSQL = cSQL + " WHEN NOT MATCHED THEN "
			cSQL = cSQL + "     INSERT (CertID, Inch, RockC) "
			cSQL = cSQL + "     VALUES (U.CertID, U.Inch, U.RockC);"
		    
		ENDIF
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, '')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, '')
		ENDIF
		**********************************************************************
		
		RETURN lOK
