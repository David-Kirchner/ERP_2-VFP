*====================================================================
* IsoDocument_maint.prg — launch ISO document registry (Admin)
* DO PROGS\IsoDocument_maint
* Visual form: Forms\IsoDocument_Maint.scx
*====================================================================

IF NOT "PROC_SETUP" $ UPPER(SET("PROCEDURE"))
	SET PROCEDURE TO PROGS\proc_setup ADDITIVE
ENDIF

IF NOT HavePermission("Admin", .T.)
	MESSAGEBOX("Admin permission required to edit ISO document numbers.", 48, "ISO Documents")
	RETURN
ENDIF

SET PROCEDURE TO PROGS\IsoDocument_maint ADDITIVE
IF FILE("REPORTS\company_report.prg")
	SET PROCEDURE TO REPORTS\company_report.prg ADDITIVE
ENDIF
DO FORM Forms\IsoDocument_Maint.scx

RETURN

*--------------------------------------------------------------------
FUNCTION IsoDocument_SQLQuote
LPARAMETERS tcVal
IF VARTYPE(tcVal) # "C"
	tcVal = TRANSFORM(tcVal)
ENDIF
RETURN "N'" + STRTRAN(ALLTRIM(tcVal), "'", "''") + "'"
