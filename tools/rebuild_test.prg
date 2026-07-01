SET DEFAULT TO E:\VFP\ERP_2
CD E:\VFP\ERP_2
STRTOFILE("start "+TTOC(DATETIME())+CHR(13)+CHR(10), "E:\VFP\ERP_2\tools\rebuild_test.log", .F.)
DO E:\VFP\ERP_2\tools\foxbin2prg\foxbin2prg.prg WITH "E:\VFP\ERP_2\ERP.PJ2", "PRG2BIN", "0", "0", "1", "1", "1"
STRTOFILE("done "+TTOC(DATETIME())+" exit="+TRANSFORM(EVL(_SCREEN.ExitCode,0))+CHR(13)+CHR(10), "E:\VFP\ERP_2\tools\rebuild_test.log", .T.)
QUIT
