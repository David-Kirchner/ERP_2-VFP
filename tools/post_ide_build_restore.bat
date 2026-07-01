@echo off
setlocal
set ROOT=E:\VFP\ERP_2
set ARCH=%ROOT%\tools\project_bak_archive
echo === Post-IDE-build: restore ERP.PJX/PJT (keeps erp.exe/erp.app) ===
taskkill /IM vfp9.exe /F 2>nul
ping 127.0.0.1 -n 3 >nul
if not exist "%ARCH%\erp.pjt.bak.20260610" (
  echo ERROR: Missing archive PJT
  exit /b 1
)
copy /Y "%ARCH%\erp.pjx.bak.20260610" "%ROOT%\ERP.PJX"
copy /Y "%ARCH%\erp.pjt.bak.20260610" "%ROOT%\ERP.PJT"
if exist "%ROOT%\erp.pjt.bak" del /F /Q "%ROOT%\erp.pjt.bak"
cscript //Nologo "%ROOT%\tools\run_sync_erp_pjx.vbs"
for %%F in ("%ROOT%\ERP.PJT") do echo ERP.PJT: %%~zF bytes
echo Done. Project Manager should open without invalid-memo error.
endlocal
