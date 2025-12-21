PARAMETERS xnum,xtime,xdate,xname,xcomp,xsubj,xkeyw,xbill,filename,highsres,prntsetup
*DO SendWindowsFax WITH xnum,xtime,xdate,xname,xcomp,xsubj,xkeyw,xbill,filename,highsres,prntsetup



IF TYPE("fileName") != "C"
	filename = "sndquote"
ENDIF

lMSFax = .F.
*FOR Windows XP
If Val(Os(3)) >= 4


	*MAKE SURE FAX IS THE PRINTER
	nPrinters=APRINTERS(aaprinters)
	IF nPrinters= 0
		Wait Window "No Printers!!"
		RETURN .F.
	ENDIF

	lMSFax = .F.
	FOR CT = 1 TO nPrinters
		IF aaPrinters(ct,1)="Fax"
			lMSFax = .T.
		ENDIF
	NEXT CT

	IF NOT lMSFax
		Wait Window "No Fax printer!!"
		RETURN .F.
	ENDIF


IF EMPTY(xnum)
	WAIT WINDOW 'NO FAX NUMBER -any key to continue'
	RETURN .F.
ENDIF

IF EMPTY(filename)
	WAIT WINDOW 'NO FILE NAME TO SEND'
	RETURN .F.
ENDIF

*	SET PRINTER TO NAME 'Fax'

	WAIT WINDOW "Starting MS Fax" TIMEOUT 1

	FaxServer=Createobject('FAXCOMEX.faxserver')
	lcMachine = Getwordnum(Sys(0),1) && somewhat simpler code; wOOdy
	FaxServer.Connect( lcMachine )

	FaxDoc = Createobject("FAXCOMEX.FaxDocument")

	nCount = FaxDoc.Recipients.Count
	If nCount > 0
		For i = 1 To nCount
			FaxDoc.Recipients.Remove (1)
		Endfor
	Endif

	IF FILE("c:\FoxProFax.txt")
		DELETE FILE "c:\FoxProFax.txt"
	ENDIF
	
	
	*	REPORT FORM TO FILE "C:\FoxProFax.txt" NODIALOG 
	DO CASE
	CASE filename = "quote"
		REPORT FORM reports\Quote09 NOCONSOLE TO FILE "C:\FoxProFax.txt" NODIALOG ASCII
	CASE filename = "sndinquire"
		REPORT FORM reports\sndinquire NOCONSOLE TO FILE "C:\FoxProFax.txt" NODIALOG ASCII
	OTHERWISE
	
	ENDCASE

	IF FILE("c:\FoxProFax.txt")
		FaxDoc.Body = "c:\FoxProFax.txt"
		FaxDoc.DocumentName = xsubj 
		FaxDoc.Recipients.Add ("9,"+xnum)
	*	FaxDoc.Sendcoverpage = .f.
		FaxDoc.Note = xname
		FaxDoc.Subject = xcomp

		
	*	FaxDoc.Sender.Name = "David"
	*	FaxDoc.Sender.FaxNumber = "7656758871"
		JobID = FaxDoc.ConnectedSubmit(FaxServer)
		Inkey(1)
		ELSE
		MESSAGEBOX("FILE 'c:\FoxProFax.txt' was not Created")
	ENDIF

	FaxServer = .F.
	FaxDoc = .F.
	
	SET PRINTER TO DEFAULT
Endif


Return
*Set FaxServer = WScript.CreateObject("FAXCOMEX.FaxServer")
*CheckError("WScript.CreateObject(FAXCOMEX.FaxServer)")
*WScript.Echo "FaxServer created"
*'Connect to the fax server. Specify computer name if the server is remote. See How to connect to a remote Fax Service for details.
*FaxServer.Connect ""
*CheckError("FaxServer.Connect")
*Set FaxDoc = WScript.CreateObject("FAXCOMEX.FaxDocument")
*CheckError("WScript.CreateObject(FAXCOMEX.FaxDocument)")
*'Set file name of any printable document.
*FaxDoc.Body = "test.rtf"
*CheckError("FaxDoc.Body")
*FaxDoc.DocumentName = "My First Fax"
*CheckError("FaxDoc.DocumentName")
*FaxDoc.Recipients.Add ("12225550100")
*CheckError("FaxDoc.Recipients.Add")
*'Set the sender properties.
*FaxDoc.Sender.Name = "Bob"
*FaxDoc.Sender.FaxNumber = "7777777"
*CheckError("FaxDoc.Sender.FaxNumber")
*'Submit the document to the connected fax server and get back the job ID.
*JobID = FaxDoc.ConnectedSubmit(FaxServer)
*CheckError("FaxDoc.ConnectedSubmit")
*WScript.Echo "FaxDoc.ConnectedSubmit success"




*FOR Windows 2000
If Val(Os(3)) = 4
	x=Createobject('faxserver.faxserver')
*lcNetInfo = SYS(0)
*lcMachine ='\\'+alltrim( Left( lcNetInfo, AT('#', lcNetInfo )-1 ) )
	lcMachine = "\\"+Getwordnum(Sys(0),1) && somewhat simpler code; wOOdy
	x.Connect( lcMachine )
	fj = x.getjobs()
	?fj.Count && Prints "0"
	fj=.F.
* Show the fax drivers loaded on this machine:
	fp = x.getports()
	?fp.Count
	?fp.Item(1).Name
	?fp.Item(1).canmodify
	?fp.Item(1).rings
	?fp.Item(1).Send
	?fp.Item(1).tsid
	?fp.Item(1).csid

* Create a fax document
	FD = x.createdocument("filename")
	FD.faxnumber = '687-9870'
	FD.displayname = 'VFP Fax Message'
* Before running this program, create a word document
* called SampleFax.doc... The TAPI interface will automatically
* invoke the registered shell "Print" command on it.
	FD.filename = Fullpath("samplefax.txt")
	FD.sendcoverpage = .F.

* Send it Off!
* (you should see Word open briefly and print the document,
* then the Microsoft Fax icon should show up in the system tray
* and try to send the fax!)
	FD.Send

*clean up (probably should wait a bit before this)
	Inkey(1)
	FD = .F.
	x = .F.
Endif
