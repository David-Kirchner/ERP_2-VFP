* sql_certs_spacex_form.prg - runtime frmSpaceX launcher + show/enable helpers

FUNCTION SqlCerts_GetFrmSpaceX
	LPARAMETERS toFormSet
	LOCAL loFrm
	IF VARTYPE(toFormSet.oFrmSpaceX) = "O" AND !ISNULL(toFormSet.oFrmSpaceX)
		IF TYPE("toFormSet.oFrmSpaceX.Name") = "C"
			RETURN toFormSet.oFrmSpaceX
		ENDIF
	ENDIF
	DO FORM Forms\sql_certs_frmSpaceX WITH toFormSet NAME loFrm LINK NOSHOW
	toFormSet.oFrmSpaceX = loFrm
	RETURN loFrm
ENDFUNC

PROCEDURE SqlCerts_ReleaseFrmSpaceX
	LPARAMETERS toFormSet
	IF VARTYPE(toFormSet.oFrmSpaceX) = "O"
		toFormSet.oFrmSpaceX.Release
		toFormSet.oFrmSpaceX = .NULL.
	ENDIF
ENDPROC

PROCEDURE SqlCerts_EnableSpaceXHardness
	LPARAMETERS toFormSet, lEnable
	LOCAL loFrmSpaceX
	loFrmSpaceX = SqlCerts_GetFrmSpaceX(toFormSet)
		IF lEnable
		
			loFrmSpaceX.txtN3875.Enabled = .T.
			loFrmSpaceX.txtN3750.Enabled = .T.
			loFrmSpaceX.txtN3625.Enabled = .T.
			loFrmSpaceX.txtN3500.Enabled = .T.
			loFrmSpaceX.txtN3375.Enabled = .T.
			loFrmSpaceX.txtN3250.Enabled = .T.
			loFrmSpaceX.txtN3125.Enabled = .T.
			loFrmSpaceX.txtN3000.Enabled = .T.
		
			loFrmSpaceX.txtN2875.Enabled = .T.
			loFrmSpaceX.txtN2750.Enabled = .T.
			loFrmSpaceX.txtN2625.Enabled = .T.
			loFrmSpaceX.txtN2500.Enabled = .T.
			loFrmSpaceX.txtN2375.Enabled = .T.
			loFrmSpaceX.txtN2250.Enabled = .T.
			loFrmSpaceX.txtN2125.Enabled = .T.
			loFrmSpaceX.txtN2000.Enabled = .T.
		
			loFrmSpaceX.txtN1875.Enabled = .T.
			loFrmSpaceX.txtN1750.Enabled = .T.
			loFrmSpaceX.txtN1625.Enabled = .T.
			loFrmSpaceX.txtN1500.Enabled = .T.
			loFrmSpaceX.txtN1375.Enabled = .T.
			loFrmSpaceX.txtN1250.Enabled = .T.
			loFrmSpaceX.txtN1125.Enabled = .T.
			loFrmSpaceX.txtN1000.Enabled = .T.
		
			loFrmSpaceX.txtN0875.Enabled = .T.
			loFrmSpaceX.txtN0750.Enabled = .T.
			loFrmSpaceX.txtN0625.Enabled = .T.
			loFrmSpaceX.txtN0500.Enabled = .T.
			loFrmSpaceX.txtN0375.Enabled = .T.
			loFrmSpaceX.txtN0250.Enabled = .T.
			loFrmSpaceX.txtN0125.Enabled = .T.
		
			loFrmSpaceX.txt0000.Enabled = .T.
		
			loFrmSpaceX.txtP0125.Enabled = .T.
			loFrmSpaceX.txtP0250.Enabled = .T.
			loFrmSpaceX.txtP0375.Enabled = .T.
			loFrmSpaceX.txtP0500.Enabled = .T.
			loFrmSpaceX.txtP0625.Enabled = .T.
			loFrmSpaceX.txtP0750.Enabled = .T.
			loFrmSpaceX.txtP0875.Enabled = .T.
			loFrmSpaceX.txtP1000.Enabled = .T.
		
			loFrmSpaceX.txtP1125.Enabled = .T.
			loFrmSpaceX.txtP1250.Enabled = .T.
			loFrmSpaceX.txtP1375.Enabled = .T.
			loFrmSpaceX.txtP1500.Enabled = .T.
			loFrmSpaceX.txtP1625.Enabled = .T.
			loFrmSpaceX.txtP1750.Enabled = .T.
			loFrmSpaceX.txtP1875.Enabled = .T.
			loFrmSpaceX.txtP2000.Enabled = .T.
		
			loFrmSpaceX.txtP2125.Enabled = .T.
			loFrmSpaceX.txtP2250.Enabled = .T.
			loFrmSpaceX.txtP2375.Enabled = .T.
			loFrmSpaceX.txtP2500.Enabled = .T.
			loFrmSpaceX.txtP2625.Enabled = .T.
			loFrmSpaceX.txtP2750.Enabled = .T.
			loFrmSpaceX.txtP2875.Enabled = .T.
			loFrmSpaceX.txtP3000.Enabled = .T.
		
			loFrmSpaceX.txtP3125.Enabled = .T.
			loFrmSpaceX.txtP3250.Enabled = .T.
			loFrmSpaceX.txtP3375.Enabled = .T.
			loFrmSpaceX.txtP3500.Enabled = .T.
			loFrmSpaceX.txtP3625.Enabled = .T.
			loFrmSpaceX.txtP3750.Enabled = .T.
			loFrmSpaceX.txtP3875.Enabled = .T.
			loFrmSpaceX.txtP3000.Enabled = .T.
			
		ELSE
		
			loFrmSpaceX.txtN3875.Enabled = .F.
			loFrmSpaceX.txtN3750.Enabled = .F.
			loFrmSpaceX.txtN3625.Enabled = .F.
			loFrmSpaceX.txtN3500.Enabled = .F.
			loFrmSpaceX.txtN3375.Enabled = .F.
			loFrmSpaceX.txtN3250.Enabled = .F.
			loFrmSpaceX.txtN3125.Enabled = .F.
			loFrmSpaceX.txtN3000.Enabled = .F.
		
			loFrmSpaceX.txtN2875.Enabled = .F.
			loFrmSpaceX.txtN2750.Enabled = .F.
			loFrmSpaceX.txtN2625.Enabled = .F.
			loFrmSpaceX.txtN2500.Enabled = .F.
			loFrmSpaceX.txtN2375.Enabled = .F.
			loFrmSpaceX.txtN2250.Enabled = .F.
			loFrmSpaceX.txtN2125.Enabled = .F.
			loFrmSpaceX.txtN2000.Enabled = .F.
		
			loFrmSpaceX.txtN1875.Enabled = .F.
			loFrmSpaceX.txtN1750.Enabled = .F.
			loFrmSpaceX.txtN1625.Enabled = .F.
			loFrmSpaceX.txtN1500.Enabled = .F.
			loFrmSpaceX.txtN1375.Enabled = .F.
			loFrmSpaceX.txtN1250.Enabled = .F.
			loFrmSpaceX.txtN1125.Enabled = .F.
			loFrmSpaceX.txtN1000.Enabled = .F.
		
			loFrmSpaceX.txtN0875.Enabled = .F.
			loFrmSpaceX.txtN0750.Enabled = .F.
			loFrmSpaceX.txtN0625.Enabled = .F.
			loFrmSpaceX.txtN0500.Enabled = .F.
			loFrmSpaceX.txtN0375.Enabled = .F.
			loFrmSpaceX.txtN0250.Enabled = .F.
			loFrmSpaceX.txtN0125.Enabled = .F.
		
			loFrmSpaceX.txt0000.Enabled = .F.
		
			loFrmSpaceX.txtP0125.Enabled = .F.
			loFrmSpaceX.txtP0250.Enabled = .F.
			loFrmSpaceX.txtP0375.Enabled = .F.
			loFrmSpaceX.txtP0500.Enabled = .F.
			loFrmSpaceX.txtP0625.Enabled = .F.
			loFrmSpaceX.txtP0750.Enabled = .F.
			loFrmSpaceX.txtP0875.Enabled = .F.
			loFrmSpaceX.txtP1000.Enabled = .F.
		
			loFrmSpaceX.txtP1125.Enabled = .F.
			loFrmSpaceX.txtP1250.Enabled = .F.
			loFrmSpaceX.txtP1375.Enabled = .F.
			loFrmSpaceX.txtP1500.Enabled = .F.
			loFrmSpaceX.txtP1625.Enabled = .F.
			loFrmSpaceX.txtP1750.Enabled = .F.
			loFrmSpaceX.txtP1875.Enabled = .F.
			loFrmSpaceX.txtP2000.Enabled = .F.
		
			loFrmSpaceX.txtP2125.Enabled = .F.
			loFrmSpaceX.txtP2250.Enabled = .F.
			loFrmSpaceX.txtP2375.Enabled = .F.
			loFrmSpaceX.txtP2500.Enabled = .F.
			loFrmSpaceX.txtP2625.Enabled = .F.
			loFrmSpaceX.txtP2750.Enabled = .F.
			loFrmSpaceX.txtP2875.Enabled = .F.
			loFrmSpaceX.txtP3000.Enabled = .F.
		
			loFrmSpaceX.txtP3125.Enabled = .F.
			loFrmSpaceX.txtP3250.Enabled = .F.
			loFrmSpaceX.txtP3375.Enabled = .F.
			loFrmSpaceX.txtP3500.Enabled = .F.
			loFrmSpaceX.txtP3625.Enabled = .F.
			loFrmSpaceX.txtP3750.Enabled = .F.
			loFrmSpaceX.txtP3875.Enabled = .F.
			loFrmSpaceX.txtP3000.Enabled = .F.
			
		ENDIF
