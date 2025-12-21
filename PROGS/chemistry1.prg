PARAMETER AL,B,C,Ca,Cd,Cl,Co,Cr,Cu,Fe,H,Hf,Mg,Mo,Mn
*,N,Na,Cb,Ni,O,P,Pb,Sn,S,Si,Ta,Ti,U,V,W,Y,Zr,NiandCo,CbandTa,Other

PRIVATE txt

txt = IIF(EMPTY(AL),"" ," Al: "+AL) +IIF(EMPTY(B),""," B: "+B) +IIF(EMPTY(C),""," C: "+C) +IIF(EMPTY(Ca),""," Ca: "+Ca) +IIF(EMPTY(Cd),"",  "Cd: "+Cd)+IIF(EMPTY(CL),""," Cl: "+CL)
txt = txt + IIF(EMPTY(Co),""," Co: "+Co)+IIF(EMPTY(Cr),""," Cr: "+Cr)+IIF(EMPTY(Cu),""," Cu: "+Cu)+IIF(EMPTY(Fe),""," Fe: "+Fe)+IIF(EMPTY(H),""," H: "+H)+IIF(EMPTY(Hf),""," Hf: "+Hf)
txt = txt + IIF(EMPTY(Mg),""," Mg: "+Mg)+IIF(EMPTY(Mo),""," Mo: "+Mo)+IIF(EMPTY(Mn),""," Mn: "+Mn)

return txt