* List members in ERP-crash not in erp_2 (and reverse)
LOCAL lcRoot, lcOut, laCrash[1], laWork[1], i
lcRoot = "E:\VFP\ERP_2\"
lcOut = lcRoot + "MEM\ERP-crash_vs_erp_2_diff.txt"
SET DEFAULT TO (lcRoot)
_SCREEN.Visible = .F.
SET TALK OFF
CLOSE ALL
laCrash = Pj2Adds(lcRoot + "ERP-crash.PJ2")
laWork  = Pj2Adds(lcRoot + "erp_2.PJ2")
STRTOFILE("ERP-crash vs erp_2 " + TTOC(DATETIME()) + CHR(13)+CHR(10), lcOut, .F.)
STRTOFILE("ERP-crash members: " + TRANSFORM(ALEN(laCrash)) + CHR(13)+CHR(10), lcOut, 1)
STRTOFILE("erp_2 members: " + TRANSFORM(ALEN(laWork)) + CHR(13)+CHR(10), lcOut, 1)
STRTOFILE("erp_2.pjt bytes: " + TRANSFORM(FILE(lcRoot + "erp_2.pjt")) + CHR(13)+CHR(10), lcOut, 1)
STRTOFILE("ERP-crash.pjt bytes: " + TRANSFORM(FILE(lcRoot + "ERP-crash.pjt")) + CHR(13)+CHR(10), lcOut, 1)
STRTOFILE(REPLICATE("-",60)+CHR(13)+CHR(10), lcOut, 1)
STRTOFILE("ONLY in ERP-crash (missing from erp_2):" + CHR(13)+CHR(10), lcOut, 1)
FOR i = 1 TO ALEN(laCrash)
	IF ASCAN(laWork, laCrash[i], 1, ALEN(laWork), 0, 15) = 0
		STRTOFILE("  " + laCrash[i] + CHR(13)+CHR(10), lcOut, 1)
	ENDIF
ENDFOR
STRTOFILE(REPLICATE("-",60)+CHR(13)+CHR(10), lcOut, 1)
STRTOFILE("ONLY in erp_2 (not in ERP-crash):" + CHR(13)+CHR(10), lcOut, 1)
FOR i = 1 TO ALEN(laWork)
	IF ASCAN(laCrash, laWork[i], 1, ALEN(laCrash), 0, 15) = 0
		STRTOFILE("  " + laWork[i] + CHR(13)+CHR(10), lcOut, 1)
	ENDIF
ENDFOR
STRTOFILE("DONE" + CHR(13)+CHR(10), lcOut, 1)
QUIT

FUNCTION Pj2Adds
	LPARAMETERS tcPj2
	LOCAL laOut[1], ln, lcLine, lcPath, laM[1]
	ln = ALINES(laM, FILETOSTR(tcPj2))
	ln = 0
	FOR EACH lcLine IN laM
		IF ".ADD('" $ lcLine
			lcPath = STREXTRACT(lcLine, ".ADD('", "'")
			IF !EMPTY(lcPath)
				ln = ln + 1
				DIMENSION laOut[ln]
				laOut[ln] = LOWER(ALLTRIM(lcPath))
			ENDIF
		ENDIF
	ENDFOR
	RETURN laOut
ENDFUNC
