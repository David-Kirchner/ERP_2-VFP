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
	IF TYPE("toForm.DatabaseDir") = "O"
		test_ERP_SQL_Connection(toForm.ServerDir.Value, toForm.DatabaseDir.Value)
	ELSE
		test_ERP_SQL_Connection(toForm.txt1.Value, toForm.txtTable.Value)
	ENDIF
CASE UPPER(tcAction) == "PICKPROFILE"
	ERP_UI_PickProfile(toForm)
CASE UPPER(tcAction) == "PICKSERVER"
	ERP_UI_PickServer(toForm)
CASE UPPER(tcAction) == "PICKDATABASE"
	ERP_UI_PickDatabase(toForm)
CASE UPPER(tcAction) == "APPLYSETUPERP"
	ERP_UI_ApplySetupERP(toForm)
CASE UPPER(tcAction) == "SAVELOGINMEM"
	ERP_UI_SaveLoginMem(toForm)
CASE UPPER(tcAction) == "SYNCFORM"
	ERP_UI_SyncFormFromControls(toForm)
CASE UPPER(tcAction) == "SAVESERVER"
	ERP_UI_SaveServer(toForm)
CASE UPPER(tcAction) == "SAVEDATABASE"
	ERP_UI_SaveDatabase(toForm)
OTHERWISE
ENDCASE

RETURN

*--------------------------------------------------------------------
FUNCTION ERP_UI_GetRoot
RETURN ERP_Environment_GetRoot()

*--------------------------------------------------------------------
PROCEDURE ERP_UI_SaveLoginMem
LPARAMETERS toForm
LOCAL lcRoot, lcMemFile
lcRoot = ERP_UI_GetRoot()
lcMemFile = lcRoot + "MEM\ERPSetup.MEM"
IF !DIRECTORY(lcRoot + "MEM")
	MKDIR (lcRoot + "MEM")
ENDIF
IF VARTYPE(toForm) = "O"
	* PRIVATE — do not PUBLIC; Login* may already exist private in the form
	PRIVATE LoginPC, LoginUN, LoginHome, LoginServer, LoginDatabase
	LoginPC = toForm.LoginPC
	LoginUN = toForm.LoginUN
	LoginHome = ADDBS(ALLTRIM(toForm.LoginHome))
	LoginServer = ALLTRIM(toForm.ServerDirMem)
	LoginDatabase = ALLTRIM(toForm.DatabaseDirMem)
	SAVE ALL LIKE Login* TO (lcMemFile)
ENDIF
RETURN lcMemFile

*--------------------------------------------------------------------
PROCEDURE ERP_UI_SyncFormFromControls
LPARAMETERS toForm
IF VARTYPE(toForm) # "O"
	RETURN
ENDIF
IF TYPE("toForm.ServerDir") = "O"
	toForm.ServerDirMem = ALLTRIM(toForm.ServerDir.Value)
	toForm.LoginServer = toForm.ServerDirMem
ENDIF
IF TYPE("toForm.DatabaseDir") = "O"
	toForm.DatabaseDirMem = ALLTRIM(toForm.DatabaseDir.Value)
	toForm.LoginDatabase = toForm.DatabaseDirMem
ENDIF
IF TYPE("toForm.HomeDir") = "O"
	toForm.LoginHome = ADDBS(ALLTRIM(toForm.HomeDir.Value))
	toForm.HomeDirMem = toForm.LoginHome
ENDIF

ENDPROC

*--------------------------------------------------------------------
PROCEDURE ERP_UI_SaveServer
LPARAMETERS toForm
ERP_UI_SyncFormFromControls(toForm)
IF EMPTY(ALLTRIM(toForm.ServerDirMem))
	MESSAGEBOX("Enter a SQL Server name first.", 48, "ERP Setup")
	RETURN
ENDIF
IF EMPTY(ALLTRIM(toForm.DatabaseDirMem))
	MESSAGEBOX("Enter a Database name first (e.g. ERP_1 or ERP_2).", 48, "ERP Setup")
	RETURN
