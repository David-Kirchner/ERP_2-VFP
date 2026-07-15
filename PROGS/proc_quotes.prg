*IF NOT "PROC_QUOTES" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
*	SET PROCEDURE TO Progs\Proc_Quotes ADDITIVE
*ENDIF 

* FaxProper Whos_Sales_Order AlloySurCharge 
* AlloyStandard HasDPAScomment *Is_FCI
* Customer_Check getStartThck_RA
* MakeLogEntry SalesPDescription SalesPEmail FormDescription FormNumber_FormDescription
* ItemDescription ItemDescriptionMetric Descript SalesTotal SOiTotal
* Program_from_ShipWhere AllQuotes_ID_From_SOitem
* Remove0 NeedPageTest All_PONum TrackMess SalesOrderPfromSO
* BrandName GetBrandName_Ptl UniversalName 
* ConditionCodeText ConditionLevelText AllowedCCLevel AddSourceQuote
* GetLatestDate AddQuoteFromEmailDrop
* GetCut_Letter_Number GetCut_Name_Letter CheckCut_Letter_toForm
* ParseCutOptionsTol KerfAdjust Cut_Tol_Lost Cut_Tol_Lost_PU
* POShipAddrST SOitem_Location
* CreateHTML_Quote CreateHTML_VendorPOConf HTML_PO_Sheet_Packing HTML_PO_Acknow 
* CreateHTML_Quote_Header CreateHTML_Quote_Footer
* GetLastCall_CustomerID GetWho_CustomerID
* addQuoteMemo get_QTYwithWeight Calc_QTY_SOitem Calc_QTY_WO Get_PUtext Get_PUfromText
* Get_PU_Price_String Is_Holiday
* CreateHTML_PS_Conf
* CreateHTML_Inquire_Header *--- GatherSend uses HTML Inquire !!!!
* Create_Survey_PackingSlip_Assignment
* Create_Survey_Quote_Assignment
* AddCommas  StripHTML Kerf_Loss CubicInch_Form
*PRIVATE lTranAlreadySet, nProp 
*nProp = SQLGETPROP(nConn, 'Transactions')
*lTranAlreadySet = (nProp = 2)
* Count_Quote_ID


*IF NOT lTranAlreadySet
*= SQLSETPROP(pConn, 'Transactions', 2)  && Manual transactions
*IF lOK
*	= SQLCOMMIT(pConn)
*ELSE				
*	= SQLROLLBACK(pConn)
*ENDIF			
*= SQLSETPROP(pConn, 'Transactions', 1)  && 1AUTO, 2MANUAL Trans
**********************************************

PROCEDURE FaxProper 
PARAMETER cFax, cCountryC

PRIVATE Q_faxnm
Q_faxnm = ""

IF TYPE("cFax") != "C"
	MESSAGEBOX("Pass Parameter: cFax, cCC",0,"No Parameter")
	RETURN ""
ENDIF
IF TYPE("cCountryC") = "U"
	cCountryC = ""
ENDIF
IF TYPE("cCountryC") = "N"
	cCountryC = STR(cCountryC)
ENDIF

PRIVATE nLenFaxNum , cFirst3Num
cFax = ALLTRIM(cFax)
nLenFaxNum = LEN(cFax)
cFirst3Num = LEFT(cFax,3)
DO CASE
	CASE !( EMPTY(cCountryC) )
		Q_faxnm="011"+ALLTRIM(cCountryC)+cFax
	
	CASE nLenFaxNum = 7 AND ( cFirst3Num ="675" OR cFirst3Num ="945" OR cFirst3Num ="552" OR cFirst3Num ="947" OR cFirst3Num ="963" OR cFirst3Num ="292" OR cFirst3Num ="984" )
		*LOCAL - Leave Alone
		Q_faxnm = cFax
		
	CASE LEFT(cFax,3)="765"
		IF SUBSTR( cFax, 4,3 ) = "675"
			Q_faxnm= RIGHT(cFax,7)
		ELSE
			Q_faxnm= "1"+cFax
		ENDIF

	CASE LEFT(cFax,3)="317" OR LEFT(cFax,3)="219" OR LEFT(cFax,3)="812"
		*	Q_faxnm="10102881"+Q_faxnm
		Q_faxnm="1"+cFax

	OTHERWISE
		Q_faxnm="1"+cFax
ENDCASE

IF LEN(ALLTRIM(Q_faxnm)) > 19
	Q_faxnm = ALLTRIM(Q_faxnm)
	Q_faxnm = STRTRAN(Q_faxnm, "-", "")
ENDIF
*Q_faxnm = Q_faxnm + SPACE( 19-LEN(ALLTRIM(Q_faxnm)) )
Q_faxnm = PADR(Q_faxnm, 19, " ")

RETURN Q_faxnm
ENDPROC



**********************************************
PROCEDURE Whos_Sales_Order
PARAMETER nSalesNum
*Whos_Sales_Order(nSalesNum)
* Returns 10 digit SO and 1 Char SalesP
* Nulls return as '0         '
* SELECT dbo.Whos_Sales_Order()

PRIVATE cReturn
cReturn = "0"
IF VARTYPE(nSalesNum) != "N"
	MESSAGEBOX("Need to pass the Sales Number.",0,"No SO Parameter")
	RETURN cReturn 
ENDIF

IF ISNULL(nSalesNum)
	RETURN ' '
ENDIF

PRIVATE cSQL, nConnHandle,  CurrSelect

CurrSelect = ALIAS()
IF NOT "PROC_SQL" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
	SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
ENDIF
IF NOT "PROC_SETUP" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
	SET PROCEDURE TO Progs\Proc_Setup ADDITIVE
ENDIF 

nConnHandle = get_SQLSTRINGCONNECT()

IF nConnHandle < 0
	= MESSAGEBOX('Cannot make data connection', 16, 'SQL Connect Error')
	RETURN cReturn
ENDIF

cSQL = "SELECT dbo.Whos_Sales_Order("+STR(nSalesNum)+")"

IF USED('Whos_Sales_Order')
	USE IN Whos_Sales_Order
ENDIF

SELECT 0
nSQLEXEC = SQLEXEC(nConnHandle, cSQL, 'Whos_Sales_Order')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConnHandle, cSQL, 'Whos_Sales_Order')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConnHandle, cSQL, "Whos_Sales_Order")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConnHandle, cSQL, "Whos_Sales_Order")

		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	= MESSAGEBOX('Data Error with SQL', 16, 'SQL Error')
	RETURN cReturn
ELSE
	cReturn = Whos_Sales_Order.exp
ENDIF

IF USED('Whos_Sales_Order')
	USE IN Whos_Sales_Order
ENDIF

IF NOT EMPTY(CurrSelect)
	IF USED(CurrSelect)
		SELECT (CurrSelect)
	ENDIF
ENDIF

= SQLDISCONNECT(nConnHandle)
RETURN cReturn
ENDPROC

********************************************** 

PROCEDURE AlloySurCharge 
PARAMETER cAlloy

PRIVATE nReturn
nReturn = 0
*Returns: Element Surchage x Element Percent
* Nulls return as 0

IF TYPE("cAlloy") != "C"
	MESSAGEBOX("Need to pass the Alloy name.",0,"No Alloy Parameter")
	RETURN nReturn
ENDIF
IF EMPTY(cAlloy)
	MESSAGEBOX("Need to pass the Alloy name.",0,"No Alloy Parameter")
	RETURN nReturn
ENDIF

PRIVATE cSQL, nConnHandle, CurrSelect
CurrSelect = ALIAS()
IF NOT "PROC_SQL" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
	SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
ENDIF
IF NOT "PROC_SETUP" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
	SET PROCEDURE TO Progs\Proc_Setup ADDITIVE
ENDIF 

nConnHandle = get_SQLSTRINGCONNECT()

IF nConnHandle < 0
	= MESSAGEBOX('Cannot make data connection', 16, 'SQL Connect Error')
	RETURN nReturn
ENDIF

cSQL = "SELECT dbo.f_Alloy_Surcharge('"+cAlloy+"')"

IF USED('Surcharge')
	USE IN Surcharge
ENDIF

SELECT 0
nSQLEXEC = SQLEXEC(nConnHandle, cSQL, 'Surcharge')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConnHandle, cSQL, 'Surcharge')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConnHandle, cSQL, "Surcharge")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConnHandle, cSQL, "Surcharge")

		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	SQLEXECError(cSQL,0,nSQLEXEC, 'Surcharge')
	RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1)+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(), cSQL )
	RETURN nReturn
ELSE
	nReturn = Surcharge.exp
ENDIF

IF USED('Surcharge')
	USE IN Surcharge
ENDIF

IF NOT EMPTY(CurrSelect)
	IF USED(CurrSelect)
		SELECT (CurrSelect)
	ENDIF
ENDIF

= SQLDISCONNECT(nConnHandle)
RETURN nReturn
ENDPROC

**********************************************


PROCEDURE HasDPAScomment 
PARAMETER cComment 

PRIVATE lTrue
lTrue = .F.
*Returns: True of False


IF TYPE("cComment") != "C"
	MESSAGEBOX("Need to pass the Comment.",0,"No Comment Parameter")
	RETURN .F.
ENDIF
IF EMPTY(cComment)
	MESSAGEBOX("Need to pass the Comment.",0,"No Comment Parameter")
	RETURN .F.
ENDIF

DO CASE
CASE "DPAS" $ cComment
	lTrue = .T.
CASE "DO-" $ cComment
	lTrue = .T.
CASE "DX-" $ cComment
	lTrue = .T.
CASE "DO" $ cComment
	*MESSAGEBOX("The Quote Comment does not contain 'DO-'"+CHR(13)+"Program does not consider this a DPAS"+CHR(13)+"Add the dash so program can understand DO-",48,"Not DPAS!")
CASE "DX" $ cComment
	*MESSAGEBOX("The Quote Comment does not contain 'DX-'"+CHR(13)+"Program does not consider this a DPAS"+CHR(13)+"Add the dash so program can understand DX-",48,"Not DPAS!")
ENDCASE

RETURN lTrue 
ENDPROC

**********************************************
PROCEDURE AlloyStandard 
PARAMETER pcAlloy

PRIVATE lOpendAlloys 

PRIVATE cSQL, nConnHandle, CurrSelect
CurrSelect = ALIAS()
nConnHandle = 0


IF USED('ALLOYS')
	SELECT Alloys
	
	PRIVATE lIndexAlloy
	lIndexAlloy = .F.
	
	FOR nCount = 1 TO TAGCOUNT()
   		IF TAG(CDX(1),nCount) = "ALLOY"
   			lIndexAlloy = .T.	
   		ENDIF
	ENDFOR
	IF NOT lIndexAlloy
		INDEX ON Alloy TAG Alloys
	ENDIF
	cAlloyStand = pcAlloy
	SEEK pcAlloy ORDER TAG Alloys IN Alloys
	IF FOUND('Alloys')
		cAlloyStand = Alloys.Alloy
	ELSE
		lIndexAlloy = .F.
		FOR nCount = 1 TO TAGCOUNT()
	   		IF TAG(CDX(1),nCount) = "UPPALLOY"
   				lIndexAlloy = .T.	
   			ENDIF
		ENDFOR
		IF NOT lIndexAlloy
			INDEX ON UPPER(Alloy) TAG UppAlloys
		ENDIF

		SEEK UPPER(pcAlloy)ORDER TAG UPPALLOYS IN Alloys
		IF FOUND('Alloys')
			cAlloyStand = Alloys.Alloy
		ENDIF
	ENDIF

ELSE
	IF NOT "PROC_SQL" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
		SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
	ENDIF
	IF NOT "PROC_SETUP" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
		SET PROCEDURE TO Progs\Proc_Setup ADDITIVE
	ENDIF 
	
	nConnHandle = get_SQLSTRINGCONNECT()
	IF nConnHandle < 0
		MESSAGEBOX('Cannot make data connection', 16, 'SQL Connect Error')
		RETURN ' '
	ENDIF
	
	
	cSQL = "SELECT TOP 1 Alloy FROM dbo.Alloys WHERE Alloys = '"+pcAlloy+"'"

	IF USED('tmpAlloys')
		USE IN tmpAlloys
	ENDIF

	SELECT 0
	nSQLEXEC = SQLEXEC(nConnHandle, cSQL, 'tmpAlloys')
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConnHandle, cSQL, 'tmpAlloys')
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConnHandle, cSQL, "tmpAlloys")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConnHandle, cSQL, "tmpAlloys")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL,0,nSQLEXEC, 'tmpAlloys')
		RecordError(nSQLEXEC,"SQL Error" ,"Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		RETURN ' '
	ELSE
		IF USED('tmpAlloys')
			cAlloyStand = tmpAlloys.Alloy
			USE IN tmpAlloys
		ENDIF
	ENDIF

	IF nConnHandle > 0
		= SQLDISCONNECT(nConnHandle)
	ENDIF
ENDIF

IF NOT EMPTY(CurrSelect)
	IF USED(CurrSelect)
		SELECT (CurrSelect)
	ENDIF
ENDIF

RETURN cAlloyStand
ENDPROC

**********************************************
PROCEDURE Customer_Check 
PARAMETER cCompany,cName,cPhone,cEmail
DO CASE
CASE UPPER(cCompany) = "HITACHI ZOSEN" AND UPPER(RIGHT(cEmail,8)) != "VITTO.JP"
	MESSAGEBOX("'HITACHI ZOSEN' Quotes must go thru atsumori.fujie@vitto.jp"+CHR(13)+"Vitto has exclusive deal with Hitachi.",0+16,"Please address to 'atsumori.fujie@vitto.jp'")
	TRACKERROR("'HITACHI ZOSEN' Quotes must go thru atsumori.fujie@vitto.jp"+CHR(13)+"Vitto has exclusive deal with Hitachi.","Found Hitachi Name","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1)+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
CASE SOUNDEX(UPPER(cCompany)) = SOUNDEX("HITACHI ZOSEN") AND UPPER(RIGHT(cEmail,8)) != "VITTO.JP"
	IF UPPER(cCompany) = "HOT SECTION TECHNOLOGIES" ;
		OR UPPER(cCompany) = "HODGES MANUFACTURING" ;
		OR UPPER(cCompany) = "HITACHI CABLE"
		*Skip
	ELSE
		MESSAGEBOX(cCompany+" Sounds Like 'HITACHI ZOSEN' to the computer."+CHR(13)+"'HITACHI ZOSEN' Quotes must go thru atsumori.fujie@vitto.jp"+CHR(13)+"Vitto has exclusive deal with Hitachi.",0+16,"Please address to 'atsumori.fujie@vitto.jp'")
		TRACKERROR(cCompany+" Sounds Like 'HITACHI ZOSEN' to the computer."+CHR(13)+"'HITACHI ZOSEN' Quotes must go thru atsumori.fujie@vitto.jp"+CHR(13)+"Vitto has exclusive deal with Hitachi.","Found Hitachi Name","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1)+" @"+PROGRAM(1),LINENO())
	ENDIF
ENDCASE

ENDPROC

********************************************** 
PROCEDURE getStartThck_RA
PARAMETER nSNomThck, nCW, cForm 
*nStartThck = getStartThck_RA(1,.3,'10')

PRIVATE nReturnThck
nReturnThck = 0

PRIVATE M.sD2, M.sRA, M.D1
IF NOT (VARTYPE(nSNomThck) = "N" OR VARTYPE(nSNomThck) = "Y" )
	MESSAGEBOX("Did not get a Start Thck or Dia parameter",0,"Cannot find Start Size")
	RETURN 0
ELSE 	
	M.sD2 = nSNomThck
ENDIF

IF NOT VARTYPE(nCW) = "N"
	MESSAGEBOX("Did not get a RA parameter",0,"Cannot find Start Size")
	RETURN 0
ELSE
	M.sRA = nCW
ENDIF

IF NOT VARTYPE(cForm) = "C"
	MESSAGEBOX("Did not get a Form parameter",0,"Cannot find Start Size")
	RETURN 0
ENDIF

****************
IF M.sRA > 1
	*Change from a Percent to actual decimal
	M.sRA = M.sRA/100
ENDIF

M.D1 = 0
PRIVATE M.sD1b

*************
*Math

DO CASE
CASE cForm = '10' OR cForm = '20' OR cForm = '21' OR cForm = '22' OR cForm = '23' 
	*FIND D1 BY D2 AND RA
	IF M.sD2 > 0 AND M.sRA > 0 AND M.D1 = 0
		M.A2= 3.14156*M.sD2*M.sD2/4
		M.A1 = M.A2/(1-M.sRA)
		nReturnThck = SQRT(M.A1*4/3.14156)
	ELSE
		MESSAGEBOX("Did not get a Start Dia or RA",0,"Cannot find Start Size")
	ENDIF
CASE cForm = '11' OR cForm = '40' OR cForm = '80' OR cForm = '50' OR cForm = '51' OR cForm = '52' OR cForm = '53' OR cForm = '96' 
	*FIND Thck1 BY Thck2 AND RA
	IF M.sD2 > 0 AND M.sRA > 0 AND M.D1 = 0
		M.sD1b = (1-M.sRA)/M.sD2
		nReturnThck = 1/M.sD1b
	ELSE
		MESSAGEBOX("Did not get a Start Thck or RA",0,"Cannot find Start Size")
	ENDIF
OTHERWISE
	MESSAGEBOX("Form "+cform+" is not programed at this time",0,"Cannot find Start Size")
ENDCASE

**************

RETURN nReturnThck
ENDPROC

********************************************** 
PROCEDURE BrandName 
PARAMETER pcAlloy

PRIVATE cSQL, nConnHandle, CurrSelect, cBrandName
CurrSelect = ALIAS()
nConnHandle = 0
cBrandName = ' '
IF NOT "PROC_SQL" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
	SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
ENDIF
IF NOT "PROC_SETUP" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
	SET PROCEDURE TO Progs\Proc_Setup ADDITIVE
ENDIF 
nConnHandle = get_SQLSTRINGCONNECT()
IF nConnHandle < 0
	MESSAGEBOX('Cannot make data connection', 16, 'SQL Connect Error')
	RETURN ' '
ENDIF

IF USED('tmpBrandName')
	USE IN tmpBrandName
ENDIF

cSQL = "SELECT TOP 1 BrandName FROM dbo.Alloy WHERE Alloy = '"+pcAlloy+"'"
SELECT 0
nSQLEXEC = SQLEXEC(nConnHandle, cSQL, 'tmpBrandName')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConnHandle, cSQL, 'tmpBrandName')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConnHandle, cSQL, "tmpBrandName")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConnHandle, cSQL, "tmpBrandName")

		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	SQLEXECError(cSQL,0,nSQLEXEC, 'tmpBrandName')
	RecordError(nSQLEXEC,"SQL Error" ,"Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	RETURN ' '
ELSE
	IF USED('tmpBrandName')
		cBrandName = tmpBrandName.BrandName 
		USE IN tmpBrandName
		
	ENDIF
	IF ISNULL(cBrandName)
		*Try AlloyStandard
		pcAlloy = AlloyStandard(pcAlloy)
		cSQL = "SELECT TOP 1 BrandName FROM dbo.Alloy WHERE Alloy = '"+pcAlloy+"'"
		*SELECT 0
		nSQLEXEC = SQLEXEC(nConnHandle, cSQL, 'tmpBrandName')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConnHandle, cSQL, 'tmpBrandName')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(nConnHandle, cSQL, "tmpBrandName")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(nConnHandle, cSQL, "tmpBrandName")

				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL,0,nSQLEXEC, 'tmpBrandName')
			RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(), cSQL )
			RETURN ' '
		ELSE
			IF USED('tmpBrandName')
				cBrandName = tmpBrandName.BrandName 
				USE IN tmpBrandName
			ENDIF
		ENDIF
	ENDIF
ENDIF

IF ISNULL(cBrandName)
	cBrandName = ' '
ENDIF

IF nConnHandle > 0
	= SQLDISCONNECT(nConnHandle)
ENDIF


IF NOT EMPTY(CurrSelect)
	IF USED(CurrSelect)
		SELECT (CurrSelect)
	ENDIF
ENDIF

RETURN cBrandName
ENDPROC

********************************************** 
PROCEDURE GetBrandName_Ptl
PARAMETER cPartialBN
*cBrandName = ALLTRIM(GetBrandName_Ptl( SUBSTR(cDescription, nLocat-2, 8) ))
*cPartialBN is CC?CCCCC

IF VARTYPE(cPartialBN) != "C"
	RETURN ''
ELSE
	cPartialBN = ALLTRIM(cPartialBN)
ENDIF
PRIVATE cPartBN
cPartBN = ''

*PARSE cPartialBN
DO CASE 
CASE AT("?", cPartialBN) = 0
	RETURN ''
CASE AT("?", cPartialBN) = 1
	cPartBN = "%" + cPartialBN
CASE AT("?", cPartialBN) = 2
	cPartBN = "%" + cPartialBN
CASE AT("?", cPartialBN) = 3
	cPartBN = "%" + cPartialBN
OTHERWISE
	cPartBN = "%" + cPartialBN
	TrackMess("cPartialBN="+cPartialBN+".")
ENDCASE

PRIVATE cSQL, nConnHandle, CurrSelect, cBrandName
CurrSelect = ALIAS()
nConnHandle = 0
cBrandName = ' '
IF NOT "PROC_SQL" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
	SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
ENDIF
IF NOT "PROC_SETUP" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
	SET PROCEDURE TO Progs\Proc_Setup ADDITIVE
ENDIF 
nConnHandle = get_SQLSTRINGCONNECT()
IF nConnHandle < 0
	MESSAGEBOX('Cannot make data connection', 16, 'SQL Connect Error')
	RETURN ' '
ENDIF

IF USED('tmpBrandName')
	USE IN tmpBrandName
ENDIF

cSQL = "SELECT TOP 1 BrandName FROM dbo.Alloy WHERE BrandName LIKE '"+cPartBN+"'"
SELECT 0
nSQLEXEC = SQLEXEC(nConnHandle, cSQL, 'tmpBrandName')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConnHandle, cSQL, 'tmpBrandName')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConnHandle, cSQL, "tmpBrandName")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConnHandle, cSQL, "tmpBrandName")

		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	SQLEXECError(cSQL,0,nSQLEXEC, 'tmpBrandName')
	*TrackError("SQLEXECError",cSQL,"Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(1),LINENO())
	RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	RETURN ' '
ELSE
	IF USED('tmpBrandName')
		cBrandName = tmpBrandName.BrandName 
		USE IN tmpBrandName
		
	ENDIF
ENDIF

IF ISNULL(cBrandName)
	cBrandName = ' '
ENDIF

IF nConnHandle > 0
	= SQLDISCONNECT(nConnHandle)
ENDIF


IF NOT EMPTY(CurrSelect)
	IF USED(CurrSelect)
		SELECT (CurrSelect)
	ENDIF
ENDIF

RETURN cBrandName
ENDPROC

**********************************************
PROCEDURE UniversalName 
PARAMETER pcAlloy

IF VARTYPE(pcAlloy) != "C"
	RETURN ' '
ENDIF

PRIVATE cSQL, nConnHandle, CurrSelect, cUniversalName
CurrSelect = ALIAS()
nConnHandle = 0
cUniversalName = ' '
IF NOT "PROC_SQL" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
	SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
ENDIF
IF NOT "PROC_SETUP" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
	SET PROCEDURE TO Progs\Proc_Setup ADDITIVE
ENDIF 
nConnHandle = get_SQLSTRINGCONNECT()
IF nConnHandle < 0
	MESSAGEBOX('Cannot make data connection', 16, 'SQL Connect Error')
	RETURN ' '
ENDIF

IF USED('tmpUniversalNameName')
	USE IN tmpUniversalNameName
ENDIF

cSQL = "SELECT TOP 1 UName FROM dbo.Alloy WHERE Alloy = '"+pcAlloy+"'"
SELECT 0
nSQLEXEC = SQLEXEC(nConnHandle, cSQL, 'tmpUniversalNameName')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConnHandle, cSQL, 'tmpUniversalNameName')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConnHandle, cSQL, "tmpUniversalNameName")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConnHandle, cSQL, "tmpUniversalNameName")

		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	SQLEXECError(cSQL,0,nSQLEXEC, 'tmpUniversalNameName')
	RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	RETURN ' '
ELSE
	IF USED('tmpUniversalNameName')
		cUniversalName = tmpUniversalNameName.UName 
		USE IN tmpUniversalNameName
		
	ENDIF
	IF ISNULL(cUniversalName)
		*Try AlloyStandard
		pcAlloy = AlloyStandard(pcAlloy)
		cSQL = "SELECT TOP 1 UName FROM dbo.Alloy WHERE Alloy = '"+pcAlloy+"'"
		*SELECT 0
		nSQLEXEC = SQLEXEC(nConnHandle, cSQL, 'tmpUniversalNameName')
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConnHandle, cSQL, 'tmpUniversalNameName')
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(nConnHandle, cSQL, "tmpUniversalNameName")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(nConnHandle, cSQL, "tmpUniversalNameName")

				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL,0,nSQLEXEC, 'tmpUniversalNameName')
			RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
			RETURN ' '
		ELSE
			IF USED('tmpUniversalNameName')
				cUniversalName = tmpUniversalNameName.UName 
				USE IN tmpUniversalNameName
			ENDIF
		ENDIF
	ENDIF
ENDIF

IF ISNULL(cUniversalName)
	cUniversalName = ' '
ENDIF

IF nConnHandle > 0
	= SQLDISCONNECT(nConnHandle)
ENDIF


IF NOT EMPTY(CurrSelect)
	IF USED(CurrSelect)
		SELECT (CurrSelect)
	ENDIF
ENDIF

RETURN cUniversalName
ENDPROC

**********************************************
PROCEDURE ConditionCodeText 
PARAMETER pcCC

IF VARTYPE(pcCC) != 'C'
	RETURN ' '
ENDIF

PRIVATE cSQL, nConnHandle, CurrSelect, cCCtext
CurrSelect = ALIAS()
nConnHandle = 0
cCCtext = ' '
IF NOT "PROC_SQL" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
	SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
ENDIF
IF NOT "PROC_SETUP" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
	SET PROCEDURE TO Progs\Proc_Setup ADDITIVE
ENDIF 
nConnHandle = get_SQLSTRINGCONNECT()
IF nConnHandle < 0
	MESSAGEBOX('Cannot make data connection', 16, 'SQL Connect Error')
	RETURN ' '
ENDIF

IF USED('tmpCCtext')
	USE IN tmpCCtext
ENDIF

cSQL = "SELECT [Text] FROM dbo.ConditionCode WHERE CC = '"+pcCC+"'"
SELECT 0
nSQLEXEC = SQLEXEC(nConnHandle, cSQL, 'tmpCCtext')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConnHandle, cSQL, 'tmpCCtext')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConnHandle, cSQL, "tmpCCtext")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConnHandle, cSQL, "tmpCCtext")

		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	SQLEXECError(cSQL,0,nSQLEXEC, 'tmpCCtext')
	RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	RETURN ' '
ELSE
	IF USED('tmpCCtext')
		cCCtext = ALLTRIM(tmpCCtext.Text)
		USE IN tmpCCtext
	ENDIF
ENDIF

IF ISNULL(cCCtext)
	cCCtext= ' '
ENDIF

IF nConnHandle > 0
	= SQLDISCONNECT(nConnHandle)
ENDIF


IF NOT EMPTY(CurrSelect)
	IF USED(CurrSelect)
		SELECT (CurrSelect)
	ENDIF
ENDIF

RETURN cCCtext
ENDPROC

********************************* 
PROCEDURE ConditionLevelText 
PARAMETER pCC, pCL, pConnHandle
* ? ConditionLevelText('8','1')
* Returns Text, C(18)

IF VARTYPE(pCC) != "C"
	RETURN " "
ENDIF
IF VARTYPE(pCL) != "C"
	RETURN " "
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
PRIVATE cSQL, nSQLEXEC, cCCText

PRIVATE cAlias 
cAlias = ALIAS()

**********
IF USED('ConditionCode')
	SELECT ConditionCode
ELSE
	SELECT 0
ENDIF

cSQL = "SELECT dbo.f_ConditionCodeLevelText('"+pCC+"','"+pCL+"') AS [Text]"
*cSQL="SELECT [text] FROM dbo.ConditionCode WHERE [cc]='"+pCC+"'"

nSQLEXEC = SQLEXEC( nConn, cSQL, 'ConditionCode')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'ConditionCode')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "ConditionCode")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "ConditionCode")

		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	SQLEXECError( cSQL, nConn, nSQLEXEC, 'ConditionCode')
	RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
ENDIF

cCCText = " "
IF USED('ConditionCode')
	IF VARTYPE(ConditionCode.Text) = "C"
		cCCText = ConditionCode.Text
	ENDIF
	USE IN ConditionCode
ENDIF


IF lNewConn 
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN ALLTRIM(cCCText)
ENDPROC
********************************* 
PROCEDURE AllowedCCLevel 
PARAMETER pCC, pCL, pConnHandle
* ? AllowedCCLevel('8','1')
* Returns logic

IF VARTYPE(pCC) != "C"
	RETURN " "
ENDIF
IF VARTYPE(pCL) != "C"
	RETURN " "
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
PRIVATE cSQL, nSQLEXEC, cCCText

PRIVATE cAlias 
cAlias = ALIAS()

**********
IF USED('ConditionCode')
	SELECT ConditionCode
ELSE
	SELECT 0
ENDIF

cSQL = "SELECT COUNT(*) AS CNTD "
cSQL=cSQL+"	FROM dbo.ConditionCode CC "
cSQL=cSQL+"	LEFT OUTER JOIN dbo.ConditionLevel CL ON CC.CC = CL.CC "
cSQL=cSQL+"	WHERE CC.CC = '"+pCC+"'"
cSQL=cSQL+"	AND CL.CL = '"+pCL+"'"
	
nSQLEXEC = SQLEXEC( nConn, cSQL, 'ConditionCode')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'ConditionCode')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "ConditionCode")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "ConditionCode")

		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	SQLEXECError( cSQL, nConn, nSQLEXEC, 'ConditionCode')
	RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
ENDIF

PRIVATE lGoodCombo
lGoodCombo = .F.

IF USED('ConditionCode')
	IF RECCOUNT('ConditionCode') > 0
		IF ConditionCode.CNTD > 0
			lGoodCombo = .T.
		ENDIF
	ENDIF
	USE IN ConditionCode
ENDIF


IF lNewConn 
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lGoodCombo
ENDPROC
**********************************************
PROCEDURE AddSourceQuote 
PARAMETER cInqNumP,cPerson,cVendor,nConn

IF VARTYPE(cInqNumP) != "C"
	RETURN 
ENDIF
IF VARTYPE(cPerson) != "C"
	RETURN 
ENDIF

IF VARTYPE(cVendor) != "C"
	RETURN 
ENDIF

IF VARTYPE(nConn) != "N"
	RETURN 
ENDIF

PRIVATE lFoundAllQuotes, lFoundSupplierQuotes
lFoundAllQuotes = .F.
lFoundSupplierQuotes = .F.

nConn = CheckSQLConnection(nConn)
PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL


PRIVATE cAlloy,cForm,cCC,cCL,nThck,nSz2,nSz3,nWeight
cAlloy	= ''
cForm	= ''
cCC		= ''
cCL		= ''
nThck	= 0
nSz2	= 0
nSz3	= 0
nWeight = 0

IF USED('tmpAQ')	
	USE IN tmpAQ
ENDIF
cSQL = "SELECT Alloy,Form,CC,CL,Thck,Sz2,Sz3,Weight FROM dbo.AllQuotes "
cSQL = cSQL + " WHERE InqNumP = '"+cInqNumP+"'"

SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpAQ')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpAQ')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpAQ")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpAQ")

		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpAQ')
	RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	RETURN 
ELSE
	IF USED('tmpAQ')
		IF VARTYPE(tmpAQ.Alloy) = "C"
			lFoundAllQuotes = .T.
			cAlloy	= PrepareSQLtxt(tmpAQ.Alloy,'Alloy',12)
			cForm	= PrepareSQLtxt(tmpAQ.Form,'Form',2)
			cCC		= PrepareSQLtxt(tmpAQ.CC,'CC',1)
			cCL		= PrepareSQLtxt(tmpAQ.CL,'CL',1)
			nThck	= PrepareSQLnum(tmpAQ.Thck,'Thck',10,4)
			nSz2	= PrepareSQLnum(tmpAQ.Sz2,'Sz2',9,3)
			nSz3	= PrepareSQLnum(tmpAQ.Sz3,'Sz3',9,3)
			nWeight	= PrepareSQLnum(tmpAQ.Weight,'Weight',9,1)
		ENDIF
		USE IN tmpAQ
		
	ENDIF
ENDIF


IF USED('tmpCntSupplier')
	USE IN tmpCntSupplier
ENDIF

cSQL = "SELECT COUNT(*) as CNT FROM dbo.SupplierQuotes "
cSQL = cSQL + " WHERE InqNumP = '"+cInqNumP+"'"
cSQL = cSQL + " AND Supplier = '"+cVendor+"'"

SELECT 0
nSQLEXEC = SQLEXEC(nConn , cSQL, 'tmpCntSupplier')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC(nConn , cSQL, 'tmpCntSupplier')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpCntSupplier")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpCntSupplier")

		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpCntSupplier')
	RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	RETURN 
ELSE
	IF USED('tmpCntSupplier')
		IF tmpCntSupplier.CNT > 0
			lFoundSupplierQuotes = .T.
		ENDIF
		USE IN tmpCntSupplier
		
	ENDIF
ENDIF
	


PRIVATE cSupplier,cContact,nUnitPrice,nQuantity,nPcPrice,dDueDate,dSaveDate,cNotes
cSupplier	= ''
cContact	= ''
nUnitPrice	= 0
nQuantity	= 0
nPcPrice	= 0
dDueDate	= ""
dSaveDate	= ""
cNotes 		= ""

IF lFoundSupplierQuotes 
	IF USED('tmpGetSupplierQuote')
		USE IN tmpGetSupplierQuote
	ENDIF

	cSQL = "SELECT Contact,UnitPrice,Quantity,PcPrice,DueDate,SaveDate,Notes FROM dbo.SupplierQuotes "
	cSQL = cSQL + " WHERE InqNumP = '"+cInqNumP+"'"
	cSQL = cSQL + " AND Supplier = '"+cVendor+"'"

	SELECT 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpGetSupplierQuote')
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpGetSupplierQuote')
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpGetSupplierQuote")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpGetSupplierQuote")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL,nConn,nSQLEXEC, 'tmpGetSupplierQuote')
		RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		RETURN 
	ELSE
		IF USED('tmpGetSupplierQuote')
			IF VARTYPE(tmpGetSupplierQuote.Contact) = "C"
				cSupplier	= cVendor
*				cContact	= PrepareSQLtxt(tmpGetSupplierQuote.Contact,"Contact",30)
				nUnitPrice	= PrepareSQLnum(tmpGetSupplierQuote.UnitPrice,"UnitPrice",10,4)
				nQuantity	= PrepareSQLnum(tmpGetSupplierQuote.Quantity,"Quantity",9,1)
				nPcPrice	= PrepareSQLnum(tmpGetSupplierQuote.PcPrice,"PcPrice",10,4)
				dDueDate	= PrepareSQLDate(tmpGetSupplierQuote.DueDate,"DueDate")
				dSaveDate	= PrepareSQLDate(tmpGetSupplierQuote.SaveDate,"SaveDate")
				cNotes		= PrepareSQLtxt(tmpGetSupplierQuote.Notes,"Notes",10)
			ENDIF
			USE IN tmpGetSupplierQuote
			
		ENDIF
	ENDIF
ENDIF



IF lFoundSupplierQuotes 
	*Update
	
	IF lFoundAllQuotes 
		cSQL = "UPDATE dbo.SupplierQuotes "
		cSQL = cSQL + " SET Alloy = '"+cAlloy+"'"
		cSQL = cSQL + ",Form = '"+cForm+"'"
		cSQL = cSQL + ",CC = '"+cCC+"'"
		cSQL = cSQL + ",CL = '"+cCL+"'"
		cSQL = cSQL + ",Thck="+STR(nThck,10,4)
		cSQL = cSQL + ",Sz2="+STR(nSz2,9,3)
		cSQL = cSQL + ",Sz3="+STR(nSz3,9,3)
*		cSQL = cSQL + ",Quantity="+STR(nWeight,9,1)
*		cSQL = cSQL + ",Contact = '"+cContact+"'"
		cSQL = cSQL + " WHERE InqNumP = '"+cInqNumP+"'"
		cSQL = cSQL + " AND Supplier = '"+cVendor+"'"

		SELECT 0
		nSQLEXEC = SQLEXEC(nConn,cSQL)
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn,cSQL)
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
			SQLEXECError(cSQL,nConn,nSQLEXEC)
			RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
			RETURN 
		ENDIF
	ENDIF
		
ELSE
	*Insert
	cNotes = "ComputerAd"
	
	*Supplier,Contact,UnitPrice,Quantity,DueDate,SaveDate,Notes, InqNumP,Alloy,Form,CC,Thck,Sz2,Sz3
	cSQL = "INSERT INTO dbo.SupplierQuotes "
	cSQL = cSQL + " ( Supplier,Contact,UnitPrice,Quantity,PcPrice,Notes, InqNumP,Alloy,Form,CC,CL,Thck,Sz2,Sz3  ) VALUES ( "
	cSQL = cSQL + "'"+cVendor+"'"
	cSQL = cSQL + ",'"+cPerson+"'"
	cSQL = cSQL + ","+STR(nUnitPrice,10,4)
	IF nWeight > 0
		cSQL = cSQL + ","+STR(nWeight,9,1)
	ELSE
		cSQL = cSQL + ","+STR(nQuantity,9,1)  
	ENDIF
	cSQL = cSQL + ","+STR(nPcPrice,10,4)
	cSQL = cSQL + ",'"+cNotes+"'"
	cSQL = cSQL + ",'"+cInqNumP+"'"
	cSQL = cSQL + ",'"+cAlloy+"'"
	cSQL = cSQL + ",'"+cForm+"'"
	cSQL = cSQL + ",'"+cCC+"'"
	cSQL = cSQL + ",'"+cCL+"'"
	cSQL = cSQL + ","+STR(nThck,10,4)
	cSQL = cSQL + ","+STR(nSz2,9,3)
	cSQL = cSQL + ","+STR(nSz3,9,3)
	cSQL = cSQL + ")"
	
	SELECT 0
	nSQLEXEC = SQLEXEC(nConn,cSQL)
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn,cSQL)
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
		SQLEXECError(cSQL,nConn,nSQLEXEC)
		RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		RETURN 
	ENDIF
	
ENDIF
	

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN 
ENDPROC

*****************************************************

PROCEDURE MakeLogEntry
 PARAMETERS message, username
 pnHandle = FOPEN("LOG2.TXT",2)     && Assume the file exists
 pnSize = FSEEK(pnHandle,0,2)           && Move to end of file
 logEntry = DTOC(DATE())+","+TIME()+","+username+","+message
 =FPUTS(pnHandle, logEntry)
 =FCLOSE(pnHandle)  && Close file
 
ENDPROC

*********************************

PROCEDURE SalesPDescription 
PARAMETERS pcSalesP,pcCover
*cSalesRep = SalesPDescription(cSalesP,cCover)
*Returns SalesRep
********************************************************************
** CHANGES HERE MUST BE REPLICATED TO:
** SalesPDescription.prg
********************************************************************
PRIVATE lcSalesPName 
lcSalesPName = "All Salesmen"

IF VARTYPE(pcSalesP) != "C"
	RETURN lcSalesPName
ENDIF

PRIVATE cCover
cCover = ''

IF VARTYPE(pcCover) = "C"
	cCover = UPPER(pcCover)
	IF pcSalesP = "1" AND LEN(cCover) > 0
		pcSalesP = cCover
	ENDIF
ENDIF

IF NOT "PROC_SQL" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
	SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
ENDIF
IF NOT "PROC_SETUP" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
	SET PROCEDURE TO Progs\Proc_Setup ADDITIVE
ENDIF 
PRIVATE nConn
nConn = get_SQLSTRINGCONNECT()

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPQ_SQLAns')
	USE IN tmpPQ_SQLAns
ENDIF
SELECT 0

IF nConn > 0
	IF pcSalesP = "0"
		lcSalesPName = "Production"
	ELSE
		cSQL = "SELECT [UN] FROM dbo.AppSetup WITH(NOLOCK) WHERE [Prp] = 'SalesP' AND [ANS] = '"+pcSalesP+"'"
		
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPQ_SQLAns' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn,  cSQL, 'tmpPQ_SQLAns' )
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPQ_SQLAns")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPQ_SQLAns")

				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPQ_SQLAns')
			RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
		
		IF USED('tmpPQ_SQLAns')
			IF VARTYPE(tmpPQ_SQLAns.UN) = "C"
				lcSalesPName = RTRIM(tmpPQ_SQLAns.UN)
			ENDIF

			USE IN tmpPQ_SQLAns
		ENDIF

		IF !EMPTY(lcSalesPName) AND ATC(" ", ALLTRIM(lcSalesPName)) = 0
			lcSalesPName = AppSetup_Login_DisplayName(lcSalesPName, nConn)
		ENDIF
		
		SQLDISCONNECT( nConn )
	ENDIF
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1)+" @"+PROGRAM(1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN lcSalesPName
ENDPROC

*********************************

PROCEDURE SalesPEmail 
PARAMETERS pcSalesP, pCover, plAddCover
*? SalesPemail('D')

********************************************************************
** CHANGES HERE MUST BE REPLICATED TO:
** SalesPEmail.PRG
********************************************************************

PRIVATE lcReturnName
lcReturnName = " "

IF VARTYPE(pcSalesP) != "C"
	RETURN lcReturnName
ENDIF

IF VARTYPE(plAddCover) != "L"
	plAddCover = .F.
ENDIF

PRIVATE cCover
cCover = ''

IF VARTYPE(pCover) = "C"
	cCover = UPPER(pCover)
	*Always replace SalesP 1
	IF pcSalesP = "1" AND LEN(cCover) > 0
		pcSalesP = cCover
	ENDIF
ENDIF

IF NOT "PROC_SQL" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
	SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
ENDIF
IF NOT "PROC_SETUP" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
	SET PROCEDURE TO Progs\Proc_Setup ADDITIVE
ENDIF 
PRIVATE nConn
nConn = get_SQLSTRINGCONNECT()

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPQ_SQLAns')
	USE IN tmpPQ_SQLAns
ENDIF
SELECT 0

IF nConn > 0

	cSQL = "SELECT S2.Ans FROM dbo.AppSetup S1 WITH(NOLOCK) , dbo.AppSetup S2 WITH(NOLOCK) "
	cSQL = cSQL + " WHERE S1.Prp = 'SalesP' AND S1.Ans = '"+pcSalesP+"' AND S2.Un = S1.Un AND s2.prp='E-mail'" 
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPQ_SQLAns' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPQ_SQLAns' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPQ_SQLAns")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPQ_SQLAns")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPQ_SQLAns')
		RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
	
	IF USED('tmpPQ_SQLAns')
		IF VARTYPE(tmpPQ_SQLAns.ANS) = "C"
			lcReturnName = ALLTRIM(PrepareSQLemail(tmpPQ_SQLAns.ANS,'Email',100))  &&SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
		ENDIF

		USE IN tmpPQ_SQLAns
	ENDIF
	
	**************************
	IF plAddCover
		IF LEN(cCover) > 0
			pcSalesP = cCover
			
			cSQL = "SELECT S2.Ans FROM dbo.AppSetup S1 WITH(NOLOCK) , dbo.AppSetup S2 WITH(NOLOCK) "
			cSQL = cSQL + " WHERE S1.Prp = 'SalesP' AND S1.Ans = '"+pcSalesP+"' AND S2.Un = S1.Un AND s2.prp='E-mail'" 
			
			nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPQ_SQLAns' )
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL' TIMEOUT 1
				nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPQ_SQLAns' )
				RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
			ENDDO
			IF nSQLEXEC < 0 &&Try again!
				nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPQ_SQLAns")
				DO WHILE nSQLEXEC = 0
					WAIT WINDOW 'SQL 2' TIMEOUT 1
					nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPQ_SQLAns")

					IF nSQLEXEC < 0
						IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
							nSQLEXEC = 0
						ENDIF
					ENDIF
				ENDDO
			ENDIF
			IF nSQLEXEC < 0
				SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPQ_SQLAns')
				RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
			ENDIF
			
			IF USED('tmpPQ_SQLAns')
				IF VARTYPE(tmpPQ_SQLAns.ANS) = "C"
				
					IF LEN(lcReturnName) > 0
						lcReturnName = lcReturnName 
					ELSE 
						lcReturnName = ''
					ENDIF
					PRIVATE cReturn2
					cReturn2 = ALLTRIM(PrepareSQLemail(tmpPQ_SQLAns.ANS,'Email',100))
					IF LEN(cReturn2) > 0
						lcReturnName = cReturn2 +";"+ lcReturnName 
					ENDIF
				ENDIF

				USE IN tmpPQ_SQLAns
			ENDIF
			
		ENDIF
	ENDIF	

	**************************
	SQLDISCONNECT( nConn )
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN ALLTRIM(lcReturnName)
ENDPROC

********************************************************************** 
PROCEDURE FormDescription 
PARAMETERS pcFormNumber, nThck 
*cFormDescription = FormDescription( pcFormNumber, nThck )

PRIVATE lcFormDescription
lcFormDescription = "" &&Max Len = 11

IF VARTYPE(pcFormNumber) != "C"
	RETURN ' '
ENDIF
IF EMPTY(pcFormNumber) 
	RETURN ' '
ENDIF
IF VARTYPE(nThck) !="N"
	nThck = 0
ENDIF

*****
DO CASE
*CASE pcFormNumber = "0"
*	lcFormDescription = ""
CASE pcFormNumber = "40"
	IF nThck < .187
		lcFormDescription = "SHEET    "
	ELSE
		lcFormDescription = "PLATE    "	
	ENDIF
	IF nThck = 0
		lcFormDescription = "PLATE/SHT"
	ENDIF
*CASE pcFormNumber = "80"
*	IF nThck = 0
*		lcFormDescription = "DISK     "
*	ELSE
*		lcFormDescription = "RING     "	
*	ENDIF
CASE pcFormNumber = "01"
   lcFormDescription = "10 BAR"+CHR(13)
   lcFormDescription = lcFormDescription + "11 FLAT BAR  "+CHR(13)
   lcFormDescription = lcFormDescription + "12 HEX BAR   "+CHR(13)
   lcFormDescription = lcFormDescription + "13 SQUARE BAR"+CHR(13)
   lcFormDescription = lcFormDescription + "20 WIRE      "+CHR(13)
   lcFormDescription = lcFormDescription + "21 WIRE CUTS "+CHR(13)
   lcFormDescription = lcFormDescription + "30 C. ELECT  "+CHR(13)
   lcFormDescription = lcFormDescription + "40 SHEET/PLATE"+CHR(13)
   lcFormDescription = lcFormDescription + "51 STRIP     "+CHR(13)
   lcFormDescription = lcFormDescription + "52 COIL      "+CHR(13)
   lcFormDescription = lcFormDescription + "60 TUBING    "+CHR(13)
   lcFormDescription = lcFormDescription + "65 PIPE      "+CHR(13)
   lcFormDescription = lcFormDescription + "66 NIPPLE    "+CHR(13)
   lcFormDescription = lcFormDescription + "67 ELBOW     "+CHR(13)
   lcFormDescription = lcFormDescription + "68 TEE       "+CHR(13)
   lcFormDescription = lcFormDescription + "69 REDUCER   "+CHR(13)
   lcFormDescription = lcFormDescription + "70 FITTINGS  "+CHR(13)
   lcFormDescription = lcFormDescription + "71 COUPLING  "+CHR(13)
   lcFormDescription = lcFormDescription + "72 FLANGE    "+CHR(13)
   lcFormDescription = lcFormDescription + "75 FASTENER  "+CHR(13)
   lcFormDescription = lcFormDescription + "80 DISK/RING "+CHR(13)
   lcFormDescription = lcFormDescription + "90 MACHINED  "+CHR(13)
   lcFormDescription = lcFormDescription + "95 FORGED    "+CHR(13)
   lcFormDescription = lcFormDescription + "99 INGOT     "+CHR(13)
OTHERWISE
	*use SQL table
	IF NOT "PROC_SQL" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
		SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
	ENDIF
	IF NOT "PROC_SETUP" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
		SET PROCEDURE TO Progs\Proc_Setup ADDITIVE
	ENDIF 
	
    PRIVATE nConn
	nConn = get_SQLSTRINGCONNECT()

	PRIVATE cAlias 
	cAlias = ALIAS()

	PRIVATE cSQL, nSQLEXEC

	IF USED('tmpPQ_SQLAns')
		USE IN tmpPQ_SQLAns
	ENDIF
	SELECT 0

	IF nConn > 0

		cSQL = "SELECT FormDescription FROM dbo.Forms WHERE FormNumber = '"+pcFormNumber +"'"
		
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPQ_SQLAns' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPQ_SQLAns' )
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPQ_SQLAns")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPQ_SQLAns")

				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL,nConn,nSQLEXEC,'tmpPQ_SQLAns')
			RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
		
		IF USED('tmpPQ_SQLAns')
			IF VARTYPE(tmpPQ_SQLAns.FormDescription ) = "C"
				lcFormDescription = tmpPQ_SQLAns.FormDescription 
			ENDIF

			USE IN tmpPQ_SQLAns
		ENDIF
		
		SQLDISCONNECT( nConn )
	ELSE
		*Error on Connection String
		TrackError("Could not Connect to SQL","Error on Connection String","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
		lcFormDescription = 'Error'
	ENDIF

	IF NOT EMPTY(cAlias)
		IF USED(cAlias)
			SELECT (cAlias)
		ELSE
			RecordTest("Record Test Data.","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
		ENDIF
	ENDIF

ENDCASE

RETURN lcFormDescription
ENDPROC

********************************************************************** 
PROCEDURE FormNumber_FormDescription 
PARAMETERS pcFormDescription 
*cForm = FormNumber_FormDescription( "PLATE" )

PRIVATE lcFormNumber
lcFormNumber = "" &&Max Len = 2

IF VARTYPE(pcFormDescription) != "C"
	RETURN ' '
ENDIF

*use SQL table
IF NOT "PROC_SQL" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
	SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
ENDIF
IF NOT "PROC_SETUP" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
	SET PROCEDURE TO Progs\Proc_Setup ADDITIVE
ENDIF 

PRIVATE nConn
nConn = get_SQLSTRINGCONNECT()

pcFormDescription = ALLTRIM(pcFormDescription)

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPQ_SQLAns')
	USE IN tmpPQ_SQLAns
ENDIF
SELECT 0

IF nConn > 0

	cSQL = "SELECT FormNumber FROM dbo.Forms WHERE FormDescription = '"+pcFormDescription+"'"
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPQ_SQLAns' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPQ_SQLAns' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPQ_SQLAns")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPQ_SQLAns")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL,nConn,nSQLEXEC,'tmpPQ_SQLAns')
		RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
	
	IF USED('tmpPQ_SQLAns')
		IF VARTYPE(tmpPQ_SQLAns.FormNumber) = "C"
			lcFormNumber = tmpPQ_SQLAns.FormNumber
		ENDIF

		USE IN tmpPQ_SQLAns
	ENDIF
	
	IF EMPTY(lcFormNumber)
		*Try LIKE
		
		cSQL = "SELECT FormNumber FROM dbo.Forms WHERE FormDescription LIKE '%"+pcFormDescription+"%'"
	
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPQ_SQLAns' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPQ_SQLAns' )
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPQ_SQLAns")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPQ_SQLAns")

				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL,nConn,nSQLEXEC,'tmpPQ_SQLAns')
			RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ENDIF
		
		IF USED('tmpPQ_SQLAns')
			IF VARTYPE(tmpPQ_SQLAns.FormNumber) = "C"
				lcFormNumber = tmpPQ_SQLAns.FormNumber
			ENDIF

			USE IN tmpPQ_SQLAns
		ENDIF	
	ENDIF
	
	SQLDISCONNECT( nConn )
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	lcFormNumber = ' '
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF



RETURN lcFormNumber

ENDPROC
*****************************************************

PROCEDURE ItemDescription 
********************************************************************
** CHANGES HERE MUST BE REPLICATED TO:
** SQL Function:dbo.f_ItemDescription(Form,Sz1,Sz2,Sz3,Weight,RandLen) 
******************************************************************** 
 PARAMETERS cForm, nSZ1, nSZ2, nSZ3, nWeight, lRL
* ItemDescription(cForm, nSZ1, nSZ2, nSZ3, nWeight, lRL)
PRIVATE cDs

IF VARTYPE(lRL) = "N"
	lRL = IIF(lRL=0,.F.,.T.)
ENDIF
IF VARTYPE(lRL) != "L"
	lRL = .F.
ENDIF

*10,Bar,11,Flat Bar,12,Hex Bar,13,Square Bar,20,Wire Spool,21,Wire Cut,30,Coat Elect,
*40,Plate/Sheet,51,Strip,52,Coil,60,Tube,65,Pipe,66,Nipple,67,Elbow,68,Tee,69,Reducer,70,Fittings,72,Flange,75,Fastener,80,Disk


DO CASE
CASE cForm = "0" &&No Form
	cDs = ""
CASE cForm = "10" &&Bar
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + ["Dia x ]
	IF nSZ2 > 110 AND MOD(nSZ2, 12) = 0
		cDs = cDs + ALLTRIM( STR( nSZ2/12 ,9,0)) + [ FT ] 
	ELSE
		cDs = cDs + Remove0(nSZ2,9,3) + [" ] 
	ENDIF
	IF nSZ3 > 0
		IF nSZ3 > 110 AND MOD(nSZ3, 12) = 0
			cDs = cDs + [ x ] +ALLTRIM( STR( nSZ3/12 ,9,0)) + [ FT ] 
		ELSE
			cDs = cDs + [ x ]
			cDs = cDs + Remove0(nSZ3,9,3) + [" ]
		ENDIF
	EndIF
CASE cForm = "11" &&Flat Bar
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + [" Flat bar x ]
	cDs = cDs + Remove0(nSZ2,9,3) 
	IF nSZ3 > 0
		cDs = cDs + [" Wide x ]
		IF nSZ3 > 47 AND MOD(nSZ3, 12) = 0
			cDs = cDs + ALLTRIM( STR( nSZ3/12 ,9,0)) + [ FT ] 
		ELSE
			cDs = cDs + Remove0(nSZ3,9,3) + [" ]
		ENDIF
	EndIF
	cDs = cDs + [Long]
CASE cForm = "12" &&Hex Bar
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + ["HEX x ]
	IF nSZ2 > 110 AND MOD(nSZ2, 12) = 0
		cDs = cDs + ALLTRIM( STR( nSZ2/12 ,9,0)) + [ FT ] 
	ELSE
		cDs = cDs + Remove0(nSZ2,9,3) + [" ] 
	ENDIF
	IF nSZ3 > 0
		IF nSZ3 > 110 AND MOD(nSZ3, 12) = 0
			cDs = cDs + [ x ] +ALLTRIM( STR( nSZ3/12 ,9,0)) + [ FT ] 
		ELSE
			cDs = cDs + [ x ]
			cDs = cDs + Remove0(nSZ3,9,3) + [" ]
		ENDIF
	EndIF
CASE cForm = "13" &&Square Bar
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + [" x ]
	cDs = cDs + Remove0(nSZ2,9,3) 
	cDs = cDs + [" x ]
		IF nSZ3 > 110 AND MOD(nSZ3, 12) = 0
			cDs = cDs + ALLTRIM( STR( nSZ3/12 ,9,0)) + [ FT ] 
		ELSE
			cDs = cDs + Remove0(nSZ3,9,3) + [" ]
		ENDIF
CASE cForm = "20" &&Wire
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + ["Dia x ]
	cDs = cDs + Remove0(MAX(nSZ2,nWeight),9,3) 
	cDs = cDs + [# Spool ]
	
CASE cForm = "21" &&CUT WIRE
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + ["Dia x ]
	IF nSZ2 > 110 AND MOD(nSZ2, 12) = 0
		cDs = cDs + ALLTRIM( STR( nSZ2/12 ,9,0)) + [ FT ] 
	ELSE
		cDs = cDs + Remove0(nSZ2,9,3) + [" ]
	ENDIF
	cDs = cDs + [TIG WIRE ]
	
CASE cForm = "22" &&LOOSE COIL 
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + ["Dia x ]
	cDs = cDs + Remove0(MAX(nSZ2,nWeight),9,3) 
	cDs = cDs + [# Coil ]
	
CASE cForm = "23" &&WIRE REEL  
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + ["Dia x ]
	cDs = cDs + Remove0(MAX(nSZ2,nWeight),9,3) 
	cDs = cDs + [# Reel ]	
	
	
CASE cForm = "30" &&Coated Electrodes
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + ["Dia x ]
	cDs = cDs + Remove0(nSZ2,9,3) 
	cDs = cDs + [" Coated Electrodes ]
	IF nSZ3 > 0
		cDs = cDs + Remove0(nSZ3,9,3) 
		cDs = cDs + [# Can]
	ENDIF
CASE cForm = "40" &&Plate Sheet
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + [" Thick x ]
	cDs = cDs + Remove0(nSZ2,9,3) 
	IF nSZ3 > 0
		cDs = cDs + [" x ]
		cDs = cDs + Remove0(nSZ3,9,3) 
*		IF nSZ3 > 110 AND MOD(nSZ3, 12) = 0
*			cDs = cDs + ALLTRIM( STR( nSZ3/12 ,9,0)) + [ FT ] 
*		ELSE
*			cDs = cDs + Remove0(nSZ3,9,3) + [" ]
*		ENDIF
	EndIF
	cDs = cDs + [" ]
CASE cForm = "51" &&Strip
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + ["Thick x ]
	cDs = cDs + Remove0(nSZ2,9,3) 
	cDs = cDs + [" x ]
	cDs = cDs + Remove0(MAX(nSZ3,nWeight),9,3) 
	cDs = cDs + [ Pounds Strip ]
	
CASE cForm = "52" &&Coil
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + ["Thick x ]
	cDs = cDs + Remove0(nSZ2,9,3) 
	cDs = cDs + [" Wide ]
	cDs = cDs + Remove0(MAX(nSZ3,nWeight),9,3) 
	cDs = cDs + [ Pounds Coil ]	
	
CASE cForm = "60" && Tube
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + ["OD x ]
	cDs = cDs + Remove0(nSZ2,9,3) 
	cDs = cDs + ["Wall x ]
		IF nSZ3 > 110 AND MOD(nSZ3, 12) = 0
			cDs = cDs + ALLTRIM( STR( nSZ3/12 ,9,0)) + [ FT ] 
		ELSE
			cDs = cDs + Remove0(nSZ3,9,3) + [" ]
		ENDIF
CASE cForm = "65" && Pipe
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + [" SCH ]
	cDs = cDs + Remove0(nSZ2,9,3) 

	cDs = cDs + [ x ]
	cDs = cDs + Remove0(nSZ3,9,3) + [" ]

CASE cForm = "66" && Nipple
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + [" SCH ]
	cDs = cDs + Remove0(nSZ2,9,3) 

	IF nSZ3 > 0
		cDs = cDs + [ x ] + Remove0(nSZ3,9,3) + ["]
	ENDIF
	cDs = cDs + [ Nipple]
CASE cForm = "67" &&Elbow
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + [" SCH ]
	cDs = cDs + Remove0(nSZ2,9,3) 
	IF nSZ3>0
		cDs = cDs + [ x ]+ ALLTRIM(STR(nSZ3,9,0)) + [ Deg]
	ENDIF
	cDs = cDs + [ Elbow ]
CASE cForm = "68" &&Tee
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + [" SCH ]
	cDs = cDs + Remove0(nSZ2,9,3) 

	cDs = cDs + [ Tee]
CASE cForm = "69" && Reducer
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + [" SCH ]
	cDs = cDs + Remove0(nSZ2,9,3) 

	cDs = cDs + [ X ]
	cDs = cDs + Remove0(nSZ3,9,3) 
	cDs = cDs + [" Reducer]
*60 Pipe, 65 Tube, 66 Nipple, 67 Elbow, 68 Tee, 69 Reducer, 70 Fittings, 72 Flange, 75 Fasteners, 80 Disk 	
CASE cForm = "70" &&Fittings -Not just SCH, can be # rated!
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + [" ]
	IF nSZ2 = 0
		cDs = cDs + " " &&Remove0(nSz2,9,3) 
	ELSE
		IF nSZ2 = 5 OR nSZ2 = 10 OR nSZ2 = 40 OR nSZ2 = 80 OR nSZ2 = 160
			cDs = cDs + [SCH ]
		ENDIF
		cDs = cDs + Remove0(nSZ2,9,3) 
	ENDIF
	IF nSZ3 > 0
		cDs = cDs + [ x ]
		cDs = cDs + Remove0(nSZ3,9,3) 
	ENDIF
	cDs = cDs + [ Fitting]
CASE cForm = "71" &&Coupling
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + [" IPS ]
	IF nSZ2 > 0
		cDs = cDs + Remove0(nSZ2,9,3) 
		cDs = cDs + [# Pounds]
	ENDIF
	IF nSZ3 > 0
		cDs = cDs + [ x ]
		cDs = cDs + Remove0(nSZ3,9,3) 
		cDs = cDs + [" Long]
	ENDIF
	cDs = cDs + [ Coupling]
CASE cForm = "72" &&Flange
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + [" SCH ]
	cDs = cDs + Remove0(nSZ2,9,3) 
	IF nSZ3 > 0
		cDs = cDs + [ x ]
		cDs = cDs + Remove0(nSZ3,9,3) 
		cDs = cDs + [# Pounds]
	ENDIF
	cDs = cDs + [ Flange]
CASE cForm = "75" &&Fasteners
	cDs = Remove0(nSZ1,10,4) 	

	IF nSZ2 > 0
		cDs = cDs + [ - ]
		cDs = cDs + Remove0(nSZ2,9,3) 
	ENDIF
	IF nSZ3 > 0
		cDs = cDs + [ x ]
		cDs = cDs + Remove0(nSZ3,9,3) 
		cDs = cDs + [" long]
	ENDIF
	cDs = cDs + [ Fastener]
CASE cForm = "80" &&Disk
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + [" Thick x ]
	cDs = cDs + Remove0(nSZ2,9,3) 
	cDs = cDs + ["OD ]
	IF nSZ3 > 0
		cDs = cDs + [x ]
		cDs = cDs + Remove0(nSZ3,9,3) 
		cDs = cDs + ["ID Disk]
	ENDIF
CASE cForm = "90" &&Machined
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + [" x ]
	cDs = cDs + Remove0(nSZ2,9,3) 
	cDs = cDs + [" x ]
	cDs = cDs + Remove0(nSZ3,9,3) 
	cDs = cDs + ["]

CASE cForm = "95" &&Forged
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + [" x ]
	cDs = cDs + Remove0(nSZ2,9,3) 
	cDs = cDs + [" x ]
	cDs = cDs + Remove0(nSZ3,9,3) 
	cDs = cDs + ["]
CASE cForm = "99" &&Ingot
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + [" x ]
	cDs = cDs + Remove0(nSZ2,9,3) 
	cDs = cDs + [" x ]
	cDs = cDs + Remove0(nSZ3,9,3) 
	cDs = cDs + ["]	

OTHERWISE &&
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + [" x ]
	cDs = cDs + Remove0(nSZ2,9,3) 
	cDs = cDs + [" x ]
	cDs = cDs + Remove0(nSZ3,9,3) 
	cDs = cDs + ["]
ENDCASE

IF lRL
	cDs = cDs + " R/L"
ENDIF

cReturnD = cDs
RETURN cReturnD 
ENDPROC

********************************************
PROCEDURE ItemDescriptionMetric 
 PARAMETERS cForm, nSZ1, nSZ2, nSZ3, nWeight, lRL, lMetric, nSz1orig, nSz2orig, nSz3orig
* ItemDescription(cForm, nSZ1, nSZ2, nSZ3, nWeight, lRL, lMetric, nSz1orig, nSz2orig, nSz3orig)
* Can Handle Metric,  You do not have to send in Metric sizes.
*Not Descript
PRIVATE cDs

*10,Bar,11,Flat Bar,12,Hex Bar,13,Square Bar,20,Wire Spool,21,Wire Cut,30,Coat Elect,
*40,Plate/Sheet,51,Strip,52,Coil,60,Tube,65,Pipe,66,Nipple,67,Elbow,68,Tee,69,Reducer,70,Fittings,72,Flange,75,Fastener,80,Disk
PRIVATE cAlias 
cAlias = ALIAS()

IF VARTYPE(lRL) = "N"
	lRL= IIF(lRL=0,.F.,.T.)
ENDIF
IF VARTYPE(lRL) != "L"
	lRL= .F.
ENDIF

IF VARTYPE(lMetric) = "N"
	lMetric = IIF(lMetric=0,.F.,.T.)
ENDIF
IF VARTYPE(lMetric) != "L"
	lMetric = .F.
ENDIF
IF TYPE("nSz1orig") <> "C"
	nSz1orig = ""
ENDIF
IF TYPE("nSz2orig") <> "C"
	nSz2orig = ""
ENDIF
IF TYPE("nSz3orig") <> "C"
	nSz3orig = ""
ENDIF

DO CASE
CASE cForm = "10" &&Bar
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + ["Dia x ]
	IF nSZ2 > 110 AND MOD(nSZ2, 12) = 0
		cDs = cDs + ALLTRIM( STR( nSZ2/12 ,9,0)) + [ FT ] 
	ELSE
		cDs = cDs + Remove0(nSZ2,9,3) + [" ] 
	ENDIF
	IF nSZ3 > 0
		IF nSZ3 > 110 AND MOD(nSZ3, 12) = 0
			cDs = cDs + [ x ] +ALLTRIM( STR( nSZ3/12 ,9,0)) + [ FT ] 
		ELSE
			cDs = cDs + [ x ]
			cDs = cDs + Remove0(nSZ3,9,3) + [" ]
		ENDIF
	EndIF
CASE cForm = "11" &&Flat Bar
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + [" Flat bar x ]
	cDs = cDs + Remove0(nSZ2,9,3) 
	IF nSZ3 > 0
		cDs = cDs + [" Wide x ]
		IF nSZ3 > 47 AND MOD(nSZ3, 12) = 0
			cDs = cDs + ALLTRIM( STR( nSZ3/12 ,9,0)) + [ FT ] 
		ELSE
			cDs = cDs + Remove0(nSZ3,9,3) + [" ]
		ENDIF
	EndIF
	cDs = cDs + [Long]
CASE cForm = "12" &&Hex Bar
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + ["HEX x ]
	IF nSZ2 > 110 AND MOD(nSZ2, 12) = 0
		cDs = cDs + ALLTRIM( STR( nSZ2/12 ,9,0)) + [ FT ] 
	ELSE
		cDs = cDs + Remove0(nSZ2,9,3) + [" ] 
	ENDIF
	IF nSZ3 > 0
		IF nSZ3 > 110 AND MOD(nSZ3, 12) = 0
			cDs = cDs + [ x ] +ALLTRIM( STR( nSZ3/12 ,9,0)) + [ FT ] 
		ELSE
			cDs = cDs + [ x ]
			cDs = cDs + Remove0(nSZ3,9,3) + [" ]
		ENDIF
	EndIF
CASE cForm = "13" &&Square Bar
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + [" x ]
	cDs = cDs + Remove0(nSZ2,9,3) 
	cDs = cDs + [" x ]
		IF nSZ3 > 110 AND MOD(nSZ3, 12) = 0
			cDs = cDs + ALLTRIM( STR( nSZ3/12 ,9,0)) + [ FT ] 
		ELSE
			cDs = cDs + Remove0(nSZ3,9,3) + [" ]
		ENDIF
CASE cForm = "20" &&Wire
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + ["Dia x ]
	cDs = cDs + Remove0(nSZ2,9,3) 
	cDs = cDs + [# Spool ]
	
CASE cForm = "21" &&CUT WIRE
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + ["Dia x ]
		IF nSZ2 > 110 AND MOD(nSZ2, 12) = 0
			cDs = cDs + ALLTRIM( STR( nSZ2/12 ,9,0)) + [ FT ] 
		ELSE
			cDs = cDs + Remove0(nSZ2,9,3) + [" ]
		ENDIF
		cDs = cDs + [TIG WIRE ]
	*cDs = cDs + [" ]
	
CASE cForm = "22" &&LOOSE COIL 
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + ["Dia x ]
	cDs = cDs + Remove0(nSZ2,9,3) 
	cDs = cDs + [# Coil ]
	
CASE cForm = "23" &&WIRE REEL  
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + ["Dia x ]
	cDs = cDs + Remove0(nSZ2,9,3) 
	cDs = cDs + [# Reel ]	
	
	
CASE cForm = "30" &&Coated Electrodes
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + ["Dia x ]
	cDs = cDs + Remove0(nSZ2,9,3) 
	cDs = cDs + [" Coated Electrodes ]
	IF nSZ3 > 0
		cDs = cDs + Remove0(nSZ3,9,3) 
		cDs = cDs + [# Can]
	ENDIF
CASE cForm = "40" &&Plate Sheet
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + [" Thick x ]
	cDs = cDs + Remove0(nSZ2,9,3) 
	IF nSZ3 > 0
		cDs = cDs + [" x ]
		cDs = cDs + Remove0(nSZ3,9,3) 
*		IF nSZ3 > 110 AND MOD(nSZ3, 12) = 0
*			cDs = cDs + ALLTRIM( STR( nSZ3/12 ,9,0)) + [ FT ] 
*		ELSE
*			cDs = cDs + Remove0(nSZ3,9,3) + [" ]
*		ENDIF
	EndIF
	cDs = cDs + [" ]
CASE cForm = "51" &&Strip
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + ["Thick x ]
	cDs = cDs + Remove0(nSZ2,9,3) 
	cDs = cDs + [" x ]
	cDs = cDs + Remove0(nSZ3,9,3) 
	cDs = cDs + [ Pounds Strip ]
	
CASE cForm = "52" &&Coil
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + ["Thick x ]
	cDs = cDs + Remove0(nSZ2,9,3) 
	cDs = cDs + [" Wide ]
	IF nWeight = 0
		nWeight = nSZ3
	ENDIF
	cDs = cDs + Remove0(nWeight,9,3) 
	cDs = cDs + [ Pounds Coil ]	
	
CASE cForm = "60" && Tube
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + ["OD x ]
	cDs = cDs + Remove0(nSZ2,9,3) 
	cDs = cDs + ["Wall x ]
		IF nSZ3 > 110 AND MOD(nSZ3, 12) = 0
			cDs = cDs + ALLTRIM( STR( nSZ3/12 ,9,0)) + [ FT ] 
		ELSE
			cDs = cDs + Remove0(nSZ3,9,3) + [" ]
		ENDIF
CASE cForm = "65" && Pipe
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + [" SCH ]
	IF nSZ2 = 0
		cDs = cDs + ALLTRIM(nSz2orig) 
	ELSE
		cDs = cDs + Remove0(nSZ2,9,3) 
	ENDIF
	cDs = cDs + [ x ]
		IF nSZ3 > 110 AND MOD(nSZ3, 12) = 0
			cDs = cDs + ALLTRIM( STR( nSZ3/12 ,9,0)) + [ FT ] 
		ELSE
			cDs = cDs + Remove0(nSZ3,9,3) + [" ]
		ENDIF
CASE cForm = "66" && Nipple
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + [" SCH ]
	IF nSZ2 = 0
		cDs = cDs + ALLTRIM(nSz2orig) 
	ELSE
		cDs = cDs + Remove0(nSZ2,9,3) 
	ENDIF
	IF nSZ3 > 0
		cDs = cDs + [ x ] + Remove0(nSZ3,9,3) + ["]
	ENDIF
	cDs = cDs + [ Nipple]
CASE cForm = "67" &&Elbow
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + [" SCH ]
	IF nSZ2 = 0
		cDs = cDs + ALLTRIM(nSz2orig) 
	ELSE
		cDs = cDs + Remove0(nSZ2,9,3) 
	ENDIF
	IF nSZ3>0
		cDs = cDs + [ x ]+ ALLTRIM(STR(nSZ3,9,0)) + [ Deg]
	ENDIF
	cDs = cDs + [ Elbow ]
CASE cForm = "68" &&Tee
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + [" SCH ]
	IF nSZ2 = 0
		cDs = cDs + ALLTRIM(nSz2orig) 
	ELSE
		cDs = cDs + Remove0(nSZ2,9,3) 
	ENDIF
	cDs = cDs + [ Tee]
CASE cForm = "69" && Reducer  8" SCH 40 X 4" Reducer
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + [" SCH ]
	IF nSZ2 = 0
		cDs = cDs + ALLTRIM(nSz2orig) 
	ELSE
		cDs = cDs + Remove0(nSZ2,9,3) 
	ENDIF
	cDs = cDs + [ X ]
	cDs = cDs + Remove0(nSZ3,9,3) 
	cDs = cDs + [" Reducer]
*60 Pipe, 65 Tube, 66 Nipple, 67 Elbow, 68 Tee, 69 Reducer, 70 Fittings, 72 Flange, 75 Fasteners, 80 Disk 	
CASE cForm = "70" &&Fittings -Not just SCH, can be # rated!
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + [" ]
	IF nSZ2 = 0
		cDs = cDs + ALLTRIM(nSz2orig) 
	ELSE
		IF nSZ2 = 5 OR nSZ2 = 10 OR nSZ2 = 40 OR nSZ2 = 80 OR nSZ2 = 160
			cDs = cDs + [SCH ]
		ENDIF
		cDs = cDs + Remove0(nSZ2,9,3) 
	ENDIF
	IF nSZ3 > 0
		cDs = cDs + [ x ]
		cDs = cDs + Remove0(nSZ3,9,3) 
	ENDIF
	cDs = cDs + [ Fitting]
CASE cForm = "71" &&Coupling
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + [" IPS ]
	IF nSZ2 > 0
		cDs = cDs + Remove0(nSZ2,9,3) 
		cDs = cDs + [# Pounds]
	ENDIF
	IF nSZ3 > 0
		cDs = cDs + [ x ]
		cDs = cDs + Remove0(nSZ3,9,3) 
		cDs = cDs + [" Long]
	ENDIF
	cDs = cDs + [ Coupling]
CASE cForm = "72" &&Flange
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + [" SCH ]
	IF nSZ2 = 0
		cDs = cDs + ALLTRIM(nSz2orig) 
	ELSE
		cDs = cDs + Remove0(nSZ2,9,3) 
	ENDIF
	IF nSZ3 > 0
		cDs = cDs + [ x ]
		cDs = cDs + Remove0(nSZ3,9,3) 
		cDs = cDs + [# Pounds]
	ENDIF
	cDs = cDs + [ Flange]
CASE cForm = "75" &&Fasteners
	IF lMetric
		cDs = "M" + Remove0(nSZ1,10,4) 
	ELSE
		cDs = Remove0(nSZ1,10,4) 	
	ENDIF
	IF nSZ2 > 0
		cDs = cDs + [ - ]
		cDs = cDs + Remove0(nSZ2,9,3) 
	ENDIF
	IF nSZ3 > 0
		cDs = cDs + [ x ]
		cDs = cDs + Remove0(nSZ3,9,3) 
		IF lMetric
			*Fasteners are the only form that stores metric data instead of the Inch equal
			cDs = cDs + [mm long]
		ELSE
			cDs = cDs + [" long]
		ENDIF
	ENDIF
	cDs = cDs + [ Fastener]
CASE cForm = "80" &&Disk
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + [" Thick x ]
	cDs = cDs + Remove0(nSZ2,9,3) 
	cDs = cDs + ["OD ]
	IF nSZ3 > 0
		cDs = cDs + [x ]
		cDs = cDs + Remove0(nSZ3,9,3) 
		cDs = cDs + ["ID Disk]
	ENDIF
CASE cForm = "90" &&Machined
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + [" x ]
	cDs = cDs + Remove0(nSZ2,9,3) 
	cDs = cDs + [" x ]
	cDs = cDs + Remove0(nSZ3,9,3) 
	cDs = cDs + ["]

CASE cForm = "95" &&Forged
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + [" x ]
	cDs = cDs + Remove0(nSZ2,9,3) 
	cDs = cDs + [" x ]
	cDs = cDs + Remove0(nSZ3,9,3) 
	cDs = cDs + ["]
CASE cForm = "99" &&Ingot
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + [" x ]
	cDs = cDs + Remove0(nSZ2,9,3) 
	cDs = cDs + [" x ]
	cDs = cDs + Remove0(nSZ3,9,3) 
	cDs = cDs + ["]	

OTHERWISE &&
	cDs = Remove0(nSZ1,10,4) 
	cDs = cDs + [" x ]
	IF nSZ2 = 0
		cDs = cDs + ALLTRIM(nSz2orig) 
	ELSE
		cDs = cDs + Remove0(nSZ2,9,3) 
	ENDIF
	cDs = cDs + [" x ]
	IF nSZ3 = 0
		cDs = cDs + ALLTRIM(nSz3orig) 
	ELSE
		cDs = cDs + Remove0(nSZ3,9,3) 
	ENDIF
	cDs = cDs + ["]
ENDCASE

IF lRL
	cDs = cDs + " R/L"
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cDs
ENDPROC

********************************************************************
** CHANGES HERE MUST BE REPLICATED TO:
** Proc_Quotes.Prg:Descript() 
** SQL Function:dbo.f_DescriptCL(Alloy,CC,CL,Form,CC,Sz1,Sz2,Sz3,Weight,RandLen) 
******************************************************************** 

PROCEDURE Descript 
PARAMETERS cAlloy, cForm, cCC, cCL, nSZ1, nSZ2, nSZ3, nWeight, lRL, lMetric, nSz1orig, nSz2orig, nSz3orig
* ? Descript(cAlloy, cForm, cCC, nSZ1, nSZ2, nSZ3, nWeight, lRL, lMetric, nSz1orig, nSz2orig, nSz3orig)
* ? Descript('', '', cCC )   Use to print CC!
* Only reports about Alloy, Form, CC  --if nSz2 = 2

PRIVATE cDescript
cDescript = ''

IF VARTYPE(cAlloy) != "C"
	cAlloy = ''
ENDIF
IF VARTYPE(cForm) != "C"
	cForm= ''
ENDIF

IF NOT ( EMPTY(cAlloy) )
	*Alloy
	cDescript = ALLTRIM(cAlloy)+" "
ENDIF

IF VARTYPE(cCC) != "C"
	cCC = ''
ENDIF
IF VARTYPE(cCL) != "C"
	cCL = ''
ENDIF

IF NOT EMPTY(cCC)
	*CC
	DO CASE
	CASE cCC = "1"
		cDescript = cDescript 
	CASE cCC = "2"
		cDescript = cDescript + "(High Strength) "
	CASE cCC = "3"
		cDescript = cDescript + "(Aged) "
	CASE cCC = "4"
		cDescript = cDescript + "(Special) "
	CASE cCC = "R"
		cDescript = cDescript + "(ESR) "
	OTHERWISE
*		SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
***** Too Much Info, Will keep CC simple! *****
*		cDescript = cDescript + "(" + ALLTRIM(ConditionCodeText(cCC)) + ")  "

		cDescript = cDescript + "(High Strength) "
	ENDCASE
ENDIF


IF VARTYPE(nSZ1) != "N" AND VARTYPE(nSZ1) != "Y"
	nSZ1 = 0
ENDIF

IF NOT EMPTY(cForm)
	*Form
	cDescript = cDescript + ALLTRIM( FormDescription(cForm,nSz1) )+ " "
ENDIF

IF VARTYPE(nSZ2) != "N" AND VARTYPE(nSZ2) != "Y"
	nSZ2 = 0
ENDIF

IF nSZ1 = 0
	*cDescript = cDescript
ELSE
	cDescript = cDescript + ItemDescriptionMetric(cForm, nSZ1, nSZ2, nSZ3, nWeight, lRL, lMetric, nSz1orig, nSz2orig, nSz3orig)
	*cDescript = cDescript + ItemDescriptionMetric(cForm, nSZ1, nSZ2, nSZ3, nWeight, lRL, lMetric, nSz1orig, nSz2orig, nSz3orig)
ENDIF

RETURN cDescript
ENDPROC

***************************************************** 

PROCEDURE SalesTotal 
PARAMETERS pP_lb,pP_pc,pP_ft,pOtherFld,pOtherP,pLotP,pCuts, pQ_P, pQ_QTY, pQ_PU
*PARAMETERS pP_lb,pP_pc,pP_ft,pOtherFld,pOtherP,pLotP,pCuts
*Return Pricing String. SalesTotal(P_lb,P_Pc,P_Ft,OtherFld,OtherP,LotP,Cuts,Q_P,Q_QTY,Q_PU)

PRIVATE nP_Lb,nP_Pc,nP_Ft,cOtherFld,nOtherP,nLotP,nCuts, nQ_P, nQ_QTY, nQ_PU
nP_Lb	= PrepareSQLnum(pP_Lb,'P_Lb',18,4)
nP_Pc	= PrepareSQLnum(pP_Pc,'P_Pc',18,4)
nP_Ft	= PrepareSQLnum(pP_Ft,'P_Ft',18,4)
cOtherFld=PrepareSQLtxt(pOtherFld,'OtherFld',10)
nOtherP	= PrepareSQLnum(pOtherP,'OtherP',18,4)
nLotP	= PrepareSQLnum(pLotP,'P_lb',18,4)
nCuts	= PrepareSQLnum(pCuts,'Cuts',18,4)
nQ_P	= PrepareSQLnum(pQ_P,'S_P',18,4)
nQ_QTY	= PrepareSQLnum(pQ_QTY,'S_QTY',18,4)
nQ_PU	= PrepareSQLnum(pQ_PU,'PU',-1)
****
PRIVATE nQ_Total
nQ_Total = 0

PRIVATE lcSalesTotal
lcSalesTotal = ""

IF nQ_P > 0 AND nQ_PU > 0
	lcSalesTotal = "$" + ALLTRIM(STR(nQ_P,18,2))	&&+"/Lb "
	lcSalesTotal = lcSalesTotal +"  "+ Get_cPUfrom_nPU(nQ_PU)+" "	&& $/Lb
ELSE
	*Old style, before Q_ Acct Stnd
	IF nP_lb > 0
		lcSalesTotal = lcSalesTotal + "$" + ALLTRIM(STR(nP_lb,8,2))+"/Lb "
	ENDIF
	IF nP_pc > 0 
		lcSalesTotal = lcSalesTotal + "$" + ALLTRIM(STR(nP_pc,8,2))+"/PC "
	ENDIF
	IF nP_ft > 0
		lcSalesTotal = lcSalesTotal + "$" + ALLTRIM(STR(nP_ft,8,2))+"/FT "
	ENDIF
	IF nLotP > 0
		lcSalesTotal = lcSalesTotal + "Lot $"+ALLTRIM(STR(nLotP,9,2))+" "
	ENDIF
ENDIF

*********

IF !EMPTY(cOtherFLD)
	lcSalesTotal = lcSalesTotal + ALLTRIM(cOtherFLD)+ " $"+ALLTRIM(STR(nOtherP,8,2))+" "
ENDIF

IF !EMPTY(nCuts)
	lcSalesTotal = lcSalesTotal +"+ Cuts $"+ALLTRIM(STR(nCuts,6,0))+" "
ENDIF
	
RETURN lcSalesTotal
ENDPROC


****************************

PROCEDURE SOiTotal
PARAMETERS pQ_PU, pQ_P, pQ_QTY, pOtherFld, pOtherP, pCuts
*cTotal = SOiTotal(Q_PU, Q_P, Q_QTY, OtherFld, OtherP, Cuts)
*Return Pricing String.

PRIVATE nQ_PU, nQ_P, nQ_QTY
nQ_PU	= PrepareSQLnum(pQ_PU,'PU',-1)
nQ_P	= PrepareSQLnum(pQ_P,'Q_P',-5)
nQ_QTY	= PrepareSQLnum(pQ_QTY,'Q_QTY',-5)

PRIVATE cOtherFld, nOtherP, nCuts
cOtherFld = PrepareSQLtxt(pOtherFld,'OtherFld',10)
nOtherP	= PrepareSQLnum(pOtherP,'OtherP',-5)
nCuts	= PrepareSQLnum(pCuts,'Cuts',-5)

PRIVATE nConn, lNewConn
nConn = get_SQLSTRINGCONNECT()
lNewConn = .T.
nConn = CheckSQLConnection(nConn)

****
PRIVATE nS_Total
nS_Total = 0

PRIVATE lcSalesTotal
lcSalesTotal = ""

IF nQ_PU > 0
	cUnit = get_Unit_PU( nQ_PU, nConn )
	cUnit = RIGHT(cUnit,3)
	
	lcSalesTotal = lcSalesTotal + "$" + ALLTRIM(STR(nQ_P,8,2))+" "+cUnit
ENDIF

IF !EMPTY(cOtherFLD)
	lcSalesTotal = lcSalesTotal +" "+ ALLTRIM(cOtherFLD)+ " $"+ALLTRIM(STR(nOtherP,8,2))+" "
ENDIF

IF !EMPTY(nCuts)
	lcSalesTotal = lcSalesTotal +"+ Cuts $"+ALLTRIM(STR(nCuts,6,0))+" "
ENDIF
	
	
IF lNewConn
	SQLDISCONNECT(nConn)
ENDIF	
	
RETURN lcSalesTotal
ENDPROC

***************************************************** 
PROCEDURE Program_from_ShipWhere
PARAMETERS pShipWhere
*Returns Program String.

PRIVATE nShipWhere
nShipWhere = 0
IF VARTYPE(pShipWhere) = "N"
	nShipWhere = pShipWhere
ENDIF

PRIVATE cProgram
cProgram = ""

DO CASE
CASE nShipWhere = 1
	cProgram = "ERP_Loc1"
CASE nShipWhere = 2
	cProgram = "DIRECT"
CASE nShipWhere = 3
	cProgram = "Blind"
CASE nShipWhere = 4
	cProgram = "Service"
CASE nShipWhere = 5
	cProgram = "ERP_Loc2"
CASE nShipWhere = 6
	cProgram = "RemoteStock"
ENDCASE 


RETURN cProgram
ENDPROC


***************************************************** 
PROCEDURE AllQuotes_ID_From_SOitem
PARAMETERS pSOitem

PRIVATE cSOitem
cSOitem = Proper_SO_item(pSOitem)
IF cSOitem = Proper_SO_item('')
	RETURN 0
ENDIF

PRIVATE nConn
nConn = get_SQLSTRINGCONNECT()

PRIVATE nID
nID = 0

PRIVATE cSQL, nSQLEXEC
cSQL = "SELECT ID FROM dbo.AllQuotes "
cSQL = cSQL + " WHERE SOitem = '"+cSOitem+"'"

nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPQ_SQLAns")
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPQ_SQLAns")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPQ_SQLAns")

		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	SQLEXECError(cSQL, nConn, nSQLEXEC, '')
	RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
ENDIF

IF USED('tmpPQ_SQLAns')
	IF RECCOUNT('tmpPQ_SQLAns') > 0
		nID = tmpPQ_SQLAns.ID
	ENDIF
ENDIF

SQLDISCONNECT(nConn)

RETURN nID
ENDPROC

************************************************************************
PROCEDURE Remove0 
PARAMETER pnNumberWithZero,pnNumberLength,pnNumberDecimals,plForcePennies,plAddCommas
** Also Edit the Remove0.prg !!!!!!!!!!!!!!!!!!
*Hadles NULL, Returns TRIMed Character
*, pnNumberWithZero,pnNumberLength,pnNumberDecimals
***remove0(nNumber_With_Zero,nLength,nDecimals,.F.)

PRIVATE cNumbasChar,nLastDigits 

IF NOT (VARTYPE(pnNumberWithZero) = "N" OR VARTYPE(pnNumberWithZero) = "Y")
	pnNumberWithZero = 0
ENDIF
IF VARTYPE(pnNumberLength) = 'L'
	*Did not pass in pnNumberLength
	WAIT WINDOW 'Decimals may have been dropped'
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
EndProc

**************************************************
PROCEDURE NeedPageTest
PARAMETER cInputString, nMaxCharOnLine, nMaxLines
*NeedPageTest(cInputString, nMaxCharOnLine, nMaxLines)

********************************************************************
** CHANGES HERE MUST BE REPLICATED TO:
** Progs\NeedPageTest.prg
********************************************************************
*nMaxCharOnLine = 60 &&was 51
*nMaxLines = 5 &&was 4
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
		*lNewPage = .T.
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
ENDPROC

********************************************************************

PROCEDURE All_PONum
PARAMETERS pSalesOrder

********************************************************************
** CHANGES HERE MUST BE REPLICATED TO:
** Proc_Quotes.Prg:All_PONum() 
********************************************************************
PRIVATE POs,i, CurrPO, PrevPO, nLCD, nCurrec 
PrevPO = ""
POs = ""
nCurrec = 0
PRIVATE cAlias 
cAlias = ALIAS()

IF USED("SalesQuote")
	nCurrec = RECNO("SalesQuote")
	
	SELECT 0
	SELECT DISTINCT PO_Num FROM SalesQuote WHERE SalesNum_a = pSalesOrder INTO CURSOR tmpAllPO
*	SELECT DISTINCT PO_Num FROM SalesQuote WHERE SalesNum_a = pSalesOrder ORDER BY SalesQuote.item INTO CURSOR tmpAllPO
*	SELECT DISTINCT PO_Num FROM tmpAllPO INTO ARRAY aPOs
*	SELECT DISTINCT PO_NUM FROM SalesQuote WHERE SalesNum_a = pSalesOrder INTO ARRAY aPOs
	DIMENSION aPOs(1)
	PRIVATE naPOsLen 
	
	IF USED('tmpAllPo')
		*Build Array
		SELECT tmpAllPo
		
		naPOsLen = RECCOUNT('tmpAllPo')
		IF naPOsLen > 0
			DIMENSION aPOs(naPOsLen)
			
			SCAN
				aPOs(RECNO('tmpAllPo')) = PO_Num 
			ENDSCAN
		ENDIF		
		USE IN tmpAllPO
	ENDIF
	
	IF NOT EMPTY(cAlias)
		IF USED(cAlias)
			SELECT (cAlias)
		ELSE
			RecordTest("Record Test Data.","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
		ENDIF
	ENDIF

	IF TYPE('aPOs') = "C"
		numPO = ALEN(aPOs)
		
		PRIVATE lFoundUnCommon, nDupDig
		lFoundUnCommon = .F.
		nDupDig = 0
*!*			*Find Least Common Denominator,  Skips the redundant characters 
*!*			IF LEN(ALLTRIM( aPOs(1) )) > 5 AND numPO > 1
*!*				nDupDig = 5
*!*				FOR nDupDig = 5 TO LEN(aPOs(1))
*!*				
*!*					FOR i = 1 TO numPO - 1
*!*						IF LEFT( aPOs(i), nDupDig ) = LEFT(aPOs(i+1), nDupDig )
*!*							LOOP
*!*						ELSE
*!*							lFoundUnCommon = .T.
*!*							nDupDig = nDupDig - 1
*!*							EXIT
*!*						ENDIF
*!*					ENDFOR
*!*					
*!*					IF lFoundUnCommon
*!*						EXIT
*!*					ELSE
*!*						LOOP
*!*					ENDIF
*!*				ENDFOR
*!*				
*!*				
*!*			ENDIF
		IF nDupDig < 5
			nDupDig = 0
		ENDIF 
		
		FOR i = 1 TO numPO
			CurrPO = ALLTRIM(aPOs(i))
			*Remove duplicate starts with PO over 5 in length
			IF EMPTY(POs)
				POs = ALLTRIM(CurrPO)
			ELSE
				IF PrevPO != CurrPO 
					POs = POs + ", " + ALLTRIM(CurrPO)
					*IF RIGHT( CurrPO , LEN(CurrPO) - nDupDig ) != ''
					*	POs = POs + ", " + RIGHT( CurrPO , LEN(CurrPO) - nDupDig )
					*ENDIF
				ENDIF
			ENDIF
			PrevPO = ALLTRIM(aPOs(i))
		ENDFOR
	ELSE
		POs = " "
	ENDIF
ELSE
	POs = " "
ENDIF

RETURN POs
ENDPROC

****************************************
PROCEDURE TrackMess 
PARAMETER pTXT
*TrackMess(cTxt)
**Also Edit Proc_Quotes.prg
**Also Edit Proc_SQL.prg
**Also Edit Proc_ERP.prg

IF TYPE('pTXT') != "C"
	pTXT = "No Parameter"
ENDIF
IF NOT "PROC_SQL" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
	SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
ENDIF
IF NOT "PROC_SETUP" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
	SET PROCEDURE TO Progs\Proc_Setup ADDITIVE
ENDIF 

PRIVATE nConn
nConn = get_SQLSTRINGCONNECT()

PRIVATE Pmess1q, Pcprogram
*pTXT = STRTRAN(pTXT ,['],["],1)
pTXT		= ShowSQLtxt(pTXT,'TrackMess',-1)
Pmess1q = PrepareSQLtxt(LEFT(pTXT,1024),'pTXT',1024,.F.,.T.)
Pcprogram = "HPA:Proc_Quotes:TrackMess"
PRIVATE cSQL, nSQLEXEC
*Do not INSERT into dbo.UserTrack Direct, let trigger add ServerName!
cSQL = "INSERT INTO dbo.NR_UserTrack (mess1,cprogram,errordate,MACHINE)"
cSQL = cSQL + " VALUES ('"+Pmess1q+"','"+Pcprogram+"','"+TTOC( DATETIME())+"','"+SYS(0)+"')"

nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPQ_SQLAns" )
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPQ_SQLAns")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPQ_SQLAns")

		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	SQLEXECError(cSQL, nConn, nSQLEXEC, '')
	RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
ENDIF

IF USED('tmpPQ_SQLAns')
	USE IN tmpPQ_SQLAns
ENDIF

SQLDISCONNECT( nConn)

ENDPROC
*********************************

PROCEDURE SalesOrderPfromSO
PARAMETERS pnSO

PRIVATE lcSalesRepCnt,lcSalesRep
lcSalesRepCnt = Whos_Sales_Order(pnSO)
*Returns 10 digit SO and 1 Char SalesP
lcSalesRep = RIGHT( lcSalesRepCnt,1)

PRIVATE lcSalesPDesc
lcSalesPDesc = SalesPDescription(lcSalesRep,'') 

RETURN lcSalesPDesc
ENDPROC

*********************************	

PROCEDURE Insert_BlankAllQuotes 
PARAMETERS nInqNum,cInqNumP,cSalesP,pConn
*Insert_BlankAllQuotes(nInqNum,cInqNumP,cSalesP,pConn)

IF VARTYPE(nInqNum) != "N"
	TrackError("Bad Prarameter","No InqNum","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN .F.
ENDIF
IF VARTYPE(cInqNumP) != "C"
	TrackError("Bad Prarameter","No InqNumP","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN .F.
ENDIF
IF VARTYPE(cSalesP) != "C"
	TrackError("Bad Prarameter","No SalesP","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN .F.
ENDIF
PRIVATE lReturn
lReturn = .F.

PRIVATE lNewConn, nConn
lNewConn  =.F.
IF VARTYPE(pConn) = "N"
	IF pConn> 0
		nConn = pConn
	ELSE	
		IF NOT "PROC_SQL" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
			SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
		ENDIF
		IF NOT "PROC_SETUP" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
			SET PROCEDURE TO Progs\Proc_Setup ADDITIVE
		ENDIF 
		nConn = get_SQLSTRINGCONNECT()
		lNewConn = .T.
	ENDIF
ELSE
	IF NOT "PROC_SQL" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
		SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
	ENDIF
	IF NOT "PROC_SETUP" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
		SET PROCEDURE TO Progs\Proc_Setup ADDITIVE
	ENDIF 
	nConn = get_SQLSTRINGCONNECT()
	lNewConn = .T.
ENDIF


PRIVATE cSQL
cSQL = "INSERT INTO dbo.AllQuotes ("
cSQL = cSQL + "COMPANY,"
cSQL = cSQL + "NAME,"
cSQL = cSQL + "PHONE,"
cSQL = cSQL + "PHONE_EXT,"
cSQL = cSQL + "FAX,"
cSQL = cSQL + "EMAIL,"
cSQL = cSQL + "PO_NUM,"
cSQL = cSQL + "ALLOY,"
cSQL = cSQL + "FORM," 
cSQL = cSQL + "PIECES,"
cSQL = cSQL + "THCK," 
cSQL = cSQL + "SZ2,"
cSQL = cSQL + "SZ3,"
cSQL = cSQL + "Weight,"
cSQL = cSQL + "DESCRIPT,"
cSQL = cSQL + "P_lb,"
cSQL = cSQL + "P_pc,"
cSQL = cSQL + "P_ft,"
cSQL = cSQL + "cuts,"
cSQL = cSQL + "OtherFld,"
cSQL = cSQL + "OtherP,"
cSQL = cSQL + "LotP," 
cSQL = cSQL + "LotCost,"
cSQL = cSQL + "LeadTime,"
cSQL = cSQL + "cWeight,"
cSQL = cSQL + "cP_lb,"
cSQL = cSQL + "cP_pc,"
cSQL = cSQL + "cP_Pcc,"
cSQL = cSQL + "cTHK,"
cSQL = cSQL + "cLotP,"
cSQL = cSQL + "cLotCp,"
cSQL = cSQL + "cCut,"
*cSQL = cSQL + "InqDate,"
cSQL = cSQL + "InqNum,"
cSQL = cSQL + "InqNumP,"
cSQL = cSQL + "SalesP,"

cSQL = cSQL + "SalesNum,"
cSQL = cSQL + "SOitem,"
cSQL = cSQL + "Item,"
cSQL = cSQL + "HPApo,"
cSQL = cSQL + "SaleDate,"
*cSQL = cSQL + "ShipDate,"
cSQL = cSQL + "BuyFrom,"
cSQL = cSQL + "BuyCost,"
cSQL = cSQL + "BuyFrom2,"
cSQL = cSQL + "HPApo2,"
cSQL = cSQL + "Open_,"
cSQL = cSQL + "Bracket,"
cSQL = cSQL + "CustID,"
cSQL = cSQL + "QuoteMemo,"
cSQL = cSQL + "Comments,"
cSQL = cSQL + "CountryC,"
cSQL = cSQL + "Country,"
cSQL = cSQL + "Services,"
cSQL = cSQL + "RandLen,"
cSQL = cSQL + "Metric,"
cSQL = cSQL + "SZ1Orig,"
cSQL = cSQL + "SZ2Orig,"
cSQL = cSQL + "SZ3Orig,"
cSQL = cSQL + "Q_PU"
*QuoteDate
cSQL = cSQL + ") VALUES ("
cSQL = cSQL + "'','','','','','','','','10',"
cSQL = cSQL + "0,0,0,0,0,'',0,0,0,0,'',0,"
cSQL = cSQL + "0,0,'',0,0,0,0,'',0,0,0,"
*cSQL = cSQL + "GetDate(),"
cSQL = cSQL + STR(nInqNum)+",'"+cInqNumP+"','"+cSalesP+"',"
cSQL = cSQL + "0,'',0,0,''"
*cSQL = cSQL + ",''"
cSQL = cSQL + ",'',0,'',0,1,0,'','','','','',0,0,0,'','','',1"
cSQL = cSQL + ")"

nSQLEXEC  = SQLEXEC( nConn, cSQL )
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL )
ENDDO
***
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 2
		nSQLEXEC = SQLEXEC(nConn, cSQL, "")

	ENDDO
ENDIF
***
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 3' TIMEOUT 3
		nSQLEXEC = SQLEXEC(nConn, cSQL, "")

		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
***
IF nSQLEXEC < 0
	SQLExecError(cSQL,nConn, nSQLEXEC, '')
	RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
ELSE
	lReturn = .T.	
ENDIF

IF lNewConn 
	SQLDISCONNECT(nConn )
ENDIF

RETURN lReturn

**********************************************************
PROCEDURE GetLatestDate 
PARAMETERS vDue_min, vDue_max
*GetLatestDate( PurchaseOrder.due_min, PurchaseOrder.due_max )
PRIVATE lTT, lDT
lTT =.F.
lDT = .F.

IF VARTYPE(vDue_min) = "T"
	lTT = .T.
	IF VARTYPE(vDue_min) = "D"
		lDT = .T.
	ELSE
		*MESSAGEBOX( "Useage:GetLatestDate( due_min, due_max )",0+16,"Bad Parameter")
		*RETURN .F.
		vDue_min = CTOD("")
	ENDIF
ENDIF
IF VARTYPE(vDue_max) = "T"
	lTT = .T.
	IF VARTYPE(vDue_max) = "D"
		lDT = .T.
	ELSE
		*MESSAGEBOX( "Useage:GetLatestDate( due_min, due_max )",0+16,"Bad Parameter")
		*RETURN .F.
		vDue_max = CTOD("")
	ENDIF
ENDIF

**reomove bogus numbers
IF lTT
	IF vDue_min < CTOT("01/01/1984")
		vDue_min = CTOT("")
	ENDIF
	IF vDue_max < CTOT("01/01/1984")
		vDue_max = CTOT("")
	ENDIF

ELSE
	IF vDue_min < CTOD("01/01/1984")
		vDue_min = CTOD("")
	ENDIF
	IF vDue_max < CTOT("01/01/1984")
		vDue_max = CTOT("")
	ENDIF
ENDIF
**** remove outrages - Over 27 years ahead
IF lTT
	IF vDue_min > DATE()+10000
		vDue_min = CTOT("")
	ENDIF
	IF vDue_max > DATE()+10000
		vDue_max = CTOT("")
	ENDIF

ELSE
	IF vDue_min > DATE()+10000
		vDue_min = CTOD("")
	ENDIF
	IF vDue_max > DATE()+10000
		vDue_max = CTOT("")
	ENDIF
ENDIF

DO CASE
CASE ISNULL(vDue_min) AND ISNULL(vDue_max)
	*Return Null
	IF lTT
		dLatesetDate = CTOT("")
	ELSE
		dLatesetDate = CTOD("")
	ENDIF
CASE ISNULL(vDue_min) 
	dLatesetDate = vDue_max
CASE ISNULL(vDue_max)
	dLatesetDate = vDue_min
Otherwise
	IF vDue_min > vDue_max
		dLatesetDate = vDue_min
	ELSE
		dLatesetDate = vDue_max
	ENDIF
ENDCASE

RETURN dLatesetDate
**********************************************************

PROCEDURE AddQuoteFromEmailDrop
PARAMETERS pBody, pConnHandle, pSalesP
*AddQuoteFromEmailDrop( lcBody, nConnHandle, Quotes.SalesP )

IF VARTYPE(pBody) = "U"
	RETURN .F.
ENDIF
PRIVATE cBody
IF VARTYPE(pBody) = "C"
	cBody = ALLTRIM( pBody )
ELSE
	RETURN .F.
ENDIF

PRIVATE cSalesP
IF VARTYPE(pSalesP) = "C"
	cSalesP = ALLTRIM( pSalesP )
ELSE
	RETURN .F.
ENDIF

IF EMPTY(cSalesP)
	RETURN .F.
ENDIF

PRIVATE sql_SP
PRIVATE nConn, lNewConn, cAlias
lNewConn = .F.
IF VARTYPE(pConnHandle) = "N"
	IF pConnHandle > 0
		nConn = pConnHandle
	ELSE
		IF NOT "PROC_SQL" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
			SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
		ENDIF
		IF NOT "PROC_SETUP" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
			SET PROCEDURE TO Progs\Proc_Setup ADDITIVE
		ENDIF 
		
		nConn = get_SQLSTRINGCONNECT()
		lNewConn = .T.
	ENDIF
ELSE
	IF NOT "PROC_SQL" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
		SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
	ENDIF
	IF NOT "PROC_SETUP" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
		SET PROCEDURE TO Progs\Proc_Setup ADDITIVE
	ENDIF 
	
	nConn = get_SQLSTRINGCONNECT()
	lNewConn = .T.
ENDIF

cAlias = ALIAS()

IF USED('tmpForms')
	USE IN tmpForms
ENDIF
SELECT 0

IF nConn = 0
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
	RETURN .F.
ENDIF

PRIVATE cRealName,cTitle,cCompany,cPhone,cPhone_Ext,cCountryC,cCellPhone,cEmail
PRIVATE cAddress,cCity,cState,cZip,cCountry,cFax,cOtherInfo
cRealName	= ' '
cTitle		= ' '
cCompany	= ' '
cPhone		= ' '
cPhone_Ext	= ' '
cCountryC	= ''
cCellPhone	= ' '
cEmail		= ' '
cAddress	= ' '
cCity		= ' '
cState		= ' '
cZip		= ' '
cCountry	= ' '
cFax		= ' '
cOtherInfo	= ' '

*!*	****************************************************************************
*!*	Chad Babcock has been assigned to work on your new quote.
*!*	Name	Chandra Dover
*!*	Title	Office Assistant
*!*	Company	Budco Tool and Die
*!*	Office Phone	574-522-4004
*!*	Cell Phone	
*!*	Email	holly@budcotool.com
*!*	Address 1	56935 Elk Ct
*!*	City	Elkhart
*!*	State	IN
*!*	Zip	46516
*!*	Country	USA
*!*	Fax	574-522-6006
*!*	Otherinfo	
*!* Quote Request
***

*Remove up to intro
PRIVATE nIntroS, nIntroL
nIntroS=0
nIntroL=LEN('has been assigned to work on your new quote.')	
IF "has been assigned to work on your new quote." $ cBody
	nIntroS= AT_C('has been assigned to work on your new quote.',cBody, 1) - 1
	cBody = RIGHT(cBody, LEN(cBody) - nIntroS - nIntroL)
ENDIF

***
cBody = STRTRAN(cBody,CHR(10),"")
cBody = STRTRAN(cBody,CHR(13),"")

*cRealName
PRIVATE nRealNameS
PRIVATE nRealNameL
PRIVATE nTitleS
nRealNameS=0
nRealNameL=LEN('Name')	
IF "Name" $ cBody
	nRealNameS = AT_C('Name',cBody, 1) +nRealNameL
	nTitleS = AT_C('Title',cBody, 1) -1
	*cRealName = SUBSTR(cBody, nRealNameS, nTitleS )
	cRealName = SUBSTR(cBody, nRealNameS, nTitleS - nRealNameS)
	cBody = RIGHT(cBody, LEN(cBody) - nTitleS)
	*cBody = RIGHT(cBody, LEN(cBody) - nTitleS - LEN("Title") )
ENDIF

*cTitle	
PRIVATE nTitleL
PRIVATE nCompanyS
nTitleS=0
nTitleL=LEN('Title')	
IF "Title" $ cBody
	nTitleS = AT_C('Title',cBody, 1) +nTitleL
	nCompanyS = AT_C('Company',cBody, 1) -1
	cTitle = SUBSTR(cBody, nTitleS , nCompanyS - nTitleL )
	cBody = RIGHT(cBody, LEN(cBody) - nCompanyS )
ENDIF

*cCompany
PRIVATE nCompanyL
PRIVATE nPhoneS
nCompanyS=0
nCompanyL=LEN('Company')	
IF "Company" $ cBody
	nCompanyS = AT_C('Company',cBody, 1) +nCompanyL
	nPhoneS = AT_C('Office',cBody, 1) -1
	cCompany = SUBSTR(cBody, nCompanyS , nPhoneS - nCompanyL )
	cBody = RIGHT(cBody, LEN(cBody) - nPhoneS  )
ENDIF

*cPhone	
PRIVATE nPhoneL
PRIVATE nCellPhoneS
nPhoneS=0
nPhoneL=LEN('Phone')	
IF "Phone" $ cBody
	nPhoneS = AT_C('Phone',cBody, 1) +nPhoneL
	nCellPhoneS= AT_C('Cell Phone',cBody, 1) -1
	cPhone = SUBSTR(cBody, nPhoneS , nCellPhoneS - nPhoneS +1)
	cBody = RIGHT(cBody, LEN(cBody) - nCellPhoneS )
ENDIF
*cPhone_Ext

*cCellPhone
PRIVATE nCellPhoneL
PRIVATE nEmailS
nCellPhoneS=0
nCellPhoneL=LEN('Cell Phone')	
IF "Cell Phone" $ cBody
	nCellPhoneS = AT_C('Cell Phone',cBody, 1) + nCellPhoneL
	nEmailS= AT_C('Email',cBody, 1) -1
	cCellPhone = SUBSTR(cBody, nCellPhoneS  , nEmailS - nCellPhoneS  )
	cBody = RIGHT(cBody, LEN(cBody) - nEmailS)
ENDIF

*cEmail	
PRIVATE nEmailL
PRIVATE nAddress1S
nEmailS=0
nEmailL=LEN('Email')	
IF "Email" $ cBody
	nEmailS = AT_C('Email',cBody, 1) + nEmailL
	nAddress1S= AT_C('Address 1',cBody, 1) -1
	cEmail = SUBSTR(cBody, nEmailS , nAddress1S - nEmailL)
	cBody = RIGHT(cBody, LEN(cBody) - nAddress1S)
ENDIF

*cAddress
PRIVATE nAddressL
PRIVATE nCityS
nAddressS=0
nAddressL=LEN('Address 1')	
IF "Address" $ cBody
	nAddressS = AT_C('Address 1',cBody, 1) 
	nCityS= AT_C('City',cBody, 1) 
	cAddress = SUBSTR(cBody, nAddressS + nAddressL, nCityS - nAddressL)
	cBody = RIGHT(cBody, LEN(cBody) - nCityS+1)
ENDIF

*cCity	
PRIVATE nCityL
PRIVATE nStateS
nCityS=0
nCityL=LEN('City')	
IF "City" $ cBody
	nCityS = AT_C('City',cBody, 1) 
	nStateS= AT_C('State',cBody, 1)-1 
	cCity = SUBSTR(cBody, nCityS + nCityL, nStateS - nCityL)
*	cCity = LEFT(cBody, nCompanyS)
*	cCity = RIGHT(cCity , LEN(cCity )-nCityL)
	cBody = RIGHT(cBody, LEN(cBody) - nStateS )
ENDIF

*cState	
PRIVATE nStateL
PRIVATE nZipS
nStateS=0
nStateL=LEN('State')	
IF "State" $ cBody
	nStateS = AT_C('State',cBody, 1) 
	nZipS = AT_C('Zip',cBody, 1) -1
	cState = SUBSTR(cBody, nStateS + nStateL, nZipS - nStateL)
	cBody = RIGHT(cBody, LEN(cBody) - nZipS )
ENDIF

*cZip	
PRIVATE nZipL
PRIVATE nCountryS
nZipS=0
nZipL=LEN('Zip')	
IF "Zip" $ cBody
	nZipS = AT_C('Zip',cBody, 1) 
	nCountryS= AT_C('Country',cBody, 1) -1
	cZip = SUBSTR(cBody, nZipS - nZipL, nCountryS - nZipL)
	cBody = RIGHT(cBody, LEN(cBody) - nCountryS)
ENDIF

*cCountry
PRIVATE nCountryL
PRIVATE nFaxS
nCountryS=0
nCountryL =LEN('Country')	
IF "Country" $ cBody
	nCountryS = AT_C('Country',cBody, 1) 
	nFaxS = AT_C('Fax',cBody, 1) -1
	cCountry = SUBSTR(cBody, nCountryS + nCountryL, nFaxS - nCountryL )
	cBody = RIGHT(cBody, LEN(cBody) - nFaxS )
ENDIF

*cFax	
PRIVATE nFaxL
PRIVATE nOtherInfoS
nFaxS=0
nFaxL=LEN('Fax')	
IF "Fax" $ cBody
	nFaxS = AT_C('Fax',cBody, 1) 
	nOtherInfoS = AT_C('Otherinfo',cBody, 1) -1
	cFax = SUBSTR(cBody, nFaxS + nFaxL, nOtherInfoS - nFaxL )
	cBody = RIGHT(cBody, LEN(cBody) - nOtherInfoS )
ENDIF

*cOtherInfo
PRIVATE nOtherInfoL
PRIVATE nQuoteRequestS 
nOtherInfoS=0
nOtherInfoL=LEN('Otherinfo')	
IF "Otherinfo" $ cBody
	nOtherInfoS = AT_C('Otherinfo',cBody, 1) 
	nQuoteRequestS = AT_C('Quote Request',cBody, 1) -1
	cOtherInfo = SUBSTR(cBody, nOtherInfoS + nOtherInfoL, nQuoteRequestS - nOtherInfoL )
	cBody = RIGHT(cBody, LEN(cBody) - nQuoteRequestS )
ENDIF

IF "Quote Request" $ cBody
	nQuoteRequestS = AT_C('Quote Request',cBody, 1) - 1
	cBody = RIGHT(cBody, LEN(cBody) - nQuoteRequestS )
ENDIF

***

cCompany	= PrepareSQLtxt( cCompany, 'Company', 30 )
cCountry	= PrepareSQLtxt( cCountry, 'Country', 20 )
cPhone		= PrepareSQLphone(cPhone,'Phone')

IF "X" $ UPPER(cPhone)
	cPhone_Ext = RIGHT(cPhone, LEN(cPhone) - ATCC("X",cPhone) -1 )
	cPhone	= LEFT(cPhone, ATCC("X",cPhone) -1)
ENDIF
*cPhone		= RIGHT(ALLTRIM( cPhone),10 )
*cPhone		= PrepareSQLtxt( cPhone, 'Phone', 10 )
cPhone_Ext	= PrepareSQLtxt(cPhone_Ext,'Phone_Ext', 6)
cFax		= PrepareSQLphone(cFax,'Fax')
IF LEN(cFax) > 10
	cCountryC = LEFT( cFax, LEN(cFax) - 10 )
ENDIF
cCountryC	= PrepareSQLtxt( cCountryC, "CountryC", 10)
*cFax		= RIGHT(ALLTRIM( cFax),10 )
*cFax		= PrepareSQLtxt( cFax, 'Fax', 10 )
cEmail		= PrepareSQLtxt( cEmail, 'Email', 40 )
cRealName	= PrepareSQLtxt( cRealName, 'Name', 25 )
cOtherInfo	= PrepareSQLtxt( cOtherInfo, 'Memo',-1)

? "cRealName	= "+cRealName
? "cTitle		= "+cTitle
? "cCompany		= "+cCompany
? "cPhone		= "+cPhone
? "cPhone_Ext	= "+cPhone_Ext
? "cCellPhone	= "+cCellPhone
? "cEmail		= "+cEmail
? "cAddress		= "+cAddress
? "cCity		= "+cCity
? "cState		= "+cState
? "cZip			= "+cZip
? "cCountry		= "+cCountry
? "cFax			= "+cFax			
? "cOtherInfo	= "+cOtherInfo

**********
*********** Get 'Quote Request'
*********

PRIVATE nItem, cAlloy, nQuantity, cSpecification, cDescription

PRIVATE nQuoteR
nQuoteR = 1
*nQuoteR = Count number of Quote Requests

DIMENSION anItem(nQuoteR), acAlloy(nQuoteR), anQuantity(nQuoteR), acSpecification(nQuoteR), acDescription(nQuoteR)
DIMENSION acForm(nQuoteR),anThck(nQuoteR),anSz2(nQuoteR),anSz3(nQuoteR),anSz2Orig(nQuoteR),anSz3Orig(nQuoteR)

FOR I = 1 TO nQuoteR
	
	anItem(nQuoteR) = ''
	acAlloy(nQuoteR) = ''
	anQuantity(nQuoteR) = ''
	acSpecification(nQuoteR) = ''
	acDescription(nQuoteR) = ''



*!*		acAlloy(I) = ALLTRIM(acAlloy(I))
*!*		acAlloy(I) = GetAlloyStandard(LEFT(acAlloy(I),12),nConn)		&&Can return blank!
*!*		
*!*		ct1 = RIGHT(ct1,LEN(ct1)-AT(",",ct1)-1)

*!*		aSpec(I) = LEFT(ct2,AT(",",ct2)-1)
*!*		ct2 = RIGHT(ct2,LEN(ct2)-AT(",",ct2)-1)

*!*		aDesc(I) = LEFT(ct3,AT(",",ct3)-1)
*!*		ct3 = RIGHT(ct3,LEN(ct3)-AT(",",ct3)-1)

*!*		aQty(I) = LEFT(ct4,AT(",",ct4)-1)
*!*		ct4 = RIGHT(ct4,LEN(ct4)-AT(",",ct4)-1)
*!*		
*!*		acDescription(I) = PrepareSQLtxt( ALLTRIM(acAlloy(I))+" "+ALLTRIM(aSpec(I))+" "+ALLTRIM(aDesc(I))+" "+ALLTRIM(aQty(I)), "Descript", 50)
*!*		
*!*		anQuantity(I) = '1'
*!*		anSz3(I) = '0'
*!*		anSz3Orig(I) = ''
*!*		
*!*		DO CASE
*!*		CASE OCCURS("M ",UPPER(aQty(I))) > 0
*!*			 cLength = LEFT( aQty(I), ATCC("M",aQty(I)) )
*!*			 nLength = VAL(cLength)
*!*			 IF nLength > 0
*!*			 	nLength = nLength * 39.37
*!*			 	anSz3(I) = STR(nLength,10,4)
*!*			 	anSz3Orig(I) = PrepareSQLtxt(cLength, 'Sz3Orig', 20)
*!*			 	lMetric = 1
*!*			 ENDIF
*!*			 
*!*		CASE OCCURS("ME",UPPER(aQty(I))) > 0
*!*			 cLength = LEFT( aQty(I), ATCC("M",aQty(I)) )
*!*			 nLength = VAL(cLength)
*!*			 IF nLength > 0
*!*			 	nLength = nLength * 39.37
*!*			 	anSz3(I) = STR(nLength,10,4)
*!*			 	anSz3Orig(I) = PrepareSQLtxt(cLength, 'Sz3Orig', 20)
*!*			 	lMetric = 1
*!*			 ENDIF

*!*		CASE OCCURS("CM",UPPER(aQty(I))) > 0
*!*			 cLength = LEFT( aQty(I), ATCC("CM",aQty(I)) )
*!*			 nLength = VAL(cLength)
*!*			 IF nLength > 0
*!*			 	nLength = nLength * .3937
*!*			 	anSz3(I) = STR(nLength,10,4)
*!*			 	anSz3Orig(I) = PrepareSQLtxt(cLength, 'Sz3Orig', 20)
*!*			 	lMetric = 1
*!*			 ENDIF

*!*		CASE OCCURS("MM",UPPER(aQty(I))) > 0
*!*			 cLength = LEFT( aQty(I), ATCC("MM",aQty(I)) )
*!*			 nLength = VAL(cLength)
*!*			 IF nLength > 0
*!*			 	nLength = nLength * .03937
*!*			 	anSz3(I) = STR(nLength,10,4)
*!*			 	anSz3Orig(I) = PrepareSQLtxt(cLength, 'Sz3Orig', 20)
*!*			 	lMetric = 1
*!*			 ENDIF
*!*			 
*!*		CASE OCCURS("F",UPPER(aQty(I))) > 0
*!*			 cLength = LEFT( aQty(I), ATCC("F",aQty(I)) )
*!*			 nLength = VAL(cLength)
*!*			 IF nLength > 0
*!*			 	nLength = nLength * 12
*!*			 	anSz3(I) = STR(nLength,10,4)
*!*			 	anSz3Orig(I) = PrepareSQLtxt(cLength, 'Sz3Orig', 20)
*!*			 ENDIF

*!*		ENDCASE
*!*		
*!*		anThck(I)	= 0
*!*		anSz2(I)		= 0
*!*		anSz2Orig(I)	= ' '
*!*		
*!*		PRIVATE cLeftO
*!*		cLeftO = ''
*!*		
*!*		DO CASE
*!*	*	CASE OCCURS("X-RAY",UPPER(aDesc(I))) > 0
*!*	*	CASE OCCURS("XRAY",UPPER(aDesc(I))) > 0
*!*		CASE OCCURS("X",UPPER(aDesc(I))) > 0
*!*			aDesc(I) = STRTRAN( aDesc(I),["],"" )	&&Remove "
*!*			aDesc(I) = STRTRAN( aDesc(I),['],"FT" )	&&Remove '
*!*			
*!*			cThck	= LEFT( aDesc(I), ATCC("X",aDesc(I)) -1 )
*!*			anThck(I) = VAL(cThck)
*!*			cLeftO = RIGHT( aDesc(I), LEN(aDesc(I))- LEN(cThck) -1)
*!*			IF OCCURS("X",UPPER(cLeftO)) = 0
*!*				*No Second X
*!*				anSz2(I) = VAL(cLeftO)
*!*				anSz2Orig(I) = cLeftO
*!*				anSz3(I) = 0
*!*				anSz3Orig(I) = ''
*!*			ELSE
*!*				cSz2 = LEFT( cLeftO, ATCC("X",cLeftO) -1 )
*!*				anSz2(I) = VAL(cSz2)
*!*				anSz2Orig(I) = PrepareSQLtxt(cSz2, 'Sz2Orig', 20)
*!*				cLeftO = RIGHT( cLeftO, LEN(cLeftO)- LEN(cSz2) -1)
*!*				anSz3(I) = VAL(cLeftO)
*!*				anSz3Orig(I) = PrepareSQLtxt(cLeftO, 'Sz3Orig', 20)
*!*			ENDIF
*!*		CASE OCCURS("X",UPPER(aSpec(I))) > 0
*!*			IF OCCURS("X-",UPPER(aSpec(I))) = 0
*!*				IF OCCURS("XR",UPPER(aSpec(I))) = 0
*!*					cThck	= LEFT( aSpec(I), ATCC("X",aSpec(I)) )
*!*					anThck(I) = VAL(cThck)
*!*					cLeftO = RIGHT( aSpec(I), LEN(aSpec(I))- LEN(cThck) -1)
*!*					IF OCCURS("X",UPPER(cLeftO)) = 0
*!*						*No Second X
*!*						anSz2(I) = VAL(cLeftO)
*!*						anSz2Orig(I) = PrepareSQLtxt(cLeft0, 'Sz2Orig', 20)
*!*						anSz3(I) = 0
*!*					ELSE
*!*						cSz2 = LEFT( cLeftO, ATCC("X",cLeftO) -1 )
*!*						anSz2(I) = VAL(cSz2)
*!*						anSz2Orig(I) = PrepareSQLtxt(cSz2, 'Sz2Orig', 20)
*!*						cLeftO = RIGHT( cLeftO, LEN(cLeftO)- LEN(cSz2) -1)
*!*						anSz3(I) = VAL(cLeftO)
*!*						anSz3Orig(I) = PrepareSQLtxt(cLeftO, 'Sz3Orig', 20)
*!*					ENDIF
*!*				ENDIF
*!*			ENDIF
*!*		ENDCASE	
*!*		
*!*		acForm(I)	= '40'	&&Default
*!*		DO CASE
*!*		CASE OCCURS("FLAT BAR",UPPER(aSpec(I))) > 0
*!*			 acForm(I) = '11'
*!*		CASE OCCURS("FLAT BAR",UPPER(aDesc(I))) > 0
*!*			 acForm(I) = '11'
*!*		CASE OCCURS("HEX",UPPER(aSpec(I))) > 0
*!*			 acForm(I) = '12'
*!*		CASE OCCURS("HEX",UPPER(aDesc(I))) > 0
*!*			 acForm(I) = '12'
*!*		CASE OCCURS("SQUARE",UPPER(aSpec(I))) > 0
*!*			 acForm(I) = '13'
*!*		CASE OCCURS("SQUARE",UPPER(aDesc(I))) > 0
*!*			 acForm(I) = '13' 
*!*		CASE OCCURS("BAR",UPPER(aSpec(I))) > 0
*!*			 acForm(I) = '10'
*!*		CASE OCCURS("BAR",UPPER(aDesc(I))) > 0
*!*			 acForm(I) = '10'
*!*			 
*!*		CASE OCCURS("WIRE",UPPER(aSpec(I))) > 0
*!*			 acForm(I) = '20'
*!*		CASE OCCURS("WIRE",UPPER(aDesc(I))) > 0
*!*			 acForm(I) = '20'

*!*		CASE OCCURS("COATED",UPPER(aSpec(I))) > 0
*!*			 acForm(I) = '30'
*!*		CASE OCCURS("COATED",UPPER(aDesc(I))) > 0
*!*			 acForm(I) = '30'

*!*		CASE OCCURS("PLATE",UPPER(aSpec(I))) > 0
*!*			 acForm(I) = '40'
*!*		CASE OCCURS("PLATE",UPPER(aDesc(I))) > 0
*!*			 acForm(I) = '40'
*!*			 
*!*		CASE OCCURS("TUBE",UPPER(aSpec(I))) > 0
*!*			 acForm(I) = '60'
*!*		CASE OCCURS("TUBE",UPPER(aDesc(I))) > 0
*!*			 acForm(I) = '60'

*!*		CASE OCCURS("PIPE",UPPER(aSpec(I))) > 0
*!*			 acForm(I) = '65'
*!*		CASE OCCURS("PIPE",UPPER(aDesc(I))) > 0
*!*			 acForm(I) = '65'
*!*		
*!*		CASE OCCURS("NIPPLE",UPPER(aSpec(I))) > 0
*!*			 acForm(I) = '66'
*!*		CASE OCCURS("NIPPLE",UPPER(aDesc(I))) > 0
*!*			 acForm(I) = '66'

*!*		CASE OCCURS("ELBOW",UPPER(aSpec(I))) > 0
*!*			 acForm(I) = '67'
*!*		CASE OCCURS("ELBOW",UPPER(aDesc(I))) > 0
*!*			 acForm(I) = '67'

*!*		CASE OCCURS("TEE",UPPER(aSpec(I))) > 0
*!*			 acForm(I) = '68'
*!*		CASE OCCURS("TEE",UPPER(aDesc(I))) > 0
*!*			 acForm(I) = '68'
*!*		
*!*		CASE OCCURS("RED",UPPER(aSpec(I))) > 0
*!*			 acForm(I) = '69'
*!*		CASE OCCURS("RED",UPPER(aDesc(I))) > 0
*!*			 acForm(I) = '69'

*!*		CASE OCCURS("FIT",UPPER(aSpec(I))) > 0
*!*			 acForm(I) = '70'
*!*		CASE OCCURS("FIT",UPPER(aDesc(I))) > 0
*!*			 acForm(I) = '70'

*!*		CASE OCCURS("COUP",UPPER(aSpec(I))) > 0
*!*			 acForm(I) = '71'
*!*		CASE OCCURS("COUP",UPPER(aDesc(I))) > 0
*!*			 acForm(I) = '71'
*!*		CASE OCCURS("CPL",UPPER(aSpec(I))) > 0
*!*			 acForm(I) = '71'
*!*		CASE OCCURS("CPL",UPPER(aDesc(I))) > 0
*!*			 acForm(I) = '71'

*!*		CASE OCCURS("FLAN",UPPER(aSpec(I))) > 0
*!*			 acForm(I) = '72'
*!*		CASE OCCURS("FLAN",UPPER(aDesc(I))) > 0
*!*			 acForm(I) = '72'
*!*		CASE OCCURS("FL",UPPER(aSpec(I))) > 0
*!*			 acForm(I) = '72'
*!*		CASE OCCURS("FL",UPPER(aDesc(I))) > 0
*!*			 acForm(I) = '72'

*!*		CASE OCCURS("CS",UPPER(aSpec(I))) > 0
*!*			 acForm(I) = '75'
*!*		CASE OCCURS("CS",UPPER(aDesc(I))) > 0
*!*			 acForm(I) = '75'
*!*		CASE OCCURS("HH",UPPER(aSpec(I))) > 0
*!*			 acForm(I) = '75'
*!*		CASE OCCURS("HH",UPPER(aDesc(I))) > 0
*!*			 acForm(I) = '75'
*!*		CASE OCCURS("NUT",UPPER(aSpec(I))) > 0
*!*			 acForm(I) = '75'
*!*		CASE OCCURS("NUT",UPPER(aDesc(I))) > 0
*!*			 acForm(I) = '75'
*!*		CASE OCCURS("WASH",UPPER(aSpec(I))) > 0
*!*			 acForm(I) = '75'
*!*		CASE OCCURS("WASH",UPPER(aDesc(I))) > 0
*!*			 acForm(I) = '75'
*!*		CASE OCCURS("BOLT",UPPER(aSpec(I))) > 0
*!*			 acForm(I) = '75'
*!*		CASE OCCURS("BOLT",UPPER(aDesc(I))) > 0
*!*			 acForm(I) = '75'
*!*		CASE OCCURS("UNC",UPPER(aSpec(I))) > 0
*!*			 acForm(I) = '75'
*!*		CASE OCCURS("UNC",UPPER(aDesc(I))) > 0
*!*			 acForm(I) = '75'

*!*		CASE OCCURS("FORG",UPPER(aSpec(I))) > 0
*!*			 acForm(I) = '95'
*!*		CASE OCCURS("FORG",UPPER(aDesc(I))) > 0
*!*			 acForm(I) = '95'
*!*		ENDCASE

*!*		anQuantity(I)	= PrepareSQLnum(anQuantity(I),"Pieces",-3)
*!*		anThck(I)	= PrepareSQLnum(anThck(I),"Thick",10,4)
*!*		anSz2(I)		= PrepareSQLnum(anSz2(I),"Sz2",8,3)
*!*		anSz2Orig(I)	= PrepareSQLtxt(anSz2Orig(I),"SZ2Orig",20)
*!*		anSz3(I)		= PrepareSQLnum(anSz3(I),"Sz3",8,3)
*!*		anSz3Orig(I) = PrepareSQLtxt(anSz3Orig(I),"SZ3Orig",20)

NEXT I


*!*	cAlloy1		= PrepareSQLtxt( cAlloy1, 'Alloy1', 12 )	&&Alloy
*!*	cSpec1		= PrepareSQLtxt( ALLTRIM(cQuantity1)+"Pc "+CHR(13)+cSpec1+CHR(13), 'Spec1', -1 )		&&Comments
*!*	cDesc1		= PrepareSQLtxt( cDesc1, 'Desc1', 50 )		&&Descript
*!*	nQuantity1	= PrepareSQLnum( cQuantity1, 'Quantity1', -3 )	&&Pieces

*!*	cAlloy2		= PrepareSQLtxt( cAlloy2, 'Alloy1', 12 )	&&Alloy
*!*	cSpec2		= PrepareSQLtxt( ALLTRIM(cQuantity2)+"Pc "+CHR(13)+cSpec2+CHR(13), 'Spec1', -1 )		&&Comments
*!*	cDesc2		= PrepareSQLtxt( cDesc2, 'Desc1', 50 )		&&Descript
*!*	nQuantity2	= PrepareSQLnum( cQuantity2, 'Quantity1', -3 )	&&Pieces

*!*	cAlloy3		= PrepareSQLtxt( cAlloy3, 'Alloy1', 12 )	&&Alloy
*!*	cSpec3		= PrepareSQLtxt( ALLTRIM(cQuantity3)+"Pc "+CHR(13)+cSpec3+CHR(13), 'Spec1', -1 )		&&Comments
*!*	cDesc3		= PrepareSQLtxt( cDesc3, 'Desc1', 50 )		&&Descript
*!*	nQuantity3	= PrepareSQLnum( cQuantity3, 'Quantity1', -3 )	&&Pieces

*!*	cAlloy4		= PrepareSQLtxt( cAlloy4, 'Alloy1', 12 )	&&Alloy
*!*	cSpec4		= PrepareSQLtxt( ALLTRIM(cQuantity4)+"Pc "+CHR(13)+cSpec4+CHR(13), 'Spec1', -1 )		&&Comments
*!*	cDesc4		= PrepareSQLtxt( cDesc4, 'Desc1', 50 )		&&Descript
*!*	nQuantity4	= PrepareSQLnum( cQuantity4, 'Quantity1', -3 )	&&Pieces

*!*	cAlloy5		= PrepareSQLtxt( cAlloy5, 'Alloy1', 12 )	&&Alloy
*!*	cSpec5		= PrepareSQLtxt( ALLTRIM(cQuantity5)+"Pc "+CHR(13)+cSpec5+CHR(13), 'Spec1', -1 )		&&Comments
*!*	cDesc5		= PrepareSQLtxt( cDesc5, 'Desc1', 50 )		&&Descript
*!*	nQuantity5	= PrepareSQLnum( cQuantity5, 'Quantity1', -3 )	&&Pieces

*!*	cOtherInfo = PrepareSQLtxt( ALLTRIM(cOtherInfo), 'OtherInfo', -1 )	&&Memo

PRIVATE cInqnumP, nNext_inq

IF USED('MaxInqNum')
	USE IN MaxInqNum
ENDIF
SELECT 0

PRIVATE cSQLMaxInqNum
cSQLMaxInqNum = "SELECT MAX(inqnum) AS MaxInqN FROM dbo.AllQuotes WHERE SalesP = '"+cSalesP+"'"
nSQLEXEC = SQLEXEC(nConn , cSQLMaxInqNum, 'MaxInqNum') 
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn , cSQLMaxInqNum, 'MaxInqNum')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQLMaxInqNum, "MaxInqNum")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQLMaxInqNum, "MaxInqNum")

		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	SQLExecError(cSQLMaxInqNum,nConn,nSQLEXEC, 'MaxInqNum')
	RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQLMaxInqNum )
	
	IF USED('MaxInqNum')
		IF VARTYPE( MaxInqNum.MaxInqN ) = "N"
			*SQL retry worked!
			IF MaxInqNum.MaxInqN > 1000
				INQMAX = MaxInqNum.MaxInqN
			ELSE
				INQMAX = 1000
			ENDIF
		ELSE
			INQMAX = 1000
		ENDIF
	ELSE
		INQMAX=1000
	ENDIF
ELSE &&nSQLEXEC < 0
	INQMAX = MaxInqNum.MaxInqN
ENDIF

IF USED('MaxInqNum')
	USE IN MaxInqNum
ENDIF

IF ISNULL(INQMAX)
	INQMAX = 1000
ENDIF

*Save to SQL
PRIVATE cMess
cMess = ALLTRIM(cRealName)+CHR(13)+ALLTRIM(cCompany)+CHR(13)+ALLTRIM(acAlloy(1))+CHR(13)+ALLTRIM(acSpecification(1))
IF MESSAGEBOX(cMess+CHR(13)+CHR(13)+"Are you sure you want to add this Email to your 'Quotes'?",4+32,"Add to Quotes?") = 6
	
	FOR I = 1 TO nItems
		nNext_inq = INQMAX + I
		cInqnumP = STR(nNext_inq,8,0)+cSalesP 
		
		PRIVATE cSQLi 
		cSQLi  = "INSERT INTO dbo.AllQuotes ("
		cSQLi  = cSQLi  + "COMPANY,NAME,PHONE,PHONE_EXT,FAX,EMAIL"
		cSQLi  = cSQLi  + ",PO_NUM,ALLOY,FORM,PIECES" 
		cSQLi  = cSQLi  + ",THCK,SZ2,SZ3,Weight,DESCRIPT"
		cSQLi  = cSQLi  + ",P_lb,P_pc,P_ft,cuts"
		cSQLi  = cSQLi  + ",OtherFld,OtherP,LotP,LotCost"
		cSQLi  = cSQLi  + ",LeadTime,cWeight"
		cSQLi  = cSQLi  + ",cP_lb,cP_pc,cP_Pcc,cTHK"
		cSQLi  = cSQLi  + ",cLotP,cLotCp,cCut"
		cSQLi  = cSQLi  + ",InqNum,InqNumP,SalesP"
		cSQLi  = cSQLi  + ",SalesNum,SOitem,Item,HPApo,SaleDate,BuyFrom,BuyCost,BuyFrom2,HPApo2,Open_"
		cSQLi  = cSQLi  + ",Bracket,CustID,QuoteMemo,Comments"
		cSQLi  = cSQLi  + ",CountryC,Country,Services,RandLen,Metric,SZ1Orig,SZ2Orig,SZ3Orig"
		cSQLi  = cSQLi  + ") VALUES ("
		cSQLi  = cSQLi  + "'"+cCompany+"','"+cRealName+"','"+cPhone+"','"+cPhone_Ext+"','"+cFax+"','"+cEmail+"'"
		cSQLi  = cSQLi  + ",'','"+acAlloy(I)+"','"+acForm(I)+"',"+STR(anQuantity(I),10,0)
		cSQLi  = cSQLi  + ","+STR(anThck(I),10,5)+","+STR(anSz2(I),8,4)+","+STR(anSz3(I),8,4)+",0,'"+acDescription(I)+"'"
		cSQLi  = cSQLi  + ",0,0,0,0"
		cSQLi  = cSQLi  + ",'',0,0,0"
		cSQLi  = cSQLi  + ",'',0"
		cSQLi  = cSQLi  + ",0,0,0,''"
		cSQLi  = cSQLi  + ",0,0,0"
		cSQLi  = cSQLi  + ","+STR(nNext_inq)+",'"+cInqnumP+"','"+cSalesP+"'"
		cSQLi  = cSQLi  + ",0,'',0,0,'','',0,'',0,1"
		cSQLi  = cSQLi  + ",0,'','"+cOtherInfo+"','"+acSpecification(I)+"'"
		cSQLi  = cSQLi  + ",'"+cCountryC+"','"+cCountry+"',0,0,"+STR(lMetric)+",'','"+anSz2Orig(I)+"','"+anSz3Orig(I)+"'"+")"

		nSQLEXEC = SQLEXEC( nConn,cSQLi )
		
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC( nConn,cSQLi )
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(nConn, cSQLi, "")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(nConn, cSQLi, "")

				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLExecError(cSQLi,nConn,nSQLEXEC )
			RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQLi )
		ENDIF
		
	NEXT I
ENDIF


IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN .T.

ENDPROC

**************************************** 

PROCEDURE GetCut_Letter_Number 
PARAMETERS pnCut

PRIVATE lcCut
IF VARTYPE(pnCut)!="N"
	lcCut=""
ELSE
	IF ISNULL(pnCut)	
		lcCut=""
	ELSE
		DO CASE
		CASE pnCut = 1
			lcCut = "N"
		CASE pnCut = 2
			lcCut = "A"
		CASE pnCut = 3
			lcCut = "S"
		CASE pnCut = 4
			lcCut = "P"
			*Plasma=4
		CASE pnCut = 5
			lcCut = "W"
		CASE pnCut = 6
			lcCut = "B"
		CASE pnCut = 7
			lcCut = "C"
		OTHERWISE
			lcCut = ""
		ENDCASE
	ENDIF
ENDIF


RETURN lcCut

ENDPROC
***************************************

PROCEDURE GetCut_Name_Letter 
PARAMETERS pcCut, plReturnNotSpecified

IF VARTYPE(plReturnNotSpecified) != "L"
	plReturnNotSpecified = .F.
ENDIF

PRIVATE cCutName
IF VARTYPE(pcCut)!="C"
	cCutName=" "
ELSE
	IF ISNULL(pcCut)	
		cCutName=" "
	ELSE
		DO CASE
		CASE pcCut= 'N'
			IF plReturnNotSpecified
				cCutName= "Cut Not Specified"
			ELSE
				cCutName= ""
			ENDIF
		CASE pcCut= 'A'
			cCutName= "Abrasive Cut"
		CASE pcCut= 'S'
			cCutName= "Shear Cut"
		CASE pcCut= 'P'
			cCutName= "Plasma Cut"
		CASE pcCut= 'W'
			cCutName= "Waterjet Cut"
		CASE pcCut= 'B'
			cCutName= "Band Saw Cut"
		OTHERWISE
			cCutName= " "
		ENDCASE
	ENDIF
ENDIF


RETURN cCutName

ENDPROC

****************************************
PROCEDURE CheckCut_Letter_toForm 
PARAMETERS pcCut,pcForm
	*Check Cut Rules.

IF VARTYPE(pcCut) != "C"
	RETURN .T.
ENDIF
IF VARTYPE(pcForm) != "C"
	RETURN .T.
ENDIF

PRIVATE lReturnPossible
lReturnPossible = .F.
PRIVATE nGenericForm
nGenericForm = 0
PRIVATE cCutMethod
cCutMethod = ''

DO CASE
CASE pcCut= 'N'
	cCutMethod = "Cut Not Specified"
	lReturnPossible = .T.
CASE pcCut= 'A'
	cCutMethod = "Abrasive Cut"
	lReturnPossible = .T.
CASE pcCut= 'S'
	cCutMethod = "Shear Cut"
	IF pcForm = '40' OR pcForm = '80'
		lReturnPossible = .T.
	ELSE
		lReturnPossible = .F.
	ENDIF
CASE pcCut= 'P'
	cCutMethod = "Plasma Cut"
	IF pcForm = '40' OR pcForm = '80'
		lReturnPossible = .T.
	ELSE
		lReturnPossible = .F.
	ENDIF
CASE pcCut= 'W'
	cCutMethod = "Waterjet Cut"
	IF pcForm = '40' OR pcForm = '80'
		lReturnPossible = .T.
	ELSE
		lReturnPossible = .F.
	ENDIF
CASE pcCut= 'B'
	nGenericForm = GetFormSort(pcForm)
	cCutMethod = "Band Saw Cut"
	IF nGenericForm = 10 OR nGenericForm = 20 OR nGenericForm = 60 OR nGenericForm = 65
		lReturnPossible = .T.
	ELSE
		lReturnPossible = .F.
	ENDIF
CASE pcCut= ' '
	cCutMethod = "Cut Not Specified"
	lReturnPossible = .T.	
CASE pcCut= ''
	cCutMethod = "Cut Not Specified"
	lReturnPossible = .T.	
OTHERWISE
	cCutMethod = " "
	TrackError("pcCut_Letter not programmed","pcCut_Letter not programmed", "Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(1))
ENDCASE

IF NOT lReturnPossible
	MESSAGEBOX( "The cutting method you have specified in not usual for this form."+CHR(13)+"Cutting by:"+cCutMethod+CHR(13)+"Form:"+cForm,0+64,"Please double check you cutting method!")
ENDIF

RETURN lReturnPossible

ENDPROC

****************************************
PROCEDURE ParseCutOptionsTol 
PARAMETERS pCutOptions

IF VARTYPE(pCutOptions) != "C"
	RETURN ''
ENDIF
PRIVATE cReturn
cReturn = ''
*pCutOptions= [Waterjet 4 side cut $0/Pc @100% +0.125" -0]
*cReturn = " "+RIGHT(pCutOptions,1+(LEN(pCutOptions)-ATC('@',pCutOptions))) &&includes @100%
IF AT('%',pCutOptions) > 0
	cReturn = RIGHT(pCutOptions,1+(LEN(pCutOptions)-AT('%',pCutOptions)-2))
ENDIF
IF AT('+',pCutOptions) > 0
	cReturn = RIGHT(pCutOptions,1+(LEN(pCutOptions)-AT('+',pCutOptions)))
ENDIF
cReturn = ALLTRIM(cReturn)

RETURN cReturn
ENDPROC

****************************************
PROCEDURE KerfAdjust 
PARAMETERS pCut_Letter,pcForm,pnThck
*nKerfAdjust = KerfAdjust(cCut_Letter,pcForm,pnThck)
*-- depricate, just use Cut_Tol_Lost_PU
 
IF VARTYPE(pCut_Letter) != "C"
	pCut_Letter = ""
ENDIF
IF VARTYPE(pcForm) != "C"
	pcForm= ""
ENDIF
IF VARTYPE(pnThck) != "N" AND VARTYPE(pnThck) != "Y"
	pnThck = 0
ENDIF

PRIVATE nKerfAdjust 
nKerfAdjust = 1

*EXEC dbo.[p_GetFullQuote] 1,'C-276','40','1',1,12,48,0
*nSawCurf = .300

PRIVATE nCut_Tol_Lost, nPU
nCut_Tol_Lost = Cut_Tol_Lost(pCut_Letter,pcForm,pnThck) 
SET PROCEDURE TO Progs\Proc_StockLst ADDITIVE
nPU = nPU_Acct_Form(pcForm)

*Quote.Cut = N-not specified, A-abrasive, B-band saw, S-shear, P-plasma, W-waterjet
DO CASE
CASE pCut_Letter  = 'A'
*Abrasive
	*IF pcForm='10' OR pcForm='11' OR pcForm='12' OR pcForm='13' OR pcForm='40' OR pcForm='50' OR pcForm='51' OR pcForm='52' OR pcForm='53' OR pcForm='80' 
	IF nPU = 1 OR nPU = 2
		DO CASE
		CASE pnThck < .015
			nKerfAdjust = 1
		CASE pnThck < .050
			nKerfAdjust =  .325 + nCut_Tol_Lost 
		CASE pnThck < .375
			nKerfAdjust =  .325 + nCut_Tol_Lost 
		CASE pnThck < 1.5
			nKerfAdjust =  .350 + nCut_Tol_Lost 
		CASE pnThck < 4
			nKerfAdjust =  .350 + nCut_Tol_Lost 
		CASE pnThck < 7
			nKerfAdjust =  .375 + nCut_Tol_Lost 
		CASE pnThck < 10
			nKerfAdjust =  .375 + nCut_Tol_Lost 
		CASE pnThck < 15
			nKerfAdjust =  .375 + nCut_Tol_Lost 
		ENDCASE
	ENDIF
CASE pCut_Letter  = 'B'
*BandSaw
	IF nPU = 1 OR nPU = 2
		DO CASE
		CASE pnThck < .015
			nKerfAdjust = 1
		CASE pnThck < .050
			nKerfAdjust = ( .156 + nCut_Tol_Lost )
		CASE pnThck < .375
			nKerfAdjust = ( .156 + nCut_Tol_Lost )
		CASE pnThck < 1.5
			nKerfAdjust = ( .156 + nCut_Tol_Lost )
		CASE pnThck < 4
			nKerfAdjust = ( .156 + nCut_Tol_Lost )
		CASE pnThck < 7
			nKerfAdjust = ( .156 + nCut_Tol_Lost )
		CASE pnThck < 10
			nKerfAdjust = ( .156 + nCut_Tol_Lost )
		CASE pnThck < 15
			nKerfAdjust = ( .156 + nCut_Tol_Lost )
		ENDCASE
	ENDIF
ENDCASE

RETURN nKerfAdjust
ENDPROC

****************************************
PROCEDURE Kerf_Lost
PARAMETERS pCut_Letter
*nKerfLost = Kerf_Lost(cCut_Letter) &&in Inches
 
IF VARTYPE(pCut_Letter) != "C"
	pCut_Letter = ""
ENDIF

PRIVATE nKerfLost 
nKerfLost = 0

*Quote.Cut = N-not specified, A-abrasive, B-band saw, S-shear, P-plasma, W-waterjet
*These numbers depends on Tolerance, Add tol loss later
DO CASE
CASE pCut_Letter  = 'A'
*Abrasive
	nKerfLost = .300
CASE pCut_Letter  = 'B'
	*BandSaw
	nKerfLost = .156
CASE pCut_Letter = "C"
	*Cold Saw
	nKerfLost = .125
CASE pCut_Letter = "S"
	*Shear
	nKerfLost = .005
CASE pCut_Letter = "P"
	*P-plasma
	nKerfLost = .250
CASE pCut_Letter = "W"
	*W-waterjet 
	nKerfLost = .045
ENDCASE

RETURN nKerfLost
ENDPROC
****************************************
PROCEDURE Cut_Tol_Lost 
PARAMETERS pCut_Letter,pcForm,pnThck
*nCut_Tol_Lost = Cut_Tol_Lost(pCut_Letter,cForm,pnThck)

IF VARTYPE(pCut_Letter) != "C"
	pCut_Letter = ""
ENDIF
IF VARTYPE(pcForm) != "C"
	pcForm= ""
ENDIF
IF VARTYPE(pnThck) != "N" AND VARTYPE(pnThck) != "Y"
	pnThck = 0
ENDIF

PRIVATE nCut_Tol_Lost, nPU
nCut_Tol_Lost = 0
SET PROCEDURE TO Progs\Proc_StockLst ADDITIVE
nPU = nPU_Acct_Form(pcForm)

DO CASE
CASE pCut_Letter  = 'A'
	*Abrasive
	*Do not add to forms sold by Pc!

	IF nPU = 1 OR nPU = 2
*	IF pcForm='10' OR pcForm='11' OR pcForm='12' OR pcForm='13' OR pcForm='40' OR pcForm='50' OR pcForm='51' OR pcForm='52' OR pcForm='53' OR pcForm='80' 
		DO CASE
		CASE pnThck < .015
			nCut_Tol_Lost = .062
		CASE pnThck < .050
			nCut_Tol_Lost = .062 
		CASE pnThck < .375
			nCut_Tol_Lost = .062 
		CASE pnThck < 1.5
			nCut_Tol_Lost = .062 
		CASE pnThck < 4
			nCut_Tol_Lost = .125 
		CASE pnThck < 7
			nCut_Tol_Lost = .125 
		CASE pnThck < 10
			nCut_Tol_Lost = .188 
		CASE pnThck < 15
			nCut_Tol_Lost = .250
		ENDCASE
	ENDIF
	
CASE pCut_Letter  = 'B' OR pCut_Letter  = 'C' OR pCut_Letter  = 'S'
	*Band Saw or Cold saw
	IF nPU = 1 OR nPU = 2
		DO CASE
		CASE pnThck < .015
			nCut_Tol_Lost = 0
		CASE pnThck < .050
			nCut_Tol_Lost = .062 
		CASE pnThck < .375
			nCut_Tol_Lost = .062 
		CASE pnThck < 1.5
			nCut_Tol_Lost = .062 
		CASE pnThck < 4
			nCut_Tol_Lost = .125 
		CASE pnThck < 7
			nCut_Tol_Lost = .125 
		CASE pnThck < 10
			nCut_Tol_Lost = .188 
		CASE pnThck < 15
			nCut_Tol_Lost = .200 
		ENDCASE
	ENDIF

CASE pCut_Letter  = 'S'
*Shear
	IF nPU = 1 OR nPU = 2
		DO CASE
		CASE pnThck < .015
			nCut_Tol_Lost = 0
		CASE pnThck < .050
			nCut_Tol_Lost = .022 
		CASE pnThck < .375
			nCut_Tol_Lost = .062 
		CASE pnThck < 1.5
			nCut_Tol_Lost = .125 
		ENDCASE
	ENDIF

ENDCASE

RETURN nCut_Tol_Lost
ENDPROC

****************************************
PROCEDURE Cut_Tol_Lost_PU
PARAMETERS pCut_Letter,pnPU,pnThck, pnSz2, pnSz3,pcCutOptions
*nCut_Tol_Lost = Cut_Tol_Lost_PU(pCut_Letter,nPU,pnThck, nSz2, nSz3,cCutOptions) 	&&in Inches

IF VARTYPE(pCut_Letter) != "C"
	pCut_Letter = ""
ENDIF
IF VARTYPE(pnPU) != "N"
	nPU = 1
ELSE
	nPU = pnPU
ENDIF

IF VARTYPE(pnThck) != "N" AND VARTYPE(pnThck) != "Y"
	pnThck = 0
ENDIF

PRIVATE nCut_Tol_Lost
nCut_Tol_Lost = 0

DO CASE
CASE pCut_Letter  = 'A'
	*Abrasive
	*Do not add to forms sold by Pc!

	IF nPU = 1 OR nPU = 2
		DO CASE
		CASE pnThck < .015
			nCut_Tol_Lost = .062
		CASE pnThck < .050
			nCut_Tol_Lost = .062 
		CASE pnThck < .375
			nCut_Tol_Lost = .062 
		CASE pnThck < 1.5
			nCut_Tol_Lost = .062 
		CASE pnThck < 4
			nCut_Tol_Lost = .125 
		*CASE pnThck < 7
		*	nCut_Tol_Lost = .125 
		*CASE pnThck < 10
		*	nCut_Tol_Lost = .188 
		*CASE pnThck < 15
		*	nCut_Tol_Lost = .250
		OTHERWISE
			nCut_Tol_Lost = .250 
		ENDCASE
	ENDIF
	
CASE pCut_Letter  = 'B' OR pCut_Letter  = 'C' OR pCut_Letter  = 'S'
	*Band Saw or Cold saw
	IF nPU = 1 OR nPU = 2
		DO CASE
		CASE pnThck < .015
			nCut_Tol_Lost = .062
		CASE pnThck < .050
			nCut_Tol_Lost = .062 
		CASE pnThck < .375
			nCut_Tol_Lost = .062 
		CASE pnThck < 1.5
			nCut_Tol_Lost = .062 
		CASE pnThck < 4
			nCut_Tol_Lost = .125 
		CASE pnThck < 7
			nCut_Tol_Lost = .125 
		*CASE pnThck < 10
		*	nCut_Tol_Lost = .188 
		*CASE pnThck < 15
		*	nCut_Tol_Lost = .200 
		OTHERWISE 
			nCut_Tol_Lost = .200 
		ENDCASE
	ENDIF

CASE pCut_Letter  = 'S'
*Shear
	IF nPU = 1 OR nPU = 2
		DO CASE
		CASE pnThck < .015
			nCut_Tol_Lost = .025
		CASE pnThck < .050
			nCut_Tol_Lost = .032 
		CASE pnThck < .375
			nCut_Tol_Lost = .062 
		*CASE pnThck < 1.5
		*	nCut_Tol_Lost = .125 
		OTHERWISE 
			*CASE pnThck < 1.5
			nCut_Tol_Lost = .125 
		ENDCASE
	ENDIF
CASE pCut_Letter = "P"
	*PrepareSQLtxt(Quotes.CutOptions,'CutOptions',75,.T.)
	*parse CutOptions [Waterjet 4 side cut $1229.40/Pc @20% +0.005" -0]
	*				[Plasma cut along length+width $43.31 +0.125" -0]
	PRIVATE nTol, cCutOpt
	nTol = .125
	cCutOpt = ''
	IF VARTYPE(pcCutOptions)="C"
		IF AT("$",pcCutOptions) > 0
			*Shorten pcCutOptions if can
			cCutOpt = RIGHT(cCutOpt ,LEN(pcCutOptions)-AT("$",pcCutOptions) -3)
		ELSE
			cCutOpt = pcCutOptions
		ENDIF
		
		IF AT("+0.",cCutOpt) > 0
			cCutOpt = RIGHT(cCutOpt,LEN(cCutOpt)-AT("+0.",cCutOpt) -1)
			nTol = PrepareSQLnum( cCutOpt,'Cut Tol Loss',4,3)
		ENDIF
		
	ENDIF
		
CASE  pCut_Letter = "W"
	*PrepareSQLtxt(Quotes.CutOptions,'CutOptions',75,.T.)
	*parse CutOptions [Waterjet 4 side cut $1229.40/Pc @20% +0.005" -0]
	*				[Plasma cut along length+width $43.31 +0.125" -0]
	PRIVATE nTol, cCutOpt
	nTol = .125
	cCutOpt = ''
	IF VARTYPE(pcCutOptions)="C"
		IF AT("$",pcCutOptions) > 0
			*Shorten pcCutOptions if can
			cCutOpt = RIGHT(cCutOpt ,LEN(pcCutOptions)-AT("$",pcCutOptions) -3)
		ELSE
			cCutOpt = pcCutOptions
		ENDIF
		
		IF AT("+0.",cCutOpt) > 0
			cCutOpt = RIGHT(cCutOpt,LEN(cCutOpt)-AT("+0.",cCutOpt) -1)
			nTol = PrepareSQLnum( cCutOpt,'Cut Tol Loss',4,3)
		ENDIF
		
	ENDIF
*!*		********************
*!*		PRIVATE nCutOption
*!*		nCutOption = 0
*!*		
*!*		DO CASE
*!*		CASE UPPER(LEFT(cCutOptions,12)) = "ALONG WIDTH "
*!*			nCutOption = 1
*!*			*cCutOptions1 = RIGHT(cCutOptions,28)
*!*		CASE UPPER(LEFT(cCutOptions,13)) = "ALONG LENGTH "
*!*			nCutOption = 2
*!*			*cCutOptions1 = RIGHT(cCutOptions,27)
*!*		CASE UPPER(LEFT(cCutOptions,18)) = "ALONG LENGTH+WIDTH"
*!*			nCutOption = 3
*!*			*cCutOptions1 = RIGHT(cCutOptions,22)
*!*		CASE UPPER(LEFT(cCutOptions,6)) = "4 SIDE"
*!*			nCutOption = 4
*!*			*cCutOptions1 = RIGHT(cCutOptions,34)
*!*		CASE UPPER(LEFT(cCutOptions,8)) = "COMBINED"
*!*			nCutOption = 5
*!*			*cCutOptions1 = RIGHT(cCutOptions,31)
*!*		CASE UPPER(LEFT(cCutOptions,8)) = "CUT DISK"
*!*			nCutOption = 6
*!*			*cCutOptions1 = RIGHT(cCutOptions,32)
*!*		OTHERWISE
*!*			nCutOption = 0
*!*		ENDCASE	
*!*			
	nCut_Tol_Lost = nTol
ENDCASE

RETURN nCut_Tol_Lost
ENDPROC
****************************************
PROCEDURE POShipAddrST  
PARAMETERS nPOShipAddr,nConn
*cReturnString = POShipAddrST(nPOShipAddr,nConn)

IF VARTYPE(nPOShipAddr) != "N"
	RETURN ''
ENDIF
IF VARTYPE(nConn) != "N"
	RETURN ''
ENDIF

PRIVATE cReturnString
cReturnString =''

PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpShipAddr')
	USE IN tmpShipAddr
ENDIF

SELECT 0
PRIVATE cSQL, nSQLEXEC
cSQL = "SELECT Company,Addr1,Addr2 "
cSQL = cSQL + " FROM dbo.ShipAddr "
cSQL = cSQL + " WHERE ShipCode = "+STR(nPOShipAddr)+""

nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpShipAddr')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpShipAddr' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpShipAddr")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpShipAddr")

		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpShipAddr' )
	RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
ENDIF

IF USED('tmpShipAddr')
	IF RECCOUNT('tmpShipAddr')>0
		cReturnString = ALLTRIM(tmpShipAddr.Company)
		IF NOT EMPTY(tmpShipAddr.Addr1)
			IF EMPTY(cReturnString)
				cReturnString = ALLTRIM(tmpShipAddr.Addr1)
			ELSE
				cReturnString = cReturnString+ [<br />] +ALLTRIM(tmpShipAddr.Addr1)
			ENDIF
		ENDIF
		IF NOT EMPTY(tmpShipAddr.Addr2)
			IF EMPTY(cReturnString)
				cReturnString = ALLTRIM(tmpShipAddr.Addr2)
			ELSE
				cReturnString = cReturnString+ [<br />] +ALLTRIM(tmpShipAddr.Addr2)
			ENDIF
		ENDIF
	ENDIF
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cReturnString
ENDPROC

****************************************
PROCEDURE SOitem_Location 
PARAMETERS cSOitem
*? SOitem_Location('  93797-01')

********************************************************************
** CHANGES HERE MUST BE REPLICATED TO:
** SOitem_Location.PRG
********************************************************************
PRIVATE lcReturn
lcReturn = ''

IF VARTYPE(cSOitem) != "C"
	RETURN lcReturn
ENDIF

IF Proper_SO_item(cSOitem) =  Proper_SO_item('')
	RETURN lcReturn
ENDIF

IF NOT "PROC_SETUP" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
	SET PROCEDURE TO Progs\Proc_Setup ADDITIVE
ENDIF
IF NOT "PROC_QUOTES" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
	SET PROCEDURE TO Progs\Proc_Quotes ADDITIVE
ENDIF 

PRIVATE nConn
nConn = get_SQLSTRINGCONNECT()

PRIVATE cAlias 
cAlias = ALIAS()

PRIVATE cSQL, nSQLEXEC

IF USED('tmpPQ_SQLAns')
	USE IN tmpPQ_SQLAns
ENDIF
SELECT 0

IF nConn > 0
	cSQL = "SELECT SP.AllowSub, SD.[Location]"
	cSQL = cSQL + " FROM dbo.Stocklst_Detail SD "
	cSQL = cSQL + " INNER JOIN dbo.StockLst_Process SP ON SD.ID_Detail = SP.ID_Detail "
	cSQL = cSQL + " WHERE SP.SOitem = dbo.f_ProperSOitem('"+cSOItem+"')"
	
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPQ_SQLAns' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPQ_SQLAns' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPQ_SQLAns")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPQ_SQLAns")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL ,nConn,nSQLEXEC, 'tmpPQ_SQLAns')
		RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
	
	IF USED('tmpPQ_SQLAns')
		IF RECCOUNT('tmpPQ_SQLAns') > 0
*			lcReturn = PrepareSQLtxt(tmpPQ_SQLAns.AllowSub,'AllowSub',1)
			lcReturn = PrepareSQLtxt(tmpPQ_SQLAns.Location,'Location',10)
		ENDIF

		USE IN tmpPQ_SQLAns
	ENDIF
	
	**************************	
	SQLDISCONNECT( nConn )
ELSE
	*Error on Connection String
	TrackError("Could not Connect to SQL","Error on Connection String","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN ALLTRIM(lcReturn)
ENDPROC

****************************************
PROCEDURE POShipAddrCity 
PARAMETERS nPOShipAddr, nConn
*cReturnString = POShipAddrCity(nPOShipAddr,nConn)

IF VARTYPE(nPOShipAddr) != "N"
	RETURN ''
ENDIF
IF VARTYPE(nConn) != "N"
	RETURN ''
ENDIF

PRIVATE cReturnString
cReturnString =''

PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpShipAddr')
	USE IN tmpShipAddr
ENDIF

SELECT 0
PRIVATE cSQL, nSQLEXEC
cSQL = "SELECT City, ST, Zip, Country "
cSQL = cSQL + " FROM dbo.ShipAddr "
cSQL = cSQL + " WHERE ShipCode = "+STR(nPOShipAddr)+""

nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpShipAddr')

DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpShipAddr' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpShipAddr")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpShipAddr")

		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpShipAddr' )
	RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
ENDIF

IF USED('tmpShipAddr')
	IF RECCOUNT('tmpShipAddr')>0
		cReturnString = ALLTRIM(tmpShipAddr.City)+", "
		IF NOT EMPTY(tmpShipAddr.ST)
			cReturnString = cReturnString+ALLTRIM(tmpShipAddr.ST)
		ENDIF
		IF NOT EMPTY(tmpShipAddr.Zip)
			cReturnString = cReturnString+ [ ] +ALLTRIM(tmpShipAddr.Zip)
		ENDIF

		IF NOT EMPTY(tmpShipAddr.Country )
			IF NOT ( UPPER(tmpShipAddr.Country) = "US" OR UPPER(tmpShipAddr.Country) = "USA" )
				cReturnString = cReturnString+ [ ] +ALLTRIM(tmpShipAddr.Country)
			ENDIF
		ENDIF
	ENDIF
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cReturnString
ENDPROC

****************************************	
PROCEDURE CreateHTML_Quote 
PARAMETERS cInqnumP, cEmailTO
**********************************************************
* Edites here should match the code used in HPA:SendQuotes.QBody()

PRIVATE nConn, lNewConn
lNewConn = .F.
IF NOT "PROC_SQL" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
	SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
ENDIF
IF NOT "PROC_SETUP" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
	SET PROCEDURE TO Progs\Proc_Setup ADDITIVE
ENDIF 

nConn = get_SQLSTRINGCONNECT()
lNewConn = .T.

	
SELECT QuoteTerms
GO TOP

SELECT QDBsendTo
GO TOP

IF EMPTY(QDBsendTo.email)
	DO FORM FORMS\QDBsendTo.scx
ENDIF


IF VARTYPE(cEmailTO) != "C"
	cEmailTO = QDBsendTo.Email
ENDIF

IF EMPTY(cEmailTO)
	IF EMPTY(QDBsendTo.email)
		=MESSAGEBOX('Addresse table does not have Email address.',16,'No Email address')
		RETURN ""
	ENDIF
ENDIF

PRIVATE m.MsgNoteHTML
********************************************
m.MsgNoteHTML = CreateHTML_Quote_Header(cInqnumP, cEmailTO)
********************************************

m.MsgNoteHTML = m.MsgNoteHTML +[<table style="border-style: solid solid double solid; border-width: thin thin medium thin; border-color: #000000; width: 480pt; ">]
m.MsgNoteHTML = m.MsgNoteHTML +[<tr class="styleTableHeadersRow">]
*m.MsgNoteHTML = m.MsgNoteHTML +[<td style="width: 240pt;"><strong>Description</strong></td>]
*m.MsgNoteHTML = m.MsgNoteHTML +[<td style="width: 234pt;"><strong>Pricing</strong></td>]
m.MsgNoteHTML = m.MsgNoteHTML +[<td style="width: 300pt;"><strong>Description</strong></td>]
m.MsgNoteHTML = m.MsgNoteHTML +[<td style="width: 174pt;"><strong>Pricing</strong></td>]

m.MsgNoteHTML = m.MsgNoteHTML +[</tr>]

***********************
PRIVATE nRunningTotal, cDescription, cCmnt 
nRunningTotal = 0
cCmnt = ''

IF USED('Quote21')
	SELECT Quote21
ELSE
*	IF USED(Quote12)
*		SELECT Quote12
*	ELSE
		MESSAGEBOX("Lost Quote Table",16,"Cannot create the Quote.")
		TrackError("Lost Quote Table","Lost Quote Table", "Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(1))
*	ENDIF
ENDIF
*(Pieces N(10,2),UnitQty N(10,2), Descript M, LBS N(10,1), UnitP N(12,4), Unit C(3), TotalP N(12,4),Cmnt M, recnum N(8), Regret(L),Services(L),OtherP M )
SCAN
	m.MsgNoteHTML = m.MsgNoteHTML +[<tr style="vertical-align: top">]

	cDescription = PrepareSQLtxt(Quote21.Descript,'Descript',-1)
	cDescription = STRTRAN(cDescription, ['], [`] )
	cDescription = STRTRAN(cDescription, CHR(13), "<br />" )
	
	PRIVATE nLocat,cBrandName,nAdder
	nLocat = 0
	*Is their a brandname
	IF AT("?", cDescription ) > 0
		*Get length past ?
		PRIVATE nLocat,cBrandName,nAdder
		nLocat = AT("?", cDescription )
		cBrandName = ALLTRIM(GetBrandName_Ptl( SUBSTR(cDescription, nLocat-2, 8) ))
*		nAdder = LEN(cBrandName - AT("?",cBrandName)) && make sure you find how manny added characters are after the ? before you insert a break
		
		cDescription = STUFF(cDescription, AT(cBrandName, cDescription ),0,"<br />")
		cDescription = STUFF(cDescription, AT(cBrandName, cDescription )+LEN(cBrandName),0,"<br />")  
	ENDIF
	
	*Insert break after UNS
	IF AT('UNS', cDescription ) > 0
		IF nLocat > 0
			**Just added a Break, skip it here.
		ELSE
			cDescription = STUFF(cDescription, AT('UNS', cDescription ),0,"<br />")
			cDescription = STUFF(cDescription, AT('UNS', cDescription )+10,0,"<br />")  &&0 characters replaced
		ENDIF
	ENDIF
	cCmnt = PrepareSQLtxt(Quote21.Cmnt,'Cmnt',-1)  &&Use PrepareSQL before saving to SQL!
	cCmnt = STRTRAN(cCmnt, ['], [`] )
	cCmnt = STRTRAN(cCmnt, CHR(13), "<br />" )
	cCmnt = ALLTRIM(cCmnt)
	IF LEFT(cCmnt,5) = "<br />"
		cCmnt = RIGHT( cCmnt, LEN(cCmnt)-5)
	ENDIF
	
	***This is the Decription Side of the HTML Table	
	m.MsgNoteHTML = m.MsgNoteHTML +[<td style="border-width: thin; border-top-style: solid">]+"<strong>"+cDescription+"</strong>"+[<br />]
	m.MsgNoteHTML = m.MsgNoteHTML +[<strong>]+cCmnt+[</strong><br /></td>]
	m.MsgNoteHTML = m.MsgNoteHTML +[<td style="border-width: thin; border-top-style: solid">]


	***This is the Pricing Side of the HTML Table	
	****************************************************************

*!*		cZAlloy= ''
*!*		IF EMPTY(Quotes.Alloy)
*!*			cZAlloy = ''+" "+cZCC+" "
*!*		ELSE
*!*			cZAlloy = "Alloy: "+Quotes.Alloy+" "+cZCC+" "
*!*			IF Quotes.TN
*!*				cZAlloy = cZAlloy + BrandName( Quotes.Alloy )
*!*			ELSE
*!*				cZAlloy =  cZAlloy + UniversalName( Quotes.Alloy )
*!*			ENDIF
*!*		ENDIF
*!*		
*!*		PRIVATE cCutName
*!*		IF NOT ISNULL(Quotes.Cut)
*!*			cCutName = " "+GetCut_Name_Letter(Quotes.Cut)+""
*!*		ELSE
*!*			cCutName = ''
*!*		ENDIF

*!*		PRIVATE cCutTolerence
*!*		cCutTolerence = ''
*!*		IF NOT ISNULL(Quotes.CutOptions)
*!*			IF cCutName = 'W' OR cCutName = 'P'
*!*				cCutTolerence = " "+ParseCutOptionsTol(Quotes.CutOptions)+" "
*!*			ENDIF
*!*		ENDIF
	**

	****************************************************************************
	PRIVATE nUnitP,cUnit, nTotalP, nUnitQty
	nUnitP = 0
	cUnit = ''

	nTotalP = 0
	nUnitQty = 0

	*TRY PU Accounting Standard
	PRIVATE nQ_PU, nQ_P, nQ_TY, cPULabel 
	nQ_PU 	= PrepareSQLnum(Quote21.PU,'Q_PU',-1)
	nQ_P	= PrepareSQLnum(Quote21.Q_P,'Q_P',-3)
	nQ_QTY	= PrepareSQLnum(Quote21.Q_QTY,'Q_QTY',-3)
	cPULabel = Get_Label_from_nPU(nQ_PU, nConn)  &&gnConnHandle  &&uses SQL return CHAR(7) 'Pounds,Feet,Peices..

	cUnit = get_Unit_PU(nQ_PU, nConn)  &&gnConn
	cUnit = SUBSTR(cUnit,2,3)		&&Remove '$'

	IF nQ_PU > 0 AND nQ_QTY > 0
		*cUnit = get_Unit_PU(nQ_PU, gnConnHandle) nConn
		*cZAmount = "Price $"+LTRIM(STR(nQ_P,8,2))+' '+cUnit
		nUnitP = nQ_P
		nTotalP = nQ_QTY * nQ_P	&&do otherP get added here?
		nUnitQty = nQ_QTY 
	ENDIF
	*************


	IF Quote21.LBS=1
		m.MsgNoteHTML = m.MsgNoteHTML +[<strong>]+Remove0(Quote21.LBS,10,1,.F.)+" Estimated Pound"+[</strong>]+[<br />]
	ENDIF
	IF Quote21.LBS>1
		m.MsgNoteHTML = m.MsgNoteHTML +[<strong>]+Remove0(Quote21.LBS,10,1,.F.)+" Estimated Pounds"+[</strong>]+[<br />]
	ENDIF
	
	*************
	m.MsgNoteHTML = m.MsgNoteHTML +"Units:"+Remove0(nQ_QTY,10,2)
	m.MsgNoteHTML = m.MsgNoteHTML +" " +cPULabel 
	m.MsgNoteHTML = m.MsgNoteHTML +[<br />]


	*m.MsgNoteHTML = m.MsgNoteHTML +[<strong>]+"Price $"+Remove0(nQ_P,12,4,.T.)+" "+cUnit+[</strong>]
	m.MsgNoteHTML = m.MsgNoteHTML +[<strong>]+"Price $"+Remove0(nQ_P,12,2,.T.)+" "+cUnit+[</strong>]

	***
	IF LEN(Quote21.OtherP) > 0

			IF "ADDITIONAL CHARGE" $ UPPER(Quote21.OtherP)
				m.MsgNoteHTML = m.MsgNoteHTML +[<br />]+"Additional charge "
			ENDIF
			m.MsgNoteHTML = m.MsgNoteHTML +[<br />]+[<strong>]+" "+Quote21.OtherP+[</strong>]
		
	ENDIF


	IF Quote21.Regret
		m.MsgNoteHTML = m.MsgNoteHTML +[<br />]+[<strong>]+"Regret, not able to quote."+[</strong>]
	ENDIF
	IF Quote21.Services
		m.MsgNoteHTML = m.MsgNoteHTML +[<br />]+[<strong>]+"Service Only"+[ <br />]+"No material cost involved."+[</strong>]
	ENDIF

	m.MsgNoteHTML = m.MsgNoteHTML +[</td>]
	
	nRunningTotal = nRunningTotal + Quote21.TotalP
	m.MsgNoteHTML = m.MsgNoteHTML +[</tr>]
	
ENDSCAN

*QuoteTerms.SumTotal	&&14
IF QuoteTerms.SumTotal
*	m.MsgNoteHTML = m.MsgNoteHTML +[<tr>]
*	m.MsgNoteHTML = m.MsgNoteHTML +[<td></td>]
*	m.MsgNoteHTML = m.MsgNoteHTML +[<td></td>]
*	m.MsgNoteHTML = m.MsgNoteHTML +[<td class="styleRightAlign"></td>]
*	m.MsgNoteHTML = m.MsgNoteHTML +[<td style="border-width: medium; border-top-style: solid"><strong>Quote Total</strong></td>]
*	m.MsgNoteHTML = m.MsgNoteHTML +[<td class="styleRightAlign" style="border-width: medium; border-top-style: solid"><strong>]+Remove0(nRunningTotal,12,4,.T.)+[</strong></td>]
*	m.MsgNoteHTML = m.MsgNoteHTML +[</tr>]
ENDIF
m.MsgNoteHTML = m.MsgNoteHTML +[</table>]

IF USED('Quotes')
	SELECT Quotes
ENDIF


m.MsgNoteHTML = m.MsgNoteHTML +[<br />]

*                  1            2             3           4           5          6         7       8        9       10         11         12         13          14         15        16         17 
*QuoteTerms FREE (terms C(254),PriorSale L, FedEx_Exp L, CCards L, USDollars L, CutPack L, FOBT L, FOBW L, FOBEXW L,EXW C(254),Survey L, AdvWJet L, HDPlasma L, SumTotal L, DFARS L, DOMESTIC L, RFQ C(254))

*forms\quoteterms.scx --Match changes here
IF QuoteTerms.FOBW	&&7
	m.MsgNoteHTML = m.MsgNoteHTML +[<p>* FOB: Windfall, IN 46076</p>]
ENDIF
IF QuoteTerms.FOBT 	&&8
	m.MsgNoteHTML = m.MsgNoteHTML +[<p>* FOB: Tipton, IN 46072</p>]
ENDIF
IF QuoteTerms.FOBEXW 	&&9
	PRIVATE cEXW
	cEXW = ALLTRIM( PrepareSQLtxt( QuoteTerms.EXW,'EXW',254) )
	m.MsgNoteHTML = m.MsgNoteHTML +[<p>* FCA HPA Dock: ]+cEXW+[</p>]
ENDIF

*QuoteTerms.Terms	&&1	
m.MsgNoteHTML = m.MsgNoteHTML +[<p><strong> ]+" "+ALLTRIM(QuoteTerms.Terms)+[</strong></p>]

*QuoteTerms.PriorSale 	&&2
IF QuoteTerms.PriorSale 
	m.MsgNoteHTML = m.MsgNoteHTML +[<p>* All material is subject to prior sales. </p>]
ENDIF
*QuoteTerms.FedEx_Exp 	&&3 *forms\quoteterms.scx --Match changes here
IF QuoteTerms.FedEx_Exp 
	m.MsgNoteHTML = m.MsgNoteHTML +[<p>Ask us to ship via FedEx Express for further savings.</p>]
ENDIF
*QuoteTerms.USDollars 	&&5
IF QuoteTerms.USDollars 
	m.MsgNoteHTML = m.MsgNoteHTML +[<p>* Funds are in US Dollars, to be paid on a US Bank. </p>]
ENDIF
*QuoteTerms.CutPack 	&&6
IF QuoteTerms.CutPack 
	m.MsgNoteHTML = m.MsgNoteHTML +[<p>* Prices include cutting and packaging for shipment. </p>]
ENDIF
*QuoteTerms.CCards 	&&4  *forms\quoteterms.scx --Match changes here
IF QuoteTerms.CCards 
*	m.MsgNoteHTML = m.MsgNoteHTML +[<p><strong> VISA and MASTERCARD accepted. </strong></p>]
*	m.MsgNoteHTML = m.MsgNoteHTML +[<p><strong> VISA, MASTERCARD and AMEX accepted. ($5,000) </strong></p>]
*	m.MsgNoteHTML = m.MsgNoteHTML +[<p><strong> Credit cards accepted under $5,000.  </strong></p>]
	m.MsgNoteHTML = m.MsgNoteHTML +[<p>* Credit cards can be accepted.  Any payment made by credit card will incur a 4% fee calculated on the invoice total.  </p>]
	m.MsgNoteHTML = m.MsgNoteHTML +[<p>* WIRE / ACH payments are preferred. </p>]
ENDIF
*QuoteTerms.DFARS	&&15
IF QuoteTerms.DFARS
	m.MsgNoteHTML = m.MsgNoteHTML +[<p><strong>* DFARS. </strong></p>]
ENDIF
*QuoteTerms.DOMESTIC	&&16
IF QuoteTerms.DOMESTIC
	m.MsgNoteHTML = m.MsgNoteHTML +[<p><strong>* USA DOMESTIC. </strong></p>]
ENDIF

m.MsgNoteHTML = m.MsgNoteHTML +[<p>* All LTL and parcel freight packages:  ]
m.MsgNoteHTML = m.MsgNoteHTML +[HPA is adding insurance to pre-pay and add shipments to cover lost or damaged shipments.  ]
m.MsgNoteHTML = m.MsgNoteHTML +[This insurance fee of .2% (of the invoice amount) will be added to the invoice.  ]
m.MsgNoteHTML = m.MsgNoteHTML +[<strong>If you do not want full coverage please state your decline of coverage on your purchase order.  </strong></p>]
m.MsgNoteHTML = m.MsgNoteHTML +[<p><b>* The customer will assume full ownership/responsibility for material leaving our dock if this fee is waived. </b></p>]
m.MsgNoteHTML = m.MsgNoteHTML +[<p>* We require a resale certificate on file for all domestic customers; ]
m.MsgNoteHTML = m.MsgNoteHTML +[please email your resale certificate to RESALECERTS@SpaceAlloysUSA.com </p>]
m.MsgNoteHTML = m.MsgNoteHTML +[<p><strong>* You must tell us at the time of purchase if any communications or documents contain ]
m.MsgNoteHTML = m.MsgNoteHTML +[Federal Contract Information (FCI) as defined by the United States Govt ]
m.MsgNoteHTML = m.MsgNoteHTML +[(https://www.acquisition.gov/far/52.204-21).</strong></p>]
m.MsgNoteHTML = m.MsgNoteHTML +[<p><strong>* We do NOT accept any form of Controlled Unclassified Information (CUI).</strong></p>]
m.MsgNoteHTML = m.MsgNoteHTML +[<p><strong>* Any PO received associated with this quote for material ]
m.MsgNoteHTML = m.MsgNoteHTML +[or services is an affirmation that further communications and/or documentation ]
m.MsgNoteHTML = m.MsgNoteHTML +[do not contain FCI or CUI unless stated otherwise.</strong></p>]

*2019 m.MsgNoteHTML = m.MsgNoteHTML +[<p><b> LTL Shipping: HPA will add excess value or insurance to these pre-pay and add shipments where the carrier maximum liability does not cover lost or damaged shipments. </b>]
*2019 m.MsgNoteHTML = m.MsgNoteHTML +[<b> If you do not want full coverage please state your decline of coverage on your purchase order. </b>]
*m.MsgNoteHTML = m.MsgNoteHTML +[<b> You will then be responsible for any balanced owed on the order after payment by carrier on a claim. </b>]
m.MsgNoteHTML = m.MsgNoteHTML +[</p>]

m.MsgNoteHTML = m.MsgNoteHTML +[<p></p><p><b>Thank you for the opportunity to quote. </b></p>]

*QuoteTerms.Survey 	&&11
IF QuoteTerms.Survey 
	*m.MsgNoteHTML = m.MsgNoteHTML +[<p><a href="https://www.SpaceAlloysUSA.com/contact/quote_survey.html">Survey</a> Please leave an anonymous comment.</p>]
	m.MsgNoteHTML = m.MsgNoteHTML +Create_Survey_Quote_Assignment(cInqNumP,nConn)
ENDIF
*QuoteTerms.AdvWJet &&12 *forms\quoteterms.scx --Match changes here
IF QuoteTerms.AdvWJet 
	m.MsgNoteHTML = m.MsgNoteHTML +[<p><strong><em> Ask us to quote your close tolerance dynamic water jet cuts. </em></strong></p>]
ENDIF
*QuoteTerms.HDPlasma &&13
IF QuoteTerms.HDPlasma 
	m.MsgNoteHTML = m.MsgNoteHTML +[<p><strong><em> Ask HPA to quote High Definition Plasma cuts. </em></strong></p>]
ENDIF
*QuoteTerms.RFQ	&&17
IF NOT EMPTY(QuoteTerms.RFQ)
	m.MsgNoteHTML = m.MsgNoteHTML +[<p><strong> RFQ: ]+QuoteTerms.RFQ+[</strong></p>]
ENDIF

*********************************************************
m.MsgNoteHTML = m.MsgNoteHTML  +[<p> Online Documentation: <a href="https://www.SpaceAlloysUSA.com/docs/FM-74-21%20Sales%20Terms%20and%20Conditions.pdf">Sales Terms & Conditions</a></p>]
m.MsgNoteHTML = m.MsgNoteHTML  +[<br />]
*********************************************************
m.MsgNoteHTML = m.MsgNoteHTML + [<br />]+"Report Form: CreateHTML_Quote()"+[<br />]
m.MsgNoteHTML = m.MsgNoteHTML + CreateHTML_Quote_Footer(cEmailTO)
*********************************************************
m.MsgNoteHTML = m.MsgNoteHTML+[</body>]
m.MsgNoteHTML = m.MsgNoteHTML+[</html>]


PRIVATE cFile
IF "\MEM" $ SYS(2003)
	cFile = (SYS(5)+SYS(2003) +"\Quote.HTML")
ELSE
	cFile = (SYS(5)+SYS(2003) +"\MEM\Quote.HTML")
ENDIF
IF FILE(cFile)
	DELETE FILE cFile
ENDIF

PRIVATE nFileNum
nFileNum = FCREATE( cFile )
FWRITE( nFileNum, m.MsgNoteHTML )
FCLOSE(nFileNum)


PRIVATE loHyperlink 
loHyperlink = CREATEOBJECT("Hyperlink")
loHyperlink.NavigateTo(cFile)
RELEASE loHyperlink 

IF lNewConn 
	SQLDISCONNECT(nConn )
ENDIF

RETURN m.MsgNoteHTML
ENDPROC 

****************************************	

PROCEDURE CreateHTML_VendorPOConf 
PARAMETERS nHPAPO, nConn
*Returns HTML to Email to Vendor to Confirm Receipt of PO

IF VARTYPE(nHPAPO) != "N"
	RETURN 
ENDIF

*IF EMPTY(email)
*	=MESSAGEBOX('Addresse table does not have Email address.',16,'No Email address')
*	RETURN 
*ENDIF

IF VARTYPE(nConn) != "N"
	RETURN 
ENDIF

nConn = CheckSQLConnection(nConn)
PRIVATE cAlias 
cAlias = ALIAS()

IF USED('tmpPOConf')
	USE IN tmpPOConf
ENDIF

SELECT 0
PRIVATE cSQL, nSQLEXEC
cSQL = "SELECT Company,Alloy,Form,CC,Pieces,Thck,Sz2,Sz3,RandLen,DispAlloy,Due_Min,Due_Max,POshipaddr,ContactID,SalesP,POSalesP "
*cSQL = cSQL + ",dbo.f_ItemDescriptionMetric(Form,Thck,SZ2,SZ3,Order_Qty,RandLen,Metric,Sz1orig,Sz2orig,Sz3orig) AS ItemDescription "
cSQL = cSQL + ",dbo.f_ItemDescription(Form,Thck,Sz2,Sz3,Order_Qty,RandLen) AS ItemDescription,CAST(CONVERT(datetime,OrderDate) as int) AS OrderInt,VendCode "
cSQL = cSQL + ",POitem,Cond_Spec,Misc_Purch,Amendment"
*cSQL = cSQL + ",P_Lb,P_Pc,P_Ft,LotP"
cSQL = cSQL + ",OtherP,OtherFld, Order_Qty,Order_PU,Order_P"
*cSQL = cSQL + ",StockLst_QTY,StockLst_P,StockLst_PU,StockLst_Total"
cSQL = cSQL + ",SalesNum,ShipVia,OrderDate,JobNumber,Terms,FOB,ShipWhere"
cSQL = cSQL + " FROM dbo.PurchaseOrder "
cSQL = cSQL + " WHERE HPAPO = "+STR(nHPAPO)+""
cSQL = cSQL + " ORDER BY POitem"

nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpPOConf')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPOConf' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPOConf")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPOConf")

		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpPOConf' )
	RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
ENDIF

IF USED('tmpPOConf')
	IF NOT EOF('tmpPOConf')
		*Good!
	ELSE
		MESSAGEBOX("Could not Retrieve SO",16,"SQL Error")
		RETURN 	
	ENDIF
ELSE
	MESSAGEBOX("Could not Retrieve SO",16,"SQL Error")
	RETURN 
ENDIF

SELECT 'tmpPOConf'
PRIVATE m.MsgNoteHTML, m.MsgHeader

PRIVATE cPOName, cPOCompany, nPOshipAddr, cPOEmail, cPOPhone, cPOFax, cSalesRep, nAdmendment
PRIVATE nShipWhere, cAddrWhich, cHpaPhone, cHpaFax, cHpaCountry, cLogoImg, cWebsiteHtml
cPOName		= tmpPOConf.POSalesP
cPOCompany	= tmpPOConf.Company
nPOshipAddr = IIF(ISNULL(tmpPOConf.POshipAddr), 0, INT(VAL(TRANSFORM(tmpPOConf.POshipAddr))))
nShipWhere	= IIF(ISNULL(tmpPOConf.ShipWhere), 0, INT(VAL(TRANSFORM(tmpPOConf.ShipWhere))))
cPOEmail	= ""
cPOPhone	= ""
cPOFax		= ""
cSalesRep	= ""
nAdmendment	= IIF(ISNULL(tmpPOConf.Amendment), 0, INT(VAL(TRANSFORM(tmpPOConf.Amendment))))
TRY
	cPOEmail = VendorContactEmail_ContactID(tmpPOConf.ContactID)
	cPOPhone = VendorContactPhone_ContactID(tmpPOConf.ContactID)
	cPOFax = VendorContactFax_ContactID(tmpPOConf.ContactID)
CATCH
ENDTRY
TRY
	cSalesRep = AppSetup_Get_SalesRep_SalesP(tmpPOConf.SalesP)
CATCH
ENDTRY

IF NOT "COMPANY_BRANDING" $ UPPER(SET("PROCEDURE"))
	IF FILE("PROGS\company_branding.prg")
		SET PROCEDURE TO PROGS\company_branding.prg ADDITIVE
	ENDIF
ENDIF
IF NOT "COMPANY_REPORT" $ UPPER(SET("PROCEDURE"))
	IF FILE("REPORTS\company_report.prg")
		SET PROCEDURE TO REPORTS\company_report.prg ADDITIVE
	ENDIF
ENDIF

cAddrWhich = CompanyReport_WhichFromPO(nShipWhere, nPOshipAddr)
cHpaPhone = CompanyReport_NzText(CompanyReport_AddrPhone(cAddrWhich))
cHpaFax = CompanyReport_NzText(CompanyReport_AddrFax(cAddrWhich))
cHpaCountry = CompanyReport_NzText(CompanyReport_AddressField(cAddrWhich, "Country"))
IF EMPTY(cHpaCountry)
	cHpaCountry = "United States of America"
ENDIF
cLogoImg = CompanyBranding_ReportLogoHtmlImg(69)
cWebsiteHtml = CompanyReport_WebsiteHtml()

* Vendor To: address (same source as purchaseorder14.frx VendorContact.*)
PRIVATE cVendAddr1, cVendAddr2, cVendCity, cVendST, cVendZip, cVendCountry
PRIVATE cVendPhoneFmt, cVendFaxFmt
cVendAddr1 = ""
cVendAddr2 = ""
cVendCity = ""
cVendST = ""
cVendZip = ""
cVendCountry = ""
cVendPhoneFmt = CompanyReport_PhoneMask(cPOPhone)
cVendFaxFmt = CompanyReport_PhoneMask(cPOFax)
IF USED("tmpPOVendAddr")
	USE IN tmpPOVendAddr
ENDIF
IF PrepareSQLnum(tmpPOConf.ContactID,'ContactID',-3) > 0
	PRIVATE cSQLVA, nSQLVA
	cSQLVA = "SELECT Addr1, Addr2, City, ST, Zip, Country, Phone, Fax FROM dbo.VendorContact WITH (NOLOCK) "
	cSQLVA = cSQLVA + " WHERE ContactID = " + ALLTRIM(STR(tmpPOConf.ContactID))
	nSQLVA = SQLEXEC(nConn, cSQLVA, "tmpPOVendAddr")
	IF nSQLVA > 0 AND USED("tmpPOVendAddr") AND RECCOUNT("tmpPOVendAddr") > 0
		SELECT tmpPOVendAddr
		cVendAddr1 = CompanyReport_NzText(tmpPOVendAddr.Addr1)
		cVendAddr2 = CompanyReport_NzText(tmpPOVendAddr.Addr2)
		cVendCity = CompanyReport_NzText(tmpPOVendAddr.City)
		cVendST = CompanyReport_NzText(tmpPOVendAddr.ST)
		cVendZip = CompanyReport_NzText(tmpPOVendAddr.Zip)
		cVendCountry = CompanyReport_NzText(tmpPOVendAddr.Country)
		IF !EMPTY(CompanyReport_NzText(tmpPOVendAddr.Phone))
			cVendPhoneFmt = CompanyReport_PhoneMask(tmpPOVendAddr.Phone)
		ENDIF
		IF !EMPTY(CompanyReport_NzText(tmpPOVendAddr.Fax))
			cVendFaxFmt = CompanyReport_PhoneMask(tmpPOVendAddr.Fax)
		ENDIF
		USE IN tmpPOVendAddr
	ENDIF
ENDIF
* Fallback to Vendor address when contact address is empty
IF EMPTY(cVendAddr1) AND EMPTY(cVendCity) AND PrepareSQLnum(tmpPOConf.VendCode,'VendCode',-3) > 0
	IF USED("tmpPOVendHdr")
		USE IN tmpPOVendHdr
	ENDIF
	cSQLVA = "SELECT Addr1, Addr2, City, ST, Zip, Country, telephone FROM dbo.Vendor WITH (NOLOCK) "
	cSQLVA = cSQLVA + " WHERE VendCode = " + ALLTRIM(STR(tmpPOConf.VendCode))
	nSQLVA = SQLEXEC(nConn, cSQLVA, "tmpPOVendHdr")
	IF nSQLVA > 0 AND USED("tmpPOVendHdr") AND RECCOUNT("tmpPOVendHdr") > 0
		SELECT tmpPOVendHdr
		cVendAddr1 = CompanyReport_NzText(tmpPOVendHdr.Addr1)
		cVendAddr2 = CompanyReport_NzText(tmpPOVendHdr.Addr2)
		cVendCity = CompanyReport_NzText(tmpPOVendHdr.City)
		cVendST = CompanyReport_NzText(tmpPOVendHdr.ST)
		cVendZip = CompanyReport_NzText(tmpPOVendHdr.Zip)
		cVendCountry = CompanyReport_NzText(tmpPOVendHdr.Country)
		IF EMPTY(cVendPhoneFmt) AND !EMPTY(CompanyReport_NzText(tmpPOVendHdr.telephone))
			cVendPhoneFmt = CompanyReport_PhoneMask(tmpPOVendHdr.telephone)
		ENDIF
		USE IN tmpPOVendHdr
	ENDIF
ENDIF
SELECT tmpPOConf

m.MsgHeader = ''
m.MsgHeader = m.MsgHeader +"<!DOCTYPE html> " &&trigger in Send_HTML_Email
m.MsgHeader = m.MsgHeader +"<html>"
m.MsgHeader = m.MsgHeader +"<head>"
m.MsgHeader = m.MsgHeader +"<title>Purchase Order Confirmation</title>"
m.MsgHeader = m.MsgHeader +[<style type="text/css">]
m.MsgHeader = m.MsgHeader +".styleRightAlign{text-align: right;}"
m.MsgHeader = m.MsgHeader +".styleTableHeadersRow{background-color: #D1EAF1;color: #000000;}"
m.MsgHeader = m.MsgHeader +[.styleTextAlignCenter{text-align: center;}]
m.MsgHeader = m.MsgHeader +[.auto-style1 {background-color: #FFFF66;}]
m.MsgHeader = m.MsgHeader +[.styleFullWidth { width: 100%;}]
m.MsgHeader = m.MsgHeader +[.stylePOitem { width: 126px;}]
m.MsgHeader = m.MsgHeader +[.styleAlloy { width: 308px;}]
m.MsgHeader = m.MsgHeader +[.coHdr { font-family: Arial, Helvetica, sans-serif; }]
m.MsgHeader = m.MsgHeader +[.coHdrPhone { font-family: Arial, Helvetica, sans-serif; font-size: 10pt; font-weight: bold; }]
m.MsgHeader = m.MsgHeader +[.poAddr { font-family: "Courier New", Courier, monospace; font-size: 10pt; font-weight: bold; }]
m.MsgHeader = m.MsgHeader +[.poAddrLbl { font-family: "Courier New", Courier, monospace; font-size: 10pt; font-weight: bold; vertical-align: top; }]
m.MsgHeader = m.MsgHeader +"</style>"
m.MsgHeader = m.MsgHeader +"</head>"
m.MsgHeader = m.MsgHeader +"<body>"
m.MsgHeader = m.MsgHeader +"<header>"
* Same look as purchaseorder14.frx: logo | company name + PHONE/FAX/Email | PO# box
m.MsgHeader = m.MsgHeader +[<table class="coHdr" style="border: thin none #000000; width: 540pt; ">]
m.MsgHeader = m.MsgHeader +"<tr>"
m.MsgHeader = m.MsgHeader +[<td style="width: 150pt; vertical-align: top;">]
IF !EMPTY(cLogoImg)
	m.MsgHeader = m.MsgHeader + cLogoImg
ELSE
	m.MsgHeader = m.MsgHeader +[&nbsp;]
ENDIF
m.MsgHeader = m.MsgHeader +[</td>]
m.MsgHeader = m.MsgHeader +[<td style="width: 230pt; vertical-align: top; text-align: center;">]
m.MsgHeader = m.MsgHeader +[<div style="font-size: 16pt; font-weight: bold;">]+CompanyReport_HtmlSafe(CompanyReport_Name())+[</div>]
m.MsgHeader = m.MsgHeader +[<div class="coHdrPhone" style="margin-top: 4pt;">]
IF !EMPTY(CompanyReport_PoHeaderPhone())
	m.MsgHeader = m.MsgHeader + CompanyReport_HtmlSafe(CompanyReport_PoHeaderPhone()) + [<br />]
ENDIF
IF !EMPTY(CompanyReport_PoHeaderFax())
	m.MsgHeader = m.MsgHeader + CompanyReport_HtmlSafe(CompanyReport_PoHeaderFax()) + [<br />]
ENDIF
IF !EMPTY(CompanyReport_PoHeaderEmail())
	m.MsgHeader = m.MsgHeader +[<span style="font-weight: normal;">]+CompanyReport_HtmlSafe(CompanyReport_PoHeaderEmail())+[</span><br />]
ENDIF
m.MsgHeader = m.MsgHeader +[</div>]
m.MsgHeader = m.MsgHeader +[</td>]
m.MsgHeader = m.MsgHeader +[<td style="width: 140pt; text-align: center; vertical-align: top;">]
m.MsgHeader = m.MsgHeader +[<div style="border: 1px solid #000000; padding: 4pt 6pt;">]
m.MsgHeader = m.MsgHeader +[<div style="font-size: 11pt; font-weight: bold;">PURCHASE ORDER</div>]
m.MsgHeader = m.MsgHeader +[<hr style="border: none; border-top: 1px solid #000000; margin: 4pt 0;" />]
* Same PO# expression as purchaseorder14.frx: HpaPo-SalesNum+SalesP
PRIVATE cPoNumDisp, cSalesPDisp, nSalesNumHdr
cSalesPDisp = CompanyReport_NzText(tmpPOConf.SalesP)
nSalesNumHdr = IIF(ISNULL(tmpPOConf.SalesNum), 0, tmpPOConf.SalesNum)
cPoNumDisp = ALLTRIM(STR(nHPAPO)) + [-] + ALLTRIM(STR(nSalesNumHdr)) + cSalesPDisp
m.MsgHeader = m.MsgHeader +[<div style="font-size: 14pt; font-weight: bold; font-family: 'Courier New', Courier, monospace;">]+CompanyReport_HtmlSafe(cPoNumDisp)+[</div>]
IF nAdmendment>0
	m.MsgHeader = m.MsgHeader +[<div style="font-size: 10pt; font-weight: bold;">Amendment ]+ALLTRIM(STR(nAdmendment))+[</div>]
ENDIF
m.MsgHeader = m.MsgHeader +[</div>]
m.MsgHeader = m.MsgHeader +[</td>]
m.MsgHeader = m.MsgHeader +[</tr>]
m.MsgHeader = m.MsgHeader +[</table>]
m.MsgHeader = m.MsgHeader +[</header>]
m.MsgHeader = m.MsgHeader +[<br />]
* To: | Ship to: | Send Bill: ? Courier New like purchaseorder14.frx
m.MsgHeader = m.MsgHeader +[<table style="border: thin none #000000; width: 540pt; ">]
m.MsgHeader = m.MsgHeader +[<tr>]
* --- To: (vendor / VendorContact) ---
m.MsgHeader = m.MsgHeader +[<td class="poAddrLbl" style="width: 28pt;">To:</td>]
m.MsgHeader = m.MsgHeader +[<td class="poAddr" style="width: 155pt; vertical-align: top;">]
cPOCompany = CompanyReport_NzText(PrepareSQLtxt(cPOCompany,'Company',100))
cPOName = CompanyReport_NzText(PrepareSQLtxt(cPOName,'Name',50))
cPOEmail = CompanyReport_NzText(PrepareSQLtxt(cPOEmail,'email',60))
IF !EMPTY(cPOCompany)
	m.MsgHeader = m.MsgHeader + CompanyReport_HtmlSafe(cPOCompany) + [<br />]
ENDIF
IF !EMPTY(cVendAddr1)
	m.MsgHeader = m.MsgHeader + CompanyReport_HtmlSafe(cVendAddr1) + [<br />]
ENDIF
IF !EMPTY(cVendAddr2)
	m.MsgHeader = m.MsgHeader + CompanyReport_HtmlSafe(cVendAddr2) + [<br />]
ENDIF
PRIVATE cVendCityLine
* Match FRX: city+", "+st+" "+zip+" "+country (spaces, not commas before country)
cVendCityLine = ALLTRIM(cVendCity)
IF !EMPTY(cVendST)
	cVendCityLine = ALLTRIM(cVendCityLine + IIF(EMPTY(cVendCityLine), "", ", ") + cVendST)
ENDIF
IF !EMPTY(cVendZip)
	cVendCityLine = ALLTRIM(cVendCityLine + IIF(EMPTY(cVendCityLine), "", " ") + cVendZip)
ENDIF
IF !EMPTY(cVendCountry)
	cVendCityLine = ALLTRIM(cVendCityLine + IIF(EMPTY(cVendCityLine), "", " ") + cVendCountry)
ENDIF
IF !EMPTY(cVendCityLine)
	m.MsgHeader = m.MsgHeader + CompanyReport_HtmlSafe(cVendCityLine) + [<br />]
ENDIF
IF !EMPTY(cVendPhoneFmt)
	m.MsgHeader = m.MsgHeader +[Phone:]+CompanyReport_HtmlSafe(cVendPhoneFmt)+[<br />]
ENDIF
IF !EMPTY(cVendFaxFmt)
	m.MsgHeader = m.MsgHeader +[Fax:]+CompanyReport_HtmlSafe(cVendFaxFmt)+[<br />]
ENDIF
IF !EMPTY(cPOEmail)
	m.MsgHeader = m.MsgHeader +[Email:]+CompanyReport_HtmlSafe(cPOEmail)+[<br />]
ENDIF
IF !EMPTY(cPOName)
	m.MsgHeader = m.MsgHeader +[Sales Person: ]+CompanyReport_HtmlSafe(cPOName)+[<br />]
ENDIF
m.MsgHeader = m.MsgHeader +[</td>]
* --- Ship to: Company Profile ShipTo* ---
m.MsgHeader = m.MsgHeader +[<td class="poAddrLbl" style="width: 50pt;">Ship to:</td>]
m.MsgHeader = m.MsgHeader +[<td class="poAddr" style="width: 140pt; vertical-align: top; border-right: 1px solid #000000; padding-right: 6pt;">]
m.MsgHeader = m.MsgHeader + CompanyReport_HtmlAddrBlock("SHIP")
m.MsgHeader = m.MsgHeader +[</td>]
* --- Send Bill: Company Profile BillTo* ---
m.MsgHeader = m.MsgHeader +[<td class="poAddrLbl" style="width: 58pt; padding-left: 6pt;">Send Bill:</td>]
m.MsgHeader = m.MsgHeader +[<td class="poAddr" style="width: 140pt; vertical-align: top;">]
m.MsgHeader = m.MsgHeader + CompanyReport_HtmlAddrBlock("BILL")
m.MsgHeader = m.MsgHeader +[</td>]
m.MsgHeader = m.MsgHeader +[</tr>]
m.MsgHeader = m.MsgHeader +[</table>]
m.MsgHeader = m.MsgHeader +[<br />]

m.MsgNoteHTML = m.MsgHeader
********************************
*Sub Header: 
PRIVATE nSalesNum,cShipVia,dOrderDate,cJobNumber,cTerms,cFOB
SELECT tmpPOConf
nSalesNum	= IIF(ISNULL(tmpPOConf.SalesNum), 0, INT(VAL(TRANSFORM(tmpPOConf.SalesNum))))
cShipVia	= CompanyReport_NzText(tmpPOConf.ShipVia)
DO CASE
CASE VARTYPE(tmpPOConf.OrderDate) = "T"
	dOrderDate = TTOD(tmpPOConf.OrderDate)
CASE VARTYPE(tmpPOConf.OrderDate) = "D"
	dOrderDate = tmpPOConf.OrderDate
OTHERWISE
	dOrderDate = {}
ENDCASE
* Use EVALUATE so PRIVATE/field name collisions cannot blank JobNumber
cJobNumber	= ALLTRIM(NVL(EVALUATE("tmpPOConf.JobNumber"), ""))
IF UPPER(cJobNumber) == "NULL" OR cJobNumber == ".NULL."
	cJobNumber = ""
ENDIF
cTerms	= CompanyReport_NzText(tmpPOConf.Terms)
cFOB	= CompanyReport_NzText(tmpPOConf.FOB)

* Info bar - purchaseorder14.frx: HPA / Ship Via | Order Date / Job Number (Courier)
m.MsgNoteHTML = m.MsgNoteHTML +[<table style="border-style: double; border-width: 3pt; border-color: #000000; width: 540pt; font-family: 'Courier New', Courier, monospace; font-size: 10pt; font-weight: bold;">]
m.MsgNoteHTML = m.MsgNoteHTML +[<tr>]
m.MsgNoteHTML = m.MsgNoteHTML +[<td style="width: 270pt; vertical-align: top; padding: 3pt 6pt;">]
m.MsgNoteHTML = m.MsgNoteHTML +[HPA: ]
IF nSalesNum > 0
	m.MsgNoteHTML = m.MsgNoteHTML + ALLTRIM(STR(nSalesNum))
ENDIF
m.MsgNoteHTML = m.MsgNoteHTML +[</td>]
m.MsgNoteHTML = m.MsgNoteHTML +[<td style="width: 270pt; vertical-align: top; padding: 3pt 6pt;">]
m.MsgNoteHTML = m.MsgNoteHTML +[Ship Via: ]+CompanyReport_HtmlSafe(ALLTRIM(EVL(cShipVia, "")))
m.MsgNoteHTML = m.MsgNoteHTML +[</td>]
m.MsgNoteHTML = m.MsgNoteHTML +[</tr>]
m.MsgNoteHTML = m.MsgNoteHTML +[<tr>]
m.MsgNoteHTML = m.MsgNoteHTML +[<td style="vertical-align: top; padding: 3pt 6pt;">]
m.MsgNoteHTML = m.MsgNoteHTML +[Order Date: ]+DTOC(dOrderDate)
m.MsgNoteHTML = m.MsgNoteHTML +[</td>]
m.MsgNoteHTML = m.MsgNoteHTML +[<td style="vertical-align: top; padding: 3pt 6pt;">]
m.MsgNoteHTML = m.MsgNoteHTML +[Job Number: ]+CompanyReport_HtmlSafe(cJobNumber)
m.MsgNoteHTML = m.MsgNoteHTML +[</td>]
m.MsgNoteHTML = m.MsgNoteHTML +[</tr>]
m.MsgNoteHTML = m.MsgNoteHTML +[</table>]
IF NOT EMPTY(cTerms) OR NOT EMPTY(cFOB)
	m.MsgNoteHTML = m.MsgNoteHTML +[<div style="font-family: 'Courier New', Courier, monospace; font-size: 10pt; font-weight: bold; margin-top: 4pt;">]
	IF NOT EMPTY(cTerms)
		m.MsgNoteHTML = m.MsgNoteHTML +[Terms: ]+CompanyReport_HtmlSafe(cTerms)
	ENDIF
	IF NOT EMPTY(cFOB)
		m.MsgNoteHTML = m.MsgNoteHTML + IIF(EMPTY(cTerms), "", [&nbsp;&nbsp;]) + [FOB: ]+CompanyReport_HtmlSafe(cFOB)
	ENDIF
	m.MsgNoteHTML = m.MsgNoteHTML +[</div>]
ENDIF
m.MsgNoteHTML = m.MsgNoteHTML +[<br />]

********************************
* Confirm PO link only when Company Profile ConfirmPOUrl is set
PRIVATE cConfirmHref
cConfirmHref = CompanyReport_ConfirmPOHref(nHPAPO, PrepareSQLnum(tmpPOConf.OrderInt,'OrderInt',-3), ;
	PrepareSQLnum(tmpPOConf.VendCode,'VendCode',-3), PrepareSQLnum(tmpPOConf.ContactID,'ContactID',-3))
m.MsgNoteHTML = m.MsgNoteHTML +[<p><font color="red"> Please Confirm the receipt of this PO]
IF !EMPTY(cConfirmHref)
	m.MsgNoteHTML = m.MsgNoteHTML +[ by clicking here: </font><a href="]+cConfirmHref+[">Confirm PO receipt</a>]
ELSE
	m.MsgNoteHTML = m.MsgNoteHTML +[</font>]
ENDIF
m.MsgNoteHTML = m.MsgNoteHTML  +[<br />]
m.MsgNoteHTML = m.MsgNoteHTML +[Or reply to this Email]
m.MsgNoteHTML = m.MsgNoteHTML  +[<br />]
m.MsgNoteHTML = m.MsgNoteHTML  +[<br />]

********************************
m.MsgNoteHTML = m.MsgNoteHTML +[<table style="border-style: solid solid double solid; border-width: thin thin medium thin; border-color: #000000; width: 540pt; ">]
***********************

*Company,POshipaddr,ContactID
*m.MsgNoteHTML = m.MsgNoteHTML +[Company ]+tmpPOConf.Company+[<br />]
*m.MsgNoteHTML = m.MsgNoteHTML +[Ship Addr ]+STR(tmpPOConf.POshipaddr)+[<br />]
*m.MsgNoteHTML = m.MsgNoteHTML +[ContactID ]+STR(tmpPOConf.ContactID)+[<br />]
* Get_PUstr_from_nPU changes work area - use DO WHILE + SKIP IN tmpPOConf (not SCAN)
SELECT tmpPOConf
GO TOP
DO WHILE NOT EOF("tmpPOConf")
	*Alloy,Form,ItemDescription,CC,Pieces,thck,Sz2,Sz3,RandLen,DispAlloy,Due_Min,Due_Max
*	m.MsgNoteHTML = m.MsgNoteHTML+[<tr style="vertical-align: top">]
	m.MsgNoteHTML = m.MsgNoteHTML +[<tr class="styleTableHeadersRow">]
	m.MsgNoteHTML = m.MsgNoteHTML+[<td style="border-width: thin; border-top-style: solid">]
	

	*m.MsgNoteHTML = m.MsgNoteHTML+[<br />]
	*****************************
	m.MsgNoteHTML = m.MsgNoteHTML+[<table class="styleFullWidth">]
	m.MsgNoteHTML = m.MsgNoteHTML+[<tr>]
	m.MsgNoteHTML = m.MsgNoteHTML+[<td class="stylePOitem">]
	m.MsgNoteHTML = m.MsgNoteHTML+[<b>]+[Item:]+tmpPOConf.POitem+[</b>]+[</td>]
	m.MsgNoteHTML = m.MsgNoteHTML+[<td class="styleAlloy">]
	IF tmpPOConf.Pieces > 0
		m.MsgNoteHTML = m.MsgNoteHTML+[       ]+STR(tmpPOConf.Pieces)
		IF tmpPOConf.Pieces > 1
			m.MsgNoteHTML = m.MsgNoteHTML+[ PCs ]
		ELSE
			m.MsgNoteHTML = m.MsgNoteHTML+[ PC ]
		ENDIF
	ENDIF
	IF NOT EMPTY(tmpPOConf.DispAlloy)
		m.MsgNoteHTML = m.MsgNoteHTML + tmpPOConf.DispAlloy
		IF tmpPOConf.DispAlloy!=tmpPOConf.Alloy
			m.MsgNoteHTML = m.MsgNoteHTML+[        ]+tmpPOConf.Alloy
		ENDIF
	ELSE
		m.MsgNoteHTML = m.MsgNoteHTML+[        ]+tmpPOConf.Alloy
	ENDIF
	m.MsgNoteHTML = m.MsgNoteHTML+[     ]+FormDescription(tmpPOConf.FORM)
*	nPriceing = IIF(tmpPOConf.P_Lb >0, tmpPOConf.P_Lb, IIF(tmpPOConf.P_Pc >0, tmpPOConf.P_Pc, IIF(tmpPOConf.P_Ft >0, tmpPOConf.P_Ft, tmpPOConf.LotP)))
*	IF nPriceing > 0
*		m.MsgNoteHTML = m.MsgNoteHTML+[        ]+Remove0(nPriceing,12,4,.T.)
*	ENDIF
	*IF tmpPOConf.P_Lb+tmpPOConf.P_Pc+tmpPOConf.P_Ft+tmpPOConf.LotP > 0
	*	m.MsgNoteHTML = m.MsgNoteHTML+" $/"+IIF(tmpPOConf.P_Lb >0, "Lb", IIF(tmpPOConf.P_Pc >0, "Pc", IIF(tmpPOConf.P_Ft >0, "Ft", IIF(tmpPOConf.LotP>0,"Lot",""))))
	*ENDIF

	m.MsgNoteHTML = m.MsgNoteHTML+" " + Get_PU_Price_String(tmpPOConf.Order_PU, tmpPOConf.Order_Qty, tmpPOConf.Order_P)
	SELECT tmpPOConf
	
	m.MsgNoteHTML = m.MsgNoteHTML+[</td>]
	m.MsgNoteHTML = m.MsgNoteHTML+[<td>]
*	m.MsgNoteHTML = m.MsgNoteHTML+[ Due ]+IIF(tmpPOConf.Due_Min=CTOD('  /  /  '), IIF(tmpPOConf.Due_Max=CTOD('  /  /  '),"ASAP","By "+DTOC(Due_Max) ) , IIF(tmpPOConf.Due_Max=CTOD('  /  /  '), "Ship After "+DTOC(tmpPOConf.Due_Min), DTOC(tmpPOConf.Due_Min)+" - "+DTOC(tmpPOConf.Due_Max)) )+[<br />]
*	m.MsgNoteHTML = m.MsgNoteHTML+[ Due ]+IIF(tmpPOConf.Due_Min=CTOD('  /  /  ') OR tmpPOConf.Due_Min=CTOD('1/1/1900'), IIF(tmpPOConf.Due_Max=CTOD('  /  /  ') OR tmpPOConf.Due_Max=CTOD('1/1/1900'),"ASAP","By "+DTOC(Due_Max) ) , IIF(tmpPOConf.Due_Max=CTOD('  /  /  '), "Ship After "+DTOC(tmpPOConf.Due_Min), DTOC(tmpPOConf.Due_Min)+" - "+DTOC(tmpPOConf.Due_Max)) )+[<br />]
*	m.MsgNoteHTML = m.MsgNoteHTML+[ Due ]+IIF(tmpPOConf.Due_Min=CTOD('  /  /  ') OR tmpPOConf.Due_Min=CTOD('1/1/1900'), IIF(tmpPOConf.Due_Max=CTOD('  /  /  ') OR tmpPOConf.Due_Max=CTOD('1/1/1900'),"ASAP","By "+IIF(tmpPOConf.Due_Max=CTOD('  /  /  '),'',DTOC(tmpPOConf.Due_Max)) ) , IIF(tmpPOConf.Due_Max=CTOD('  /  /  '), "Ship After "+DTOC(tmpPOConf.Due_Min), DTOC(tmpPOConf.Due_Min)+" - "+IIF(tmpPOConf.Due_Max=CTOD('  /  /  '),'',DTOC(tmpPOConf.Due_Max))) )+[<br />]
	m.MsgNoteHTML = m.MsgNoteHTML+[ -  Due ]+IIF(tmpPOConf.Due_Min=CTOD('  /  /  ') OR DTOC(tmpPOConf.Due_Min)='01/01/00', IIF(tmpPOConf.Due_Max=CTOD('  /  /  ') OR DTOC(tmpPOConf.Due_Max)='01/01/00',"ASAP","By "+IIF(tmpPOConf.Due_Max=CTOD('  /  /  ') OR DTOC(tmpPOConf.Due_Max)='01/01/00','',DTOC(tmpPOConf.Due_Max)) ) , IIF(tmpPOConf.Due_Max=CTOD('  /  /  ') OR DTOC(tmpPOConf.Due_Max)='01/01/00', "Ship by "+DTOC(tmpPOConf.Due_Min), DTOC(tmpPOConf.Due_Min)+" - "+IIF(tmpPOConf.Due_Max=CTOD('  /  /  ') OR DTOC(tmpPOConf.Due_Max)='01/01/00','',DTOC(tmpPOConf.Due_Max))) )+[<br />]
	m.MsgNoteHTML = m.MsgNoteHTML+[</td>]
	m.MsgNoteHTML = m.MsgNoteHTML+[</tr>]
	m.MsgNoteHTML = m.MsgNoteHTML+[</table>	]
	******************************
	m.MsgNoteHTML = m.MsgNoteHTML+[</tr>]
	
	m.MsgNoteHTML = m.MsgNoteHTML+[<tr><td style="vertical-align: top">]
	IF tmpPOConf.Order_Qty > 1	&&do Not display Qty(0) or Qty(1)
		cPU_Label = Get_PUstr_from_nPU(tmpPOConf.Order_PU, nConn )
		SELECT tmpPOConf
		IF LEN(cPU_Label)>0
			m.MsgNoteHTML = m.MsgNoteHTML+"("+Remove0(tmpPOConf.Order_Qty,12,4,.F.)+" "+cPU_Label+"). "
		ELSE
			m.MsgNoteHTML = m.MsgNoteHTML+"Qty("+Remove0(tmpPOConf.Order_Qty,12,4,.F.)+") "	
		ENDIF
	ENDIF
	m.MsgNoteHTML = m.MsgNoteHTML+CHR(09)+[ ]+tmpPOConf.ItemDescription
	IF tmpPOConf.OtherP > 0
		m.MsgNoteHTML = m.MsgNoteHTML+CHR(09)+[ + $]+Remove0(tmpPOConf.OtherP,12,2,.T.)
	ENDIF

	m.MsgNoteHTML = m.MsgNoteHTML+[<br />]
	IF NOT EMPTY(tmpPOConf.Cond_Spec)
		m.MsgNoteHTML = m.MsgNoteHTML+[ ]+tmpPOConf.Cond_Spec+[<br />]
	ENDIF
	IF NOT EMPTY(tmpPOConf.Misc_Purch)
		m.MsgNoteHTML = m.MsgNoteHTML+[ ]+tmpPOConf.Misc_Purch+[<br />]
	ENDIF
	IF tmpPOConf.OtherP > 0
		m.MsgNoteHTML = m.MsgNoteHTML+[ ]+tmpPOConf.OtherFld+[ $]+Remove0(tmpPOConf.OtherP,12,2,.T.,.T.)+[<br />]
	ELSE
		IF NOT EMPTY(tmpPOConf.OtherFld)
			m.MsgNoteHTML = m.MsgNoteHTML+[ ]+tmpPOConf.OtherFld
		ENDIF
	ENDIF
	
	*nCost = IIF(tmpPOConf.P_Lb >0, tmpPOConf.P_Lb*tmpPOConf.Order_Qty, IIF(tmpPOConf.P_Pc >0, tmpPOConf.P_Pc*tmpPOConf.Order_Qty, IIF(tmpPOConf.P_Ft >0, tmpPOConf.P_Ft*tmpPOConf.Order_Qty, tmpPOConf.LotP)))
	nCost = tmpPOConf.Order_P * tmpPOConf.Order_Qty
	nCost = nCost+IIF(tmpPOConf.OtherP>0,tmpPOConf.OtherP,0)
	IF nCost>0
		m.MsgNoteHTML = m.MsgNoteHTML+[<span class="auto-style1"> Est Price $]+Remove0(nCost,12,2,.T.,.T.)+[</span>]
	ENDIF

	
	m.MsgNoteHTML = m.MsgNoteHTML +[</td>]
*	m.MsgNoteHTML = m.MsgNoteHTML +[<td style="border-width: thin; border-top-style: solid">]
*	m.MsgNoteHTML = m.MsgNoteHTML +[<br />]
*	m.MsgNoteHTML = m.MsgNoteHTML +[</td>]
	m.MsgNoteHTML = m.MsgNoteHTML +[</tr>]
	
	SELECT tmpPOConf
	SKIP IN tmpPOConf
ENDDO

m.MsgNoteHTML = m.MsgNoteHTML +[</table>]
m.MsgNoteHTML = m.MsgNoteHTML +[<br />]

*********************************************************
*PRIVATE lPrintSheetPk
IF Count_HPAPOinPurchaseOrder( nHpaPo, nConn, 'Sheet_PK' ) > 0
	m.MsgNoteHTML = m.MsgNoteHTML + HTML_PO_Sheet_Packing()
ENDIF
*********************************************************
m.MsgNoteHTML = m.MsgNoteHTML + HTML_PO_Acknow()

*********************************************************
m.MsgNoteHTML = m.MsgNoteHTML + [<br />]+"Report Form: CreateHTML_VendorPOConf()"+[<br />]
m.MsgNoteHTML = m.MsgNoteHTML + CreateHTML_Quote_Footer(cPOEmail)


*********************************************************
m.MsgNoteHTML = m.MsgNoteHTML+[</body>]
m.MsgNoteHTML = m.MsgNoteHTML+[</html>]

m.MsgNoteHTML = STRTRAN(m.MsgNoteHTML,CHR(13)+CHR(10),"<br>")
m.MsgNoteHTML = STRTRAN(m.MsgNoteHTML,CHR(10)+CHR(13),"<br>")
m.MsgNoteHTML = STRTRAN(m.MsgNoteHTML,CHR(10),"<br>")
m.MsgNoteHTML = STRTRAN(m.MsgNoteHTML,CHR(13),"<br>")

PRIVATE cFile
IF "\MEM" $ SYS(2003)
	cFile = (SYS(5)+SYS(2003) +"\PO_Conf.HTML")
ELSE
	cFile = (SYS(5)+SYS(2003) +"\MEM\PO_Conf.HTML")
ENDIF

IF FILE(cFile)
	DELETE FILE cFile
ENDIF

PRIVATE nFileNum
nFileNum = FCREATE( cFile )
FWRITE( nFileNum, m.MsgNoteHTML )
FCLOSE(nFileNum)


* Skip browser when gSkipPoConfHtmlNav is .T. (batch regen / tests)
IF TYPE("gSkipPoConfHtmlNav") # "L" OR !gSkipPoConfHtmlNav
	PRIVATE loHyperlink
	loHyperlink = CREATEOBJECT("Hyperlink")
	loHyperlink.navigateto(cFile)
	RELEASE loHyperlink
ENDIF

IF USED('tmpPOConf')
	USE IN tmpPOConf
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN m.MsgNoteHTML
ENDPROC 

*************************************

PROCEDURE HTML_PO_Sheet_Packing
PRIVATE m.cT
m.cT = [ ]+[<br />]
m.cT = m.cT + [SHEET PACKING POLICY]+[<br />]
m.cT = m.cT + [Sheet Material .125" thick or less. ]+[<br />]
m.cT = m.cT + [Space Alloys USA has established this purchase specification to ensure product delivered meets specified requirements.]+[<br />]
m.cT = m.cT + [a)  Sheet .125" (3mm) thick and under must be fully protected on top and bottom by 1/2" thick or heavier plywood or Oriented Strand Board (OSB).]+[<br />]
m.cT = m.cT + [ Bottom protection can be substituted by using skids with no open spaces between slats.  Cardboard must separate the bottom side of the sheet(s) to prevent any fasteners from scratching the product.]+[<br />]
m.cT = m.cT + [b)  Skid boards must have spacing no greater than 8" to prevent sagging of product. ]+[<br />]
m.cT = m.cT + [ ]+[<br />]
m.cT = m.cT + [Space Alloys USA has implemented this packing policy to prevent damage of sheets during transportation.  When properly packaged, damage due to loading, skid breakage and side loads can be reduced, and in most cases, eliminated.]+[<br />]
m.cT = m.cT + [ ]+[<br />]
m.cT = m.cT + [Skids or pallets received without this level of protection may be rejected whether damage is evident or not.]+[<br />]
m.cT = m.cT + [ ]+[<br />]

RETURN m.cT
ENDPROC 
*************************************

PROCEDURE HTML_PO_Acknow
PRIVATE m.cT
m.cT = [ ]+[<br />]
m.cT = m.cT+ [1. Alloy material supplied to Space Alloys USA MUST conform to the following:]+[<br />]
m.cT = m.cT+ [- Mercury Free:  The material shall not have come in contact with or have been contaminated by mercury or other low melting point metals.]+[<br />]
m.cT = m.cT+ [- No Weld:  The material shall not have been subjected to welding or weld repair.]+[<br />]
m.cT = m.cT+ [ Material test reports/certifications MUST include both "Mercury Free" and "No Weld" statements of conformance.]+[<br />]
m.cT = m.cT+ [ ]+[<br />]
m.cT = m.cT+ [2. Material test reports/certifications MUST include the following statement verbatim:]+[<br />]
m.cT = m.cT+ [ "The recording of false, fictitious, or fraudulent statements on this document may be punishable as a felony under Federal Statutes, including Federal Law Title 18, Chapter 47."]+[<br />]
m.cT = m.cT+ [ ]+[<br />]
m.cT = m.cT+ [3.  Material test reports/certifications MUST include a statement of compliance if the material alloy supplied meets the requirements of DFARS 252.225-7014 ALT. 1 "Preference for Domestic Specialty Metals."]+[<br />]
m.cT = m.cT+ [ ]+[<br />]
m.cT = m.cT+ [4.  Cut material shall meet tolerance standards specified on this purchase order or ASTM and/or ASME tolerance standards when not specified, including out-of-square, and shall allow for cleanup to the dimensions specified.]+[<br />]
m.cT = m.cT+ [ ]+[<br />]
m.cT = m.cT+ [PLEASE ACKNOWLEDGE IMMEDIATELY AND STATE WHEN YOU WILL SHIP.]+[<br />]
m.cT = m.cT+ [OUR PURCHASE ORDER NUMBER MUST APPEAR ON ALL RELATED PACKAGES AND FORMS.]+[<br />]
m.cT = m.cT+ [ ]+[<br />]
m.cT = m.cT+ [This Purchase Order and activities hereunder may be within the jurisdiction of the Department ]+[<br />]
m.cT = m.cT+ [of Energy and/or Department of Defense.  Any knowing and willful act to falsify, conceal or]+[<br />]
m.cT = m.cT+ [alter a material fact, or any false, fraudulent, or fictitious statement or representation in]+[<br />]
m.cT = m.cT+ [connection with the performance of work under this Purchase Order may be punishable in accor-]+[<br />]
m.cT = m.cT+ [dance with Federal Statutes.  Verification on-site by ]+CompanyReport_ShortName()+[ or its customer may be necessary]+[<br />]
m.cT = m.cT+ [if stated in the contract and does not absolve the vendor of the responsibility to provide]+[<br />]
m.cT = m.cT+ [acceptable product, nor preclude subsequent rejection by the customer.]+[<br />]
m.cT = m.cT+ [ ]+[<br />]
m.cT = m.cT+ [Vendor shall provide certifications demonstrating raw material traceability throughout the ]+[<br />]
m.cT = m.cT+ [supply chain and production process (i.e., full chain of custody from melt to finished product)]+[<br />]
m.cT = m.cT+ [with each shipment.  All certifications shall include the signature and title of the authorized ]+[<br />]
m.cT = m.cT+ [representative certifying conformance to all required and applicable requirements.]+[<br />]
m.cT = m.cT+ [ ]+[<br />]

RETURN m.cT
ENDPROC 

*************************************

PROCEDURE CreateHTML_Quote_Header 
PARAMETERS cInqnumP, cEmailTO

IF VARTYPE(cEmailTO) != "C"
	cEmailTO = QDBsendTo.Email
ENDIF
IF EMPTY(cEmailTO)
	MESSAGEBOX("No Email address to send to!",0+48,"Cannot Send!")
ENDIF


PRIVATE cSalesRep
cSalesRep = SalesPDescription(QDBsendTo.SalesP,'')
PRIVATE nQuotesID
nQuotesID = get_AllQuotes_No_ID(cInqnumP)
PRIVATE cRFQ
cRFQ = QuoteTerms.RFQ

PRIVATE cName, cCompany, cEmail, cPhone, cFax, nCustDisc
cName 	= ShowSQLtxt(Quotes.Name,'Name',25)
cCompany= ShowSQLtxt(Quotes.Company,'Company',30) &&Do not add a Quote to a Quote here!
cEmail	= ShowSQLtxt(Quotes.email,'email',60)
cPhone	= ShowSQLtxt(Quotes.Phone ,'Phone ',20)
cFax	= ShowSQLtxt(Quotes.Fax,'Fax',20)
nCustDisc = PrepareSQLnum(Quotes.CustDisc,'CustDisc',3,2)

m.MsgHeader = CreateHTML_Header (cEmailTO, nQuotesID, cSalesRep, cInqnumP, cRFQ, cName, cCompany, cEmail, cPhone, cFax )

*m.MsgHeader = m.MsgHeader +[src="https://images.SpaceAlloysUSA.com/v1/images/Quote/]+ALLTRIM(STR(nQuotesID))+[/]+ALLTRIM(cEmailTO)+[/HPALogo.png" ]
*m.MsgHeader = m.MsgHeader +[<strong>Quote Date</strong> ]+DTOC(DATE())+[<br />]
*m.MsgHeader = m.MsgHeader +[<strong>Quote # ]+ALLTRIM(QDBsendTo.InqnumP)+[</strong>]
*m.MsgHeader = m.MsgHeader +[<br /><strong><font color="red">RFQ: ]+ALLTRIM(ShowSQLtxt(QuoteTerms.RFQ,'RFQ',254))+[</font></strong>]
*m.MsgHeader = m.MsgHeader +ALLTRIM(cSalesRep)+[<br />]

IF nCustDisc > 0
	m.MsgHeader = m.MsgHeader+ " "+CHR(10)+CHR(13)
	m.MsgHeader = m.MsgHeader+ "Customer Discount Applied: "+ALLTRIM(STR(nCustDisc*100))+"%"+CHR(10)+CHR(13)
ENDIF


RETURN m.MsgHeader
ENDPROC
*************************************

PROCEDURE CreateHTML_Quote_Footer 
PARAMETERS cEmailTo

PRIVATE m.MsgFooter
m.MsgFooter = ""
*m.MsgFooter = CreateHTML_Quote_Banner(cEmailTo) \\web2\inetpub\images\images (2021)
m.MsgFooter = m.MsgFooter +[<a href=" https://www.SpaceAlloysUSA.com" target="_blank">]
m.MsgFooter = m.MsgFooter +[<img src="https://images.SpaceAlloysUSA.com/v1/images/hpaad/1/]+cEmailTo+[/HPAimage.png" ]
m.MsgFooter = m.MsgFooter +[ title="HPA Banner" alt="HPA Banner" width="650" height="197" />]
m.MsgFooter = m.MsgFooter +[</a>]


m.MsgFooter = m.MsgFooter +[<footer>]
m.MsgFooter = m.MsgFooter +[<div id="Div12" style="bottom:0; height: 12pt; width: 450pt; margin-left: 15pt;">]
m.MsgFooter = m.MsgFooter +[<table style="border: thin none #000000; width: 450pt;">]
m.MsgFooter = m.MsgFooter +[<tr>]
m.MsgFooter = m.MsgFooter +[<td class="styleTextAlignCenter" colspan="3">]
m.MsgFooter = m.MsgFooter +[<hr />]
m.MsgFooter = m.MsgFooter +[</td>]
m.MsgFooter = m.MsgFooter +[</tr>]
* Windfall / Tipton / Remit from Company Profile + CompanyPlant
IF NOT "COMPANY_REPORT" $ UPPER(SET("PROCEDURE"))
	IF FILE("REPORTS\company_report.prg")
		SET PROCEDURE TO REPORTS\company_report.prg ADDITIVE
	ENDIF
ENDIF
m.MsgFooter = m.MsgFooter + CompanyReport_HtmlEmailFooterAddrs()

*m.MsgFooter = m.MsgFooter +[<tr>]
*m.MsgFooter = m.MsgFooter +[<td class="styleTextAlignCenter" colspan="2"> ]
*m.MsgFooter = m.MsgFooter +[<a href=" http://www.facebook.com/HighPerformanceAlloys" target="_blank">]
*m.MsgFooter = m.MsgFooter +[<img src="http://www.buttonshut.com/Facebook-Buttons/Facebook-Buttons-51-88-.png" title=" Space Alloys USA? Facebook Page" alt="Space Alloys USA? Facebook Page" width="34" /></a> ]
*m.MsgFooter = m.MsgFooter +[<a href=" https://twitter.com/#!/HPAlloy" target="_blank">]
*m.MsgFooter = m.MsgFooter +[<img src="http://www.buttonshut.com/Twitter-Buttons/Twitter-Buttons-69-72-.png" title=" Space Alloys USA? Twitter Page" alt=" Space Alloys USA? Twitter Page" width="34" /></a>]
*m.MsgFooter = m.MsgFooter +[<a href=" http://www.linkedin.com/company/2335867?trk=tyah" target="_blank">]
*m.MsgFooter = m.MsgFooter +[<img src="http://www.buttonshut.com/LinkedIn-Buttons/linkedin-tiny-square2.png" title=" Space Alloys USA? LinkedIn Page" alt=" Space Alloys USA? LinkedIn Page" width="32" /></a>]
*m.MsgFooter = m.MsgFooter +[<a href=" http://highperformancealloy.blogspot.com/" target="_blank"><img src="https://www.blogger.com/img/start/icon.png" title=" Space Alloys USA? Blog Page" alt=" Space Alloys USA? Blog Page" width="32" /></a>]
*m.MsgFooter = m.MsgFooter +[<a href=" http://www.youtube.com/user/HPAlloy" target="_blank">]
*m.MsgFooter = m.MsgFooter +[<img src="http://s.ytimg.com/yt/img/creators_corner/YouTube/youtube_32x32.png" title=" Space Alloys USA? YouTube Channel" alt=" Space Alloys USA? YouTube Channel" width="32" /></a>]
*m.MsgFooter = m.MsgFooter +[</td>]
*m.MsgFooter = m.MsgFooter +[</tr>]

m.MsgFooter = m.MsgFooter +[</table>]
m.MsgFooter = m.MsgFooter +[</div>]

m.MsgFooter = m.MsgFooter +[</footer>]

RETURN m.MsgFooter
ENDPROC

*************************************

PROCEDURE CreateHTML_Quote_Banner
PARAMETERS cEmailTo
*\\web\images\images
PRIVATE m.MsgBanner
m.MsgBanner = "" 
m.MsgBanner = m.MsgBanner +[<br />]
m.MsgBanner = m.MsgBanner +[<a href=" https://www.SpaceAlloysUSA.com" target="_blank">]
m.MsgBanner = m.MsgBanner +[<img src="https://images.SpaceAlloysUSA.com/v1/images/hpaad/1/]+cEmailTo+[/HPAimage.png" ]
m.MsgBanner = m.MsgBanner +[ title="HPA Banner" alt="HPA Banner" width="650" height="197" />]
m.MsgBanner = m.MsgBanner +[</a>]

RETURN m.MsgBanner
ENDPROC
*************************************


PROCEDURE GetLastCall_CustomerID 
PARAMETERS pCustomerID, nConn
*dDate = GetLastCall_CustomerID( CustomerID, nConn )

IF VARTYPE(pCustomerID) != "C"
	RETURN CTOD('  /  /  ')
ENDIF

IF VARTYPE(nConn) != "N"
	RETURN CTOD('  /  /  ')
ENDIF

nConn = CheckSQLConnection(nConn)

PRIVATE cAlias 
cAlias = ALIAS()
PRIVATE cSQL, nSQLEXEC 

IF USED("tmpLastCall")
	USE IN tmpLastCall
ENDIF
cSQL = "SELECT dbo.f_GetLastCall_CustomerID('"+pCustomerID+"') AS [LastCall]"

SELECT 0
nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpLastCall')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpLastCall')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpLastCall")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpLastCall")

		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpLastCall')
	RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

PRIVATE dReturn
dReturn = CTOD('  /  /  ')

IF USED("tmpLastCall")
	IF VARTYPE(tmpLastCall.LastCall)='D' OR VARTYPE(tmpLastCall.LastCall)='T'
		dReturn = tmpLastCall.LastCall
		USE IN tmpLastCall
		RETURN dReturn 
	ELSE
		USE IN tmpLastCall
		RETURN CTOD('  /  /  ')
	ENDIF
ELSE
	RETURN CTOD('  /  /  ')
ENDIF

ENDPROC
*************************************

PROCEDURE GetWho_CustomerID 
PARAMETERS pCustomerID, nConn
*cWho = GetWho_CustomerID( CustomerID, nConn )

IF VARTYPE(pCustomerID) != "C"
	RETURN ' '
ENDIF

IF VARTYPE(nConn) != "N"
	RETURN ' '
ENDIF

nConn = CheckSQLConnection(nConn)

PRIVATE cAlias 
cAlias = ALIAS()
PRIVATE cSQL, nSQLEXEC 

IF USED("tmpWho")
	USE IN tmpWho
ENDIF
cSQL = "SELECT dbo.f_GetWho_CustomerID('"+pCustomerID+"') AS [Who]"

SELECT 0
nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpWho')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpWho')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpWho")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpWho")

		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpWho')
	RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

PRIVATE cReturn
cReturn = ''

IF USED("tmpWho")
	IF VARTYPE(tmpWho.Who)='C'
		cReturn = tmpWho.Who
	ENDIF
	USE IN tmpWho

ENDIF

RETURN cReturn 
ENDPROC

*************************************

PROCEDURE addQuoteMemo 
PARAMETERS pWhat, nConn
* addQuoteMemo( what, nConn )

IF VARTYPE(pWhat) != "C"
	RETURN 
ENDIF

IF VARTYPE(nConn) != "N"
	RETURN 
ENDIF

nConn = CheckSQLConnection(nConn)

PRIVATE cAlias 
cAlias = ALIAS()
PRIVATE cSQL, nSQLEXEC 

IF NOT USED('Quotes')
	RETURN
ENDIF

PRIVATE nAQ_ID,cInqNumP, cNewMemo, cOldQuoteMemo, cNewQuoteMemo 
nAQ_ID	= 0
cInqNumP = ''
cOldQuoteMemo = ''
cNewQuoteMemo = ''
DO CASE
CASE pWhat = "Print"
	cNewMemo= 'Printed Quote '+TTOC( DATETIME() )
CASE pWhat = "Fax"
	cNewMemo= 'Faxed Quote '+TTOC( DATETIME() )
CASE pWhat = "Email SQL  "
	cNewMemo= 'Emailed SQL Quote '+TTOC( DATETIME() )
CASE pWhat = "Email Color HTML"
	cNewMemo= 'Email Color HTML Quote '+TTOC( DATETIME() )
CASE pWhat = "Email Basic HTML"
	cNewMemo= 'Email Basic HTML Quote '+TTOC( DATETIME() )
CASE pWhat = "Email SQL PDF"
	cNewMemo= 'Emailed SQL as PDF Quote '+TTOC( DATETIME() )
CASE pWhat = "PDFx"
	cNewMemo= 'Emailed PDFx Quote '+TTOC( DATETIME() )
OTHERWISE
	cNewMemo= 'Quoted. '+TTOC( DATETIME() )
ENDCASE

IF USED('qdb')
	SELECT qdb
	IF RECCOUNT('qdb') < 1
		IF NOT EMPTY(cAlias)
			IF USED(cAlias)
				SELECT (cAlias)
			ELSE
				RecordTest("Record Test Data.","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
			ENDIF
		ENDIF
		
		RETURN
		
	ENDIF
	
	*************
	SCAN
		IF VARTYPE(qdb.ID)="N"
			nAQ_ID = qdb.ID
		ELSE
			nAQ_ID = 0
		ENDIF
		
		cInqNumP = qdb.InqNumP  &&Do not Trim 
		IF ISNULL(cInqNumP)
			LOOP
		ENDIF
		IF EMPTY(cInqNumP)
			*SKIP
			LOOP
		ENDIF
		
		
		IF USED('tmpQuoteMemo')
			SELECT tmpQuoteMemo
		ENDIF
		
		SELECT 0
		cSQL = "SELECT QuoteMemo FROM dbo.AllQuotes "
		IF nAQ_ID > 0
			cSQL = cSQL + " WHERE ID="+ALLTRIM(STR(nAQ_ID))
		ELSE
			cSQL = cSQL + " WHERE InqNumP='"+cInqNumP+"'"
		ENDIF
		
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpQuoteMemo' )
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL' TIMEOUT 1
			nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpQuoteMemo' )
		ENDDO
		IF nSQLEXEC < 0 &&Try again!
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpQuoteMemo")
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL 2' TIMEOUT 1
				nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpQuoteMemo")

				IF nSQLEXEC < 0
					IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
						nSQLEXEC = 0
					ENDIF
				ENDIF
			ENDDO
		ENDIF
		IF nSQLEXEC < 0
			SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpQuoteMemo' )
			RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
		ELSE	
			cOldQuoteMemo = ""
			IF USED('tmpQuoteMemo')
				IF RECCOUNT('tmpQuoteMemo') > 0
					cOldQuoteMemo = tmpQuoteMemo.QuoteMemo
				ENDIF
			ENDIF
			IF EMPTY(cOldQuoteMemo)
				cNewQuoteMemo = cNewMemo
			ELSE
				IF cNewMemo $ cOldQuoteMemo 
					*Skip -already there
				ELSE
					cNewQuoteMemo = cOldQuoteMemo +CHR(13)+ cNewMemo
				ENDIF
			ENDIF
			cNewQuoteMemo = PrepareSQLtxt(cNewQuoteMemo,'QuoteMemo',-1)
			
			cSQL = "UPDATE dbo.AllQuotes SET QuoteMemo = '"+cNewQuoteMemo+"'"
			IF nAQ_ID > 0
				cSQL = cSQL + " WHERE ID="+ALLTRIM(STR(nAQ_ID))
			ELSE
				cSQL = cSQL + " WHERE InqNumP='"+cInqNumP+"'"
			ENDIF

			SELECT 0
			nSQLEXEC = SQLEXEC( nConn, cSQL )
			DO WHILE nSQLEXEC = 0
				WAIT WINDOW 'SQL' TIMEOUT 1
				nSQLEXEC = SQLEXEC( nConn, cSQL )
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
				SQLEXECError(cSQL, nConn, nSQLEXEC )
				RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
			ENDIF		
		ENDIF
				
		SELECT qdb
	ENDSCAN
	
	IF USED('tmpQuoteMemo')
		USE IN tmpQuoteMemo
	ENDIF
ENDIF


IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

PRIVATE cReturn
cReturn = ''

RETURN cReturn 
ENDPROC

**********************************

PROCEDURE get_QTYwithWeight 
PARAMETERS cForm,nPieces,nThck,nSz2,nSz3,nWeight,pPU, nConn
*nQTY = get_QTYwithWeight( Form,Pieces,Thck,Sz2,Sz3,Weight,pPU,ThisForm.nConnHandle)
* no Alloy, IF PU is empty, Form will be used to get PU

PRIVATE lCloseConn

IF VARTYPE(cForm) != "C"
	RETURN 0
ENDIF
IF VARTYPE(nPieces) != "N"
	RETURN 0
ENDIF
IF VARTYPE(nThck) != "N" AND VARTYPE(nThck) != "Y"
	RETURN 0
ENDIF
IF VARTYPE(nWeight) != "N" AND VARTYPE(nWeight) != "Y"
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

PRIVATE nPU, nQTY  
IF VARTYPE(pPU) = "N"
	IF pPU > 0
		nPU = pPU
	ELSE
		nPU = GetPUfromForm( cForm, nConn )
	ENDIF
ELSE
	nPU = GetPUfromForm( cForm, nConn )
ENDIF

nQTY  = 0


DO CASE
CASE nPU = 1
	*nQTY is Weight in LBS
	nQTY = PrepareSQLnum( nWeight,'Weight',7,1)
	IF nWeight > 0
		nQTY = PrepareSQLnum( nWeight,'Weight',7,1)
	ELSE
		*get Weight
*		nWeight = CalcWeight(nPieces, cAlloy, cForm, nThck, nSz2, nSz3, nConn)
*		nQTY = PrepareSQLnum( nWeight,'Weight',7,1)
		nQTY = 0
	ENDIF
CASE nPU = 2
	*nQTY = Feet
	IF Uses3rdDim( cForm, nConn )
 		nQTY  = nPieces * (nSz3 / 12)
 	ELSE
 		nQTY  = nPieces * (nSz2 / 12)
 	ENDIF
CASE nPU = 3
	*nQTY is PCs
	nQTY  = nPieces
OTHERWISE
	nQTY  = 0
ENDCASE
			

IF lCloseConn
	SQLDISCONNECT( nConn )
ENDIF

RETURN nQTY
ENDPROC

***********************************

PROCEDURE Get_PUtext 
PARAMETERS pPU
*cText = Get_PUtext(nPU)
*cUnit = Proc_StockLst:Get_PriceU_from_nPU(nPU, pConnHandle)

IF VARTYPE(pPU) != "N"
	RETURN ''
ENDIF

PRIVATE nPU, cReturnText
nPU = pPU

DO CASE
CASE nPU = 1
	*nQTY is Weight in LBS
	cReturnText = '$/#'
CASE nPU = 2
	*nQTY = Feet
	cReturnText = '$/FT'
CASE nPU = 3
	*nQTY is PCs
	cReturnText = '$/PC'
CASE nPU = 4
	*nQTY is Lot
	cReturnText = '$ Lot'
OTHERWISE
	cReturnText = ''
ENDCASE
			
RETURN cReturnText
ENDPROC



********************************** 

PROCEDURE Calc_QTY_SOitem 
PARAMETERS cSOItem, nConn
**Calc_QTY_SOitem(pcSOitem,ThisForm.nConnHandle)
*Returns ERP Acct Standard QTY

*If dbo.Sales does not have S_QTY, 
*	call Calc_QTY(cAlloy,cForm,nPieces,nThck,nSz2,nSz3,nWeight,pPU, nConn)



PRIVATE nQTY
nQTY = 0

IF VARTYPE(cSOItem) != "C"
	RETURN 0
ENDIF
IF Proper_SO_Item(cSOItem) = Proper_SO_Item("0-00")
	RETURN 0
ENDIF
IF VARTYPE(nConn) != "N"
	RETURN 0
ENDIF

PRIVATE cAlias 
cAlias = ALIAS()
PRIVATE cSQL, nSQLEXEC 

***********
IF USED("tmpSales")
	USE IN tmpSales
ENDIF

cSQL = "SELECT S_QTY "
cSQL = cSQL + " FROM dbo.Sales "
cSQL = cSQL + " WHERE SOItem = dbo.f_ProperSOitem('"+cSOItem+"')"

SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpSales')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpSales' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpSales")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpSales")

		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	SQLEXECError(cSQL,nConn, nSQLEXEC, 'tmpSales')
	RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
ENDIF

IF USED('tmpSales')
	IF RECCOUNT('tmpSales') > 0
		nQTY = PrepareSQLnum(tmpSales.S_QTY ,'QTY',-5)
	ENDIF
	USE IN tmpSales
ENDIF
	
	
******
IF nQTY = 0
	PRIVATE cAlloy,cForm,nPieces,nThck,nSz2,nSz3,nWeight
	IF USED("tmpAQ")
		USE IN tmpAQ
	ENDIF

	cSQL = "SELECT Alloy,Form,Pieces,Thck,SZ2,SZ3,Weight "
	cSQL = cSQL + " FROM dbo.AllQuotes WHERE "
	cSQL = cSQL + " SOItem = dbo.f_ProperSOitem('"+cSOItem+"')"

	SELECT 0
	nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpAQ')
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpAQ' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpAQ")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpAQ")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL,nConn, nSQLEXEC, 'tmpAQ')
		RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF

	IF USED('tmpAQ')
		IF RECCOUNT('tmpAQ') > 0
			cAlloy	= ShowSQLtxt(tmpAQ.Alloy,'Alloy',12)
			cForm	= ShowSQLtxt(tmpAQ.Form,'Form',2)
			nPieces	= PrepareSQLnum(tmpAQ.Pieces,'Pieces',-3)
			nThck	= PrepareSQLnum(tmpAQ.Thck,'Thck',10,4)
			nSz2	= PrepareSQLnum(tmpAQ.SZ2,'Sz2',9,3)
			nSz3	= PrepareSQLnum(tmpAQ.SZ3,'Sz3',9,3)
			nWeight	= PrepareSQLnum(tmpAQ.Weight,'Weight',7,1)
			
			nQTY = Get_QTYwithWeight(cForm,nPieces,nThck,nSz2,nSz3,nWeight,0, nConn)
		ENDIF
	ENDIF

	IF USED('tmpAQ')
		USE IN tmpAQ
	ENDIF
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nQTY 
ENDPROC

********************************** 

PROCEDURE Calc_QTY_WO 
PARAMETERS nWO, nConn
**Calc_QTY_WO(nWO,ThisForm.nConnHandle)
*Returns ERP Acct Standard QTY

PRIVATE nQTY
nQTY = 0

IF VARTYPE(nWO) != "N"
	RETURN 0
ENDIF
IF VARTYPE(nConn) != "N"
	RETURN 0
ENDIF

PRIVATE cAlias 
cAlias = ALIAS()
PRIVATE cSQL, nSQLEXEC 

***********
IF USED("tmpWO_QTY")
	USE IN tmpWO_QTY
ENDIF

cSQL = "SELECT sWeight "
cSQL = cSQL + " FROM dbo.WorkOrder "
cSQL = cSQL + " WHERE WO="+STR(nWO)

SELECT 0
nSQLEXEC = SQLEXEC(nConn, cSQL, 'tmpWO_QTY')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpWO_QTY' )
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpWO_QTY")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpWO_QTY")

		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	SQLEXECError(cSQL,nConn, nSQLEXEC, 'tmpWO_QTY')
	RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
ENDIF

IF USED('tmpWO_QTY')
	IF RECCOUNT('tmpWO_QTY') > 0
		nQTY = PrepareSQLnum(tmpWO_QTY.sWeight,'QTY',-5)
	ENDIF
	USE IN tmpWO_QTY
ENDIF
	
	

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nQTY 
ENDPROC
**********************************

PROCEDURE Get_PUfromText
PARAMETERS cPUtext
*nPU = Get_PUfromText(cPUtext)

IF VARTYPE(cPUtext) != "C"
	RETURN 0
ENDIF

PRIVATE nPU
nPU = 0

DO CASE
CASE cPUtext= '$/#' OR UPPER(cPUtext) = '$/LB'
	*nQTY is Weight in LBS
*	cReturnText = '$/#'
	nPU = 1
CASE UPPER(cPUtext)='$/FT'
	*nQTY = Feet
*	cReturnText = '$/FT'
	nPU = 2
CASE UPPER(cPUtext)= '$/PC'
	*nQTY is PCs
*	cReturnText = '$/PC'
	nPU = 3
OTHERWISE
	cReturnText = ''
ENDCASE
			
RETURN nPU
ENDPROC

**********************************

PROCEDURE Get_PU_Price_String 
PARAMETERS pPU, pQty, pP
*cText = Get_PU_Price_String(Order_PU, Order_Qty, Order_P)
* Get_PU_Price_String(Order_PU, Order_Qty, Order_P) found in PurchaseOrder Print

IF VARTYPE(pPU) != "N"
	RETURN ''
ENDIF
IF NOT (VARTYPE(pQty) = "N" OR  VARTYPE(pQty) = "Y" )
	RETURN ''
ENDIF
IF NOT (VARTYPE(pP) = "N" OR VARTYPE(pP) = "Y")
	RETURN ''
ENDIF

PRIVATE nPU, cReturnText
nPU = pPU

IF pQty = 0
	pQty = 1
ENDIF
*cReturnText = 'Price '

DO CASE
CASE nPU = 0
	cReturnText = ''
CASE nPU = 1
	*nQTY is Weight in LBS
	IF pQty <= 1
		cReturnText = Remove0(pQTY,18,0,.F.) + ' LB '
	ELSE
		cReturnText = Remove0(pQTY,18,0,.F.) + ' Lbs '
	ENDIF
	cReturnText = cReturnText + '@ $'+Remove0(pP,18,4,.T.)
	cReturnText = cReturnText + '/#'
CASE nPU = 2
	*nQTY = Feet
	IF pQty <= 1
		cReturnText = Remove0(pQTY,18,1,.F.) + ' Foot '
	ELSE
		cReturnText = Remove0(pQTY,18,1,.F.) + ' Feet '
	ENDIF
	cReturnText = cReturnText + '@ $'+Remove0(pP,18,4,.T.)
	cReturnText = cReturnText + '/FT'
CASE nPU = 3
	*nQTY is PCs
	IF pQty <= 1
		cReturnText = Remove0(pQTY,18,0,.F.) + ' Pc '
	ELSE
		cReturnText = Remove0(pQTY,18,0,.F.) + ' PCs '
	ENDIF
	cReturnText = cReturnText + '@ $'+Remove0(pP,18,4,.T.)
	cReturnText = cReturnText + '/PC'
CASE nPU = 4
	*nQTY is Lot
	cReturnText = ''
	cReturnText = cReturnText + '$'+Remove0(pP,18,4,.T.)
	cReturnText = cReturnText + ' Lot Price'

OTHERWISE

	cReturnText = ''
ENDCASE
			
RETURN ALLTRIM(cReturnText)
ENDPROC

*********************************
PROCEDURE Get_Quote_Pricing 
PARAMETERS nPieces, cAlloy, cForm, nThck, nSz2, nSz3, nWeight, nP_lb, nP_pc, nP_ft, nLotP,cOtherFld,nOtherP, nConn
*lOK = Get_Quote_Pricing(nPieces, cAlloy, cForm, nThck, nSz2, nSz3,nWeight,nP_lb,nP_pc,nP_ft,nLotP,cOtherFld,nOtherP, gnConnHandle) nConn
*? Get_Quote_Pricing(50,'#6','70',1,80,6,0,0,0,0,0,'',0)
*? Get_Quote_Pricing(1, '400         ', '65', 1, 40, 120,31,0,600,0,0,'',0)

IF USED('tmpQuote_Pricing')
	USE IN tmpQuote_Pricing
ENDIF

PRIVATE cAlias 
cAlias = ALIAS()

IF VARTYPE(nPieces) != "N"
	RETURN .F.
ENDIF
IF VARTYPE(cAlloy) != "C"
	RETURN .F.
ENDIF
IF VARTYPE(cForm) != "C"
	RETURN .F.
ENDIF
IF VARTYPE(nThck) != "N"
	nThck = 0
ENDIF
IF VARTYPE(nSz2) != "N"
	nSz2 = 0
ENDIF
IF VARTYPE(nSz3) != "N"
	nSz3 = 0
ENDIF
IF VARTYPE(nWeight) != "N"
	nWeight = 0
ENDIF
IF VARTYPE(nP_lb) != "N"
	nP_lb = 0
ENDIF
IF VARTYPE(nP_pc) != "N"
	nP_pc = 0
ENDIF
IF VARTYPE(nP_ft) != "N"
	nP_ft = 0
ENDIF
IF VARTYPE(nLotP) != "N"
	nLotP = 0
ENDIF

IF VARTYPE(cOtherFld) != "C"
	cOtherFld = ''
ENDIF
IF NOT ( VARTYPE(nOtherP) = "N" OR VARTYPE(nOtherP) = "Y" )
	nOtherP = 0
ENDIF
*------------

PRIVATE lCloseConn

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

PRIVATE nFtLen, nLen, nSigDim
nFtLen = 0
nLen = 0
		
* from dbo.PU
*0,NA,1,$/#,2,$/FT,3,$/PC,4,$Lot,5,$/In,6,$/Kg"

PRIVATE nQ_P, nQ_PU, nQ_QTY, nQ_Total
nQ_P	= 0
nQ_PU	= 0
nQ_QTY	= 0
nQ_Total = 0

DO CASE
CASE UPPER(cOtherFld) = "PER MR" OR UPPER(cOtherFld) = "PER MTR" OR "$/MTR" $ UPPER(cOtherFld) OR "$/MR" $ UPPER(cOtherFld)
	nQ_PU = 7
*	cQ_PU = "$/Mtr"
	nQ_P  = nOtherP 
	
	nSigDim = getSigDim( cForm, nConn )
	IF nSigDim = 2
		nLen = IIF(nPieces<1,1,nPieces) * nSz2
	ENDIF
	IF nSigDim = 3 OR nSigDim = 6
		nLen = IIF(nPieces<1,1,nPieces) * nSz3
	ENDIF	
	IF nLen > 0
		nQ_QTY	= nLen * .0254
		nQ_Total = nOtherP * nLen * .0254
	ELSE
		nQ_Total = -1
	ENDIF
	
CASE UPPER(cOtherFld) = "PER KG" OR "/KG" $ UPPER(cOtherFld)
	nQ_PU = 6
	nQ_P  = nOtherP 
	
	IF nOtherP > 0
		IF isLBSonSZ( cForm, nConn )
			*Pounds are entered in a Sz2 or Sz3 fld and should be mutliplied by PC
			nQ_QTY = nWeight/2.2 * IIF(nPieces<1,1,nPieces) 
		ELSE
			nQ_QTY	= nWeight/2.2
		ENDIF
		nQ_Total = nOtherP * nQ_QTY
	ELSE
		nQ_Total = -1
	ENDIF

CASE UPPER(cOtherFld) = "PER INCH" OR "/IN" $ UPPER(cOtherFld)
	nQ_PU = 5
	nQ_P  = nOtherP 
	
	nSigDim = getSigDim( cForm, nConn )
	IF nSigDim = 2
		nLen = IIF(nPieces<1,1,nPieces) * nSz2
	ENDIF
	IF nSigDim = 3 OR nSigDim = 6
		nLen = IIF(nPieces<1,1,nPieces) * nSz3
	ENDIF	
	IF nLen > 0
		nQ_QTY	= nLen
		nQ_Total = nOtherP * nQ_QTY
	ELSE
		nQ_Total = -1
	ENDIF	
				
CASE nLotP > 0
	nQ_PU = 4
	nQ_P  = nLotP 
	nQ_QTY	= 1
	nQ_Total = nLotP 
	

CASE nP_lb > 0
	nQ_PU = 1
	nQ_P  =	nP_lb
	
	IF nWeight = 0
		nWeight = CalcWeight( nPieces, cAlloy, cForm, nThck, nSz2, nSz3, nConn )
	ENDIF
		
	IF nWeight > 0
		IF isLBSonSZ( cForm, nConn )
			*Pounds are entered in a Sz2 or Sz3 fld and should be mutliplied by PC
			nQ_QTY = nWeight * IIF(nPieces<1,1,nPieces) 
		ELSE
			nQ_QTY	= nWeight
		ENDIF
		nQ_Total = nP_lb * nQ_QTY
	ELSE
		nQ_Total = -1
	ENDIF
		
CASE nP_Ft > 0
	nQ_PU = 2
	nQ_P  =	nP_Ft
		
	nSigDim = getSigDim( cForm, nConn )
	IF nSigDim = 2
		nFtLen = IIF(nPieces<1,1,nPieces) * nSz2/12
	ENDIF
	IF nSigDim = 3 OR nSigDim = 6
		nFtLen = IIF(nPieces<1,1,nPieces) * nSz3/12
	ENDIF	
	IF nFtLen > 0
		nQ_QTY	= nFtLen
		nQ_Total = nP_Ft * nFtLen
	ELSE
		nQ_Total = -1
	ENDIF	
		
CASE nP_Pc > 0
	nQ_PU = 3
	nQ_P  =	nP_Pc

	IF nPieces > 0
		nQ_QTY	= nPieces
		nQ_Total = nP_Pc * nPieces
	ELSE
		nQ_Total = -1
	ENDIF
	
OTHERWISE 
	 nQ_P	= 0
	 nQ_PU	= GetPUfromForm( cForm, nConn )
	 nQ_QTY = 0
	 nQ_Total = -1
	 
ENDCASE



SELECT 0
CREATE CURSOR tmpQuote_Pricing (P N(18,4), PU N(1), QTY N(18,4), Total N(18,4) )

IF USED('tmpQuote_Pricing')

	APPEND BLANK
	REPLACE P WITH nQ_P
	REPLACE PU WITH nQ_PU
	REPLACE QTY WITH nQ_QTY 
	REPLACE Total WITH nQ_Total
	
ENDIF

IF lCloseConn
	SQLDISCONNECT( nConn )
ENDIF

RETURN .T.
ENDPROC

*********************************
PROCEDURE Is_Holiday 
PARAMETERS dDate, pConnHandle
*IF Is_Holiday( DATE() ,ThisForm.nConnHandle )

PRIVATE lIs_Holiday
lIs_Holiday = .F.

IF NOT ( VARTYPE(dDate) = "D" OR VARTYPE(dDate) = "T" )
	RETURN .F.
ENDIF

IF VARTYPE(dDate) = "T"
	dDate = TTOD(dDate)
ENDIF

IF EMPTY(dDate)
	RETURN .F.
ENDIF
IF dDate = CTOD('')
	RETURN .F.
ENDIF


IF NOT "PROC_SETUP" $ SET("PROCEDURE")  &&Added for when Quotes is run without ERP menu.
	SET PROCEDURE TO Progs\Proc_Setup ADDITIVE
ENDIF 

************************
*Check dDate
IF YEAR(dDate) < 2000
	PRIVATE nPassedYear, nCurrYear 
	nPassedYear = YEAR(dDate)
	nCurrYear = YEAR(DATE())
	IF nPassedYear+2000 < nCurrYear + 2
		dDate = CTOD( STR(DAY(dDate),2)+"/"+STR(MONTH(dDate),2)+"/"+STR(YEAR(dDate)+2000,4) )
	ENDIF
ENDIF
************************


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

PRIVATE cAlias 
cAlias = ALIAS()

IF USED("cntTemp")
	USE IN cntTemp
ENDIF
PRIVATE cSQL, nSQLEXEC 
cSQL = "EXEC dbo.p_Is_Holiday @date='"+DTOC(dDate)+"'"

SELECT 0
nSQLEXEC = SQLEXEC( nConn, cSQL, 'cntTemp')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'cntTemp')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "cntTemp")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "cntTemp")

		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	SQLEXECError(cSQL, nConn, nSQLEXEC, 'cntTemp')
	RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
ENDIF

PRIVATE nReturn
nReturn = 0
IF USED("cntTemp")
	IF RECCOUNT('cntTemp')> 0
		IF cntTemp.Holiday
			lIs_Holiday = .T.
		ENDIF
		USE IN cntTemp
	ENDIF
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

IF lNewConn 
	SQLDISCONNECT(nConn )
ENDIF

RETURN lIs_Holiday
ENDPROC


****************************************	
PROCEDURE CreateHTML_PS_Conf 
PARAMETERS pPackingSlipNo, pEmailAddress, pEmailHPA, pShipAddr, cSalesRep, pBillAddr
*Proc_ERP has basic Create HPA_HTML_Header 

IF VARTYPE(pPackingSlipNo) !="N"
	RETURN .F.
ENDIF
IF VARTYPE(pEmailAddress) !="C"
	RETURN .F.
ENDIF
IF VARTYPE(pEmailHPA) !="C"
	RETURN .F.
ENDIF
IF VARTYPE(pShipAddr) !="N"
	RETURN .F.
ENDIF
IF VARTYPE(cSalesRep) !="C"
	RETURN .F.
ENDIF
IF VARTYPE(pBillAddr) !="N"
	RETURN .F.
ENDIF

PRIVATE nConn, lCloseConn 
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


PRIVATE nPackingSlipNo, cEmailTO, cEmailHPA, nShipAddr, nBillAddr
nPackingSlipNo	= pPackingSlipNo
cEmailTO		= pEmailAddress
cEmailHPA		= pEmailHPA
nShipAddr 		= pShipAddr 
nBillAddr		= pBillAddr

*PRIVATE cSalesRep
*cSalesRep = Whos_Sales_Order(pnSO)

PRIVATE cName, cCompany, cAddr1, cAddr2, cCity, cST, cZip, cCountry, cEmail, cPhone, cFax, cCityST
cName	= ''
cCompany	= ''
cAddr1	= ''
cAddr2	= ''
cCity	= ''
cST		= ''
cZip	= ''
cCountry	= ''
cEmail	= ''
cPhone	= ''
cFax	= ''
cCityST = ''

**************************
IF nShipAddr > 0
	*Get address
	PRIVATE nConn 
	nConn = CheckSQLConnection(nConn)

	PRIVATE cAlias 
	cAlias = ALIAS()
	PRIVATE cSQL, nSQLEXEC 

	IF USED('tmpShipAddr')
		USE IN tmpShipAddr
	ENDIF
	SELECT 0
	
	cSQL = "SELECT Contact, Company, Addr1, Addr2, City, ST, Zip, Country, Email, Telephone, Fax_number "
	cSQL = cSQL + " FROM dbo.ShipAddr "
	cSQL = cSQL + " WHERE ShipCode="+STR(nShipAddr)
	
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpShipAddr' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpShipAddr' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpShipAddr")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpShipAddr")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpShipAddr' )
		RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ELSE	
		IF USED('tmpShipAddr')
			IF RECCOUNT('tmpShipAddr') > 0
				cName 	= ShowSQLtxt(tmpShipAddr.Contact,'Name',100)
				cCompany= ShowSQLtxt(tmpShipAddr.Company,'Company',100)
				cAddr1	= ShowSQLtxt(tmpShipAddr.Addr1,'Addr1',100)
				cAddr2	= ShowSQLtxt(tmpShipAddr.Addr2,'Addr2',100)
				cCity	= ShowSQLtxt(tmpShipAddr.City,'City',50)
				cST		= ShowSQLtxt(tmpShipAddr.ST,'ST',50)
				cZip	= ShowSQLtxt(tmpShipAddr.Zip,'Zip',50)
				cCountry= ShowSQLtxt(tmpShipAddr.Country,'Country',50)
				cEmail	= ShowSQLtxt(tmpShipAddr.Email,'email',60)
				cPhone	= ShowSQLtxt(tmpShipAddr.Telephone,'Phone ',50)
				cFax 	= ShowSQLtxt(tmpShipAddr.Fax_number,'Fax',12)
				
				cCityST = ALLTRIM(cCity)+", "+ALLTRIM(cST)+" "+ALLTRIM(cZip)+" "+ALLTRIM(cCountry)
			ENDIF
			
			USE IN tmpShipAddr
		ENDIF
	ENDIF
ENDIF

***************************
PRIVATE cBName, cBCompany, cBAddr1, cBAddr2, cBCity, cBST, cBZip, cBCountry, cBEmail, cBPhone, cBFax, cBCityST
cBName	= ''
cBCompany	= ''
cBAddr1	= ''
cBAddr2	= ''
cBCity	= ''
cBST		= ''
cBZip	= ''
cBCountry	= ''
cBEmail	= ''
cBPhone	= ''
cBFax	= ''
cBCityST = ''

IF nBillAddr > 0
	*Get Sold/Bill address
	PRIVATE nConn 
	nConn = CheckSQLConnection(nConn)

	PRIVATE cAlias 
	cAlias = ALIAS()
	PRIVATE cSQL, nSQLEXEC 

	IF USED('tmpSoldAddr')
		USE IN tmpSoldAddr
	ENDIF
	SELECT 0
	
	cSQL = "SELECT Contact, Company, Addr1, Addr2, City, ST, Zip, Country, Email, Telephone, Fax_number "
	cSQL = cSQL + " FROM dbo.SoldAddr "
	cSQL = cSQL + " WHERE SoldCode="+STR(nBillAddr)
	
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpSoldAddr' )
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpSoldAddr' )
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpSoldAddr")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpSoldAddr")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError(cSQL, nConn, nSQLEXEC, 'tmpSoldAddr' )
		RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ELSE	
		IF USED('tmpSoldAddr')
			IF RECCOUNT('tmpSoldAddr') > 0
				cBName 	= ShowSQLtxt(tmpSoldAddr.Contact,'Name',100)
				cBCompany= ShowSQLtxt(tmpSoldAddr.Company,'Company',100)
				cBAddr1	= ShowSQLtxt(tmpSoldAddr.Addr1,'Addr1',100)
				cBAddr2	= ShowSQLtxt(tmpSoldAddr.Addr2,'Addr2',100)
				cBCity	= ShowSQLtxt(tmpSoldAddr.City,'City',50)
				cBST	= ShowSQLtxt(tmpSoldAddr.ST,'ST',50)
				cBZip	= ShowSQLtxt(tmpSoldAddr.Zip,'Zip',50)
				cBCountry= ShowSQLtxt(tmpSoldAddr.Country,'Country',50)
				cBEmail	= ShowSQLtxt(tmpSoldAddr.Email,'email',60)
				cBPhone	= ShowSQLtxt(tmpSoldAddr.Telephone,'Phone ',50)
				cBFax 	= ShowSQLtxt(tmpSoldAddr.Fax_number,'Fax',12)
				
				cBCityST = ALLTRIM(cBCity)+", "+ALLTRIM(cBST)+" "+ALLTRIM(cBZip)+" "+ALLTRIM(cBCountry)
			ENDIF
			
			USE IN tmpSoldAddr
		ENDIF
	ENDIF
ENDIF

***********************
PRIVATE m.MsgNoteHTML
********************************************
PRIVATE cRFQ, cInqnumP
cRFQ = ''
cInqnumP = "PS# "+ALLTRIM(STR(nPackingSlipNo))

*m.MsgNoteHTML = CreateHTML_Header (cEmailTO, 0, cSalesRep, cInqnumP, cRFQ, cName, cCompany, cEmail, cPhone, cFax )
PRIVATE m.MsgHeader
m.MsgHeader = ''
m.MsgHeader = m.MsgHeader +"<!DOCTYPE html> " &&trigger in Send_HTML_Email
m.MsgHeader = m.MsgHeader +"<html>"
m.MsgHeader = m.MsgHeader +"<head>"
m.MsgHeader = m.MsgHeader +"<title>HPA Packing Slip</title>"
m.MsgHeader = m.MsgHeader +[<style type="text/css">]
m.MsgHeader = m.MsgHeader +[.styleRightAlign{text-align: right;}]
*m.MsgHeader = m.MsgHeader +[.styleTableHeadersRow{background-color: #4D5079;color: #FFFFFF;}]
m.MsgHeader = m.MsgHeader +".styleTableHeadersRow{background-color: #D1EAF1;color: #000000;}"
m.MsgHeader = m.MsgHeader +[.styleTextAlignCenter{text-align: center;}]
m.MsgHeader = m.MsgHeader +"</style>"
m.MsgHeader = m.MsgHeader +"</head>"
m.MsgHeader = m.MsgHeader +"<body>"
m.MsgHeader = m.MsgHeader +"<header>"
m.MsgHeader = m.MsgHeader +[<table style="border: thin none #000000; width: 480pt; ">]
m.MsgHeader = m.MsgHeader +"<tr>"
m.MsgHeader = m.MsgHeader +[<td style="width: 165pt; vertical-align: top;">]
m.MsgHeader = m.MsgHeader +[<img alt="Space Alloys USA Logo"]
*m.MsgHeader = m.MsgHeader +[src="https://images.SpaceAlloysUSA.com/v1/images/HPALogo.png" height="69"/>]
m.MsgHeader = m.MsgHeader +[src="https://images.SpaceAlloysUSA.com/v1/images/HPALogo.png" height="69"/>]
m.MsgHeader = m.MsgHeader +[</td>]

m.MsgHeader = m.MsgHeader +[<td style="width: 192pt; vertical-align: top;">]
m.MsgHeader = m.MsgHeader +[<h1>]
m.MsgHeader = m.MsgHeader +[PackingSlip</h1>]
m.MsgHeader = m.MsgHeader +[</td>]
m.MsgHeader = m.MsgHeader +[<td style="width: 123pt; text-align: left; vertical-align: top;">]
m.MsgHeader = m.MsgHeader +[<strong> Date</strong> ]+DTOC(DATE())+[<br />]
m.MsgHeader = m.MsgHeader +[<strong>]+ALLTRIM(cInqnumP)+[</strong>]
m.MsgHeader = m.MsgHeader +[</td>]	

m.MsgHeader = m.MsgHeader +[</tr>]
m.MsgHeader = m.MsgHeader +[</table>]
m.MsgHeader = m.MsgHeader +[</header>]
m.MsgHeader = m.MsgHeader +[<br />]
m.MsgHeader = m.MsgHeader +[<br />]
m.MsgHeader = m.MsgHeader +[<table style="border: thin none #000000; width: 480pt; ">]
m.MsgHeader = m.MsgHeader +[<tr>]
m.MsgHeader = m.MsgHeader +[<td style="width: 10pt; vertical-align: top;"></td>]
m.MsgHeader = m.MsgHeader +[<td style="width: 100pt; vertical-align: top;">]
m.MsgHeader = m.MsgHeader +[<strong>Ship To:</strong>]+[<br />]
m.MsgHeader = m.MsgHeader +PrepareSQLtxt(cName,'Name',100)+[<br />]
m.MsgHeader = m.MsgHeader +PrepareSQLtxt(cCompany,'Company',100)+[<br />]

m.MsgHeader = m.MsgHeader +PrepareSQLtxt(cAddr1,'Addr1',100)+[<br />]
IF NOT EMPTY(cAddr2)
	m.MsgHeader = m.MsgHeader +PrepareSQLtxt(cAddr2,'Addr2',100)+[<br />]
ENDIF
m.MsgHeader = m.MsgHeader +PrepareSQLtxt(cCityST,'CityST',100)+[<br />]

m.MsgHeader = m.MsgHeader +PrepareSQLtxt(cEmail,'email',60)+[<br />]
IF NOT EMPTY(cPhone)
	m.MsgHeader = m.MsgHeader +[P ]+PrepareSQLtxt(cPhone ,'Phone ',50)+[<br />]
ENDIF
IF NOT EMPTY(cFax)
	m.MsgHeader = m.MsgHeader +[F ]+PrepareSQLtxt(cFax,'Fax',12)+[<br />]
ENDIF
m.MsgHeader = m.MsgHeader +[</td>]
m.MsgHeader = m.MsgHeader +[<td style="width: 100pt; vertical-align: top;">]
m.MsgHeader = m.MsgHeader +[<strong>Sold To:</strong>]+[<br />]
m.MsgHeader = m.MsgHeader +PrepareSQLtxt(cBName,'Name',100)+[<br />]
m.MsgHeader = m.MsgHeader +PrepareSQLtxt(cBCompany,'Company',100)+[<br />]

m.MsgHeader = m.MsgHeader +PrepareSQLtxt(cBAddr1,'Addr1',100)+[<br />]
IF NOT EMPTY(cAddr2)
	m.MsgHeader = m.MsgHeader +PrepareSQLtxt(cBAddr2,'Addr2',100)+[<br />]
ENDIF
m.MsgHeader = m.MsgHeader +PrepareSQLtxt(cBCityST,'CityST',100)+[<br />]

m.MsgHeader = m.MsgHeader +PrepareSQLtxt(cBEmail,'email',60)+[<br />]
IF NOT EMPTY(cPhone)
	m.MsgHeader = m.MsgHeader +[P ]+PrepareSQLtxt(cBPhone ,'Phone ',50)+[<br />]
ENDIF
IF NOT EMPTY(cFax)
	m.MsgHeader = m.MsgHeader +[F ]+PrepareSQLtxt(cBFax,'Fax',12)+[<br />]
ENDIF
m.MsgHeader = m.MsgHeader +[</td>]
m.MsgHeader = m.MsgHeader +[<td style="width: 100pt; text-align: left; vertical-align: top;">]
m.MsgHeader = m.MsgHeader +[<strong>Sales Rep:</strong>]+[<br />]

m.MsgHeader = m.MsgHeader +ALLTRIM(cSalesRep)+[<br />]
m.MsgHeader = m.MsgHeader +[Space Alloys USA Inc.<br />]
m.MsgHeader = m.MsgHeader +[<br />]
m.MsgHeader = m.MsgHeader +[<br />]
m.MsgHeader = m.MsgHeader +[United States of America<br />]
m.MsgHeader = m.MsgHeader +[P 800-472-5569<br />]
m.MsgHeader = m.MsgHeader +[P 765-945-8230<br />]
m.MsgHeader = m.MsgHeader +[F 765-945-8294]
m.MsgHeader = m.MsgHeader +[</td>]
m.MsgHeader = m.MsgHeader +[</tr>]

m.MsgHeader = m.MsgHeader +[</table>]
m.MsgHeader = m.MsgHeader +[<br />]
m.MsgHeader = m.MsgHeader +[<br />]

********************************************
m.MsgNoteHTML = m.MsgHeader
********************************************

PRIVATE nPackingSlip_NO_ID
nPackingSlip_NO_ID = PackingSlip_NO.PackingSli
m.MsgNoteHTML = m.MsgNoteHTML + [<p>Packing Slip ] + ALLTRIM(STR(PrepareSQLnum(PackingSlip.PackingSli,'PackingSli',-3))) + [</p>]

IF NOT USED('PackingSlip_NO')
	TrackError("Lost Table.","NOT USED('PackingSlip_NO')","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF
IF NOT USED('PackingSlip')
	TrackError("Lost Table.","NOT USED('PackingSlip')","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO())
ENDIF

SELECT PackingSlip_NO

SELECT PackingSlip
GO TOP

DO WHILE PackingSlip.PackingSli = nPackingSlip_NO_ID 

	cMess = ''
	
	m.MsgNoteHTML = m.MsgNoteHTML + [<table width: 480pt; ">]
	m.MsgNoteHTML = m.MsgNoteHTML + [<tr style="border-bottom-style: double" >]
	m.MsgNoteHTML = m.MsgNoteHTML + [<td style="width: 130pt; border-bottom-style: solid;">]
	m.MsgNoteHTML = m.MsgNoteHTML + [<strong>Identification</strong>]
	m.MsgNoteHTML = m.MsgNoteHTML + [</td>]
	m.MsgNoteHTML = m.MsgNoteHTML + [<td style="width: 270pt; border-bottom-style: solid;">]
	m.MsgNoteHTML = m.MsgNoteHTML + [<strong>Description</strong>]
	m.MsgNoteHTML = m.MsgNoteHTML + [</td>]
	m.MsgNoteHTML = m.MsgNoteHTML + [<td style="width: 124pt; border-bottom-style: solid;">]
	m.MsgNoteHTML = m.MsgNoteHTML + [<strong>Quantity</strong>]
	m.MsgNoteHTML = m.MsgNoteHTML + [</td>]
	m.MsgNoteHTML = m.MsgNoteHTML + [</tr>]
	
	m.MsgNoteHTML = m.MsgNoteHTML + [<tr style="vertical-align: top">]
	m.MsgNoteHTML = m.MsgNoteHTML + [<td>]
	m.MsgNoteHTML = m.MsgNoteHTML + [PO Num ] + ALLTRIM(PrepareSQLtxt(PackingSlip.PO_Num,'PO_Num',20))
	m.MsgNoteHTML = m.MsgNoteHTML + [<br />]
	m.MsgNoteHTML = m.MsgNoteHTML + [SO #] + ALLTRIM(PrepareSQLtxt(PackingSlip.SOitem,'SOitem',10))
	m.MsgNoteHTML = m.MsgNoteHTML + [</td>]
	
	m.MsgNoteHTML = m.MsgNoteHTML + [<td >]
	m.MsgNoteHTML = m.MsgNoteHTML + ALLTRIM(PrepareSQLtxt(PackingSlip.Alloy,'Alloy',12))&&+SPACE(15)
	m.MsgNoteHTML = m.MsgNoteHTML + [<br />]
	cMess = PrepareSQLtxt(PackingSlip.Descript,'Descript',-1)
	cMess = STRTRAN(cMess , ['], [`] )
	cMess = STRTRAN(cMess , CHR(13), "<br />" )
	m.MsgNoteHTML = m.MsgNoteHTML + cMess
	m.MsgNoteHTML = m.MsgNoteHTML + [<br />]
	m.MsgNoteHTML = m.MsgNoteHTML + [Heat ] + ALLTRIM(PrepareSQLtxt(PackingSlip.Heat,'Heat',50))
	m.MsgNoteHTML = m.MsgNoteHTML + [</td>]
	m.MsgNoteHTML = m.MsgNoteHTML + [<td>]+ALLTRIM(STR(PrepareSQLnum(PackingSlip.PCs,'PCs',-3)))+[ Pcs  ]+[<br />]
	*m.MsgNoteHTML = m.MsgNoteHTML + [<td>]  --Put Pcs and LBS under same Quantity header
	IF PrepareSQLlogic(PackingSlip.Kg,'Kg',.F.)
		m.MsgNoteHTML = m.MsgNoteHTML +STR(PrepareSQLnum(PackingSlip.Weight,'Weight',10,1))+[ Kg ]+[<br />]
	ELSE
		m.MsgNoteHTML = m.MsgNoteHTML +STR(PrepareSQLnum(PackingSlip.Weight,'Weight',10,1))+[ LBs ]+[<br />]
	ENDIF
	m.MsgNoteHTML = m.MsgNoteHTML + [</td>]	
	m.MsgNoteHTML = m.MsgNoteHTML + [</tr>]
	
	cPartNo = PrepareSQLtxt(PackingSlip.PartNo,'PartNo',100)
	IF NOT EMPTY(cPartNo )
		m.MsgNoteHTML = m.MsgNoteHTML + [<tr>]
		m.MsgNoteHTML = m.MsgNoteHTML + [Part Number ] + ALLTRIM(cPartNo )
		m.MsgNoteHTML = m.MsgNoteHTML + [</tr>]
	ENDIF
	
	m.MsgNoteHTML = m.MsgNoteHTML + [</table>]
	m.MsgNoteHTML = m.MsgNoteHTML + [<br />]
    **
	
	SKIP IN PackingSlip
ENDDO

m.MsgNoteHTML = m.MsgNoteHTML +[    </table>]

SELECT PackingSlip_NO

m.MsgNoteHTML = m.MsgNoteHTML + [<table>]
m.MsgNoteHTML = m.MsgNoteHTML + [<tr>]
m.MsgNoteHTML = m.MsgNoteHTML + [<td style="font-weight: bold"> Packages:</td>]
m.MsgNoteHTML = m.MsgNoteHTML + [<td >]
m.MsgNoteHTML = m.MsgNoteHTML + ALLTRIM(PrepareSQLtxt(PackingSlip_NO.Carton,'Carton',10))
m.MsgNoteHTML = m.MsgNoteHTML + [ Pcs</td>]
m.MsgNoteHTML = m.MsgNoteHTML + [<td style="font-weight: bold"> Total Weight:</td>]
m.MsgNoteHTML = m.MsgNoteHTML + [<td >]
m.MsgNoteHTML = m.MsgNoteHTML + ALLTRIM(PrepareSQLtxt(PackingSlip_NO.totalweight,'totalweight',10))
m.MsgNoteHTML = m.MsgNoteHTML + [ lbs</td>]
m.MsgNoteHTML = m.MsgNoteHTML + [<td style="font-weight: bold"> Packed By:</td>]
m.MsgNoteHTML = m.MsgNoteHTML + [<td >]
m.MsgNoteHTML = m.MsgNoteHTML + ALLTRIM(PrepareSQLtxt(PackingSlip_NO.PackedBy,'PackedBy',10))
m.MsgNoteHTML = m.MsgNoteHTML + [</td>]
m.MsgNoteHTML = m.MsgNoteHTML + [<td style="font-weight: bold"> Checked By:</td>]
m.MsgNoteHTML = m.MsgNoteHTML + [<td >]
m.MsgNoteHTML = m.MsgNoteHTML + ALLTRIM(PrepareSQLtxt(PackingSlip_NO.CheckedBy,'CheckedBy',10))
m.MsgNoteHTML = m.MsgNoteHTML + [</td>]
m.MsgNoteHTML = m.MsgNoteHTML + [</tr>]
m.MsgNoteHTML = m.MsgNoteHTML + [</table>]
**
m.MsgNoteHTML = m.MsgNoteHTML + [<p style="font-weight: bold">Box: ]+ALLTRIM(PrepareSQLtxt(PackingSlip_NO.Box_Size,'Box_Size',20))+[</p>]
**
m.MsgNoteHTML = m.MsgNoteHTML + [<p>Ship Via:]+ALLTRIM(PrepareSQLtxt(PackingSlip_NO.ShippedVia,'ShippedVia',20))+[</p>]
**
m.MsgNoteHTML = m.MsgNoteHTML +[Flat Stock ships from:  1985 E 500 N, Windfall, IN 46076<br />]
m.MsgNoteHTML = m.MsgNoteHTML +[Round Stock ships from: 444 Wilson St, Tipton, IN 46072<br />]

**
cMess = ALLTRIM(PrepareSQLtxt(PackingSlip_NO.tracking,'tracking',50))
IF NOT EMPTY(cMess)
	m.MsgNoteHTML = m.MsgNoteHTML + ' '+[<br />]
	m.MsgNoteHTML = m.MsgNoteHTML + [<p style="font-weight: bold">Pro Number or Tracking:]
	m.MsgNoteHTML = m.MsgNoteHTML + cMess +" "
	IF UPPER(LEFT(cMess,2)) = "1Z"
*		m.MsgNoteHTML = m.MsgNoteHTML +[<a href="http://wwwapps.ups.com/etracking/tracking.cgiTypeOfInquiryNumber=T&InquiryNumber1=]+cMess+["> UPS Tracking </a>]
		m.MsgNoteHTML = m.MsgNoteHTML +[<a href="http://wwwapps.ups.com/WebTracking/track?track=yes&trackNums=]+cMess+["> UPS Tracking </a>]
		*http://wwwapps.ups.com/etracking/tracking.cgiTypeOfInquiryNumber=T&InquiryNumber1=1ZE633380330934168
		m.MsgNoteHTML = m.MsgNoteHTML + [</p><p>UPS will require time before this tracking is available on the Web.]
	*ELSE
	*	IF FedEx  &&http://verysimple.com/2011/07/06/ups-tracking-url/
	*		http://www.fedex.com/Tracking?action=track&tracknumbers=XXXXXXXXXXXXXXXXX
	*	ENDIF
	ENDIF
	m.MsgNoteHTML = m.MsgNoteHTML +[</p>]
ENDIF

m.MsgNoteHTML = m.MsgNoteHTML + ' '+[<br />]
*m.MsgNoteHTML = m.MsgNoteHTML + [<p style="color: #FF0000; font-weight: bold">]
*m.MsgNoteHTML = m.MsgNoteHTML +[<p><a href="https://www.surveymonkey.com/r/KV7573W"> Survey Monkey - Click to leave an Anonymous Survey. </a></p>]
m.MsgNoteHTML = m.MsgNoteHTML + Create_Survey_PackingSlip_Assignment(PackingSlip_NO.PackingSli,nConn)

m.MsgNoteHTML = m.MsgNoteHTML + [<p>NO MATERIAL RETURNED WITHOUT AUTHORIZATION.</p>]
**
m.MsgNoteHTML = m.MsgNoteHTML +	[<p></p>]

*m.MsgNoteHTML = m.MsgNoteHTML + ' '+[<br />]
m.MsgNoteHTML = m.MsgNoteHTML +	[<p></p>]
**

*m.MsgNoteHTML = m.MsgNoteHTML +[<p> <a href="https://www.SpaceAlloysUSA.com/contact/quote_survey.html">Survey</a> Please leave an anonymous comment.</p>]
*m.MsgNoteHTML = m.MsgNoteHTML +[<p><strong><em> Ask us to quote your close tolerance dynamic water jet cuts. </em></strong></p>]

*********************************************************
m.MsgNoteHTML = m.MsgNoteHTML  +[<p> Online Documentation: <a href="https://www.SpaceAlloysUSA.com/docs/FM-74-21%20Sales%20Terms%20and%20Conditions.pdf">Sales Terms & Conditions</a></p>]
m.MsgNoteHTML = m.MsgNoteHTML  +[<br />]

m.MsgNoteHTML = m.MsgNoteHTML  +[<p style="font-size:11px"> Report Form Proc_Quotes:CreateHTML_PS_Conf() </p>]
*********************************************************
m.MsgNoteHTML = m.MsgNoteHTML +[<br />]
m.MsgNoteHTML = m.MsgNoteHTML +[<footer>]
m.MsgNoteHTML = m.MsgNoteHTML +[<div id="Footer" style="bottom:0; height: 12pt; width: 480pt; margin-left: 0pt;">Space Alloys USA Inc.</div>]
m.MsgNoteHTML = m.MsgNoteHTML +[</footer>]
*********************************************************
m.MsgNoteHTML = m.MsgNoteHTML+[</body>]
m.MsgNoteHTML = m.MsgNoteHTML+[</html>]


PRIVATE cFile
IF "\MEM" $ SYS(2003)
	cFile = (SYS(5)+SYS(2003) +"\PackingSlip.HTML")
ELSE
	cFile = (SYS(5)+SYS(2003) +"\MEM\PackingSlip.HTML")
ENDIF
IF FILE(cFile)
	DELETE FILE cFile
ENDIF

PRIVATE nFileNum
nFileNum = FCREATE( cFile )
FWRITE( nFileNum, m.MsgNoteHTML )
FCLOSE(nFileNum)


PRIVATE loHyperlink 
loHyperlink = CREATEOBJECT("Hyperlink")
loHyperlink.navigateto(cFile)
RELEASE loHyperlink 

IF lCloseConn
	SQLDISCONNECT( nConn )
ENDIF

RETURN m.MsgNoteHTML
ENDPROC 

****************************************	

PROCEDURE CreateHTML_Header 
PARAMETERS cEmailTO, nQuotesID, cSalesRep, cInqnumP, cRFQ, cName, cCompany, cEmail, cPhone, cFax 
*CreateHTML_Header (cEmailTO, nQuotesID, cSalesRep, cInqnumP, cRFQ, cName, cCompany, cEmail, cPhone, cFax )

IF VARTYPE(cEmailTO) != "C"
	cEmailTO = ''
ENDIF
IF VARTYPE(nQuotesID) != "N"
	nQuotesID = 0
ENDIF
IF VARTYPE(cSalesRep) != "C"
	cSalesRep = ''
ENDIF
IF VARTYPE(cInqnumP) != "C"
	cInqnumP = ''
ENDIF
IF VARTYPE(cRFQ) != "C"
	cRFQ = ''
ENDIF
IF VARTYPE(cName) != "C"
	cName = ''
ENDIF
IF VARTYPE(cCompany) != "C"
	cCompany = ''
ENDIF
IF VARTYPE(cEmail) != "C"
	cEmail = ''
ENDIF
IF VARTYPE(cPhone) != "C"
	cPhone = ''
ENDIF
IF VARTYPE(cFax) != "C"
	cFax= ''
ENDIF


PRIVATE m.MsgHeader

m.MsgHeader = ''
m.MsgHeader = m.MsgHeader +"<!DOCTYPE html> " &&trigger in Send_HTML_Email
m.MsgHeader = m.MsgHeader +"<html>"
m.MsgHeader = m.MsgHeader +"<head>"
m.MsgHeader = m.MsgHeader +"<title>HPA Quotation</title>"
m.MsgHeader = m.MsgHeader +[<style type="text/css">]
m.MsgHeader = m.MsgHeader +[.styleRightAlign{text-align: right;}]
*m.MsgHeader = m.MsgHeader +[.styleTableHeadersRow{background-color: #4D5079;color: #FFFFFF;}]
m.MsgHeader = m.MsgHeader +[.styleTableHeadersRow{background-color: #D1EAF1;color: #000000;}]
m.MsgHeader = m.MsgHeader +[.styleTextAlignCenter{text-align: center;}]
m.MsgHeader = m.MsgHeader +"</style>"
m.MsgHeader = m.MsgHeader +"</head>"
m.MsgHeader = m.MsgHeader +"<body>"
m.MsgHeader = m.MsgHeader +"<header>"
m.MsgHeader = m.MsgHeader +[<table style="border: thin none #000000; width: 480pt; ">]
m.MsgHeader = m.MsgHeader +"<tr>"
m.MsgHeader = m.MsgHeader +[<td style="width: 165pt; vertical-align: top;">]
m.MsgHeader = m.MsgHeader +[<img alt="Space Alloys USA Logo" ]

m.MsgHeader = m.MsgHeader +[src="https://images.SpaceAlloysUSA.com/v1/images/HPALogo.png" height="69"/>]
*m.MsgHeader = m.MsgHeader +[src="https://images.SpaceAlloysUSA.com/v1/images/Quote/]+ALLTRIM(STR(nQuotesID))+[/]+ALLTRIM(cEmailTO)+[/HPALogo.png" height="69"/>]
*m.MsgHeader = m.MsgHeader +[src="https://images.SpaceAlloysUSA.com/v1/images/Quote/]+ALLTRIM(STR(nQuotesID))+[/]+ALLTRIM(cEmailTO)+[/HPALogo.png" height="69"/>]
m.MsgHeader = m.MsgHeader +[</td>]

m.MsgHeader = m.MsgHeader +[<td style="width: 192pt; vertical-align: top;">]
m.MsgHeader = m.MsgHeader +[<h1>]
m.MsgHeader = m.MsgHeader +[Quotation</h1>]
m.MsgHeader = m.MsgHeader +[</td>]
m.MsgHeader = m.MsgHeader +[<td style="width: 123pt; text-align: left; vertical-align: top;">]
m.MsgHeader = m.MsgHeader +[<strong>Quote Date</strong> ]+DTOC(DATE())+[<br />]
m.MsgHeader = m.MsgHeader +[<strong>Expiration Date</strong><br />7 days, unless noted<br />]
m.MsgHeader = m.MsgHeader +[<strong>Quote # ]+ALLTRIM(cInqnumP)+[</strong>]
IF NOT EMPTY(cRFQ)
	m.MsgHeader = m.MsgHeader +[<br /><strong><font color="red">RFQ: ]+ALLTRIM(PrepareSQLtxt(cRFQ,'RFQ',254))+[</font></strong>]
ENDIF
m.MsgHeader = m.MsgHeader +[</td>]

*	m.MsgHeader = m.MsgHeader +[<td style="width: 192pt; vertical-align: top;">]
*	m.MsgHeader = m.MsgHeader +[<h1>]
*	m.MsgHeader = m.MsgHeader +[</h1>]
*	m.MsgHeader = m.MsgHeader +[</td>]
*	m.MsgHeader = m.MsgHeader +[<td style="width: 123pt; text-align: left; vertical-align: top;">]
*	m.MsgHeader = m.MsgHeader +[</td>]	

m.MsgHeader = m.MsgHeader +[</tr>]
m.MsgHeader = m.MsgHeader +[</table>]
m.MsgHeader = m.MsgHeader +[</header>]
m.MsgHeader = m.MsgHeader +[<br />]
m.MsgHeader = m.MsgHeader +[<br />]
m.MsgHeader = m.MsgHeader +[<table style="border: thin none #000000; width: 480pt; ">]
m.MsgHeader = m.MsgHeader +[<tr>]
m.MsgHeader = m.MsgHeader +[<td style="width: 32pt; vertical-align: top;"></td>]
m.MsgHeader = m.MsgHeader +[<td style="width: 54pt; vertical-align: top;">]

m.MsgHeader = m.MsgHeader +[<strong>Quote To:</strong>]
m.MsgHeader = m.MsgHeader +[</td>]
m.MsgHeader = m.MsgHeader +[<td style="width: 150pt; vertical-align: top;">]
m.MsgHeader = m.MsgHeader +PrepareSQLtxt(cName,'Name',25)+[<br />]
m.MsgHeader = m.MsgHeader +PrepareSQLtxt(cCompany,'Company',30)+[<br />]
m.MsgHeader = m.MsgHeader +PrepareSQLtxt(cEmail,'email',60)+[<br />]
m.MsgHeader = m.MsgHeader +[P ]+PrepareSQLtxt(cPhone ,'Phone ',20)+[<br />]
m.MsgHeader = m.MsgHeader +[F ]+PrepareSQLtxt(cFax,'Fax',20)
m.MsgHeader = m.MsgHeader +[</td>]
m.MsgHeader = m.MsgHeader +[<td style="width: 72pt; text-align: left; vertical-align: top;">]

m.MsgHeader = m.MsgHeader +[<strong>Contact:</strong>]
m.MsgHeader = m.MsgHeader +[</td>]
m.MsgHeader = m.MsgHeader +[<td style="width: 150pt; vertical-align: top;">]
m.MsgHeader = m.MsgHeader +ALLTRIM(cSalesRep)+[<br />]
m.MsgHeader = m.MsgHeader +[1985 E 500 N<br />]
m.MsgHeader = m.MsgHeader +[Windfall, IN 46076<br />]
m.MsgHeader = m.MsgHeader +[United States of America<br />]
m.MsgHeader = m.MsgHeader +[P 800-472-5569<br />]
m.MsgHeader = m.MsgHeader +[P 765-945-8230<br />]
m.MsgHeader = m.MsgHeader +[F 765-945-8294]
m.MsgHeader = m.MsgHeader +[</td>]
m.MsgHeader = m.MsgHeader +[</tr>]
m.MsgHeader = m.MsgHeader +[</table>]
m.MsgHeader = m.MsgHeader +[<br />]
m.MsgHeader = m.MsgHeader +[<br />]

RETURN m.MsgHeader
ENDPROC
*************************************

PROCEDURE CreateHTML_Inquire_Header 
*PARAMETERS  GatherSend
*cMessage = cMessage + CreateHTML_Inquire_Header()

PRIVATE cMessage
cMessage = '' 
cMessage = cMessage +"Space Alloys USA "+CHR(10)+CHR(13)
cMessage = cMessage +"Sales: 1985 E 500 N, Windfall, IN 46076 USA"+CHR(10)+CHR(13)
cMessage = cMessage +"Shop: 444 Wilson Street, PO Box 40,Tipton, IN 46072 USA"+CHR(10)+CHR(13)
cMessage = cMessage +"Phone (765)945-8230         (800)472-5569         www.SpaceAlloysUSA.com"+CHR(10)+CHR(13)
*cMessage = cMessage +"      (800) HPALLOY "+CHR(10)+CHR(13)
*cMessage = cMessage +"      (800) 4725569 "+CHR(10)+CHR(13)
cMessage = cMessage +"  Fax (765)945-8294  " +CHR(10)+CHR(13)

RETURN cMessage 
ENDPROC
*************************************

PROCEDURE Create_Survey_Quote_Assignment
PARAMETERS cInqNumP, pConnHandle
*cText = Create_Survey_Quote_Assignment(InqNumP,nConn)

IF VARTYPE(cInqNumP) != "C"
	RETURN " "
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
PRIVATE cSQL, nSQLEXEC, cText

PRIVATE cAlias 
cAlias = ALIAS()

**********
IF USED('tmpPQ_HTML')
	SELECT tmpPQ_HTML
ELSE
	SELECT 0
ENDIF

cSQL = "EXEC dbo.[p_Create_Survey_Quote_Assignment_HTML] '"+cInqNumP+"'"

nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPQ_HTML')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPQ_HTML')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPQ_HTML")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPQ_HTML")

		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	SQLEXECError( cSQL, nConn, nSQLEXEC, 'tmpPQ_HTML')
	RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
ENDIF

cText = " "
IF USED('tmpPQ_HTML')
	IF VARTYPE(tmpPQ_HTML.EXP) = "C"
		cText = tmpPQ_HTML.EXP
	ENDIF
	USE IN tmpPQ_HTML
ENDIF


IF lNewConn 
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cText 
ENDPROC

*************************************
PROCEDURE Create_Survey_PackingSlip_Assignment
PARAMETERS pPackingSli, pConnHandle
*cText = Create_Survey_PackingSlip_Assignment(PackingSli,nConn)


IF VARTYPE(pPackingSli) != "N"
	RETURN " "
ENDIF

PRIVATE cPackingSli
cPackingSli = ALLTRIM(STR(pPackingSli))

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
PRIVATE cSQL, nSQLEXEC, cText

PRIVATE cAlias 
cAlias = ALIAS()

**********
IF USED('tmpPQ_HTML')
	SELECT tmpPQ_HTML
ELSE
	SELECT 0
ENDIF

cSQL = "EXEC dbo.[p_Create_Survey_PackingSlip_Assignment_HTML] '"+cPackingSli+"'"

nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPQ_HTML')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPQ_HTML')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPQ_HTML")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPQ_HTML")

		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	SQLEXECError( cSQL, nConn, nSQLEXEC, 'tmpPQ_HTML')
	RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
ENDIF

cText = " "
IF USED('tmpPQ_HTML')
	IF VARTYPE(tmpPQ_HTML.EXP) = "C"
		cText = tmpPQ_HTML.EXP
	ENDIF
	USE IN tmpPQ_HTML
ENDIF


IF lNewConn 
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN cText 
ENDPROC

*************************************
PROCEDURE AddCommas 
PARAMETERS pTextNumber
*AddCommas()
*Also edit the AddComas.prg

IF VARTYPE(pTextNumber) != "C"
	pTextNumber = ''
ENDIF
PRIVATE cReturnChar, nPositionDecimal, nNumberCommas
cReturnChar = ''
nPositionDecimal = AT(".",pTextNumber)

PRIVATE PreDecimalTxt, PostDecimalTxt
IF nPositionDecimal > 0
	PreDecimalTxt = LEFT(pTextNumber,nPositionDecimal-1)
	PostDecimalTxt = RIGHT(pTextNumber,LEN(pTextNumber)-nPositionDecimal)
ELSE
	PreDecimalTxt	= pTextNumber
	PostDecimalTxt	= ''
ENDIF

PreDecimalTxt = ALLTRIM(PreDecimalTxt)

IF LEN(PreDecimalTxt) > 3 
	nNumberCommas = FLOOR((LEN(PreDecimalTxt)-1)/3)
	IF nNumberCommas = 0
		IF LEN(PostDecimalTxt) = 0
			cReturnChar = PreDecimalTxt
		ELSE
*			IF LEN(PostDecimalTxt)>0
				cReturnChar = PreDecimalTxt+"."+PostDecimalTxt 
*			ELSE
*				cReturnChar = PreDecimalTxt
*			ENDIF
		ENDIF
	ELSE
		PRIVATE nIteration, nLengthPDT, nInsComma 
		
		nInsCommaL = 0
		nCommaToGo = nNumberCommas 
		
		FOR nIteration = 1 TO nNumberCommas 
			nCommaToGo = nNumberCommas - nIteration 
			nLengthPDT = LEN(PreDecimalTxt)
			nInsCommaL =  (3 * nIteration) + nIteration-1

			
			PreDecimalTxt = LEFT(PreDecimalTxt,nLengthPDT-nInsCommaL)+","+RIGHT(PreDecimalTxt,nInsCommaL)
			
		NEXT
		IF LEN(PostDecimalTxt)>0
			cReturnChar = PreDecimalTxt+"."+PostDecimalTxt 
		ELSE
			cReturnChar = PreDecimalTxt
		ENDIF
	ENDIF
ELSE
	IF LEN(PostDecimalTxt)>0
		cReturnChar = PreDecimalTxt+"."+PostDecimalTxt 
	ELSE
		cReturnChar = PreDecimalTxt
	ENDIF
ENDIF

RETURN cReturnChar

ENDPROC

*************************************
PROCEDURE StripHTML 
PARAMETERS pText  
*Removes HTML tags
*use PrepareSQLtxt before saving to SQL

PRIVATE cText
IF VARTYPE(pText) != "C"
	cText = ''
ELSE
	cText = PrepareSQLtxt(pText,'Text',-1)
	cText = ShowSQLtxt(   cText,'Text',-1)
	
ENDIF

PRIVATE cReturnText,nCountLT, nCountGT, cPreText, cPostText 
cReturnText = cText 
nCountLT = 0
nCountGT = 0
cPreText = ''
cPostText = ''

nCountLT = AT('<',cText)
nCountGT = AT('>',cText)

DO WHILE nCountLT > 0 AND nCountGT > 0
	
	*Remove complete TAGS
	DO CASE
	CASE UPPER(LEFT(cReturnText,6)) = "<STYLE"
		nCountGT = AT('</STYLE>',UPPER(cReturnText) )+8
		cReturnText = RIGHT( cReturnText,LEN(cReturnText )- nCountGT )
		cReturnText = ALLTRIM(cReturnText)

	CASE UPPER(LEFT(cReturnText,7)) = "<SCRIPT"
		nCountGT = AT('</SCRIPT>',UPPER(cReturnText) )+9
		cReturnText = RIGHT( cReturnText,LEN(cReturnText )- nCountGT )
		cReturnText = ALLTRIM(cReturnText)

	OTHERWISE
	
		*Remove just the tag.
		cPreText = LEFT( cReturnText, nCountLT-1 )
		nCountGT = AT('>', cReturnText )
		cPostText = RIGHT( cReturnText,LEN(cReturnText )- nCountGT )
		
		IF LEN(cPreText)>0
			cReturnText = ALLTRIM(cPreText) +" " + ALLTRIM(cPostText)
		ELSE
			cReturnText = ALLTRIM(cPostText)
		ENDIF
		
	ENDCASE	
	nCountLT = AT('<', cReturnText )
	nCountGT = AT('>', cReturnText )

ENDDO

RETURN cReturnText

ENDPROC

**********************************************
PROCEDURE Kerf_Loss
PARAMETER pcCut_Letter, nThck, nCutSpeed
*Return kerf width for CutTyp, Thickness and Speed

IF VARTYPE(pcCut_Letter) != "C"
	RETURN 0
ENDIF

PRIVATE nKerfWidth
nKerfWidth = 0

DO CASE
CASE pcCut_Letter = "N"
	*N-not specified
	nKerfWidth = .25 + .125
CASE pcCut_Letter = "A"
	* A-abrasive
	nKerfWidth = .25 + .125
CASE pcCut_Letter = "B"
	*B-band saw
	nKerfWidth = .065 + .065
CASE pcCut_Letter = "S"
	*S-shear
	nKerfWidth = .01 + .065
CASE pcCut_Letter = "P"
	*P-plasma
	nKerfWidth = 0
	DO CASE 
	CASE nThck < .078
		nKerfWidth = 0
	CASE nThck <= .125
		nKerfWidth = .050 + .065
	CASE nThck <= .375
		nKerfWidth = .090 + .065
	CASE nThck <= .5
		nKerfWidth = .103 + .065
	CASE nThck <= .75
		nKerfWidth = .138 + .065
	CASE nThck <= 1.5
		nKerfWidth = .188 + .065
	CASE nThck <= 2
		nKerfWidth = .225 + .065
	CASE nThck <= 4
		nKerfWidth = .25 + .065
	ENDCASE
	
CASE pcCut_Letter = "W"
	*W-waterjet
	*nKerfWidth = .040  && +( Tol @ nCutSpeed )
	DO CASE 
	CASE nCutSpeed = 100
		nKerfWidth = .040 + .125
	CASE nCutSpeed = 80
		nKerfWidth = .040 + .095
	CASE nCutSpeed = 60
		nKerfWidth = .040 + .065
	CASE nCutSpeed = 40
		nKerfWidth = .040 + .02
	CASE nCutSpeed = 20
		nKerfWidth = .040 + .01
	OTHERWISE
		nKerfWidth = .040 + .125
	ENDCASE
ENDCASE

RETURN nKerfWidth
ENDPROC

**********************************************

PROCEDURE CubicInch_Form
PARAMETER cForm, nThck, nSz2
*Return CI for form

IF VARTYPE(cForm) != "C"
	RETURN 0
ENDIF
IF VARTYPE(nThck) != "N"
	RETURN 0
ENDIF
IF VARTYPE(nSz2) != "N"
	nSz2 = 0
ENDIF

PRIVATE nCI
nCI = 0

DO CASE
CASE cForm = "10"
	nCI = 3.14156 * nThck * nThck
CASE cForm = "11"
	nCI = nThck * nThck
CASE cForm = "12"
	nCI = nThck * nThck * .866
CASE cForm = "13"
	nCI = nThck * nThck
CASE cForm = "20" OR cForm = "21" OR cForm = "22" OR cForm = "23" 
	nCI = 3.14156 * nThck * nThck
CASE cForm = "40" OR cForm = "50" OR cForm = "51" OR cForm = "52" OR cForm = "53"
	nCI = nThck * nSz2
CASE cForm = "80"
	nCI = 3.14156 * nSz2 * nSz2
CASE cForm = "90" OR cForm = "95" OR cForm = "96" OR cForm = "98" OR cForm = "99" 
	nCI = nThck * nSz2
CASE cForm = "97"
	nCI = 3.14156 * nThck * nThck
OTHERWISE
	nCI = 0
ENDCASE

RETURN nCI
ENDPROC


************************************

PROCEDURE New_Acct_Stnd

*!*		nWeight			= PrepareSQLnum(Quotes.Weight,'Weight',8,1)
*!*		nP_lb			= PrepareSQLnum(Quotes.P_lb,'P_lb',8,2)
*!*		nP_pc			= PrepareSQLnum(Quotes.P_pc,'P_pc',9,2)
*!*		nP_ft			= PrepareSQLnum(Quotes.P_ft,'P_ft',8,2)
*!*		nCuts			= PrepareSQLnum(Quotes.Cuts,'Cuts',6,0)
*!*		cOtherFld		= PrepareSQLtxt(Quotes.OtherFld,'OtherFld',10)
*!*		nOtherP			= PrepareSQLnum(Quotes.OtherP,'OtherP',8,2)
*!*		nLotP			= PrepareSQLnum(Quotes.LotP,'LotP',8,2)
*!*		
*!*		nQ_P		= PrepareSQLnum(Quotes.Q_P,'Q_P',-5)
*!*		nQ_QTY		= PrepareSQLnum(Quotes.Q_QTY,'Q_QTY',-5)
*!*		nQ_PU		= PrepareSQLnum(Quotes.Q_PU,'Q_PU',-1)
*!*		nQ_Total	= PrepareSQLnum(Quotes.Q_Total,'Q_Total',-5)
*!*		
*!*		nS_P		= PrepareSQLnum(Quotes.S_P,'S_P',-5)
*!*		nS_QTY		= PrepareSQLnum(Quotes.S_QTY,'S_QTY',-5)
*!*		nS_PU		= PrepareSQLnum(Quotes.S_PU,'S_PU',-1)
*!*		cInqNumP	= PrepareSQLtxt(Quotes.InqNumP,'InqNumP',9)
*!*		nFeet = 0
*!*		
*!*		*****
*!*		IF nS_QTY <= 0
*!*			cAlloy		= PrepareSQLtxt(Quotes.Alloy,'Alloy',12)
*!*			cForm		= PrepareSQLtxt(Quotes.Form,'Form',2)
*!*			nPieces		= PrepareSQLnum(Quotes.Pieces,'Pieces',7,0)
*!*			nThck		= PrepareSQLnum(Quotes.Thck,'Thck',10,4)
*!*			nSz2		= PrepareSQLnum(Quotes.Sz2,'Sz2',9,3)
*!*			nSz3		= PrepareSQLnum(Quotes.Sz3,'Sz3',9,3)

*!*			nS_QTY	= Calc_QTY(cAlloy,cForm,nPieces,nThck,nSz2,nSz3,cOtherFld,nConn)
*!*			lUpdateQuotes = .T.
*!*			
*!*			nFeet = Calc_Feet(nPieces, cForm, nSZ2, nSZ3, gnConnHandle) nConn
*!*		ENDIF
*!*		*****
*!*		IF nS_PU <= 0 
*!*			cForm	= PrepareSQLtxt(Quotes.Form,'Form',2)
*!*			nS_PU	= nPU_Acct_Form( cForm, gnConnHandle) nConn
*!*			lUpdateQuotes = .T.
*!*			
*!*		ENDIF
*!*	*	*****
*!*	*	IF nS_P <= 0
*!*	*		nS_P	= IIF(nS_PU=1,nP_lb+(nOtherP/nWeight), IIF(nS_PU=2,nP_Ft+(nOtherP/nFeet),nP_Pc+(nOtherP/nPieces) ))
*!*	*	ENDIF
*!*		*****
*!*		IF nQ_P <= 0
*!*			*Record was still using P_LB..
*!*			nPieces		= PrepareSQLnum(Quotes.Pieces,'Pieces',7,0)
*!*			cAlloy		= PrepareSQLtxt(Quotes.Alloy,'Alloy',12)
*!*			cForm		= PrepareSQLtxt(Quotes.Form,'Form',2)
*!*			nThck		= PrepareSQLnum(Quotes.Thck,'Thck',10,4)
*!*			nSz2		= PrepareSQLnum(Quotes.Sz2,'Sz2',9,3)
*!*			nSz3		= PrepareSQLnum(Quotes.Sz3,'Sz3',9,3)
*!*					
*!*			nFeet 		= Calc_Feet(nPieces, cForm, nSZ2, nSZ3, gnConnHandle) nConn
*!*			
*!*			*nQ_P = Get_Qoute_P(nPieces,cAlloy,cForm,nThck,nSz2,nSz3,nWeight,nP_lb,nP_pc,nP_ft,nLotP,cOtherFld,nOtherP, gnConnHandle)	nConn
*!*			
*!*			*Use old School Calc
*!*			****************************************************
*!*			*Use this Function to return a table with the Quoted Answers
*!*			*This overwrite typical units and uses Units found in OtherFld and OtherP
*!*			IF Get_Quote_Pricing(nPieces,cAlloy,cForm,nThck,nSz2,nSz3,nWeight,nP_lb,nP_pc,nP_ft,nLotP,cOtherFld,nOtherP, gnConnHandle) nConn
*!*				IF USED('tmpQuote_Pricing')
*!*					*nQ_P		= Get_Quote_P(nPieces,cAlloy,cForm,nThck,nSz2,nSz3,nWeight,nP_lb,nP_pc,nP_ft,nLotP,cOtherFld,nOtherP, gnConnHandle) nConn
*!*					nQ_P	= PrepareSQLnum(tmpQuote_Pricing.P,'Q_P',-5)
*!*					nQ_PU	= PrepareSQLnum(tmpQuote_Pricing.PU,'Q_PU',-1)
*!*					nQ_QTY	= PrepareSQLnum(tmpQuote_Pricing.QTY,'Q_QTY',-5)
*!*					nQ_Total= PrepareSQLnum(tmpQuote_Pricing.Total,'Q_Total',-5)

*!*					USE IN tmpQuote_Pricing
*!*				ENDIF
*!*			ENDIF
*!*			
*!*			SELECT Quotes
*!*			
*!*			lUpdateQuotes = .T.
*!*		ENDIF
*!*		
*!*		*****
*!*		IF nQ_Total = 0 
*!*			IF ( nQ_P * nQ_QTY ) > 0
*!*				nQ_Total = nQ_P * nQ_QTY
*!*				lUpdateQuotes = .T.
*!*				
*!*			ENDIF
*!*		ENDIF
*!*		
*!*		*****
*!*		*Check Values
*!*		*nQ_P, nQ_QTY	
*!*		DO CASE
*!*		CASE nQ_PU = 1
*!*			*Weight must match QTY
*!*			IF ROUND(nWeight,0) <> ROUND(nQ_QTY,0)
*!*				ncWeight	= PrepareSQLnum(Quotes.cWeight,'Weight',8,1)
*!*				IF ROUND(nWeight,0) <> ROUND(ncWeight,0) AND ROUND(ncWeight,0) = ROUND(nQ_QTY,0)
*!*					cMess = "Weight on Quote "+ALLTRIM(STR(nWeight,10,0))+CHR(13)+" does not match QTY "+ALLTRIM(STR(nQ_QTY,10,0))+CHR(13)+" or match Calculated Pounds "+ALLTRIM(STR(nWeight,10,0))+CHR(13)+"and Pricing Units is Per Pound!"+CHR(13)+" for InqNumP="+cInqNumP
*!*					nMess = MESSAGEBOX(cMess+CHR(13)+"Do you want to Replace Weight with QTY Weight?",4+32,"Do you want to Replace?")
*!*					IF nMess = 6
*!*						nWeight = nQ_QTY
*!*					ENDIF
*!*				ENDIF
*!*			ENDIF
*!*			IF ROUND(nWeight,0) <> ROUND(nQ_QTY,0)	
*!*				cMess = "Weight on Quote "+ALLTRIM(STR(nWeight,10,0))+CHR(13)+" does not match QTY "+ALLTRIM(STR(nQ_QTY,10,0))+CHR(13)+"and Pricing Units is Per Pound!"+CHR(13)+" for InqNumP="+cInqNumP
*!*				MESSAGEBOX(cMess,16,"Fix before proceding")
*!*				TrackError(cMess,"Weight and QTY do not match when PU=1", PROGRAM(), LINENO(1))
*!*				lUpdateQuotes = .F.
*!*				lExitScan = .T.
*!*			ENDIF
*!*		CASE nQ_PU = 2
*!*			*Feet must match QTY
*!*			IF nFeet = 0
*!*				nPieces		= PrepareSQLnum(Quotes.Pieces,'Pieces',7,0)
*!*				cForm		= PrepareSQLtxt(Quotes.Form,'Form',2)
*!*				nSz2		= PrepareSQLnum(Quotes.Sz2,'Sz2',9,3)
*!*				nSz3		= PrepareSQLnum(Quotes.Sz3,'Sz3',9,3)

*!*				nFeet = Calc_Feet(nPieces, cForm, nSZ2, nSZ3, gnConnHandle) nConn
*!*			ENDIF
*!*			IF nFeet <> nQ_QTY 
*!*				cMess = "Length of Feet on Quote "+ALLTRIM(STR(nFeet ))+CHR(13)+" does not match QTY "+ALLTRIM(STR(nQ_QTY))+CHR(13)+"and Pricing Units is Per Foot!"+CHR(13)+" for InqNumP="+cInqNumP
*!*				MESSAGEBOX(cMess,16,"Fix before proceding")
*!*				TrackError(cMess,"Pieces and QTY do not match when PU=3", PROGRAM(), LINENO(1))
*!*				lUpdateQuotes = .F.
*!*				lExitScan = .T.
*!*			ENDIF		
*!*		CASE nQ_PU = 3
*!*			*Pieces must match Q_TY
*!*			nPieces		= PrepareSQLnum(Quotes.Pieces,'Pieces',7,0)
*!*			IF nQ_QTY <> nPieces
*!*				cMess = "Pieces on Quote "+ALLTRIM(STR(nPieces))+CHR(13)+" does not match QTY "+ALLTRIM(STR(nQ_QTY))+CHR(13)+"and Pricing Units is Per PC!"+CHR(13)+" for InqNumP="+cInqNumP
*!*				MESSAGEBOX(cMess,16,"Fix before proceding")
*!*				TrackError(cMess,"Pieces and QTY do not match when PU=3", PROGRAM(), LINENO(1))
*!*				lUpdateQuotes = .F.
*!*				lExitScan = .T.
*!*			ENDIF
*!*		CASE nQ_PU = 4
*!*			*nLot
*!*			IF nQ_QTY <> 1
*!*				cMess = "QTY is not 1 "+ALLTRIM(STR(nQ_QTY))+CHR(13)+"and Pricing Units is Per LOT!"+CHR(13)+" for InqNumP="+cInqNumP
*!*				MESSAGEBOX(cMess,16,"Fix before proceding")
*!*				TrackError(cMess,"Pieces and QTY do not match when PU=3", PROGRAM(), LINENO(1))
*!*				lUpdateQuotes = .F.
*!*				lExitScan = .T.
*!*			ENDIF
*!*		CASE nQ_PU = 5
*!*			*Inched must match QTY 
*!*			IF nFeet = 0
*!*				nPieces		= PrepareSQLnum(Quotes.Pieces,'Pieces',7,0)
*!*				cForm		= PrepareSQLtxt(Quotes.Form,'Form',2)
*!*				nSz2		= PrepareSQLnum(Quotes.Sz2,'Sz2',9,3)
*!*				nSz3		= PrepareSQLnum(Quotes.Sz3,'Sz3',9,3)

*!*				nFeet = Calc_Feet(nPieces, cForm, nSZ2, nSZ3, gnConnHandle) nConn
*!*			ENDIF 
*!*			
*!*			nInches = ROUND(nFeet/12,0)
*!*			IF ROUND(nInches,0) <> ROUND(nQ_QTY,0) 
*!*				cMess = "Length of Inches on Quote "+ALLTRIM(STR(ROUND(nInches,0)))+CHR(13)+" does not match QTY "+ALLTRIM(STR(ROUND(nQ_QTY,0)))+CHR(13)+"and Pricing Units is Per Inch!"+CHR(13)+" for InqNumP="+cInqNumP
*!*				MESSAGEBOX(cMess,16,"Fix before proceding")
*!*				TrackError(cMess,"Pieces and QTY do not match when PU=3", PROGRAM(), LINENO(1))
*!*				lUpdateQuotes = .F.
*!*				lExitScan = .T.
*!*			ENDIF	
*!*		CASE nQ_PU = 6
*!*			*Weight in Kg must match QTY
*!*			nKg = nWeight / 2.205
*!*			IF ROUND(nKg ,0) <> ROUND(nQ_QTY,0)
*!*				cMess = "Weight in Kg on Quote "+ALLTRIM(STR(nKg ,10,0))+CHR(13)+" does not match QTY "+ALLTRIM(STR(nQ_QTY,10,0))+CHR(13)+"and Pricing Units is Per Kg!"+CHR(13)+" for InqNumP="+cInqNumP
*!*				MESSAGEBOX(cMess,16,"Fix before proceding")
*!*				TrackError(cMess,"Weight and QTY do not match when PU=1", PROGRAM(), LINENO(1))
*!*				lUpdateQuotes = .F.
*!*				lExitScan = .T.
*!*			ENDIF
*!*		CASE nQ_PU = 7
*!*			*MTR must match QTY 
*!*			IF nFeet = 0
*!*				nPieces		= PrepareSQLnum(Quotes.Pieces,'Pieces',7,0)
*!*				cForm		= PrepareSQLtxt(Quotes.Form,'Form',2)
*!*				nSz2		= PrepareSQLnum(Quotes.Sz2,'Sz2',9,3)
*!*				nSz3		= PrepareSQLnum(Quotes.Sz3,'Sz3',9,3)

*!*				nFeet = Calc_Feet(nPieces, cForm, nSZ2, nSZ3, gnConnHandle) nConn
*!*			ENDIF
*!*			
*!*			nMeters = ROUND(nFeet/ 3.281,0)
*!*			IF ROUND(nMeters ,0) <> ROUND(nQ_QTY,0) 
*!*				cMess = "Length of Meters on Quote "+ALLTRIM(STR(ROUND(nMeters,0)))+CHR(13)+" does not match QTY "+ALLTRIM(STR(ROUND(nQ_QTY,0)))+CHR(13)+"and Pricing Units is Per Meter!"+CHR(13)+" for InqNumP="+cInqNumP
*!*				MESSAGEBOX(cMess,16,"Fix before proceding")
*!*				TrackError(cMess,"Pieces and QTY do not match when PU=3", PROGRAM(), LINENO(1))
*!*				lUpdateQuotes = .F.
*!*				lExitScan = .T.
*!*			ENDIF				
*!*			
*!*		ENDCASE
*!*		*****
	
*!*		IF lUpdateQuotes 
*!*		
*!*			SELECT Quotes
*!*			REPLACE Weight WITH nWeight
*!*			REPLACE Q_P WITH nQ_P
*!*			REPLACE Q_QTY WITH nQ_QTY
*!*			REPLACE Q_PU WITH nQ_PU
*!*			REPLACE Q_Total WITH nQ_Total
*!*			REPLACE S_QTY WITH nS_QTY
*!*			REPLACE S_P WITH nS_P
*!*			REPLACE S_PU WITH nS_PU


RETURN 0
ENDPROC
************************************

*************************************
PROCEDURE Count_Quote_ID 
PARAMETERS nAllQ_ID, nSalesNum, pConnHandle
*nNumber = Count_Quote_ID (nAllQ_ID, nSalesNum, pConnHandle)
*Returns 0 for not found, 1 for found Quotes_ID, 2 for found Quotes_ID and SO

IF VARTYPE(nAllQ_ID) != "N"
	RETURN 0
ENDIF
IF VARTYPE(nSalesNum) != "N"
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
PRIVATE cSQL, nSQLEXEC

PRIVATE cAlias 
cAlias = ALIAS()

**********
IF USED('tmpPQ_Q_ID')
	SELECT tmpPQ_Q_ID
ELSE
	SELECT 0
ENDIF

cSQL = "SELECT COUNT(*) AS CNT FROM dbo.AllQuotes "
cSQL=cSQL+" WHERE ID = "+STR(nAllQ_ID)

nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPQ_Q_ID')
DO WHILE nSQLEXEC = 0
	WAIT WINDOW 'SQL' TIMEOUT 1
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPQ_Q_ID')
ENDDO
IF nSQLEXEC < 0 &&Try again!
	nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPQ_Q_ID")
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL 2' TIMEOUT 1
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPQ_Q_ID")

		IF nSQLEXEC < 0
			IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
				nSQLEXEC = 0
			ENDIF
		ENDIF
	ENDDO
ENDIF
IF nSQLEXEC < 0
	SQLEXECError( cSQL, nConn, nSQLEXEC, 'tmpPQ_Q_ID')
	RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
ENDIF

PRIVATE lFound_Q_ID, nReturnNum, lFound_SO
lFound_Q_ID = .F.
nReturnNum = 0
lFound_SO = .F.

IF USED('tmpPQ_Q_ID')
	IF tmpPQ_Q_ID.cnt > 0
		lFound_Q_ID = .T.
		nReturnNum = 1 &&Found Quotes_ID
	ENDIF
	
	USE IN tmpPQ_Q_ID
ENDIF

IF lFound_Q_ID

	cSQL= "SELECT SalesNum FROM dbo.AllQuotes "
	cSQL=cSQL+" WHERE ID = "+STR(nAllQ_ID)
	*cSQL=cSQL+" AND SalesNum = "+STR(nSalesNum)
	
	nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPQ_Q_ID')
	DO WHILE nSQLEXEC = 0
		WAIT WINDOW 'SQL' TIMEOUT 1
		nSQLEXEC = SQLEXEC( nConn, cSQL, 'tmpPQ_Q_ID')
	ENDDO
	IF nSQLEXEC < 0 &&Try again!
		nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPQ_Q_ID")
		DO WHILE nSQLEXEC = 0
			WAIT WINDOW 'SQL 2' TIMEOUT 1
			nSQLEXEC = SQLEXEC(nConn, cSQL, "tmpPQ_Q_ID")

			IF nSQLEXEC < 0
				IF MESSAGEBOX("SQL FAILED!"+CHR(13)+"Do you want to try again?",4+48,"ERROR") = 6
					nSQLEXEC = 0
				ENDIF
			ENDIF
		ENDDO
	ENDIF
	IF nSQLEXEC < 0
		SQLEXECError( cSQL, nConn, nSQLEXEC, 'tmpPQ_Q_ID')
		RecordError(nSQLEXEC,"SQL Error","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1),LINENO(),cSQL )
	ENDIF
		
	IF USED('tmpPQ_Q_ID')
		IF tmpPQ_Q_ID.SalesNum > 0
			IF tmpPQ_Q_ID.SalesNum <> nSalesNum
			lFound_SO = .T.
			nReturnNum = 3 &&Found Quotes_ID and SalesNum does not match
			ELSE
			*&&Found Quotes_ID and SalesNum matches
			lFound_SO = .T.
			nReturnNum = 2 &&Found Quotes_ID and SO
			ENDIF
		ENDIF
		
		USE IN tmpPQ_Q_ID
	ENDIF	
	
ENDIF

IF lNewConn 
	SQLDISCONNECT(nConn )
ENDIF

IF NOT EMPTY(cAlias)
	IF USED(cAlias)
		SELECT (cAlias)
	ELSE
		RecordTest("Record Test Data.","Proc_Quotes:"+PROGRAM()+" @"+PROGRAM(PROGRAM(-1)-1), LINENO(),"Lost Alias '"+cAlias+"'")
	ENDIF
ENDIF

RETURN nReturnNum
ENDPROC
