*====================================================================
* CompanyBranding_maint.prg — launch Company Branding form (Admin)
* DO PROGS\CompanyBranding_maint
* Visual form: Forms\CompanyBranding_Maint.scx (edit via Form Designer)
* Library (no UI): PROGS\company_branding.prg
*====================================================================

LOCAL lcRoot
lcRoot = ADDBS(SYS(5) + SYS(2003))
CD (lcRoot)

IF NOT "PROC_SETUP" $ UPPER(SET("PROCEDURE"))
	SET PROCEDURE TO (lcRoot + "PROGS\proc_setup.prg") ADDITIVE
ENDIF
IF NOT "COMPANY_BRANDING" $ UPPER(SET("PROCEDURE"))
	SET PROCEDURE TO (lcRoot + "PROGS\company_branding.prg") ADDITIVE
ENDIF

IF NOT HavePermission("Admin", .T.)
	MESSAGEBOX("Admin permission required for Company Branding.", 48, "Company Branding")
	RETURN
ENDIF

DO FORM (lcRoot + "Forms\CompanyBranding_Maint.scx")

RETURN