ENDIF
ERP_UI_ApplySetupERP(toForm)
ERP_UI_SaveLoginMem(toForm)
MESSAGEBOX("Saved SQL target:" + CHR(13) + toForm.ServerDirMem + " / " + toForm.DatabaseDirMem + CHR(13) ;
	+ "Preset: " + gERPProfile, 64, "ERP Setup")

ENDPROC

*--------------------------------------------------------------------
PROCEDURE ERP_UI_SaveDatabase
LPARAMETERS toForm
ERP_UI_SyncFormFromControls(toForm)
IF EMPTY(ALLTRIM(toForm.DatabaseDirMem))
	MESSAGEBOX("Enter a Database name first (e.g. ERP_1 or ERP_2).", 48, "ERP Setup")
	RETURN
ENDIF
IF EMPTY(ALLTRIM(toForm.ServerDirMem))
	MESSAGEBOX("Enter a SQL Server name first.", 48, "ERP Setup")
	RETURN
ENDIF
ERP_UI_ApplySetupERP(toForm)
ERP_UI_SaveLoginMem(toForm)
MESSAGEBOX("Saved SQL target:" + CHR(13) + toForm.ServerDirMem + " / " + toForm.DatabaseDirMem + CHR(13) ;
	+ "Preset: " + gERPProfile, 64, "ERP Setup")

ENDPROC

*--------------------------------------------------------------------
PROCEDURE ERP_UI_InitSetServer
LPARAMETERS toForm
IF VARTYPE(toForm) # "O"
	RETURN
ENDIF
= load_ERP_Environment(.T.)
toForm.lblGlobalServer.Caption = ERP_Environment_SqlTargetCaption(gGlobalServer, gGlobalDatabase)
toForm.txt1.Value = gGlobalServer
toForm.txtTable.Value = gGlobalDatabase
toForm.cmdTest.Visible = .T.
toForm.lblWhereAmI.Caption = "Preset: " + gERPProfile

ENDPROC

*--------------------------------------------------------------------
PROCEDURE ERP_UI_InitSetupERP
LPARAMETERS toForm
LOCAL lcSrv, lcDb
IF VARTYPE(toForm) # "O"
	RETURN
ENDIF
* Force reload — ERP_Environment.local.xml is the canonical saved SQL target
= load_ERP_Environment(.T.)
lcSrv = ALLTRIM(gGlobalServer)
lcDb = ALLTRIM(gGlobalDatabase)
IF EMPTY(lcSrv) AND TYPE("toForm.LoginServer") = "C"
	lcSrv = ALLTRIM(toForm.LoginServer)
ENDIF
IF EMPTY(lcSrv) AND TYPE("toForm.ServerDirMem") = "C"
	lcSrv = ALLTRIM(toForm.ServerDirMem)
ENDIF
IF EMPTY(lcDb) AND TYPE("toForm.LoginDatabase") = "C"
	lcDb = ALLTRIM(toForm.LoginDatabase)
ENDIF
IF EMPTY(lcDb) AND TYPE("toForm.DatabaseDirMem") = "C"
	lcDb = ALLTRIM(toForm.DatabaseDirMem)
ENDIF
toForm.ServerDirMem = lcSrv
toForm.DatabaseDirMem = lcDb
toForm.LoginServer = lcSrv
IF TYPE("toForm.LoginDatabase") = "C" OR TYPE("toForm.LoginDatabase") = "U"
	toForm.LoginDatabase = lcDb
ENDIF
IF TYPE("toForm.lblProfile") = "O"
	toForm.lblProfile.Caption = lcSrv + " / " + lcDb ;
		+ "  (" + ALLTRIM(gERPProfile) + ")"
ENDIF
IF TYPE("toForm.cmdChangeServer") = "O"
	toForm.cmdChangeServer.Caption = "Save"
