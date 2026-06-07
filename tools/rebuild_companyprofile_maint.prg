* Rebuild Forms\CompanyProfile_Maint.scx and CompanyBranding_Maint.scx from SC2

* DO tools\Rebuild_CompanyProfile_maint

* Close Company Profile / Branding forms and Form Designer before running.



LOCAL lcRoot, lcSc2, lcScx, i, laForms[2], llAnyError, lcMsg, lnH



lcRoot = ADDBS(SYS(5) + SYS(2003))

laForms[1] = "Forms\CompanyProfile_Maint.sc2"

laForms[2] = "Forms\CompanyBranding_Maint.sc2"

llAnyError = .F.

lcMsg = ""



IF NOT FILE("tools\foxbin2prg\foxbin2prg.prg")

	MESSAGEBOX("FoxBin2Prg not found under tools\foxbin2prg\", 16, "Rebuild CompanyProfile")

	RETURN

ENDIF



FOR i = 1 TO ALEN(laForms)

	lcSc2 = lcRoot + laForms[i]

	lcScx = FORCEEXT(lcSc2, "scx")

	IF NOT FILE(lcSc2)

		llAnyError = .T.

		lcMsg = lcMsg + "Missing: " + lcSc2 + CHR(13)

		LOOP

	ENDIF

	IF FILE(lcScx)

		lnH = FOPEN(lcScx, 12)

		IF lnH < 0

			llAnyError = .T.

			lcMsg = lcMsg + "Locked (close form / Designer): " + lcScx + CHR(13)

			LOOP

		ENDIF

		= FCLOSE(lnH)

	ENDIF

	DO tools\foxbin2prg\foxbin2prg.prg WITH lcSc2, "PRG2BIN"

	IF NOT FILE(lcScx)

		llAnyError = .T.

		lcMsg = lcMsg + "PRG2BIN did not create: " + lcScx + CHR(13)

	ENDIF

ENDFOR



IF llAnyError

	lcMsg = lcMsg + CHR(13) + "Also check tools\foxbin2prg\FoxBin2Prg_Error.LOG if present."

	MESSAGEBOX("Rebuild finished with errors." + CHR(13) + CHR(13) + lcMsg, 48, "Rebuild CompanyProfile")

ELSE

	MESSAGEBOX("Rebuild finished." + CHR(13) + "Test:" + CHR(13) + "DO FORM Forms\CompanyProfile_Maint.scx" + CHR(13) + "DO FORM Forms\CompanyBranding_Maint.scx", 64, "Rebuild CompanyProfile")

ENDIF


