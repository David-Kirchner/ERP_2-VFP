@echo off
setlocal
set ROOT=E:\VFP\ERP_2
set GOOD=2419565
set PJT=%ROOT%\ERP.PJT
set LOG=%ProgramFiles(x86)%\Microsoft Visual FoxPro 9\vfp9err.log

echo === ERP build health ===
if not exist "%PJT%" (
  echo FAIL: missing %PJT%
  exit /b 1
)
for %%F in ("%PJT%") do set PJTSIZE=%%~zF
echo ERP.PJT: %PJTSIZE% bytes  ^(good 2419565-2425500; crash bloat ^>2540000^)
if %PJTSIZE% LSS 2419000 (
  echo STATUS: PJT TRUNCATED - run tools\restore_erp_project.bat
) else if %PJTSIZE% GTR 2540000 (
  echo STATUS: PJT CRASH BLOAT - run tools\restore_erp_project.bat
) else (
  echo STATUS: PJT OK
)

if exist "%ROOT%\erp.exe" if exist "%ROOT%\erp.app" (
  echo.
  echo Last build outputs:
  dir /T:W "%ROOT%\erp.exe" "%ROOT%\erp.app"
) else (
  echo.
  echo No erp.exe/erp.app in project root.
)

if exist "%LOG%" (
  echo.
  echo Last vfp9err.log lines:
  powershell -NoProfile -Command "Get-Content -LiteralPath '%LOG%' -Tail 6"
) else (
  echo.
  echo vfp9err.log not found.
)

echo.
echo Safe build: tools\build_exe_full_auto.bat  ^(Recompile all OFF^)
endlocal
