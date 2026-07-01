@echo off
setlocal EnableDelayedExpansion
set ROOT=E:\VFP\ERP_2
set VFP=C:\Program Files (x86)\Microsoft Visual FoxPro 9\vfp9.exe
set LIST=%ROOT%\tools\erp_test_form_list.txt
set CSV=%ROOT%\tools\erp_test_results.csv
set STATE=%ROOT%\tools\erp_test_state.txt
set LAST=%ROOT%\tools\erp_test_last.txt
set MAX=%1
if "%MAX%"=="" set MAX=9999

echo === ERP_Test incremental EXE build ===
echo Close ERP_Test.pjx in VFP before running.
echo Prerequisite: run_erp_test_compile_all.bat
echo Max this run: %MAX%
echo.

taskkill /IM vfp9.exe /F 2>nul
ping 127.0.0.1 -n 2 >nul
copy "%ROOT%\tools\project_bak_archive\erp.pjt.bak.20260610" "%ROOT%\erp_test.pjt" >nul

if not exist "%ROOT%\erp_test.pjx" (
  "%VFP%" -cNULL "%ROOT%\tools\erp_test_init.prg"
)

set /a COUNT=0
set /a START=0
if exist "%STATE%" set /p START=<"%STATE%"
set /a END=START+MAX

for /f "usebackq delims=" %%F in ("%LIST%") do (
  set /a COUNT+=1
  if !COUNT! GTR !START! if !COUNT! LEQ !END! (
    echo [!COUNT!] Testing %%F ...
    copy "%ROOT%\tools\project_bak_archive\erp.pjt.bak.20260610" "%ROOT%\erp_test.pjt" >nul
    del "%ROOT%\tools\erp_test_harness.FXP" 2>nul
    del "%ROOT%\tools\erp_test_add_one.FXP" 2>nul
    del "%ROOT%\tools\erp_test_build_one.FXP" 2>nul
    del "%ROOT%\tools\erp_test_check_result.FXP" 2>nul
    echo ONE> "%ROOT%\tools\erp_test_mode.txt"
    echo %%F>> "%ROOT%\tools\erp_test_mode.txt"
    echo   PREP...
    "%VFP%" -cNULL "%ROOT%\tools\erp_test_add_one.prg"
    echo   BUILD...
    "%VFP%" -cNULL "%ROOT%\tools\erp_test_build_one.prg"
    set VFP_EXIT=!ERRORLEVEL!
    "%VFP%" -cNULL "%ROOT%\tools\erp_test_check_result.prg"
    copy "%ROOT%\tools\project_bak_archive\erp.pjt.bak.20260610" "%ROOT%\erp_test.pjt" >nul
    echo !COUNT!> "%STATE%"
    findstr /i "%%F,EXE_PASS" "%LAST%" >nul 2>&1 && echo   Result: EXE_PASS || (
      findstr /i "%%F,EXE_FAIL" "%LAST%" >nul 2>&1 && echo   Result: EXE_FAIL || (
        echo   Result: EXE_CRASH vfp_exit=!VFP_EXIT!
        echo %DATE% %TIME%,%%F,EXE_CRASH,vfp_exit=!VFP_EXIT!>> "%CSV%"
      )
    )
    ping 127.0.0.1 -n 2 >nul
  )
)

echo Done. See %CSV%
endlocal
