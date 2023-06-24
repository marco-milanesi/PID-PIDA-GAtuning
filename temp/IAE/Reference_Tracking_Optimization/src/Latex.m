function [] = Latex(dataStep,name,type)
%% parametri
syms s ;

%% set point
%pid
SYSpid=dataStep.Controller.pid;
[num,den]=tfdata(SYSpid);
sys_syms = vpa(poly2sym(cell2mat(num),s)/poly2sym(cell2mat(den),s),4);
pid = strcat('$C(s) =', latex(sys_syms),'$');

%i-pd
SYSipd1=dataStep.Controller.ipd.K1;
SYSipd2=dataStep.Controller.ipd.K2;
[num1,den1]=tfdata(SYSipd1);
[num2,den2]=tfdata(SYSipd2);
sys_syms1 = vpa(poly2sym(cell2mat(num1),s)/poly2sym(cell2mat(den1),s),4);
sys_syms2 = vpa(poly2sym(cell2mat(num2),s)/poly2sym(cell2mat(den2),s),4);
c1_ipd = latex(sys_syms1);
c2_ipd = latex(sys_syms2);
ipd = strcat('$C_1(s) =',c1_ipd,'$','  $C_2(s) =',c2_ipd,'$');

%pi-d
sys_syms5=dataStep.Controller.dpi.K1;
SYSdpi2=dataStep.Controller.dpi.K2;
SYSdpi3=dataStep.Controller.dpi.K3;
[numd2,dend2]=tfdata(SYSdpi2);
[numd3,dend3]=tfdata(SYSdpi3);
sys_syms3 = vpa(poly2sym(cell2mat(numd2),s)/poly2sym(cell2mat(dend2),s),4);
sys_syms4 = vpa(poly2sym(cell2mat(numd3),s)/poly2sym(cell2mat(dend3),s),4);
c1_dpi = sys_syms5;
c2_dpi = latex(sys_syms3);
c3_dpi = latex(sys_syms4);
dpi = strcat('$C_1(s) =',string(c1_dpi),'$','  $C_2(s) =',c2_dpi,'$','  $C_3(s) =',c3_dpi,'$');

%pida
SYSpida=dataStep.Controller.pida;
[numpida,denpida]=tfdata(SYSpida);
sys_symspida = vpa(poly2sym(cell2mat(numpida),s)/poly2sym(cell2mat(denpida),s),4);
pida = strcat('$C(s) =', latex(sys_symspida),'$');

%% set point gain maigin and phase margin
[pid_gainMargin,pid_phaseMargin] = margin(dataStep.Loop.pid);
[ipd_gainMargin,ipd_phaseMargin] =margin(dataStep.Loop.ipd);
[dpi_gainMargin,dpi_phaseMargin] =margin(dataStep.Loop.dpi);
[pida_gainMargin,pida_phaseMargin] =margin(dataStep.Loop.pida);

%% generation table
    %pid con b=1 c=1 ingresso setpoint
    PID ={pid;dataStep.pid.IAE;dataStep.pid.Kp;dataStep.pid.Ti;dataStep.pid.Td;dataStep.pid.Ta;dataStep.pid.b;dataStep.pid.c;dataStep.pid.N;dataStep.pid.alfa;dataStep.Sensitivity.pid;dataStep.pid.Risetime;dataStep.pid.settlingtime;dataStep.pid.overshoot;dataStep.pid.undershoot;dataStep.pid.peak;dataStep.pid.peaktime;pid_gainMargin;pid_phaseMargin};
    
    %pid con b=0 c=1 ingresso setpoint
    IPD ={ipd;dataStep.ipd.IAE;dataStep.ipd.Kp;dataStep.ipd.Ti;dataStep.ipd.Td;dataStep.ipd.Ta;dataStep.ipd.b;dataStep.ipd.c;dataStep.ipd.N;dataStep.ipd.alfa;dataStep.Sensitivity.ipd;dataStep.ipd.Risetime;dataStep.ipd.settlingtime;dataStep.ipd.overshoot;dataStep.ipd.undershoot;dataStep.ipd.peak;dataStep.ipd.peaktime;ipd_gainMargin;ipd_phaseMargin};
    
    %pid con b=1 c=0 ingresso setpoint
    DPI ={dpi;dataStep.dpi.IAE;dataStep.dpi.Kp;dataStep.dpi.Ti;dataStep.dpi.Td;dataStep.dpi.Ta;dataStep.dpi.b;dataStep.dpi.c;dataStep.dpi.N;dataStep.dpi.alfa;dataStep.Sensitivity.dpi;dataStep.dpi.Risetime;dataStep.dpi.settlingtime;dataStep.dpi.overshoot;dataStep.dpi.undershoot;dataStep.dpi.peak;dataStep.dpi.peaktime;dpi_gainMargin;dpi_phaseMargin};
    
    %pida ingresso setpoint
    PIDA ={pida;dataStep.pida.IAE;dataStep.pida.Kp;dataStep.pida.Ti;dataStep.pida.Td;dataStep.pida.Ta;dataStep.pida.b;dataStep.pida.c;dataStep.pida.N;dataStep.pida.alfa;dataStep.Sensitivity.pida;dataStep.pida.Risetime;dataStep.pida.settlingtime;dataStep.pida.overshoot;dataStep.pida.undershoot;dataStep.pida.peak;dataStep.pida.peaktime;pida_gainMargin;pida_phaseMargin};

    %nomi dei  parametri dei pid/pida
    parametri = {'Controller Transfer Function';'IAE';'$K_p$';'$T_i$';'$T_d$';'$T_a$';'b';'c';'$N$';'$\alpha$';'Sensitivity';'Risetime';'settlingtime';'overshoot %';'undershoot';'peak';'peaktime';'Gain Margin' ;'Phase Margin'};
    
    %generaazione dati in tabella completo     
    Tab = table(parametri,PID,IPD,DPI,PIDA);
    
    %generazione nome del file da salvare in base al sistema in input
    filename_excel = strcat(name,string(type),'_latex.xlsx');
    
    %scrittura file excel
    writetable(Tab,filename_excel);
    
end

