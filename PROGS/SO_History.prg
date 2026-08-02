*====================================================================
* SO_History.prg — Sales Order chronology + money (P2 read-only)
* DO PROGS\SO_History
* DO PROGS\SO_History WITH nSalesNum
* Visual form: Forms\SO_History.scx
*====================================================================

LPARAMETERS tnSalesNum

LOCAL lcRoot, lnSales
lcRoot = ADDBS(SYS(5) + SYS(2003))
CD (lcRoot)

IF NOT "PROC_SETUP" $ UPPER(SET("PROCEDURE"))
	SET PROCEDURE TO (lcRoot + "PROGS\proc_setup.prg") ADDITIVE
ENDIF

SET PROCEDURE TO (lcRoot + "PROGS\SO_History.prg") ADDITIVE

lnSales = 0
IF VARTYPE(tnSalesNum) = "N"
	lnSales = INT(tnSalesNum)
ENDIF

IF lnSales > 0
	DO FORM (lcRoot + "Forms\SO_History.scx") WITH lnSales
ELSE
	DO FORM (lcRoot + "Forms\SO_History.scx")
ENDIF

RETURN
