Dim sh
Set sh = CreateObject("WScript.Shell")
sh.CurrentDirectory = "E:\VFP\ERP_2"
sh.Run Chr(34) & "C:\Program Files (x86)\Microsoft Visual FoxPro 9\vfp9.exe" & Chr(34) & " -cNULL " & Chr(34) & "E:\VFP\ERP_2\tools\compile_erp_certs_test.prg" & Chr(34), 0, True
Dim fso, ts
Set fso = CreateObject("Scripting.FileSystemObject")
If fso.FileExists("E:\VFP\ERP_2\tools\compile_erp_certs.log") Then
	Set ts = fso.OpenTextFile("E:\VFP\ERP_2\tools\compile_erp_certs.log", 1)
	WScript.StdOut.Write ts.ReadAll
End If
