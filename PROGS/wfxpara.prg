PARAMETER xnum,xtime,xdate,xname,xcomp,xsubj,xkeyw,xbill,filename,highsres,prntsetup
**,SHOWSCRN

*David Kirchner
*dmk@iname.com

PRIVATE xnum,xname,xcomp,ct
PRIVATE xtime,xdate,xsubj,xkeyw,xbill,filename,highsres,prntsetup
PRIVATE wfxtime ,wfxdate ,wfxname ,wfxcomp ,wfxsubj ,wfxkeyw ,wfxbill
PRIVATE m.currhd,channum1,m.lpoke,m.lexec,channum2
PRIVATE defprn,savprn,faxdevice,fpsprinter
PRIVATE GetProfStr,WrProf,settings,retlen,M.CURRPRNTW

*public Iphone, Faxnum, Iperson, Icompany
*DO WFXPARA WITH '6757051','','','DAVID','','','','','C:\autoexec.bat',.T.,.T.

PRIVATE LoginHome
IF FILE(SYS(5)+SYS(2003) +"\ERPSetup.mem")
	RESTORE FROM (SYS(5)+SYS(2003) +"\ERPSetup.mem") ADDITIVE
ELSE
	LoginHome="C:\Program Files\VFP\"
ENDIF
IF VARTYPE(LoginHome) != "C"
	LoginHome="C:\Program Files\VFP\"
ENDIF


IF EMPTY(xnum)
	WAIT WINDOW 'NO FAX NUMBER -any key to continue'
	RETURN .F.
ENDIF

IF EMPTY(filename)
	WAIT WINDOW 'NO FILE NAME TO SEND'
	RETURN .F.
ENDIF

IF NOT FILE(filename)
	DO CASE
	CASE filename = "quote"
	CASE filename = "sndinquire"
		*sndinquire
	CASE filename = "inquirer"
		m.Iphone   = " "
		m.Faxnum   = xnum
		m.Iperson  = xname
		m.Icompany = xcomp
	OTHERWISE
		WAIT WINDOW 'REPORT FILE NOT FOUND '+filename+' -any key to continue'
		RETURN .F.
	ENDCASE
ENDIF

=ddesetoption("SAFETY",.F.)
=ddesetoption("SAFETY",.T.)
channum1 = 0

IF channum1 = -1
	* if the value of ChanNum1 is -1
	* then the channel is not established
	channum1 = DDEINITIATE("FAXMNG", "CONTROL")
	IF channum1 = -1
		*Could not DDE
		= DDETERMINATE(channum1)
		WAIT WINDOW "FaxMNG.EXE not in PATH, can not start DDE"
		RETURN .F.
	ENDIF
	
	= DDEEXECUTE(channum1, "GoIdle")
	= DDETERMINATE(channum1)
	* IF FAXMNG was NOT LOADED, NEED TO GIVE CONTROL BACK TO FOXPRO
	WAIT WINDOW 'CLICK ON FOXPRO SCREEN TO CONTINUE'

ELSE
	= DDEEXECUTE(channum1, "GoIdle")
	= DDETERMINATE(channum1)
ENDIF



IF LEN(xnum) > 47
	WAIT WINDOW 'Phone number is limited to 47 charaters'+' -any key to continue'
ENDIF
wfxnum  = ["]+xnum+["]                                      && 47MAX

IF NOT EMPTY(xtime)
	IF LEN(xtime) = 5
		xtime = xtime+":00"
	ENDIF
ENDIF
wfxtime = ","+IIF( EMPTY(xtime ), "", ["]+xtime +["] )      && HH:MM:SS
IF SET('CENTURY') = 'ON'
	SET CENTURY OFF
	IF NOT EMPTY(xdate ) AND TYPE('xdate')="C"
		xdate = CTOD(xdate)
	ENDIF
	wfxdate = ","+IIF( EMPTY(xdate ), "", ["]+DTOC(xdate) +["] )      && MM/DD/YY
	SET CENTURY ON
ELSE
	wfxdate = ","+IIF( EMPTY(xdate ), "", ["]+DTOC(xdate) +["] )      && MM/DD/YY
ENDIF
IF LEN(xname) > 31
	xname = LEFT(xname,31)
ENDIF
wfxname = ","+IIF( EMPTY(xname ), "", ["]+xname +["] )      && 31MAX
IF LEN(xcomp ) > 42
	xcomp = LEFT(xcomp ,42)
