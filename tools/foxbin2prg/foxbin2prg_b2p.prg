* Single-file BIN2PRG runner - always QUIT so VFP does not stay open
LPARAMETERS tcFile
LOCAL oFb, nResult, cToolDir
PRIVATE oFoxBin2prg

_SCREEN.Visible = .F.
IF TYPE("_VFP") = "O"
	_VFP.Visible = .F.
ENDIF

IF VARTYPE(tcFile) # "C" OR EMPTY(tcFile)
	QUIT
ENDIF

cToolDir = JUSTPATH(SYS(16,1))
IF EMPTY(cToolDir)
	cToolDir = JUSTPATH(SYS(16,0))
ENDIF
IF !FILE(ADDBS(cToolDir) + "foxbin2prg.prg") AND !FILE(ADDBS(cToolDir) + "foxbin2prg.exe")
	cToolDir = JUSTPATH(SYS(16,0))
ENDIF
IF !FILE(ADDBS(cToolDir) + "foxbin2prg.prg") AND !FILE(ADDBS(cToolDir) + "foxbin2prg.exe")
	* Last resort: known ERP tools folder
	cToolDir = "E:\VFP\ERP_2\tools\foxbin2prg"
ENDIF
IF !FILE(ADDBS(cToolDir) + "foxbin2prg.prg")
	? "foxbin2prg_b2p: foxbin2prg.prg not found in " + cToolDir
	QUIT
ENDIF
CD (cToolDir)
SET PROCEDURE TO (ADDBS(cToolDir) + "foxbin2prg.prg") ADDITIVE

IF !FILE(tcFile)
	? "foxbin2prg_b2p: target file not found: " + tcFile
	QUIT
ENDIF

oFb = CREATEOBJECT("c_foxbin2prg")
* tcRecompile 0 = export to SC2/FR2/VC2 only (this file, no folder rescan)
nResult = oFb.execute(tcFile, "BIN2PRG", "0", "0", "1", "1", "1", "", "", .F., "", "0", "1")
IF oFb.l_Error
	nResult = 1
ENDIF
IF PEMSTATUS(oFb, "unloadProgressbarForm", 5)
	oFb.unloadProgressbarForm(.T.)
ENDIF
oFb = NULL
CLEAR ALL
QUIT
