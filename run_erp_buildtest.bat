@echo off
setlocal enabledelayedexpansion

REM ================= EDIT THESE IF NEEDED =================
set "VFP=C:\Program Files (x86)\Microsoft Visual FoxPro 9\vfp9.exe"
set "BASE=e:\vfp\erp_2"
set "STARTAT=1"
set "MAXFORMS=4"
REM =======================================================

cd /d "%BASE%"

if not exist "%VFP%" (
   echo ERROR: vfp9.exe not found at:
   echo    %VFP%
   echo Edit the VFP= line at the top of this .bat to the correct path.
   pause
   exit /b 1
)

REM --- fresh start ---
del "%BASE%\erp_forms.txt"          2>nul
del "%BASE%\erp_idx.txt"            2>nul
del "%BASE%\erp_enum_error.txt"     2>nul
echo Harness run started %DATE% %TIME% > "%BASE%\erp_test_results.log"

REM --- Step 1: enumerate the forms in ERP.pjx ---
echo.
echo Enumerating forms from ERP.pjx ...
"%VFP%" -C"%BASE%\config_enum.fpw"

if exist "%BASE%\erp_enum_error.txt" (
   type "%BASE%\erp_enum_error.txt"
   pause
   exit /b 1
)
if not exist "%BASE%\erp_forms.txt" (
   echo ERROR: erp_forms.txt was not created. Check the ERP.pjx path / config_enum.fpw.
   pause
   exit /b 1
)

REM --- count forms ---
set NFORMS=0
for /f %%C in ('type "%BASE%\erp_forms.txt" ^| find /c /v ""') do set NFORMS=%%C
echo Found %NFORMS% form(s) in ERP.pjx.

set END=%MAXFORMS%
if %NFORMS% LSS %END% set END=%NFORMS%

echo.
echo Testing cumulative builds for forms %STARTAT% through %END%
echo (each form is built in its own fresh VFP process) ...
echo.

for /L %%I in (%STARTAT%,1,%END%) do (
   echo %%I> "%BASE%\erp_idx.txt"
   echo   --- form #%%I : cumulative build 1..%%I ---
   "%VFP%" -C"%BASE%\config_build.fpw"
)

echo.
echo ============================================================
echo DONE. Open erp_test_results.log to see results.
echo  - "PASS"            = that form built the EXE fine
echo  - "TRAPPED ERROR"   = recoverable build/compile error
echo  - "building EXE ..." with no "EXE OK"/"PASS" after it
echo                      = VFP CRASHED building the EXE for that form
echo ============================================================
pause
