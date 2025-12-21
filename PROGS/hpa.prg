
*!* Drawback to this solution is that it loops through the windows no matter what when your application starts
IF PreviousInstance() &&Previous instance already running?
    Do ShutdownProc
ENDIF


ON SHUTDOWN Do ShutdownProc
*oForm = CREATEOBJECT("HPA.HPAmenu")
*oForm.SHOW(1)

DO Forms\HPA
READ EVENTS 

QUIT 



***************************
FUNCTION PreviousInstance()
***************************
    #DEFINE GW_CHILD        5 && 0x00000005
    #DEFINE GW_HWNDNEXT        2 && 0x00000002
    #DEFINE SW_MAXIMIZE        3 && 0x00000003
    #DEFINE SW_NORMAL        1 && 0x00000002

    LOCAL lcUniqueProperty, lnHwnd, llReturn

    DO DeclareAPIs

    *!* The GUID below was created using
    *!* the following two lines in the command window
    *!* then it was just a matter of pasting it in
    *!* oTypeLib = CreateObject("scriptlet.typelib")
    *!*    _cliptext = substr(oTypeLib.GUID, 2, 36)
    *!* FAQ184-2486 - Thanks Mike Gagnon
    lcUniqueProperty = "748E2043-E7F3-4C24-BAFC-F93834B81768" && GUID to insure uniqueness

    llReturn = .F.
    lnHwnd = GetWindow(GetDesktopWindow(), GW_CHILD)
    DO WHILE lnHwnd != 0 && loop through all windows
        IF GetProp(lnHwnd, lcUniqueProperty) = 1  && does window have our unique property?
            BringWindowToTop(lnHwnd)
            ShowWindow(lnHwnd,SW_NORMAL) && or send SW_MAXIMIZE
            llReturn = .T.
            EXIT
        ENDIF
        lnHwnd = GetWindow(lnHwnd, GW_HWNDNEXT)
    ENDDO
    CloseHandle(lnHwnd)
    IF !llReturn && if no previous instance then create/set our unique property
        =SetProp(_VFP.HWND, lcUniqueProperty, 1)
    ENDIF
    CLEAR DLLS "BringWindowToTop", "GetDesktopWindow", ;
                "GetProp", "GetWindow", ;
                "SetProp", "ShowWindow"
    RETURN (llReturn)
ENDFUNC

***************************
PROCEDURE DeclareAPIs()
***************************
    DECLARE INTEGER BringWindowToTop IN Win32API INTEGER HWND
    DECLARE INTEGER CloseHandle IN Kernel32 INTEGER hObject 
    DECLARE INTEGER GetDesktopWindow IN User32
    DECLARE INTEGER GetProp IN User32 INTEGER HWND, STRING  lpString
    DECLARE INTEGER GetWindow IN User32 INTEGER HWND, INTEGER uCmd
    DECLARE INTEGER SetProp IN User32 INTEGER HWND, STRING lpString, INTEGER hData
    DECLARE INTEGER ShowWindow IN Win32API INTEGER HWND, INTEGER nCmdShow
ENDPROC

***************************
PROCEDURE ShutdownProc()
***************************


CLOSE DATABASES 
FOR I = 1 TO _SCREEN.FORMCOUNT 
    _SCREEN.FORMS[1].RELEASE    && always close form one because forms are 
								*re-ordered after each close 
ENDFOR 
RELEASE ALL 
SET LIBRARY TO 
SET CLASSLIB TO 


    ON SHUTDOWN
ENDPROC

*!*	**********Second Solution Using A Mutex**********
*!*	*!* Improves on the first solution by checking a mutex before looping through the windows

*!*	IF PreviousInstance() &&Previous instance already running?
*!*	    Do ShutdownProc
*!*	ENDIF

*!*	ON SHUTDOWN Do ShutdownProc
*!*	oForm = CREATEOBJECT("form")
*!*	oForm.SHOW(1)

*!*	***************************
*!*	FUNCTION PreviousInstance()
*!*	***************************
*!*	    #DEFINE ERROR_ALREADY_EXISTS    183 && 0x000000B7
*!*	    #DEFINE GW_CHILD                5 && 0x00000005
*!*	    #DEFINE GW_HWNDNEXT                2 && 0x00000002
*!*	    #DEFINE SW_MAXIMIZE                3 && 0x00000003
*!*	    #DEFINE SW_NORMAL                1 && 0x00000002

*!*	    LOCAL lcUniqueProperty, lcUniqueMutex, lnhMutex, lnHwnd, llReturn

*!*	    DO DeclareAPIs

