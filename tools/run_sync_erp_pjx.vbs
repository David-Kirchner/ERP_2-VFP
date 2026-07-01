Dim sh, fso, vfp, prg, log, rc
Set sh = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
vfp = "C:\Program Files (x86)\Microsoft Visual FoxPro 9\vfp9.exe"
prg = "E:\VFP\ERP_2\tools\sync_erp_pjx.prg"
log = "E:\VFP\ERP_2\tools\sync_erp_pjx.log"
sh.CurrentDirectory = "E:\VFP\ERP_2"
sh.Run "taskkill /IM vfp9.exe /F", 0, True
WScript.Sleep 2000
rc = sh.Run(Chr(34) & vfp & Chr(34) & " -cNULL " & Chr(34) & prg & Chr(34), 0, True)
If fso.FileExists(log) Then
	Dim ts
	Set ts = fso.OpenTextFile(log, 1)
	WScript.StdOut.Write ts.ReadAll
	ts.Close
End If
WScript.Quit rc
