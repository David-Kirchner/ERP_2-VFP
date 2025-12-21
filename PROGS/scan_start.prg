
* Establish a global error handler.
* The error events associated with objects
* take precedence over ON ERROR routines.

ON SHUTDOWN DO myShutDown

cOldError = ON("ERROR")
*ON ERROR DO SolutionErrHandle
ON ERROR ErrorHandlerLog(ERROR(),MESSAGE(),MESSAGE(1),PROGRAM(),LINENO())

_SCREEN.Icon = "\GRAPHICS\Scanner.ICO"
_SCREEN.Caption="Scan"


_SCREEN.Left	= 10    
_SCREEN.Top		= 100
_SCREEN.Height	= 150
_SCREEN.Width	= 235

*_Screen.Controlbox = .F. 
_Screen.MaxButton = .F. 
_Screen.MinButton = .F. 


_SCREEN.MinHeight	= 150
_SCREEN.MinWidth	= 235
_SCREEN.MaxHeight	= 150
_SCREEN.MaxWidth	= 235


PUSH MENU _msysmenu
DO \Menus\Scan.mpr
	
	
	
* Run the main form and establish the event loop

DO FORM Forms\Scan
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
