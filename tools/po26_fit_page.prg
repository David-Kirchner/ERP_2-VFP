* Fit ACK block onto prior page: clear wasteful group-footer pagebreak; shrink summary band.
LOCAL lcFrx, lcLog, nPb, nHt, nPos
lcFrx = "E:\VFP\ERP_2\REPORTS\purchaseorder26.frx"
lcLog = "E:\VFP\ERP_2\TEMP\po26_fit_page.log"
_SCREEN.Visible = .F.
SET TALK OFF
SET SAFETY OFF
SET EXCLUSIVE ON
CLOSE ALL
SYS(2335, 0)
ON ERROR DO PoFitErr
STRTOFILE("start "+TTOC(DATETIME())+CHR(13)+CHR(10), lcLog, .F.)

USE (lcFrx) EXCLUSIVE ALIAS fr
nPb = 0
nHt = 0
nPos = 0

* Empty group footer with pagebreak forces a near-blank page before summary.
SCAN FOR OBJTYPE = 9 AND OBJCODE = 5 AND PAGEBREAK
	REPLACE PAGEBREAK WITH .F.
	nPb = nPb + 1
	STRTOFILE("cleared group-footer pagebreak rec="+TRANSFORM(RECNO())+CHR(13)+CHR(10), lcLog, 1)
ENDSCAN

* Shrink summary band so ACK sits closer to Pack/Invoice lines (notes: fit on previous page)
GO TOP
SCAN FOR OBJTYPE = 9 AND OBJCODE = 8
	STRTOFILE("summary height was="+TRANSFORM(HEIGHT)+CHR(13)+CHR(10), lcLog, 1)
	IF HEIGHT > 28000
		REPLACE HEIGHT WITH 28000
		nHt = nHt + 1
	ENDIF
ENDSCAN

* Re-anchor ACK / insurance / DOE blocks so they flow after MaterialCert (not pinned far bottom)
GO TOP
SCAN FOR ATC("ACKNOWLEDGE", EXPR) > 0 OR ATC("OUR PURCHASE ORDER NUMBER", EXPR) > 0 ;
		OR ATC("Department of Energy", EXPR) > 0 OR ATC("insures all shipments", EXPR) > 0 ;
		OR ATC("on-site by HPA", EXPR) > 0 OR ATC("Federal Statutes", EXPR) > 0
	IF BOTTOM
		REPLACE BOTTOM WITH .F., TOP WITH .T., FLOAT WITH .T.
		nPos = nPos + 1
	ENDIF
ENDSCAN

STRTOFILE("pagebreak_fixes="+TRANSFORM(nPb)+" height_fix="+TRANSFORM(nHt)+" reposition="+TRANSFORM(nPos)+CHR(13)+CHR(10), lcLog, 1)

GO TOP
SCAN FOR OBJTYPE = 9
	STRTOFILE("BAND code="+TRANSFORM(OBJCODE)+" h="+TRANSFORM(HEIGHT)+" pb="+TRANSFORM(PAGEBREAK)+CHR(13)+CHR(10), lcLog, 1)
ENDSCAN

USE IN fr
SYS(2335, 1)
QUIT

PROCEDURE PoFitErr
	STRTOFILE("ERR "+MESSAGE()+" L"+TRANSFORM(LINENO())+CHR(13)+CHR(10), ;
		"E:\VFP\ERP_2\TEMP\po26_fit_page.log", 1)
	RETURN
