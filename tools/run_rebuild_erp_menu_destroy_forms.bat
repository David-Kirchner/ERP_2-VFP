@echo off
REM Rebuild SCX/FRX for forms that received ERP_Menu Destroy restore snippet
set VFP=C:\Program Files (x86)\Microsoft Visual FoxPro 9\vfp9.exe
taskkill /IM vfp9.exe /F 2>nul
ping 127.0.0.1 -n 2 >nul
"%VFP%" -cNULL "E:\VFP\ERP_2\tools\rebuild_erp_menu_destroy_forms.prg"
echo Log: E:\VFP\ERP_2\tools\rebuild_erp_menu_destroy_forms.log
type E:\VFP\ERP_2\tools\rebuild_erp_menu_destroy_forms.log | findstr /i "DONE FAIL MISSING"
