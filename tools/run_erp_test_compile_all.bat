@echo off
setlocal
set ROOT=E:\VFP\ERP_2
set VFP=C:\Program Files (x86)\Microsoft Visual FoxPro 9\vfp9.exe
echo === COMPILE FORM all ERP screens (fast pre-scan) ===
taskkill /IM vfp9.exe /F 2>nul
ping 127.0.0.1 -n 2 >nul
cd /d "%ROOT%"
del /F /Q "%ROOT%\tools\erp_test_compile_all.FXP" 2>nul
"%VFP%" -cNULL "%ROOT%\tools\erp_test_compile_all.prg"
echo.
if exist "%ROOT%\tools\erp_test_results.csv" (
  echo Results: %ROOT%\tools\erp_test_results.csv
  for /f %%A in ('find /c "COMPILE_PASS" ^< "%ROOT%\tools\erp_test_results.csv"') do echo PASS: %%A
  for /f %%A in ('find /c "COMPILE_FAIL" ^< "%ROOT%\tools\erp_test_results.csv"') do echo FAIL: %%A
) else (
  echo ERROR - see %ROOT%\tools\erp_test_harness.log
)
endlocal
