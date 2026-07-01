@echo off
setlocal
set VFP=C:\Program Files (x86)\Microsoft Visual FoxPro 9\vfp9.exe
set ROOT=E:\VFP\ERP_2
set LOG=%ROOT%\tools\rebuild_graphics_forms.log
taskkill /IM vfp9.exe /F 2>nul
echo Batch rebuild %date% %time% > "%LOG%"
set FORMS=Forms\quotes.sc2 Forms\ship.sc2 Forms\sales_detail_edit.sc2 Forms\Receipts.SC2 Forms\Shipments.sc2 Forms\getreason.sc2 Forms\GetCancelReason.sc2 Forms\Price_Fixer_Tool.sc2 Forms\StockLst_DueIn_WOD.sc2 Forms\stocklst_duein_POitem.sc2
for %%F in (%FORMS%) do (
  echo === %%F ===
  "%VFP%" "%ROOT%\tools\rebuild_one_form.prg" "%%F"
)
echo DONE %date% %time% >> "%LOG%"
type "%LOG%"
exit /b 0
