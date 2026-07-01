* PRG2BIN all Forms\*.sc2 -> .scx (visual source to VFP binaries)
LOCAL lcRoot, lcFoxBin, lcLog, laF[1], ln, i, lcSc2, lcScx, lnOk, lnFail
lcRoot = "E:\VFP\ERP_2\"
lcFoxBin = lcRoot + "tools\foxbin2prg\foxbin2prg.prg"
lcLog = lcRoot + "tools\prg2bin_all_forms.log"
SET DEFAULT TO (lcRoot)
CD (lcRoot)
_SCREEN.Visible = .F.
SET TALK OFF
STRTOFILE("PRG2BIN all Forms SC2 " + TTOC(DATETIME()) + CHR(13)+CHR(10), lcLog, .F.)
IF !FILE(lcFoxBin)
	STRTOFILE("FAIL missing foxbin2prg" + CHR(13)+CHR(10), lcLog, 1)
	QUIT
ENDIF
ln = ADIR(laF, lcRoot + "Forms\*.sc2")
lnOk = 0
lnFail = 0
FOR i = 1 TO ln
	lcSc2 = lcRoot + "Forms\" + laF[i, 1]
	lcScx = STRTRAN(lcSc2, ".sc2", ".scx")
	DO (lcFoxBin) WITH lcSc2, "PRG2BIN"
	IF FILE(lcScx)
		lnOk = lnOk + 1
		STRTOFILE("OK " + laF[i, 1] + CHR(13)+CHR(10), lcLog, 1)
	ELSE
		lnFail = lnFail + 1
		STRTOFILE("FAIL " + laF[i, 1] + CHR(13)+CHR(10), lcLog, 1)
	ENDIF
ENDFOR
STRTOFILE("DONE ok=" + TRANSFORM(lnOk) + " fail=" + TRANSFORM(lnFail) + CHR(13)+CHR(10), lcLog, 1)
QUIT
