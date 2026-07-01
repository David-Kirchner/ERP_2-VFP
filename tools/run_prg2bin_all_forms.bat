@echo off
REM Rebuild all Forms\*.scx from *.sc2 (FoxBin2Prg PRG2BIN)
set VFP=C:\Program Files (x86)\Microsoft Visual FoxPro 9\vfp9.exe
taskkill /IM vfp9.exe /F 2>nul
ping 127.0.0.1 -n 2 >nul
"%VFP%" -cNULL "E:\VFP\ERP_2\tools\prg2bin_all_forms.prg"
echo Log: E:\VFP\ERP_2\tools\prg2bin_all_forms.log
type E:\VFP\ERP_2\tools\prg2bin_all_forms.log | findstr /i "DONE FAIL"
