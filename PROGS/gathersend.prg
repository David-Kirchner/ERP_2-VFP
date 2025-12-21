PARAMETER m.SalesP,generic, pAQrecN
LOCAL n, lnSendToLoop, asrcs
LOCAL txtGcompany, txtGphone, txtGfax,	txtGperson,	txtGemail,	txtGemail2
LOCAL m.ifax, m.faxnum 
m.ifax = SPACE(10)
m.faxnum = SPACE(11)
n = aLen(pAQrecN)
LOCAL m.icompany, m.iphone, m.ifaxnum, m.iperson, m.iemail, m.iemail2

IF generic
	txtGcompany	= SPACE(30)
	txtGphone	= SPACE(11)
	txtGfax		= SPACE(11)
	txtGperson	= "Sales"+SPACE(10)
	txtGemail	= SPACE(30)
	txtGemail2	= SPACE(30)

*	SAVE ALL LIKE txtG* TO c:\GatherSend
	DO FORM Forms\GatherSend WITH txtGcompany,txtGphone,txtGfax,txtGperson,txtGemail,txtGemail2
ELSE

	COUNT ALL FOR s AND UPPER(m.SalesP) = UPPER(q.p) TO acnt

	DIMENSION asrcs(acnt,7)
	COPY TO ARRAY asrcs FOR s AND m.SalesP = q.p
	SAVE TO delASRCS ALL LIKE asrcs
	REPLACE ALL s WITH .F., q.p WITH ' ' FOR s AND q.p = m.SalesP

	*USE

	***---------------------------BEGIN FOR LOOP
	FOR lnSendToLoop = 1 TO acnt
		SELE qdb
		GO TOP

		m.icompany = asrcs(lnSendToLoop,2)
		m.iphone   = asrcs(lnSendToLoop,3)
		m.ifaxnum  = asrcs(lnSendToLoop,4)
		m.iperson  = asrcs(lnSendToLoop,5)
		m.iemail   = asrcs(lnSendToLoop,6)
		m.iemail2  = asrcs(lnSendToLoop,7)


		m.icompany= IIF(EMPTY(m.icompany),SPACE(30),m.icompany)
		m.iphone  = IIF(EMPTY(m.iphone ),SPACE(11),"1"+m.iphone )
		m.ifaxnum = IIF(EMPTY(m.ifaxnum),SPACE(11),"1"+m.ifaxnum)
		m.iperson = IIF(EMPTY(m.iperson),SPACE(15),m.iperson)
		m.iemail  = IIF(EMPTY(m.iemail), SPACE(30),m.iemail)
		m.iemail2 = IIF(EMPTY(m.iemail2), SPACE(30),m.iemail2)

		txtGcompany	=m.icompany
		txtGphone	=m.iphone
		txtGfax		=m.ifaxnum
		txtGperson	=m.iperson
		txtGemail	=m.iemail
		txtGemail2	=m.iemail2

*		SAVE ALL LIKE txtG* TO c:\GatherSend

		DO FORM Forms\GatherSend WITH txtGcompany,txtGphone,txtGfax,txtGperson,txtGemail,txtGemail2, pAQrecN

	NEXT lnSendToLoop
	***---------------------------END FOR LOOP
ENDIF

