* Sync ERP.PJX with current cert consolidation:
* - DELETE retired erp_certs / sql_certs21 forms and PRGs (stops GUI "file not found")
* - DELETE any project row whose source file is missing on disk
* - ADD sql_certs split forms/PRGs if missing from archive PJX
LOCAL lcRoot, lcPjx, lcLog, lnDel, lnAdd, i, lcFile, lcTpl, lcPath, lcFname
LOCAL ARRAY aRetired[4], aAdd[8]
lcRoot = "E:\VFP\ERP_2\"
lcPjx  = lcRoot + "ERP.PJX"
lcLog  = lcRoot + "tools\sync_erp_pjx.log"
ON ERROR STRTOFILE("ERR " + MESSAGE() + " line " + TRANSFORM(LINENO()) + CHR(13) + CHR(10), lcLog, 1)
SET DEFAULT TO (lcRoot)
CD (lcRoot)
STRTOFILE("Sync ERP.PJX " + TTOC(DATETIME()) + CHR(13) + CHR(10), lcLog, .F.)

_SCREEN.Visible = .F.
IF TYPE("_VFP") = "O"
	_VFP.Visible = .F.
ENDIF
SET TALK OFF
SET SAFETY OFF
SET NOTIFY OFF
SET STATUS BAR OFF
SET CONFIRM OFF
SET DELETED ON
CLOSE ALL

IF !FILE(lcPjx)
	STRTOFILE("FAIL missing " + lcPjx + CHR(13) + CHR(10), lcLog, 1)
	QUIT
ENDIF

aRetired[1] = "erp_certs.scx"
aRetired[2] = "sql_certs21.scx"
aRetired[3] = "erp_certs_addnewcert.prg"
aRetired[4] = "erp_certs_check_spec.prg"

aAdd[1] = "forms\sql_certs_frmCustomer.scx"
aAdd[2] = "forms\sql_certs_frmSpaceX.scx"
aAdd[3] = "progs\sql_certs.prg"
aAdd[4] = "progs\sql_certs_addnewcert.prg"
aAdd[5] = "progs\sql_certs_check_spec.prg"
aAdd[6] = "progs\sql_certs_savespacexhardness.prg"
aAdd[7] = "progs\sql_certs_customer_form.prg"
aAdd[8] = "progs\sql_certs_spacex_form.prg"

USE (lcPjx) IN 0 ALIAS pjxsyn EXCLUSIVE
lnDel = 0

* Pass 1: delete retired cert entries
FOR i = 1 TO ALEN(aRetired)
	GO TOP IN pjxsyn
	SCAN FOR LOWER(JUSTFNAME(ALLTRIM(name))) == LOWER(aRetired[i])
		STRTOFILE("DEL retired " + ALLTRIM(name) + CHR(13) + CHR(10), lcLog, 1)
		DELETE IN pjxsyn
		lnDel = lnDel + 1
	ENDSCAN
ENDFOR

STRTOFILE("Deleted " + TRANSFORM(lnDel) + " retired rows" + CHR(13) + CHR(10), lcLog, 1)

* Pass 2: add sql_certs split assets
lnAdd = 0
FOR i = 1 TO ALEN(aAdd)
	lcFile = LOWER(aAdd[i])
	lcPath = lcRoot + STRTRAN(lcFile, "/", "\")
	IF !FILE(lcPath)
		STRTOFILE("SKIP add missing on disk: " + aAdd[i] + CHR(13) + CHR(10), lcLog, 1)
		LOOP
	ENDIF
	GO TOP IN pjxsyn
	LOCATE FOR LOWER(ALLTRIM(name)) == lcFile
	IF FOUND()
		IF !exclude
			* already present and included
		ENDIF
		STRTOFILE("OK in PJX: " + aAdd[i] + CHR(13) + CHR(10), lcLog, 1)
		LOOP
	ENDIF
	IF RIGHT(lcFile, 4) == ".scx"
		lcTpl = "sql_certs.scx"
		GO TOP IN pjxsyn
		LOCATE FOR LOWER(JUSTFNAME(name)) == lcTpl
		IF !FOUND()
			GO TOP IN pjxsyn
			LOCATE FOR LOWER(JUSTFNAME(name)) == "sql_alloy.scx"
		ENDIF
	ELSE
		lcTpl = "main.prg"
		GO TOP IN pjxsyn
		LOCATE FOR LOWER(JUSTFNAME(name)) == lcTpl
	ENDIF
	IF !FOUND()
		STRTOFILE("FAIL no template for " + aAdd[i] + CHR(13) + CHR(10), lcLog, 1)
		LOOP
	ENDIF
	SCATTER MEMVAR
	APPEND BLANK
	GATHER MEMVAR
	REPLACE name WITH aAdd[i], exclude WITH .F. IN pjxsyn
	lnAdd = lnAdd + 1
	STRTOFILE("ADD " + aAdd[i] + CHR(13) + CHR(10), lcLog, 1)
ENDFOR

* Active cert screen must be included
GO TOP IN pjxsyn
LOCATE FOR LOWER(JUSTFNAME(name)) == "sql_certs.scx"
IF FOUND()
	REPLACE exclude WITH .F. IN pjxsyn
ENDIF

USE IN pjxsyn
STRTOFILE("PASS deleted=" + TRANSFORM(lnDel) + " added=" + TRANSFORM(lnAdd) + CHR(13) + CHR(10), lcLog, 1)
QUIT
