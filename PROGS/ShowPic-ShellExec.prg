Declare Integer ShellExecute In shell32.Dll ;
   INTEGER hndWin, ;
   STRING cAction, ;
   STRING cFileName, ;
   STRING cParams, ;
   STRING cDir, ;
   INTEGER nShowWin

cFileName = "\\hummingbird\cERTS.rAP\N10276.DRW\C-276.FLD\10 0.75 312036.DOC\ORIG0001.TIF"
cAction = "open" 
ShellExecute(0,cAction,cFileName,"","",1)