ENDIF
wfxcomp = ","+IIF( EMPTY(xcomp ), "", ["]+xcomp +["] )      && 42MAX
IF LEN(xsubj ) > 79
	xsubj = LEFT(xsubj ,79)
ENDIF
wfxsubj = ","+IIF( EMPTY(xsubj ), "", ["]+xsubj +["] )      && 79MAX
IF LEN(xkeyw ) > 33
	xkeyw = LEFT(xkeyw ,33)
ENDIF
wfxkeyw = ","+IIF( EMPTY(xkeyw ), "", ["]+xkeyw +["] )      && 33MAX
IF LEN(xbill ) > 26
	xbill = LEFT(xbill ,26)
ENDIF
wfxbill = ","+IIF( EMPTY(xbill ), "", ["]+xbill +["] )      && 26MAX

channum2 = DDEINITIATE("FAXMNG", "TRANSMIT")
m.lpoke = DDEPOKE(channum2, "Sendfax", "recipient("+wfxnum+wfxtime+wfxdate+wfxname+ wfxcomp+wfxsubj+wfxkeyw+wfxbill+")" )

*IF SHOWSCRN   && DOES NOT WORK WITH CURRENT VERSION OF WINFAX
				* SHOWSCRN IS CONTROLED BY WINFAX SETUP OPTIONS
*	M.LPokeSS = DDEPoke(ChanNum2, "Sendfax", "showsendscreen('1')" )  &&1=yes 2=no
*ELSE
*	M.LPokeSS= DDEPoke(ChanNum2, "Sendfax", "showsendscreen('2')" )  &&1=yes 2=no
*ENDIF


IF highsres
	m.lpokers = DDEPOKE(channum2, "Sendfax", "resolution('HIGH')" )
ELSE
	m.lpokers = DDEPOKE(channum2, "Sendfax", "resolution('LOW')" )
ENDIF


*----------------------------------------------------------------
*MAKE SURE WINFAX IS THE PRINTER
nPrinters=APRINTERS(aaprinters)
IF nPrinters= 0
	Wait Window "No Printers!!"
	= DDETERMINATE(channum2)
	RETURN .F.
ENDIF

lWinFax = .F.
FOR CT = 1 TO nPrinters
	IF aaPrinters(ct,1)="WinFax"
		lWinFax = .T.
	ENDIF
NEXT CT

IF NOT lWinFax
	Wait Window "No WinFax printer!!"
	= DDETERMINATE(channum2)
	RETURN .F.
ENDIF


SET PRINTER TO NAME WinFax

DO CASE
CASE filename = "quote"
	REPORT FORM \reports\Quote09 NOCONSOLE TO PRINTER
CASE filename = "sndinquire"
	IF FILE( (LoginHome)+'\Quotes\REPORTS\sndINQUIRE.FRX' )
		REPORT FORM (LoginHome)+'\Quotes\REPORTS\sndINQUIRE.FRX'  NOCONSOLE TO PRINTER
	ELSE
		REPORT FORM \reports\sndinquire NOCONSOLE TO PRINTER
	ENDIF
OTHERWISE
	m.currpd = _PDSETUP
	_PDSETUP = ""   && TURN PRINTER DRIVER SETUP OFF

	SET PRINTER TO prn
	SET PRINTER ON

	m.currhd =  SET('HEADING')
	SET HEADING OFF
	SET CONSOLE OFF

	TYPE (filename) TO PRINTER       && auto wrap prompt

	SET CONSOLE ON

	IF m.currhd = "ON"
		SET HEADING ON
	ENDIF

	IF NOT EMPTY(m.currpd)
		SET PDSETUP TO m.currpd    && TURN PRINTER DRIVER SETUP BACK ON
	ENDIF
	SET PRINTER OFF
	IF NOT TYPE('listprnt') = 'u'
		SET PRINTER TO &listprn
	ENDIF
ENDCASE
m.lexec = DDEEXECUTE(channum2, "GoActive")

*M.TUNOG = DDEREQUEST(channum2,'TIMEUNTILNEXTOUTGOING')   && WORKS 'if needed
*M.NFR   = DDEREQUEST(channum2,'NumberFaxesReceived')     && WORKS 'if needed

= DDETERMINATE(channum2)

SET PRINTER TO Default

RETURN