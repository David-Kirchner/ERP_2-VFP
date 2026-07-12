@echo off
setlocal EnableExtensions EnableDelayedExpansion
cd /d "E:\VFP\ERP_2"

if "%~1"=="" goto usage

set "VFP=C:\Program Files (x86)\Microsoft Visual FoxPro 9\vfp9.exe"
if not exist "%VFP%" goto novfp
if not exist "tools\ensure_foxbin_text_current.prg" goto noensure

set "TARGET=%~f1"
if exist "%TARGET%" goto have_target
set "TARGET=%CD%\%~1"
if exist "%TARGET%" goto have_target
echo File not found: %~1
exit /b 1

:have_target
echo Ensuring text current for: %TARGET%
if exist "tools\ensure_foxbin_text_current.fxp" del /q "tools\ensure_foxbin_text_current.fxp"
if exist "tools\_foxbin_ensure_status.txt" del /q "tools\_foxbin_ensure_status.txt"
if exist "tools\_foxbin_ensure_action.txt" del /q "tools\_foxbin_ensure_action.txt"

rem Phase 1: check only (no nested FoxBin / no RUN /W)
set "TIMEOUT_SEC=60"
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$p=Start-Process -FilePath '%VFP%' -ArgumentList @('-CE:\VFP\ERP_2\tools\foxbin2prg\config.fpw','E:\VFP\ERP_2\tools\ensure_foxbin_text_current.prg','%TARGET%') -PassThru -WindowStyle Hidden; if (-not $p.WaitForExit(%TIMEOUT_SEC%000)) { Write-Host 'ENSURE CHECK TIMEOUT — last status:'; if (Test-Path 'tools\_foxbin_ensure_status.txt') { Get-Content 'tools\_foxbin_ensure_status.txt' }; Stop-Process -Id $p.Id -Force -EA SilentlyContinue; exit 124 }; exit $p.ExitCode"
if errorlevel 1 (
  echo ENSURE check failed, exit=%ERRORLEVEL%
  goto showlog
)

if not exist "tools\_foxbin_ensure_action.txt" (
  echo ENSURE FAIL: missing action file
  set ERR=2
  goto showlog
)

rem Parse ACTION|path
set "ACTION="
set "BINFILE="
for /f "usebackq tokens=1* delims=|" %%A in ("tools\_foxbin_ensure_action.txt") do (
  set "ACTION=%%A"
  set "BINFILE=%%B"
)
echo ENSURE action=!ACTION! file=!BINFILE!

if /i "!ACTION!"=="CURRENT" (
  echo Text is current — no BIN2PRG needed.
  set ERR=0
  goto showlog
)

if /i not "!ACTION!"=="NEED_BIN2PRG" (
  echo ENSURE FAIL: unknown action [!ACTION!]
  set ERR=3
  goto showlog
)

rem Phase 2: separate VFP process for BIN2PRG (never nested from VFP RUN)
echo Running BIN2PRG via foxbin2prg_b2p.prg ...
set "TIMEOUT_SEC=120"
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$bin=(Get-Content 'E:\VFP\ERP_2\tools\_foxbin_ensure_action.txt' -Raw).Split('|')[1].Trim(); Write-Host ('BIN2PRG target: ' + $bin); $p=Start-Process -FilePath '%VFP%' -ArgumentList @('E:\VFP\ERP_2\tools\foxbin2prg\foxbin2prg_b2p.prg',$bin) -PassThru -WindowStyle Hidden; if (-not $p.WaitForExit(%TIMEOUT_SEC%000)) { Write-Host 'BIN2PRG TIMEOUT — killing vfp9'; Stop-Process -Id $p.Id -Force -EA SilentlyContinue; exit 124 }; exit $p.ExitCode"
set ERR=%ERRORLEVEL%
if not "%ERR%"=="0" (
  echo BIN2PRG failed, exit=%ERR%
  goto showlog
)

rem FoxBin may skip rewriting identical text and leave an older timestamp,
rem which would make the next ensure keep saying NEED_BIN2PRG. Touch text >= bin.
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$a=(Get-Content 'E:\VFP\ERP_2\tools\_foxbin_ensure_action.txt' -Raw).Trim().Split('|'); $bin=$a[1].Trim(); $text=[IO.Path]::ChangeExtension($bin,'.sc2'); if ($bin -match '\.vcx$') { $text=[IO.Path]::ChangeExtension($bin,'.vc2') }; if ($bin -match '\.frx$') { $text=[IO.Path]::ChangeExtension($bin,'.fr2') }; if ($bin -match '\.mnx$') { $text=[IO.Path]::ChangeExtension($bin,'.mn2') }; if ($bin -match '\.lbx$') { $text=[IO.Path]::ChangeExtension($bin,'.lb2') }; if ($bin -match '\.pjx$') { $text=[IO.Path]::ChangeExtension($bin,'.pj2') }; if (Test-Path $text) { $bt=(Get-Item $bin).LastWriteTime; $tt=(Get-Item $text).LastWriteTime; if ($tt -lt $bt) { (Get-Item $text).LastWriteTime = $bt; Write-Host ('Touched text mtime to match binary: ' + $text) } }"

echo BIN2PRG finished OK.
echo ENSURE_BIN2PRG_OK %DATE% %TIME%>> tools\foxbin_sync.log
set ERR=0

:showlog
echo ---- status / action ----
if exist "tools\_foxbin_ensure_status.txt" type "tools\_foxbin_ensure_status.txt"
if exist "tools\_foxbin_ensure_action.txt" type "tools\_foxbin_ensure_action.txt"
echo ---- foxbin_sync.log last 20 lines ----
powershell -NoProfile -Command "Get-Content -Path 'E:\VFP\ERP_2\tools\foxbin_sync.log' -Tail 20"
exit /b %ERR%

:usage
echo Usage: run_ensure_text_current.bat path\to\file.sc2
echo Example: run_ensure_text_current.bat Forms\CompanyProfile_Maint.SC2
exit /b 1

:novfp
echo VFP9 not found
exit /b 1

:noensure
echo ensure_foxbin_text_current.prg not found under E:\VFP\ERP_2\tools
exit /b 1
