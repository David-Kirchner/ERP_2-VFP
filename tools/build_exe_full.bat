@echo off
setlocal
set ROOT=E:\VFP\ERP_2
echo.
echo === Full ERP EXE build (no VFP UI) ===
echo Close Visual FoxPro completely, then press a key...
pause >nul
taskkill /IM vfp9.exe /F 2>nul
ping 127.0.0.1 -n 3 >nul
call "%ROOT%\tools\restore_erp_project.bat"
cscript //Nologo "%ROOT%\tools\run_prebuild_erp_exe.vbs"
del /F /Q "%ROOT%\tools\build_erp_exe.FXP" 2>nul
del /F /Q "%ROOT%\tools\set_erp_certs_exclude.FXP" 2>nul
echo.
echo Building erp.exe via BUILD EXE (no RECOMPILE, no VFP dialogs)...
echo Do NOT open ERP.PJX in VFP while this runs.
echo.
echo IDE builds: after BUILD EXE in Project Manager, close VFP and run:
echo   tools\post_ide_build_restore.bat
echo (Build often succeeds; C0000005 on project SAVE corrupts ERP.PJT.)
cscript //Nologo "%ROOT%\tools\run_build_erp_exe.vbs"
echo.
type "%ROOT%\tools\build_erp_exe.log"
echo.
if exist "%ROOT%\erp.exe" if exist "%ROOT%\erp.app" (
  echo SUCCESS: erp.exe and erp.app exist in %ROOT%
  dir "%ROOT%\erp.exe" "%ROOT%\erp.app"
  echo.
  echo Restoring ERP.PJX/PJT so Project Manager opens without invalid-memo error...
  call "%ROOT%\tools\restore_erp_project.bat"
  echo.
  echo Deploy: erp.exe + erp.app ^(sql_certs in project unless EXCLUDE^)
) else (
  echo BUILD FAILED ??? see tools\build_erp_exe.log
  exit /b 1
)
endlocal