*!*	    *!* The GUIDs below were created using
*!*	    *!* the following two lines in the command window
*!*	    *!* then it was just a matter of pasting them in
*!*	    *!* oTypeLib = CreateObject("scriptlet.typelib")
*!*	    *!*    _cliptext = substr(oTypeLib.GUID, 2, 36)
*!*	    *!* FAQ184-2486 - Thanks Mike Gagnon
*!*	    lcUniqueMutex = "968360BF-C7AD-4B62-A045-0A06D597EF18"
*!*	    lcUniqueProperty = "E2429959-D873-4733-8182-7A3F14780A27" && GUID to insure uniqueness
*!*	    lnhMutex = CreateMutex(0, 1, lcUniqueMutex)
*!*	    IF GetLastError()= ERROR_ALREADY_EXISTS
*!*	        DO DeclareMoreAPIs
*!*	        llReturn = .T.
*!*	        lnHwnd = GetWindow(GetDesktopWindow(), GW_CHILD)
*!*	        DO WHILE lnHwnd != 0 && loop through all windows
*!*	            IF GetProp(lnHwnd, lcUniqueProperty) = 1  && does window have our unique property?
*!*	                BringWindowToTop(lnHwnd)
*!*	                ShowWindow(lnHwnd,SW_NORMAL) && or send SW_MAXIMIZE
*!*	                llReturn = .T.
*!*	                EXIT
*!*	            ENDIF
*!*	            lnHwnd = GetWindow(lnHwnd, GW_HWNDNEXT)
*!*	        ENDDO
*!*	        CloseHandle(lnHwnd)
*!*	        CloseHandle(lnhMutex)
*!*	        CLEAR DLLS "BringWindowToTop", "GetDesktopWindow", ;
*!*	                    "GetProp", "GetWindow", "ShowWindow", ;
*!*	                    "CloseHandle"
*!*	    ELSE
*!*	        =SetProp(_VFP.HWND, lcUniqueProperty, 1)
*!*	        _screen.AddProperty("MutexHandle",lnhMutex)
*!*	        llReturn = .F.
*!*	    ENDIF
*!*	    CLEAR DLLS "CreateMutex", "GetLastError", ;
*!*	                "SetProp"
*!*	    RETURN (llReturn)
*!*	ENDFUNC

*!*	***************************
*!*	PROCEDURE DeclareAPIs()
*!*	***************************
*!*	    DECLARE INTEGER CloseHandle IN Kernel32 INTEGER hObject 
*!*	    DECLARE INTEGER CreateMutex  IN Win32API INTEGER lpMutexAttributes, INTEGER bInitialOwner, STRING lpName
*!*	    DECLARE INTEGER GetLastError IN Win32API
*!*	    DECLARE INTEGER SetProp IN User32 INTEGER HWND, STRING lpString, INTEGER hData
*!*	ENDPROC

*!*	***************************
*!*	PROCEDURE DeclareMoreAPIs()
*!*	***************************
*!*	    DECLARE INTEGER BringWindowToTop IN Win32API INTEGER HWND
*!*	    DECLARE INTEGER GetDesktopWindow IN User32
*!*	    DECLARE INTEGER GetProp IN User32 INTEGER HWND, STRING  lpString
*!*	    DECLARE INTEGER GetWindow IN User32 INTEGER HWND, INTEGER uCmd
*!*	    DECLARE INTEGER ShowWindow IN Win32API INTEGER HWND, INTEGER nCmdShow
*!*	ENDPROC

*!*	***************************
*!*	PROCEDURE ShutdownProc()
*!*	***************************
*!*	    ON SHUTDOWN
*!*	    IF PEMSTATUS(_screen,"MutexHandle",5) 
*!*	        DECLARE INTEGER ReleaseMutex IN Win32API INTEGER hMutex
*!*	        DECLARE INTEGER CloseHandle IN Kernel32 INTEGER hObject
*!*	        ReleaseMutex(_screen.MutexHandle)
*!*	        CloseHandle(_screen.MutexHandle)
*!*	        CLEAR DLLS "ReleaseMutex", "CloseHandle"
*!*	    ENDIF
*!*	    QUIT
*!*	ENDPROC

*!*	**********Third Solution Using A Semaphore**********
*!*	*!* Improves on the first solution by checking a semaphore before looping through the windows
*!*	*!* Improves on the second solution by adding the ability to control the total number of instances allowed

*!*	*!* Argument sent to TooManyInstances tells it
*!*	*!* how many instances are allowed to run on this
*!*	*!* computer at a time
*!*	IF TooManyInstances(1) &&Too many instance already running?
*!*	    Do ShutdownProc
*!*	ENDIF

*!*	ON SHUTDOWN Do ShutdownProc
*!*	oForm = CREATEOBJECT("form")
*!*	oForm.SHOW(1)

*!*	***************************
*!*	FUNCTION TooManyInstances(lnInstancesAllowed)
*!*	***************************
*!*	    #DEFINE GW_CHILD                5 && 0x00000005
*!*	    #DEFINE GW_HWNDNEXT                2 && 0x00000002
*!*	    #DEFINE SW_MAXIMIZE                3 && 0x00000003
*!*	    #DEFINE SW_NORMAL                1 && 0x00000002
*!*	    #DEFINE WAIT_OBJECT_0            0 && 0x00000000
*!*	    
*!*	    LOCAL lcUniqueProperty, lcUniqueSemaphore, lnhSemaphore, lnHwnd, llReturn
*!*	    IF PCOUNT() = 0
*!*	        lnInstancesAllowed = 1 && default
*!*	    ELSE
*!*	        lnInstancesAllowed = MAX(lnInstancesAllowed,1) &&At least one
*!*	    ENDIF
*!*	    DO DeclareAPIs

