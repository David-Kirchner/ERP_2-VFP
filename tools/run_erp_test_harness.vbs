Dim sh, fso, vfp, prg, log, modeFile, rc
Set sh = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
vfp = "C:\Program Files (x86)\Microsoft Visual FoxPro 9\vfp9.exe"
prg = "E:\VFP\ERP_2\tools\erp_test_run.prg"
log = "E:\VFP\ERP_2\tools\erp_test_harness.log"
modeFile = "E:\VFP\ERP_2\tools\erp_test_mode.txt"
sh.CurrentDirectory = "E:\VFP\ERP_2"
sh.Run "taskkill /IM vfp9.exe /F", 0, True
WScript.Sleep 1500
Dim mode, form, body
mode = "INIT"
form = ""
If WScript.Arguments.Count > 0 Then mode = WScript.Arguments(0)
If WScript.Arguments.Count > 1 Then form = WScript.Arguments(1)
body = mode
If form <> "" Then body = body & vbCrLf & form
Dim ts
Set ts = fso.CreateTextFile(modeFile, True)
ts.Write body
ts.Close
rc = sh.Run(Chr(34) & vfp & Chr(34) & " -cNULL " & Chr(34) & prg & Chr(34), 0, True)
If fso.FileExists(log) Then
	Set ts = fso.OpenTextFile(log, 1)
	WScript.StdOut.Write ts.ReadAll
	ts.Close
End If
WScript.Quit rc
