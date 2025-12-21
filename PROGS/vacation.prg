*SET PROCEDURE TO Quotes\Progs\Vacation ADDITIVE

***********************
FUNCTION NextVacationID
PRIVATE aMaxID, lnMaxID
lnMaxID = 0

SELECT MAX(id) FROM VACATION INTO ARRAY aMaxID

IF TYPE('aMaxID') = 'N'
	lnMaxID = aMaxID(1)
ENDIF
lnMaxID = lnMaxID + 1

RETURN lnMaxID

***********************
FUNCTION NextEmployeeID
PRIVATE aMaxID, lnMaxID
lnMaxID = 0

SELECT MAX(id) FROM Employees INTO ARRAY aMaxID

IF TYPE('aMaxID') = 'N'
	lnMaxID = aMaxID(1)
ENDIF
lnMaxID = lnMaxID + 1

RETURN lnMaxID

***********************
FUNCTION NextVacationID
PRIVATE aMaxID, lnMaxID
lnMaxID = 0

SELECT MAX(id) FROM VACATION INTO ARRAY aMaxID

IF TYPE('aMaxID') = 'N'
	lnMaxID = aMaxID(1)
ENDIF
lnMaxID = lnMaxID + 1

RETURN lnMaxID

***********************
FUNCTION IsEmployee
PARAMETER pEmployee
PRIVATE aMaxID


IF IsNull(pEmployee)
	RETURN .F.
ENDIF
IF TYPE('pEmployee') <> "C"
	RETURN .F.
ENDIF

IF pEmployee = "(Select Employee)"
	RETURN .F.
ENDIF


SELECT DispName FROM Employees WHERE DispName = AllTrim(pEmployee) INTO ARRAY aMaxID

IF TYPE('aMaxID') <> "C"
	RETURN .F.
ENDIF

RETURN .T.

***********************
FUNCTION IsHoliday
Parameter pDate
PRIVATE aMaxID

IF IsNull(pDate)
	Wait window 'IsHoliday() Did not Receive Date' 
	RETURN "NoDate"
ENDIF
IF TYPE('pDate') <> "D"
	Wait window 'IsHoliday() Did not Receive Date' 
	RETURN "NoDate"
ENDIF

SELECT Holiday FROM Holiday WHERE HoliDate = pDate INTO ARRAY aMaxID

IF TYPE('aMaxID') = "C"
	RETURN RTRIM(aMaxID(1))
ENDIF

RETURN "NO"
************************
FUNCTION IsVacationDay
Parameter pDate,pEmployee
PRIVATE aMaxID

IF IsNull(pDate)
	Wait window 'IsHoliday() Did not Receive Date' 
	RETURN "NoDate"
ENDIF
IF TYPE('pDate') <> "D"
	Wait window 'IsHoliday() Did not Receive Date' 
	RETURN "NoDate"
ENDIF

IF IsNull(pEmployee)
	Wait window 'IsHoliday() Did not Receive Employee' 
	RETURN "NoEmployee"
ENDIF
IF TYPE('pEmployee') <> "C"
	Wait window 'IsHoliday() Did not Receive Employee' 
	RETURN "NoEmployee"
ENDIF
IF NOT IsEmployee(pEmployee)
	RETURN "NoEmployee"
ENDIF

SELECT DispName FROM Vacation WHERE VacaDate = pDate AND DispName = pEmployee INTO ARRAY aMaxID

IF TYPE('aMaxID') = "C"
	RETURN "YES"
ENDIF

RETURN "NO"
************************

FUNCTION VacationTimeAllowed
PARAMETER pDate, pEmployee
PRIVATE aMaxID, ldFullTime, lnDays

IF IsNull(pDate)
	Wait window 'VacationTimeAllowed() Did not Receive Date in Question.' 
	RETURN "NoDate"
ENDIF
IF TYPE('pDate') <> "D"
	Wait window 'VacationTimeAllowed() Did not Receive Date in Question.' 
	RETURN "NoDate"
ENDIF

IF IsNull(pEmployee)
	Wait window 'VacationTimeAllowed() Did not Receive Employee' 
	RETURN "NoEmployee"
ENDIF
IF TYPE('pEmployee') <> "C"
	Wait window 'VacationTimeAllowed() Did not Receive Employee' 
	RETURN "NoEmployee"
ENDIF
IF NOT IsEmployee(pEmployee)
	RETURN "NotEmployee"
ENDIF

* Get startdate
SELECT FullTime FROM employees WHERE DispName = pEmployee AND Active1 INTO ARRAY aMaxID

IF TYPE('aMaxID') <> "D"
	RETURN "NoHireDate"
ENDIF

ldFullTime= aMaxID(1)
lnDays = ldFullTime - pDate

*Less than 8 month = 0
nFday   = DAY(ldFullTime)
nFmonth = MONTH(ldFullTime)
nFyear  = YEAR(ldFullTime)

nDay    = DAY(pDate)
nDmonth = MONTH(pDate)
nDyear  = YEAR(pDate)

n8Year  = nFyear
n8Month = nFmonth + 8
IF n8Month > 12
	n8Month = n8Month - 12
	n8Year = n8Year + 1
ENDIF
d8Months = CTOD( STR(n8month)+"/"+STR(nFday)+"/"+STR(n8year) )
d1year =  CTOD( STR(nFmonth)+"/"+STR(nFday)+"/"+STR(nFyear + 1) )
d10year =  CTOD( STR(nFmonth)+"/"+STR(nFday)+"/"+STR(nFyear + 10) )
d15year =  CTOD( STR(nFmonth)+"/"+STR(nFday)+"/"+STR(nFyear + 15) )
d20year =  CTOD( STR(nFmonth)+"/"+STR(nFday)+"/"+STR(nFyear + 20) )

