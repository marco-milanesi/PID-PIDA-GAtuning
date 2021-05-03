function [] = print_exceldist(dataDist,name,type)
    %pid con b=1 c=1 ingresso disturbo
    PID_DIST ={dataDist.pid_dist.IAE;dataDist.pid_dist.Kp;dataDist.pid_dist.Ti;dataDist.pid_dist.Td;dataDist.pid_dist.Ta;dataDist.pid_dist.b;dataDist.pid_dist.c;dataDist.pid_dist.N;dataDist.pid_dist.alfa;dataDist.pid_dist.Risetime;dataDist.pid_dist.settlingtime;dataDist.pid_dist.overshoot;dataDist.pid_dist.undershoot;dataDist.pid_dist.peak;dataDist.pid_dist.peaktime};
    
    %pid con b=0 c=1 ingresso disturbo
    %IPD_DIST ={dataDist.ipd_dist.IAE;dataDist.ipd_dist.Kp;dataDist.ipd_dist.Ti;dataDist.ipd_dist.Td;dataDist.ipd_dist.Ta;dataDist.ipd_dist.b;dataDist.ipd_dist.c;dataDist.ipd_dist.N;dataDist.ipd_dist.alfa;dataDist.ipd_dist.Risetime;dataDist.ipd_dist.settlingtime;dataDist.ipd_dist.overshoot;dataDist.ipd_dist.undershoot;dataDist.ipd_dist.peak;dataDist.ipd_dist.peaktime};
    
    %pid con b=1 c=0 ingresso disturbo
    %DPI_DIST ={dataDist.dpi_dist.IAE;dataDist.dpi_dist.Kp;dataDist.dpi_dist.Ti;dataDist.dpi_dist.Td;dataDist.dpi_dist.Ta;dataDist.dpi_dist.b;dataDist.dpi_dist.c;dataDist.dpi_dist.N;dataDist.dpi_dist.alfa;dataDist.dpi_dist.Risetime;dataDist.dpi_dist.settlingtime;dataDist.dpi_dist.overshoot;dataDist.dpi_dist.undershoot;dataDist.dpi_dist.peak;dataDist.dpi_dist.peaktime};
    
    %pida ingresso disturbo
    PIDA_DIST ={dataDist.pida_dist.IAE;dataDist.pida_dist.Kp;dataDist.pida_dist.Ti;dataDist.pida_dist.Td;dataDist.pida_dist.Ta;dataDist.pida_dist.b;dataDist.pida_dist.c;dataDist.pida_dist.N;dataDist.pida_dist.alfa;dataDist.pida_dist.Risetime;dataDist.pida_dist.settlingtime;dataDist.pida_dist.overshoot;dataDist.pida_dist.undershoot;dataDist.pida_dist.peak;dataDist.pida_dist.peaktime};
    
    %nomi dei  parametri dei pid/pida
    parametri = {'IAE';'Kp';'Ti';'Td';'Ta';'b';'c';'N';'alfa';'Risetime';'settlingtime';'overshoot %';'undershoot';'peak';'peaktime'};
    
    %generaazione dati in tabella completo     
    %Tab = table(parametri,PID_DIST,IPD_DIST,DPI_DIST,PIDA_DIST);
    Tab = table(parametri,PID_DIST,PIDA_DIST);
    
    %generazione nome del file da salvare in base al sistema in input
    filename_excel = strcat(name,string(type),'_dist','.xlsx');
    
    %scrittura file excel
    writetable(Tab,filename_excel);
    
    filename_mat = strcat(name,string(type),'_dist','.mat');
    save(filename_mat,'dataDist');
end

    
