* sql_certs_addnewcert.prg - extracted from sql_certs (addnewcert); was >64KB in .sct memo
LPARAMETERS toFormSet

		*toFormSet.AddNewCert()
		
		PRIVATE cHeat
		cHeat = toFormSet.ERPCert.PF1.pgCert.txtHeat.Value
		
		
		*toFormSet.ReturnLot
		DO CASE
		CASE toFormSet.ReturnType = "N"
			RetType = "NEW"
		CASE toFormSet.ReturnType = "C"
			RetType = "CLONE"
		OTHERWISE
			*From GFM, Roll or Press or Exit
			RetType = "EXIT"
		ENDCASE
		
		PRIVATE nLot,nNewLot
		nLot = PrepareSQLnum(toFormSet.ReturnLot,'Lot',-3)
		nNewLot = nLot
		
		IF RetType = "CLONE"
			PRIVATE cReference,dDateCert,dDateProd
			PRIVATE cHeat,nLot,cAlloy,cSize,cSpec,cUNS
			PRIVATE cAl,cB1,cBe,cC,cCa,cCb,cCd,cCl,cCo,cCr,cCu,cFe
			PRIVATE cH,cHf,cMg,cMn,cMo,cN,cNa,cNi,cO1,cP,cPb
			PRIVATE cS,cSi,cSn,cTa,cTi,cU1,cV,cW,cY,cZr
			PRIVATE cCbandTa,cNiandCo,cOther
		
			PRIVATE nUlt1,nYield1,nElong1,nRA1,cHardness1,nBHN1,cElonInches, ctLoc1
			PRIVATE nUlt2,nYield2,nElong2,nRA2,cHardness2,nBHN2,cElonInches2,ctLoc2
			PRIVATE nUlt3,nYield3,nElong3,nRA3,cHardness3,nBHN3,cElonInches3,ctLoc3
			PRIVATE nUlt4,nYield4,nElong4,nRA4,cHardness4,nBHN4,cElonInches4,ctLoc4
			PRIVATE nUlt5,nYield5,nElong5,nRA5,cHardness5,nBHN5,cElonInches5,ctLoc5
			PRIVATE nUlt6,nYield6,nElong6,nRA6,cElonInches6,ctLoc6
			PRIVATE nUlt7,nYield7,nElong7,nRA7,cElonInches7,ctLoc7
			PRIVATE cSpecLMA, cSpecSpaceX, cHeatTreat
			PRIVATE cCorrosionR,cGrainSize,cTestPO,cLabUsed,cTestPO2,cLabUsed2,nMachine
			PRIVATE cXtrainfo,lQA,cQArev,lMercFree,lNoWeld,lDFARS
			PRIVATE nSrHours,cSrTemp,nSrStress,nSrRA,nSrElong,nID,nStockLst_ID
		
			cReference	= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtReference.Value,'Reference',10))
			dDateCert	= PrepareSQLdate(toFormSet.ERPCert.PF1.pgCert.txtDateCert.Value,'DateCert',.F.,.T.)
			dDateProd	= PrepareSQLdate(toFormSet.ERPCert.PF1.pgCert.txtDateProd.Value,'DateProd',.F.,.T.)
			cHeat		= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtHeat.Value,'Heat',40))
			nLot		= PrepareSQLnum(toFormSet.ERPCert.PF1.pgCert.txtLot.Value,'Lot',5,0)
			cAlloy		= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtAlloy.Value,'Alloy',35))
			cSize		= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtSize.Value,'Size',10))
			cSpec		= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtSpec.Value,'Spec',-1))
			cSpecLMA	= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtSpecLMA,'SpecLMA',40))
			cSpecSpaceX	= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtSpecSpaceX,'SpecSpaceX',80))
			cHeatTreat	= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtHeatTreat.Value,'HeatTreat',200))
		
			cUNS		= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtUNS.Value,'UNS',10))
		
			cAl			= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtAl.Value,'Al',7))
			cB1			= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtB.Value,'B',7))
			cC			= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtC.Value,'C',7))
			cCa			= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtCa.Value,'Ca',7))
			cCb			= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtCb.Value,'Cb',7))
			cCd			= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtCd.Value,'Cd',7))
			cCl			= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtCl.Value,'Cl',7))
			cCo			= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtCo.Value,'Co',7))
			cCr			= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtCr.Value,'Cr',7))
			cCu			= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtCu.Value,'Cu',7))
			cFe			= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtFe.Value,'Fe',7))
			cH			= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtH.Value,'H',7))
			cHf			= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtHf.Value,'Hf',7))
			cMg			= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtMg.Value,'Mg',7))
			cMn			= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtMn.Value,'Mn',7))
			cMo			= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtMo.Value,'Mo',7))
			cN			= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtN.Value,'N',7))
			cNa			= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtNa.Value,'Na',7))
			cNi			= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtNi.Value,'Ni',7))
			cO1			= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtO.Value,'O',7))
			cP			= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtP.Value,'P',7))
			cPb			= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtPb.Value,'Pb',7))
			cS			= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtS.Value,'S',7))
			cSi			= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtSi.Value,'Si',7))
			cSn			= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtSn.Value,'Sn',7))
			cTa			= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtTa.Value,'Ta',7))
			cTi			= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtTi.Value,'Ti',7))
			cU1			= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtU.Value,'U',7))
			cV			= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtV.Value,'V',7))
			cW			= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtW.Value,'W',7))
			cY			= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtY.Value,'Y',7))
			cZr			= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtZr.Value,'Zr',7))
			cCbandTa	= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtCbandTa.Value,'CbandTa',10))
			cNiandCo	= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtNiandCo.Value,'NiandCo',10))
			cOther		= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtOther.Value,'Other',25))
			
			nUlt1		= PrepareSQLnum(toFormSet.ERPCert.PF1.pgCert.txtUlt.Value,'Ult',10,0)
			nYield1		= PrepareSQLnum(toFormSet.ERPCert.PF1.pgCert.txtYield.Value,'Yield',10,0)
			nElong1		= PrepareSQLnum(toFormSet.ERPCert.PF1.pgCert.txtElong.Value,'Elong',4,1)
			nRA1		= PrepareSQLnum(toFormSet.ERPCert.PF1.pgCert.txtRA.Value,'RA',4,1)
			cHardness1	= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtHardness.Value,'Hardness',10))
			nBHN1		= PrepareSQLnum(toFormSet.ERPCert.PF1.pgCert.txtBHN.Value,'BHN',4,0)
			cElonInches	= PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtEloninches.Value,'ElonInches',5)
			ctLoc1		= PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txttLoc1.Value,'tLoc',1)
			
			nUlt2		= PrepareSQLnum(toFormSet.ERPCert.PF1.pgCert.txtUlt2.Value,'Ult',10,0)
			nYield2		= PrepareSQLnum(toFormSet.ERPCert.PF1.pgCert.txtYld2.Value,'Yield',10,0)
			nElong2		= PrepareSQLnum(toFormSet.ERPCert.PF1.pgCert.txtEl2.Value,'Elong',4,1)
			nRA2		= PrepareSQLnum(toFormSet.ERPCert.PF1.pgCert.txtRA2.Value,'RA',4,1)
			cHardness2	= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtHardness2.Value,'Hardness',10))
			nBHN2		= PrepareSQLnum(toFormSet.ERPCert.PF1.pgCert.txtBHN2.Value,'BHN',4,0)
			cElonInches2= PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtEloninches2.Value,'ElonInches',5)
			ctLoc2		= PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txttLoc2.Value,'tLoc',1)
			
			nUlt3		= PrepareSQLnum(toFormSet.ERPCert.PF1.pgCert.txtUlt3.Value,'Ult',10,0)
			nYield3		= PrepareSQLnum(toFormSet.ERPCert.PF1.pgCert.txtYld3.Value,'Yield',10,0)
			nElong3		= PrepareSQLnum(toFormSet.ERPCert.PF1.pgCert.txtEl3.Value,'Elong',4,1)
			nRA3		= PrepareSQLnum(toFormSet.ERPCert.PF1.pgCert.txtRA3.Value,'RA',4,1)
			cHardness3	= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtHardness3.Value,'Hardness',10))
			nBHN3		= PrepareSQLnum(toFormSet.ERPCert.PF1.pgCert.txtBHN3.Value,'BHN',4,0)
			cElonInches3= PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtEloninches3.Value,'ElonInches',5)
			ctLoc3		= PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txttLoc3.Value,'tLoc',1)
			
			nUlt4		= PrepareSQLnum(toFormSet.ERPCert.PF1.pgCert.txtUlt4.Value,'Ult',10,0)
			nYield4		= PrepareSQLnum(toFormSet.ERPCert.PF1.pgCert.txtYld4.Value,'Yield',10,0)
			nElong4		= PrepareSQLnum(toFormSet.ERPCert.PF1.pgCert.txtEl4.Value,'Elong',4,1)
			nRA4		= PrepareSQLnum(toFormSet.ERPCert.PF1.pgCert.txtRA4.Value,'RA',4,1)
		*	cHardness4	= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtHardness4.Value,'Hardness',10))
		*	nBHN4		= PrepareSQLnum(toFormSet.ERPCert.PF1.pgCert.txtBHN4.Value,'BHN',4,0)
			cElonInches4= PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtEloninches4.Value,'ElonInches',5)
			ctLoc4		= PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txttLoc4.Value,'tLoc',1)
			
			nUlt5		= PrepareSQLnum(toFormSet.ERPCert.PF1.pgCert.txtUlt5.Value,'Ult',10,0)
			nYield5		= PrepareSQLnum(toFormSet.ERPCert.PF1.pgCert.txtYld5.Value,'Yield',10,0)
			nElong5		= PrepareSQLnum(toFormSet.ERPCert.PF1.pgCert.txtEl5.Value,'Elong',4,1)
			nRA5		= PrepareSQLnum(toFormSet.ERPCert.PF1.pgCert.txtRA5.Value,'RA',4,1)
		*	cHardness5	= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtHardness5.Value,'Hardness',10))
		*	nBHN5		= PrepareSQLnum(toFormSet.ERPCert.PF1.pgCert.txtBHN5.Value,'BHN',4,0)
			cElonInches5= PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtEloninches5.Value,'ElonInches',5)
			ctLoc5		= PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txttLoc5.Value,'tLoc',1)
			
			nUlt6		= PrepareSQLnum(toFormSet.ERPCert.PF1.pgCert.txtUlt6.Value,'Ult',10,0)
			nYield6		= PrepareSQLnum(toFormSet.ERPCert.PF1.pgCert.txtYld6.Value,'Yield',10,0)
			nElong6		= PrepareSQLnum(toFormSet.ERPCert.PF1.pgCert.txtEl6.Value,'Elong',4,1)
			nRA6		= PrepareSQLnum(toFormSet.ERPCert.PF1.pgCert.txtRA6.Value,'RA',4,1)
			cElonInches6= PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtEloninches6.Value,'ElonInches',5)
			ctLoc6		= PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txttLoc6.Value,'tLoc',1)
		
			nUlt7		= PrepareSQLnum(toFormSet.ERPCert.PF1.pgCert.txtUlt7.Value,'Ult',10,0)
			nYield7		= PrepareSQLnum(toFormSet.ERPCert.PF1.pgCert.txtYld7.Value,'Yield',10,0)
			nElong7		= PrepareSQLnum(toFormSet.ERPCert.PF1.pgCert.txtEl7.Value,'Elong',4,1)
			nRA7		= PrepareSQLnum(toFormSet.ERPCert.PF1.pgCert.txtRA7.Value,'RA',4,1)
			cElonInches7= PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtEloninches7.Value,'ElonInches',5)
			ctLoc7		= PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txttLoc7.Value,'tLoc',1)
		
			cCorrosionR	= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtCorrosionr.Value,'Corrosionr',60))
			cGrainSize	= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtGrainsize.Value,'Grainsize',10))
			cTestPO		= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtTestPO.Value,'TestPO',12))
			cLabUsed	= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtLabUsed.Value,'LabUsed',12))
			cTestPO2	= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtTestPO2.Value,'TestPO',12))
			cLabUsed2	= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtLabUsed2.Value,'LabUsed',12))
		
			nMachine	= PrepareSQLnum(toFormSet.ERPCert.PF1.pgCert.grpMach.Value,'Machine',1,0)
			cXtraInfo	= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.edtXtraInfo.Value,'XtraInfo',-1))
			lQA			= PrepareSQLchk(toFormSet.ERPCert.PF1.pgCert.chkQA.Value,'QA')
			cQArev		= PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtQArev.Value,'QArev',20)
			lMercFree	= PrepareSQLchk(toFormSet.ERPCert.PF1.pgCert.chkMercFree.Value,'MercFree')
			lNoWeld		= PrepareSQLchk(toFormSet.ERPCert.PF1.pgCert.chkNoWeld.Value,'NoWeld')
			lDFARS		= PrepareSQLchk(toFormSet.ERPCert.PF1.pgCert.chkDFARS.Value,'DFARS')
			nSrHours	= PrepareSQLnum(toFormSet.ERPCert.PF1.pgCert.txtSrhours.Value,'Srhours',4,1)
			cSrTemp		= ALLTRIM(PrepareSQLtxt(toFormSet.ERPCert.PF1.pgCert.txtSrTemp.Value,'SrTemp',10))
			nSrStress	= PrepareSQLnum(toFormSet.ERPCert.PF1.pgCert.txtSrStress.Value,'SrStress',10,0)
			nSrRA		= PrepareSQLnum(toFormSet.ERPCert.PF1.pgCert.txtSrRA.Value,'SrRA',4,1)
			nSrElong	= PrepareSQLnum(toFormSet.ERPCert.PF1.pgCert.txtSrElong.Value,'SrElong',4,1)
			nID			= 0
			nStockLst_ID = PrepareSQLnum(toFormSet.ERPCert.PF1.pgCert.txtStockLst_ID.Value,'StockLst_ID',-3)
		ENDIF
		
		SELECT ERPCert
			
		DO CASE
		CASE toFormSet.ReturnWhatMach = "G" &&OR nMachine = 2
			RetMach = "GFM"
		CASE toFormSet.ReturnWhatMach = "R" &&OR nMachine = 3
			RetMach = "ROLL"
		CASE toFormSet.ReturnWhatMach = "L" &&OR nMachine = 4
			RetMach = "LakeErie"
		OTHERWISE
			RetMach = "none"	
		ENDCASE
		
		*cRetlot = LTRIM(STR( val( Right(ReturnAction, Len(ReturnAction)-2))))	
		*nRetLot = VAL( cRetLot )
		
		PRIVATE nNewCertID
		nNewCertID = 0
		
		DO CASE
		CASE RetType = "EXIT"
		**** Do not ADD
			wait window 'No records added' NOWAIT
			RETURN
		CASE RetType = "NEW" AND RetMach = "none"
		**ADD blank RECORD
			IF USED("tmpCertID")	
				USE IN tmpCertID
			ENDIF
			
			SELECT 0
			cSQL = "EXEC dbo.p_Cert_ins @Machine=0"
						
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, 'tmpCertID')
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle,cSQL , 'tmpCertID')
			ENDDO
			IF nSQLEXEC < 0 &&Try again!
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "tmpCertID")
				DO WHILE nSQLEXEC = 0
					WAIT WINDOW 'SQL 2' TIMEOUT 1
					nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "tmpCertID")
		
					IF nSQLEXEC < 0
						IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
							nSQLEXEC = 0
						ENDIF
					ENDIF
				ENDDO
			ENDIF
			IF nSQLEXEC < 0
				SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, 'tmpCertID')
			ENDIF
			
			IF USED('tmpCertID')
				IF VARTYPE(tmpCertID.ID) = 'N'
				
					nNewCertID = tmpCertID.ID
					toFormSet.ERPCert.PF1.pgCert.txtID.Value = nNewCertID
					toFormSet.SelectCertID(tmpCertID.ID)
					
					toFormSet.SetCertNew()
					
					isadding=.T.
					toFormSet.SetEditing()
					toFormSet.ERPCert.PF1.pgCert.grpMach.OpStandard.Value = 1
					toFormSet.ERPCert.PF1.pgCert.grpMach.OpStandard.Refresh
				ENDIF
				USE IN tmpCertID
			ENDIF
			
		CASE RetType = "CLONE" AND RetMach = "none"
		***Clone
			SELECT ERPCert
		
			IF USED("tmpCertID")	
				USE IN tmpCertID
			ENDIF
			
			SELECT 0
			cSQL = "EXEC dbo.p_Cert_ins @Machine=0"
						
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, 'tmpCertID')
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL , 'tmpCertID')
			ENDDO
			IF nSQLEXEC < 0 &&Try again!
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "tmpCertID")
				DO WHILE nSQLEXEC = 0
					WAIT WINDOW 'SQL 2' TIMEOUT 1
					nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "tmpCertID")
		
					IF nSQLEXEC < 0
						IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
							nSQLEXEC = 0
						ENDIF
					ENDIF
				ENDDO
			ENDIF
			IF nSQLEXEC < 0
				SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, 'tmpCertID')
			ENDIF
			
			IF USED('tmpCertID')
				IF VARTYPE(tmpCertID.ID) = 'N'
				
					nNewCertID = tmpCertID.ID
					toFormSet.ERPCert.PF1.pgCert.txtID.Value = nNewCertID
					toFormSet.SelectCertID(tmpCertID.ID)
					toFormSet.ERPCert.PF1.pgCert.txtStockLst_ID.Value = nStockLst_ID
					
					toFormSet.ERPCert.PF1.pgCert.txtReference.Value = cReference
					toFormSet.ERPCert.PF1.pgCert.txtDateCert.Value = dDateCert
					toFormSet.ERPCert.PF1.pgCert.txtDateProd.Value = dDateProd
					toFormSet.ERPCert.PF1.pgCert.txtHeat.Value = cHeat
					toFormSet.ERPCert.PF1.pgCert.txtLot.Value = nLot
					toFormSet.ERPCert.PF1.pgCert.txtAlloy.Value = cAlloy
					toFormSet.ERPCert.PF1.pgCert.txtSize.Value = cSize
					toFormSet.ERPCert.PF1.pgCert.txtSpec.Value = cSpec
		*			toFormSet.ERPCert.PF1.pgCert.txtSpec2.Value = cSpec2
					toFormSet.ERPCert.PF1.pgCert.txtSpecLMA.Value = cSpecLMA
					toFormSet.ERPCert.PF1.pgCert.txtSpecSpaceX.Value = cSpecSpaceX
					toFormSet.ERPCert.PF1.pgCert.txtHeatTreat.Value = cHeatTreat
		
					toFormSet.ERPCert.PF1.pgCert.txtUNS.Value = cUNS
					
					toFormSet.ERPCert.PF1.pgCert.txtAl.Value = cAl
					toFormSet.ERPCert.PF1.pgCert.txtB.Value = cB1
					toFormSet.ERPCert.PF1.pgCert.txtC.Value = cC
					toFormSet.ERPCert.PF1.pgCert.txtCa.Value = cCa
					toFormSet.ERPCert.PF1.pgCert.txtCb.Value = cCb
					toFormSet.ERPCert.PF1.pgCert.txtCd.Value = cCd
					toFormSet.ERPCert.PF1.pgCert.txtCl.Value = cCl
					toFormSet.ERPCert.PF1.pgCert.txtCo.Value = cCo
					toFormSet.ERPCert.PF1.pgCert.txtCr.Value = cCr
					toFormSet.ERPCert.PF1.pgCert.txtCu.Value = cCu
					toFormSet.ERPCert.PF1.pgCert.txtFe.Value = cFe
					toFormSet.ERPCert.PF1.pgCert.txtH.Value = cH
					toFormSet.ERPCert.PF1.pgCert.txtHf.Value = cHf
					toFormSet.ERPCert.PF1.pgCert.txtMg.Value = cMg
					toFormSet.ERPCert.PF1.pgCert.txtMn.Value = cMn
					toFormSet.ERPCert.PF1.pgCert.txtMo.Value = cMo
					toFormSet.ERPCert.PF1.pgCert.txtN.Value = cN
					toFormSet.ERPCert.PF1.pgCert.txtNa.Value = cNa
					toFormSet.ERPCert.PF1.pgCert.txtNi.Value = cNi
					toFormSet.ERPCert.PF1.pgCert.txtO.Value = cO1
					toFormSet.ERPCert.PF1.pgCert.txtP.Value = cP
					toFormSet.ERPCert.PF1.pgCert.txtPb.Value = cPb
					toFormSet.ERPCert.PF1.pgCert.txtS.Value = cS
					toFormSet.ERPCert.PF1.pgCert.txtSi.Value = cSi
					toFormSet.ERPCert.PF1.pgCert.txtSn.Value = cSn
					toFormSet.ERPCert.PF1.pgCert.txtTa.Value = cTa
					toFormSet.ERPCert.PF1.pgCert.txtTi.Value = cTi
					toFormSet.ERPCert.PF1.pgCert.txtU.Value = cU1
					toFormSet.ERPCert.PF1.pgCert.txtV.Value = cV
					toFormSet.ERPCert.PF1.pgCert.txtW.Value = cW
					toFormSet.ERPCert.PF1.pgCert.txtY.Value = cY
					toFormSet.ERPCert.PF1.pgCert.txtZr.Value = cZr
					toFormSet.ERPCert.PF1.pgCert.txtCbandTa.Value = cCbandTa
					toFormSet.ERPCert.PF1.pgCert.txtNiandCo.Value = cNiandCo
					toFormSet.ERPCert.PF1.pgCert.txtOther.Value = cOther
						
					
					toFormSet.ERPCert.PF1.pgCert.txtUlt.Value = nUlt1
					toFormSet.ERPCert.PF1.pgCert.txtYield.Value = nYield1
					toFormSet.ERPCert.PF1.pgCert.txtElong.Value = nElong1
					toFormSet.ERPCert.PF1.pgCert.txtRA.Value = nRA1
					toFormSet.ERPCert.PF1.pgCert.txtHardness.Value = cHardness1
					toFormSet.ERPCert.PF1.pgCert.txtBHN.Value = nBHN1
					toFormSet.ERPCert.PF1.pgCert.txtEloninches.Value = cElonInches
					toFormSet.ERPCert.PF1.pgCert.txttLoc1.Value = ctLoc1
					
					toFormSet.ERPCert.PF1.pgCert.txtUlt2.Value = nUlt2
					toFormSet.ERPCert.PF1.pgCert.txtYld2.Value = nYield2
					toFormSet.ERPCert.PF1.pgCert.txtEl2.Value = nElong2
					toFormSet.ERPCert.PF1.pgCert.txtRA2.Value = nRA2
					toFormSet.ERPCert.PF1.pgCert.txtHardness2.Value = cHardness2
					toFormSet.ERPCert.PF1.pgCert.txtBHN2.Value = nBHN2
					toFormSet.ERPCert.PF1.pgCert.txtEloninches2.Value = cElonInches2
					toFormSet.ERPCert.PF1.pgCert.txttLoc2.Value = ctLoc2
					
					toFormSet.ERPCert.PF1.pgCert.txtUlt3.Value = nUlt3
					toFormSet.ERPCert.PF1.pgCert.txtYld3.Value = nYield3
					toFormSet.ERPCert.PF1.pgCert.txtEl3.Value = nElong3
					toFormSet.ERPCert.PF1.pgCert.txtRA3.Value = nRA3
					toFormSet.ERPCert.PF1.pgCert.txtHardness3.Value = cHardness3
					toFormSet.ERPCert.PF1.pgCert.txtBHN3.Value = nBHN3
					toFormSet.ERPCert.PF1.pgCert.txtEloninches3.Value = cElonInches3
					toFormSet.ERPCert.PF1.pgCert.txttLoc3.Value = ctLoc3
					
					toFormSet.ERPCert.PF1.pgCert.txtUlt4.Value = nUlt4
					toFormSet.ERPCert.PF1.pgCert.txtYld4.Value = nYield4
					toFormSet.ERPCert.PF1.pgCert.txtEl4.Value = nElong4
					toFormSet.ERPCert.PF1.pgCert.txtRA4.Value = nRA4
		*			toFormSet.ERPCert.PF1.pgCert.txtHardness4.Value = cHardness4
		*			toFormSet.ERPCert.PF1.pgCert.txtBHN4.Value = nBHN4
					toFormSet.ERPCert.PF1.pgCert.txtEloninches4.Value = cElonInches4
					toFormSet.ERPCert.PF1.pgCert.txttLoc4.Value = ctLoc4
					
					toFormSet.ERPCert.PF1.pgCert.txtUlt5.Value = nUlt5
					toFormSet.ERPCert.PF1.pgCert.txtYld5.Value = nYield5
					toFormSet.ERPCert.PF1.pgCert.txtEl5.Value = nElong5
					toFormSet.ERPCert.PF1.pgCert.txtRA5.Value = nRA5
		*			toFormSet.ERPCert.PF1.pgCert.txtHardness5.Value = cHardness5
		*			toFormSet.ERPCert.PF1.pgCert.txtBHN5.Value = nBHN5
					toFormSet.ERPCert.PF1.pgCert.txtEloninches5.Value = cElonInches5
					toFormSet.ERPCert.PF1.pgCert.txttLoc5.Value = ctLoc5
											
					toFormSet.ERPCert.PF1.pgCert.txtUlt6.Value = nUlt6
					toFormSet.ERPCert.PF1.pgCert.txtYld6.Value = nYield6
					toFormSet.ERPCert.PF1.pgCert.txtEl6.Value = nElong6
					toFormSet.ERPCert.PF1.pgCert.txtRA6.Value = nRA6
					toFormSet.ERPCert.PF1.pgCert.txtEloninches6.Value = cElonInches6
					toFormSet.ERPCert.PF1.pgCert.txttLoc6.Value = ctLoc6
		
					toFormSet.ERPCert.PF1.pgCert.txtUlt7.Value = nUlt7
					toFormSet.ERPCert.PF1.pgCert.txtYld7.Value = nYield7
					toFormSet.ERPCert.PF1.pgCert.txtEl7.Value = nElong7
					toFormSet.ERPCert.PF1.pgCert.txtRA7.Value = nRA7
					toFormSet.ERPCert.PF1.pgCert.txtEloninches7.Value = cElonInches7
					toFormSet.ERPCert.PF1.pgCert.txttLoc7.Value = ctLoc7
		
					toFormSet.ERPCert.PF1.pgCert.txtCorrosionr.Value = cCorrosionr
					toFormSet.ERPCert.PF1.pgCert.txtGrainsize.Value = cGrainsize
					toFormSet.ERPCert.PF1.pgCert.txtTestPO.Value = cTestPO
					toFormSet.ERPCert.PF1.pgCert.txtLabUsed.Value = cLabUsed
					toFormSet.ERPCert.PF1.pgCert.txtTestPO2.Value = cTestPO2
					toFormSet.ERPCert.PF1.pgCert.txtLabUsed2.Value = cLabUsed2
					
					toFormSet.ERPCert.PF1.pgCert.grpMach.Value = nMachine
					toFormSet.ERPCert.PF1.pgCert.edtXtraInfo.Value = cXtraInfo
					toFormSet.ERPCert.PF1.pgCert.chkQA.Value = lQA
					toFormSet.ERPCert.PF1.pgCert.txtQArev.Value = cQArev
					toFormSet.ERPCert.PF1.pgCert.chkMercFree.Value = lMercFree
					toFormSet.ERPCert.PF1.pgCert.chkNoWeld.Value = lNoWeld
					toFormSet.ERPCert.PF1.pgCert.chkDFARS.Value = lDFARS
					toFormSet.ERPCert.PF1.pgCert.txtSrhours.Value = nSrhours
					toFormSet.ERPCert.PF1.pgCert.txtSrTemp.Value = cSrTemp
					toFormSet.ERPCert.PF1.pgCert.txtSrStress.Value = nSrStress
					toFormSet.ERPCert.PF1.pgCert.txtSrRA.Value = nSrRA
					toFormSet.ERPCert.PF1.pgCert.txtSrElong.Value = nSrElong
					
					isadding=.T.
					toFormSet.SetEditing()
					toFormSet.ERPCert.PF1.pgCert.grpMach.OpStandard.Value = nMachine
					toFormSet.ERPCert.PF1.pgCert.grpMach.OpStandard.Refresh
					
					MESSAGEBOX("Clone is ready")
				ENDIF
				USE IN tmpCertID
			ENDIF
		CASE RetType = "CLONE" AND RetMach = "GFM"
		***Clone and use new GFM lot# Properties
			SELECT ERPCert
			*COPY TO ARRAY aERPCert FIELDS EXCEPT ID NEXT 1
			
			IF USED("tmpCertID")	
				USE IN tmpCertID
			ENDIF
			
			SELECT 0
			cSQL = "EXEC dbo.p_Cert_ins @Machine=2"
						
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, 'tmpCertID')
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL , 'tmpCertID')
			ENDDO
			IF nSQLEXEC < 0 &&Try again!
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "tmpCertID")
				DO WHILE nSQLEXEC = 0
					WAIT WINDOW 'SQL 2' TIMEOUT 1
					nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "tmpCertID")
		
					IF nSQLEXEC < 0
						IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
							nSQLEXEC = 0
						ENDIF
					ENDIF
				ENDDO
			ENDIF
			IF nSQLEXEC < 0
				SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, 'tmpCertID')
			ENDIF
			
			IF USED('tmpCertID')
				IF VARTYPE(tmpCertID.ID) = 'N'
				
					nNewCertID = tmpCertID.ID
					toFormSet.ERPCert.PF1.pgCert.txtID.Value = nNewCertID
					toFormSet.SelectCertID(tmpCertID.ID)
					toFormSet.ERPCert.PF1.pgCert.txtStockLst_ID.Value = nStockLst_ID
					
					toFormSet.ERPCert.PF1.pgCert.txtReference.Value = cReference
					toFormSet.ERPCert.PF1.pgCert.txtDateCert.Value = dDateCert
					toFormSet.ERPCert.PF1.pgCert.txtDateProd.Value = dDateProd
					toFormSet.ERPCert.PF1.pgCert.txtHeat.Value = cHeat
					toFormSet.ERPCert.PF1.pgCert.txtLot.Value = nLot
					toFormSet.ERPCert.PF1.pgCert.txtAlloy.Value = cAlloy
					toFormSet.ERPCert.PF1.pgCert.txtSize.Value = cSize
					toFormSet.ERPCert.PF1.pgCert.txtSpec.Value = cSpec
					toFormSet.ERPCert.PF1.pgCert.txtSpecLMA.Value = cSpecLMA
					toFormSet.ERPCert.PF1.pgCert.txtSpecSpaceX.Value = cSpecSpaceX
					toFormSet.ERPCert.PF1.pgCert.txtHeatTreat.Value = cHeatTreat
		
					toFormSet.ERPCert.PF1.pgCert.txtUNS.Value = cUNS
					
					toFormSet.ERPCert.PF1.pgCert.txtAl.Value = cAl
					toFormSet.ERPCert.PF1.pgCert.txtB.Value = cB1
					toFormSet.ERPCert.PF1.pgCert.txtC.Value = cC
					toFormSet.ERPCert.PF1.pgCert.txtCa.Value = cCa
					toFormSet.ERPCert.PF1.pgCert.txtCb.Value = cCb
					toFormSet.ERPCert.PF1.pgCert.txtCd.Value = cCd
					toFormSet.ERPCert.PF1.pgCert.txtCl.Value = cCl
					toFormSet.ERPCert.PF1.pgCert.txtCo.Value = cCo
					toFormSet.ERPCert.PF1.pgCert.txtCr.Value = cCr
					toFormSet.ERPCert.PF1.pgCert.txtCu.Value = cCu
					toFormSet.ERPCert.PF1.pgCert.txtFe.Value = cFe
					toFormSet.ERPCert.PF1.pgCert.txtH.Value = cH
					toFormSet.ERPCert.PF1.pgCert.txtHf.Value = cHf
					toFormSet.ERPCert.PF1.pgCert.txtMg.Value = cMg
					toFormSet.ERPCert.PF1.pgCert.txtMn.Value = cMn
					toFormSet.ERPCert.PF1.pgCert.txtMo.Value = cMo
					toFormSet.ERPCert.PF1.pgCert.txtN.Value = cN
					toFormSet.ERPCert.PF1.pgCert.txtNa.Value = cNa
					toFormSet.ERPCert.PF1.pgCert.txtNi.Value = cNi
					toFormSet.ERPCert.PF1.pgCert.txtO.Value = cO1
					toFormSet.ERPCert.PF1.pgCert.txtP.Value = cP
					toFormSet.ERPCert.PF1.pgCert.txtPb.Value = cPb
					toFormSet.ERPCert.PF1.pgCert.txtS.Value = cS
					toFormSet.ERPCert.PF1.pgCert.txtSi.Value = cSi
					toFormSet.ERPCert.PF1.pgCert.txtSn.Value = cSn
					toFormSet.ERPCert.PF1.pgCert.txtTa.Value = cTa
					toFormSet.ERPCert.PF1.pgCert.txtTi.Value = cTi
					toFormSet.ERPCert.PF1.pgCert.txtU.Value = cU1
					toFormSet.ERPCert.PF1.pgCert.txtV.Value = cV
					toFormSet.ERPCert.PF1.pgCert.txtW.Value = cW
					toFormSet.ERPCert.PF1.pgCert.txtY.Value = cY
					toFormSet.ERPCert.PF1.pgCert.txtZr.Value = cZr
					toFormSet.ERPCert.PF1.pgCert.txtCbandTa.Value = cCbandTa
					toFormSet.ERPCert.PF1.pgCert.txtNiandCo.Value = cNiandCo
					toFormSet.ERPCert.PF1.pgCert.txtOther.Value = cOther
						
					toFormSet.ERPCert.PF1.pgCert.txtUlt.Value = nUlt1
					toFormSet.ERPCert.PF1.pgCert.txtYield.Value = nYield1
					toFormSet.ERPCert.PF1.pgCert.txtElong.Value = nElong1
					toFormSet.ERPCert.PF1.pgCert.txtRA.Value = nRA1
					toFormSet.ERPCert.PF1.pgCert.txtHardness.Value = cHardness1
					toFormSet.ERPCert.PF1.pgCert.txtBHN.Value = nBHN1
					toFormSet.ERPCert.PF1.pgCert.txtEloninches.Value = cElonInches
					toFormSet.ERPCert.PF1.pgCert.txttLoc1.Value = ctLoc1
					
					toFormSet.ERPCert.PF1.pgCert.txtUlt2.Value = nUlt2
					toFormSet.ERPCert.PF1.pgCert.txtYld2.Value = nYield2
					toFormSet.ERPCert.PF1.pgCert.txtEl2.Value = nElong2
					toFormSet.ERPCert.PF1.pgCert.txtRA2.Value = nRA2
					toFormSet.ERPCert.PF1.pgCert.txtHardness2.Value = cHardness2
					toFormSet.ERPCert.PF1.pgCert.txtBHN2.Value = nBHN2
					toFormSet.ERPCert.PF1.pgCert.txtEloninches2.Value = cElonInches2
					toFormSet.ERPCert.PF1.pgCert.txttLoc2.Value = ctLoc2
					
					toFormSet.ERPCert.PF1.pgCert.txtUlt3.Value = nUlt3
					toFormSet.ERPCert.PF1.pgCert.txtYld3.Value = nYield3
					toFormSet.ERPCert.PF1.pgCert.txtEl3.Value = nElong3
					toFormSet.ERPCert.PF1.pgCert.txtRA3.Value = nRA3
					toFormSet.ERPCert.PF1.pgCert.txtHardness3.Value = cHardness3
					toFormSet.ERPCert.PF1.pgCert.txtBHN3.Value = nBHN3
					toFormSet.ERPCert.PF1.pgCert.txtEloninches3.Value = cElonInches3
					toFormSet.ERPCert.PF1.pgCert.txttLoc3.Value = ctLoc3
					
					toFormSet.ERPCert.PF1.pgCert.txtUlt4.Value = nUlt4
					toFormSet.ERPCert.PF1.pgCert.txtYld4.Value = nYield4
					toFormSet.ERPCert.PF1.pgCert.txtEl4.Value = nElong4
					toFormSet.ERPCert.PF1.pgCert.txtRA4.Value = nRA4
		*			toFormSet.ERPCert.PF1.pgCert.txtHardness4.Value = cHardness4
		*			toFormSet.ERPCert.PF1.pgCert.txtBHN4.Value = nBHN4
					toFormSet.ERPCert.PF1.pgCert.txtEloninches4.Value = cElonInches4
					toFormSet.ERPCert.PF1.pgCert.txttLoc4.Value = ctLoc4
					
					toFormSet.ERPCert.PF1.pgCert.txtUlt5.Value = nUlt5
					toFormSet.ERPCert.PF1.pgCert.txtYld5.Value = nYield5
					toFormSet.ERPCert.PF1.pgCert.txtEl5.Value = nElong5
					toFormSet.ERPCert.PF1.pgCert.txtRA5.Value = nRA5
		*			toFormSet.ERPCert.PF1.pgCert.txtHardness5.Value = cHardness5
		*			toFormSet.ERPCert.PF1.pgCert.txtBHN5.Value = nBHN5
					toFormSet.ERPCert.PF1.pgCert.txtEloninches5.Value = cElonInches5
					toFormSet.ERPCert.PF1.pgCert.txttLoc5.Value = ctLoc5
														
					toFormSet.ERPCert.PF1.pgCert.txtUlt6.Value = nUlt6
					toFormSet.ERPCert.PF1.pgCert.txtYld6.Value = nYield6
					toFormSet.ERPCert.PF1.pgCert.txtEl6.Value = nElong6
					toFormSet.ERPCert.PF1.pgCert.txtRA6.Value = nRA6
					toFormSet.ERPCert.PF1.pgCert.txtEloninches6.Value = cElonInches6
					toFormSet.ERPCert.PF1.pgCert.txttLoc6.Value = ctLoc6
														
					toFormSet.ERPCert.PF1.pgCert.txtUlt7.Value = nUlt7
					toFormSet.ERPCert.PF1.pgCert.txtYld7.Value = nYield7
					toFormSet.ERPCert.PF1.pgCert.txtEl7.Value = nElong7
					toFormSet.ERPCert.PF1.pgCert.txtRA7.Value = nRA7
					toFormSet.ERPCert.PF1.pgCert.txtEloninches7.Value = cElonInches7
					toFormSet.ERPCert.PF1.pgCert.txttLoc7.Value = ctLoc7
														
					toFormSet.ERPCert.PF1.pgCert.txtCorrosionr.Value = cCorrosionr
					toFormSet.ERPCert.PF1.pgCert.txtGrainsize.Value = cGrainsize
					toFormSet.ERPCert.PF1.pgCert.txtTestPO.Value = cTestPO
					toFormSet.ERPCert.PF1.pgCert.txtLabUsed.Value = cLabUsed
					toFormSet.ERPCert.PF1.pgCert.txtTestPO2.Value = cTestPO2
					toFormSet.ERPCert.PF1.pgCert.txtLabUsed2.Value = cLabUsed2
					
					toFormSet.ERPCert.PF1.pgCert.grpMach.Value = nMachine
					toFormSet.ERPCert.PF1.pgCert.edtXtraInfo.Value = cXtraInfo
					toFormSet.ERPCert.PF1.pgCert.chkQA.Value = lQA
					toFormSet.ERPCert.PF1.pgCert.txtQArev.Value = cQArev
					toFormSet.ERPCert.PF1.pgCert.chkMercFree.Value = lMercFree
					toFormSet.ERPCert.PF1.pgCert.chkNoWeld.Value = lNoWeld
					toFormSet.ERPCert.PF1.pgCert.chkDFARS.Value = lDFARS
					
					toFormSet.ERPCert.PF1.pgCert.txtSrhours.Value = nSrhours
					toFormSet.ERPCert.PF1.pgCert.txtSrTemp.Value = cSrTemp
					toFormSet.ERPCert.PF1.pgCert.txtSrStress.Value = nSrStress
					toFormSet.ERPCert.PF1.pgCert.txtSrRA.Value = nSrRA
					toFormSet.ERPCert.PF1.pgCert.txtSrElong.Value = nSrElong
					
					toFormSet.GetGFMlotProp(nNewLot,cHeat)
					isadding=.T.
					toFormSet.SetEditing()
					toFormSet.ERPCert.PF1.pgCert.grpMach.Value = 1
					toFormSet.ERPCert.PF1.pgCert.grpMach.OpStandard.Value = 1
					toFormSet.ERPCert.PF1.pgCert.grpMach.OpStandard.Refresh
					
					MESSAGEBOX("Clone is ready")
				ENDIF
				USE IN tmpCertID
			ENDIF
			
		CASE RetType = "NEW" AND RetMach = "GFM"
		**ADD NEW RECORD WITH GFMLOG MECHANICALS  -no CHEMistry
			IF USED("tmpCertID")	
				USE IN tmpCertID
			ENDIF
			
			SELECT 0
			cSQL = "EXEC dbo.p_Cert_ins @Machine=2"
						
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, 'tmpCertID')
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL , 'tmpCertID')
			ENDDO
			IF nSQLEXEC < 0 &&Try again!
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "tmpCertID")
				DO WHILE nSQLEXEC = 0
					WAIT WINDOW 'SQL 2' TIMEOUT 1
					nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "tmpCertID")
		
					IF nSQLEXEC < 0
						IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
							nSQLEXEC = 0
						ENDIF
					ENDIF
				ENDDO
			ENDIF
			IF nSQLEXEC < 0
				SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, 'tmpCertID')
			ENDIF
			
			IF USED('tmpCertID')
				IF VARTYPE(tmpCertID.ID) = 'N'
				
					nNewCertID = tmpCertID.ID
					toFormSet.ERPCert.PF1.pgCert.txtID.Value = nNewCertID
					toFormSet.SelectCertID(tmpCertID.ID)
					
					toFormSet.SetCertNew()
					toFormSet.GetGFMlotProp(nNewLot,cHeat)
					isadding=.T.
					toFormSet.SetEditing()
					toFormSet.ERPCert.PF1.pgCert.grpMach.OpStandard.Value = 2
					toFormSet.ERPCert.PF1.pgCert.grpMach.OpStandard.Refresh
				ENDIF
				USE IN tmpCertID
			ENDIF
		
			MESSAGEBOX("Cert is ready")
			
		CASE RetType = "CLONE" AND RetMach = "ROLL" 
		***Clone and use new ROLL lot# Properties
			SELECT ERPCert
			*COPY TO ARRAY aERPCert FIELDS EXCEPT ID NEXT 1
			
			IF USED("tmpCertID")	
				USE IN tmpCertID
			ENDIF
			
			SELECT 0
			cSQL = "EXEC dbo.p_Cert_ins @Machine=3"
						
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, 'tmpCertID')
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL , 'tmpCertID')
			ENDDO
			IF nSQLEXEC < 0 &&Try again!
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "tmpCertID")
				DO WHILE nSQLEXEC = 0
					WAIT WINDOW 'SQL 2' TIMEOUT 1
					nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "tmpCertID")
		
					IF nSQLEXEC < 0
						IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
							nSQLEXEC = 0
						ENDIF
					ENDIF
				ENDDO
			ENDIF
			IF nSQLEXEC < 0
				SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, 'tmpCertID')
			ENDIF
			
			IF USED('tmpCertID')
				IF VARTYPE(tmpCertID.ID) = 'N'
				
					nNewCertID = tmpCertID.ID
					toFormSet.ERPCert.PF1.pgCert.txtID.Value = nNewCertID
					toFormSet.SelectCertID(tmpCertID.ID)
					toFormSet.ERPCert.PF1.pgCert.txtStockLst_ID.Value = nStockLst_ID
					
					toFormSet.ERPCert.PF1.pgCert.txtReference.Value = cReference
					toFormSet.ERPCert.PF1.pgCert.txtDateCert.Value = dDateCert
					toFormSet.ERPCert.PF1.pgCert.txtDateProd.Value = dDateProd
					toFormSet.ERPCert.PF1.pgCert.txtHeat.Value = cHeat
					toFormSet.ERPCert.PF1.pgCert.txtLot.Value = nLot
					toFormSet.ERPCert.PF1.pgCert.txtAlloy.Value = cAlloy
					toFormSet.ERPCert.PF1.pgCert.txtSize.Value = cSize
					toFormSet.ERPCert.PF1.pgCert.txtSpec.Value = cSpec
					toFormSet.ERPCert.PF1.pgCert.txtSpecLMA.Value = cSpecLMA
					toFormSet.ERPCert.PF1.pgCert.txtSpecSpaceX.Value = cSpecSpaceX
					toFormSet.ERPCert.PF1.pgCert.txtHeatTreat.Value = cHeatTreat
					toFormSet.ERPCert.PF1.pgCert.txtUNS.Value = cUNS
					
					toFormSet.ERPCert.PF1.pgCert.txtAl.Value = cAl
					toFormSet.ERPCert.PF1.pgCert.txtB.Value = cB1
					toFormSet.ERPCert.PF1.pgCert.txtC.Value = cC
					toFormSet.ERPCert.PF1.pgCert.txtCa.Value = cCa
					toFormSet.ERPCert.PF1.pgCert.txtCb.Value = cCb
					toFormSet.ERPCert.PF1.pgCert.txtCd.Value = cCd
					toFormSet.ERPCert.PF1.pgCert.txtCl.Value = cCl
					toFormSet.ERPCert.PF1.pgCert.txtCo.Value = cCo
					toFormSet.ERPCert.PF1.pgCert.txtCr.Value = cCr
					toFormSet.ERPCert.PF1.pgCert.txtCu.Value = cCu
					toFormSet.ERPCert.PF1.pgCert.txtFe.Value = cFe
					toFormSet.ERPCert.PF1.pgCert.txtH.Value = cH
					toFormSet.ERPCert.PF1.pgCert.txtHf.Value = cHf
					toFormSet.ERPCert.PF1.pgCert.txtMg.Value = cMg
					toFormSet.ERPCert.PF1.pgCert.txtMn.Value = cMn
					toFormSet.ERPCert.PF1.pgCert.txtMo.Value = cMo
					toFormSet.ERPCert.PF1.pgCert.txtN.Value = cN
					toFormSet.ERPCert.PF1.pgCert.txtNa.Value = cNa
					toFormSet.ERPCert.PF1.pgCert.txtNi.Value = cNi
					toFormSet.ERPCert.PF1.pgCert.txtO.Value = cO1
					toFormSet.ERPCert.PF1.pgCert.txtP.Value = cP
					toFormSet.ERPCert.PF1.pgCert.txtPb.Value = cPb
					toFormSet.ERPCert.PF1.pgCert.txtS.Value = cS
					toFormSet.ERPCert.PF1.pgCert.txtSi.Value = cSi
					toFormSet.ERPCert.PF1.pgCert.txtSn.Value = cSn
					toFormSet.ERPCert.PF1.pgCert.txtTa.Value = cTa
					toFormSet.ERPCert.PF1.pgCert.txtTi.Value = cTi
					toFormSet.ERPCert.PF1.pgCert.txtU.Value = cU1
					toFormSet.ERPCert.PF1.pgCert.txtV.Value = cV
					toFormSet.ERPCert.PF1.pgCert.txtW.Value = cW
					toFormSet.ERPCert.PF1.pgCert.txtY.Value = cY
					toFormSet.ERPCert.PF1.pgCert.txtZr.Value = cZr
					toFormSet.ERPCert.PF1.pgCert.txtCbandTa.Value = cCbandTa
					toFormSet.ERPCert.PF1.pgCert.txtNiandCo.Value = cNiandCo
					toFormSet.ERPCert.PF1.pgCert.txtOther.Value = cOther
					
					toFormSet.ERPCert.PF1.pgCert.txtUlt.Value = nUlt1
					toFormSet.ERPCert.PF1.pgCert.txtYield.Value = nYield1
					toFormSet.ERPCert.PF1.pgCert.txtElong.Value = nElong1
					toFormSet.ERPCert.PF1.pgCert.txtRA.Value = nRA1
					toFormSet.ERPCert.PF1.pgCert.txtHardness.Value = cHardness1
					toFormSet.ERPCert.PF1.pgCert.txtBHN.Value = nBHN1
					toFormSet.ERPCert.PF1.pgCert.txtEloninches.Value = cElonInches
					toFormSet.ERPCert.PF1.pgCert.txttLoc1.Value = ctLoc1
					
					toFormSet.ERPCert.PF1.pgCert.txtUlt2.Value = nUlt2
					toFormSet.ERPCert.PF1.pgCert.txtYld2.Value = nYield2
					toFormSet.ERPCert.PF1.pgCert.txtEl2.Value = nElong2
					toFormSet.ERPCert.PF1.pgCert.txtRA2.Value = nRA2
					toFormSet.ERPCert.PF1.pgCert.txtHardness2.Value = cHardness2
					toFormSet.ERPCert.PF1.pgCert.txtBHN2.Value = nBHN2
					toFormSet.ERPCert.PF1.pgCert.txtEloninches2.Value = cElonInches2
					toFormSet.ERPCert.PF1.pgCert.txttLoc2.Value = ctLoc2
					
					toFormSet.ERPCert.PF1.pgCert.txtUlt3.Value = nUlt3
					toFormSet.ERPCert.PF1.pgCert.txtYld3.Value = nYield3
					toFormSet.ERPCert.PF1.pgCert.txtEl3.Value = nElong3
					toFormSet.ERPCert.PF1.pgCert.txtRA3.Value = nRA3
					toFormSet.ERPCert.PF1.pgCert.txtHardness3.Value = cHardness3
					toFormSet.ERPCert.PF1.pgCert.txtBHN3.Value = nBHN3
					toFormSet.ERPCert.PF1.pgCert.txtEloninches3.Value = cElonInches3
					toFormSet.ERPCert.PF1.pgCert.txttLoc3.Value = ctLoc3
					
					toFormSet.ERPCert.PF1.pgCert.txtUlt4.Value = nUlt4
					toFormSet.ERPCert.PF1.pgCert.txtYld4.Value = nYield4
					toFormSet.ERPCert.PF1.pgCert.txtEl4.Value = nElong4
					toFormSet.ERPCert.PF1.pgCert.txtRA4.Value = nRA4
		*			toFormSet.ERPCert.PF1.pgCert.txtHardness4.Value = cHardness4
		*			toFormSet.ERPCert.PF1.pgCert.txtBHN4.Value = nBHN4
					toFormSet.ERPCert.PF1.pgCert.txtEloninches4.Value = cElonInches4
					toFormSet.ERPCert.PF1.pgCert.txttLoc4.Value = ctLoc4
					
					toFormSet.ERPCert.PF1.pgCert.txtUlt5.Value = nUlt5
					toFormSet.ERPCert.PF1.pgCert.txtYld5.Value = nYield5
					toFormSet.ERPCert.PF1.pgCert.txtEl5.Value = nElong5
					toFormSet.ERPCert.PF1.pgCert.txtRA5.Value = nRA5
		*			toFormSet.ERPCert.PF1.pgCert.txtHardness5.Value = cHardness5
		*			toFormSet.ERPCert.PF1.pgCert.txtBHN5.Value = nBHN5
					toFormSet.ERPCert.PF1.pgCert.txtEloninches5.Value = cElonInches5
					toFormSet.ERPCert.PF1.pgCert.txttLoc5.Value = ctLoc5
											
					toFormSet.ERPCert.PF1.pgCert.txtUlt6.Value = nUlt6
					toFormSet.ERPCert.PF1.pgCert.txtYld6.Value = nYield6
					toFormSet.ERPCert.PF1.pgCert.txtEl6.Value = nElong6
					toFormSet.ERPCert.PF1.pgCert.txtRA6.Value = nRA6
					toFormSet.ERPCert.PF1.pgCert.txtEloninches6.Value = cElonInches6
					toFormSet.ERPCert.PF1.pgCert.txttLoc6.Value = ctLoc6
											
					toFormSet.ERPCert.PF1.pgCert.txtUlt7.Value = nUlt7
					toFormSet.ERPCert.PF1.pgCert.txtYld7.Value = nYield7
					toFormSet.ERPCert.PF1.pgCert.txtEl7.Value = nElong7
					toFormSet.ERPCert.PF1.pgCert.txtRA7.Value = nRA7
					toFormSet.ERPCert.PF1.pgCert.txtEloninches7.Value = cElonInches7
					toFormSet.ERPCert.PF1.pgCert.txttLoc7.Value = ctLoc7
											
					toFormSet.ERPCert.PF1.pgCert.txtCorrosionr.Value = cCorrosionr
					toFormSet.ERPCert.PF1.pgCert.txtGrainsize.Value = cGrainsize
					toFormSet.ERPCert.PF1.pgCert.txtTestPO.Value = cTestPO
					toFormSet.ERPCert.PF1.pgCert.txtLabUsed.Value = cLabUsed
					toFormSet.ERPCert.PF1.pgCert.txtTestPO2.Value = cTestPO2
					toFormSet.ERPCert.PF1.pgCert.txtLabUsed2.Value = cLabUsed2
					
					toFormSet.ERPCert.PF1.pgCert.grpMach.Value = nMachine
					toFormSet.ERPCert.PF1.pgCert.edtXtraInfo.Value = cXtraInfo
					toFormSet.ERPCert.PF1.pgCert.chkQA.Value = lQA
					toFormSet.ERPCert.PF1.pgCert.txtQArev.Value = cQArev
					toFormSet.ERPCert.PF1.pgCert.chkMercFree.Value = lMercFree
					toFormSet.ERPCert.PF1.pgCert.chkNoWeld.Value = lNoWeld
					toFormSet.ERPCert.PF1.pgCert.chkDFARS.Value = lDFARS
					
					toFormSet.ERPCert.PF1.pgCert.txtSrhours.Value = nSrhours
					toFormSet.ERPCert.PF1.pgCert.txtSrTemp.Value = cSrTemp
					toFormSet.ERPCert.PF1.pgCert.txtSrStress.Value = nSrStress
					toFormSet.ERPCert.PF1.pgCert.txtSrRA.Value = nSrRA
					toFormSet.ERPCert.PF1.pgCert.txtSrElong.Value = nSrElong
					
					toFormSet.GetRollLotProp(nNewLot,cHeat)
					isadding=.T.
					toFormSet.SetEditing()
					toFormSet.ERPCert.PF1.pgCert.grpMach.OpStandard.Value = 3
					toFormSet.ERPCert.PF1.pgCert.grpMach.OpStandard.Refresh
					
					MESSAGEBOX("Clone is ready")
				ENDIF
				USE IN tmpCertID
			ENDIF
		
		CASE RetType = "NEW" AND RetMach = "ROLL"
		**ADD NEW RECORD WITH ROLL_LOG MECHANICALS  -no CHEMistry
			IF USED("tmpCertID")	
				USE IN tmpCertID
			ENDIF
			
			SELECT 0
			cSQL = "EXEC dbo.p_Cert_ins @Machine=3"
						
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, 'tmpCertID')
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL , 'tmpCertID')
			ENDDO
			IF nSQLEXEC < 0 &&Try again!
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "tmpCertID")
				DO WHILE nSQLEXEC = 0
					WAIT WINDOW 'SQL 2' TIMEOUT 1
					nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "tmpCertID")
		
					IF nSQLEXEC < 0
						IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
							nSQLEXEC = 0
						ENDIF
					ENDIF
				ENDDO
			ENDIF
			IF nSQLEXEC < 0
				SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, 'tmpCertID')
			ENDIF
			
			IF USED('tmpCertID')
				IF VARTYPE(tmpCertID.ID) = 'N'
				
					nNewCertID = tmpCertID.ID
					toFormSet.ERPCert.PF1.pgCert.txtID.Value = nNewCertID
					toFormSet.SelectCertID(tmpCertID.ID)
					
					toFormSet.SetCertNew()
					toFormSet.GetRollLotProp(nNewLot,cHeat)
					isadding=.T.
					toFormSet.SetEditing()
					toFormSet.ERPCert.PF1.pgCert.grpMach.OpStandard.Value = 3
					toFormSet.ERPCert.PF1.pgCert.grpMach.OpStandard.Refresh
				ENDIF
				USE IN tmpCertID
			ENDIF
		
			MESSAGEBOX("Cert is ready")
			
		CASE RetType = "CLONE" AND RetMach = "LakeErie" 
			SELECT ERPCert
			*COPY TO ARRAY aERPCert FIELDS EXCEPT ID NEXT 1
			
			IF USED("tmpCertID")	
				USE IN tmpCertID
			ENDIF
			
			SELECT 0
			cSQL = "EXEC dbo.p_Cert_ins @Machine=4"
						
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, 'tmpCertID')
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL , 'tmpCertID')
			ENDDO
			IF nSQLEXEC < 0 &&Try again!
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "tmpCertID")
				DO WHILE nSQLEXEC = 0
					WAIT WINDOW 'SQL 2' TIMEOUT 1
					nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "tmpCertID")
		
					IF nSQLEXEC < 0
						IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
							nSQLEXEC = 0
						ENDIF
					ENDIF
				ENDDO
			ENDIF
			IF nSQLEXEC < 0
				SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, 'tmpCertID')
			ENDIF
			
			IF USED('tmpCertID')
				IF VARTYPE(tmpCertID.ID) = 'N'
				
					nNewCertID = tmpCertID.ID
					toFormSet.ERPCert.PF1.pgCert.txtID.Value = nNewCertID
					toFormSet.SelectCertID(tmpCertID.ID)
					toFormSet.ERPCert.PF1.pgCert.txtStockLst_ID.Value = nStockLst_ID
					
					toFormSet.ERPCert.PF1.pgCert.txtReference.Value = cReference
					toFormSet.ERPCert.PF1.pgCert.txtDateCert.Value = dDateCert
					toFormSet.ERPCert.PF1.pgCert.txtDateProd.Value = dDateProd
					toFormSet.ERPCert.PF1.pgCert.txtHeat.Value = cHeat
					toFormSet.ERPCert.PF1.pgCert.txtLot.Value = nLot
					toFormSet.ERPCert.PF1.pgCert.txtAlloy.Value = cAlloy
					toFormSet.ERPCert.PF1.pgCert.txtSize.Value = cSize
					toFormSet.ERPCert.PF1.pgCert.txtSpec.Value = cSpec
					toFormSet.ERPCert.PF1.pgCert.txtSpecLMA.Value = cSpecLMA
					toFormSet.ERPCert.PF1.pgCert.txtSpecSpaceX.Value = cSpecSpaceX
					toFormSet.ERPCert.PF1.pgCert.txtHeatTreat.Value = cHeatTreat
					toFormSet.ERPCert.PF1.pgCert.txtUNS.Value = cUNS
					
					toFormSet.ERPCert.PF1.pgCert.txtAl.Value = cAl
					toFormSet.ERPCert.PF1.pgCert.txtB.Value = cB1
					toFormSet.ERPCert.PF1.pgCert.txtC.Value = cC
					toFormSet.ERPCert.PF1.pgCert.txtCa.Value = cCa
					toFormSet.ERPCert.PF1.pgCert.txtCb.Value = cCb
					toFormSet.ERPCert.PF1.pgCert.txtCd.Value = cCd
					toFormSet.ERPCert.PF1.pgCert.txtCl.Value = cCl
					toFormSet.ERPCert.PF1.pgCert.txtCo.Value = cCo
					toFormSet.ERPCert.PF1.pgCert.txtCr.Value = cCr
					toFormSet.ERPCert.PF1.pgCert.txtCu.Value = cCu
					toFormSet.ERPCert.PF1.pgCert.txtFe.Value = cFe
					toFormSet.ERPCert.PF1.pgCert.txtH.Value = cH
					toFormSet.ERPCert.PF1.pgCert.txtHf.Value = cHf
					toFormSet.ERPCert.PF1.pgCert.txtMg.Value = cMg
					toFormSet.ERPCert.PF1.pgCert.txtMn.Value = cMn
					toFormSet.ERPCert.PF1.pgCert.txtMo.Value = cMo
					toFormSet.ERPCert.PF1.pgCert.txtN.Value = cN
					toFormSet.ERPCert.PF1.pgCert.txtNa.Value = cNa
					toFormSet.ERPCert.PF1.pgCert.txtNi.Value = cNi
					toFormSet.ERPCert.PF1.pgCert.txtO.Value = cO1
					toFormSet.ERPCert.PF1.pgCert.txtP.Value = cP
					toFormSet.ERPCert.PF1.pgCert.txtPb.Value = cPb
					toFormSet.ERPCert.PF1.pgCert.txtS.Value = cS
					toFormSet.ERPCert.PF1.pgCert.txtSi.Value = cSi
					toFormSet.ERPCert.PF1.pgCert.txtSn.Value = cSn
					toFormSet.ERPCert.PF1.pgCert.txtTa.Value = cTa
					toFormSet.ERPCert.PF1.pgCert.txtTi.Value = cTi
					toFormSet.ERPCert.PF1.pgCert.txtU.Value = cU1
					toFormSet.ERPCert.PF1.pgCert.txtV.Value = cV
					toFormSet.ERPCert.PF1.pgCert.txtW.Value = cW
					toFormSet.ERPCert.PF1.pgCert.txtY.Value = cY
					toFormSet.ERPCert.PF1.pgCert.txtZr.Value = cZr
					toFormSet.ERPCert.PF1.pgCert.txtCbandTa.Value = cCbandTa
					toFormSet.ERPCert.PF1.pgCert.txtNiandCo.Value = cNiandCo
					toFormSet.ERPCert.PF1.pgCert.txtOther.Value = cOther
					
					toFormSet.ERPCert.PF1.pgCert.txtUlt.Value = nUlt1
					toFormSet.ERPCert.PF1.pgCert.txtYield.Value = nYield1
					toFormSet.ERPCert.PF1.pgCert.txtElong.Value = nElong1
					toFormSet.ERPCert.PF1.pgCert.txtRA.Value = nRA1
					toFormSet.ERPCert.PF1.pgCert.txtHardness.Value = cHardness1
					toFormSet.ERPCert.PF1.pgCert.txtBHN.Value = nBHN1
					toFormSet.ERPCert.PF1.pgCert.txtEloninches.Value = cElonInches
					toFormSet.ERPCert.PF1.pgCert.txttLoc1.Value = ctLoc1
					
					toFormSet.ERPCert.PF1.pgCert.txtUlt2.Value = nUlt2
					toFormSet.ERPCert.PF1.pgCert.txtYld2.Value = nYield2
					toFormSet.ERPCert.PF1.pgCert.txtEl2.Value = nElong2
					toFormSet.ERPCert.PF1.pgCert.txtRA2.Value = nRA2
					toFormSet.ERPCert.PF1.pgCert.txtHardness2.Value = cHardness2
					toFormSet.ERPCert.PF1.pgCert.txtBHN2.Value = nBHN2
					toFormSet.ERPCert.PF1.pgCert.txtEloninches2.Value = cElonInches2
					toFormSet.ERPCert.PF1.pgCert.txttLoc2.Value = ctLoc2
					
					toFormSet.ERPCert.PF1.pgCert.txtUlt3.Value = nUlt3
					toFormSet.ERPCert.PF1.pgCert.txtYld3.Value = nYield3
					toFormSet.ERPCert.PF1.pgCert.txtEl3.Value = nElong3
					toFormSet.ERPCert.PF1.pgCert.txtRA3.Value = nRA3
					toFormSet.ERPCert.PF1.pgCert.txtHardness3.Value = cHardness3
					toFormSet.ERPCert.PF1.pgCert.txtBHN3.Value = nBHN3
					toFormSet.ERPCert.PF1.pgCert.txtEloninches3.Value = cElonInches3
					toFormSet.ERPCert.PF1.pgCert.txttLoc3.Value = ctLoc3
					
					toFormSet.ERPCert.PF1.pgCert.txtUlt4.Value = nUlt4
					toFormSet.ERPCert.PF1.pgCert.txtYld4.Value = nYield4
					toFormSet.ERPCert.PF1.pgCert.txtEl4.Value = nElong4
					toFormSet.ERPCert.PF1.pgCert.txtRA4.Value = nRA4
		*			toFormSet.ERPCert.PF1.pgCert.txtHardness4.Value = cHardness4
		*			toFormSet.ERPCert.PF1.pgCert.txtBHN4.Value = nBHN4
					toFormSet.ERPCert.PF1.pgCert.txtEloninches4.Value = cElonInches4
					toFormSet.ERPCert.PF1.pgCert.txttLoc4.Value = ctLoc4
					
					toFormSet.ERPCert.PF1.pgCert.txtUlt5.Value = nUlt5
					toFormSet.ERPCert.PF1.pgCert.txtYld5.Value = nYield5
					toFormSet.ERPCert.PF1.pgCert.txtEl5.Value = nElong5
					toFormSet.ERPCert.PF1.pgCert.txtRA5.Value = nRA5
		*			toFormSet.ERPCert.PF1.pgCert.txtHardness5.Value = cHardness5
		*			toFormSet.ERPCert.PF1.pgCert.txtBHN5.Value = nBHN5
					toFormSet.ERPCert.PF1.pgCert.txtEloninches5.Value = cElonInches5
					toFormSet.ERPCert.PF1.pgCert.txttLoc5.Value = ctLoc5
														
					toFormSet.ERPCert.PF1.pgCert.txtUlt6.Value = nUlt6
					toFormSet.ERPCert.PF1.pgCert.txtYld6.Value = nYield6
					toFormSet.ERPCert.PF1.pgCert.txtEl6.Value = nElong6
					toFormSet.ERPCert.PF1.pgCert.txtRA6.Value = nRA6
					toFormSet.ERPCert.PF1.pgCert.txtEloninches6.Value = cElonInches6
					toFormSet.ERPCert.PF1.pgCert.txttLoc6.Value = ctLoc6
														
					toFormSet.ERPCert.PF1.pgCert.txtUlt7.Value = nUlt7
					toFormSet.ERPCert.PF1.pgCert.txtYld7.Value = nYield7
					toFormSet.ERPCert.PF1.pgCert.txtEl7.Value = nElong7
					toFormSet.ERPCert.PF1.pgCert.txtRA7.Value = nRA7
					toFormSet.ERPCert.PF1.pgCert.txtEloninches7.Value = cElonInches7
					toFormSet.ERPCert.PF1.pgCert.txttLoc7.Value = ctLoc7
														
					toFormSet.ERPCert.PF1.pgCert.txtCorrosionr.Value = cCorrosionr
					toFormSet.ERPCert.PF1.pgCert.txtGrainsize.Value = cGrainsize
					toFormSet.ERPCert.PF1.pgCert.txtTestPO.Value = cTestPO
					toFormSet.ERPCert.PF1.pgCert.txtLabUsed.Value = cLabUsed
					toFormSet.ERPCert.PF1.pgCert.txtTestPO2.Value = cTestPO2
					toFormSet.ERPCert.PF1.pgCert.txtLabUsed2.Value = cLabUsed2
					
					toFormSet.ERPCert.PF1.pgCert.grpMach.Value = nMachine
					toFormSet.ERPCert.PF1.pgCert.edtXtraInfo.Value = cXtraInfo
					toFormSet.ERPCert.PF1.pgCert.chkQA.Value = lQA
					toFormSet.ERPCert.PF1.pgCert.txtQArev.Value = cQArev
					toFormSet.ERPCert.PF1.pgCert.chkMercFree.Value = lMercFree
					toFormSet.ERPCert.PF1.pgCert.chkNoWeld.Value = lNoWeld
					toFormSet.ERPCert.PF1.pgCert.chkDFARS.Value = lDFARS
					
					toFormSet.ERPCert.PF1.pgCert.txtSrhours.Value = nSrhours
					toFormSet.ERPCert.PF1.pgCert.txtSrTemp.Value = cSrTemp
					toFormSet.ERPCert.PF1.pgCert.txtSrStress.Value = nSrStress
					toFormSet.ERPCert.PF1.pgCert.txtSrRA.Value = nSrRA
					toFormSet.ERPCert.PF1.pgCert.txtSrElong.Value = nSrElong
					
					toFormSet.GetLakeErieLotProp(nNewLot,cHeat)
					isadding=.T.
					toFormSet.SetEditing()
					toFormSet.ERPCert.PF1.pgCert.grpMach.OpStandard.Value = 4
					toFormSet.ERPCert.PF1.pgCert.grpMach.OpStandard.Refresh
					
					MESSAGEBOX("Clone is ready")
				ENDIF
				USE IN tmpCertID
			ENDIF
		
			
			
			
		CASE RetType = "NEW" AND RetMach = "LakeErie"
		**ADD NEW RECORD WITH LakeErie MECHANICALS  -no CHEMistry
		*OPEN LakeErie
			IF USED("tmpCertID")	
				USE IN tmpCertID
			ENDIF
			
			SELECT 0
			cSQL = "EXEC dbo.p_Cert_ins @Machine=4"
						
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, 'tmpCertID')
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL , 'tmpCertID')
			ENDDO
			IF nSQLEXEC < 0 &&Try again!
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "tmpCertID")
				DO WHILE nSQLEXEC = 0
					WAIT WINDOW 'SQL 2' TIMEOUT 1
					nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "tmpCertID")
		
					IF nSQLEXEC < 0
						IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
							nSQLEXEC = 0
						ENDIF
					ENDIF
				ENDDO
			ENDIF
			IF nSQLEXEC < 0
				SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, 'tmpCertID')
			ENDIF
			
			IF USED('tmpCertID')
				IF VARTYPE(tmpCertID.ID) = 'N'
				
					nNewCertID = tmpCertID.ID
					toFormSet.ERPCert.PF1.pgCert.txtID.Value = nNewCertID
					toFormSet.SelectCertID(tmpCertID.ID)
		
					toFormSet.SetCertNew()
					toFormSet.GetLakeErieLotProp(nNewLot,cHeat)
					isadding=.T.
					toFormSet.SetEditing()
					toFormSet.ERPCert.PF1.pgCert.grpMach.OpStandard.Value = 5
					toFormSet.ERPCert.PF1.pgCert.grpMach.OpStandard.Refresh
					
					MESSAGEBOX("Cert is ready")
					
				ENDIF
				USE IN tmpCertID
			ENDIF
		
			
		CASE RetType = "CLONE" AND RetMach = "Wire" 
			SELECT ERPCert
			*COPY TO ARRAY aERPCert FIELDS EXCEPT ID NEXT 1
			
			IF USED("tmpCertID")	
				USE IN tmpCertID
			ENDIF
			
			SELECT 0
			cSQL = "EXEC dbo.p_Cert_ins @Machine=5"
						
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, 'tmpCertID')
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL , 'tmpCertID')
			ENDDO
			IF nSQLEXEC < 0 &&Try again!
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "tmpCertID")
				DO WHILE nSQLEXEC = 0
					WAIT WINDOW 'SQL 2' TIMEOUT 1
					nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "tmpCertID")
		
					IF nSQLEXEC < 0
						IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
							nSQLEXEC = 0
						ENDIF
					ENDIF
				ENDDO
			ENDIF
			IF nSQLEXEC < 0
				SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, 'tmpCertID')
			ENDIF
			
			IF USED('tmpCertID')
				IF VARTYPE(tmpCertID.ID) = 'N'
				
					nNewCertID = tmpCertID.ID
					toFormSet.ERPCert.PF1.pgCert.txtID.Value = nNewCertID
					toFormSet.SelectCertID(tmpCertID.ID)
					toFormSet.ERPCert.PF1.pgCert.txtStockLst_ID.Value = nStockLst_ID
					
					toFormSet.ERPCert.PF1.pgCert.txtReference.Value = cReference
					toFormSet.ERPCert.PF1.pgCert.txtDateCert.Value = dDateCert
					toFormSet.ERPCert.PF1.pgCert.txtDateProd.Value = dDateProd
					toFormSet.ERPCert.PF1.pgCert.txtHeat.Value = cHeat
					toFormSet.ERPCert.PF1.pgCert.txtLot.Value = nLot
					toFormSet.ERPCert.PF1.pgCert.txtAlloy.Value = cAlloy
					toFormSet.ERPCert.PF1.pgCert.txtSize.Value = cSize
					toFormSet.ERPCert.PF1.pgCert.txtSpec.Value = cSpec
					toFormSet.ERPCert.PF1.pgCert.txtSpecLMA.Value = cSpecLMA
					toFormSet.ERPCert.PF1.pgCert.txtSpecSpaceX.Value = cSpecSpaceX
					toFormSet.ERPCert.PF1.pgCert.txtHeatTreat.Value = cHeatTreat
					toFormSet.ERPCert.PF1.pgCert.txtUNS.Value = cUNS
					
					toFormSet.ERPCert.PF1.pgCert.txtAl.Value = cAl
					toFormSet.ERPCert.PF1.pgCert.txtB.Value = cB1
					toFormSet.ERPCert.PF1.pgCert.txtC.Value = cC
					toFormSet.ERPCert.PF1.pgCert.txtCa.Value = cCa
					toFormSet.ERPCert.PF1.pgCert.txtCb.Value = cCb
					toFormSet.ERPCert.PF1.pgCert.txtCd.Value = cCd
					toFormSet.ERPCert.PF1.pgCert.txtCl.Value = cCl
					toFormSet.ERPCert.PF1.pgCert.txtCo.Value = cCo
					toFormSet.ERPCert.PF1.pgCert.txtCr.Value = cCr
					toFormSet.ERPCert.PF1.pgCert.txtCu.Value = cCu
					toFormSet.ERPCert.PF1.pgCert.txtFe.Value = cFe
					toFormSet.ERPCert.PF1.pgCert.txtH.Value = cH
					toFormSet.ERPCert.PF1.pgCert.txtHf.Value = cHf
					toFormSet.ERPCert.PF1.pgCert.txtMg.Value = cMg
					toFormSet.ERPCert.PF1.pgCert.txtMn.Value = cMn
					toFormSet.ERPCert.PF1.pgCert.txtMo.Value = cMo
					toFormSet.ERPCert.PF1.pgCert.txtN.Value = cN
					toFormSet.ERPCert.PF1.pgCert.txtNa.Value = cNa
					toFormSet.ERPCert.PF1.pgCert.txtNi.Value = cNi
					toFormSet.ERPCert.PF1.pgCert.txtO.Value = cO1
					toFormSet.ERPCert.PF1.pgCert.txtP.Value = cP
					toFormSet.ERPCert.PF1.pgCert.txtPb.Value = cPb
					toFormSet.ERPCert.PF1.pgCert.txtS.Value = cS
					toFormSet.ERPCert.PF1.pgCert.txtSi.Value = cSi
					toFormSet.ERPCert.PF1.pgCert.txtSn.Value = cSn
					toFormSet.ERPCert.PF1.pgCert.txtTa.Value = cTa
					toFormSet.ERPCert.PF1.pgCert.txtTi.Value = cTi
					toFormSet.ERPCert.PF1.pgCert.txtU.Value = cU1
					toFormSet.ERPCert.PF1.pgCert.txtV.Value = cV
					toFormSet.ERPCert.PF1.pgCert.txtW.Value = cW
					toFormSet.ERPCert.PF1.pgCert.txtY.Value = cY
					toFormSet.ERPCert.PF1.pgCert.txtZr.Value = cZr
					toFormSet.ERPCert.PF1.pgCert.txtCbandTa.Value = cCbandTa
					toFormSet.ERPCert.PF1.pgCert.txtNiandCo.Value = cNiandCo
					toFormSet.ERPCert.PF1.pgCert.txtOther.Value = cOther
					
					toFormSet.ERPCert.PF1.pgCert.txtUlt.Value = nUlt1
					toFormSet.ERPCert.PF1.pgCert.txtYield.Value = nYield1
					toFormSet.ERPCert.PF1.pgCert.txtElong.Value = nElong1
					toFormSet.ERPCert.PF1.pgCert.txtRA.Value = nRA1
					toFormSet.ERPCert.PF1.pgCert.txtHardness.Value = cHardness1
					toFormSet.ERPCert.PF1.pgCert.txtBHN.Value = nBHN1
					toFormSet.ERPCert.PF1.pgCert.txtEloninches.Value = cElonInches
					toFormSet.ERPCert.PF1.pgCert.txttLoc1.Value = ctLoc1
					
					toFormSet.ERPCert.PF1.pgCert.txtUlt2.Value = nUlt2
					toFormSet.ERPCert.PF1.pgCert.txtYld2.Value = nYield2
					toFormSet.ERPCert.PF1.pgCert.txtEl2.Value = nElong2
					toFormSet.ERPCert.PF1.pgCert.txtRA2.Value = nRA2
					toFormSet.ERPCert.PF1.pgCert.txtHardness2.Value = cHardness2
					toFormSet.ERPCert.PF1.pgCert.txtBHN2.Value = nBHN2
					toFormSet.ERPCert.PF1.pgCert.txtEloninches2.Value = cElonInches2
					toFormSet.ERPCert.PF1.pgCert.txttLoc2.Value = ctLoc2
					
					toFormSet.ERPCert.PF1.pgCert.txtUlt3.Value = nUlt3
					toFormSet.ERPCert.PF1.pgCert.txtYld3.Value = nYield3
					toFormSet.ERPCert.PF1.pgCert.txtEl3.Value = nElong3
					toFormSet.ERPCert.PF1.pgCert.txtRA3.Value = nRA3
					toFormSet.ERPCert.PF1.pgCert.txtHardness3.Value = cHardness3
					toFormSet.ERPCert.PF1.pgCert.txtBHN3.Value = nBHN3
					toFormSet.ERPCert.PF1.pgCert.txtEloninches3.Value = cElonInches3
					toFormSet.ERPCert.PF1.pgCert.txttLoc3.Value = ctLoc3
					
					toFormSet.ERPCert.PF1.pgCert.txtUlt4.Value = nUlt4
					toFormSet.ERPCert.PF1.pgCert.txtYld4.Value = nYield4
					toFormSet.ERPCert.PF1.pgCert.txtEl4.Value = nElong4
					toFormSet.ERPCert.PF1.pgCert.txtRA4.Value = nRA4
		*			toFormSet.ERPCert.PF1.pgCert.txtHardness4.Value = cHardness4
		*			toFormSet.ERPCert.PF1.pgCert.txtBHN4.Value = nBHN4
					toFormSet.ERPCert.PF1.pgCert.txtEloninches4.Value = cElonInches4
					toFormSet.ERPCert.PF1.pgCert.txttLoc4.Value = ctLoc4
					
					toFormSet.ERPCert.PF1.pgCert.txtUlt5.Value = nUlt5
					toFormSet.ERPCert.PF1.pgCert.txtYld5.Value = nYield5
					toFormSet.ERPCert.PF1.pgCert.txtEl5.Value = nElong5
					toFormSet.ERPCert.PF1.pgCert.txtRA5.Value = nRA5
		*			toFormSet.ERPCert.PF1.pgCert.txtHardness5.Value = cHardness5
		*			toFormSet.ERPCert.PF1.pgCert.txtBHN5.Value = nBHN5
					toFormSet.ERPCert.PF1.pgCert.txtEloninches5.Value = cElonInches5
					toFormSet.ERPCert.PF1.pgCert.txttLoc5.Value = ctLoc5
														
					toFormSet.ERPCert.PF1.pgCert.txtUlt6.Value = nUlt6
					toFormSet.ERPCert.PF1.pgCert.txtYld6.Value = nYield6
					toFormSet.ERPCert.PF1.pgCert.txtEl6.Value = nElong6
					toFormSet.ERPCert.PF1.pgCert.txtRA6.Value = nRA6
					toFormSet.ERPCert.PF1.pgCert.txtEloninches6.Value = cElonInches6
					toFormSet.ERPCert.PF1.pgCert.txttLoc6.Value = ctLoc6
														
					toFormSet.ERPCert.PF1.pgCert.txtUlt7.Value = nUlt7
					toFormSet.ERPCert.PF1.pgCert.txtYld7.Value = nYield7
					toFormSet.ERPCert.PF1.pgCert.txtEl7.Value = nElong7
					toFormSet.ERPCert.PF1.pgCert.txtRA7.Value = nRA7
					toFormSet.ERPCert.PF1.pgCert.txtEloninches7.Value = cElonInches7
					toFormSet.ERPCert.PF1.pgCert.txttLoc7.Value = ctLoc7
														
					toFormSet.ERPCert.PF1.pgCert.txtCorrosionr.Value = cCorrosionr
					toFormSet.ERPCert.PF1.pgCert.txtGrainsize.Value = cGrainsize
					toFormSet.ERPCert.PF1.pgCert.txtTestPO.Value = cTestPO
					toFormSet.ERPCert.PF1.pgCert.txtLabUsed.Value = cLabUsed
					toFormSet.ERPCert.PF1.pgCert.txtTestPO2.Value = cTestPO2
					toFormSet.ERPCert.PF1.pgCert.txtLabUsed2.Value = cLabUsed2
					
					toFormSet.ERPCert.PF1.pgCert.grpMach.Value = nMachine
					toFormSet.ERPCert.PF1.pgCert.edtXtraInfo.Value = cXtraInfo
					toFormSet.ERPCert.PF1.pgCert.chkQA.Value = lQA
					toFormSet.ERPCert.PF1.pgCert.txtQArev.Value = cQArev
					toFormSet.ERPCert.PF1.pgCert.chkMercFree.Value = lMercFree
					toFormSet.ERPCert.PF1.pgCert.chkNoWeld.Value = lNoWeld
					toFormSet.ERPCert.PF1.pgCert.chkDFARS.Value = lDFARS
					
					toFormSet.ERPCert.PF1.pgCert.txtSrhours.Value = nSrhours
					toFormSet.ERPCert.PF1.pgCert.txtSrTemp.Value = cSrTemp
					toFormSet.ERPCert.PF1.pgCert.txtSrStress.Value = nSrStress
					toFormSet.ERPCert.PF1.pgCert.txtSrRA.Value = nSrRA
					toFormSet.ERPCert.PF1.pgCert.txtSrElong.Value = nSrElong
					
					*toFormSet.GetLakeErieLotProp(nNewLot,cHeat)
					toFormSet.GetWireLotProp(nNewLot,cHeat)
					isadding=.T.
					toFormSet.SetEditing()
					toFormSet.ERPCert.PF1.pgCert.grpMach.OpStandard.Value = 6
					toFormSet.ERPCert.PF1.pgCert.grpMach.OpStandard.Refresh
					
					MESSAGEBOX("Clone is ready")
				ENDIF
				USE IN tmpCertID
			ENDIF
		
			
			
			
		CASE RetType = "NEW" AND RetMach = "Wire"
		**ADD NEW RECORD WITH LakeErie MECHANICALS  -no CHEMistry
		*OPEN LakeErie
			IF USED("tmpCertID")	
				USE IN tmpCertID
			ENDIF
			
			SELECT 0
			cSQL = "EXEC dbo.p_Cert_ins @Machine=5"
						
			nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, 'tmpCertID')
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL' TIMEOUT 1
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL , 'tmpCertID')
			ENDDO
			IF nSQLEXEC < 0 &&Try again!
				nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "tmpCertID")
				DO WHILE nSQLEXEC = 0
					WAIT WINDOW 'SQL 2' TIMEOUT 1
					nSQLEXEC = SQLEXEC(toFormSet.nConnHandle, cSQL, "tmpCertID")
		
					IF nSQLEXEC < 0
						IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
							nSQLEXEC = 0
						ENDIF
					ENDIF
				ENDDO
			ENDIF
			IF nSQLEXEC < 0
				SQLEXECError(cSQL, toFormSet.nConnHandle, nSQLEXEC, 'tmpCertID')
			ENDIF
			
			IF USED('tmpCertID')
				IF VARTYPE(tmpCertID.ID) = 'N'
				
					nNewCertID = tmpCertID.ID
					toFormSet.ERPCert.PF1.pgCert.txtID.Value = nNewCertID
					toFormSet.SelectCertID(tmpCertID.ID)
		
					toFormSet.SetCertNew()
					*toFormSet.GetLakeErieLotProp(nNewLot,cHeat)
					toFormSet.GetWireLotProp(nNewLot,cHeat)
					isadding=.T.
					toFormSet.SetEditing()
					toFormSet.ERPCert.PF1.pgCert.grpMach.OpStandard.Value = 6
					toFormSet.ERPCert.PF1.pgCert.grpMach.OpStandard.Refresh
					
					MESSAGEBOX("Cert is ready")
					
				ENDIF
				USE IN tmpCertID
			ENDIF
		ENDCASE
		
		
		SELECT ERPCert
		*SET ORDER TO heat
		
		toFormSet.ERPCert.PF1.pgCert.Refresh
		
		toFormSet.frmAddCert.Visible = .F.
		
		toFormSet.ERPCert.PF1.pgCert.txtHeatCount.Value = 0
		toFormSet.ERPCert.PF1.pgCert.txtLotCount.Value = 0
		
		toFormSet.frmSearch.txtHeatCount.Value = 0
		toFormSet.frmSearch.txtLotCount.Value = 0
		
		*toFormSet.frmAddCert.Commandgroup1.cmdNew.Caption = "New"
		*toFormSet.frmAddCert.Commandgroup1.cmdEdit.Caption = "Clone"
		
		toFormSet.RefreshERPCertCo(0)
