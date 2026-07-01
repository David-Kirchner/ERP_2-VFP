@echo off
setlocal
set VFP=C:\Program Files (x86)\Microsoft Visual FoxPro 9\vfp9.exe
taskkill /IM vfp9.exe /F 2>nul
"%VFP%" "E:\VFP\ERP_2\tools\foxbin2prg\foxbin2prg_p2b.prg" "E:\VFP\ERP_2\Forms\quotes.sc2"
exit /b %ERRORLEVEL%
