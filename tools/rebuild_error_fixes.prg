LOCAL lcRoot, lcFoxBin, laFiles, i, lcSc2
lcRoot = "E:\VFP\ERP_2\"
lcFoxBin = lcRoot + "tools\foxbin2prg\foxbin2prg.prg"
_SCREEN.Visible = .F.
SET DEFAULT TO (lcRoot)
CD (lcRoot)
DIMENSION laFiles[2]
laFiles[1] = "LIBS\purchaseorder.vc2"
laFiles[2] = "Forms\customerterms.sc2"
FOR i = 1 TO ALEN(laFiles)
	lcSc2 = lcRoot + laFiles[i]
	DO (lcFoxBin) WITH lcSc2, "PRG2BIN"
ENDFOR
QUIT
