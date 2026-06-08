@echo off
REM Export SCX/FRX/VCX to SC2/FR2/VC2 via FoxBin2Prg
setlocal
set "TOOLDIR=%~dp0"
if "%~1"=="" (
  echo Usage: BIN2PRG.bat file.scx [more files...]
  exit /b 1
)
cscript //nologo "%TOOLDIR%Convert_VFP9_BIN_2_PRG.vbs" %*
exit /b %ERRORLEVEL%
