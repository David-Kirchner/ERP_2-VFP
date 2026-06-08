@echo off
REM Rebuild SC2/FR2/VC2 to SCX/FRX/VCX via FoxBin2Prg (no CONFIG.FPW dependency)
setlocal
set "TOOLDIR=%~dp0"
set "VFP=C:\Program Files (x86)\Microsoft Visual FoxPro 9\vfp9.exe"
if not exist "%VFP%" set "VFP=C:\Program Files\Microsoft Visual FoxPro 9\vfp9.exe"
if not exist "%VFP%" (
  echo vfp9.exe not found. Set VFP= in PRG2BIN.bat
  exit /b 1
)
if "%~1"=="" (
  echo Usage: PRG2BIN.bat file.sc2 [more files...]
  exit /b 1
)
cscript //nologo "%TOOLDIR%Convert_VFP9_PRG_2_BIN.vbs" %*
exit /b %ERRORLEVEL%
