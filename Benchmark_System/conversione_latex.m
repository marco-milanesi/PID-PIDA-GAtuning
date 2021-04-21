function  conversione_latex(dataStep, dataDist)
%% parametri
syms s ;

%% system transfer fuction 
SYS=dataStep.systemTransferFunction;
[numsys,densys]=tfdata(SYS);
sys = vpa(poly2sym(cell2mat(numsys),s)/poly2sym(cell2mat(densys),s),4);
System= latex(sys)



%% set point
%pid%
SYSpid=dataStep.Controller.pid;
[num,den]=tfdata(SYSpid);
sys_syms = vpa(poly2sym(cell2mat(num),s)/poly2sym(cell2mat(den),s),4);
pid = latex(sys_syms)
%ipd%
SYSipd1=dataStep.Controller.ipd.K1;
SYSipd2=dataStep.Controller.ipd.K2;
[num1,den1]=tfdata(SYSipd1);
[num2,den2]=tfdata(SYSipd2);
sys_syms1 = vpa(poly2sym(cell2mat(num1),s)/poly2sym(cell2mat(den1),s),4);
sys_syms2 = vpa(poly2sym(cell2mat(num2),s)/poly2sym(cell2mat(den2),s),4);
c1_ipd = latex(sys_syms1)
c2_ipd = latex(sys_syms2) 
%dpi%
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
%èida%
SYSpida=dataStep.Controller.pida;
[numpida,denpida]=tfdata(SYSpida);
sys_symspida = vpa(poly2sym(cell2mat(numpida),s)/poly2sym(cell2mat(denpida),s),4);
pida = latex(sys_symspida)



%% disturbance rejection latex
%pid%
SYSpidd=dataDist.Controller.pid;
[numd,dend]=tfdata(SYSpidd);
sys_symsd = vpa(poly2sym(cell2mat(numd),s)/poly2sym(cell2mat(dend),s),4);
pid_dist = latex(sys_symsd)
%pida%
SYSpidad=dataDist.Controller.pida;
[numpidad,denpidad]=tfdata(SYSpidad);
sys_symspidad = vpa(poly2sym(cell2mat(numpidad),s)/poly2sym(cell2mat(denpidad),s),4);
pida_dist = latex(sys_symspidad)



%% set point gain maigin and phase margin
[pid_gainMargin,pid_phaseMargin] = margin(dataStep.Loop.pid)
[ipd_gainMargin,ipd_phaseMargin] =margin(dataStep.Loop.ipd)
[dpi_gainMargin,dpi_phaseMargin] =margin(dataStep.Loop.dpi)
[pida_gainMargin,pida_phaseMargin] =margin(dataStep.Loop.pida)



%% disturbance rejection  gain maigin and phase margin
[pid_dist_gainMargin,pid_dist_phaseMargin] = margin(dataDist.Loop.pid)
[pida_dist_gainMargin,pida_dist_phaseMargin] = margin(dataDist.Loop.pida)

end

