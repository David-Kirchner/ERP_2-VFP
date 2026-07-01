@echo off
setlocal
set ROOT=E:\VFP\ERP_2
echo.
echo ============================================================
echo   ERP BUILD EXE - prepare
echo ============================================================
echo.
echo CLOSE ALL Visual FoxPro windows first, then press a key...
pause >nul
call "%ROOT%\tools\restore_erp_project.bat"
cscript //Nologo "%ROOT%\tools\run_prebuild_erp_exe.vbs"
echo.
echo ============================================================
echo   VFP steps (read before you click Build)
echo ============================================================
echo.
echo 1. Start VFP (only after this bat finishes — never run bat with VFP open).
echo.
echo 2. File - Open Project - E:\VFP\ERP_2\ERP.PJX
echo.
echo 3. Project - Build ...
echo.
echo 4. In the Build Options dialog:
echo      [*] Build Executable          ^(selected^)
echo      [ ] Build Application
echo.
echo    UNCHECK this box ^(very important^):
echo      [ ] Recompile all files in project
echo.
echo 5. Runtime: choose your usual ^(Win32 comm/control^).
echo    Home directory: E:\VFP\ERP_2
echo    Main program: PROGS\main.prg  ^(should already be set^)
echo.
echo 6. Click OK to build.
echo.
echo 7. Verify output:
echo      erp.exe   ~24 KB  ^(stub loader^)
echo      erp.app   ~40+ MB ^(actual application^)
echo    Both must exist in E:\VFP\ERP_2\
echo.
echo 8. Cert screen: sql_certs is in the project ^(erp_certs/sql_certs21 retired^).
echo      If sql_certs is EXCLUDE, deploy Forms\sql_certs.scx + sql_certs.sct beside EXE.
echo.
echo NOTE: "Recompile all" recompiles sql_certs and can crash VFP if methods exceed 64KB
echo       even when those files are marked Excluded.
echo.
echo RECOMMENDED — fully automated, no dialogs:
echo   E:\VFP\ERP_2\tools\build_exe_full.bat
echo   Close VFP first. Do not open ERP.PJX during the bat.
echo.
echo If IDE build shows Fatal C0000005 AFTER erp.exe exists, the build
echo may have succeeded — check erp.exe date/size before rebuilding.
echo.
echo ============================================================
endlocal