ENDPROC

PROCEDURE SqlCerts_ShowSpaceXHardness
	LPARAMETERS toFormSet
	LOCAL loFrmSpaceX
	loFrmSpaceX = SqlCerts_GetFrmSpaceX(toFormSet)
		
		*Clean Window
		
		loFrmSpaceX.txtN3875.Value = 0
		loFrmSpaceX.txtN3750.Value = 0
		loFrmSpaceX.txtN3625.Value = 0
		loFrmSpaceX.txtN3500.Value = 0
		loFrmSpaceX.txtN3375.Value = 0
		loFrmSpaceX.txtN3250.Value = 0
		loFrmSpaceX.txtN3125.Value = 0
		loFrmSpaceX.txtN3000.Value = 0
		
		loFrmSpaceX.txtN2875.Value = 0
		loFrmSpaceX.txtN2750.Value = 0
		loFrmSpaceX.txtN2625.Value = 0
		loFrmSpaceX.txtN2500.Value = 0
		loFrmSpaceX.txtN2375.Value = 0
		loFrmSpaceX.txtN2250.Value = 0
		loFrmSpaceX.txtN2125.Value = 0
		loFrmSpaceX.txtN2000.Value = 0
		
		loFrmSpaceX.txtN1875.Value = 0
		loFrmSpaceX.txtN1750.Value = 0
		loFrmSpaceX.txtN1625.Value = 0
		loFrmSpaceX.txtN1500.Value = 0
		loFrmSpaceX.txtN1375.Value = 0
		loFrmSpaceX.txtN1250.Value = 0
		loFrmSpaceX.txtN1125.Value = 0
		loFrmSpaceX.txtN1000.Value = 0
		
		loFrmSpaceX.txtN0875.Value = 0
		loFrmSpaceX.txtN0750.Value = 0
		loFrmSpaceX.txtN0625.Value = 0
		loFrmSpaceX.txtN0500.Value = 0
		loFrmSpaceX.txtN0375.Value = 0
		loFrmSpaceX.txtN0250.Value = 0
		loFrmSpaceX.txtN0125.Value = 0
		
		loFrmSpaceX.txt0000.Value = 0
		
		loFrmSpaceX.txtP0125.Value = 0
		loFrmSpaceX.txtP0250.Value = 0
		loFrmSpaceX.txtP0375.Value = 0
		loFrmSpaceX.txtP0500.Value = 0
		loFrmSpaceX.txtP0625.Value = 0
		loFrmSpaceX.txtP0750.Value = 0
		loFrmSpaceX.txtP0875.Value = 0
		loFrmSpaceX.txtP1000.Value = 0
		
		loFrmSpaceX.txtP1125.Value = 0
		loFrmSpaceX.txtP1250.Value = 0
		loFrmSpaceX.txtP1375.Value = 0
		loFrmSpaceX.txtP1500.Value = 0
		loFrmSpaceX.txtP1625.Value = 0
		loFrmSpaceX.txtP1750.Value = 0
		loFrmSpaceX.txtP1875.Value = 0
		loFrmSpaceX.txtP2000.Value = 0
		
		loFrmSpaceX.txtP2125.Value = 0
		loFrmSpaceX.txtP2250.Value = 0
		loFrmSpaceX.txtP2375.Value = 0
		loFrmSpaceX.txtP2500.Value = 0
		loFrmSpaceX.txtP2625.Value = 0
		loFrmSpaceX.txtP2750.Value = 0
		loFrmSpaceX.txtP2875.Value = 0
		loFrmSpaceX.txtP3000.Value = 0
		
		loFrmSpaceX.txtP3125.Value = 0
		loFrmSpaceX.txtP3250.Value = 0
		loFrmSpaceX.txtP3375.Value = 0
		loFrmSpaceX.txtP3500.Value = 0
		loFrmSpaceX.txtP3625.Value = 0
		loFrmSpaceX.txtP3750.Value = 0
		loFrmSpaceX.txtP3875.Value = 0
		loFrmSpaceX.txtP3000.Value = 0
		
		*Get Data
		PRIVATE nID
		nID	= PrepareSQLnum(toFormSet.ERPCert.PF1.pgCert.txtID.Value,'ID',-3)
		
		PRIVATE cSQL, nSQLEXEC
		
		cSQL = "SELECT Inch,RockC "
		cSQL = cSQL +" FROM dbo.Cert_RC_profile "
		cSQL = cSQL +" WHERE CertID="+STR(nID)
		
		
		IF USED("tmpCertProfile")
			USE IN tmpCertProfile
		ENDIF
		SELECT 0
		
		nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, 'tmpCertProfile')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL , 'tmpCertProfile')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "tmpCertProfile")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "tmpCertProfile")
		
				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, 'tmpCertProfile')
		ENDIF
		
		PRIVATE nInch, nRockC
					
		IF USED('tmpCertProfile')	
			IF RECCOUNT('tmpCertProfile') > 0
				SCAN
					nInch	= PrepareSQLnum(tmpCertProfile.Inch,"Inch",5,3)
					nRockC	= PrepareSQLnum(tmpCertProfile.RockC,"RockC",4,1)
					
					DO CASE
					CASE nInch=-3.875
						loFrmSpaceX.txtN3875.Value = nRockC
					CASE nInch=-3.75
						loFrmSpaceX.txtN3750.Value = nRockC
					CASE nInch=-3.625
						loFrmSpaceX.txtN3625.Value = nRockC
					CASE nInch=-3.5
						loFrmSpaceX.txtN3500.Value = nRockC
					CASE nInch=-3.375
						loFrmSpaceX.txtN3375.Value = nRockC
					CASE nInch=-3.25
						loFrmSpaceX.txtN3250.Value = nRockC
					CASE nInch=-3.125
						loFrmSpaceX.txtN3125.Value = nRockC
					CASE nInch=-3.0
						loFrmSpaceX.txtN3000.Value = nRockC
		
					CASE nInch=-2.875
						loFrmSpaceX.txtN2875.Value = nRockC
					CASE nInch=-2.75
						loFrmSpaceX.txtN2750.Value = nRockC
					CASE nInch=-2.625
						loFrmSpaceX.txtN2625.Value = nRockC
					CASE nInch=-2.5
						loFrmSpaceX.txtN2500.Value = nRockC
					CASE nInch=-2.375
						loFrmSpaceX.txtN2375.Value = nRockC
					CASE nInch=-2.25
						loFrmSpaceX.txtN2250.Value = nRockC
					CASE nInch=-2.125
						loFrmSpaceX.txtN2125.Value = nRockC
					CASE nInch=-2
						loFrmSpaceX.txtN2000.Value = nRockC
					
					CASE nInch=-1.875
						loFrmSpaceX.txtN1875.Value = nRockC
					CASE nInch=-1.75
						loFrmSpaceX.txtN1750.Value = nRockC
					CASE nInch=-1.625
						loFrmSpaceX.txtN1625.Value = nRockC
					CASE nInch=-1.5
						loFrmSpaceX.txtN1500.Value = nRockC
					CASE nInch=-1.375
						loFrmSpaceX.txtN1375.Value = nRockC
					CASE nInch=-1.25
						loFrmSpaceX.txtN1250.Value = nRockC
					CASE nInch=-1.125
						loFrmSpaceX.txtN1125.Value = nRockC
					CASE nInch=-1.0
						loFrmSpaceX.txtN1000.Value = nRockC
					
					CASE nInch=-.875
						loFrmSpaceX.txtN0875.Value = nRockC
					CASE nInch=-.75
						loFrmSpaceX.txtN0750.Value = nRockC
					CASE nInch=-.625
						loFrmSpaceX.txtN0625.Value = nRockC
					CASE nInch=-.5
						loFrmSpaceX.txtN0500.Value = nRockC
					CASE nInch=-.375
						loFrmSpaceX.txtN0375.Value = nRockC
					CASE nInch=-.25
						loFrmSpaceX.txtN0250.Value = nRockC
					CASE nInch=-.125
						loFrmSpaceX.txtN0125.Value = nRockC
					
					CASE nInch=0.0
						loFrmSpaceX.txt0000.Value = nRockC
					
					CASE nInch=.125
						loFrmSpaceX.txtP0125.Value = nRockC
					CASE nInch=.25
						loFrmSpaceX.txtP0250.Value = nRockC
					CASE nInch=.375
						loFrmSpaceX.txtP0375.Value = nRockC
					CASE nInch=.5
						loFrmSpaceX.txtP0500.Value = nRockC
					CASE nInch=.625
						loFrmSpaceX.txtP0625.Value = nRockC
					CASE nInch=.75
						loFrmSpaceX.txtP0750.Value = nRockC
					CASE nInch=.875
						loFrmSpaceX.txtP0875.Value = nRockC
					CASE nInch=1
						loFrmSpaceX.txtP1000.Value = nRockC
					
					CASE nInch=1.125
						loFrmSpaceX.txtP1125.Value = nRockC
					CASE nInch=1.25
						loFrmSpaceX.txtP1250.Value = nRockC
					CASE nInch=1.375
						loFrmSpaceX.txtP1375.Value = nRockC
					CASE nInch=1.5
						loFrmSpaceX.txtP1500.Value = nRockC
					CASE nInch=1.625
						loFrmSpaceX.txtP1625.Value = nRockC
					CASE nInch=1.75
						loFrmSpaceX.txtP1750.Value = nRockC
					CASE nInch=1.875
						loFrmSpaceX.txtP1875.Value = nRockC
					CASE nInch=2.0
						loFrmSpaceX.txtP2000.Value = nRockC
					
					CASE nInch=2.125
						loFrmSpaceX.txtP2125.Value = nRockC
					CASE nInch=2.25
						loFrmSpaceX.txtP2250.Value = nRockC
					CASE nInch=2.375
						loFrmSpaceX.txtP2375.Value = nRockC
					CASE nInch=2.5
						loFrmSpaceX.txtP2500.Value = nRockC
					CASE nInch=2.625
						loFrmSpaceX.txtP2625.Value = nRockC
					CASE nInch=2.75
						loFrmSpaceX.txtP2750.Value = nRockC
					CASE nInch=2.875
						loFrmSpaceX.txtP2875.Value = nRockC
					CASE nInch=3.0
						loFrmSpaceX.txtP3000.Value = nRockC
						
					CASE nInch=3.125
						loFrmSpaceX.txtP3125.Value = nRockC
					CASE nInch=3.25
						loFrmSpaceX.txtP3250.Value = nRockC
					CASE nInch=3.375
						loFrmSpaceX.txtP3375.Value = nRockC
					CASE nInch=3.5
						loFrmSpaceX.txtP3500.Value = nRockC
					CASE nInch=3.625
						loFrmSpaceX.txtP3625.Value = nRockC
					CASE nInch=3.75
						loFrmSpaceX.txtP3750.Value = nRockC
					CASE nInch=3.875
						loFrmSpaceX.txtP3875.Value = nRockC
					
					OTHERWISE
						PRIVATE cMess
						cMess = "Inch = "+STR(nInch,5,3)+CHR(13)
						cMess = cMess + "ID = "+STR(nID)+CHR(13)
						cMess = cMess + "Show SpaceX Hardness Profile has data issue."
						MESSAGEBOX(cMess,32,'Data Error')
						*TrackMess(cMess)
						TrackError(cMess,"Show SpaceX Hardness Profile has data issue.","ERPCert.ShowSpaceXHardness",LINENO(1) )
					ENDCASE
				ENDSCAN
				
			ENDIF
			USE IN tmpCertProfile
		ENDIF
		
		
ENDPROC
