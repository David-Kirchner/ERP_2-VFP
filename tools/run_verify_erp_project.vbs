Dim sh, vfp, prg, log, fso, rc
Set sh = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
vfp = "C:\Program Files (x86)\Microsoft Visual FoxPro 9\vfp9.exe"
prg = "E:\VFP\ERP_2\tools\verify_erp_project.prg"
log = "E:\VFP\ERP_2\tools\verify_erp_project.log"
sh.CurrentDirectory = "E:\VFP\ERP_2"
rc = sh.Run(Chr(34) & vfp & Chr(34) & " -cNULL " & Chr(34) & prg & Chr(34), 0, True)
If fso.FileExists(log) Then WScript.StdOut.Write fso.OpenTextFile(log, 1).ReadAll
WScript.Quit rc
