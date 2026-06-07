*====================================================================
* SetupERP_main.prg — main program for SetupERP.pjx only (not full ERP)
*====================================================================
SET TALK OFF
SET SAFETY OFF
LOCAL lcRoot
lcRoot = ADDBS(JUSTPATH(SYS(16)))
IF UPPER(JUSTFNAME(lcRoot)) == "PROGS"
	lcRoot = ADDBS(JUSTPATH(lcRoot))
ENDIF
SET DEFAULT TO (lcRoot)
PUBLIC gERPAppHome, LoginAppHome
gERPAppHome = lcRoot
LoginAppHome = lcRoot

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
IF VARTYPE(gGlobalServer)="C" AND !EMPTY(gGlobalServer)
	gcSetupCaption = gcSetupCaption + " [" + ALLTRIM(gGlobalServer) ;
		+ IIF(VARTYPE(gGlobalDatabase)="C" AND !EMPTY(gGlobalDatabase), " / " + ALLTRIM(gGlobalDatabase), "") + "]"
ENDIF
_SCREEN.Caption = gcSetupCaption

DO FORM Forms\setuperp.scx
READ EVENTS

CLEAR EVENTS
QUIT
