* Rebuild SetupERP and SetServer SCX from SC2 after environment UI changes
LOCAL lcRoot, laForms[2], laOut[2], i, lcSc2, lcScx, lcLog
lcRoot = ADDBS(JUSTPATH(SYS(16,1)))
laForms[1] = "Forms\setupERP.sc2"
laForms[2] = "Forms\setserver.sc2"
laOut[1] = "Forms\setuperp.scx"
laOut[2] = "Forms\setserver.scx"
lcLog = lcRoot + "tools\rebuild_setup_env_forms.log"
SET DEFAULT TO (lcRoot)
STRTOFILE("Rebuild start " + TTOC(DATETIME()) + CHR(13)+CHR(10), lcLog)
FOR i = 1 TO ALEN(laForms)
	lcSc2 = lcRoot + laForms[i]
	lcScx = lcRoot + laOut[i]
	STRTOFILE("PRG2BIN " + lcSc2 + CHR(13)+CHR(10), lcLog, .T.)
	DO tools\foxbin2prg\foxbin2prg.prg WITH lcSc2, "PRG2BIN"
	IF !FILE(lcScx)
		STRTOFILE("MISSING " + lcScx + CHR(13)+CHR(10), lcLog, .T.)
		QUIT
	ENDIF
	STRTOFILE("OK " + lcScx + " " + TTOC(DATETIME()) + CHR(13)+CHR(10), lcLog, .T.)
ENDFOR
STRTOFILE("Done" + CHR(13)+CHR(10), lcLog, .T.)
QUIT
