* After archive PJX restore, add sql_certs split forms/PRGs missing from June 10 PJX.
LOCAL lcRoot, lcPjx, lcLog, lnAdded, i, lcFile, lcTpl, lcFname
LOCAL ARRAY aAdd[8]
lcRoot = "E:\VFP\ERP_2\"
lcPjx  = lcRoot + "ERP.PJX"
lcLog  = lcRoot + "tools\add_sql_certs_split_to_pjx.log"
ON ERROR STRTOFILE("ERR " + MESSAGE() + " line " + TRANSFORM(LINENO()) + CHR(13) + CHR(10), lcLog, 1)
SET DEFAULT TO (lcRoot)
CD (lcRoot)
STRTOFILE("Add sql_certs split rows " + TTOC(DATETIME()) + CHR(13) + CHR(10), lcLog, .F.)

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

IF !FILE(lcPjx)
	STRTOFILE("FAIL missing " + lcPjx + CHR(13) + CHR(10), lcLog, 1)
	QUIT
ENDIF

aAdd[1] = "forms\sql_certs_frmCustomer.scx"
aAdd[2] = "forms\sql_certs_frmSpaceX.scx"
aAdd[3] = "progs\sql_certs.prg"
aAdd[4] = "progs\sql_certs_addnewcert.prg"
aAdd[5] = "progs\sql_certs_check_spec.prg"
aAdd[6] = "progs\sql_certs_savespacexhardness.prg"
aAdd[7] = "progs\sql_certs_customer_form.prg"
aAdd[8] = "progs\sql_certs_spacex_form.prg"

USE (lcPjx) IN 0 ALIAS pjxadd EXCLUSIVE
STRTOFILE("Opened PJX records=" + TRANSFORM(RECCOUNT()) + CHR(13) + CHR(10), lcLog, 1)
lnAdded = 0
FOR i = 1 TO ALEN(aAdd)
	lcFile = LOWER(aAdd[i])
	IF !FILE(lcRoot + STRTRAN(lcFile, "/", "\"))
		STRTOFILE("SKIP missing on disk: " + aAdd[i] + CHR(13) + CHR(10), lcLog, 1)
		LOOP
	ENDIF
	GO TOP IN pjxadd
	LOCATE FOR LOWER(ALLTRIM(name)) == lcFile
	IF FOUND()
		STRTOFILE("OK already in PJX: " + aAdd[i] + CHR(13) + CHR(10), lcLog, 1)
		LOOP
	ENDIF
	IF RIGHT(lcFile, 4) == ".scx"
		lcTpl = "sql_certs.scx"
		GO TOP IN pjxadd
		LOCATE FOR LOWER(JUSTFNAME(name)) == lcTpl
		IF !FOUND()
			GO TOP IN pjxadd
			LOCATE FOR LOWER(JUSTFNAME(name)) == "sql_alloy.scx"
		ENDIF
	ELSE
		lcTpl = "main.prg"
		GO TOP IN pjxadd
		LOCATE FOR LOWER(JUSTFNAME(name)) == lcTpl
	ENDIF
	IF !FOUND()
		STRTOFILE("FAIL no template for " + aAdd[i] + " (wanted " + lcTpl + ")" + CHR(13) + CHR(10), lcLog, 1)
		LOOP
	ENDIF
	SCATTER MEMVAR
	APPEND BLANK
	GATHER MEMVAR
	REPLACE name WITH aAdd[i], exclude WITH .F. IN pjxadd
	lnAdded = lnAdded + 1
	STRTOFILE("ADD " + aAdd[i] + CHR(13) + CHR(10), lcLog, 1)
ENDFOR
USE IN pjxadd
STRTOFILE("PASS added " + TRANSFORM(lnAdded) + " rows" + CHR(13) + CHR(10), lcLog, 1)
QUIT
