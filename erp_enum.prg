*=================================================================
* erp_enum.prg
* Opens the real ERP project (e:\vfp\erp_2\ERP.pjx) and writes the
* full path of every form (.scx) to erp_forms.txt, one per line,
* in project order. Run once by the .bat before the build loop.
*=================================================================
LOCAL lcBase, lcPjx, lcOut, oProj, oFile

lcBase = "e:\vfp\erp_2\"
lcPjx  = lcBase + "ERP.pjx"

SET TALK OFF
SET SAFETY OFF
SET DEFAULT TO (lcBase)

IF NOT FILE(lcPjx)
   STRTOFILE("ERP.pjx NOT FOUND at " + lcPjx, lcBase + "erp_enum_error.txt")
   QUIT
ENDIF

lcOut = ""
MODIFY PROJECT (lcPjx) NOWAIT
oProj = _VFP.ActiveProject
FOR EACH oFile IN oProj.Files
   IF UPPER(JUSTEXT(oFile.Name)) == "SCX"
      lcOut = lcOut + oFile.Name + CHR(13) + CHR(10)
   ENDIF
ENDFOR
oProj.Close()

STRTOFILE(lcOut, lcBase + "erp_forms.txt")
QUIT
