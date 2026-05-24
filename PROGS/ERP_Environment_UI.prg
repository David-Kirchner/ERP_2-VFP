*====================================================================
* ERP_Environment_UI.prg — helpers for SetupERP / SetServer forms
*====================================================================

LPARAMETERS tcAction, toForm

DO CASE
CASE UPPER(tcAction) == "INITSETSERVER"
	ERP_UI_InitSetServer(toForm)
CASE UPPER(tcAction) == "INITSETUPERP"
	ERP_UI_InitSetupERP(toForm)
CASE UPPER(tcAction) == "TESTCONNECTION"
	test_ERP_SQL_Connection()
CASE UPPER(tcAction) == "PICKPROFILE"
	ERP_UI_PickProfile()
OTHERWISE
ENDCASE

RETURN

*--------------------------------------------------------------------
PROCEDURE ERP_UI_InitSetServer
LPARAMETERS toForm
IF VARTYPE(toForm) # "O"
	RETURN
ENDIF
DO load_ERP_Environment
toForm.lblGlobalServer.Caption = gERPProfile + ": " + gGlobalServer
toForm.txt1.Value = gGlobalServer
toForm.txtTable.Value = gGlobalDatabase
toForm.cmdTest.Visible = .T.
toForm.lblWhereAmI.Caption = "Profile: " + gERPProfile

*--------------------------------------------------------------------
PROCEDURE ERP_UI_InitSetupERP
LPARAMETERS toForm
IF VARTYPE(toForm) # "O"
	RETURN
ENDIF
DO load_ERP_Environment
toForm.ServerDir.Value = gGlobalServer + "  [" + gERPProfile + " / " + gGlobalDatabase + "]"

*--------------------------------------------------------------------
PROCEDURE ERP_UI_PickProfile
LOCAL lcProf
lcProf = ERP_ShowProfilePicker()
IF EMPTY(lcProf)
	RETURN
ENDIF
IF save_ERP_ActiveProfile(lcProf)
	MESSAGEBOX("Active profile set to: " + gERPProfile + CHR(13) + "Server: " + gGlobalServer, 64, "ERP Environment")
ENDIF
