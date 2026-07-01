PROCEDURE SmokeAdd
	LPARAMETERS tcStatus, tcName, tcDetail
	LOCAL lcLine
	lcLine = PADR(tcStatus, 6) + " | " + tcName + IIF(EMPTY(tcDetail), "", " - " + tcDetail)
	STRTOFILE(lcLine + CHR(13) + CHR(10), lcLog, 1)
	IF UPPER(tcStatus) = "PASS"
		lnPass = lnPass + 1
	ELSE
		IF UPPER(tcStatus) = "FAIL"
			lnFail = lnFail + 1
		ENDIF
	ENDIF
ENDPROC

PROCEDURE SmokeErr
	LPARAMETERS tnErr, tcMsg
	lcLastSmokeErr = TRANSFORM(tnErr) + " " + tcMsg
	RESUME NEXT
ENDPROC
