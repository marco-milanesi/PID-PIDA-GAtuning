function pid = ga_info_to_struct(favl,x,S_PID,type)
%funzione per convertire i dati riguardanti un controllore in una sotto
%struttura

    pid.IAE = favl;
    pid.Kp = x(1) ;
    pid.Ti = x(2);
    pid.Td = x(3);
    pid.N = x(4);
    %switch che in base al tipo di controllore asssegna i vari paremetri
    switch type
        case 'pid'
                pid.Ta = [];
                pid.b = 1;
                pid.c = 1;
                pid.alfa = [];
        case 'i_pd'
                pid.Ta = [];
                pid.b = 0;
                pid.c = 0;
                pid.alfa = [];
        case 'pi_d'
                pid.Ta=[];
                pid.b=1;
                pid.c=0;
                pid.alfa=[];
        case 'pida'
                pid.Ta = x(5);
                pid.b = 1;
                pid.c = 1;
                pid.alfa = x(6);
        otherwise
                pid.Ta=[];
                pid.b=[];
                pid.c=[];
                pid.N=[];
                pid.alfa=[];     
    end
    
    pid.Risetime = S_PID.RiseTime;
    pid.settlingtime =S_PID.SettlingTime  ;
    pid.overshoot = S_PID.Overshoot;
    pid.undershoot = S_PID.Undershoot;
    pid.peak = S_PID.Peak;
    pid.peaktime = S_PID.PeakTime;
end


