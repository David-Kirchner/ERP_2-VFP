Dim sh, vfp, prg, rc
Set sh = CreateObject("WScript.Shell")
vfp = "C:\Program Files (x86)\Microsoft Visual FoxPro 9\vfp9.exe"
prg = "E:\VFP\ERP_2\tools\smoke_bare.prg"
sh.CurrentDirectory = "E:\VFP\ERP_2\tools"
rc = sh.Run(Chr(34) & vfp & Chr(34) & " -cNULL " & Chr(34) & prg & Chr(34), 0, True)
WScript.Echo "exit=" & rc & " bare=" & CreateObject("Scripting.FileSystemObject").FileExists("E:\VFP\ERP_2\tools\smoke_bare.txt")
