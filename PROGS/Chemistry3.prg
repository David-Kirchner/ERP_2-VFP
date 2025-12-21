PARAMETER NiandCo,CbandTa,Other

PRIVATE txt

txt = IIF(EMPTY(NiandCo),""," Ni+Co: "+NiandCo) +IIF(EMPTY(CbandTa),""," Cb+Ta: "+CbandTa) +IIF(EMPTY(Other),"",  " "+Other)

RETURN txt
