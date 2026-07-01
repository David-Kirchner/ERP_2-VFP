@echo off
setlocal
if "%~1"=="" (
  echo Usage: run_prg2bin_one.bat path\to\file.sc2
  exit /b 1
)
taskkill /IM vfp9.exe /F 2>nul
set VFP=C:\Program Files (x86)\Microsoft Visual FoxPro 9\vfp9.exe
"%VFP%" "E:\VFP\ERP_2\tools\prg2bin_one.prg" "%~1"
exit /b %ERRORLEVEL%
