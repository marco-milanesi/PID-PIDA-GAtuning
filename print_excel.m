function [] = print_excel(data,name)

    %pid con b=1 c=1 ingresso setpoint
    PID ={data.pid.IAE;data.pid.Kp;data.pid.Ti;data.pid.Td;data.pid.Ta;data.pid.b;data.pid.c;data.pid.N;data.pid.alfa;data.pid.Risetime;data.pid.settlingtime;data.pid.overshoot;data.pid.undershoot;data.pid.peak;data.pid.peaktime};
    
    %pid con b=0 c=1 ingresso setpoint
    IPD ={data.ipd.IAE;data.ipd.Kp;data.ipd.Ti;data.ipd.Td;data.ipd.Ta;data.ipd.b;data.ipd.c;data.ipd.N;data.ipd.alfa;data.ipd.Risetime;data.ipd.settlingtime;data.ipd.overshoot;data.ipd.undershoot;data.ipd.peak;data.ipd.peaktime};
    
    %pid con b=1 c=0 ingresso setpoint
    DPI ={data.dpi.IAE;data.dpi.Kp;data.dpi.Ti;data.dpi.Td;data.dpi.Ta;data.dpi.b;data.dpi.c;data.dpi.N;data.dpi.alfa;data.dpi.Risetime;data.dpi.settlingtime;data.dpi.overshoot;data.dpi.undershoot;data.dpi.peak;data.dpi.peaktime};
    
    %pida ingresso setpoint
    PIDA ={data.pida.IAE;data.pida.Kp;data.pida.Ti;data.pida.Td;data.pida.Ta;data.pida.b;data.pida.c;data.pida.N;data.pida.alfa;data.pida.Risetime;data.pida.settlingtime;data.pida.overshoot;data.pida.undershoot;data.pida.peak;data.pida.peaktime};
    
    %nomi dei  parametri dei pid/pida
    parametri = {'IAE';'Kp';'Ti';'Td';'Ta';'b';'c';'N';'alfa';'Risetime';'settlingtime';'overshoot %';'undershoot';'peak';'peaktime'};
    
    %generaazione dati in tabella
    Tab = table(parametri,PID,IPD,DPI,PIDA);
    
    %generazione nome del file da salvare in base al sistema in input
    filename = strcat(name,'.xlsx');
    
    %scrittura file excel
    writetable(Tab,filename);
end

    
