*====================================================================
* QboSync_maint.prg — launch QBO Sync Status (Accounting)
* DO PROGS\QboSync_maint
* Visual form: Forms\QboSync_Maint.scx
*====================================================================

IF NOT "PROC_SETUP" $ UPPER(SET("PROCEDURE"))
	SET PROCEDURE TO PROGS\proc_setup ADDITIVE
ENDIF

IF NOT HavePermission("Admin", .T.)
	MESSAGEBOX("Admin permission required for QBO Sync Status (Phase 1).", 48, "QBO Sync")
	RETURN
ENDIF

SET PROCEDURE TO PROGS\QboSync_maint ADDITIVE
DO FORM Forms\QboSync_Maint.scx

RETURN
