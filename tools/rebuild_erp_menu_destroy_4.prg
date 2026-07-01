LOCAL lcRoot, lcFoxBin, laFiles, i, lcSc2, lcScx, lnOk, lnFail
lcRoot = "E:\VFP\ERP_2\"
lcFoxBin = lcRoot + "tools\foxbin2prg\foxbin2prg.prg"
_SCREEN.Visible = .F.
SET TALK OFF
SET DEFAULT TO (lcRoot)
CD (lcRoot)
DIMENSION laFiles[4]
laFiles[1] = "Forms\chooseSO.sc2"
laFiles[2] = "Forms\select_so-item.sc2"
laFiles[3] = "Forms\deadcert.sc2"
laFiles[4] = "Forms\Receive_Edit.sc2"
lnOk = 0
lnFail = 0
FOR i = 1 TO ALEN(laFiles)
	lcSc2 = lcRoot + laFiles[i]
	lcScx = STRTRAN(lcSc2, ".sc2", ".scx")
	DO (lcFoxBin) WITH lcSc2, "PRG2BIN"
	IF FILE(lcScx)
		lnOk = lnOk + 1
	ELSE
		lnFail = lnFail + 1
	ENDIF
ENDFOR
QUIT