DO CASE .T.
CASE pDate < d8Months
	RETURN '0'
CASE pDate < d1Year
	RETURN '5'
CASE pDate < d10Year
	RETURN '10'
CASE pDate < d15Year
	RETURN '15'
CASE pDate < d20Year
	RETURN '20'
CASE pDate >= d20Year
	RETURN '25'	
OTHERWISE
	RETURN 'Error'
ENDCASE

RETURN 'Error'

************************

FUNCTION VacationTimeUsed
Parameter pDate, pEmployee

IF IsNull(pDate)
	Wait window 'VacationTimeUsed() Did not Receive Date' 
	RETURN "NoDate"
ENDIF
IF TYPE('pDate') <> "D"
	Wait window 'VacationTimeUsed() Did not Receive Date' 
	RETURN "NoDate"
ENDIF

IF IsNull(pEmployee)
	Wait window 'VacationTimeUsed() Did not Receive Employee' 
	RETURN "NoEmployee"
ENDIF
IF TYPE('pEmployee') <> "C"
	Wait window 'VacationTimeUsed() Did not Receive Employee' 
	RETURN "NoEmployee"
ENDIF
IF NOT IsEmployee(pEmployee)
	RETURN "NotEmployee"
ENDIF

SELECT SUM(hours)/8 as Days FROM vacation WHERE DispName = pEmployee AND VacaType='V' AND YEAR(Vacadate) = YEAR(pDate) INTO ARRAY aMaxID

IF TYPE('aMaxID') = 'N'
	lnDays = aMaxID(1)
ELSE
	lnDays = 0
ENDIF

RETURN ALLTRIM(STR(lnDays))

************************

FUNCTION DaysVacationLeft
Parameter pDate, pEmployee

IF IsNull(pDate)
	Wait window 'VacationTimeUsed() Did not Receive Date' 
	RETURN 0
ENDIF
IF TYPE('pDate') <> "D"
	Wait window 'VacationTimeUsed() Did not Receive Date' 
	RETURN 0
ENDIF

IF IsNull(pEmployee)
	Wait window 'VacationTimeUsed() Did not Receive Employee' 
	RETURN 0
ENDIF
IF TYPE('pEmployee') <> "C"
	Wait window 'VacationTimeUsed() Did not Receive Employee' 
	RETURN 0
ENDIF
IF NOT IsEmployee(pEmployee)
	RETURN 0
ENDIF

lcAllowed = VacationTimeAllowed(pDate, pEmployee)
lcUsed    = VacationTimeUsed(pDate, pEmployee)

IF UPPER(LEFT(lcAllowed ,2)) = "NO"
	RETURN 0
ENDIF

IF UPPER(LEFT(lcUsed,2)) = "NO"
	RETURN 0
ENDIF

lnAllowed = VAL(lcAllowed)
lnUsed    = VAL(lcUsed)

RETURN lnAllowed - lnUsed

************************

FUNCTION PersonalTimeUsed
Parameter pDate, pEmployee

IF IsNull(pDate)
	Wait window 'PersonalTimeUsed() Did not Receive Date' 
	RETURN "NoDate"
ENDIF
IF TYPE('pDate') <> "D"
	Wait window 'PersonalTimeUsed() Did not Receive Date' 
	RETURN "NoDate"
ENDIF

IF IsNull(pEmployee)
	Wait window 'PersonalTimeUsed() Did not Receive Employee' 
	RETURN "NoEmployee"
ENDIF
IF TYPE('pEmployee') <> "C"
	Wait window 'PersonalTimeUsed() Did not Receive Employee' 
	RETURN "NoEmployee"
ENDIF
IF NOT IsEmployee(pEmployee)
	RETURN "NotEmployee"
ENDIF

SELECT SUM(hours)/8 as Days FROM vacation WHERE DispName = pEmployee AND VacaType='P' AND YEAR(Vacadate) = YEAR(pDate) INTO ARRAY aMaxID

IF TYPE('aMaxID') = 'N'
	lnDays = aMaxID(1)
ELSE
	lnDays = 0
ENDIF

RETURN ALLTRIM(STR(lnDays))

************************

FUNCTION SickTimeUsed
Parameter pDate, pEmployee

IF IsNull(pDate)
	Wait window 'SickTimeUsed() Did not Receive Date' 
	RETURN "NoDate"
ENDIF
IF TYPE('pDate') <> "D"
	Wait window 'SickTimeUsed() Did not Receive Date' 
	RETURN "NoDate"
ENDIF

IF IsNull(pEmployee)
	Wait window 'SickTimeUsed() Did not Receive Employee' 
	RETURN "NoEmployee"
ENDIF
IF TYPE('pEmployee') <> "C"
	Wait window 'SickTimeUsed() Did not Receive Employee' 
	RETURN "NoEmployee"
ENDIF
IF NOT IsEmployee(pEmployee)
	RETURN "NotEmployee"
ENDIF

SELECT SUM(hours)/8 as Days FROM vacation WHERE DispName = pEmployee AND VacaType='S' AND YEAR(Vacadate) = YEAR(pDate) INTO ARRAY aMaxID

IF TYPE('aMaxID') = 'N'
	lnDays = aMaxID(1)
ELSE
	lnDays = 0
ENDIF

RETURN ALLTRIM(STR(lnDays))