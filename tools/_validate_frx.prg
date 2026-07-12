* validate
SET SAFETY OFF
CLOSE ALL
SET DEFAULT TO "E:\VFP\ERP_2\"
ln = FCREATE("E:\VFP\ERP_2\tools\_validate_frx.log")
IF ln < 0
  QUIT
ENDIF
FPUTS(ln, "start")
ON ERROR FPUTS(ln, "ERR "+MESSAGE())
TRY
  USE "E:\VFP\ERP_2\REPORTS\purchaseorder14.frx" SHARED NOUPDATE ALIAS frxchk
  FPUTS(ln, "USE ok reccount="+TRANSFORM(RECCOUNT("frxchk")))
  USE IN frxchk
CATCH TO oErr
  FPUTS(ln, "CATCH "+oErr.Message)
ENDTRY
TRY
  USE "E:\VFP\ERP_2\REPORTS\purchaseorder14.frx.bak" SHARED NOUPDATE ALIAS frxbak
  FPUTS(ln, "BAK ok reccount="+TRANSFORM(RECCOUNT("frxbak")))
  USE IN frxbak
CATCH TO oErr
  FPUTS(ln, "BAK CATCH "+oErr.Message)
ENDTRY
FCLOSE(ln)
QUIT