ENDIF
IF TYPE("toForm.cmdChangeDatabase") = "O"
	toForm.cmdChangeDatabase.Caption = "Save"
ENDIF
IF TYPE("toForm.cmdChangeHome") = "O"
	toForm.cmdChangeHome.Caption = "Save"
ENDIF

ENDPROC

*--------------------------------------------------------------------
PROCEDURE ERP_UI_PickProfile
LPARAMETERS toForm
LOCAL lcProf
lcProf = ERP_ShowProfilePicker()
IF EMPTY(lcProf)
	RETURN
ENDIF
IF save_ERP_ActiveProfile(lcProf)
	IF VARTYPE(toForm) = "O"
		ERP_UI_InitSetupERP(toForm)
		ERP_UI_ApplySetupERP(toForm)
	ENDIF
	MESSAGEBOX("Server preset: " + gERPProfile + CHR(13) ;
		+ "SQL target: " + ERP_Environment_SqlTargetCaption(gGlobalServer, gGlobalDatabase) + CHR(13) ;
		+ "(database unchanged)", 64, "ERP Environment")
ENDIF

ENDPROC

*--------------------------------------------------------------------
PROCEDURE ERP_UI_PickServer
LPARAMETERS toForm
LOCAL lcSrv
lcSrv = ERP_ShowServerPicker()
IF EMPTY(lcSrv)
	RETURN
ENDIF
IF VARTYPE(toForm) = "O"
	toForm.ServerDirMem = lcSrv
	toForm.LoginServer = lcSrv
	toForm.Refresh
	ERP_UI_ApplySetupERP(toForm)
	ERP_UI_SaveLoginMem(toForm)
ENDIF

ENDPROC

*--------------------------------------------------------------------
PROCEDURE ERP_UI_PickDatabase
LPARAMETERS toForm
LOCAL lcDb
lcDb = ERP_ShowDatabasePicker()
IF EMPTY(lcDb)
	RETURN
ENDIF
IF VARTYPE(toForm) = "O"
	toForm.DatabaseDirMem = lcDb
	toForm.LoginDatabase = lcDb
	toForm.Refresh
	ERP_UI_ApplySetupERP(toForm)
	ERP_UI_SaveLoginMem(toForm)
ENDIF

ENDPROC

*--------------------------------------------------------------------
PROCEDURE ERP_UI_ApplySetupERP
LPARAMETERS toForm
LOCAL lcSrv, lcDb
IF VARTYPE(toForm) # "O"
	RETURN
ENDIF
lcSrv = ALLTRIM(toForm.ServerDirMem)
lcDb = ALLTRIM(toForm.DatabaseDirMem)
IF EMPTY(lcSrv) OR EMPTY(lcDb) OR !ERP_Environment_IsValidDatabase(lcDb)
	RETURN
ENDIF
toForm.LoginServer = lcSrv
toForm.LoginDatabase = lcDb
save_ERP_ServerDatabase(lcSrv, lcDb)
IF VARTYPE(gGlobalServer) = "U"
	PUBLIC gGlobalServer
ENDIF
IF VARTYPE(gGlobalDatabase) = "U"
	PUBLIC gGlobalDatabase
ENDIF
IF VARTYPE(GlobalTable) = "U"
	PUBLIC GlobalTable
ENDIF
gGlobalServer = lcSrv
gGlobalDatabase = lcDb
GlobalTable = lcDb
IF TYPE("toForm.lblProfile") = "O"
	toForm.lblProfile.Caption = lcSrv + " / " + lcDb ;
		+ "  (" + ALLTRIM(gERPProfile) + ")"
ENDIF
IF TYPE("toForm.LoginUN") = "C" AND !EMPTY(toForm.LoginUN)
	AppSetup_Update_Ans(lcSrv, toForm.LoginUN, "Server")
	AppSetup_Update_Ans(lcDb, toForm.LoginUN, "Database")
ENDIF

ENDPROC
