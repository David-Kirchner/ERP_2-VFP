@echo off
setlocal
set ROOT=E:\VFP\ERP_2
set SRC=%ROOT%\graphics
if not exist "%SRC%\spell.bmp" (
  echo Restoring graphics from ERP_2 - Copy...
  call "%ROOT%\tools\restore_graphics_from_copy.bat"
)
if not exist "%ROOT%\REPORTS" (
  echo REPORTS folder missing.
  exit /b 1
)
if exist "%ROOT%\REPORTS\graphics" (
  echo REPORTS\graphics already exists.
) else (
  mklink /J "%ROOT%\REPORTS\graphics" "%SRC%"
  if errorlevel 1 (
    echo Junction failed - mirroring graphics into REPORTS\graphics...
    robocopy "%SRC%" "%ROOT%\REPORTS\graphics" /E /XO /NFL /NDL /NJH /NJS
  )
)
echo REPORTS graphics link ready.
exit /b 0
