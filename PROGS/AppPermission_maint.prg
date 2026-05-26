*====================================================================
* AppPermission_maint.prg — launch App Permissions form (Admin)
* DO PROGS\AppPermission_maint
* Visual form: Forms\AppPermission_maint.scx (edit via Form Designer)
*====================================================================

IF NOT "PROC_SETUP" $ UPPER(SET("PROCEDURE"))
	SET PROCEDURE TO PROGS\proc_setup ADDITIVE
ENDIF

IF NOT HavePermission("Admin", .T.)
	MESSAGEBOX("Admin permission required to edit program permissions.", 48, "App Permissions")
	RETURN
ENDIF

SET PROCEDURE TO PROGS\AppPermission_maint ADDITIVE
DO FORM Forms\AppPermission_maint.scx

RETURN

*--------------------------------------------------------------------
FUNCTION AppPermission_SQLQuote
LPARAMETERS tcVal
IF VARTYPE(tcVal) # "C"
	tcVal = TRANSFORM(tcVal)
ENDIF
RETURN "N'" + STRTRAN(ALLTRIM(tcVal), "'", "''") + "'"
