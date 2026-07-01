* Ensure FoxBin2Prg text (SC2/VC2/FR2/...) is current before editing.
* BIN2PRG when binary is newer than text, or text is missing.
PARAMETERS tcPath
LOCAL lcRoot, lcVfp, lcB2p, lcText, lcBin, laB[1], laT[1], llNeedB2p, lcCmd, lcLog
lcRoot = "E:\VFP\ERP_2\"
lcVfp = "C:\Program Files (x86)\Microsoft Visual FoxPro 9\vfp9.exe"
lcB2p = lcRoot + "tools\foxbin2prg\foxbin2prg_b2p.prg"
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
CASE UPPER(JUSTEXT(lcText)) $ "SCX"
	lcBin = lcText
	lcText = FORCEEXT(lcText, "sc2")
CASE UPPER(JUSTEXT(lcText)) $ "VCX"
	lcBin = lcText
	lcText = FORCEEXT(lcText, "vc2")
CASE UPPER(JUSTEXT(lcText)) $ "FRX"
	lcBin = lcText
	lcText = FORCEEXT(lcText, "fr2")
OTHERWISE
	STRTOFILE("SKIP unknown ext " + tcPath + CHR(13)+CHR(10), lcLog, 1)
	RETURN .F.
ENDCASE
llNeedB2p = .F.
IF !FILE(lcBin)
	RETURN .T.
ENDIF
IF !FILE(lcText)
	llNeedB2p = .T.
ELSE
	ADIR(laB, lcBin)
	ADIR(laT, lcText)
	IF laB[1,3] > laT[1,3] OR (laB[1,3] = laT[1,3] AND laB[1,4] > laT[1,4])
		llNeedB2p = .T.
	ENDIF
ENDIF
IF !llNeedB2p
	STRTOFILE("CURRENT " + JUSTFNAME(lcText) + CHR(13)+CHR(10), lcLog, 1)
	RETURN .T.
ENDIF
STRTOFILE("BIN2PRG " + JUSTFNAME(lcBin) + " " + TTOC(DATETIME()) + CHR(13)+CHR(10), lcLog, 1)
lcCmd = ["] + lcVfp + [" ] + lcB2p + [" ] + lcBin + ["]
RUN /W &lcCmd
IF FILE(lcText)
	STRTOFILE("OK BIN2PRG " + JUSTFNAME(lcText) + CHR(13)+CHR(10), lcLog, 1)
	RETURN .T.
ENDIF
STRTOFILE("FAIL BIN2PRG " + JUSTFNAME(lcBin) + CHR(13)+CHR(10), lcLog, 1)
RETURN .F.
