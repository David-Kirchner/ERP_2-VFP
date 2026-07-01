Set sh = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
sh.Run Chr(34) & "C:\Program Files (x86)\Microsoft Visual FoxPro 9\vfp9.exe" & Chr(34) & " -cNULL " & Chr(34) & "E:\VFP\ERP_2\tools\compile_sql_certs_test.prg" & Chr(34), 0, True
WScript.Sleep 2000
If fso.FileExists("E:\VFP\ERP_2\tools\compile_sql_certs.log") Then
	Set ts = fso.OpenTextFile("E:\VFP\ERP_2\tools\compile_sql_certs.log", 1)
	WScript.Echo ts.ReadAll
	ts.Close
Else
	WScript.Echo "No log file"
End If
