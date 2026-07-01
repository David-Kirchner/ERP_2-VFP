@echo off
setlocal
set ROOT=E:\VFP\ERP_2
set ARCH=%ROOT%\tools\project_bak_archive
echo === Restore ERP.PJX / ERP.PJT ===
taskkill /IM vfp9.exe /F 2>nul
ping 127.0.0.1 -n 3 >nul
if not exist "%ARCH%\erp.pjt.bak.20260610" (
  echo ERROR: Missing %ARCH%\erp.pjt.bak.20260610
  exit /b 1
)
copy /Y "%ARCH%\erp.pjx.bak.20260610" "%ROOT%\ERP.PJX"
copy /Y "%ARCH%\erp.pjt.bak.20260610" "%ROOT%\ERP.PJT"
if exist "%ROOT%\erp.pjt.bak" del /F /Q "%ROOT%\erp.pjt.bak"
echo Restored PJX/PJT from archive.
del /F /Q "%ROOT%\tools\sync_erp_pjx.FXP" 2>nul
del /F /Q "%ROOT%\tools\prebuild_erp_exe.FXP" 2>nul
cscript //Nologo "%ROOT%\tools\run_sync_erp_pjx.vbs"
for %%F in ("%ROOT%\ERP.PJT") do (
  echo ERP.PJT after sync: %%~zF bytes
  if %%~zF LSS 2419000 (
    echo WARNING: PJT truncated - re-copying archive PJT
    copy /Y "%ARCH%\erp.pjt.bak.20260610" "%ROOT%\ERP.PJT" >nul
  )
  if %%~zF GTR 2540000 (
    echo WARNING: PJT bloated - re-copying archive PJT
    copy /Y "%ARCH%\erp.pjt.bak.20260610" "%ROOT%\ERP.PJT" >nul
  )
)
echo.
for %%F in ("%ROOT%\ERP.PJT") do (
  echo ERP.PJT: %%~zF bytes ^(good 2419565-2425500 after split rows^)
  if %%~zF LSS 2419000 (
    echo WARNING: PJT truncated - run restore again
    exit /b 1
  )
  if %%~zF GTR 2425500 (
    echo WARNING: PJT bloated from crash save - run restore again
    exit /b 1
  )
)
endlocal
