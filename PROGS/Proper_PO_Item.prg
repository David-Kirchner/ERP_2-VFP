PARAMETER pPOitem

PRIVATE cPO,nPO,cItem,nItem,cPOitem
cPOitem = ""
*Proper_PO_Item_PO

IF TYPE("pPOitem")="C"
	nPO = VAL( LEFT(pPOitem,9) )
	cPO = STR( nPO, 9)
	nItem = VAL( RIGHT( ALLTRIM(pPOitem),2 ) )
	cItem = ALLTRIM( STR( nItem, 2) )
	IF nItem < 10
		cItem = '0'+cItem
	ENDIF
	cPOitem = cPO+"-"+cItem
ENDIF

RETURN cPOitem	
*See "Proc_ERP" for list of Proper_