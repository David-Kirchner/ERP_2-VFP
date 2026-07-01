@echo off
setlocal
set ROOT=E:\VFP\ERP_2
set "VFP=C:\Program Files (x86)\Microsoft Visual FoxPro 9\vfp9.exe"
set LOG=%ROOT%\tools\smoke_test_results.txt

echo ERP smoke tests > "%LOG%"
echo Started: %DATE% %TIME% >> "%LOG%"
echo. >> "%LOG%"

echo === SQL checks (sqlcmd) === >> "%LOG%"
sqlcmd -S SuperMicro -d ERP_2 -E -Q "SET NOCOUNT ON; SELECT 'Sales_Update Ar_' AS t, CASE WHEN OBJECT_DEFINITION(OBJECT_ID('dbo.Sales_Update')) LIKE '%%dbo.Ar_Sales_History%%' THEN 'PASS' ELSE 'FAIL' END AS r UNION ALL SELECT 'No CWCnt col', CASE WHEN COL_LENGTH('dbo.PriceTable','CWCnt') IS NULL THEN 'PASS' ELSE 'FAIL' END UNION ALL SELECT 'No dbo.Ar.', CASE WHEN (SELECT COUNT(*) FROM sys.sql_modules m JOIN sys.objects o ON m.object_id=o.object_id WHERE m.definition LIKE '%%dbo.Ar.%%' AND o.is_ms_shipped=0)=0 THEN 'PASS' ELSE 'FAIL' END;" -W -h-1 >> "%LOG%" 2>&1

echo. >> "%LOG%"
echo === VFP headless smoke (smoke_test_erp.prg) === >> "%LOG%"
cscript //nologo "%ROOT%\tools\run_vfp_smoke_test.vbs"
set VFPERR=%ERRORLEVEL%
if exist "%LOG%" (type "%LOG%") else (echo VFP smoke test did not write %LOG%)
exit /b %VFPERR%
