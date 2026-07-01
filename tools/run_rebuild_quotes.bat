@echo off
set VFP=C:\Program Files (x86)\Microsoft Visual FoxPro 9\vfp9.exe
taskkill /IM vfp9.exe /F 2>nul
"%VFP%" "E:\VFP\ERP_2\tools\rebuild_quotes.prg"
exit /b %ERRORLEVEL%
