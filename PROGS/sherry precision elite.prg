IF NOT "\MEM" $ SYS(2003)
	SET DEFAULT TO SYS(2003)+"\MEM"
ENDIF

IF FILE("F:\Quotes\Doc\Precision Elite Form open.doc") 

	oWordObj=CREATEOBJECT("Word.Basic")
	oWordObj.FileOpen ("F:\Quotes\Doc\Precision Elite Form open.doc") 


	*oWordObj.AppShow        && Makes Word Visible
	*oWordObj.FileNewDefault && Opens up blank Word document

	*oWordObj.EditPaste
	*oWordObj.WordLeft(1,1)
	*oWordObj.EditObject("0")
	*oWordObj.EditSelectAll
	*oWordObj.Editcopy
	*oWordObj.FileClose
	*oWordObj.EditClear
	*oWordObj.EditPaste
	*oWordObj.InsertPara
	*oWordObj.InsertPara
	*oWordObj.InsertPara


	
	
	
	
	oWordObj.ww7_EditGoto ("Text54")  &&PO NUM
	oWordObj.Insert ("HPAPO54890") 
	oWordObj.ww7_EditGoto ("Text55")  &&Expected Date Sherry Will Receive 
	oWordObj.Insert ("Date557890") 
	oWordObj.ww7_EditGoto ("Text56")  &&Date Results Are Required
	oWordObj.Insert ("Date56-890") 

	IF "\MEM" $ SYS(2003)
		oWordObj.FileSaveAs(SYS(5)+SYS(2003)+"\mydoc.doc")  && Saves the Word document as
	ELSE
		oWordObj.FileSaveAs(SYS(5)+SYS(2003)+"\MEM\mydoc.doc")  && Saves the Word document as
	ENDIF

*	oWordObj.FilePrint
	oWordObj.AppClose

	RELEASE oWordObj

ENDIF

*CANCEL
*RETURN

*IF FILE("F:\Quotes\Doc\Precision Elite Form open.doc") 


	PRIVATE loWord, loDoc, loSelection

	loWord = CREATEOBJECT("Word.Application")
*	loWord.Visible = .T.

*	loDoc = loWord.Documents.Open("F:\Quotes\Doc\Precision Elite Form open.doc") 
IF FILE(SYS(5)+SYS(2003) +"\mydoc.doc") 
	loDoc = loWord.Documents.Open(SYS(5)+SYS(2003) +"\mydoc.doc") 
ELSE
	IF FILE(SYS(5)+SYS(2003) +"\MEM\mydoc.doc") 
		loDoc = loWord.Documents.Open(SYS(5)+SYS(2003) +"\MEM\mydoc.doc") 
	ELSE
		MESSAGEBOX('File not found')
		RETURN .F.
	ENDIF
ENDIF
	*loDoc = loWord.Documents.Open("C:\Documents and Settings\David Kirchner\My Documents\Precision Elite Form.doc") 
*	loSelection = loWord.Selection
	
*!*	*	loSelection.Start=47
*!*		loSelection.TypeText("1234567890")  &&Quotation Number
*!*		
*!*		loSelection.Start=89
*!*		loSelection.TypeText("1234567890")  &&PO Number
*!*		
*!*		loSelection.Start=266
*!*		loSelection.TypeText("1234567890")  &&Expected Deliver to Sherry
*!*		
*!*		loSelection.Start=324
*!*		loSelection.TypeText("1234567890")  &&Date Results Required

*!*		loSelection.Start=395  &&394 is before, 411 is Past
*!*		loSelection.TypeText("X")  &&24 Hour turn around

*!*		loSelection.Start=562 &&562 is Past
*!*		loSelection.TypeText("X")  &&48 Hour turn around

*!*		n = 600
*!*	*	DO WHILE n < 800
*!*		loSelection.Start=n
*!*		n = n + 10
*!*		
*!*		*loSelection.TypeText(STR(n))
*!*		loSelection.TypeText(ALLTRIM(STR(n)))
*!*		
*!*	*	ENDDO
*!*		
*!*		messagebox("Press OK to Continue")
*!*		
*!*		

*oRange = loDoc.Range()
*oRange.InsertAfter(Customer_ID + ": " + Company_Name )
*oRange.InsertParagraphAfter()

*#DEFINE wdStory 6
*oRange.Text = Customer_ID + ": " + Company_Name + CR
*oRange.Move(wdStory)

*#DEFINE wdCollapseEnd 0
*oRange.Text = Customer_ID + ": " + Company_Name + CR
*oRange.Collapse(wdCollapseEnd)



*oDoc.PrintOut( lBackground, , nPrintRangeType, cFileName, cFrom, cTo, ,cCopies, cPageRange, , lPrintToFile)
*lBackground  Logical  Indicates whether or not to print in the background, continuing with other code while printing.
*nPrintRangeType  Numeric  Indicates which part of the document to print. See below.
*cFileName  Character  If printing to file, the filename, including path, of the destination file.
*cFrom, cTo  Character  If nPrintRangeType is wdPrintFromTo, the beginning and end of the print range. See below.
*cCopies  Character  The number of copies to print.
*cPageRange  Character  If nPrintRangeType is wdPrintRangeOfPages, the print range. See below.
*lPrintToFile.  Logical  Indicates whether to print to a file.

*? loDoc.Formfields("Check1").Checkbox.Value

loDoc.FormFields("Check1").CheckBox.Value = .T.  &&24 Hr
loDoc.FormFields("Check2").CheckBox.Value = .F.  &&48 Hr

loDoc.FormFields("Check3").CheckBox.Value = .T.	&&Return Sample
loDoc.FormFields("Check4").CheckBox.Value = .F.	&&Return Sample

*Type of Account
loDoc.FormFields("Check5").CheckBox.Value = .T.	&&UPS
loDoc.FormFields("Check6").CheckBox.Value = .F.	&&Fed Ex
loDoc.FormFields("Check7").CheckBox.Value = .F.	&&Account Number

*End Use customer
loDoc.FormFields("Check24").CheckBox.Value = .F.	&&Bell Helicopter
loDoc.FormFields("Check24").CheckBox.Value = .F.	&&Boing
loDoc.FormFields("Check7").CheckBox.Value = .F.	&&Account Number



*loDoc.SmartTags(1).SmartTagActions(1).CheckboxState = .T.
*loWord.FormFields("Check1").CheckBox.Value = .F.


*loWord.PrintPreview && Get the document ready for the user to see
*loWord.Visible = .t. && Show word
*loWord.Activate() && Bring it to the front


	l0Word.PrintOut 
	loWord.Quit()
	RELEASE loWord