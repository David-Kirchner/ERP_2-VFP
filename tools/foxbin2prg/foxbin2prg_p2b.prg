* Single-file PRG2BIN runner - always QUIT so VFP does not stay open
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
IF !FILE(cToolDir + "foxbin2prg.prg") AND !FILE(cToolDir + "foxbin2prg.exe")
	cToolDir = JUSTPATH(SYS(16,0))
ENDIF
CD (cToolDir)
SET PROCEDURE TO (ADDBS(cToolDir) + "foxbin2prg.prg") ADDITIVE

oFb = CREATEOBJECT("c_foxbin2prg")
* tcRecompile 0 = SC2/FR2/VC2 to binary only (no COMPILE FORM after)
nResult = oFb.execute(tcFile, "PRG2BIN", "0", "0", "1", "1", "1", "", "", .F., "", "0", "1")
IF oFb.l_Error
	nResult = 1
ENDIF
IF PEMSTATUS(oFb, "unloadProgressbarForm", 5)
	oFb.unloadProgressbarForm(.T.)
ENDIF
oFb = NULL
CLEAR ALL
QUIT
