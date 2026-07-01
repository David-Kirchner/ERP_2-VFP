@echo off
setlocal
set ROOT=E:\VFP\ERP_2
echo === Full ERP EXE build (no VFP UI, no pause) ===
taskkill /IM vfp9.exe /F 2>nul
ping 127.0.0.1 -n 3 >nul
call "%ROOT%\tools\restore_erp_project.bat"
cscript //Nologo "%ROOT%\tools\run_prebuild_erp_exe.vbs"
del /F /Q "%ROOT%\tools\build_erp_exe.FXP" 2>nul
echo Building erp.exe via BUILD EXE (Recompile all OFF in project)...
cscript //Nologo "%ROOT%\tools\run_build_erp_exe.vbs"
echo.
type "%ROOT%\tools\build_erp_exe.log"
if exist "%ROOT%\erp.exe" if exist "%ROOT%\erp.app" (
  call "%ROOT%\tools\restore_erp_project.bat"
  echo SUCCESS: see erp.exe + erp.app in %ROOT%
  dir "%ROOT%\erp.exe" "%ROOT%\erp.app"
  for %%F in ("%ROOT%\ERP.PJT") do echo ERP.PJT: %%~zF bytes (want 2419565)
) else (
  echo BUILD FAILED - see tools\build_erp_exe.log
  exit /b 1
)
endlocal
