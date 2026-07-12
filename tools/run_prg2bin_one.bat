@echo off
setlocal EnableExtensions
cd /d "E:\VFP\ERP_2"

if "%~1"=="" goto usage

set "VFP=C:\Program Files (x86)\Microsoft Visual FoxPro 9\vfp9.exe"
if not exist "%VFP%" goto novfp

set "TARGET=%~f1"
if exist "%TARGET%" goto have_target
set "TARGET=%CD%\%~1"
if exist "%TARGET%" goto have_target
echo File not found: %~1
exit /b 1

:have_target
echo PRG2BIN: %TARGET%
if exist "tools\prg2bin_one.fxp" del /q "tools\prg2bin_one.fxp"
if exist "tools\_foxbin_prg2bin_status.txt" del /q "tools\_foxbin_prg2bin_status.txt"

rem Prefer direct foxbin2prg_p2b — no nested RUN from another PRG
set "TIMEOUT_SEC=120"
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$p=Start-Process -FilePath '%VFP%' -ArgumentList @('E:\VFP\ERP_2\tools\foxbin2prg\foxbin2prg_p2b.prg','%TARGET%') -PassThru -WindowStyle Hidden; if (-not $p.WaitForExit(%TIMEOUT_SEC%000)) { Write-Host 'PRG2BIN TIMEOUT — killing vfp9'; Stop-Process -Id $p.Id -Force -EA SilentlyContinue; exit 124 }; exit $p.ExitCode"
set "ERR=%ERRORLEVEL%"
echo PRG2BIN_P2B exit=%ERR% %DATE% %TIME%>> tools\foxbin_sync.log
echo ---- foxbin_sync.log last 8 lines ----
powershell -NoProfile -Command "Get-Content -Path 'E:\VFP\ERP_2\tools\foxbin_sync.log' -Tail 8"
exit /b %ERR%

:usage
echo Usage: run_prg2bin_one.bat path\to\file.sc2
exit /b 1

:novfp
echo VFP9 not found
exit /b 1
