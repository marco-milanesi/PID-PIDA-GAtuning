
SYS=dataStep.systemTransferFunction;
[numsys,densys]=tfdata(SYS);
syms s ;
sys = vpa(poly2sym(cell2mat(numsys),s)/poly2sym(cell2mat(densys),s),4);
System= latex(sys)


SYSpid=dataStep.Controller.pid;
[num,den]=tfdata(SYSpid);
sys_syms = vpa(poly2sym(cell2mat(num),s)/poly2sym(cell2mat(den),s),4);
pid = latex(sys_syms)

SYSipd1=dataStep.Controller.ipd.K1;
SYSipd2=dataStep.Controller.ipd.K2;
[num1,den1]=tfdata(SYSipd1);
[num2,den2]=tfdata(SYSipd2);
sys_syms1 = vpa(poly2sym(cell2mat(num1),s)/poly2sym(cell2mat(den1),s),4);
sys_syms2 = vpa(poly2sym(cell2mat(num2),s)/poly2sym(cell2mat(den2),s),4);
c1_ipd = latex(sys_syms1)
c2_ipd = latex(sys_syms2) 

sys_syms1=dataStep.Controller.dpi.K1;
SYSdpi2=dataStep.Controller.dpi.K2;
SYSdpi3=dataStep.Controller.dpi.K3;
[numd2,dend2]=tfdata(SYSdpi2);
[numd3,dend3]=tfdata(SYSdpi3);


sys_syms2 = vpa(poly2sym(cell2mat(numd2),s)/poly2sym(cell2mat(dend2),s),4);
sys_syms3 = vpa(poly2sym(cell2mat(numd3),s)/poly2sym(cell2mat(dend3),s),4);
c1_dpi = sys_syms1
c2_dpi = latex(sys_syms2)
c3_dpi = latex(sys_syms3)

SYSpida=dataStep.Controller.pida;
[numpida,denpida]=tfdata(SYSpida);

sys_symspida = vpa(poly2sym(cell2mat(numpida),s)/poly2sym(cell2mat(denpida),s),4);
pida = latex(sys_symspida)


SYSpidd=dataDist.Controller.pid;
[numd,dend]=tfdata(SYSpidd);

sys_symsd = vpa(poly2sym(cell2mat(numd),s)/poly2sym(cell2mat(dend),s),4);
pid_dist = latex(sys_symsd)

SYSpidad=dataDist.Controller.pida;
[numpidad,denpidad]=tfdata(SYSpidad);

sys_symspidad = vpa(poly2sym(cell2mat(numpidad),s)/poly2sym(cell2mat(denpidad),s),4);
pida_dist = latex(sys_symspidad)


[GMpid_m, PMpid_m]= margin(dataStep.Loop.pid)
[GMipd_m, PMipd_m] =margin(dataStep.Loop.ipd)
[GMdpi_m, PMdpi_m] =margin(dataStep.Loop.dpi)
[GMpida_m, PMpida_m]  =margin(dataStep.Loop.pida)

[GMpid_dist_m, PMpid_dist_m] = margin(dataDist.Loop.pid)
[GMpida_dist_m, PMpida_dist_m] = margin(dataDist.Loop.pida)
