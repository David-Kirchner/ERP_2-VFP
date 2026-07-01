LOCAL lcRoot, lcFoxBin
lcRoot = "E:\VFP\ERP_2\"
lcFoxBin = lcRoot + "tools\foxbin2prg\foxbin2prg.prg"
_SCREEN.Visible = .F.
SET DEFAULT TO (lcRoot)
DO (lcFoxBin) WITH lcRoot + "Forms\customerterms.sc2", "PRG2BIN"
QUIT
