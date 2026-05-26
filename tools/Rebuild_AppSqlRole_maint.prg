* Rebuild Forms\AppSqlRole_Maint.scx from AppSqlRole_Maint.SC2 (FoxBin2Prg)
* Usage from VFP (SET DEFAULT TO e:\vfp\erp_2 first):
*   DO tools\Rebuild_AppSqlRole_maint

LOCAL lcRoot, lcSc2, lcScx
lcRoot = ADDBS(SYS(5) + SYS(2003))
lcSc2 = lcRoot + "Forms\AppSqlRole_Maint.sc2"
lcScx = lcRoot + "Forms\AppSqlRole_Maint.scx"

IF NOT FILE(lcSc2)
	MESSAGEBOX("Missing: "+lcSc2, 16, "Rebuild AppSqlRole_maint")
	RETURN
ENDIF

IF NOT FILE("tools\foxbin2prg\foxbin2prg.prg")
	MESSAGEBOX("FoxBin2Prg not found under tools\foxbin2prg\", 16, "Rebuild AppSqlRole_maint")
	RETURN
ENDIF

DO tools\foxbin2prg\foxbin2prg.prg WITH lcSc2, "PRG2BIN"

IF FILE(lcScx)
	MESSAGEBOX("Built:"+CHR(13)+lcScx+CHR(13)+CHR(13)+"Test:"+CHR(13)+"DO FORM Forms\AppSqlRole_Maint.scx", 64, "Rebuild AppSqlRole_maint")
ELSE
	MESSAGEBOX("PRG2BIN finished but .scx not found:"+CHR(13)+lcScx, 48, "Rebuild AppSqlRole_maint")
ENDIF
