*====================================================================
* CompanyProfile_maint.prg — launch Company Profile form (Admin)
* DO PROGS\CompanyProfile_maint
* Visual form: Forms\CompanyProfile_Maint.scx (edit via Form Designer)
*====================================================================

LOCAL lcRoot
lcRoot = ADDBS(SYS(5) + SYS(2003))
CD (lcRoot)

IF NOT "PROC_SETUP" $ UPPER(SET("PROCEDURE"))
	SET PROCEDURE TO (lcRoot + "PROGS\proc_setup.prg") ADDITIVE
ENDIF
IF NOT "LOAD_COMPANYPROFILE" $ UPPER(SET("PROCEDURE"))
	SET PROCEDURE TO (lcRoot + "PROGS\load_CompanyProfile.prg") ADDITIVE
ENDIF
IF NOT "COMPANY_BRANDING" $ UPPER(SET("PROCEDURE"))
	SET PROCEDURE TO (lcRoot + "PROGS\company_branding.prg") ADDITIVE
ENDIF

IF NOT HavePermission("Admin", .T.)
	MESSAGEBOX("Admin permission required to edit Company Profile.", 48, "Company Profile")
	RETURN
ENDIF

SET PROCEDURE TO (lcRoot + "PROGS\CompanyProfile_maint.prg") ADDITIVE
DO FORM (lcRoot + "Forms\CompanyProfile_Maint.scx")

RETURN

*--------------------------------------------------------------------
FUNCTION CompanyProfile_SQLQuote
LPARAMETERS tcVal
IF VARTYPE(tcVal) # "C"
	tcVal = TRANSFORM(tcVal)
ENDIF
RETURN "'" + STRTRAN(ALLTRIM(tcVal), "'", "''") + "'"
