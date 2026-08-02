*====================================================================
* WO_Material.prg — Work Order material inquiry (P1 read-only)
* DO PROGS\WO_Material
* DO PROGS\WO_Material WITH nWO
* Visual form: Forms\WO_Material.scx
*====================================================================

LPARAMETERS tnWO

LOCAL lcRoot, lnWO
lcRoot = ADDBS(SYS(5) + SYS(2003))
CD (lcRoot)

IF NOT "PROC_SETUP" $ UPPER(SET("PROCEDURE"))
	SET PROCEDURE TO (lcRoot + "PROGS\proc_setup.prg") ADDITIVE
ENDIF

SET PROCEDURE TO (lcRoot + "PROGS\WO_Material.prg") ADDITIVE

lnWO = 0
IF VARTYPE(tnWO) = "N"
	lnWO = INT(tnWO)
ENDIF

IF lnWO > 0
	DO FORM (lcRoot + "Forms\WO_Material.scx") WITH lnWO
ELSE
	DO FORM (lcRoot + "Forms\WO_Material.scx")
ENDIF

RETURN
