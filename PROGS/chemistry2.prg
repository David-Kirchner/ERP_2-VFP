PARAMETER N,Na,Cb,Ni,O,P,Pb,Sn,S,Si,Ta,Ti,U,V,W,Y,Zr

PRIVATE txt

txt = IIF(EMPTY(N),""," N: "+N)+IIF(EMPTY(Na),""," Na: "+Na)+IIF(EMPTY(Cb),""," Cb: "+Cb)
txt = txt + IIF(EMPTY(Ni),""," Ni: "+Ni)+IIF(EMPTY(o),""," O: "+O)+IIF(EMPTY(P),""," P: "+P) +IIF(EMPTY(Pb),""," Pb:"+Pb)+IIF(EMPTY(Sn),""," Sn: "+Sn)+IIF(EMPTY(S),""," S: "+S)
txt = txt + IIF(EMPTY(Si),"" ," Si: "+Si) +IIF(EMPTY(Ta),""," Ta: "+Ta) +IIF(EMPTY(Ti),""," Ti: "+Ti) +IIF(EMPTY(U),""," U: "+U) +IIF(EMPTY(V),"",  "V: "+V)+IIF(EMPTY(W),""," W: "+W)
txt = txt + IIF(EMPTY(Y),"" ," Y: "+Y) +IIF(EMPTY(Zr),""," Zr: "+Zr) 

RETURN txt

*N,Na,Cb,Ni,O,P,Pb,Sn,S,Si,Ta,Ti,U,V,W,Y,Zr,NiandCo,CbandTa,Other)