function [] = ms_Latex_dist(ms_dataDist,name,type)
%% parametri
syms s ;

%% set point
%pid
SYSpid=ms_dataDist.Controller.pid;
[num,den]=tfdata(SYSpid);
sys_syms = vpa(poly2sym(cell2mat(num),s)/poly2sym(cell2mat(den),s),4);
pid = strcat('$C(s) =', latex(sys_syms),'$');

%pida
SYSpida=ms_dataDist.Controller.pida;
[numpida,denpida]=tfdata(SYSpida);
sys_symspida = vpa(poly2sym(cell2mat(numpida),s)/poly2sym(cell2mat(denpida),s),4);
pida = strcat('$C(s) =', latex(sys_symspida),'$');

%% set point gain maigin and phase margin
[pid_gainMargin,pid_phaseMargin] = margin(ms_dataDist.Loop.pid);
[pida_gainMargin,pida_phaseMargin] =margin(ms_dataDist.Loop.pida);

%% generation table
    %pid ingresso disturbo
    PID_DIST ={pid;ms_dataDist.pid_dist.IAE;ms_dataDist.pid_dist.Kp;ms_dataDist.pid_dist.Ti;ms_dataDist.pid_dist.Td;ms_dataDist.pid_dist.Ta;ms_dataDist.pid_dist.b;ms_dataDist.pid_dist.c;ms_dataDist.pid_dist.N;ms_dataDist.pid_dist.alfa;ms_dataDist.Sensitivity.pid;ms_dataDist.pid_dist.Risetime;ms_dataDist.pid_dist.settlingtime;ms_dataDist.pid_dist.overshoot;ms_dataDist.pid_dist.undershoot;ms_dataDist.pid_dist.peak;ms_dataDist.pid_dist.peaktime;pid_gainMargin;pid_phaseMargin};
    
    %pida ingresso disturbo
    PIDA_DIST ={pida;ms_dataDist.pida_dist.IAE;ms_dataDist.pida_dist.Kp;ms_dataDist.pida_dist.Ti;ms_dataDist.pida_dist.Td;ms_dataDist.pida_dist.Ta;ms_dataDist.pida_dist.b;ms_dataDist.pida_dist.c;ms_dataDist.pida_dist.N;ms_dataDist.pida_dist.alfa;ms_dataDist.Sensitivity.pida;ms_dataDist.pida_dist.Risetime;ms_dataDist.pida_dist.settlingtime;ms_dataDist.pida_dist.overshoot;ms_dataDist.pida_dist.undershoot;ms_dataDist.pida_dist.peak;ms_dataDist.pida_dist.peaktime;pida_gainMargin;pida_phaseMargin};
    
    %nomi dei  parametri dei pid/pida
    parametri = {'Controller Transfer Function';'IAE';'$K_p$';'$T_i$';'$T_d$';'$T_a$';'b';'c';'$N$';'$\alpha$';'Sensitivity';'Risetime';'settlingtime';'overshoot %';'undershoot';'peak';'peaktime';'Gain Margin' ;'Phase Margin'};
    
    %generaazione dati in tabella completo     
    Tab = table(parametri,PID_DIST,PIDA_DIST);
    
    %generazione nome del file da salvare in base al sistema in input
    filename_excel = strcat(name,string(type),'_ms14_dist_latex.xlsx');
    
    %scrittura file excel
    writetable(Tab,filename_excel);
    
end

