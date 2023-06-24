function [] = ms_print_excel(ms_dataStep, Controller, Ms, task_selected)

parameters = {'IAE';'Kp';'Ti';'Td';'Ta';'b';'c';'N';'alfa';'Sensitivity';'Risetime';'settlingtime';'overshoot %';'undershoot';'peak';'peaktime';'Gain Margin' ;'Phase Margin'};

switch Controller
    case 1
        switch task_selected
            case 1
                [pid_gainMargin,pid_phaseMargin] = margin(ms_dataStep.Loop.pid);
                %pid con b=1 c=1 ingresso setpoint
                PID ={ms_dataStep.pid.IAE;ms_dataStep.pid.Kp;ms_dataStep.pid.Ti;ms_dataStep.pid.Td;ms_dataStep.pid.Ta;ms_dataStep.pid.b;ms_dataStep.pid.c;ms_dataStep.pid.N;ms_dataStep.pid.alfa;ms_dataStep.Sensitivity.pid;ms_dataStep.pid.Risetime;ms_dataStep.pid.settlingtime;ms_dataStep.pid.overshoot;ms_dataStep.pid.undershoot;ms_dataStep.pid.peak;ms_dataStep.pid.peaktime;pid_gainMargin;pid_phaseMargin};
                Tab = table(parameters,PID);
            case 2
                [pid_gainMargin,pid_phaseMargin] = margin(ms_dataStep.Loop.pid);
                %pid con b=1 c=1 ingresso disturbo
                PID_DIST ={ms_dataStep.pid_dist.IAE;ms_dataStep.pid_dist.Kp;ms_dataStep.pid_dist.Ti;ms_dataStep.pid_dist.Td;ms_dataStep.pid_dist.Ta;ms_dataStep.pid_dist.b;ms_dataStep.pid_dist.c;ms_dataStep.pid_dist.N;ms_dataStep.pid_dist.alfa;ms_dataStep.Sensitivity.pid;ms_dataStep.pid_dist.Risetime;ms_dataStep.pid_dist.settlingtime;ms_dataStep.pid_dist.overshoot;ms_dataStep.pid_dist.undershoot;ms_dataStep.pid_dist.peak;ms_dataStep.pid_dist.peaktime;pid_gainMargin;pid_phaseMargin};
                Tab = table(parameters,PID_DIST);
        end
    case 2
        switch task_selected
            case 1
                [ipd_gainMargin,ipd_phaseMargin] =margin(ms_dataStep.Loop.ipd);
                % pid con b=0 c=1 ingresso setpoint
                IPD ={ms_dataStep.ipd.IAE;ms_dataStep.ipd.Kp;ms_dataStep.ipd.Ti;ms_dataStep.ipd.Td;ms_dataStep.ipd.Ta;ms_dataStep.ipd.b;ms_dataStep.ipd.c;ms_dataStep.ipd.N;ms_dataStep.ipd.alfa;ms_dataStep.Sensitivity.ipd;ms_dataStep.ipd.Risetime;ms_dataStep.ipd.settlingtime;ms_dataStep.ipd.overshoot;ms_dataStep.ipd.undershoot;ms_dataStep.ipd.peak;ms_dataStep.ipd.peaktime;ipd_gainMargin;ipd_phaseMargin};
                Tab = table(parameters,IPD);
            case 2
                [pid_gainMargin,pid_phaseMargin] = margin(ms_dataStep.Loop.pid);
                %pid con b=1 c=1 ingresso disturbo
                PID_DIST ={ms_dataStep.pid_dist.IAE;ms_dataStep.pid_dist.Kp;ms_dataStep.pid_dist.Ti;ms_dataStep.pid_dist.Td;ms_dataStep.pid_dist.Ta;ms_dataStep.pid_dist.b;ms_dataStep.pid_dist.c;ms_dataStep.pid_dist.N;ms_dataStep.pid_dist.alfa;ms_dataStep.Sensitivity.pid;ms_dataStep.pid_dist.Risetime;ms_dataStep.pid_dist.settlingtime;ms_dataStep.pid_dist.overshoot;ms_dataStep.pid_dist.undershoot;ms_dataStep.pid_dist.peak;ms_dataStep.pid_dist.peaktime;pid_gainMargin;pid_phaseMargin};
                Tab = table(parameters,PID_DIST);
        end
    case 3
        switch task_selected
            case 1
                [dpi_gainMargin,dpi_phaseMargin] =margin(ms_dataStep.Loop.dpi);
                %pid con b=1 c=0 ingresso setpoint
                PI_D ={ms_dataStep.dpi.IAE;ms_dataStep.dpi.Kp;ms_dataStep.dpi.Ti;ms_dataStep.dpi.Td;ms_dataStep.dpi.Ta;ms_dataStep.dpi.b;ms_dataStep.dpi.c;ms_dataStep.dpi.N;ms_dataStep.dpi.alfa;ms_dataStep.Sensitivity.dpi;ms_dataStep.dpi.Risetime;ms_dataStep.dpi.settlingtime;ms_dataStep.dpi.overshoot;ms_dataStep.dpi.undershoot;ms_dataStep.dpi.peak;ms_dataStep.dpi.peaktime;dpi_gainMargin;dpi_phaseMargin};
                Tab = table(parameters,PI_D);
            case 2
                [pid_gainMargin,pid_phaseMargin] = margin(ms_dataStep.Loop.pid);
                %pid con b=1 c=1 ingresso disturbo
                PID_DIST ={ms_dataStep.pid_dist.IAE;ms_dataStep.pid_dist.Kp;ms_dataStep.pid_dist.Ti;ms_dataStep.pid_dist.Td;ms_dataStep.pid_dist.Ta;ms_dataStep.pid_dist.b;ms_dataStep.pid_dist.c;ms_dataStep.pid_dist.N;ms_dataStep.pid_dist.alfa;ms_dataStep.Sensitivity.pid;ms_dataStep.pid_dist.Risetime;ms_dataStep.pid_dist.settlingtime;ms_dataStep.pid_dist.overshoot;ms_dataStep.pid_dist.undershoot;ms_dataStep.pid_dist.peak;ms_dataStep.pid_dist.peaktime;pid_gainMargin;pid_phaseMargin};
                Tab = table(parameters,PID_DIST);
        end
    case 4
        switch task_selected
            case 1
                [pida_gainMargin,pida_phaseMargin] =margin(ms_dataStep.Loop.pida);
                %pida ingresso setpoint
                PIDA ={ms_dataStep.pida.IAE;ms_dataStep.pida.Kp;ms_dataStep.pida.Ti;ms_dataStep.pida.Td;ms_dataStep.pida.Ta;ms_dataStep.pida.b;ms_dataStep.pida.c;ms_dataStep.pida.N;ms_dataStep.pida.alfa;ms_dataStep.Sensitivity.pida;ms_dataStep.pida.Risetime;ms_dataStep.pida.settlingtime;ms_dataStep.pida.overshoot;ms_dataStep.pida.undershoot;ms_dataStep.pida.peak;ms_dataStep.pida.peaktime;pida_gainMargin;pida_phaseMargin};
                Tab = table(parameters,PIDA);
            case 2
                [pida_gainMargin,pida_phaseMargin] =margin(ms_dataStep.Loop.pida);
                PIDA_DIST ={ms_dataStep.pida_dist.IAE;ms_dataStep.pida_dist.Kp;ms_dataStep.pida_dist.Ti;ms_dataStep.pida_dist.Td;ms_dataStep.pida_dist.Ta;ms_dataStep.pida_dist.b;ms_dataStep.pida_dist.c;ms_dataStep.pida_dist.N;ms_dataStep.pida_dist.alfa;ms_dataStep.Sensitivity.pida;ms_dataStep.pida_dist.Risetime;ms_dataStep.pida_dist.settlingtime;ms_dataStep.pida_dist.overshoot;ms_dataStep.pida_dist.undershoot;ms_dataStep.pida_dist.peak;ms_dataStep.pida_dist.peaktime;pida_gainMargin;pida_phaseMargin};
                Tab = table(parameters,PIDA_DIST);
        end
end

switch Ms
    case 1.4
        str = '_ms14';
    case 2
        str = '_ms2';
end

name = ms_dataStep.Name;
%generazione nome del file da salvare in base al sistema in input
filename_excel = strcat(name,str,'.xlsx');

%scrittura file excel
writetable(Tab,filename_excel);

filename_mat = strcat(name,str,'.mat');
save(filename_mat,'ms_dataStep');
end

    
