PARAMETER pSOitem

PRIVATE cSO,nSO,cItem,nItem,cSOitem
cSOitem = ""

IF TYPE("pSOitem")="C"
	pSOitem= ALLTRIM(pSOitem)
	nSO = VAL( LEFT(pSOitem,7) )
	cSO = STR( nSO, 7)
	nItem = VAL( RIGHT( ALLTRIM(pSOitem),2 ) )
	cItem = ALLTRIM( STR( nItem, 2) )
	IF nItem < 10
		cItem = '0'+cItem
	ENDIF
	cSOitem = cSO+"-"+cItem
ENDIF

RETURN cSOitem	
*See "Proc_ERP" for list of Proper_
