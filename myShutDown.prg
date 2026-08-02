* myShutDown.prg — unload ERP app so IDE can rebuild (frees LIBS\*.vcx)
* DO myShutDown          && shutdown (QUIT only in runtime EXE)
* DO myShutDown WITH .T. && unload only (after READ EVENTS → return to IDE)
LPARAMETERS tlUnloadOnly

IF VARTYPE(tlUnloadOnly) != "L"
	tlUnloadOnly = .F.
ENDIF

* Prevent re-entry while releasing forms
ON SHUTDOWN
TRY
	ON ERROR
CATCH
ENDTRY
ON KEY

* Forms keep SET CLASSLIB / VCX files locked (e.g. wizembss.vcx)
LOCAL lnI
FOR lnI = _SCREEN.FormCount TO 1 STEP -1
	TRY
		IF VARTYPE(_SCREEN.Forms[lnI]) = "O"
			_SCREEN.Forms[lnI].Release
		ENDIF
	CATCH
	ENDTRY
ENDFOR

TRY
	CLOSE TABLES ALL
CATCH
ENDTRY
TRY
	CLOSE DATABASES ALL
CATCH
ENDTRY

SET CLASSLIB TO
SET PROCEDURE TO
SET LIBRARY TO

CLEAR EVENTS

* Unload-only (.T.) after READ EVENTS — return to IDE for rebuild.
* Full shutdown (ON SHUTDOWN / no param) — QUIT like before.
IF NOT tlUnloadOnly
	QUIT
ENDIF
