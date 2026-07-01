LOCAL lcRoot, lcPj2, lcLog, lcPjx, lcPjt, lnPjx, lnPjt
lcRoot = "E:\VFP\ERP_2\"
lcPj2  = lcRoot + "ERP.PJ2"
lcPjx  = lcRoot + "ERP.PJX"
lcPjt  = lcRoot + "ERP.PJT"
lcLog  = lcRoot + "tools\rebuild_erp_project.log"
SET DEFAULT TO (lcRoot)
CD (lcRoot)
STRTOFILE("Rebuild ERP project " + TTOC(DATETIME()) + CHR(13) + CHR(10), lcLog, .F.)
IF !FILE(lcPj2)
	STRTOFILE("MISSING " + lcPj2 + CHR(13) + CHR(10), lcLog, .T.)
	QUIT
ENDIF
* tcBackupLevels 0: avoid erp.pjx.bak name clash on case-insensitive NTFS
DO tools\foxbin2prg\foxbin2prg.prg WITH lcPj2, "PRG2BIN", "0", "0", "1", "1", "1", "", "", .F., "", lcRoot, "0"
LOCAL laF[1], lnPjx, lnPjt, lcArch
lnPjx = 0
lnPjt = 0
lcArch = lcRoot + "tools\project_bak_archive\"
IF ADIR(laF, lcPjx) > 0
	lnPjx = laF[1, 2]
ENDIF
IF ADIR(laF, lcPjt) > 0
	lnPjt = laF[1, 2]
ENDIF
IF lnPjx > 1000 AND lnPjt > 500000
	STRTOFILE("OK PJX=" + TRANSFORM(lnPjx) + " PJT=" + TRANSFORM(lnPjt) + CHR(13) + CHR(10), lcLog, .T.)
ELSE
	STRTOFILE("FAIL truncated PJX/PJT PJX=" + TRANSFORM(lnPjx) + " PJT=" + TRANSFORM(lnPjt) + CHR(13) + CHR(10), lcLog, .T.)
	IF FILE(lcArch + "erp.pjt.bak.20260610")
		COPY FILE (lcArch + "erp.pjt.bak.20260610") TO (lcPjt)
		STRTOFILE("Auto-restored PJT from project_bak_archive" + CHR(13) + CHR(10), lcLog, .T.)
	ENDIF
	IF FILE(lcArch + "erp.pjx.bak.20260610")
		COPY FILE (lcArch + "erp.pjx.bak.20260610") TO (lcPjx)
		STRTOFILE("Auto-restored PJX from project_bak_archive" + CHR(13) + CHR(10), lcLog, .T.)
	ENDIF
	STRTOFILE("Do NOT use FoxBin2Prg on ERP.PJ2 until PJT truncation is fixed; use set_erp_certs_exclude for EXCLUDE." + CHR(13) + CHR(10), lcLog, .T.)
ENDIF
QUIT
