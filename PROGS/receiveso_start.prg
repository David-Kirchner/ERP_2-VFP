
*!*	IF FILE("C:\HPASetup.MEM")
*!*		RESTORE FROM C:\HPASetup.MEM ADDITIVE
*!*	ELSE
*!*		MESSAGEBOX("Run the HPA Setup to set defaults.")
*!*		DO LOCFILE("c:\Program Files\HPA\SetupHPA.EXE","EXE","SetupHPA")
*!*		RESTORE FROM C:\HPASetup.MEM ADDITIVE
*!*	ENDIF

*!*	IF TYPE("LoginAppHome") != "C"
*!*		LoginAppHome = "C:\Program Files\HPA\"
*!*		IF FILE(LoginAppHome+"HPA.EXE")
*!*			SAVE ALL LIKE Login* to C:\HPASetup.MEM
*!*		ENDIF
*!*	ENDIF

*!*	IF NOT FILE(LoginAppHome+"HPA.EXE") AND NOT FILE(LoginAppHome+"Hpa.APP")
*!*		MESSAGEBOX("Run the HPA Setup to set defaults.",0,"Home Directory not found!")
*!*		
*!*		DO LOCFILE("c:\Program Files\HPA\SetupHPA.EXE","EXE","SetupHPA")
*!*		RESTORE FROM C:\HPASetup.MEM ADDITIVE
*!*	ENDIF

*!*	IF FILE(LoginAppHome+"Hpa.EXE") OR FILE(LoginAppHome+"Hpa.APP")
*!*		SET DEFAULT TO (LoginAppHome)
*!*	ENDIF
*!*	SET PATH TO (LoginServer);(LoginAppHome)

*!*	SET PROCEDURE TO PROGS\Proc_HPA ADDITIVE
*!*	SET PROCEDURE TO PROGS\Proc_Quotes ADDITIVE
*!*	SET PROCEDURE TO PROGS\Proc_SQL ADDITIVE

*IF !FILE('HPA.scx')
*	cCurrentProcedure = SYS(16,1)
*	nPathStart = AT(":",cCurrentProcedure)- 1
*	nLenOfPath = RAT("\", cCurrentProcedure) - (nPathStart)
 *	SET DEFAULT TO (SUBSTR(cCurrentProcedure, nPathStart, nLenofPath))
*ENDIF

* Establish a global error handler.
* The error events associated with objects
* take precedence over ON ERROR routines.

ON SHUTDOWN DO myShutDown

cOldError = ON("ERROR")
*ON ERROR DO SolutionErrHandle
ON ERROR ErrorHandlerLog(ERROR(),MESSAGE(),MESSAGE(1),PROGRAM(),LINENO())

_SCREEN.Icon = "\GRAPHICS\Component.ICO"
_SCREEN.Caption="Shop Receive SO"


_SCREEN.Left	= 10    
_SCREEN.Top		= 100
_SCREEN.Height	= 200
_SCREEN.Width	= 260


PUSH MENU _msysmenu
DO \Menus\ReceiveSO.mpr
	
	
	
* Run the main form and establish the event loop

DO FORM Forms\ReceiveSO_wt1
READ EVENTS


* Reset the global error handler
ON ERROR &cOldError


* Project resolution markers for API functions

Procedure MAINHWND
Procedure  _WHTOHWND
Procedure  _WONTOP
Procedure  GetFileVersion

*********************************************************
PROCEDURE myShutDown
CLEAR EVENTS
ON ShutDown
QUIT
*********************************************************
