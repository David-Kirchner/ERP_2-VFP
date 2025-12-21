PARAMETER pShipRoute

PRIVATE lCloseUpsShipRoute 
lCloseUpsShipRoute = .F.

IF !USED("UpsShipRoute")
	USE HPA!UpsShipRoute IN 0 SHARED NOUPDATE
	lCloseUpsShipRoute = .T.
ENDIF

SEEK pShipRoute IN UpsShipRoute ORDER ShipRoute
IF NOT FOUND("UpsShipRoute")
	MESSAGEBOX( "UPS GROUND          "+;
	  CHR(13)+"UPS GROUND COLLECT  "+;
	  CHR(13)+"UPS GROUND 3RD PARTY"+;
	  CHR(13)+"UPS 3 DAY SELECT    " +;
	  CHR(13)+"UPS 3 DAY COLLECT   " +;
	  CHR(13)+"UPS 3 DAY 3RD PARTY " +;
	  CHR(13)+"UPS 3 DAY SATURDAY  " +;
	  CHR(13)+"UPS 2ND DAY         " +;
	  CHR(13)+"UPS 2ND DAY COD     " +;
	  CHR(13)+"UPS 2ND DAY 3RD PART" +;
	  CHR(13)+"UPS 2ND DAY SATURDAY" +;
	  CHR(13)+"UPS NEXT DAY AIR    "+;
	  CHR(13)+"UPS NEXT DAY AIR COD"+;
	  CHR(13)+"UPS NEXT DAY AIR SAT"+;
	  CHR(13)+"UPS NEXT DAY AIR 3PA"+;	  	
	  CHR(13)+"UPS NEXT DAY SAVER  "+;
	  CHR(13)+"UPS RED SAVER 3RD PA"+;
	  CHR(13)+"UPS NEXT DAY AM  "+;
	  CHR(13)+" "+;
	  CHR(13)+"UPS WORDLWIDE EXPRES"+;
	  CHR(13)+"UPS WORLDWIDE EXPEDI";
	  ,0+32,"Retry using these, or do not start with UPS" )
	  
	IF lCloseUpsShipRoute
	  	USE IN UpsShipRoute
	ENDIF
	RETURN .F.
ENDIF

IF lCloseUpsShipRoute
  	USE IN UpsShipRoute
ENDIF

Return .T.

