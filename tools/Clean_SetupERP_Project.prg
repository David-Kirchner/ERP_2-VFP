*====================================================================
* Clean_SetupERP_Project.prg
* Remove stray files from SetupERP.pjx (e.g. StockLst_Detail_Cost.scx)
* Close SetupERP in Project Manager first, or run from command window.
* Usage: DO tools\Clean_SetupERP_Project.prg
*====================================================================

LOCAL lcRoot, loProj, laKeep[1], i, j, lcName, lcFull, llKeep, nRemoved, loFile
lcRoot = ADDBS(SYS(5)+SYS(2003))

DIMENSION laKeep[10]
laKeep[1]  = "setuperp_main.prg"
laKeep[2]  = "load_erp_environment.prg"
laKeep[3]  = "erp_environment_ui.prg"
laKeep[4]  = "proc_setup.prg"
laKeep[5]  = "recorderror.prg"
laKeep[6]  = "setuperp.scx"
laKeep[7]  = "setserver.scx"
laKeep[8]  = "erp_company.ico"
laKeep[9]  = "setup_erp.mpr"
laKeep[10] = "erp_environment.xml"

FOR EACH loP IN _VFP.Projects FOXOBJECT
	loP.Close()
ENDFOR

MODIFY PROJECT (lcRoot + "SetupERP.pjx") NOWAIT NOSHOW
loProj = _VFP.Projects("SetupERP.pjx")
IF TYPE("loProj") # "O" OR ISNULL(loProj)
	MESSAGEBOX("Could not open SetupERP.pjx." + CHR(13) + ;
		"Close Project Manager and try again.", 16, "Clean SetupERP Project")
	RETURN
ENDIF

nRemoved = 0

WITH loProj.FILES
	FOR i = .Count TO 1 STEP -1
		loFile = .Item(i)
		lcFull = LOWER(ALLTRIM(loFile.Name))
		lcName = LOWER(JUSTFNAME(lcFull))
		llKeep = .F.
		FOR j = 1 TO ALEN(laKeep)
			IF lcName == laKeep[j] OR lcFull == laKeep[j]
				llKeep = .T.
				EXIT
			ENDIF
		ENDFOR
		IF !llKeep
			? "Removing:", loFile.Name
			loFile.Remove()
			nRemoved = nRemoved + 1
		ENDIF
	ENDFOR
ENDWITH

WITH loProj
	.SetMain(lcRoot + "progs\SetupERP_main.prg")
	.Debug = .T.
ENDWITH

loProj.Save()
loProj.Close()

MESSAGEBOX("SetupERP.pjx cleaned." + CHR(13) + ;
	"Removed " + TRANSFORM(nRemoved) + " file(s)." + CHR(13) + ;
	"Main program: PROGS\SetupERP_main.prg", 64, "Clean SetupERP Project")

RETURN
