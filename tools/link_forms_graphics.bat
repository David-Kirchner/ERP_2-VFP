@echo off
setlocal
set ROOT=E:\VFP\ERP_2
set SRC=%ROOT%\graphics
if not exist "%SRC%\spell.bmp" (
  echo Restoring graphics from ERP_2 - Copy...
  call "%ROOT%\tools\restore_graphics_from_copy.bat"
)
if exist "%ROOT%\Forms\graphics" (
  echo Forms\graphics already exists.
) else (
  mklink /J "%ROOT%\Forms\graphics" "%SRC%"
  if errorlevel 1 (
    echo Junction failed - mirroring graphics into Forms\graphics...
    robocopy "%SRC%" "%ROOT%\Forms\graphics" /E /XO /NFL /NDL /NJH /NJS
  )
)
if not exist "%ROOT%\LIBS\graphics" (
  mklink /J "%ROOT%\LIBS\graphics" "%SRC%" 2>nul
  if errorlevel 1 (
    robocopy "%SRC%" "%ROOT%\LIBS\graphics" /E /XO /NFL /NDL /NJH /NJS
  )
)
call "%ROOT%\tools\link_reports_graphics.bat"
echo Graphics link ready.
exit /b 0
