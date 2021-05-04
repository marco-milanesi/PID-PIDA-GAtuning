function [] = Latex_dist(dataDist,name,type)
%% parametri
syms s ;

%% set point
%pid
SYSpid=dataDist.Controller.pid;
[num,den]=tfdata(SYSpid);
sys_syms = vpa(poly2sym(cell2mat(num),s)/poly2sym(cell2mat(den),s),4);
pid = strcat('$C(s) =', latex(sys_syms),'$');

%pida
SYSpida=dataDist.Controller.pida;
[numpida,denpida]=tfdata(SYSpida);
sys_symspida = vpa(poly2sym(cell2mat(numpida),s)/poly2sym(cell2mat(denpida),s),4);
pida = strcat('$C(s) =', latex(sys_symspida),'$');

%% set point gain maigin and phase margin
[pid_gainMargin,pid_phaseMargin] = margin(dataDist.Loop.pid);
[pida_gainMargin,pida_phaseMargin] =margin(dataDist.Loop.pida);

%% generation table
    %pid ingresso disturbo
    PID_DIST ={pid;dataDist.pid_dist.IAE;dataDist.pid_dist.Kp;dataDist.pid_dist.Ti;dataDist.pid_dist.Td;dataDist.pid_dist.Ta;dataDist.pid_dist.b;dataDist.pid_dist.c;dataDist.pid_dist.N;dataDist.pid_dist.alfa;dataDist.Sensitivity.pid;dataDist.pid_dist.Risetime;dataDist.pid_dist.settlingtime;dataDist.pid_dist.overshoot;dataDist.pid_dist.undershoot;dataDist.pid_dist.peak;dataDist.pid_dist.peaktime;pid_gainMargin;pid_phaseMargin};
    
    %pida ingresso disturbo
    PIDA_DIST ={pida;dataDist.pida_dist.IAE;dataDist.pida_dist.Kp;dataDist.pida_dist.Ti;dataDist.pida_dist.Td;dataDist.pida_dist.Ta;dataDist.pida_dist.b;dataDist.pida_dist.c;dataDist.pida_dist.N;dataDist.pida_dist.alfa;dataDist.Sensitivity.pida;dataDist.pida_dist.Risetime;dataDist.pida_dist.settlingtime;dataDist.pida_dist.overshoot;dataDist.pida_dist.undershoot;dataDist.pida_dist.peak;dataDist.pida_dist.peaktime;pida_gainMargin;pida_phaseMargin};
    
    %nomi dei  parametri dei pid/pida
    parametri = {'Controller Transfer Function';'IAE';'$K_p$';'$T_i$';'$T_d$';'$T_a$';'b';'c';'$N$';'$\alpha$';'Sensitivity';'Risetime';'settlingtime';'overshoot %';'undershoot';'peak';'peaktime';'Gain Margin' ;'Phase Margin'};
    
    %generaazione dati in tabella completo     
    Tab = table(parametri,PID_DIST,PIDA_DIST);
    
    %generazione nome del file da salvare in base al sistema in input
    filename_excel = strcat(name,string(type),'_dist_latex.xlsx');
    
    %scrittura file excel
    writetable(Tab,filename_excel);
    
end

