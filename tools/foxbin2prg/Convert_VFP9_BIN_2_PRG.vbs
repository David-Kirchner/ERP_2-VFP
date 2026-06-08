'---------------------------------------------------------------------------------------------------
'	Convert_VFP9_BIN_2_PRG.vbs (SCX/FRX/VCX -> SC2/FR2/VC2)
'	Launches VFP with -cNULL via foxbin2prg_b2p.prg (no CONFIG.FPW / COM issues)
'---------------------------------------------------------------------------------------------------
Dim WSHShell, FileSystemObject, aFiles(), nFile_Count, i, nExitCode, nErrors
Dim vfpPath, scriptDir, runnerPrg, shellCmd, fileToProcess

Set WSHShell = WScript.CreateObject("WScript.Shell")
Set FileSystemObject = WScript.CreateObject("Scripting.FileSystemObject")

nExitCode = 0
nErrors = 0
scriptDir = FileSystemObject.GetParentFolderName(WScript.ScriptFullName)
runnerPrg = scriptDir & "\foxbin2prg_b2p.prg"

If WScript.Arguments.Count = 0 Then
	MsgBox "No files or folders selected!", 48, "FoxBin2Prg BIN2PRG"
	WScript.Quit 1
End If

If Not FileSystemObject.FileExists(scriptDir & "\foxbin2prg.prg") And Not FileSystemObject.FileExists(scriptDir & "\foxbin2prg.exe") Then
	MsgBox "FoxBin2Prg not found in:" & vbCrLf & scriptDir, 16, "FoxBin2Prg BIN2PRG"
	WScript.Quit 1
End If

If Not FileSystemObject.FileExists(runnerPrg) Then
	MsgBox "Missing runner:" & vbCrLf & runnerPrg, 16, "FoxBin2Prg BIN2PRG"
	WScript.Quit 1
End If

vfpPath = FindVfpExe()
If vfpPath = "" Then
	MsgBox "Visual FoxPro 9 (vfp9.exe) not found." & vbCrLf & vbCrLf & _
		"Install VFP9 or set path in BIN2PRG.bat / this script.", 16, "FoxBin2Prg BIN2PRG"
	WScript.Quit 1
End If

nFile_Count = 0
For i = 0 To WScript.Arguments.Count - 1
	scanDirs WScript.Arguments(i)
Next

If nFile_Count = 0 Then
	MsgBox "No files to convert.", 48, "FoxBin2Prg BIN2PRG"
	WScript.Quit 1
End If

For i = 1 To nFile_Count
	fileToProcess = aFiles(i)
	If Not RunOneFile(fileToProcess) Then
		nErrors = nErrors + 1
	End If
Next

If nErrors > 0 Then
	Notify "BIN2PRG finished with " & nErrors & " error(s) out of " & nFile_Count & " file(s).", True
	WScript.Quit 1
Else
	Notify "BIN2PRG finished OK - " & nFile_Count & " file(s).", False
	WScript.Quit 0
End If


Function RunOneFile(tcFile)
	Dim errFile, ext
	RunOneFile = False
	ext = LCase(FileSystemObject.GetExtensionName(tcFile))
	errFile = FileSystemObject.GetParentFolderName(tcFile) & "\" & FileSystemObject.GetBaseName(tcFile) & "." & ext & ".ERR"

	If FileSystemObject.FileExists(errFile) Then
		On Error Resume Next
		FileSystemObject.DeleteFile errFile, True
		On Error Goto 0
	End If

	WSHShell.CurrentDirectory = scriptDir
	shellCmd = Chr(34) & vfpPath & Chr(34) & " -cNULL " & Chr(34) & runnerPrg & Chr(34) & " " & Chr(34) & tcFile & Chr(34)

	nExitCode = WSHShell.Run(shellCmd, 1, True)

	If FileSystemObject.FileExists(errFile) Then
		Notify "ERROR: " & tcFile & " - see " & errFile, True
		Exit Function
	End If

	If nExitCode <> 0 Then
		Notify "ERROR: VFP exit code " & nExitCode & " for " & tcFile, True
		Exit Function
	End If

	RunOneFile = True
End Function


Sub Notify(tcMessage, tlError)
	On Error Resume Next
	WScript.StdOut.WriteLine tcMessage
	If Err.Number <> 0 Then
		Err.Clear
		MsgBox tcMessage, IIf(tlError, 48, 64), "FoxBin2Prg BIN2PRG"
	End If
	On Error Goto 0
End Sub


Function IIf(Condition, TruePart, FalsePart)
	If Condition Then IIf = TruePart Else IIf = FalsePart
End Function


Function FindVfpExe()
	Dim candidates, c
	candidates = Array( _
		"C:\Program Files (x86)\Microsoft Visual FoxPro 9\vfp9.exe", _
		"C:\Program Files\Microsoft Visual FoxPro 9\vfp9.exe" _
	)
	For Each c In candidates
		If FileSystemObject.FileExists(c) Then
			FindVfpExe = c
			Exit Function
		End If
	Next
	FindVfpExe = ""
End Function


Private Sub scanDirs(tcArgument)
	Dim omFolder, oFile, oFolder, ext
	If FileSystemObject.FolderExists(tcArgument) Then
		Set omFolder = FileSystemObject.GetFolder(tcArgument)
		For Each oFile In omFolder.Files
			ext = LCase(FileSystemObject.GetExtensionName(oFile.Path))
			If ext = "scx" Or ext = "frx" Or ext = "vcx" Or ext = "mnx" Or ext = "lbx" Or ext = "pjx" Then
				evaluateFile oFile.Path
			End If
		Next
		For Each oFolder In omFolder.SubFolders
			scanDirs oFolder.Path
		Next
	Else
		evaluateFile tcArgument
	End If
End Sub


Private Sub evaluateFile(tcFile)
	nFile_Count = nFile_Count + 1
	ReDim Preserve aFiles(nFile_Count)
	aFiles(nFile_Count) = tcFile
End Sub
