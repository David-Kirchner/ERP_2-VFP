* Rebuild graphics-related SC2 forms (one fresh VFP session per file).
* DO NOT loop FoxBin2Prg inside one session for quotes.sc2 + other large forms -
* that can hang or show "Script is out of range".
* Preferred: tools\run_rebuild_graphics_forms.bat
LOCAL lcRoot, lcVfp, lcOnePrg, lcLog, laFiles, i, lcCmd, lcScx, lnOk, lnFail
lcRoot = "E:\VFP\ERP_2\"
lcVfp = "C:\Program Files (x86)\Microsoft Visual FoxPro 9\vfp9.exe"
lcOnePrg = lcRoot + "tools\rebuild_one_form.prg"
lcLog = lcRoot + "tools\rebuild_graphics_forms.log"
_SCREEN.Visible = .F.
SET TALK OFF
SET DEFAULT TO (lcRoot)
CD (lcRoot)
STRTOFILE("PRG2BIN graphics forms (per-file sessions) " + TTOC(DATETIME()) + CHR(13)+CHR(10), lcLog, .F.)
IF !FILE(lcVfp) OR !FILE(lcOnePrg)
	STRTOFILE("FAIL missing VFP or rebuild_one_form.prg" + CHR(13)+CHR(10), lcLog, 1)
	MESSAGEBOX("Missing VFP9 or tools\rebuild_one_form.prg", 16, "Rebuild graphics forms")
	RETURN
ENDIF
DIMENSION laFiles[10]
laFiles[1]  = "Forms\quotes.sc2"
laFiles[2]  = "Forms\ship.sc2"
laFiles[3]  = "Forms\sales_detail_edit.sc2"
laFiles[4]  = "Forms\Receipts.SC2"
laFiles[5]  = "Forms\Shipments.sc2"
laFiles[6]  = "Forms\getreason.sc2"
laFiles[7]  = "Forms\GetCancelReason.sc2"
laFiles[8]  = "Forms\Price_Fixer_Tool.sc2"
laFiles[9]  = "Forms\StockLst_DueIn_WOD.sc2"
laFiles[10] = "Forms\stocklst_duein_POitem.sc2"
lnOk = 0
lnFail = 0
FOR i = 1 TO ALEN(laFiles)
	lcScx = STRTRAN(lcRoot + laFiles[i], ".sc2", ".scx")
	lcCmd = ["] + lcVfp + [" ] + lcOnePrg + [" ] + laFiles[i] + ["]
	RUN /W &lcCmd
	IF FILE(lcScx)
		lnOk = lnOk + 1
	ELSE
		lnFail = lnFail + 1
		STRTOFILE("FAIL after RUN " + laFiles[i] + CHR(13)+CHR(10), lcLog, 1)
	ENDIF
ENDFOR
STRTOFILE("DONE ok=" + TRANSFORM(lnOk) + " fail=" + TRANSFORM(lnFail) + CHR(13)+CHR(10), lcLog, 1)
IF _VFP.StartMode = 0
	MESSAGEBOX("Rebuild finished." + CHR(13) + "OK: " + TRANSFORM(lnOk) + "  Fail: " + TRANSFORM(lnFail) + CHR(13) + CHR(13) + "Log: tools\rebuild_graphics_forms.log", ;
		IIF(lnFail = 0, 64, 48), "Rebuild graphics forms")
ENDIF
