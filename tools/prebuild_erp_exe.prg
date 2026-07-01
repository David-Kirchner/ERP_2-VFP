* Run before BUILD EXE in VFP - fixes truncated PJT and bad .bak from C0000005 crashes
LOCAL lcRoot, lcLog, lcPjt, lcPjx, lcArch, lnPjt, laF[1], lnSize, lcIcon, lcFallback, lnCertCnt, i
LOCAL ARRAY aRetired[4]
lcRoot = "E:\VFP\ERP_2\"
lcPjt  = lcRoot + "ERP.PJT"
lcPjx  = lcRoot + "ERP.PJX"
lcArch = lcRoot + "tools\project_bak_archive\"
lcLog  = lcRoot + "tools\prebuild_erp_exe.log"
SET DEFAULT TO (lcRoot)
CD (lcRoot)
STRTOFILE("Prebuild " + TTOC(DATETIME()) + CHR(13) + CHR(10), lcLog, .F.)

_SCREEN.Visible = .F.
IF TYPE("_VFP") = "O"
	_VFP.Visible = .F.
ENDIF
SET TALK OFF
SET SAFETY OFF
SET NOTIFY OFF
SET STATUS BAR OFF
SET CONFIRM OFF
CLOSE ALL

* Project lists mem\Company_Icon.ico - create before build so VFP does not prompt Locate
lcIcon = lcRoot + "MEM\Company_Icon.ico"
IF !FILE(lcIcon)
	lcFallback = lcRoot + "ICO\earth-globe.ico"
	IF !FILE(lcFallback)
		lcFallback = lcRoot + "GRAPHICS\ERP_Company.ico"
	ENDIF
	IF FILE(lcFallback)
		COPY FILE (lcFallback) TO (lcIcon)
		STRTOFILE("Created MEM\Company_Icon.ico from " + lcFallback + CHR(13) + CHR(10), lcLog, 1)
	ELSE
		STRTOFILE("WARN MEM\Company_Icon.ico missing and no fallback ICO" + CHR(13) + CHR(10), lcLog, 1)
	ENDIF
ELSE
	STRTOFILE("OK MEM\Company_Icon.ico exists" + CHR(13) + CHR(10), lcLog, 1)
ENDIF

lnPjt = 0
IF ADIR(laF, lcPjt) > 0
	lnPjt = laF[1, 2]
ENDIF
STRTOFILE("PJT size before: " + TRANSFORM(lnPjt) + CHR(13) + CHR(10), lcLog, 1)
* Good archive PJT is 2419565; truncated crash ~2415648; post-crash save can bloat (e.g. 2589981)
IF lnPjt < 2419000 .OR. lnPjt > 2425000
	IF FILE(lcArch + "erp.pjt.bak.20260610")
		COPY FILE (lcArch + "erp.pjt.bak.20260610") TO (lcPjt)
		STRTOFILE("Restored PJT from project_bak_archive (was " + TRANSFORM(lnPjt) + ")" + CHR(13) + CHR(10), lcLog, 1)
	ENDIF
	IF FILE(lcArch + "erp.pjx.bak.20260610")
		COPY FILE (lcArch + "erp.pjx.bak.20260610") TO (lcPjx)
		STRTOFILE("Restored PJX from project_bak_archive" + CHR(13) + CHR(10), lcLog, 1)
	ENDIF
ENDIF

* Remove retired cert rows from ERP.PJX (Exclude alone still prompts in IDE)
lnCertCnt = 0
IF FILE(lcPjx)
	aRetired[1] = "erp_certs.scx"
	aRetired[2] = "sql_certs21.scx"
	aRetired[3] = "erp_certs_addnewcert.prg"
	aRetired[4] = "erp_certs_check_spec.prg"
	USE (lcPjx) IN 0 ALIAS pjpre EXCLUSIVE
	SET DELETED ON
	FOR i = 1 TO ALEN(aRetired)
		SCAN FOR LOWER(JUSTFNAME(ALLTRIM(name))) == LOWER(aRetired[i])
			DELETE IN pjpre
			lnCertCnt = lnCertCnt + 1
		ENDSCAN
	ENDFOR
	USE IN pjpre
	STRTOFILE("Removed retired cert rows from PJX (" + TRANSFORM(lnCertCnt) + ")" + CHR(13) + CHR(10), lcLog, 1)
ENDIF

* Remove truncated .bak left in project root (crash/FoxBin2Prg can create ~22KB pjt.bak)
IF ADIR(laF, lcRoot + "erp.pjt.bak") > 0 AND laF[1, 2] < 100000
	ERASE (lcRoot + "erp.pjt.bak")
	STRTOFILE("Erased bad erp.pjt.bak (" + TRANSFORM(laF[1, 2]) + " bytes)" + CHR(13) + CHR(10), lcLog, 1)
ENDIF

* Restore active cert form memo if crash touched it during last build
IF FILE(lcRoot + "forms\sql_certs.sct.bak") AND FILE(lcRoot + "forms\sql_certs.sct")
	lnSize = 0
	IF ADIR(laF, lcRoot + "forms\sql_certs.sct") > 0
		lnSize = laF[1, 2]
	ENDIF
	IF lnSize < 990000
		COPY FILE (lcRoot + "forms\sql_certs.sct.bak") TO (lcRoot + "forms\sql_certs.sct")
		STRTOFILE("Restored forms\sql_certs.sct from .bak" + CHR(13) + CHR(10), lcLog, 1)
	ENDIF
ENDIF

lnPjt = 0
IF ADIR(laF, lcPjt) > 0
	lnPjt = laF[1, 2]
ENDIF
STRTOFILE("PJT size after: " + TRANSFORM(lnPjt) + CHR(13) + CHR(10), lcLog, 1)
IF lnPjt >= 2419000 .AND. lnPjt <= 2425000
	STRTOFILE("PASS project memo OK" + CHR(13) + CHR(10), lcLog, 1)
ELSE
	STRTOFILE("FAIL PJT size bad (want ~2419565) - run tools\restore_erp_project.bat" + CHR(13) + CHR(10), lcLog, 1)
ENDIF
QUIT
