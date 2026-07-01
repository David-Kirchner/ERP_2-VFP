*====================================================================
* sql_certs.prg — launch SQL Certs formset
* DO PROGS\sql_certs
* Visual form: Forms\SQL_certs.scx (edit via Form Designer)
*====================================================================

LOCAL lcRoot
lcRoot = ADDBS(SYS(5) + SYS(2003))
CD (lcRoot)

DO FORM (lcRoot + "Forms\SQL_certs.scx")

RETURN
