@echo off
REM Reset ERP_Test resume index and restore good PJT (2419565 bytes)
set ROOT=E:\VFP\ERP_2
del "%ROOT%\tools\erp_test_state.txt" 2>nul
copy "%ROOT%\tools\project_bak_archive\erp.pjt.bak.20260610" "%ROOT%\erp_test.pjt"
copy "%ROOT%\tools\project_bak_archive\erp.pjx.bak.20260610" "%ROOT%\erp_test.pjx"
echo Reset erp_test state + restored archive PJX/PJT
dir "%ROOT%\erp_test.pjt" | findstr /i pjt
