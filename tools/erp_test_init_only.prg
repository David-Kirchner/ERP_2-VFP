STRTOFILE("step1"+CHR(13)+CHR(10), "E:\VFP\ERP_2\tools\erp_test_init_only.prg.log", .F.)
LOCAL lcRoot, lcPjxErp, lcPjxTest, lcPjtTest, lcArchPjt, lnDel, lcLow
lcRoot = "E:\VFP\ERP_2\"
lcPjxErp = lcRoot + "ERP.PJX"
lcPjxTest = lcRoot + "erp-test.pjx"
lcPjtTest = lcRoot + "erp-test.pjt"
lcArchPjt = lcRoot + "tools\project_bak_archive\erp.pjt.bak.20260610"
SET DEFAULT TO (lcRoot)
_SCREEN.Visible = .F.
SET TALK OFF
SET SAFETY OFF
SET CONFIRM OFF
CLOSE ALL
COPY FILE (lcPjxErp) TO (lcPjxTest)
COPY FILE (lcArchPjt) TO (lcPjtTest)
USE (lcPjxTest) IN 0 EXCLUSIVE ALIAS pj
lnDel = 0
SCAN
	lcLow = LOWER(ALLTRIM(name))
	IF "forms\" $ lcLow AND RIGHT(lcLow,4)==".scx"
		DELETE IN pj
		lnDel = lnDel + 1
	ENDIF
ENDSCAN
USE IN pj
STRTOFILE("INIT OK deleted="+TRANSFORM(lnDel)+CHR(13)+CHR(10), "E:\VFP\ERP_2\tools\erp_test_init_only.prg.log", 1)
QUIT
