function [] = ms_print_excel(ms_dataStep,name,type)

    %pid con b=1 c=1 ingresso setpoint
    PID ={ms_dataStep.pid.IAE;ms_dataStep.pid.Kp;ms_dataStep.pid.Ti;ms_dataStep.pid.Td;ms_dataStep.pid.Ta;ms_dataStep.pid.b;ms_dataStep.pid.c;ms_dataStep.pid.N;ms_dataStep.pid.alfa;ms_dataStep.Sensitivity.pid;ms_dataStep.pid.Risetime;ms_dataStep.pid.settlingtime;ms_dataStep.pid.overshoot;ms_dataStep.pid.undershoot;ms_dataStep.pid.peak;ms_dataStep.pid.peaktime};
    
    %pid con b=0 c=1 ingresso setpoint
    IPD ={ms_dataStep.ipd.IAE;ms_dataStep.ipd.Kp;ms_dataStep.ipd.Ti;ms_dataStep.ipd.Td;ms_dataStep.ipd.Ta;ms_dataStep.ipd.b;ms_dataStep.ipd.c;ms_dataStep.ipd.N;ms_dataStep.ipd.alfa;ms_dataStep.Sensitivity.ipd;ms_dataStep.ipd.Risetime;ms_dataStep.ipd.settlingtime;ms_dataStep.ipd.overshoot;ms_dataStep.ipd.undershoot;ms_dataStep.ipd.peak;ms_dataStep.ipd.peaktime};
    
    %pid con b=1 c=0 ingresso setpoint
    DPI ={ms_dataStep.dpi.IAE;ms_dataStep.dpi.Kp;ms_dataStep.dpi.Ti;ms_dataStep.dpi.Td;ms_dataStep.dpi.Ta;ms_dataStep.dpi.b;ms_dataStep.dpi.c;ms_dataStep.dpi.N;ms_dataStep.dpi.alfa;ms_dataStep.Sensitivity.dpi;ms_dataStep.dpi.Risetime;ms_dataStep.dpi.settlingtime;ms_dataStep.dpi.overshoot;ms_dataStep.dpi.undershoot;ms_dataStep.dpi.peak;ms_dataStep.dpi.peaktime};
    
    %pida ingresso setpoint
    PIDA ={ms_dataStep.pida.IAE;ms_dataStep.pida.Kp;ms_dataStep.pida.Ti;ms_dataStep.pida.Td;ms_dataStep.pida.Ta;ms_dataStep.pida.b;ms_dataStep.pida.c;ms_dataStep.pida.N;ms_dataStep.pida.alfa;ms_dataStep.Sensitivity.pida;ms_dataStep.pida.Risetime;ms_dataStep.pida.settlingtime;ms_dataStep.pida.overshoot;ms_dataStep.pida.undershoot;ms_dataStep.pida.peak;ms_dataStep.pida.peaktime};

    %nomi dei  parametri dei pid/pida
    parametri = {'IAE';'Kp';'Ti';'Td';'Ta';'b';'c';'N';'alfa';'Sensitivity';'Risetime';'settlingtime';'overshoot %';'undershoot';'peak';'peaktime'};
    
    %generaazione dati in tabella completo     
    %Tab = table(parametri,PID,IPD,DPI,PIDA,PID_DIST,IPD_DIST,DPI_DIST,PIDA_DIST);
    Tab = table(parametri,PID,IPD,DPI,PIDA);
    
    %generazione nome del file da salvare in base al sistema in input
    filename_excel = strcat(name,string(type),'_ms','.xlsx');
    
    %scrittura file excel
    writetable(Tab,filename_excel);
    
    filename_mat = strcat(name,string(type),'_ms','.mat');
    save(filename_mat,'ms_dataStep');
    ms_Latex(ms_dataStep,name,type);
end

    
