Dim sh, fso, vfp, prg, log, rc
Set sh = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
vfp = "C:\Program Files (x86)\Microsoft Visual FoxPro 9\vfp9.exe"
prg = "E:\VFP\ERP_2\tools\smoke_test_erp.prg"
log = "E:\VFP\ERP_2\tools\smoke_test_results.txt"

If Not fso.FileExists(vfp) Then
	WScript.StdErr.WriteLine "vfp9.exe not found: " & vfp
	WScript.Quit 2
End If
If Not fso.FileExists(prg) Then
	WScript.StdErr.WriteLine "Missing: " & prg
	WScript.Quit 2
End If

sh.CurrentDirectory = "E:\VFP\ERP_2"
rc = sh.Run(Chr(34) & vfp & Chr(34) & " -cNULL " & Chr(34) & prg & Chr(34), 0, True)

If fso.FileExists(log) Then
	Dim ts
	Set ts = fso.OpenTextFile(log, 1)
	WScript.StdOut.Write ts.ReadAll
	ts.Close
Else
	WScript.StdErr.WriteLine "VFP smoke test did not write: " & log
End If

WScript.Quit rc
