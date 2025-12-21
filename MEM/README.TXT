First run ERP App as Administrator.

This 'MEM' directory needs Full Controll permisions for Windows Security.
*FoxUser.DBF and FPT can be a problem. Delete from 'HPA' directory. Possible Reset permisions on these file in \MEM\.







*As Administrator create the HPA DSN.

Otherwise you must:
run CMD as Administrator
REGSVR32 "c:\Program Files (x86)\HPA\Include\comCtl32.ocx"
REGSVR32 "c:\Program Files (x86)\HPA\Include\comCt232.ocx"
REGSVR32 "c:\Program Files (x86)\HPA\Include\mscomct2.ocx"

failed to load is typo
