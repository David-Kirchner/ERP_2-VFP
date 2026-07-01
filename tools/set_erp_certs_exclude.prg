* Set EXCLUDE on retired cert formsets via ERP.PJX (erp_certs, sql_certs21).
* Active: sql_certs + split child forms. sql_alloy left unchanged if present.
LOCAL lcRoot, lcLog, lcPjx, lnCnt, lcRow, lcFname
lcRoot = "E:\VFP\ERP_2\"
lcPjx  = lcRoot + "ERP.PJX"
lcLog  = lcRoot + "tools\set_erp_certs_exclude.log"
SET DEFAULT TO (lcRoot)
CD (lcRoot)
STRTOFILE("Set cert EXCLUDE " + TTOC(DATETIME()) + CHR(13) + CHR(10), lcLog, .F.)

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
USE (lcPjx) IN 0 ALIAS pjxcfg EXCLUSIVE
lnCnt = 0
SCAN FOR AT("certs", LOWER(name)) > 0
	lcFname = LOWER(JUSTFNAME(name))
	DO CASE
	CASE lcFname == "erp_certs.scx" .OR. lcFname == "sql_certs21.scx"
		REPLACE exclude WITH .T. IN pjxcfg
		lnCnt = lnCnt + 1
		lcRow = ALLTRIM(name) + " exclude=T (retired)"
	CASE lcFname == "sql_certs.scx" ;
			.OR. lcFname == "sql_certs_frmcustomer.scx" ;
			.OR. lcFname == "sql_certs_frmspacex.scx"
		REPLACE exclude WITH .F. IN pjxcfg
		lnCnt = lnCnt + 1
		lcRow = ALLTRIM(name) + " exclude=F (active)"
	OTHERWISE
		LOOP
	ENDCASE
	STRTOFILE(lcRow + CHR(13) + CHR(10), lcLog, 1)
ENDSCAN
USE IN pjxcfg
STRTOFILE("PASS updated " + TRANSFORM(lnCnt) + " rows in ERP.PJX" + CHR(13) + CHR(10), lcLog, 1)
QUIT
