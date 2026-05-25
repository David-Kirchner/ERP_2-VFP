*====================================================================
* SetupERP_main.prg — main program for SetupERP.pjx only (not full ERP)
*====================================================================
SET TALK OFF
SET SAFETY OFF
SET DEFAULT TO (JUSTPATH(SYS(16)))

IF FILE("PROGS\load_ERP_Environment.prg")
	SET PROCEDURE TO PROGS\load_ERP_Environment ADDITIVE
	DO load_ERP_Environment
ENDIF

IF FILE("PROGS\proc_setup.prg")
	SET PROCEDURE TO PROGS\proc_setup ADDITIVE
ENDIF

IF FILE("PROGS\ERP_Environment_UI.prg")
	SET PROCEDURE TO PROGS\ERP_Environment_UI ADDITIVE
ENDIF

PUBLIC gcSetupCaption
gcSetupCaption = "ERP Setup"
IF VARTYPE(gERPProfile) = "C"
	gcSetupCaption = gcSetupCaption + " [" + gERPProfile + "]"
ENDIF
_SCREEN.Caption = gcSetupCaption

DO FORM Forms\SetupERP.scx
READ EVENTS

CLEAR EVENTS
QUIT
