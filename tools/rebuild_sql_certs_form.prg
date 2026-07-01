* Rebuild SQL_certs.scx from SQL_certs.sc2 via FoxBin2Prg PRG2BIN
LOCAL lcRoot, lcSc2, lcScx, lcLog, lcFoxBin
lcRoot = "E:\VFP\ERP_2\"
lcSc2 = lcRoot + "Forms\SQL_certs.sc2"
lcScx = lcRoot + "Forms\SQL_certs.scx"
lcLog = lcRoot + "tools\rebuild_sql_certs_form.log"
lcFoxBin = lcRoot + "tools\foxbin2prg\foxbin2prg.prg"

SET DEFAULT TO (lcRoot)
CD (lcRoot)
STRTOFILE("PRG2BIN " + lcSc2 + " " + TTOC(DATETIME()) + CHR(13)+CHR(10), lcLog, .T.)

IF !FILE(lcSc2) OR !FILE(lcFoxBin)
	STRTOFILE("FAIL missing SC2 or FoxBin2Prg" + CHR(13)+CHR(10), lcLog, 1)
	QUIT
ENDIF

DO (lcFoxBin) WITH lcSc2, "PRG2BIN"

IF FILE(lcScx)
	STRTOFILE("OK rebuilt " + lcScx + CHR(13)+CHR(10), lcLog, 1)
ELSE
	STRTOFILE("FAIL PRG2BIN did not create " + lcScx + CHR(13)+CHR(10), lcLog, 1)
ENDIF
QUIT
