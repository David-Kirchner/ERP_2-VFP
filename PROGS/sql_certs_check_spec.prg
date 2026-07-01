* sql_certs_check_spec.prg - extracted from sql_certs (frmCheckSpec.cmdCheck.Click); was >64KB in .sct memo
LPARAMETERS toForm, toFormSet

		
		IF !USED('ERPCert')
			WAIT WINDOW 'Did not find the Cert to check'
			RETURN
		ENDIF
		
		PRIVATE m.Scand
		m.Scand = 0
		
		IF NOT toForm.Opened
			IF !USED('Spec_Check') && Error 3, File is in use ???????
				USE Spec_Check SHARED IN 0
				toForm.Opened = .T.
			ENDIF
		ENDIF
		
		PRIVATE cGroup, cSpec, cRev
		cGroup	= ShowSQLtxt(toForm.cmbGroup.Value,'Group',10)
		cSpec	= ShowSQLtxt(toForm.cmbSpec.Value,'Spec',30)
		cRev	= ShowSQLtxt(toForm.cmbRev.Value,'Rev',10)
		
		SELECT Spec_Check
		SCAN
			IF NOT EMPTY(cRev)
				IF Spec_Check.Group = cGroup ;
					AND Spec_Check.Spec = cSpec;
					AND Spec_Check.Rev = cRev
					
					m.Scand = m.Scand +1
					DIMENSION aScand(M.Scand)
					aScand(M.Scand) = Recno()
					WAIT WINDOW 'Record #'+ALLTRIM(STR(RECNO(),10,0)) nowait &&timeout 5
				ENDIF
			ELSE
		
				IF Spec_Check.Group = cGroup AND Spec_Check.spec = cSpec
					m.Scand = m.Scand +1
					DIMENSION aScand(M.Scand)
					aScand(M.Scand) = Recno()
					WAIT WINDOW 'Record #'+ALLTRIM(STR(RECNO(),10,0)) nowait &&timeout 5
				ENDIF
			ENDIF
		ENDSCAN
		
		IF m.Scand = 0
			Release m.Scand
			WAIT window 'Did not find this Group+Spec'
			RETURN
		ENDIF
		
		********************************************************************************************
		**Open Spec Check 
		
		IF USED('SpecText')
			USE IN SpecText
		ENDIF
		
		PRIVATE cSafety
		cSafety = SET('Safety')
		SET SAFETY OFF
		
		toForm.fnSpecText = UniqDBF(toForm.fnSpecText)
		
		
		SELECT 0
		SET SAFETY OFF
		
		CREATE TABLE (SYS(5)+SYS(2003)+"\"+(toForm.fnSpecText) ) FREE ;
		( SpecText CHAR(60) )
		
		IF "\MEM" $ SYS(2003)
			USE (SYS(5)+SYS(2003)+"\"+toForm.fnSpecText) EXCL ALIAS SpecText
		ELSE
			USE (SYS(5)+SYS(2003)+"\MEM\"+toForm.fnSpecText) EXCL ALIAS SpecText
		ENDIF
		*CREATE TABLE (SYS(5)+SYS(2003)+"\"+"SpecText") FREE ( SpecText CHAR(60) )
		
		IF cSafety = "ON"
			SET SAFETY ON
		ENDIF
		
		INSERT INTO SpecText (SpecText) VALUES ( 'Alloy:'+ALLTRIM(ERPCert.Alloy)+' '+ALLTRIM(ERPCert.Size)   )
		INSERT INTO SpecText (SpecText) VALUES ( 'Heat:'+ALLTRIM(ERPCert.Heat)+' Lot:'+ALLTRIM(STR(ERPCert.Lot)) )
		INSERT INTO SpecText (SpecText) VALUES ( REPLICATE("-",60) )
		
		
		PRIVATE m.ChemPass
		PRIVATE m.CertDia,m.CertDiaPass
		PRIVATE m.CertUTS,m.CertUTSPass
		PRIVATE m.CertYLD,m.CertYLDPass
		PRIVATE m.CertEL,m.CertELPass
		PRIVATE m.CertRA,m.CertRAPass
		PRIVATE m.CertBHN,m.CertBHNPass
		PRIVATE m.CertRB,m.CertRBPass
		PRIVATE m.CertRC,m.CertRCPass
		PRIVATE m.CertGrainPass
		PRIVATE m.MechPass
		PRIVATE m.CertAlPass, m.CertAl
		PRIVATE m.CertBPass, m.CertB
		PRIVATE m.CertBePass, m.CertBe
		PRIVATE m.CertCPass, m.CertC
		PRIVATE m.CertCbPass, m.CertCb
		PRIVATE m.CertCoPass, m.CertCo
		PRIVATE m.CertCrPass, m.CertCr
		PRIVATE m.CertCuPass, m.CertCu
		PRIVATE m.CertFePass, m.CertFe
		PRIVATE m.CertHPass, m.CertH
		PRIVATE m.CertMgPass, m.CertMg
		PRIVATE m.CertMoPass, m.CertMo
		PRIVATE m.CertMnPass, m.CertMn
		PRIVATE m.CertNPass, m.CertN
		PRIVATE m.CertNaPass, m.CertNa
		PRIVATE m.CertNbPass, m.CertNb
		PRIVATE m.CertNiPass, m.CertNi
		PRIVATE m.CertOPass, m.CertO
		PRIVATE m.CertPPass, m.CertP
		PRIVATE m.CertSPass, m.CertS
		PRIVATE m.CertSiPass, m.CertSi
		PRIVATE m.CertTaPass, m.CertTa
		PRIVATE m.CertTiPass, m.CertTi
		PRIVATE m.CertVPass, m.CertV
		PRIVATE m.CertWPass, m.CertW
		PRIVATE m.CertYPass, m.CertY
		PRIVATE m.CertCbTaPass, m.CertCbTa
		PRIVATE m.CertNiCoPass, m.CertNiCo
		PRIVATE m.CertFeCrNiPass, m.CertFeCrNi
		
		FOR I = 1 TO m.Scand  &&Scan thru Group+Spec
			SELECT Spec_Check
			GOTO aScand(I)
			m.MechPass = .T.
		
			INSERT INTO SpecText (SpecText) VALUES ( 'Specification: '+ALLTRIM(Spec_Check.Group)+' '+ALLTRIM(Spec_Check.Spec)+' '+ALLTRIM(Spec_Check.Rev) )
		
			*Check for Dia
			m.CertDia = VAL(Description)
			m.CertDiaPass = .F.
			DO CASE
			CASE DiaMin > 0 AND DiaMax > 0
				*Check Agianst Min AND Max
				IF m.CertDia >= DiaMin AND m.CertDia <= DiaMax
					m.CertDiaPass = .T.
				ENDIF
			CASE DiaMin > 0 AND DiaMax = 0
				*Check Agianst Min ONLY
				IF m.CertDia >= DiaMin
					m.CertDiaPass = .T.
				ENDIF
			CASE DiaMin = 0 AND DiaMax > 0
				*Check Agianst Max ONLY
				IF m.CertDia <= DiaMax
					m.CertDiaPass = .T.
				ENDIF
			OTHERWISE
				*Dia not limited!
				m.CertDiaPass = .T.
			ENDCASE
		
			IF !m.CertDiaPass
				INSERT INTO SpecText (SpecText) VALUES ( 'This Spec does not match with the materials size' )
				INSERT INTO SpecText (SpecText) VALUES ( '   -Spec states Dia '+STR(Spec_Check.DiaMin,8,3)+' Min and '+STR(Spec_Check.DiaMax,8,3)+' Max' )
				INSERT INTO SpecText (SpecText) VALUES ( "   -Cert is "+IIF(EMPTY(ERPCert.Descriptio),"not listed.",ALLTRIM(STR(VAL(ERPCert.Descriptio),6,3))+["Dia] ))
				IF 7=MESSAGEBOX('Do you want to continue'+CHR(13)+'',4+32,'Did not meet Dia requirements')
		&&Exit loop now
					INSERT INTO SpecText (SpecText) VALUES ( REPLICATE(' -',30) )
					LOOP
				ENDIF
			ELSE &&Dia is OK
				IF m.CertDia > 0 AND (m.CertDia = DiaMax OR m.CertDia = DiaMin)
					INSERT INTO SpecText (SpecText) VALUES ( '   -Spec states Dia '+STR(Spec_Check.DiaMin,8,3)+' Min and '+STR(Spec_Check.DiaMax,8,3)+' Max' )
					INSERT INTO SpecText (SpecText) VALUES ( "   -Cert is "+IIF(EMPTY(ERPCert.Descriptio),"not listed.",ALLTRIM(STR(VAL(ERPCert.Descriptio),6,3))+["Dia] ))
				ENDIF
			ENDIF
			IF !m.CertDiaPass
				m.MechPass = .F.
			ENDIF
			Release m.CertDia
		
			*Check for UTS
			m.CertUTS = (ERPCert.ULT1)
			m.CertUTSPass = .F.
			DO CASE
			CASE UTSMin > 0 AND UTSMax > 0
				*Check Agianst Min AND Max
				IF m.CertUTS >= UTSMin AND m.CertUTS <= UTSMax
					m.CertUTSPass = .T.
				ELSE
					INSERT INTO SpecText (SpecText) VALUES ( "UTS is not within Spec." )
					INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.UTSMin))+' Min. UTS. and '+ALLTRIM(STR(Spec_Check.UTSMax))+' Max.')
					INSERT INTO SpecText (SpecText) VALUES ( "   -Cert is "+IIF(EMPTY(ERPCert.ULT1),"not listed.",ALLTRIM(STR(ERPCert.ULT1)) ))
				ENDIF
			CASE UTSMin > 0 AND UTSMax = 0
				*Check Agianst Min ONLY
				IF m.CertUTS => UTSMin
					m.CertUTSPass = .T.
				ELSE
					INSERT INTO SpecText (SpecText) VALUES ( "UTS is not within Spec." )
					INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.UTSMin))+' Min. UTS. Cert is '+IIF(EMPTY(ERPCert.ULT1),"not listed.",ALLTRIM(STR(ERPCert.ULT1)) ))
				ENDIF
			CASE UTSMin = 0 AND UTSMax > 0
				*Check Agianst Max ONLY
				IF m.CertUTS < UTSMax
					m.CertUTSPass = .T.
				ELSE
					INSERT INTO SpecText (SpecText) VALUES ( "Spec. requires "+ALLTRIM(STR(Spec_Check.UTSMax))+' Max. UTS. Cert is '+IIF(EMPTY(ERPCert.ULT1),"not listed.",ALLTRIM(STR(ERPCert.ULT1)) ))
					INSERT INTO SpecText (SpecText) VALUES ( "   -UTS is not within Spec." )
				ENDIF
			OTHERWISE
				*UTS not limited!
				m.CertUTSPass = .T.
		
			ENDCASE
			IF !m.CertUTSPass
				m.MechPass = .F.
			ELSE
				IF m.CertUTS > 0 AND (m.CertUTS = UTSMin OR m.CertUTS = UTSMax )
					INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.UTSMin))+' Min. UTS. and '+ALLTRIM(STR(Spec_Check.UTSMax))+' Max.')
					INSERT INTO SpecText (SpecText) VALUES ( "   -Cert is "+IIF(EMPTY(ERPCert.ULT1),"not listed.",ALLTRIM(STR(ERPCert.ULT1)) ))		
				ENDIF
			ENDIF
			Release m.CertUTS
		
			*Check for YLD
			m.CertYLD = (ERPCert.Yield1)
			m.CertYLDPass = .F.
			DO CASE
			CASE YLDMin > 0 AND YLDMax > 0
				*Check Agianst Min AND Max
				IF m.CertYLD >= YLDMin AND m.CertYLD <= YLDMax
					m.CertYLDPass = .T.
				ELSE
					INSERT INTO SpecText (SpecText) VALUES ( "Yield is not within Spec." )
					INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.YLDMin))+' Min. Yield and '+ALLTRIM(STR(Spec_Check.YLDMax))+' Max.')
					INSERT INTO SpecText (SpecText) VALUES ( "   -Cert is "+IIF(EMPTY(ERPCert.Yield1),"not listed.",ALLTRIM(STR(ERPCert.Yield1)) ))
				ENDIF
			CASE YLDMin > 0 AND YLDMax = 0
				*Check Agianst Min ONLY
				IF m.CertYLD >= YLDMin
					m.CertYLDPass = .T.
				ELSE
					INSERT INTO SpecText (SpecText) VALUES ( "Yield is not within Spec." )
					INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.YLDMin))+' Min. Yield.  Cert is '+IIF(EMPTY(ERPCert.Yield1),"not listed.",ALLTRIM(STR(ERPCert.Yield1))) )
				ENDIF
			CASE YLDMin = 0 AND YLDMax > 0
				*Check Agianst Max ONLY
				IF m.CertYLD <= YLDMax
					m.CertYLDPass = .T.
				ELSE
					INSERT INTO SpecText (SpecText) VALUES ( "Yield is not within Spec." )
					INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.YLDMax))+' Max. Yield.  Cert is '+IIF(EMPTY(ERPCert.Yield1),"not listed.",ALLTRIM(STR(ERPCert.Yield1)) ))
				ENDIF
			OTHERWISE
				*YLD not limited!
				m.CertYLDPass = .T.
			ENDCASE
			IF !m.CertYLDPass
				m.MechPass = .F.
			ELSE
				IF m.CertYLD > 0 AND (m.CertYLD = YLDMin OR m.CertYLD = YLDMax )
					INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.YLDMin))+' Min. Yield and '+ALLTRIM(STR(Spec_Check.YLDMax))+' Max.')
					INSERT INTO SpecText (SpecText) VALUES ( "   -Cert is "+IIF(EMPTY(ERPCert.Yield1),"not listed.",ALLTRIM(STR(ERPCert.Yield1)) ))
				ENDIF
			ENDIF
			Release m.CertYLD
		
			*Check for Elongation
			m.CertEL = (ERPCert.ELONG1)
			m.CertELPass = .F.
			*Check Agianst Min ONLY
			IF m.CertEL >= ELMin
				m.CertELPass = .T.
			ENDIF
			IF !m.CertELPass
				INSERT INTO SpecText (SpecText) VALUES ( "Elongation is not within Spec." )
				INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.ELMin))+' Min. El.  Cert is '+IIF(EMPTY(ERPCert.ELONG1),"not listed.",ALLTRIM(STR(ERPCert.ELONG1)) ))
				m.MechPass = .F.
			ELSE
				IF m.CertEL > 0 AND m.CertEL = ELMin
					INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.ELMin))+' Min. El.  Cert is '+IIF(EMPTY(ERPCert.ELONG1),"not listed.",ALLTRIM(STR(ERPCert.ELONG1)) ))
				ENDIF
			ENDIF
			Release m.CertEL
		
			*Check for Reduction of Area
			m.CertRA = (ERPCert.RA1)
			m.CertRAPass = .F.
			*Check Agianst Min ONLY
			IF m.CertRA >= RAMin
				m.CertRAPass = .T.
			ENDIF
			IF !m.CertRAPass
				INSERT INTO SpecText (SpecText) VALUES ( "Reduction of Area is not within Spec." )
				INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.RAMin))+' Min. RA.')
				INSERT INTO SpecText (SpecText) VALUES ( "   -Cert is "+IIF(EMPTY(ERPCert.RA1),"not listed.",ALLTRIM(STR(ERPCert.RA1)) ))
				m.MechPass = .F.
			ELSE
				IF m.CertRA >0 AND m.CertRA = RAMin
					INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.RAMin))+' Min. RA.')
					INSERT INTO SpecText (SpecText) VALUES ( "   -Cert is "+IIF(EMPTY(ERPCert.RA1),"not listed.",ALLTRIM(STR(ERPCert.RA1)) ))
				ENDIF
			ENDIF
			Release m.CertRA
		
			*Check for Hardness
			PRIVATE m.CertBHN, m.CertRB, m.CertRC, m.HardnessType
			IF EMPTY(ERPCert.Hardness)
				IF BHNmax+BHNmin+Rbmax+Rbmin+Rcmax+Rcmin = 0
					m.CertHardnessPass = .T. &&Does not Fail, not required by spec
				ELSE
					m.CertHardnessPass = .F. &&Hardness not Listed on cert
					m.CertBHNPass = ( BHNmax+BHNmin = 0 )
					m.CertRBPass  = ( Rbmax+Rbmin   = 0 )
					m.CertRBPass  = ( Rcmax+Rcmin   = 0 )
					INSERT INTO SpecText (SpecText) VALUES ( 'No hardness reported on cert. Failed Hardness!' )
				ENDIF
			ELSE &&Cert has a Hardness value
				DO CASE &&Calculate hardness varients
				CASE 'BHN'$ UPPER(ERPCert.Hardness)
					m.CertBHN = VAL(ALLTRIM(RIGHT(ERPCert.Hardness,LEN(ERPCert.Hardness)-(AT('BHN',UPPER(ERPCert.Hardness))+2))))
					m.CertRB = toFormSet.CheckSpec_Hardness(m.CertBHN, 'BHN','RB')
					m.CertRC = toFormSet.Hardness(m.CertBHN, 'BHN','RC')
					m.HardnessType = "BHN"
				CASE 'RB'$ UPPER(ERPCert.Hardness)
					m.CertRB  = VAL(ALLTRIM(RIGHT(ERPCert.Hardness,LEN(ERPCert.Hardness)-(AT('RB',UPPER(ERPCert.Hardness))+1))))
					m.CertBHN = toFormSet.CheckSpec_Hardness(m.CertRb, 'RB','BHN')
					m.CertRC  = toFormSet.CheckSpec_Hardness(m.CertRb, 'RB','RC')
					m.HardnessType = "RB"
				CASE 'RC'$ UPPER(ERPCert.Hardness)
					m.CertRC  = VAL(ALLTRIM(RIGHT(ERPCert.Hardness,LEN(ERPCert.Hardness)-(AT('RC',UPPER(ERPCert.Hardness))+1))))
					m.CertBHN = toFormSet.CheckSpec_Hardness(m.CertRc, 'RC','BHN')
					m.CertRB  = toFormSet.CheckSpec_Hardness(m.CertRc, 'RC','RB')
					m.HardnessType = "RC"
				OTHERWISE
					*type not found but spec requires a value
					m.CertBHN = 0
					m.CertRB = 0
					m.CertRC = 0
					m.HardnessType = " "
				ENDCASE
				m.CertBHNPass = .F.
				m.CertRBPass = .F.
				m.CertRCPass = .F.
				m.CertHardnessPass = .F.
		
				DO CASE &&check Spec hardness requirements
					**********  BHN
				CASE BHNmin > 0 AND BHNmax > 0 AND m.CertBHN > 0
					*Check Agianst Min AND Max
					IF m.CertBHN >= BHNmin AND m.CertBHN <= BHNmax
						m.CertBHNPass = .T.
						m.CertHardnessPass = .T.
						IF m.CertBHN = BHNmin OR m.CertBHN = BHNmax
							INSERT INTO SpecText (SpecText) VALUES ( "BHN is on border of Spec." )
							INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.BHNmin))+' BHN Min. and '+ALLTRIM(STR(Spec_Check.BHNmax))+' BHN Max.')
							INSERT INTO SpecText (SpecText) VALUES ( "   -Cert is "+IIF(EMPTY(ERPCert.Hardness),"not listed.",ALLTRIM(ERPCert.Hardness) ))
							IF m.HardnessType = "RB" OR m.HardnessType = "RC"
								INSERT INTO SpecText (SpecText) VALUES ( "   -Cert hardness converted as BHN"+ALLTRIM(STR(m.CertBHN)))
							ENDIF
						ENDIF	
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "BHN is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.BHNmin))+' BHN Min. and '+ALLTRIM(STR(Spec_Check.BHNmax))+' BHN Max.')
						INSERT INTO SpecText (SpecText) VALUES ( "   -Cert is "+IIF(EMPTY(ERPCert.Hardness),"not listed.",ALLTRIM(ERPCert.Hardness) ))
						IF m.HardnessType = "RB" OR m.HardnessType = "RC"
							INSERT INTO SpecText (SpecText) VALUES ( "   -Cert hardness converted as BHN"+ALLTRIM(STR(m.CertBHN)))
						ENDIF
					ENDIF
				CASE BHNmin > 0 AND BHNmax = 0 AND m.CertBHN > 0
					*Check Agianst Min ONLY
					IF m.CertBHN >= BHNmin
						m.CertBHNPass = .T.
						m.CertHardnessPass = .T.
						IF m.CertBHN = BHNmin 
							INSERT INTO SpecText (SpecText) VALUES ( "BHN is on border of Spec." )
							INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.BHNmin))+' BHN Min.')
							INSERT INTO SpecText (SpecText) VALUES ( "   -Cert is "+IIF(EMPTY(ERPCert.Hardness),"not listed.",ALLTRIM(ERPCert.Hardness) ))
							IF m.HardnessType = "RB" OR m.HardnessType = "RC"
								INSERT INTO SpecText (SpecText) VALUES ( "   -Cert hardness converted as BHN"+ALLTRIM(STR(m.CertBHN)))
							ENDIF
						ENDIF	
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "BHN is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.BHNmin))+' BHN Min. Cert is '+IIF(EMPTY(ERPCert.Hardness),"not listed.",ALLTRIM(ERPCert.Hardness) ))
						IF m.HardnessType = "RB" OR m.HardnessType = "RC"
							INSERT INTO SpecText (SpecText) VALUES ( "   -Cert hardness converted as BHN"+ALLTRIM(STR(m.CertBHN)))
						ENDIF
					ENDIF
				CASE BHNmin = 0 AND BHNmax > 0 AND m.CertBHN > 0
					*Check Agianst Max ONLY
					IF m.CertBHN <= BHNmax
						m.CertBHNPass = .T.
						m.CertHardnessPass = .T.
						IF m.CertBHN = BHNmax
							INSERT INTO SpecText (SpecText) VALUES ( "BHN is on border of Spec." )
							INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.BHNmax))+' BHN Max.')
							INSERT INTO SpecText (SpecText) VALUES ( "   -Cert is "+IIF(EMPTY(ERPCert.Hardness),"not listed.",ALLTRIM(ERPCert.Hardness) ))
							IF m.HardnessType = "RB" OR m.HardnessType = "RC"
								INSERT INTO SpecText (SpecText) VALUES ( "   -Cert hardness converted as BHN"+ALLTRIM(STR(m.CertBHN)))
							ENDIF
						ENDIF	
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "BHN is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.BHNmax))+' BHN Max. Cert is '+IIF(EMPTY(ERPCert.Hardness),"not listed.",ALLTRIM(ERPCert.Hardness) ))
						IF m.HardnessType = "RB" OR m.HardnessType = "RC"
							INSERT INTO SpecText (SpecText) VALUES ( "   -Cert hardness converted as BHN"+ALLTRIM(STR(m.CertBHN)))
						ENDIF
					ENDIF
					*************  Rb
				CASE Rbmin > 0 AND Rbmax > 0 AND m.CertRb > 0
					*Check Agianst Min AND Max
					IF m.CertRB >= Rbmin AND m.CertRB <= Rbmax
						m.CertRBPass = .T.
						m.CertHardnessPass = .T.
						IF m.CertRB = Rbmin OR m.CertRB = Rbmax
							INSERT INTO SpecText (SpecText) VALUES ( "Rockwell B is on border of Spec." )
							INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.Rbmin))+' Min. and '+ALLTRIM(STR(Spec_Check.Rbmax))+' Max.')
							INSERT INTO SpecText (SpecText) VALUES ( "   -Cert is "+IIF(EMPTY(ERPCert.Hardness),"not listed.",ALLTRIM(ERPCert.Hardness) ))
							IF m.HardnessType = "BHN" OR m.HardnessType = "RC"
								INSERT INTO SpecText (SpecText) VALUES ( "   -Cert hardness converted as Rockwell B "+ALLTRIM(STR(m.CertRB)))
							ENDIF
						ENDIF	
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Rockwell B is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.Rbmin))+' Min. and '+ALLTRIM(STR(Spec_Check.Rbmax))+' Max.')
						INSERT INTO SpecText (SpecText) VALUES ( "   -Cert is "+IIF(EMPTY(ERPCert.Hardness),"not listed.",ALLTRIM(ERPCert.Hardness) ))
						IF m.HardnessType = "BHN" OR m.HardnessType = "RC"
							INSERT INTO SpecText (SpecText) VALUES ( "   -Cert hardness converted as Rockwell B "+ALLTRIM(STR(m.CertRB)))
						ENDIF
					ENDIF
				CASE Rbmin > 0 AND Rbmax = 0 AND m.CertRb > 0
					*Check Agianst Min ONLY
					IF m.CertRB >= Rbmin
						m.CertRBPass = .T.
						m.CertHardnessPass = .T.
						IF m.CertRB = Rbmin
							INSERT INTO SpecText (SpecText) VALUES ( "Rockwell B is on border of Spec." )
							INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.Rbmin))+' Min.')
							INSERT INTO SpecText (SpecText) VALUES ( "   -Cert is "+IIF(EMPTY(ERPCert.Hardness),"not listed.",ALLTRIM(ERPCert.Hardness) ))
							IF m.HardnessType = "BHN" OR m.HardnessType = "RC"
								INSERT INTO SpecText (SpecText) VALUES ( "   -Cert hardness converted as Rockwell B "+ALLTRIM(STR(m.CertRB)))
							ENDIF
						ENDIF	
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Rockwell B is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.Rbmin))+' Min. Cert is '+IIF(EMPTY(ERPCert.Hardness),"not listed.",ALLTRIM(ERPCert.Hardness) ))
						IF m.HardnessType = "BHN" OR m.HardnessType = "RC"
							INSERT INTO SpecText (SpecText) VALUES ( "   -Cert hardness converted as Rockwell B "+ALLTRIM(STR(m.CertRB)))
						ENDIF
					ENDIF
				CASE Rbmin = 0 AND Rbmax > 0 AND m.CertRb > 0
					*Check Agianst Max ONLY
					IF m.CertRB <= Rbmax
						m.CertRBPass = .T.
						m.CertHardnessPass = .T.
						IF m.CertRB = Rbmax
							INSERT INTO SpecText (SpecText) VALUES ( "Rockwell B is on border of Spec." )
							INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.Rbmax))+' Max.')
							INSERT INTO SpecText (SpecText) VALUES ( "   -Cert is "+IIF(EMPTY(ERPCert.Hardness),"not listed.",ALLTRIM(ERPCert.Hardness) ))
							IF m.HardnessType = "BHN" OR m.HardnessType = "RC"
								INSERT INTO SpecText (SpecText) VALUES ( "   -Cert hardness converted as Rockwell B "+ALLTRIM(STR(m.CertRB)))
							ENDIF
						ENDIF	
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Rockwell B is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.Rbmax))+' Max. Cert is '+IIF(EMPTY(ERPCert.Hardness),"not listed.",ALLTRIM(ERPCert.Hardness) ))
						IF m.HardnessType = "BHN" OR m.HardnessType = "RC"
							INSERT INTO SpecText (SpecText) VALUES ( "   -Cert hardness converted as Rockwell B "+ALLTRIM(STR(m.CertRB)))
						ENDIF
					ENDIF
					*************  Rc
				CASE Rcmin > 0 AND Rcmax > 0 AND m.CertRC > 0
					*Check Agianst Min AND Max
					IF m.CertRC >= Rcmin AND m.CertRC <= Rcmax
						m.CertRCPass = .T.
						m.CertHardnessPass = .T.
						IF m.CertRC = Rcmin OR m.CertRC = Rcmax
							INSERT INTO SpecText (SpecText) VALUES ( "Rockwell C is on border of Spec." )
							INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.Rcmin))+' Min. and '+ALLTRIM(STR(Spec_Check.Rcmax))+' Max.')
							INSERT INTO SpecText (SpecText) VALUES ( "   -Cert is "+IIF(EMPTY(ERPCert.Hardness),"not listed.",ALLTRIM(ERPCert.Hardness) ))
							IF m.HardnessType = "BHN" OR m.HardnessType = "RB"
								INSERT INTO SpecText (SpecText) VALUES ( "   -Cert hardness converted as Rockwell C "+ALLTRIM(STR(m.CertRC)))
							ENDIF
						ENDIF	
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Rockwell C is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.Rcmin))+' Min. and '+ALLTRIM(STR(Spec_Check.Rcmax))+' Max.')
						INSERT INTO SpecText (SpecText) VALUES ( "   -Cert is "+IIF(EMPTY(ERPCert.Hardness),"not listed.",ALLTRIM(ERPCert.Hardness) ))
						IF m.HardnessType = "BHN" OR m.HardnessType = "RB"
							INSERT INTO SpecText (SpecText) VALUES ( "   -Cert hardness converted as Rockwell C "+ALLTRIM(STR(m.CertRC)))
						ENDIF
					ENDIF
				CASE Rcmin > 0 AND Rcmax = 0 AND m.CertRC > 0
					*Check Agianst Min ONLY
					IF m.CertRC >= Rcmin
						m.CertRCPass = .T.
						m.CertHardnessPass = .T.
						IF m.CertRC = Rcmin
							INSERT INTO SpecText (SpecText) VALUES ( "Rockwell C is on border of Spec." )
							INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.Rcmin))+' Min. ')
							INSERT INTO SpecText (SpecText) VALUES ( "   -Cert is "+IIF(EMPTY(ERPCert.Hardness),"not listed.",ALLTRIM(ERPCert.Hardness) ))
							IF m.HardnessType = "BHN" OR m.HardnessType = "RB"
								INSERT INTO SpecText (SpecText) VALUES ( "   -Cert hardness converted as Rockwell C "+ALLTRIM(STR(m.CertRC)))
							ENDIF
						ENDIF	
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Rockwell C is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.Rcmin))+' Min. Cert is '+IIF(EMPTY(ERPCert.Hardness),"not listed.",ALLTRIM(ERPCert.Hardness) ))
						IF m.HardnessType = "BHN" OR m.HardnessType = "RB"
							INSERT INTO SpecText (SpecText) VALUES ( "   -Cert hardness converted as Rockwell C "+ALLTRIM(STR(m.CertRC)))
						ENDIF
					ENDIF
				CASE Rcmin = 0 AND Rcmax > 0 AND m.CertRC > 0
					*Check Agianst Max ONLY
					IF m.CertRC < Rcmax
						m.CertRCPass = .T.
						m.CertHardnessPass = .T.
						IF m.CertRC = Rcmax
							INSERT INTO SpecText (SpecText) VALUES ( "Rockwell C is on border of Spec." )
							INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.Rcmax))+' Max.')
							INSERT INTO SpecText (SpecText) VALUES ( "   -Cert is "+IIF(EMPTY(ERPCert.Hardness),"not listed.",ALLTRIM(ERPCert.Hardness) ))
							IF m.HardnessType = "BHN" OR m.HardnessType = "RB"
								INSERT INTO SpecText (SpecText) VALUES ( "   -Cert hardness converted as Rockwell C "+ALLTRIM(STR(m.CertRC)))
							ENDIF
						ENDIF	
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Rockwell C is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.Rcmax))+' Max. Cert is '+IIF(EMPTY(ERPCert.Hardness),"not listed.",ALLTRIM(ERPCert.Hardness) ))
						IF m.HardnessType = "BHN" OR m.HardnessType = "RB"
							INSERT INTO SpecText (SpecText) VALUES ( "   -Cert hardness converted as Rockwell C "+ALLTRIM(STR(m.CertRC)))
						ENDIF
					ENDIF
					************* No Spec Hardness
				CASE BHNmax+BHNmin+Rbmax+Rbmin+Rcmax+Rcmin = 0
					m.CertHardnessPass = .T. &&Does not Fail, not required by spec
					m.CertBHNPass = .T.
					m.CertRBPass  = .T.
					m.CertRBPass  = .T.
				OTHERWISE  && Spec has a limit but Could not find Cert Value
					m.msg=""
					IF BHNmin > 0
						INSERT INTO SpecText (SpecText) VALUES ( "Spec requires Minimum BHN of "+STR(Spec_Check.BHNmin,3,0) )
						m.msg="Spec requires Minimum BHN of "+ALLTRIM(STR(BHNmin,3,0))+ CHR(13)
					ENDIF
					IF BHNmax > 0
						INSERT INTO SpecText (SpecText) VALUES ( "Spec requires Maximum BHN of "+STR(Spec_Check.BHNmax,3,0) )
						m.msg=m.msg+"Spec requires Maximum BHN of "+ALLTRIM(STR(BHNmax,3,0))+CHR(13)
					ENDIF
					IF Rbmin > 0
						INSERT INTO SpecText (SpecText) VALUES ( "Spec requires Minimum Rb of "+STR(Spec_Check.Rbmin,3,0) )
						m.msg="Spec requires Minimum Rb of "+ALLTRIM(STR(Rbmin,3,0))+CHR(13)
					ENDIF
					IF Rbmax > 0
						INSERT INTO SpecText (SpecText) VALUES ( "Spec requires Maximum Rb of "+STR(Spec_Check.Rbmax,3,0) )
						m.msg=m.msg+"Spec requires Maximum Rb of "+ALLTRIM(STR(Rbmax,3,0))+CHR(13)
					ENDIF
					IF Rcmin > 0
						INSERT INTO SpecText (SpecText) VALUES ( "Spec requires Minimum Rc of "+STR(Spec_Check.Rcmin,3,0) )
						m.msg="Spec requires Minimum Rc of "+ALLTRIM(STR(Rcmin,3,0))+CHR(13)
					ENDIF
					IF Rcmax > 0
						INSERT INTO SpecText (SpecText) VALUES ( "Spec requires Maximum Rc of "+STR(Spec_Check.Rcmax,3,0) )
						m.msg=m.msg+"Spec requires Maximum Rc of "+ALLTRIM(STR(Rcmax,3,0))+CHR(13)
					ENDIF
					INSERT INTO SpecText (SpecText) VALUES ( "   -The Cert has "+IIF(EMPTY(ERPCert.Hardness),'no value!',(ERPCert.Hardness) ) )
					m.msg=m.msg+"The Cert has "+IIF(EMPTY(ERPCert.Hardness),'no value!',(ERPCert.Hardness) )
					m.cptn="Does the Hardness meet"
					m.msgb = MESSAGEBOX(m.msg,4+32+256,m.cptn)
					IF m.msgb = 6 &&Yes
						INSERT INTO SpecText (SpecText) VALUES ( "   -User input says Hardness does meet the spec" )
						m.CertBHNPass = .T.
						m.CertRBPass = .T.
						m.CertRCPass = .T.
						m.CertHardnessPass = .T.
					ENDIF
					IF m.msgb = 7 &&NO
						m.CertBHNPass = .F.
						m.CertRBPass = .F.
						m.CertRCPass = .F.
						m.CertHardnessPass = .F.
					ENDIF
		
				ENDCASE
			ENDIF &&Hardness
			IF !m.CertHardnessPass 
				m.MechPass = .F.
			ENDIF
		
			Release m.CertBHN
			Release m.CertRC
			Release m.CertRB
		
		
			*Check for GrainSize
			m.CertGrainPass = .F.
			IF EMPTY(GrainMin) AND EMPTY(GrainMax)
				m.CertGrainPass = .T.
			ELSE
				m.msg=""
				IF !EMPTY(GrainMin)
					INSERT INTO SpecText (SpecText) VALUES ( "Spec requires Minimum Grain Size of "+Spec_Check.GrainMin )
					m.msg="Spec requires Minimum of "+GrainMin+CHR(13)
				ENDIF
				IF !EMPTY(GrainMax)
					INSERT INTO SpecText (SpecText) VALUES ( "Spec requires Maximum Grain Size of "+Spec_Check.GrainMax )
					m.msg=m.msg+"Spec requires Maximum of "+GrainMax+CHR(13)
				ENDIF
				INSERT INTO SpecText (SpecText) VALUES ( "   -The Cert has "+IIF(EMPTY(ERPCert.GrainSize),'no value!',ERPCert.GrainSize))
				m.msg=m.msg+"The Cert has "+IIF(EMPTY(ERPCert.GrainSize),'no value!',ERPCert.GrainSize)
				m.cptn="Does the grain size meet"
				m.msgb = MESSAGEBOX(m.msg,4+32+256,m.cptn)
				IF m.msgb = 6 &&Yes
					INSERT INTO SpecText (SpecText) VALUES ( "   -User input says Grain Size does meet the spec" )
					m.CertGrainPass = .T.
				ENDIF
				IF m.msgb = 7 &&NO
					INSERT INTO SpecText (SpecText) VALUES ( "   -User input says Grain Size does not meet the spec" )
					INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+IIF(EMPTY(Spec_Check.GrainMin),'NO',Spec_Check.GrainMin)+' Min. and '+IIF(EMPTY(Spec_Check.GrainMax),"NO",Spec_Check.GrainMax)+' Max. Cert is '+ALLTRIM(ERPCert.GrainSize) )
					m.CertGrainPass = .F.
				ENDIF
			ENDIF &&EMPTY(ERPCert.Hardness)
			IF !m.CertGrainPass
				m.MechPass = .F.
			ENDIF
		
			******************************************
			******State Mechanicals
		
		
			IF m.MechPass
				INSERT INTO SpecText (SpecText) VALUES ( 'Did not fail mechanicals.' )
				WAIT WINDOW 'Did not fail mechanicals' TIMEOUT 1
			ELSE
				INSERT INTO SpecText (SpecText) VALUES ( 'Does not meet mechanicals.' )
			ENDIF
		
			************************************************************************************
			************************&&Check Chemistry*******************************************
			************************************************************************************
			
			************************************************************************************
			************************&&Check Chemistry*******************************************
			************************************************************************************
		
			************************************************************************************
			************************&&Check Chemistry*******************************************
			************************************************************************************
		
			m.ChemPass =.T.
			INSERT INTO SpecText (SpecText) VALUES ( REPLICATE(' -',30) )
			
			**Check percentage of Al
			m.CertAlPass = .T. &&True even if not required
			IF AlMax > 0 or AlMin > 0 OR AlRem
				**Al needs to be checked
		
				m.CertAl = VAL(ERPCert.Al)
				m.CertAlPass = .F.
				DO CASE
				CASE EMPTY(ERPCert.Al)
					m.CertAlPass = .F.
					INSERT INTO SpecText (SpecText) VALUES ( "Al is not reported on Cert." )
				CASE m.CertAl = 0 AND !EMPTY(ERPCert.Al)
					*No numeric value 
					IF AlRem 
						m.CertAlPass = .T.  && must be Balance
					ENDIF
				CASE AlRem
					*Spec asks for balance and cert has a number
					IF m.CertAl > 50 &&More than 50% is balance
						m.CertAlPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Al is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.AlMin,6,3))+' Min. Cert is '+IIF(EMPTY(ERPCert.Al),"not listed.",ALLTRIM(ERPCert.Al) ))
					ENDIF
				CASE AlMin > 0 AND AlMax > 0
					*Check Agianst Min AND Max
					IF m.CertAl >= AlMin AND m.CertAl <= AlMax
						m.CertAlPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Al is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.AlMin,6,3))+' Min. and '+ALLTRIM(STR(Spec_Check.AlMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.Al),"not listed.",ALLTRIM(ERPCert.Al) ))
					ENDIF
				CASE AlMin > 0 AND AlMax = 0
					*Check Agianst Min ONLY
					IF m.CertAl >= AlMin
						m.CertAlPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Al is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.AlMin,6,3))+' Min. Cert is '+IIF(EMPTY(ERPCert.Al),"not listed.",ALLTRIM(ERPCert.Al) ))
					ENDIF
				CASE AlMin = 0 AND AlMax > 0
					*Check Agianst Max ONLY
					IF m.CertAl <= AlMax
						m.CertAlPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Al is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.AlMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.Al),"not listed.",ALLTRIM(ERPCert.Al) ))
					ENDIF
				OTHERWISE
					*Al not limited!
					m.CertAlPass = .T.
				ENDCASE
				Release m.CertAl
			ENDIF
		
			**Check Percentage of B
		
			m.CertBPass = .T. &&True even if not required
			IF BMax > 0 or BMin > 0
				**B needs to be checked
		
				m.CertB = VAL(ERPCert.B)
				m.CertBPass = .F.
				DO CASE
				CASE EMPTY(ERPCert.B)
					m.CertBPass = .F.
					INSERT INTO SpecText (SpecText) VALUES ( "B is not reported on Cert." )
				CASE BMin > 0 AND BMax > 0
					*Check Agianst Min AND Max
					IF m.CertB >= BMin AND m.CertB <= BMax
						m.CertBPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "B is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.BMin,6,3))+' Min. and '+ALLTRIM(STR(Spec_Check.BMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.B),"not listed.",ALLTRIM(ERPCert.B) ))
					ENDIF
				CASE BMin > 0 AND BMax = 0
					*Check Agianst Min ONLY
					IF m.CertB >= BMin
						m.CertBPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "B is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.BMin,6,3))+' Min. Cert is '+IIF(EMPTY(ERPCert.B),"not listed.",ALLTRIM(ERPCert.B) ))
					ENDIF
				CASE BMin = 0 AND BMax > 0
					*Check Agianst Max ONLY
					IF m.CertB <= BMax
						m.CertBPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "B is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.BMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.B),"not listed.",ALLTRIM(ERPCert.B) ))
					ENDIF
				OTHERWISE
					*B not limited!
					m.CertBPass = .T.
				ENDCASE
				Release m.CertB
			ENDIF
		
			**Check Percentage of Be
		
			m.CertBePass = .T. &&True even if not required
			IF BeMax > 0 or BeMin > 0
				**Be needs to be checked
		
				m.CertBe = VAL(ERPCert.Be)
				m.CertBePass = .F.
				DO CASE
				CASE EMPTY(ERPCert.Be)
					m.CertBEPass = .F.
					INSERT INTO SpecText (SpecText) VALUES ( "Be is not reported on Cert." )
				CASE BeMin > 0 AND BeMax > 0
					*Check Agianst Min AND Max
					IF m.CertBe >= BeMin AND m.CertBe <= BeMax
						m.CertBePass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Be is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.BeMin,6,3))+' Min. and '+ALLTRIM(STR(Spec_Check.AlMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.Be),"not listed.",ALLTRIM(ERPCert.Be) ))
					ENDIF
				CASE BeMin > 0 AND BeMax = 0
					*Check Agianst Min ONLY
					IF m.CertBe >= BeMin
						m.CertBePass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Be is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.BeMin,6,3))+' Min. Cert is '+IIF(EMPTY(ERPCert.Be),"not listed.",ALLTRIM(ERPCert.Be) ))
					ENDIF
				CASE BeMin = 0 AND BeMax > 0
					*Check Agianst Max ONLY
					IF m.CertBe <= BeMax
						m.CertBePass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Be is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.BeMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.Be),"not listed.",ALLTRIM(ERPCert.Be) ))
					ENDIF
				OTHERWISE
					*Be not limited!
					m.CertBePass = .T.
				ENDCASE
				Release m.CertBe
			ENDIF
		
			**Check Percentage of C
		
			m.CertCPass = .T. &&True even if not required
			IF CMax > 0 or CMin > 0
				**C needs to be checked
		
				m.CertC = VAL(ERPCert.C)
				m.CertCPass = .F.
				DO CASE
				CASE EMPTY(ERPCert.C)
					m.CertCPass = .F.
					INSERT INTO SpecText (SpecText) VALUES ( "C is not reported on Cert." )
				CASE CMin > 0 AND CMax > 0
					*Check Agianst Min AND Max
					IF m.CertC >= CMin AND m.CertC <= CMax
						m.CertCPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "C is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.CMin,6,3))+' Min. and '+ALLTRIM(STR(Spec_Check.CMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.C),"not listed.",ALLTRIM(ERPCert.C) ))
					ENDIF
				CASE CMin > 0 AND CMax = 0
					*Check Agianst Min ONLY
					IF m.CertC >= CMin
						m.CertCPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "C is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.CMin,6,3))+' Min. Cert is '+IIF(EMPTY(ERPCert.C),"not listed.",ALLTRIM(ERPCert.C) ))
					ENDIF
				CASE CMin = 0 AND CMax > 0
					*Check Agianst Max ONLY
					IF m.CertC <= CMax
						m.CertCPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "C is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.CMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.C),"not listed.",ALLTRIM(ERPCert.C) ))
					ENDIF
				OTHERWISE
					*C not limited!
					m.CertCPass = .T.
				ENDCASE
				Release m.CertC
			ENDIF
		
			**Check Percentage of Cb
		
			m.CertCbPass = .T. &&True even if not required
			IF CbMax > 0 or CbMin > 0
				**Cb needs to be checked
		
				m.CertCb = VAL(ERPCert.Cb)
				m.CertCbPass = .F.
				DO CASE
				CASE EMPTY(ERPCert.Cb)
					m.CertCbPass = .F.
					INSERT INTO SpecText (SpecText) VALUES ( "Cb is not reported on Cert." )
				CASE CbMin > 0 AND CbMax > 0
					*Check Agianst Min AND Max
					IF m.CertCb >= CbMin AND m.CertCb <= CbMax
						m.CertCbPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Cb is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.CbMin,6,3))+' Min. and '+ALLTRIM(STR(Spec_Check.CbMax))+' Max. Cert is '+IIF(EMPTY(ERPCert.Cb),"not listed.",ALLTRIM(ERPCert.Cb) ))
					ENDIF
				CASE CbMin > 0 AND CbMax = 0
					*Check Agianst Min ONLY
					IF m.CertCb >= CbMin
						m.CertCbPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Cb is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.CbMin,6,3))+' Min. Cert is '+IIF(EMPTY(ERPCert.Cb),"not listed.",ALLTRIM(ERPCert.Cb) ))
					ENDIF
				CASE CbMin = 0 AND CbMax > 0
					*Check Agianst Max ONLY
					IF m.CertCb <= CbMax
						m.CertCbPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Cb is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.CbMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.Cb),"not listed.",ALLTRIM(ERPCert.Cb) ))
					ENDIF
				OTHERWISE
					*Cb not limited!
					m.CertCbPass = .T.
				ENDCASE
				Release m.CertCb
			ENDIF
		
			**Check percentage of Co
		
			m.CertCoPass = .T. &&True even if not required
			IF CoMax > 0 or CoMin > 0 OR CoRem
				**Co needs to be checked
				m.CertCo = VAL(ERPCert.Co)
				m.CertCoPass = .F.
				DO CASE
				CASE EMPTY(ERPCert.Co)
					m.CertCoPass = .F.
					INSERT INTO SpecText (SpecText) VALUES ( "Co is not reported on Cert." )
				CASE m.CertCo = 0 AND !EMPTY(ERPCert.Co)
					*No numeric value - must be Balance
					IF CoRem
						m.CertCoPass = .T.
					ENDIF
				CASE CoRem
					*Spec asks for balance and cert has a number
					IF m.CertCo > 30 &&More than 30% is balance
						m.CertCoPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Co is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.CoMin,6,3))+' Min. and '+ALLTRIM(STR(Spec_Check.CoMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.Co),"not listed.",ALLTRIM(ERPCert.Co) ))
					ENDIF
				CASE CoMin > 0 AND CoMax > 0
					*Check Agianst Min AND Max
					IF m.CertCo >= CoMin AND m.CertCo <= CoMax
						m.CertCoPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Co is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.CoMin,6,3))+' Min. and '+ALLTRIM(STR(Spec_Check.CoMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.Co),"not listed.",ALLTRIM(ERPCert.Co) ))
					ENDIF
				CASE CoMin > 0 AND CoMax = 0
					*Check Agianst Min ONLY
					IF m.CertCo >= CoMin
						m.CertCoPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Co is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.CoMin,6,3))+' Min.  ert is '+IIF(EMPTY(ERPCert.Co),"not listed.",ALLTRIM(ERPCert.Co) ))
					ENDIF
				CASE CoMin = 0 AND CoMax > 0
					*Check Agianst Max ONLY
					IF m.CertCo <= CoMax
						m.CertCoPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Co is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.CoMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.Co),"not listed.",ALLTRIM(ERPCert.Co) ))
					ENDIF
				OTHERWISE
					*Co not limited!
					m.CertCoPass = .T.
				ENDCASE
				Release m.CertCo
			ENDIF
		
			**Check Percentage of Cr
		
			m.CertCrPass = .T. &&True even if not required
			IF CrMax > 0 or CrMin > 0
				**Cr needs to be checked
				m.CertCr = VAL(ERPCert.Cr)
				m.CertCrPass = .F.
				DO CASE
				CASE EMPTY(ERPCert.Cr)
					m.CertCrPass = .F.
					INSERT INTO SpecText (SpecText) VALUES ( "Cr is not reported on Cert." )
				CASE CrMin > 0 AND CrMax > 0
					*Check Agianst Min AND Max
					IF m.CertCr >= CrMin AND m.CertCr <= CrMax
						m.CertCrPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Cr is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.CrMin,6,3))+' Min. and '+ALLTRIM(STR(Spec_Check.CrMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.Cr),"not listed.",ALLTRIM(ERPCert.Cr) ))
					ENDIF
				CASE CrMin > 0 AND CrMax = 0
					*Check Agianst Min ONLY
					IF m.CertCr >= CrMin
						m.CertCrPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Cr is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.CrMin,6,3))+' Min. Cert is '+IIF(EMPTY(ERPCert.Cr),"not listed.",ALLTRIM(ERPCert.Cr) ))
					ENDIF
				CASE CrMin = 0 AND CrMax > 0
					*Check Agianst Max ONLY
					IF m.CertCr <= CrMax
						m.CertCrPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Cr is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.CrMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.Cr),"not listed.",ALLTRIM(ERPCert.Cr) ))
					ENDIF
				OTHERWISE
					*Cr not limited!
					m.CertCrPass = .T.
				ENDCASE
				Release m.CertCr
			ENDIF
		
			**Check percentage of Cu
		
			m.CertCuPass = .T. &&True even if not required
			IF CuMax > 0 or CuMin > 0 OR CuRem
				**Cu needs to be checked
		
				m.CertCu = VAL(ERPCert.Cu)
				m.CertCuPass = .F.
				DO CASE
				CASE EMPTY(ERPCert.Cu)
					m.CertCuPass = .F.
					INSERT INTO SpecText (SpecText) VALUES ( "Cu is not reported on Cert." )
				CASE m.CertCu = 0 AND !EMPTY(ERPCert.Cu)
					*No numeric value - must be Balance
					IF CuRem
						m.CertCuPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Cu is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.CuMin,6,3))+' Min. and '+ALLTRIM(STR(Spec_Check.CuMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.Cu),"not listed.",ALLTRIM(ERPCert.Cu) ))
					ENDIF
				CASE CuRem
					*Spec asks for balance and cert has a number
					IF m.CertCu > 30 &&More than 30% is balance
						m.CertCuPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Cu is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.CuMin,6,3))+' Min. and '+ALLTRIM(STR(Spec_Check.CuMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.Cu),"not listed.",ALLTRIM(ERPCert.Cu) ))
					ENDIF
				CASE CuMin > 0 AND CuMax > 0
					*Check Agianst Min AND Max
					IF m.CertCu >= CuMin AND m.CertCu <= CuMax
						m.CertCuPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Cu is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.CuMin,6,3))+' Min. and '+ALLTRIM(STR(Spec_Check.CuMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.Cu),"not listed.",ALLTRIM(ERPCert.Cu) ))
					ENDIF
				CASE CuMin > 0 AND CuMax = 0
					*Check Agianst Min ONLY
					IF m.CertCu >= CuMin
						m.CertCuPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Cu is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.CuMin,6,3))+' Min. Cert is '+IIF(EMPTY(ERPCert.Cu),"not listed.",ALLTRIM(ERPCert.Cu) ))
					ENDIF
				CASE CuMin = 0 AND CuMax > 0
					*Check Agianst Max ONLY
					IF m.CertCu <= CuMax
						m.CertCuPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Cu is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.CuMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.Cu),"not listed.",ALLTRIM(ERPCert.Cu) ))
					ENDIF
				OTHERWISE
					*Cu not limited!
					m.CertCuPass = .T.
				ENDCASE
				Release m.CertCu
			ENDIF
		
			**Check percentage of Fe
		
			m.CertFePass = .T. &&True even if not required
			IF FeMax > 0 or FeMin > 0 OR FeRem
				**Fe needs to be checked
		
				m.CertFe = VAL(ERPCert.Fe)
				m.CertFePass = .F.
				DO CASE
				CASE EMPTY(ERPCert.Fe)
					m.CertFePass = .F.
					INSERT INTO SpecText (SpecText) VALUES ( "Fe is not reported on Cert." )
					INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires Fe." )
				CASE m.CertFe = 0 AND !EMPTY(ERPCert.Fe)
					*No numeric value - must be Balance
					IF FeRem
						m.CertFePass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Fe is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires BALANCE of Fe.  Cert is "+IIF(EMPTY(ERPCert.Fe),"not listed.",ALLTRIM(ERPCert.Fe) ))
					ENDIF
				CASE FeRem
					*Spec asks for balance and cert has a number
					IF m.CertFe > 30 &&More than 30% is balance
						m.CertFePass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Fe is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires BALANCE of Fe.  Cert is "+IIF(EMPTY(ERPCert.Fe),"not listed.",ALLTRIM(ERPCert.Fe) ))
					ENDIF
				CASE FeMin >= 0 AND FeMax >= 0
					*Check Agianst Min AND Max
					IF m.CertFe > FeMin AND m.CertFe < FeMax
						m.CertFePass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Fe is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.FeMin,6,3))+' Min. and '+ALLTRIM(STR(Spec_Check.FeMax))+' Max. Cert is '+IIF(EMPTY(ERPCert.Fe),"not listed.",ALLTRIM(ERPCert.Fe) ))
					ENDIF
				CASE FeMin > 0 AND FeMax = 0
					*Check Agianst Min ONLY
					IF m.CertFe >= FeMin
						m.CertFePass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Fe is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.FeMin,6,3))+' Min. Cert is '+IIF(EMPTY(ERPCert.Fe),"not listed.",ALLTRIM(ERPCert.Fe) ))
					ENDIF
				CASE FeMin = 0 AND FeMax > 0
					*Check Agianst Max ONLY
					IF m.CertFe <= FeMax
						m.CertFePass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Fe is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.FeMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.Fe),"not listed.",ALLTRIM(ERPCert.Fe) ))
					ENDIF
				OTHERWISE
					*Fe not limited!
					m.CertFePass = .T.
				ENDCASE
				Release m.CertFe
			ENDIF
		
			**Check Percentage of H
		
			m.CertHPass = .T. &&True even if not required
			IF HMax > 0 or HMin > 0
				**H needs to be checked
		
				m.CertH = VAL(ERPCert.H)
				m.CertHPass = .F.
				DO CASE
				CASE EMPTY(ERPCert.H)
					m.CertHPass = .F.
					INSERT INTO SpecText (SpecText) VALUES ( "H is not reported on Cert." )
				CASE HMin > 0 AND HMax > 0
					*Check Agianst Min AND Max
					IF m.CertH >= HMin AND m.CertH <= HMax
						m.CertHPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "H is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.HMin,6,3))+' Min. and '+ALLTRIM(STR(Spec_Check.HMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.H),"not listed.",ALLTRIM(ERPCert.H) ))
					ENDIF
				CASE HMin > 0 AND HMax = 0
					*Check Agianst Min ONLY
					IF m.CertH >= HMin
						m.CertHPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "H is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.HMin,6,3))+' Min. Cert is '+IIF(EMPTY(ERPCert.H),"not listed.",ALLTRIM(ERPCert.H) ))
					ENDIF
				CASE HMin = 0 AND HMax > 0
					*Check Agianst Max ONLY
					IF m.CertH <= HMax
						m.CertHPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "H is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.HMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.H),"not listed.",ALLTRIM(ERPCert.H) ))
					ENDIF
				OTHERWISE
					*H not limited!
					m.CertHPass = .T.
				ENDCASE
				Release m.CertH
			ENDIF
		
			**Check percentage of Mg
			m.CertMgPass = .T. &&True even if not required
			IF MgMax > 0 or MgMin > 0 OR MgRem
				**Mg needs to be checked
				m.CertMg = VAL(ERPCert.Mg)
				m.CertMgPass = .F.
				DO CASE
				CASE EMPTY(ERPCert.Mg)
					m.CertMgPass = .F.
					INSERT INTO SpecText (SpecText) VALUES ( "Mg is not reported on Cert." )
				CASE m.CertMg = 0 AND !EMPTY(ERPCert.Mg)
					*No numeric value - must be Balance
					IF MgRem
						m.CertMgPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Mg is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires BALANCE of Mg.  Cert is "+IIF(EMPTY(ERPCert.Mg),"not listed.",ALLTRIM(ERPCert.Mg) ))
					ENDIF
				CASE MgRem
					*Spec asks for balance and cert has a number
					IF m.CertMg > 30 &&More than 30% is balance
						m.CertMgPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Mg is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires BALANCE of Mg.  Cert is "+IIF(EMPTY(ERPCert.Mg),"not listed.",ALLTRIM(ERPCert.Mg) ))
					ENDIF
				CASE MgMin > 0 AND MgMax > 0
					*Check Agianst Min AND Max
					IF m.CertMg >= MgMin AND m.CertMg <= MgMax
						m.CertMgPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Mg is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.MgMin,6,3))+' Min. and '+ALLTRIM(STR(Spec_Check.MgMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.Mg),"not listed.",ALLTRIM(ERPCert.Mg) ))
					ENDIF
				CASE MgMin > 0 AND MgMax = 0
					*Check Agianst Min ONLY
					IF m.CertMg >= MgMin
						m.CertMgPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Mg is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.MgMin,6,3))+' Min. Cert is '+IIF(EMPTY(ERPCert.Mg),"not listed.",ALLTRIM(ERPCert.Mg) ))
					ENDIF
				CASE MgMin = 0 AND MgMax > 0
					*Check Agianst Max ONLY
					IF m.CertMg <= MgMax
						m.CertMgPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Mg is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.MgMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.Mg),"not listed.",ALLTRIM(ERPCert.Mg) ))
					ENDIF
				OTHERWISE
					*Mg not limited!
					m.CertMgPass = .T.
				ENDCASE
				Release m.CertMg
			ENDIF
		
			**Check percentage of Mo
			m.CertMoPass = .T. &&True even if not required
			IF MoMax > 0 or MoMin > 0 OR MoRem
				**Mo needs to be checked
				m.CertMo = VAL(ERPCert.Mo)
				m.CertMoPass = .F.
				DO CASE
				CASE EMPTY(ERPCert.Mo)
					m.CertMoPass = .F.
					INSERT INTO SpecText (SpecText) VALUES ( "Mo is not reported on Cert." )
				CASE m.CertMo = 0 AND !EMPTY(ERPCert.Mo)
					*No numeric value - must be Balance
					IF MoRem
						m.CertMoPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Mo is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires BALANCE of Mo. Cert is "+IIF(EMPTY(ERPCert.Mo),"not listed.",ALLTRIM(ERPCert.Mo) ))
					ENDIF
				CASE MoRem
					*Spec asks for balance and cert has a number
					IF m.CertMo > 30 &&More than 30% is balance
						m.CertMoPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Mo is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires BALANCE of Mo. Cert is "+IIF(EMPTY(ERPCert.Mo),"not listed.",ALLTRIM(ERPCert.Mo) ))
					ENDIF
				CASE MoMin > 0 AND MoMax > 0
					*Check Agianst Min AND Max
					IF m.CertMo >= MoMin AND m.CertMo <= MoMax
						m.CertMoPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Mo is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.MoMin,6,3))+' Min. and '+ALLTRIM(STR(Spec_Check.MoMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.Mo),"not listed.",ALLTRIM(ERPCert.Mo) ))
					ENDIF
				CASE MoMin > 0 AND MoMax = 0
					*Check Agianst Min ONLY
					IF m.CertMo >= MoMin
						m.CertMoPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Mo is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.MoMin,6,3))+' Min.  Cert is '+IIF(EMPTY(ERPCert.Mo),"not listed.",ALLTRIM(ERPCert.Mo) ))
					ENDIF
				CASE MoMin = 0 AND MoMax > 0
					*Check Agianst Max ONLY
					IF m.CertMo <= MoMax
						m.CertMoPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Mo is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.MoMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.Mo),"not listed.",ALLTRIM(ERPCert.Mo) ))
					ENDIF
				OTHERWISE
					*Mo not limited!
					m.CertMoPass = .T.
				ENDCASE
				Release m.CertMo
			ENDIF
		
			**Check Percentage of Mn
		
			m.CertMnPass = .T. &&True even if not required
			IF MnMax > 0 or MnMin > 0
				**Mn needs to be checked
		
				m.CertMn = VAL(ERPCert.Mn)
				m.CertMnPass = .F.
				DO CASE
				CASE EMPTY(ERPCert.Mn)
					m.CertMnPass = .F.
					INSERT INTO SpecText (SpecText) VALUES ( "Mn is not reported on Cert." )
				CASE MnMin > 0 AND MnMax > 0
					*Check Agianst Min AND Max
					IF m.CertMn >= MnMin AND m.CertMn <= MnMax
						m.CertMnPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Mn is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.MnMin,6,3))+' Min. and '+ALLTRIM(STR(Spec_Check.MnMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.Mn),"not listed.",ALLTRIM(ERPCert.Mn) ))
					ENDIF
				CASE MnMin > 0 AND MnMax = 0
					*Check Agianst Min ONLY
					IF m.CertMn >= MnMin
						m.CertMnPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Mn is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.MnMin,6,3))+' Min. Cert is '+IIF(EMPTY(ERPCert.Mn),"not listed.",ALLTRIM(ERPCert.Mn) ))
					ENDIF
				CASE MnMin = 0 AND MnMax > 0
					*Check Agianst Max ONLY
					IF m.CertMn <= MnMax
						m.CertMnPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Mn is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.MnMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.Mn),"not listed.",ALLTRIM(ERPCert.Mn) ))
					ENDIF
				OTHERWISE
					*Mn not limited!
					m.CertMnPass = .T.
				ENDCASE
				Release m.CertMn
			ENDIF
		
			**Check Percentage of N
		
			m.CertNPass = .T. &&True even if not required
			IF NMax > 0 or NMin > 0
				**N needs to be checked
		
				m.CertN = VAL(ERPCert.N)
				m.CertNPass = .F.
				DO CASE
				CASE EMPTY(ERPCert.N)
					m.CertNPass = .F.
					INSERT INTO SpecText (SpecText) VALUES ( "N is not reported on Cert." )
				CASE NMin > 0 AND NMax > 0
					*Check Agianst Min AND Max
					IF m.CertN >= NMin AND m.CertN <= NMax
						m.CertNPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "N is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.NMin,6,3))+' Min. and '+ALLTRIM(STR(Spec_Check.NMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.N),"not listed.",ALLTRIM(ERPCert.N) ))
					ENDIF
				CASE NMin > 0 AND NMax = 0
					*Check Agianst Min ONLY
					IF m.CertN >= NMin
						m.CertNPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "N is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.NMin,6,3))+' Min.  Cert is '+IIF(EMPTY(ERPCert.N),"not listed.",ALLTRIM(ERPCert.N) ))
					ENDIF
				CASE NMin = 0 AND NMax > 0
					*Check Agianst Max ONLY
					IF m.CertN <= NMax
						m.CertNPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "N is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.NMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.N),"not listed.",ALLTRIM(ERPCert.N) ))
					ENDIF
				OTHERWISE
					*N not limited!
					m.CertNPass = .T.
				ENDCASE
				Release m.CertN
			ENDIF
		
			**Check Percentage of Na
		
			m.CertNaPass = .T. &&True even if not required
			IF NaMax > 0 or NaMin > 0
				**Na needs to be checked
		
				m.CertNa = VAL(ERPCert.Na)
				m.CertNaPass = .F.
				DO CASE
				CASE EMPTY(ERPCert.Na)
					m.CertNaPass = .F.
					INSERT INTO SpecText (SpecText) VALUES ( "Na is not reported on Cert." )
				CASE NaMin > 0 AND NaMax > 0
					*Check Agianst Min AND Max
					IF m.CertNa >= NaMin AND m.CertNa <= NaMax
						m.CertNaPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Na is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.NaMin,6,3))+' Min. and '+ALLTRIM(STR(Spec_Check.NaMax))+' Max. Cert is '+IIF(EMPTY(ERPCert.Na),"not listed.",ALLTRIM(ERPCert.Na) ))
					ENDIF
				CASE NaMin > 0 AND NaMax = 0
					*Check Agianst Min ONLY
					IF m.CertNa >= NaMin
						m.CertNaPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Na is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.NaMin,6,3))+' Min.  Cert is '+IIF(EMPTY(ERPCert.Na),"not listed.",ALLTRIM(ERPCert.Na) ))
					ENDIF
				CASE NaMin = 0 AND NaMax > 0
					*Check Agianst Max ONLY
					IF m.CertNa <= NaMax
						m.CertNaPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Na is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.NaMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.Na),"not listed.",ALLTRIM(ERPCert.Na) ))
					ENDIF
				OTHERWISE
					*Na not limited!
					m.CertNaPass = .T.
				ENDCASE
				Release m.CertNa
			ENDIF
		
			**Check Percentage of Nb
		
			m.CertNbPass = .T. &&True even if not required
			IF NbMax > 0 or NbMin > 0
				**Nb needs to be checked
		
				m.CertNb = VAL(ERPCert.Nb)
				m.CertNbPass = .F.
				DO CASE
				CASE EMPTY(ERPCert.Nb)
					m.CertNbPass = .F.
					INSERT INTO SpecText (SpecText) VALUES ( "Nb is not reported on Cert." )
				CASE NbMin > 0 AND NbMax > 0
					*Check Agianst Min AND Max
					IF m.CertNb >= NbMin AND m.CertNb <= NbMax
						m.CertNbPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Nb is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.NbMin,6,3))+' Min. and '+ALLTRIM(STR(Spec_Check.NbMax))+' Max. Cert is '+IIF(EMPTY(ERPCert.Nb),"not listed.",ALLTRIM(ERPCert.Nb) ))
					ENDIF
				CASE NbMin > 0 AND NbMax = 0
					*Check Agianst Min ONLY
					IF m.CertNb >= NbMin
						m.CertNbPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Nb is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.NbMin,6,3))+' Min.  Cert is '+IIF(EMPTY(ERPCert.Nb),"not listed.",ALLTRIM(ERPCert.Nb) ))
					ENDIF
				CASE NbMin = 0 AND NbMax > 0
					*Check Agianst Max ONLY
					IF m.CertNb <= NbMax
						m.CertNbPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Nb is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.NbMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.Nb),"not listed.",ALLTRIM(ERPCert.Nb) ))
					ENDIF
				OTHERWISE
					*Nb not limited!
					m.CertNbPass = .T.
				ENDCASE
				Release m.CertNb
			ENDIF
		
			**Check percentage of Ni
			m.CertNiPass = .T. &&True even if not required
			IF NiMax > 0 or NiMin > 0 OR NiRem
				**Ni needs to be checked
		
				m.CertNi = VAL(ERPCert.Ni)
				m.CertNiCo = VAL(ERPCert.NiandCo)
				m.CertNiPass = .F.
				DO CASE
				CASE EMPTY(ERPCert.Ni)
					IF EMPTY(ERPCert.NiandCo)
						m.CertNiPass = .F.
						INSERT INTO SpecText (SpecText) VALUES ( "Ni is not reported on Cert." )
					ELSE
						DO CASE
						CASE NiMin > 0 AND NiMax > 0
							*Check Agianst Min AND Max
							IF m.CertNiCo >= NiMin AND m.CertNiCo <= NiMax
								m.CertNiPass = .T.
								INSERT INTO SpecText (SpecText) VALUES ( "NOTE: Nickel alone is not reported on Cert." )
								INSERT INTO SpecText (SpecText) VALUES ( "NOTE: Combined Nickel and Cobalt is "+ALLTRIM(STR(m.CertNiCo,6,3))  )
								INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.NiMin))+' Min. and '+ALLTRIM(STR(Spec_Check.NiMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.Ni),"not listed.",ALLTRIM(ERPCert.Ni) ))
							ELSE
								INSERT INTO SpecText (SpecText) VALUES ( "Nickel is not within Spec." )
								INSERT INTO SpecText (SpecText) VALUES ( "Nickel alone is not reported on Cert." )
								INSERT INTO SpecText (SpecText) VALUES ( "Combined Nickel and Cobalt is "+ALLTRIM(STR(m.CertNiCo,6,3))  )
								INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.NiMin))+' Min. and '+ALLTRIM(STR(Spec_Check.NiMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.Ni),"not listed.",ALLTRIM(ERPCert.Ni) ))
							ENDIF
						CASE NiMin > 0 AND NiMax = 0
							*Check Agianst Min ONLY
							IF m.CertNiCo >= NiMin
								m.CertNiPass = .T.
								INSERT INTO SpecText (SpecText) VALUES ( "NOTE: Nickel alone is not reported on Cert." )
								INSERT INTO SpecText (SpecText) VALUES ( "NOTE: Combined Nickel and Cobalt is "+ALLTRIM(STR(m.CertNiCo,6,3))  )
								INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.NiMin))+' Min. and '+ALLTRIM(STR(Spec_Check.NiMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.Ni),"not listed.",ALLTRIM(ERPCert.Ni) ))
							ELSE
								INSERT INTO SpecText (SpecText) VALUES ( "Nickel is not within Spec." )
								INSERT INTO SpecText (SpecText) VALUES ( "Nickel alone is not reported on Cert." )
								INSERT INTO SpecText (SpecText) VALUES ( "Combined Nickel and Cobalt is "+ALLTRIM(STR(m.CertNiCo,6,3))  )
								INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.NiMin))+' Min.  Cert is '+IIF(EMPTY(ERPCert.Ni),"not listed.",ALLTRIM(ERPCert.Ni) ))
							ENDIF
						CASE NiMin = 0 AND NiMax > 0
							*Check Agianst Max ONLY
							IF m.CertNiCo <= NiMax
								m.CertNiPass = .T.
								INSERT INTO SpecText (SpecText) VALUES ( "NOTE: Nickel alone is not reported on Cert." )
								INSERT INTO SpecText (SpecText) VALUES ( "NOTE: Combined Nickel and Cobalt is "+ALLTRIM(STR(m.CertNiCo,6,3))  )
								INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.NiMin,6,3))+' Min. and '+ALLTRIM(STR(Spec_Check.NiMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.Ni),"not listed.",ALLTRIM(ERPCert.Ni) ))
							ELSE
								INSERT INTO SpecText (SpecText) VALUES ( "Nickel is not within Spec." )
								INSERT INTO SpecText (SpecText) VALUES ( "Nickel alone is not reported on Cert." )
								INSERT INTO SpecText (SpecText) VALUES ( "Combined Nickel and Cobalt is "+ALLTRIM(STR(m.CertNiCo,6,3))  )
								INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.NiMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.Ni),"not listed.",ALLTRIM(ERPCert.Ni) ))
							ENDIF
						OTHERWISE
							*Ni not limited!
							m.CertNiPass = .T.
							INSERT INTO SpecText (SpecText) VALUES ( "NOTE: Combined Nickel and Cobalt is "+ALLTRIM(STR(m.CertNiCo,6,3))  )
							INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires a balance of Nickel." )
						ENDCASE
						Release m.CertNiCo 				
					ENDIF
				CASE m.CertNi = 0 AND !EMPTY(ERPCert.Ni)
					*No numeric value - must be Balance
					IF NiRem
						m.CertNiPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Nickel is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires BALANCE of Ni. Cert is "+IIF(EMPTY(ERPCert.Ni),"not listed.",ALLTRIM(ERPCert.Ni) ))
					ENDIF
				CASE NiRem
					*Spec asks for balance and cert has a number
					IF m.CertNi > 30 &&More than 30% is balance
						m.CertNiPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Ni is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires BALANCE of Ni. Cert is "+IIF(EMPTY(ERPCert.Ni),"not listed.",ALLTRIM(ERPCert.Ni) ))
					ENDIF
				CASE NiMin > 0 AND NiMax > 0
					*Check Agianst Min AND Max
					IF m.CertNi >= NiMin AND m.CertNi <= NiMax
						m.CertNiPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Ni is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.NiMin,6,3))+' Min. and '+ALLTRIM(STR(Spec_Check.NiMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.Ni),"not listed.",ALLTRIM(ERPCert.Ni) ))
					ENDIF
				CASE NiMin > 0 AND NiMax = 0
					*Check Agianst Min ONLY
					IF m.CertNi >= NiMin
						m.CertNiPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Ni is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.NiMin,6,3))+' Min.  Cert is '+IIF(EMPTY(ERPCert.Ni),"not listed.",ALLTRIM(ERPCert.Ni) ))
					ENDIF
				CASE NiMin = 0 AND NiMax > 0
					*Check Agianst Max ONLY
					IF m.CertNi <= NiMax
						m.CertNiPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Ni is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.NiMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.Ni),"not listed.",ALLTRIM(ERPCert.Ni) ))
					ENDIF
				OTHERWISE
					*Ni not limited!
					m.CertNiPass = .T.
				ENDCASE
				Release m.CertNi
			ENDIF
		
			**Check Percentage of O
			m.CertOPass = .T. &&True even if not required
			IF OMax > 0 or OMin > 0
				**O needs to be checked
				m.CertO = VAL(ERPCert.O)
				m.CertOPass = .F.
				DO CASE
				CASE EMPTY(ERPCert.O)
					m.CertOPass = .F.
					INSERT INTO SpecText (SpecText) VALUES ( "O is not reported on Cert." )
				CASE OMin > 0 AND OMax > 0
					*Check Agianst Min AND Max
					IF m.CertO >= OMin AND m.CertO <= OMax
						m.CertOPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "O is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.OMin,6,3))+' Min. and '+ALLTRIM(STR(Spec_Check.OMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.O),"not listed.",ALLTRIM(ERPCert.O) ))
					ENDIF
				CASE OMin > 0 AND OMax = 0
					*Check Agianst Min ONLY
					IF m.CertO >= OMin
						m.CertOPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "O is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.OMin,6,3))+' Min.  Cert is '+IIF(EMPTY(ERPCert.O),"not listed.",ALLTRIM(ERPCert.O) ))
					ENDIF
				CASE OMin = 0 AND OMax > 0
					*Check Agianst Max ONLY
					IF m.CertO <= OMax
						m.CertOPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "O is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.OMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.O),"not listed.",ALLTRIM(ERPCert.O) ))
					ENDIF
				OTHERWISE
					*O not limited!
					m.CertOPass = .T.
				ENDCASE
				Release m.CertO
			ENDIF
		
			**Check Percentage of P
			m.CertPPass = .T. &&True even if not required
			IF PMax > 0 or PMin > 0
				**P needs to be checked
		
				m.CertP = VAL(ERPCert.P)
				m.CertPPass = .F.
				DO CASE
				CASE EMPTY(ERPCert.P)
					m.CertPPass = .F.
					INSERT INTO SpecText (SpecText) VALUES ( "P is not reported on Cert." )
				CASE PMin > 0 AND PMax > 0
					*Check Agianst Min AND Max
					IF m.CertP >= PMin AND m.CertP <= PMax
						m.CertPPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "P is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.PMin,6,3))+' Min. and '+ALLTRIM(STR(Spec_Check.PMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.P),"not listed.",ALLTRIM(ERPCert.P) ))
					ENDIF
				CASE PMin > 0 AND PMax = 0
					*Check Agianst Min ONLY
					IF m.CertP >= PMin
						m.CertPPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "P is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.PMin,6,3))+' Min.  Cert is '+IIF(EMPTY(ERPCert.P),"not listed.",ALLTRIM(ERPCert.P) ))
					ENDIF
				CASE PMin = 0 AND PMax > 0
					*Check Agianst Max ONLY
					IF m.CertP <= PMax
						m.CertPPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "P is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.PMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.P),"not listed.",ALLTRIM(ERPCert.P) ))
					ENDIF
				OTHERWISE
					*P not limited!
					m.CertPPass = .T.
				ENDCASE
				Release m.CertP
			ENDIF
		
			**Check percentage of Pb
			m.CertPbPass = .T. &&True even if not required
			IF PbMax > 0 or PbMin > 0 OR PbRem
				**Pb needs to be checked
				m.CertPb = VAL(ERPCert.Pb)
				m.CertPbPass = .F.
				DO CASE
				CASE EMPTY(ERPCert.Pb)
					m.CertPbPass = .F.
					INSERT INTO SpecText (SpecText) VALUES ( "Pb is not reported on Cert." )
				CASE m.CertPb = 0 AND !EMPTY(ERPCert.Pb)
					*No numeric value - must be Balance
					IF PbRem
						m.CertPbPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Pb is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires BALANCE of Pb.  Cert is "+IIF(EMPTY(ERPCert.Pb),"not listed.",ALLTRIM(ERPCert.Pb) ))
					ENDIF
				CASE PbRem
					*Spec asks for balance and cert has a number
					IF m.CertPb > 30 &&More than 30% is balance
						m.CertPbPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Pb is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires BALANCE of Pb.  Cert is "+IIF(EMPTY(ERPCert.Pb),"not listed.",ALLTRIM(ERPCert.Pb) ))
					ENDIF
				CASE PbMin > 0 AND PbMax > 0
					*Check Agianst Min AND Max
					IF m.CertPb >= PbMin AND m.CertPb <= PbMax
						m.CertPbPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Pb is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.PbMin,6,3))+' Min. and '+ALLTRIM(STR(Spec_Check.PbMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.Pb),"not listed.",ALLTRIM(ERPCert.Pb) ))
					ENDIF
				CASE PbMin > 0 AND PbMax = 0
					*Check Agianst Min ONLY
					IF m.CertPb >= PbMin
						m.CertPbPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Pb is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.PbMin,6,3))+' Min.  Cert is '+IIF(EMPTY(ERPCert.Pb),"not listed.",ALLTRIM(ERPCert.Pb) ))
					ENDIF
				CASE PbMin = 0 AND PbMax > 0
					*Check Agianst Max ONLY
					IF m.CertPb <= PbMax
						m.CertPbPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Pb is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.PbMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.Pb),"not listed.",ALLTRIM(ERPCert.Pb) ))
					ENDIF
				OTHERWISE
					*Pb not limited!
					m.CertPbPass = .T.
				ENDCASE
				Release m.CertPb
			ENDIF
		
			**Check Percentage of S
			m.CertSPass = .T. &&True even if not required
			IF SMax > 0 or SMin > 0
				**S needs to be checked
				m.CertS = VAL(ERPCert.S)
				m.CertSPass = .F.
				DO CASE
				CASE EMPTY(ERPCert.S)
					m.CertSPass = .F.
					INSERT INTO SpecText (SpecText) VALUES ( "S is not reported on Cert." )
				CASE SMin > 0 AND SMax > 0
					*Check Agianst Min AND Max
					IF m.CertS >= SMin AND m.CertS <= SMax
						m.CertSPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "S is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.SMin,6,3))+' Min. and '+ALLTRIM(STR(Spec_Check.SMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.S),"not listed.",ALLTRIM(ERPCert.S) ))
					ENDIF
				CASE SMin > 0 AND SMax = 0
					*Check Agianst Min ONLY
					IF m.CertS >= SMin
						m.CertSPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "S is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.SMin,6,3))+' Min.  Cert is '+IIF(EMPTY(ERPCert.S),"not listed.",ALLTRIM(ERPCert.S) ))
					ENDIF
				CASE SMin = 0 AND SMax > 0
					*Check Agianst Max ONLY
					IF m.CertS <= SMax
						m.CertSPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "S is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.SMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.S),"not listed.",ALLTRIM(ERPCert.S) ))
					ENDIF
				OTHERWISE
					*S not limited!
					m.CertSPass = .T.
				ENDCASE
				Release m.CertS
			ENDIF
		
			**Check Percentage of Si
			m.CertSiPass = .T. &&True even if not required
			IF SiMax > 0 or SiMin > 0
				**Si needs to be checked
				m.CertSi = VAL(ERPCert.Si)
				m.CertSiPass = .F.
				DO CASE
				CASE EMPTY(ERPCert.Si)
					m.CertSiPass = .F.
					INSERT INTO SpecText (SpecText) VALUES ( "Si is not reported on Cert." )
				CASE SiMin > 0 AND SiMax > 0
					*Check Agianst Min AND Max
					IF m.CertSi >= SiMin AND m.CertSi <= SiMax
						m.CertSiPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Si is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.SiMin,6,3))+' Min. and '+ALLTRIM(STR(Spec_Check.SiMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.Si),"not listed.",ALLTRIM(ERPCert.Si) ))
					ENDIF
				CASE SiMin > 0 AND SiMax = 0
					*Check Agianst Min ONLY
					IF m.CertSi >= SiMin
						m.CertSiPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Si is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.SiMin,6,3))+' Min.  Cert is '+IIF(EMPTY(ERPCert.Si),"not listed.",ALLTRIM(ERPCert.Si) ))
					ENDIF
				CASE SiMin = 0 AND SiMax > 0
					*Check Agianst Max ONLY
					IF m.CertSi <= SiMax
						m.CertSiPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Si is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.SiMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.Si),"not listed.",ALLTRIM(ERPCert.Si) ))
					ENDIF
				OTHERWISE
					*Si not limited!
					m.CertSiPass = .T.
				ENDCASE
				Release m.CertSi
			ENDIF
		
			**Check Percentage of Ta
			m.CertTaPass = .T. &&True even if not required
			IF TaMax > 0 or TaMin > 0
				**Ta needs to be checked
				m.CertTa = VAL(ERPCert.Ta)
				m.CertTaPass = .F.
				DO CASE
				CASE EMPTY(ERPCert.Ta)
					m.CertTaPass = .F.
					INSERT INTO SpecText (SpecText) VALUES ( "Ta is not reported on Cert." )
				CASE TaMin > 0 AND TaMax > 0
					*Check Agianst Min AND Max
					IF m.CertTa >= TaMin AND m.CertTa <= TaMax
						m.CertTaPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Ta is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.TaMin,6,3))+' Min. and '+ALLTRIM(STR(Spec_Check.TaMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.Ta),"not listed.",ALLTRIM(ERPCert.Ta) ))
					ENDIF
				CASE TaMin > 0 AND TaMax = 0
					*Check Agianst Min ONLY
					IF m.CertTa >= TaMin
						m.CertTaPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Ta is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.TaMin,6,3))+' Min.  Cert is '+IIF(EMPTY(ERPCert.Ta),"not listed.",ALLTRIM(ERPCert.Ta) ))
					ENDIF
				CASE TaMin = 0 AND TaMax > 0
					*Check Agianst Max ONLY
					IF m.CertTa <= TaMax
						m.CertTaPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Ta is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.TaMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.Ta),"not listed.",ALLTRIM(ERPCert.Ta) ))
					ENDIF
				OTHERWISE
					*Ta not limited!
					m.CertTaPass = .T.
				ENDCASE
				Release m.CertTa
			ENDIF
		
			**Check percentage of Ti
			m.CertTiPass = .T. &&True even if not required
			IF TiMax > 0 or TiMin > 0 OR TiRem
				**Ti needs to be checked
				m.CertTi = VAL(ERPCert.Ti)
				m.CertTiPass = .F.
				DO CASE
				CASE EMPTY(ERPCert.Ti)
					m.CertTiPass = .F.
					INSERT INTO SpecText (SpecText) VALUES ( "Ti is not reported on Cert." )
				CASE m.CertTi = 0 AND !EMPTY(ERPCert.Ti)
					*No numeric value - must be Balance
					IF TiRem
						m.CertTiPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Ti is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires BALANCE of Ti.  Cert is "+IIF(EMPTY(ERPCert.Ti),"not listed.",ALLTRIM(ERPCert.Ti) ))
					ENDIF
				CASE TiRem
					*Spec asks for balance and cert has a number
					IF m.CertTi > 30 &&More than 30% is balance
						m.CertTiPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Ti is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires BALANCE of Ti.  Cert is "+IIF(EMPTY(ERPCert.Ti),"not listed.",ALLTRIM(ERPCert.Ti) ))
					ENDIF
				CASE TiMin > 0 AND TiMax > 0
					*Check Agianst Min AND Max
					IF m.CertTi >= TiMin AND m.CertTi <= TiMax
						m.CertTiPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Ti is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.TiMin,6,3))+' Min. and '+ALLTRIM(STR(Spec_Check.TiMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.Ti),"not listed.",ALLTRIM(ERPCert.Ti) ))
					ENDIF
				CASE TiMin > 0 AND TiMax = 0
					*Check Agianst Min ONLY
					IF m.CertTi >= TiMin
						m.CertTiPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Ti is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.TiMin,6,3))+' Min. and '+ALLTRIM(STR(Spec_Check.TiMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.Ti),"not listed.",ALLTRIM(ERPCert.Ti) ))
					ENDIF
				CASE TiMin = 0 AND TiMax > 0
					*Check Agianst Max ONLY
					IF m.CertTi <= TiMax
						m.CertTiPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Ti is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.TiMin,6,3))+' Min. and '+ALLTRIM(STR(Spec_Check.TiMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.Ti),"not listed.",ALLTRIM(ERPCert.Ti) ))
					ENDIF
				OTHERWISE
					*Ti not limited!
					m.CertTiPass = .T.
				ENDCASE
				Release m.CertTi
			ENDIF
		
			**Check Percentage of V
			m.CertVPass = .T. &&True even if not required
			IF VMax > 0 or VMin > 0
				**V needs to be checked
				m.CertV = VAL(ERPCert.V)
				m.CertVPass = .F.
				DO CASE
				CASE EMPTY(ERPCert.V)
					m.CertVPass = .F.
					INSERT INTO SpecText (SpecText) VALUES ( "V is not reported on Cert." )
				CASE VMin > 0 AND VMax > 0
					*Check Agianst Min AND Max
					IF m.CertV >= VMin AND m.CertV <= VMax
						m.CertVPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "V is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.VMin,6,3))+' Min. and '+ALLTRIM(STR(Spec_Check.VMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.V),"not listed.",ALLTRIM(ERPCert.V) ))
					ENDIF
				CASE VMin > 0 AND VMax = 0
					*Check Agianst Min ONLY
					IF m.CertV >= VMin
						m.CertVPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "V is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.VMin,6,3))+' Min.  Cert is '+IIF(EMPTY(ERPCert.V),"not listed.",ALLTRIM(ERPCert.V) ))
					ENDIF
				CASE VMin = 0 AND VMax > 0
					*Check Agianst Max ONLY
					IF m.CertV <= VMax
						m.CertVPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "V is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.VMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.V),"not listed.",ALLTRIM(ERPCert.V) ))
					ENDIF
				OTHERWISE
					*V not limited!
					m.CertVPass = .T.
				ENDCASE
				Release m.CertV
			ENDIF
		
			**Check percentage of W
			m.CertWPass = .T. &&True even if not required
			IF WMax > 0 or WMin > 0 OR WRem
				**W needs to be checked
				m.CertW = VAL(ERPCert.W)
				m.CertWPass = .F.
				DO CASE
				CASE EMPTY(ERPCert.W)
					m.CertWPass = .F.
					INSERT INTO SpecText (SpecText) VALUES ( "W is not reported on Cert." )
				CASE m.CertW = 0 AND !EMPTY(ERPCert.W)
					*No numeric value - must be Balance
					IF WRem
						m.CertWPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "W is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires BALANCE of W.  Cert is "+IIF(EMPTY(ERPCert.W),"not listed.",ALLTRIM(ERPCert.W) ))
					ENDIF
				CASE WRem
					*Spec asks for balance and cert has a number
					IF m.CertW > 30 &&More than 30% is balance
						m.CertWPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "W is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires BALANCE of W.  Cert is "+IIF(EMPTY(ERPCert.W),"not listed.",ALLTRIM(ERPCert.W) ))
					ENDIF
				CASE WMin > 0 AND WMax > 0
					*Check Agianst Min AND Max
					IF m.CertW >= WMin AND m.CertW <= WMax
						m.CertWPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "W is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.WMin,6,3))+' Min. and '+ALLTRIM(STR(Spec_Check.WMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.W),"not listed.",ALLTRIM(ERPCert.W) ))
					ENDIF
				CASE WMin > 0 AND WMax = 0
					*Check Agianst Min ONLY
					IF m.CertW >= WMin
						m.CertWPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "W is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.WMin,6,3))+' Min. and '+ALLTRIM(STR(Spec_Check.WMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.W),"not listed.",ALLTRIM(ERPCert.W) ))
					ENDIF
				CASE WMin = 0 AND WMax > 0
					*Check Agianst Max ONLY
					IF m.CertW <= WMax
						m.CertWPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "W is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.WMin,6,3))+' Min. and '+ALLTRIM(STR(Spec_Check.WMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.W),"not listed.",ALLTRIM(ERPCert.W) ))
					ENDIF
				OTHERWISE
					*W not limited!
					m.CertWPass = .T.
				ENDCASE
				Release m.CertW
			ENDIF
		
			**Check Percentage of Y
			m.CertYPass = .T. &&True even if not required
			IF YMax > 0 or YMin > 0
				**Y needs to be checked
				m.CertY = VAL(ERPCert.Y)
				m.CertYPass = .F.
				DO CASE
				CASE EMPTY(ERPCert.Y)
					m.CertYPass = .F.
					INSERT INTO SpecText (SpecText) VALUES ( "Y is not reported on Cert." )
				CASE YMin > 0 AND YMax > 0
					*Check Agianst Min AND Max
					IF m.CertY >= YMin AND m.CertY <= YMax
						m.CertYPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Y is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.YMin,6,3))+' Min. and '+ALLTRIM(STR(Spec_Check.YMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.Y),"not listed.",ALLTRIM(ERPCert.Y) ))
					ENDIF
				CASE YMin > 0 AND YMax = 0
					*Check Agianst Min ONLY
					IF m.CertY >= YMin
						m.CertYPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Y is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.YMin,6,3))+' Min.  Cert is '+IIF(EMPTY(ERPCert.Y),"not listed.",ALLTRIM(ERPCert.Y) ))
					ENDIF
				CASE YMin = 0 AND YMax > 0
					*Check Agianst Max ONLY
					IF m.CertY <= YMax
						m.CertYPass = .T.
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( "Y is not within Spec." )
						INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.YMax,6,3))+' Max. Cert is '+IIF(EMPTY(ERPCert.Y),"not listed.",ALLTRIM(ERPCert.Y) ))
					ENDIF
				OTHERWISE
					*Y not limited!
					m.CertYPass = .T.
				ENDCASE
				Release m.CertY
			ENDIF
		
			**Check Percentage of CbTa
			m.CertCbTaPass = .T. &&True even if not required
			IF CbTaMax > 0 or CbTaMin > 0
				m.CertCbTa = 0
				**CbTa needs to be checked
				DO CASE
				CASE VAL(ERPCert.CbandTa) > 0
					*Cb and Ta value entered
					m.CertCbTa = VAL(ERPCert.CbandTa)
				CASE !EMPTY(ERPCert.Cb) AND !EMPTY(ERPCert.Ta)
					*Must calc Cb and Ta value
					m.CertCbTa = VAL(ERPCert.Cb) + VAL(ERPCert.Ta)
				CASE !EMPTY(ERPCert.Cb) AND EMPTY(ERPCert.Ta)
					*report Ta as empty
					INSERT INTO SpecText (SpecText) VALUES ( "CbTa is not within Spec." )
					INSERT INTO SpecText (SpecText) VALUES ( "   -Ta is not listed" )
				CASE EMPTY(ERPCert.Cb) AND !EMPTY(ERPCert.Ta)
					*report Cb as empty
					INSERT INTO SpecText (SpecText) VALUES ( "CbTa is not within Spec." )
					INSERT INTO SpecText (SpecText) VALUES ( "   -Cb is not listed" )
				CASE EMPTY(ERPCert.Cb) AND EMPTY(ERPCert.Ta)
					*report Cb and Ta as empty
					INSERT INTO SpecText (SpecText) VALUES ( "CbTa is not within Spec." )
					INSERT INTO SpecText (SpecText) VALUES ( "   -Cb and Ta are not listed" )
				ENDCASE
				IF m.CertCbTa > 0
					m.CertCbTaPass = .F.
					DO CASE
					CASE CbTaMin > 0 AND CbTaMax > 0
						*Check Agianst Min AND Max
						IF m.CertCbTa >= CbTaMin AND m.CertCbTa <= CbTaMax
							m.CertCbTaPass = .T.
						ELSE
							INSERT INTO SpecText (SpecText) VALUES ( "CbTa is not within Spec." )
							INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.CbTaMin,6,3))+' Min. and '+ALLTRIM(STR(Spec_Check.CbTaMax,6,3))+' Max. Cert is '+ALLTRIM(ERPCert.CbandTa) )
						ENDIF
					CASE CbTaMin > 0 AND CbTaMax = 0
						*Check Agianst Min ONLY
						IF m.CertCbTa >= CbTaMin
							m.CertCbTaPass = .T.
						ELSE
							INSERT INTO SpecText (SpecText) VALUES ( "CbTa is not within Spec." )
							INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.CbTaMin,6,3))+' Min.  Cert is '+ALLTRIM(ERPCert.CbandTa) )
						ENDIF
					CASE CbTaMin = 0 AND CbTaMax > 0
						*Check Agianst Max ONLY
						IF m.CertCbTa <= CbTaMax
							m.CertCbTaPass = .T.
						ELSE
							INSERT INTO SpecText (SpecText) VALUES ( "CbTa is not within Spec." )
							INSERT INTO SpecText (SpecText) VALUES ( "   -Spec. requires "+ALLTRIM(STR(Spec_Check.CbTaMax,6,3))+' Max. Cert is '+ALLTRIM(ERPCert.CbandTa) )
						ENDIF
					OTHERWISE
						*CbTa not limited!
						m.CertCbTaPass = .T.
					ENDCASE
				ENDIF &&m.CertCbTa = 0
				Release m.CertCbTa
			ENDIF
		
			**Check Percentage of NiCo
			m.CertNiCoPass = .T. &&True even if not required
			IF NiCoMax > 0 or NiCoMin > 0
				m.CertNiCr = 0
				**NiCo needs to be checked
				DO CASE
				CASE VAL(ERPCert.NiandCo) > 0
					*Ni and Co value entered
					m.CertNiCo = VAL(ERPCert.NiandCo)
				CASE !EMPTY(ERPCert.Ni) AND !EMPTY(ERPCert.Co)
					*Must calc Ni and Co value
					m.CertNiCo = VAL(ERPCert.Ni) + VAL(ERPCert.Co)
				CASE !EMPTY(ERPCert.Ni) AND EMPTY(ERPCert.Co)
					*report Co as empty
					INSERT INTO SpecText (SpecText) VALUES ( "NiCo is not within Spec." )
					INSERT INTO SpecText (SpecText) VALUES ( "   -Co is not listed" )
				CASE EMPTY(ERPCert.Ni) AND !EMPTY(ERPCert.Co)
					*report Ni as empty
					INSERT INTO SpecText (SpecText) VALUES ( "NiCo is not within Spec." )
					INSERT INTO SpecText (SpecText) VALUES ( "   -Ni is not listed" )
				CASE EMPTY(ERPCert.Ni) AND EMPTY(ERPCert.Co)
					*report Ni and Co as empty
					INSERT INTO SpecText (SpecText) VALUES ( "NiCo is not within Spec." )
					INSERT INTO SpecText (SpecText) VALUES ( "   -Ni and Co are not listed" )
				ENDCASE
				IF m.CertNiCo > 0
					**NiCo needs to be checked
					DO CASE
					CASE VAL(ERPCert.NiCo) > 0
						** Use the NiandCo Value
						m.CertNiCo = VAL(ERPCert.NiandCo)
					CASE VAL(ERPCert.Ni) = 0 AND VAL(ERPCert.Ni) = 0
						** No NUMBER!!!
						** Failled
						WAIT WINDOW 'Failed Ni and Co'
						m.CertNiCo = 0
					CASE VAL(ERPCert.Ni) = 0 AND !EMPTY(ERPCert.Ni)
						** Nickel is BAL, add Calc to Co
						m.CertNiCo = VAL(ERPCert.Co) 
						*+ toFormSet.CheckSpec_Balance('Ni')
					CASE VAL(ERPCert.Co) = 0 AND !EMPTY(ERPCert.Co)
						** Nickel is BAL, add Calc to Ni
						m.CertNiCo = VAL(ERPCert.Ni) 
						*+ toFormSet.CheckSpec_Balance('Co')
					ENDCASE
		
					m.CertNiCoPass = .F.
					DO CASE
					CASE NiCoMin > 0 AND NiCoMax > 0
						*Check Agianst Min AND Max
						IF m.CertNiCo >= NiCoMin AND m.CertNiCo <= NiCoMax
							m.CertNiCoPass = .T.
						ENDIF
					CASE NiCoMin > 0 AND NiCoMax = 0
						*Check Agianst Min ONLY
						IF m.CertNiCo >= NiCoMin
							m.CertNiCoPass = .T.
						ENDIF
					CASE NiCoMin = 0 AND NiCoMax > 0
						*Check Agianst Max ONLY
						IF m.CertNiCo <= NiCoMax
							m.CertNiCoPass = .T.
						ENDIF
					OTHERWISE
						*NiCo not limited!
						m.CertNiCoPass = .T.
					ENDCASE
				ENDIF &&m.CertNiCo
				Release m.CertNiCo
			ENDIF
		
			**Check Percentage of FeCrNi
			m.CertFeCrNiPass = .T. &&True even if not required
			IF FeCrNiMax > 0 or FeCrNiMin > 0
				**FeCrNi needs to be checked
				m.CertFeCrNi = VAL(ERPCert.Fe)+VAL(ERPCert.Cr)+VAL(ERPCert.Ni)
		
				IF VAL(ERPCert.Fe)=0
					IF !EMPTY(ERPCert.Fe)
						m.CertFeCrNi = m.CertFeCrNi 
						*+ toFormSet.CheckSpec_Balance('Fe')
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( 'FeCrNi might fail becuase Fe was not entered' )
					ENDIF
				ENDIF
				IF VAL(ERPCert.Cr)=0
					IF !EMPTY(ERPCert.Cr)
						m.CertFeCrNi = m.CertFeCrNi
						*+ toFormSet.CheckSpec_Balance('Cr')
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( 'FeCrNi might fail becuase Cr was not entered' )
					ENDIF
				ENDIF
				IF VAL(ERPCert.Ni)=0
					IF !EMPTY(ERPCert.Ni)
						m.CertFeCrNi = m.CertFeCrNi
						*+ toFormSet.CheckSpec_Balance('Ni')
					ELSE
						INSERT INTO SpecText (SpecText) VALUES ( 'FeCrNi might fail becuase Ni was not entered')
					ENDIF
				ENDIF
		
				m.CertFeCrNiPass = .F.
				DO CASE
				CASE FeCrNiMin > 0 AND FeCrNiMax > 0
					*Check Agianst Min AND Max
					IF m.CertFeCrNi >= FeCrNiMin AND m.CertFeCrNi <= FeCrNiMax
						m.CertFeCrNiPass = .T.
					ENDIF
				CASE FeCrNiMin > 0 AND FeCrNiMax = 0
					*Check Agianst Min ONLY
					IF m.CertFeCrNi >= FeCrNiMin
						m.CertFeCrNiPass = .T.
					ENDIF
				CASE FeCrNiMin = 0 AND FeCrNiMax > 0
					*Check Agianst Max ONLY
					IF m.CertFeCrNi <= FeCrNiMax
						m.CertFeCrNiPass = .T.
					ENDIF
				OTHERWISE
					*FeCrNi not limited!
					m.CertFeCrNiPass = .T.
				ENDCASE
				Release m.CertFeCrNi
			ENDIF
			*****************End of Chem check
		
			******State Chemistry
		
			
			IF !m.CertAlPass
				WAIT WINDOW 'Failed Al Chemistry' TIMEOUT 1
				m.ChemPass =.F.
			ENDIF
			IF !m.CertBPass
				WAIT WINDOW 'Failed B Chemistry' TIMEOUT 1
				m.ChemPass =.F.
			ENDIF
			IF !m.CertBePass
				WAIT WINDOW 'Failed Be Chemistry' TIMEOUT 1
				m.ChemPass =.F.
			ENDIF
			IF !m.CertCPass
				WAIT WINDOW 'Failed C Chemistry' TIMEOUT 1
				m.ChemPass =.F.
			ENDIF
			IF !m.CertCbPass
				WAIT WINDOW 'Failed Cb Chemistry' TIMEOUT 1
				m.ChemPass =.F.
			ENDIF
			IF !m.CertCoPass
				WAIT WINDOW 'Failed Co Chemistry' TIMEOUT 1
				m.ChemPass =.F.
			ENDIF
			IF !m.CertCrPass
				WAIT WINDOW 'Failed Cr Chemistry' TIMEOUT 1
				m.ChemPass =.F.
			ENDIF
			IF !m.CertCuPass
				WAIT WINDOW 'Failed Cu Chemistry' TIMEOUT 1
				m.ChemPass =.F.
			ENDIF
			IF !m.CertFePass
				WAIT WINDOW 'Failed Fe Chemistry' TIMEOUT 1
				m.ChemPass =.F.
			ENDIF
			IF !m.CertHPass
				WAIT WINDOW 'Failed H Chemistry' TIMEOUT 1
				m.ChemPass =.F.
			ENDIF
			IF !m.CertMgPass
				WAIT WINDOW 'Failed Mg Chemistry' TIMEOUT 1
				m.ChemPass =.F.
			ENDIF
			IF !m.CertMoPass
				WAIT WINDOW 'Failed Mo Chemistry' TIMEOUT 1
				m.ChemPass =.F.
			ENDIF
			IF !m.CertMnPass
				WAIT WINDOW 'Failed Mn Chemistry' TIMEOUT 1
				m.ChemPass =.F.
			ENDIF
			IF !m.CertNPass
				WAIT WINDOW 'Failed N Chemistry' TIMEOUT 1
				m.ChemPass =.F.
			ENDIF
			IF !m.CertNaPass
				WAIT WINDOW 'Failed Na Chemistry' TIMEOUT 1
				m.ChemPass =.F.
			ENDIF
			IF !m.CertNbPass
				WAIT WINDOW 'Failed Nb Chemistry' TIMEOUT 1
				m.ChemPass =.F.
			ENDIF
			IF !m.CertNiPass
				WAIT WINDOW 'Failed Ni Chemistry' TIMEOUT 1
				m.ChemPass =.F.
			ENDIF
			IF !m.CertOPass
				WAIT WINDOW 'Failed O Chemistry' TIMEOUT 1
				m.ChemPass =.F.
			ENDIF
			IF !m.CertPPass
				WAIT WINDOW 'Failed P Chemistry' TIMEOUT 1
				m.ChemPass =.F.
			ENDIF
			IF !m.CertPbPass
				WAIT WINDOW 'Failed Pb Chemistry' TIMEOUT 1
				m.ChemPass =.F.
			ENDIF
			IF !m.CertSPass
				WAIT WINDOW 'Failed S Chemistry' TIMEOUT 1
				m.ChemPass =.F.
			ENDIF
			IF !m.CertSiPass
				WAIT WINDOW 'Failed Si Chemistry' TIMEOUT 1
				m.ChemPass =.F.
			ENDIF
			IF !m.CertTaPass
				WAIT WINDOW 'Failed Ta Chemistry' TIMEOUT 1
				m.ChemPass =.F.
			ENDIF
			IF !m.CertTiPass
				WAIT WINDOW 'Failed Ti Chemistry' TIMEOUT 1
				m.ChemPass =.F.
			ENDIF
			IF !m.CertVPass
				WAIT WINDOW 'Failed V Chemistry' TIMEOUT 1
				m.ChemPass =.F.
			ENDIF
			IF !m.CertWPass
				WAIT WINDOW 'Failed W Chemistry' TIMEOUT 1
				m.ChemPass =.F.
			ENDIF
			IF !m.CertYPass
				WAIT WINDOW 'Failed Y Chemistry' TIMEOUT 1
				m.ChemPass =.F.
			ENDIF
			IF !m.CertCbTaPass
				WAIT WINDOW 'Failed Cb+Ta Chemistry'  TIMEOUT 1
				m.ChemPass =.F.
			ENDIF
			IF !m.CertNiCoPass
				WAIT WINDOW 'Failed Ni+Co Chemistry' TIMEOUT 1
				m.ChemPass =.F.
			ENDIF
			IF !m.CertFeCrNiPass
				WAIT WINDOW 'Failed Fe+Cr+Ni Chemistry' TIMEOUT 1
				m.ChemPass =.F.
			ENDIF
			IF m.ChemPass
				INSERT INTO SpecText (SpecText) VALUES ( 'Did not fail Chemistry.' )
				WAIT WINDOW 'Passed Chemistry' TIMEOUT 1
			ELSE
				INSERT INTO SpecText (SpecText) VALUES ( 'Does not meet Chemistry.' )
				WAIT WINDOW 'Failed Chemistry' TIMEOUT 1
			ENDIF
		
			*Check program exceptions	
			IF !EMPTY(ALLTRIM(Exception))
				m.cptn="The Spec requires a special attention !!"
				m.msg="Is the following correct for the material ?"+CHR(13)+"-------------------------------------------------------------"+CHR(13)+ALLTRIM(Exception)
				m.msgb = MESSAGEBOX(m.msg,4+32+256,m.cptn)
				IF m.msgb = 6 &&Yes
					INSERT INTO SpecText (SpecText) VALUES ( 'Did not fail program Exception:' ) 
				ENDIF
				IF m.msgb = 7 &&No
					INSERT INTO SpecText (SpecText) VALUES ( 'FAILLED program Exception:' ) 
				ENDIF
				INSERT INTO SpecText (SpecText) VALUES ( Spec_check.Exception ) 
				INSERT INTO SpecText (SpecText) VALUES ( REPLICATE(' -',30) )
			ENDIF
			
			
		
			
		ENDFOR &&Check next Record
		********************************************ENDFOR LOOP
		
		INSERT INTO SpecText (SpecText) VALUES ( " END "+REPLICATE('. ',27) )
		
		Release m.Scand,m.MechPass,m.ChemPass
		
		Release m.CertDiaPass
		Release m.CertUTSPass
		Release m.CertYLDPass
		Release m.CertELPass
		Release m.CertRAPass
		Release m.CertBHNPass
		Release m.CertRBPass
		Release m.CertRCPass
		Release m.CertGrainPass
		Release m.MechPass
		Release m.CertAlPass
		Release m.CertBPass
		Release m.CertBePass
		Release m.CertCPass
		Release m.CertCbPass
		Release m.CertCoPass
		Release m.CertCrPass
		Release m.CertCuPass
		Release m.CertFePass
		Release m.CertHPass
		Release m.CertMgPass
		Release m.CertMoPass
		Release m.CertMnPass
		Release m.CertNPass
		Release m.CertNaPass
		Release m.CertNbPass
		Release m.CertNiPass
		Release m.CertOPass
		Release m.CertPPass
		Release m.CertSPass
		Release m.CertSiPass
		Release m.CertTaPass
		Release m.CertTiPass
		Release m.CertVPass
		Release m.CertWPass
		Release m.CertYPass
		Release m.CertCbTaPass
		Release m.CertNiCoPass
		Release m.CertFeCrNiPass
		
		*WAIT WINDOW 'Finished with check, look at the Spec Text' NOWAIT
		
		SELECT SpecText
		GO TOP IN SpecText
		
		DO FORM Forms\SpecText
		
		IF USED('SpecText')
			USE IN SpecText
		ENDIF
		
		toForm.AlwaysOnTop = .T.
		toForm.Refresh
