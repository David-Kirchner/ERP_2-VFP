SET DEFAULT TO E:\VFP\ERP_2\
STRTOFILE("retry " + TTOC(DATETIME()) + CHR(13)+CHR(10), "E:\VFP\ERP_2\tools\compile_sql_certs.log", .F.)
COMPILE FORM Forms\sql_certs
STRTOFILE("PASS sql_certs sct=" + TRANSFORM(FILE("Forms\sql_certs.sct")) + CHR(13)+CHR(10), "E:\VFP\ERP_2\tools\compile_sql_certs.log", 1)
QUIT
