* Rebuild one SC2 (PRG2BIN) — used by run_rebuild_graphics_forms.bat
PARAMETERS tcSc2
LOCAL lcRoot
lcRoot = "E:\VFP\ERP_2\"
IF EMPTY(tcSc2)
	QUIT
ENDIF
SET DEFAULT TO (lcRoot)
CD (lcRoot)
DO prg2bin_one.prg WITH tcSc2
QUIT