*!*	    *!* The GUIDs below were created using
*!*	    *!* the following two lines in the command window
*!*	    *!* then it was just a matter of pasting them in
*!*	    *!* oTypeLib = CreateObject("scriptlet.typelib")
*!*	    *!*    _cliptext = substr(oTypeLib.GUID, 2, 36)
*!*	    *!* FAQ184-2486 - Thanks Mike Gagnon
*!*	    lcUniqueSemaphore = "968360BF-C7AD-4B62-A045-0A06D597EF18"
*!*	    lcUniqueProperty = "E2429959-D873-4733-8182-7A3F14780A27" && GUID to insure uniqueness
*!*	    lnhSemaphore = CreateSemaphore(0,lnInstancesAllowed,lnInstancesAllowed,lcUniqueSemaphore)
*!*	    IF lnhSemaphore != 0 AND WaitForSingleObject(lnhSemaphore, 0) != WAIT_OBJECT_0
*!*	        DO DeclareMoreAPIs
*!*	        llReturn = .T.
*!*	        lnHwnd = GetWindow(GetDesktopWindow(), GW_CHILD)
*!*	        DO WHILE lnHwnd != 0 && loop through all windows
*!*	            IF GetProp(lnHwnd, lcUniqueProperty) = 1  && does window have our unique property?
*!*	                BringWindowToTop(lnHwnd)
*!*	                ShowWindow(lnHwnd,SW_NORMAL) && or send SW_MAXIMIZE
*!*	                llReturn = .T.
*!*	                EXIT
*!*	            ENDIF
*!*	            lnHwnd = GetWindow(lnHwnd, GW_HWNDNEXT)
*!*	        ENDDO
*!*	        CloseHandle(lnHwnd)
*!*	        CloseHandle(lnhSemaphore)
*!*	        CLEAR DLLS "BringWindowToTop", "GetDesktopWindow", ;
*!*	                    "GetProp", "GetWindow", "ShowWindow", ;
*!*	                    "CloseHandle"
*!*	    ELSE
*!*	        =SetProp(_VFP.HWND, lcUniqueProperty, 1)
*!*	        _screen.AddProperty("SemaphoreHandle",lnhSemaphore)
*!*	        llReturn = .F.
*!*	    ENDIF
*!*	    CLEAR DLLS "CreateSemaphore", "GetLastError", ;
*!*	                "SetProp"
*!*	    RETURN (llReturn)
*!*	ENDFUNC

*!*	***************************
*!*	PROCEDURE DeclareAPIs()
*!*	***************************
*!*	    DECLARE INTEGER CloseHandle IN Kernel32 INTEGER hObject 
*!*	    DECLARE INTEGER CreateSemaphore IN Kernel32 INTEGER lpSemaphoreAttributes, INTEGER lInitialCount, INTEGER lMaximumCount, STRING lpName 
*!*	    DECLARE INTEGER SetProp IN User32 INTEGER HWND, STRING lpString, INTEGER hData
*!*	    DECLARE INTEGER WaitForSingleObject IN kernel32 INTEGER hHandle, INTEGER dwMilliseconds 
*!*	ENDPROC

*!*	***************************
*!*	PROCEDURE DeclareMoreAPIs()
*!*	***************************
*!*	    DECLARE INTEGER BringWindowToTop IN Win32API INTEGER HWND
*!*	    DECLARE INTEGER GetDesktopWindow IN User32
*!*	    DECLARE INTEGER GetProp IN User32 INTEGER HWND, STRING  lpString
*!*	    DECLARE INTEGER GetWindow IN User32 INTEGER HWND, INTEGER uCmd
*!*	    DECLARE INTEGER ShowWindow IN Win32API INTEGER HWND, INTEGER nCmdShow
*!*	ENDPROC

*!*	***************************
*!*	PROCEDURE ShutdownProc()
*!*	***************************
*!*	    ON SHUTDOWN
*!*	    IF PEMSTATUS(_screen,"SemaphoreHandle",5) 
*!*	        DECLARE INTEGER ReleaseSemaphore IN kernel32 INTEGER hSemaphore, INTEGER lReleaseCount, INTEGER @lpPreviousCount         
*!*	        DECLARE INTEGER CloseHandle IN Kernel32 INTEGER hObject
*!*	        ReleaseSemaphore(_screen.SemaphoreHandle,1,0)
*!*	        CloseHandle(_screen.SemaphoreHandle)
*!*	        CLEAR DLLS "ReleaseSemaphore", "CloseHandle"
*!*	    ENDIF
*!*	    QUIT
*!*	ENDPROC

