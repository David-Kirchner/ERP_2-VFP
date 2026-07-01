@echo off
REM One step: restore PJT, add next queued member, BUILD EXE, restore PJT, log result
set VFP=C:\Program Files (x86)\Microsoft Visual FoxPro 9\vfp9.exe
taskkill /IM vfp9.exe /F 2>nul
ping 127.0.0.1 -n 2 >nul
"%VFP%" -cNULL "DO E:\VFP\ERP_2\tools\erp_2_slow_add WITH 'NEXT'"
echo.
echo See E:\VFP\ERP_2\tools\erp_2_slow_add_results.csv
