* Rebuild setuperp.scx and setserver.scx from SC2 (output: E:\VFP\ERP_2\Forms\)
* DO tools\rebuild_setup_env_forms
LOCAL lcRoot, lcFoxBin, laSc2[3], laScx[3], i, lcSc2, lcScx, llAnyError, lcMsg, lnH, lnI, lcDir

lcRoot = RebuildSetup_FindERPRoot()
lcFoxBin = lcRoot + "tools\foxbin2prg\foxbin2prg.prg"

laSc2[1] = "Forms\setupERP.sc2"
laScx[1] = "Forms\setuperp.scx"
laSc2[2] = "Forms\setserver.sc2"
laScx[2] = "Forms\setserver.scx"
laSc2[3] = "Forms\erp_menu.sc2"
laScx[3] = "Forms\erp_menu.scx"

llAnyError = .F.
lcMsg = ""

IF EMPTY(lcRoot) OR !FILE(lcFoxBin)
	MESSAGEBOX("FoxBin2Prg not found." + CHR(13) ;
		+ "Expected: " + lcRoot + "tools\foxbin2prg\foxbin2prg.prg" + CHR(13) ;
		+ "CD to E:\VFP\ERP_2 and run: DO tools\rebuild_setup_env_forms", 16, "Rebuild setup/env forms")
	RETURN .F.
ENDIF

SET DEFAULT TO (lcRoot)

FOR i = 1 TO ALEN(laSc2)
	lcSc2 = lcRoot + laSc2[i]
	lcScx = lcRoot + laScx[i]
	IF NOT FILE(lcSc2)
		llAnyError = .T.
		lcMsg = lcMsg + "Missing: " + lcSc2 + CHR(13)
		LOOP
	ENDIF
	IF FILE(lcScx)
		lnH = FOPEN(lcScx, 12)
		IF lnH < 0
			llAnyError = .T.
			lcMsg = lcMsg + "Locked (close form / Designer): " + lcScx + CHR(13)
			LOOP
		ENDIF
		= FCLOSE(lnH)
	ENDIF
	DO (lcFoxBin) WITH lcSc2, "PRG2BIN"
	IF !FILE(lcScx)
		llAnyError = .T.
		lcMsg = lcMsg + "PRG2BIN did not create: " + lcScx + CHR(13)
	ENDIF
ENDFOR

IF llAnyError
	lcMsg = lcMsg + CHR(13) + "Also check tools\foxbin2prg\FoxBin2Prg_Error.LOG if present."
	MESSAGEBOX("Rebuild finished with errors." + CHR(13) + CHR(13) + lcMsg, 48, "Rebuild setup/env forms")
	RETURN .F.
ENDIF

MESSAGEBOX("Rebuilt:" + CHR(13) + lcRoot + "Forms\setuperp.scx" + CHR(13) ;
		+ lcRoot + "Forms\setserver.scx" + CHR(13) + lcRoot + "Forms\erp_menu.scx", 64, "Rebuild setup/env forms")
RETURN .T.

*--------------------------------------------------------------------
FUNCTION RebuildSetup_FindERPRoot
LOCAL lcDir, lnI, lcProbe
* Start from this PRG's folder, walk up until tools\foxbin2prg\foxbin2prg.prg exists
lcDir = JUSTPATH(SYS(16,1))
FOR lnI = 1 TO 8
	lcProbe = ADDBS(lcDir) + "tools\foxbin2prg\foxbin2prg.prg"
	IF FILE(lcProbe)
		RETURN ADDBS(lcDir)
	ENDIF
	IF lcDir == JUSTPATH(lcDir)
		EXIT
	ENDIF
	lcDir = JUSTPATH(lcDir)
ENDFOR
* Fallback: current SET DEFAULT directory
lcDir = ADDBS(SYS(5) + SYS(2003))
IF FILE(lcDir + "tools\foxbin2prg\foxbin2prg.prg")
	RETURN lcDir
ENDIF
RETURN ""
