PARAMETER pnNumberWithZero,pnNumberLength,pnNumberDecimals,plForcePennies,plAddCommas
*Remove0(          Number ,pnNumberLength, nNumber of Decimals, Force Pennies for Money
***remove0(nNumber_With_Zero,nLength,nDecimals,.F.)
*** Also Edit in Proc_Quotes.

IF NOT "PROC_QUOTES" $ SET("PROCEDURE")  &&Added for when Quotes is run without HPA menu.
	SET PROCEDURE TO Progs\Proc_Quotes ADDITIVE
ENDIF 

PRIVATE cNumbasChar,nLastDigits 

IF NOT (VARTYPE(pnNumberWithZero) = "N" OR VARTYPE(pnNumberWithZero) = "Y")
	pnNumberWithZero = 0
ENDIF
IF VARTYPE(pnNumberLength) = 'L'
	*Did not pass in pnNumberLength
	WAIT WINDOW 'Decimals may have been dropped' NOWAIT
	RETURN LTRIM(STR(pnNumberWithZero))
ENDIF
IF VARTYPE(plForcePennies) != 'L'
	plForcePennies = .F.
ENDIF
IF VARTYPE(plAddCommas) != 'L'
	plAddCommas = .F.
ENDIF

PRIVATE nOrigDecimal
nOrigDecimal = SET('DECIMAL')

PRIVATE cReturnChar
cReturnChar = ''

IF pnNumberDecimals > 0
	cNumbasChar = STR(pnNumberWithZero,pnNumberLength+pnNumberDecimals+1,pnNumberDecimals)
ELSE
	cNumbasChar = STR(pnNumberWithZero,pnNumberLength,0)
ENDIF

IF AT(".",cNumbasChar) = 0
	*cOnlyWholeNum = STR(pnNumberWithZero,pnNumberLength,0)
	cOnlyWholeNum = cNumbasChar 
ELSE
	cOnlyWholeNum = LEFT(cNumbasChar, AT(".",cNumbasChar)-1)
ENDIF

SET DECIMALS TO 0
nOnlyWholeNum = VAL(cOnlyWholeNum)
PRIVATE nNewDecimal,nNewDecimalasWhole,nTestDecimals 


IF pnNumberDecimals > 0
	*Have Decimals to deal with!
	PRIVATE nDecimals,nLastDigit
	SET DECIMALS TO 0
	nDecimalasWhole = VAL(RIGHT(cNumbasChar,pnNumberDecimals))
	SET DECIMALS TO (pnNumberDecimals)
	
	IF RIGHT(STR(nDecimalasWhole),1) != '0'
		*No Zero to remove
		cReturnChar = LTRIM(cNumbasChar)

	ELSE	
		*Remove Zero
		nDecimals	= VAL(RIGHT(cNumbasChar,pnNumberDecimals))/10^pnNumberDecimals
		IF nDecimals < .1 
			IF nDecimals = 0
				*Drop the decimals
				*cReturnChar = ALLTRIM(cNumbasChar)
				cReturnChar = LTRIM(STR(nOnlyWholeNum,pnNumberLength,0))
			ELSE
				*First Decimal is 0, Consider all decimals significant up to 3 places.
				IF pnNumberDecimals <= 3
					cReturnChar = LTRIM(STR(pnNumberWithZero,pnNumberLength,pnNumberDecimals))
					*cReturnChar = LTRIM(STR(nOnlyWholeNum,pnNumberLength,0))
				ELSE
					IF RIGHT(STR(nDecimalasWhole,pnNumberDecimals,0),1) = '0'
						*Remove 0 till 3 decimal places.
						nTestDecimals = pnNumberDecimals
						DO WHILE nTestDecimals > 3
							nNewDecimalasWhole = nDecimalasWhole / 10
							nTestDecimals = nTestDecimals -1
							IF RIGHT(STR(nNewDecimalasWhole,nTestDecimals,0),1) != '0'
								EXIT
							ENDIF
							
						ENDDO
						SET DECIMALS TO nTestDecimals
						nNewDecimal = nNewDecimalasWhole/10^nTestDecimals
						cReturnChar = LTRIM(STR(nOnlyWholeNum+nNewDecimal,pnNumberLength+nTestDecimals+1,nTestDecimals ))
					ENDIF
				ENDIF
			ENDIF
		ELSE  &&nDecimals < .1
			*So Decimals are over  .0999999
			
			
			nNewDecimalasWhole = nDecimalasWhole
			FOR nTestDecimals = pnNumberDecimals TO 0 STEP -1
				
				IF RIGHT(STR(nNewDecimalasWhole,nTestDecimals,0),1) = '0'
					SET DECIMALS TO 0
					nNewDecimalasWhole = nNewDecimalasWhole / 10
				ELSE
					EXIT
				ENDIF
				IF nNewDecimalasWhole < 1
					EXIT
				ENDIF
			NEXT nTestDecimals 
			
			SET DECIMALS TO (nTestDecimals)
			nNewDecimal = nNewDecimalasWhole/ 10^nTestDecimals
			cReturnChar = LTRIM(STR(nOnlyWholeNum+nNewDecimal,pnNumberLength+nTestDecimals+1,nTestDecimals))
			
		ENDIF	&&nDecimals < .1
	ENDIF	&&No Zero to remove
ENDIF	&&*Have Decimals to deal with!
	

SET DECIMALS TO (nOrigDecimal)
IF NOT EMPTY(cReturnChar)
	**After Dealing with no decimals, go back see see if Pennies are to be displayed
	IF plForcePennies 
		IF AT(".",cReturnChar) = 0
			cReturnChar = cReturnChar + ".00"
		ELSE
			IF AT(".",cReturnChar) > 0
				IF LEN(RIGHT(cReturnChar,LEN(cReturnChar)-AT(".",cReturnChar))) = 1
					*Only one 0, Add second 0 for Pennies place
					cReturnChar = cReturnChar + "0"
				ENDIF
			ENDIF
		ENDIF
	ENDIF
	IF plAddCommas
		cReturnChar = AddCommas(cReturnChar)
	ENDIF
	RETURN cReturnChar 
ENDIF

IF pnNumberDecimals > 0
	DO WHILE .T.
		DO CASE
		CASE RIGHT(cNumbasChar,1) = '0'
			cNumbasChar=LEFT(cNumbasChar,LEN(cNumbasChar)-1)
		CASE RIGHT(cNumbasChar,1) = '.'
			cNumbasChar=LEFT(cNumbasChar,LEN(cNumbasChar)-1)
			EXIT
			*RETURN LTRIM(cNumbasChar)
		OTHERWISE
			EXIT
			*RETURN LTRIM(cNumbasChar)
		ENDCASE
	ENDDO
ENDIF

cReturnChar = cNumbasChar
IF plForcePennies 
	IF AT(".",cReturnChar) = 0
		cReturnChar = cReturnChar + ".00"
	ELSE
		IF AT(".",cReturnChar) > 0
			IF LEN(RIGHT(cReturnChar,AT(".",cReturnChar)+1)) = 1
				*Only one 0, Add second 0 for Pennies place
				cReturnChar = cReturnChar + "0"
			ENDIF
		ENDIF
	ENDIF
ENDIF

IF plAddCommas
	cReturnChar = AddCommas(LTRIM(cReturnChar))
ENDIF
	
RETURN LTRIM(cReturnChar)