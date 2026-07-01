* Create ERP_Test.pjx from archive - base project with all non-form files
LOCAL lcRoot, lcArch, lcPjxTest, lcPjtTest, lnDel, lcLow, lcLog
lcRoot = "E:\VFP\ERP_2\"
lcArch = lcRoot + "tools\project_bak_archive\"
lcPjxTest = lcRoot + "erp_test.pjx"
lcPjtTest = lcRoot + "erp_test.pjt"
lcLog = lcRoot + "tools\erp_test_harness.log"
STRTOFILE("INIT " + TTOC(DATETIME()) + CHR(13)+CHR(10), lcLog, .F.)
SET DEFAULT TO (lcRoot)
_SCREEN.Visible = .F.
SET TALK OFF
SET SAFETY OFF
SET CONFIRM OFF
SET DELETED ON
CLOSE ALL
COPY FILE (lcArch + "erp.pjx.bak.20260610") TO (lcPjxTest)
COPY FILE (lcArch + "erp.pjt.bak.20260610") TO (lcPjtTest)
USE (lcPjxTest) IN 0 EXCLUSIVE ALIAS pj
DELETE ALL FOR "forms\" $ LOWER(ALLTRIM(name))
DELETE ALL FOR INLIST(LOWER(JUSTFNAME(name)), "erp_certs.scx", "sql_certs21.scx", "erp_certs_addnewcert.prg", "erp_certs_check_spec.prg")
USE IN pj
STRTOFILE("INIT OK stripped forms from ERP_Test" + CHR(13)+CHR(10), lcLog, 1)
QUIT
