* BIN2PRG ERP-crash.PJX and erp_2.pjx to text for comparison
LOCAL lcRoot, lcFoxBin, lcLog
lcRoot = "E:\VFP\ERP_2\"
lcFoxBin = lcRoot + "tools\foxbin2prg\foxbin2prg.prg"
lcLog = lcRoot + "tools\bin2prg_projects.log"
SET DEFAULT TO (lcRoot)
_SCREEN.Visible = .F.
SET TALK OFF
STRTOFILE("BIN2PRG projects " + TTOC(DATETIME()) + CHR(13)+CHR(10), lcLog, .F.)
LOCAL ARRAY laPjx[3]
laPjx[1] = lcRoot + "ERP-crash.PJX"
laPjx[2] = lcRoot + "erp_2.pjx"
laPjx[3] = lcRoot + "erp_test.pjx"
LOCAL i, lcPjx, lcPj2
FOR i = 1 TO ALEN(laPjx)
	lcPjx = laPjx[i]
	IF !FILE(lcPjx)
		STRTOFILE("SKIP " + lcPjx + CHR(13)+CHR(10), lcLog, 1)
		LOOP
	ENDIF
	DO (lcFoxBin) WITH lcPjx, "BIN2PRG"
	lcPj2 = STRTRAN(lcPjx, ".PJX", ".PJ2")
	lcPj2 = STRTRAN(lcPj2, ".pjx", ".pj2")
	IF FILE(lcPj2)
		STRTOFILE("OK " + lcPj2 + CHR(13)+CHR(10), lcLog, 1)
	ELSE
		lcPj2 = FORCEEXT(lcPjx, "pj2")
		IF FILE(lcPj2)
			STRTOFILE("OK " + lcPj2 + CHR(13)+CHR(10), lcLog, 1)
		ELSE
			STRTOFILE("FAIL no PJ2 for " + lcPjx + CHR(13)+CHR(10), lcLog, 1)
		ENDIF
	ENDIF
ENDFOR
QUIT
