PARAMETER cInputString, nMaxCharOnLine, nMaxLines
*NeedPageTest(cInputString, nMaxCharOnLine, nMaxLines)

*Also edit in Progs\Proc_Quotes
*SET PROCEDURE TO Progs\Proc_Quotes ADDITIVE

*nMaxCharOnLine = 51
*nMaxLines =4
*cInputString1 = "MAT'L TO MEET ASTM B473 N08020 W/ EXCEPTION OF THE FOLLOWING:"+CHR(10)+"FOLLOWING:"+CHR(10)+"60 KSI MIN YLD STRENGTH."+CHR(10)+"32 HRC MAX."
*? NeedPageTest(cInputString1, nMaxCharOnLine, nMaxLines)


IF VARTYPE(cInputString) != "C"
	RETURN .F.
ENDIF
IF VARTYPE(nMaxCharOnLine) != "N"
	RETURN .F.
ENDIF
IF VARTYPE(nMaxLines) != "N"
	RETURN .F.
ENDIF
IF nMaxCharOnLine < 1
	RETURN .F.
ENDIF
IF nMaxLines < 1
	RETURN .F.
ENDIF

*******************************
PRIVATE lNewPage
lNewPage = .F.

IF LEN(cInputString) < nMaxCharOnLine
	RETURN .F.
ENDIF

IF LEN(cInputString) > nMaxCharOnLine * nMaxLines
	RETURN .T.
ENDIF

*Count the pages
PRIVATE nCountTotal, cTestLine, nChar2Remove 
nCountTotal = 0

DO WHILE .T.
	*get the max munber of character of a line
	cTestLine = LEFT(cInputString, nMaxCharOnLine)
	nChar2Remove = nMaxCharOnLine
	IF AT(CHR(10),cTestLine) > 0
		*End of Line
		nChar2Remove = AT(CHR(10),cTestLine)
	ENDIF
	IF AT(CHR(13),cTestLine) > 0
		*End fo line
		IF AT(CHR(13),cTestLine) < nChar2Remove 
			*Set new EOL if less that current EOL
			nChar2Remove = AT(CHR(13),cTestLine)
		ENDIF
	ENDIF
	cTestLine = LEFT(cInputString, nChar2Remove)
	
	nCountTotal = nCountTotal + 1
	
	IF nCountTotal > nMaxLines
		RETURN .T.
	ENDIF
	
	cInputString = RIGHT(cInputString, LEN(cInputString)-LEN(cTestLine) )
	
	IF LEFT(cInputString, 1) = CHR(10)
		cInputString = RIGHT(cInputString, LEN(cInputString)-LEN(cTestLine) )
	ENDIF
	
	IF LEN(ALLTRIM(cInputString)) = 0
		EXIT
	ENDIF
	
	LOOP
ENDDO

RETURN lNewPage