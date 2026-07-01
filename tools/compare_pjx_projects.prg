* Compare project member lists: ERP-crash vs erp_2 (working copy of ERP_Test)
LOCAL lcRoot, lcOut, lcCrash, lcWork, laCrash[1], laWork[1], i, lcLine
LOCAL lnOnlyCrash, lnOnlyWork, lnBoth
lcRoot = "E:\VFP\ERP_2\"
lcOut  = lcRoot + "MEM\ERP2_vs_ERP-crash_files.txt"
lcCrash = lcRoot + "ERP-crash.PJX"
lcWork  = lcRoot + "erp_2.pjx"
IF !FILE(lcWork)
	lcWork = lcRoot + "erp_test.pjx"
ENDIF
SET DEFAULT TO (lcRoot)
CD (lcRoot)
_SCREEN.Visible = .F.
SET TALK OFF
CLOSE ALL
STRTOFILE("ERP_2 project comparison " + TTOC(DATETIME()) + CHR(13)+CHR(10), lcOut, .F.)
STRTOFILE("Crash project: " + lcCrash + " exists=" + TRANSFORM(FILE(lcCrash)) + CHR(13)+CHR(10), lcOut, 1)
STRTOFILE("Work project:  " + lcWork + " exists=" + TRANSFORM(FILE(lcWork)) + CHR(13)+CHR(10), lcOut, 1)
IF FILE(lcRoot + "ERP-crash.pjt")
	STRTOFILE("ERP-crash.pjt bytes: " + TRANSFORM(FILE(lcRoot + "ERP-crash.pjt")) + CHR(13)+CHR(10), lcOut, 1)
ENDIF
IF FILE(lcRoot + "erp_2.pjt")
	STRTOFILE("erp_2.pjt bytes: " + TRANSFORM(FILE(lcRoot + "erp_2.pjt")) + CHR(13)+CHR(10), lcOut, 1)
ENDIF
IF FILE(lcRoot + "erp_test.pjt")
	STRTOFILE("erp_test.pjt bytes: " + TRANSFORM(FILE(lcRoot + "erp_test.pjt")) + CHR(13)+CHR(10), lcOut, 1)
ENDIF
STRTOFILE(REPLICATE("-", 72) + CHR(13)+CHR(10), lcOut, 1)
IF !FILE(lcCrash) .OR. !FILE(lcWork)
	STRTOFILE("FAIL missing PJX" + CHR(13)+CHR(10), lcOut, 1)
	QUIT
ENDIF
laCrash = LoadPjxList(lcCrash)
laWork  = LoadPjxList(lcWork)
STRTOFILE("Members in ERP-crash: " + TRANSFORM(ALEN(laCrash)) + CHR(13)+CHR(10), lcOut, 1)
STRTOFILE("Members in work PJX:  " + TRANSFORM(ALEN(laWork)) + CHR(13)+CHR(10), lcOut, 1)
STRTOFILE(REPLICATE("-", 72) + CHR(13)+CHR(10), lcOut, 1)
STRTOFILE("ONLY IN ERP-crash (not in work project):" + CHR(13)+CHR(10), lcOut, 1)
lnOnlyCrash = 0
FOR i = 1 TO ALEN(laCrash)
	IF ASCAN(laWork, laCrash[i], 1, ALEN(laWork), 0, 14) = 0
		lnOnlyCrash = lnOnlyCrash + 1
		STRTOFILE("  " + laCrash[i] + CHR(13)+CHR(10), lcOut, 1)
	ENDIF
ENDFOR
STRTOFILE("Count: " + TRANSFORM(lnOnlyCrash) + CHR(13)+CHR(10), lcOut, 1)
STRTOFILE(REPLICATE("-", 72) + CHR(13)+CHR(10), lcOut, 1)
STRTOFILE("ONLY IN work project (not in ERP-crash):" + CHR(13)+CHR(10), lcOut, 1)
lnOnlyWork = 0
FOR i = 1 TO ALEN(laWork)
	IF ASCAN(laCrash, laWork[i], 1, ALEN(laCrash), 0, 14) = 0
		lnOnlyWork = lnOnlyWork + 1
		STRTOFILE("  " + laWork[i] + CHR(13)+CHR(10), lcOut, 1)
	ENDIF
ENDFOR
STRTOFILE("Count: " + TRANSFORM(lnOnlyWork) + CHR(13)+CHR(10), lcOut, 1)
STRTOFILE(REPLICATE("-", 72) + CHR(13)+CHR(10), lcOut, 1)
STRTOFILE("IN BOTH:" + CHR(13)+CHR(10), lcOut, 1)
lnBoth = 0
FOR i = 1 TO ALEN(laCrash)
	IF ASCAN(laWork, laCrash[i], 1, ALEN(laWork), 0, 14) > 0
		lnBoth = lnBoth + 1
	ENDIF
ENDFOR
STRTOFILE("Count: " + TRANSFORM(lnBoth) + CHR(13)+CHR(10), lcOut, 1)
STRTOFILE("DONE" + CHR(13)+CHR(10), lcOut, 1)
QUIT

FUNCTION LoadPjxList
	LPARAMETERS tcPjx
	LOCAL laOut[1], ln
	USE (tcPjx) IN 0 SHARED ALIAS pjlist
	ln = 0
	SCAN FOR !EMPTY(ALLTRIM(name))
		ln = ln + 1
		DIMENSION laOut[ln]
		laOut[ln] = LOWER(ALLTRIM(name))
	ENDSCAN
	USE IN pjlist
	RETURN laOut
ENDFUNC
