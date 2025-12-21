 PARAMETERS cSYS0
 *cUser = PCUser( SYS(0) )
 *Strips Machine out
 *returns User name logged in 
 
 IF VARTYPE(cSYS0) != "C"
 	cSYS0 = SYS(0)
 ENDIF
 
 PRIVATE cReturnUser 
* cReturnUser = ALLTRIM(RIGHT(cSYS0,LEN(cSYS0)-AT('#',cSYS0)-1))
* cReturnUser = ALLTRIM( SUBSTR(SYS(0),AT("#",SYS(0))+2) )
* cReturnUser = RIGHT( SYS(0), LEN(SYS(0))-AT("#",SYS(0))-1 )
 cReturnUser = RIGHT( cSYS0, LEN(cSYS0)-AT("#",cSYS0)-1 )	&& 2019-01-10
 
 RETURN cReturnUser 