function [] = print_excel(dataStep,name,type)
    [pid_gainMargin,pid_phaseMargin] = margin(dataStep.Loop.pid);
    [ipd_gainMargin,ipd_phaseMargin] =margin(dataStep.Loop.ipd);
    [dpi_gainMargin,dpi_phaseMargin] =margin(dataStep.Loop.dpi);
    [pida_gainMargin,pida_phaseMargin] =margin(dataStep.Loop.pida);

    %pid con b=1 c=1 ingresso setpoint
    PID ={dataStep.pid.IAE;dataStep.pid.Kp;dataStep.pid.Ti;dataStep.pid.Td;dataStep.pid.Ta;dataStep.pid.b;dataStep.pid.c;dataStep.pid.N;dataStep.pid.alfa;dataStep.Sensitivity.pid;dataStep.pid.Risetime;dataStep.pid.settlingtime;dataStep.pid.overshoot;dataStep.pid.undershoot;dataStep.pid.peak;dataStep.pid.peaktime;pid_gainMargin;pid_phaseMargin};
    
    %pid con b=0 c=1 ingresso setpoint
    IPD ={dataStep.ipd.IAE;dataStep.ipd.Kp;dataStep.ipd.Ti;dataStep.ipd.Td;dataStep.ipd.Ta;dataStep.ipd.b;dataStep.ipd.c;dataStep.ipd.N;dataStep.ipd.alfa;dataStep.Sensitivity.ipd;dataStep.ipd.Risetime;dataStep.ipd.settlingtime;dataStep.ipd.overshoot;dataStep.ipd.undershoot;dataStep.ipd.peak;dataStep.ipd.peaktime;ipd_gainMargin;ipd_phaseMargin};
    
    %pid con b=1 c=0 ingresso setpoint
    DPI ={dataStep.dpi.IAE;dataStep.dpi.Kp;dataStep.dpi.Ti;dataStep.dpi.Td;dataStep.dpi.Ta;dataStep.dpi.b;dataStep.dpi.c;dataStep.dpi.N;dataStep.dpi.alfa;dataStep.Sensitivity.dpi;dataStep.dpi.Risetime;dataStep.dpi.settlingtime;dataStep.dpi.overshoot;dataStep.dpi.undershoot;dataStep.dpi.peak;dataStep.dpi.peaktime;dpi_gainMargin;dpi_phaseMargin};
    
    %pida ingresso setpoint
    PIDA ={dataStep.pida.IAE;dataStep.pida.Kp;dataStep.pida.Ti;dataStep.pida.Td;dataStep.pida.Ta;dataStep.pida.b;dataStep.pida.c;dataStep.pida.N;dataStep.pida.alfa;dataStep.Sensitivity.pida;dataStep.pida.Risetime;dataStep.pida.settlingtime;dataStep.pida.overshoot;dataStep.pida.undershoot;dataStep.pida.peak;dataStep.pida.peaktime;pida_gainMargin;pida_phaseMargin};

    %nomi dei  parametri dei pid/pida
    parametri = {'IAE';'Kp';'Ti';'Td';'Ta';'b';'c';'N';'alfa';'Sensitivity';'Risetime';'settlingtime';'overshoot %';'undershoot';'peak';'peaktime';'Gain Margin' ;'Phase Margin'};
    
    %generaazione dati in tabella completo     
    Tab = table(parametri,PID,IPD,DPI,PIDA);
    
    %generazione nome del file da salvare in base al sistema in input
    filename_excel = strcat(name,string(type),'.xlsx');
    
    %scrittura file excel
    writetable(Tab,filename_excel);
    
    filename_mat = strcat(name,string(type),'.mat');
    save(filename_mat,'dataStep');
    
    Latex(dataStep,name,type);
end

    
