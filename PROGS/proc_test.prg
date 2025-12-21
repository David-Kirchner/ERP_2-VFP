*IF NOT "PROC_Test" $ SET("PROCEDURE")  &&Added for when Quotes is run without HPA menu.
*	SET PROCEDURE TO Progs\Proc_Test ADDITIVE
*ENDIF

************************************************************************

***********************************
FUNCTION SQLComms
PARAMETERS xquery, xresult

IF NOT "PROC_SQL" $ SET("PROCEDURE")  &&Added for when Quotes is run without HPA menu.
	SET PROCEDURE TO Progs\Proc_SQL ADDITIVE
ENDIF

PRIVATE nConn
nConn= get_SQLSTRINGCONNECT() 

if isnull(xresult) or empty(xresult)
	xres=sqlexec(nConn,xquery,xresult)
ELSE
	xres=sqlexec(nConn,xquery)
ENDIF

sqldisconnect(nConn)
return xres

