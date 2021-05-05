function [] = ms_print_exceldist(ms_dataDist,name,type)
[pid_gainMargin,pid_phaseMargin] = margin(ms_dataDist.Loop.pid);
[pida_gainMargin,pida_phaseMargin] =margin(ms_dataDist.Loop.pida);


    %pid con b=1 c=1 ingresso disturbo
    PID_DIST ={ms_dataDist.pid_dist.IAE;ms_dataDist.pid_dist.Kp;ms_dataDist.pid_dist.Ti;ms_dataDist.pid_dist.Td;ms_dataDist.pid_dist.Ta;ms_dataDist.pid_dist.b;ms_dataDist.pid_dist.c;ms_dataDist.pid_dist.N;ms_dataDist.pid_dist.alfa;ms_dataDist.Sensitivity.pid;ms_dataDist.pid_dist.Risetime;ms_dataDist.pid_dist.settlingtime;ms_dataDist.pid_dist.overshoot;ms_dataDist.pid_dist.undershoot;ms_dataDist.pid_dist.peak;ms_dataDist.pid_dist.peaktime;pid_gainMargin;pid_phaseMargin};
    
    %pida ingresso disturbo
    PIDA_DIST ={ms_dataDist.pida_dist.IAE;ms_dataDist.pida_dist.Kp;ms_dataDist.pida_dist.Ti;ms_dataDist.pida_dist.Td;ms_dataDist.pida_dist.Ta;ms_dataDist.pida_dist.b;ms_dataDist.pida_dist.c;ms_dataDist.pida_dist.N;ms_dataDist.pida_dist.alfa;ms_dataDist.Sensitivity.pida;ms_dataDist.pida_dist.Risetime;ms_dataDist.pida_dist.settlingtime;ms_dataDist.pida_dist.overshoot;ms_dataDist.pida_dist.undershoot;ms_dataDist.pida_dist.peak;ms_dataDist.pida_dist.peaktime;pida_gainMargin;pida_phaseMargin};
    
    %nomi dei  parametri dei pid/pida
    parametri = {'IAE';'Kp';'Ti';'Td';'Ta';'b';'c';'N';'alfa';'Sensitivity';'Risetime';'settlingtime';'overshoot %';'undershoot';'peak';'peaktime';'Gain Margin' ;'Phase Margin'};
    
    %generaazione dati in tabella completo     
    %Tab = table(parametri,PID_DIST,IPD_DIST,DPI_DIST,PIDA_DIST);
    Tab = table(parametri,PID_DIST,PIDA_DIST);
    
    %generazione nome del file da salvare in base al sistema in input
    filename_excel = strcat(name,string(type),'_ms_dist','.xlsx');
    
    %scrittura file excel
    writetable(Tab,filename_excel);
    
    filename_mat = strcat(name,string(type),'_ms_dist','.mat');
    save(filename_mat,'ms_dataDist');
    
    ms_Latex_dist(ms_dataDist,name,type)
end

    
