@echo off
setlocal
set SRC=E:\VFP\ERP_2 - Copy
set DST=E:\VFP\ERP_2
robocopy "%SRC%\graphics" "%DST%\graphics" /E /XO
robocopy "%SRC%\ICO" "%DST%\ICO" /E /XO
call "%DST%\tools\link_forms_graphics.bat"
echo Graphics restore complete.
exit /b 0
