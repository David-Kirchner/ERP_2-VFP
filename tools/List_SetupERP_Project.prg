*====================================================================
* List_SetupERP_Project.prg — show every file in SetupERP.pjx (debug bloat)
* Usage: DO tools\List_SetupERP_Project.prg
*====================================================================

LOCAL loProj, lcList, i, loFile
lcList = ""

FOR EACH loP IN _VFP.Projects FOXOBJECT
	IF UPPER(loP.Name) == "SETUPERP.PJX"
		loProj = loP
		EXIT
	ENDIF
ENDFOR

IF TYPE("loProj") # "O" OR ISNULL(loProj)
	MODIFY PROJECT (ADDBS(SYS(5)+SYS(2003)) + "SetupERP.pjx") NOWAIT NOSHOW
	loProj = _VFP.Projects("SetupERP.pjx")
ENDIF

IF TYPE("loProj") # "O" OR ISNULL(loProj)
	MESSAGEBOX("Open SetupERP.pjx in Project Manager first.", 48, "List SetupERP")
	RETURN
ENDIF

WITH loProj.FILES
	FOR i = 1 TO .Count
		loFile = .Item(i)
		lcList = lcList + loFile.Name + CHR(13)
	ENDFOR
ENDWITH

MESSAGEBOX("SetupERP.pjx has " + TRANSFORM(loProj.FILES.Count) + " file(s):" + CHR(13) + CHR(13) + ;
	lcList + CHR(13) + "Main: " + loProj.Main, 64, "SetupERP Project Contents")

RETURN
