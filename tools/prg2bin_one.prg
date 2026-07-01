* PRG2BIN one FoxBin2Prg text file (SC2/VC2/FR2/...) — run after editing text.
PARAMETERS tcPath
LOCAL lcRoot, lcVfp, lcP2b, lcText, lcBin, lcCmd, lcLog, lcErr
lcRoot = "E:\VFP\ERP_2\"
lcVfp = "C:\Program Files (x86)\Microsoft Visual FoxPro 9\vfp9.exe"
lcP2b = lcRoot + "tools\foxbin2prg\foxbin2prg_p2b.prg"
lcLog = lcRoot + "tools\foxbin_sync.log"
IF EMPTY(tcPath)
	RETURN .F.
ENDIF
SET DEFAULT TO (lcRoot)
CD (lcRoot)
lcText = FULLPATH(tcPath)
IF EMPTY(lcText) OR !FILE(lcText)
	lcText = FULLPATH(lcRoot + tcPath)
ENDIF
DO CASE
CASE UPPER(JUSTEXT(lcText)) $ "SC2"
	lcBin = FORCEEXT(lcText, "scx")
CASE UPPER(JUSTEXT(lcText)) $ "VC2"
	lcBin = FORCEEXT(lcText, "vcx")
CASE UPPER(JUSTEXT(lcText)) $ "FR2"
	lcBin = FORCEEXT(lcText, "frx")
CASE UPPER(JUSTEXT(lcText)) $ "MN2"
	lcBin = FORCEEXT(lcText, "mnx")
CASE UPPER(JUSTEXT(lcText)) $ "LB2"
	lcBin = FORCEEXT(lcText, "lbx")
CASE UPPER(JUSTEXT(lcText)) $ "PJ2"
	lcBin = FORCEEXT(lcText, "pjx")
OTHERWISE
	STRTOFILE("SKIP PRG2BIN unknown ext " + tcPath + CHR(13)+CHR(10), lcLog, 1)
	RETURN .F.
ENDCASE
IF !FILE(lcText)
	STRTOFILE("MISSING text " + lcText + CHR(13)+CHR(10), lcLog, 1)
	RETURN .F.
ENDIF
STRTOFILE("PRG2BIN " + JUSTFNAME(lcText) + " " + TTOC(DATETIME()) + CHR(13)+CHR(10), lcLog, 1)
lcCmd = ["] + lcVfp + [" ] + lcP2b + [" ] + lcText + ["]
RUN /W &lcCmd
IF FILE(lcBin)
	STRTOFILE("OK PRG2BIN " + JUSTFNAME(lcText) + CHR(13)+CHR(10), lcLog, 1)
	RETURN .T.
ENDIF
STRTOFILE("FAIL PRG2BIN " + JUSTFNAME(lcText) + CHR(13)+CHR(10), lcLog, 1)
RETURN .F.
