@echo off
setlocal
if "%~1"=="" (
  echo Usage: run_ensure_text_current.bat path\to\file.sc2
  exit /b 1
)
set VFP=C:\Program Files (x86)\Microsoft Visual FoxPro 9\vfp9.exe
"%VFP%" "E:\VFP\ERP_2\tools\ensure_foxbin_text_current.prg" "%~1"
exit /b %ERRORLEVEL%
