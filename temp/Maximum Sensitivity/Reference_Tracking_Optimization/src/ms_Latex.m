function [] = ms_Latex(ms_dataStep,name,type)
%% parametri
syms s ;

%% set point
%pid
SYSpid=ms_dataStep.Controller.pid;
[num,den]=tfdata(SYSpid);
sys_syms = vpa(poly2sym(cell2mat(num),s)/poly2sym(cell2mat(den),s),4);
pid = strcat('$C(s) =', latex(sys_syms),'$');

%i-pd
SYSipd1=ms_dataStep.Controller.ipd.K1;
SYSipd2=ms_dataStep.Controller.ipd.K2;
[num1,den1]=tfdata(SYSipd1);
[num2,den2]=tfdata(SYSipd2);
sys_syms1 = vpa(poly2sym(cell2mat(num1),s)/poly2sym(cell2mat(den1),s),4);
sys_syms2 = vpa(poly2sym(cell2mat(num2),s)/poly2sym(cell2mat(den2),s),4);
c1_ipd = latex(sys_syms1);
c2_ipd = latex(sys_syms2);
ipd = strcat('$C_1(s) =',c1_ipd,'$','  $C_2(s) =',c2_ipd,'$');

%pi-d
sys_syms5=ms_dataStep.Controller.dpi.K1;
SYSdpi2=ms_dataStep.Controller.dpi.K2;
SYSdpi3=ms_dataStep.Controller.dpi.K3;
[numd2,dend2]=tfdata(SYSdpi2);
[numd3,dend3]=tfdata(SYSdpi3);
sys_syms3 = vpa(poly2sym(cell2mat(numd2),s)/poly2sym(cell2mat(dend2),s),4);
sys_syms4 = vpa(poly2sym(cell2mat(numd3),s)/poly2sym(cell2mat(dend3),s),4);
c1_dpi = sys_syms5;
c2_dpi = latex(sys_syms3);
c3_dpi = latex(sys_syms4);
dpi = strcat('$C_1(s) =',string(c1_dpi),'$','  $C_2(s) =',c2_dpi,'$','  $C_3(s) =',c3_dpi,'$');

%pida
SYSpida=ms_dataStep.Controller.pida;
[numpida,denpida]=tfdata(SYSpida);
sys_symspida = vpa(poly2sym(cell2mat(numpida),s)/poly2sym(cell2mat(denpida),s),4);
pida = strcat('$C(s) =', latex(sys_symspida),'$');

%% set point gain maigin and phase margin
[pid_gainMargin,pid_phaseMargin] = margin(ms_dataStep.Loop.pid);
[ipd_gainMargin,ipd_phaseMargin] =margin(ms_dataStep.Loop.ipd);
[dpi_gainMargin,dpi_phaseMargin] =margin(ms_dataStep.Loop.dpi);
[pida_gainMargin,pida_phaseMargin] =margin(ms_dataStep.Loop.pida);

%% generation table
    %pid con b=1 c=1 ingresso setpoint
    PID ={pid;ms_dataStep.pid.IAE;ms_dataStep.pid.Kp;ms_dataStep.pid.Ti;ms_dataStep.pid.Td;ms_dataStep.pid.Ta;ms_dataStep.pid.b;ms_dataStep.pid.c;ms_dataStep.pid.N;ms_dataStep.pid.alfa;ms_dataStep.Sensitivity.pid;ms_dataStep.pid.Risetime;ms_dataStep.pid.settlingtime;ms_dataStep.pid.overshoot;ms_dataStep.pid.undershoot;ms_dataStep.pid.peak;ms_dataStep.pid.peaktime;pid_gainMargin;pid_phaseMargin};
    
    %pid con b=0 c=1 ingresso setpoint
    IPD ={ipd;ms_dataStep.ipd.IAE;ms_dataStep.ipd.Kp;ms_dataStep.ipd.Ti;ms_dataStep.ipd.Td;ms_dataStep.ipd.Ta;ms_dataStep.ipd.b;ms_dataStep.ipd.c;ms_dataStep.ipd.N;ms_dataStep.ipd.alfa;ms_dataStep.Sensitivity.ipd;ms_dataStep.ipd.Risetime;ms_dataStep.ipd.settlingtime;ms_dataStep.ipd.overshoot;ms_dataStep.ipd.undershoot;ms_dataStep.ipd.peak;ms_dataStep.ipd.peaktime;ipd_gainMargin;ipd_phaseMargin};
    
    %pid con b=1 c=0 ingresso setpoint
    DPI ={dpi;ms_dataStep.dpi.IAE;ms_dataStep.dpi.Kp;ms_dataStep.dpi.Ti;ms_dataStep.dpi.Td;ms_dataStep.dpi.Ta;ms_dataStep.dpi.b;ms_dataStep.dpi.c;ms_dataStep.dpi.N;ms_dataStep.dpi.alfa;ms_dataStep.Sensitivity.dpi;ms_dataStep.dpi.Risetime;ms_dataStep.dpi.settlingtime;ms_dataStep.dpi.overshoot;ms_dataStep.dpi.undershoot;ms_dataStep.dpi.peak;ms_dataStep.dpi.peaktime;dpi_gainMargin;dpi_phaseMargin};
    
    %pida ingresso setpoint
    PIDA ={pida;ms_dataStep.pida.IAE;ms_dataStep.pida.Kp;ms_dataStep.pida.Ti;ms_dataStep.pida.Td;ms_dataStep.pida.Ta;ms_dataStep.pida.b;ms_dataStep.pida.c;ms_dataStep.pida.N;ms_dataStep.pida.alfa;ms_dataStep.Sensitivity.pida;ms_dataStep.pida.Risetime;ms_dataStep.pida.settlingtime;ms_dataStep.pida.overshoot;ms_dataStep.pida.undershoot;ms_dataStep.pida.peak;ms_dataStep.pida.peaktime;pida_gainMargin;pida_phaseMargin};

    %nomi dei  parametri dei pid/pida
    parametri = {'Controller Transfer Function';'IAE';'$K_p$';'$T_i$';'$T_d$';'$T_a$';'b';'c';'$N$';'$\alpha$';'Sensitivity';'Risetime';'settlingtime';'overshoot %';'undershoot';'peak';'peaktime';'Gain Margin' ;'Phase Margin'};
    
    %generaazione dati in tabella completo     
    Tab = table(parametri,PID,IPD,DPI,PIDA);
    
    %generazione nome del file da salvare in base al sistema in input
    filename_excel = strcat(name,string(type),'_ms2_latex.xlsx');
    
    %scrittura file excel
    writetable(Tab,filename_excel);
end

