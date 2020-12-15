function [] = print_excel(data,name,type)

    %pid con b=1 c=1 ingresso setpoint
    PID ={data.pid.IAE;data.pid.Kp;data.pid.Ti;data.pid.Td;data.pid.Ta;data.pid.b;data.pid.c;data.pid.N;data.pid.alfa;data.pid.Risetime;data.pid.settlingtime;data.pid.overshoot;data.pid.undershoot;data.pid.peak;data.pid.peaktime};
    
    %pid con b=0 c=1 ingresso setpoint
    IPD ={data.ipd.IAE;data.ipd.Kp;data.ipd.Ti;data.ipd.Td;data.ipd.Ta;data.ipd.b;data.ipd.c;data.ipd.N;data.ipd.alfa;data.ipd.Risetime;data.ipd.settlingtime;data.ipd.overshoot;data.ipd.undershoot;data.ipd.peak;data.ipd.peaktime};
    
    %pid con b=1 c=0 ingresso setpoint
    DPI ={data.dpi.IAE;data.dpi.Kp;data.dpi.Ti;data.dpi.Td;data.dpi.Ta;data.dpi.b;data.dpi.c;data.dpi.N;data.dpi.alfa;data.dpi.Risetime;data.dpi.settlingtime;data.dpi.overshoot;data.dpi.undershoot;data.dpi.peak;data.dpi.peaktime};
    
    %pida ingresso setpoint
    PIDA ={data.pida.IAE;data.pida.Kp;data.pida.Ti;data.pida.Td;data.pida.Ta;data.pida.b;data.pida.c;data.pida.N;data.pida.alfa;data.pida.Risetime;data.pida.settlingtime;data.pida.overshoot;data.pida.undershoot;data.pida.peak;data.pida.peaktime};

    %pid con b=1 c=1 ingresso disturbo
    PID_DIST ={data.pid_dist.IAE;data.pid_dist.Kp;data.pid_dist.Ti;data.pid_dist.Td;data.pid_dist.Ta;data.pid_dist.b;data.pid_dist.c;data.pid_dist.N;data.pid_dist.alfa;data.pid_dist.Risetime;data.pid_dist.settlingtime;data.pid_dist.overshoot;data.pid_dist.undershoot;data.pid_dist.peak;data.pid_dist.peaktime};
    
    %pid con b=0 c=1 ingresso disturbo
    IPD_DIST ={data.ipd_dist.IAE;data.ipd_dist.Kp;data.ipd_dist.Ti;data.ipd_dist.Td;data.ipd_dist.Ta;data.ipd_dist.b;data.ipd_dist.c;data.ipd_dist.N;data.ipd_dist.alfa;data.ipd_dist.Risetime;data.ipd_dist.settlingtime;data.ipd_dist.overshoot;data.ipd_dist.undershoot;data.ipd_dist.peak;data.ipd_dist.peaktime};
    
    %pid con b=1 c=0 ingresso disturbo
    DPI_DIST ={data.dpi_dist.IAE;data.dpi_dist.Kp;data.dpi_dist.Ti;data.dpi_dist.Td;data.dpi_dist.Ta;data.dpi_dist.b;data.dpi_dist.c;data.dpi_dist.N;data.dpi_dist.alfa;data.dpi_dist.Risetime;data.dpi_dist.settlingtime;data.dpi_dist.overshoot;data.dpi_dist.undershoot;data.dpi_dist.peak;data.dpi_dist.peaktime};
    
    %pida ingresso disturbo
    PIDA_DIST ={data.pida_dist.IAE;data.pida_dist.Kp;data.pida_dist.Ti;data.pida_dist.Td;data.pida_dist.Ta;data.pida_dist.b;data.pida_dist.c;data.pida_dist.N;data.pida_dist.alfa;data.pida_dist.Risetime;data.pida_dist.settlingtime;data.pida_dist.overshoot;data.pida_dist.undershoot;data.pida_dist.peak;data.pida_dist.peaktime};
    
    %nomi dei  parametri dei pid/pida
    parametri = {'IAE';'Kp';'Ti';'Td';'Ta';'b';'c';'N';'alfa';'Risetime';'settlingtime';'overshoot %';'undershoot';'peak';'peaktime'};
    
    %generaazione dati in tabella completo
    Tab = table(parametri,PID,IPD,DPI,PIDA,PID_DIST,IPD_DIST,DPI_DIST,PIDA_DIST);
    
    %generazione nome del file da salvare in base al sistema in input
    filename_excel = strcat(name,string(type),'.xlsx');
    
    %scrittura file excel
    writetable(Tab,filename_excel);
    
    filename_mat = strcat(name,string(type),'.mat');
    save(filename_mat,'data');
end

    
