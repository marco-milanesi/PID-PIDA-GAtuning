function controller = ga_info_to_struct(favl,x,S_controller,type)
    %funzione per convertire i dati riguardanti un controllore in una sotto
    %struttura
    controller = struct ;
    controller.IAE = favl;
    controller.Kp = x(1) ;
    controller.Ti = x(2);
    controller.Td = x(3);
    controller.N = x(4);
    %switch che in base al tipo di controllore asssegna i vari paremetri
    switch type
        case 'pid'
                controller.Ta = [];
                controller.b = 1;
                controller.c = 1;
                controller.alfa = [];
        case 'i_pd'
                controller.Ta = [];
                controller.b = 0;
                controller.c = 0;
                controller.alfa = [];
        case 'pi_d'
                controller.Ta=[];
                controller.b=1;
                controller.c=0;
                controller.alfa=[];
        case 'pida'
                controller.Ta = x(5);
                controller.b = 1;
                controller.c = 1;
                controller.alfa = x(6);
        otherwise
                controller.Ta=[];
                controller.b=[];
                controller.c=[];
                controller.alfa=[];     
    end
    
    controller.Risetime = S_controller.RiseTime;
    controller.settlingtime =S_controller.SettlingTime  ;
    controller.overshoot = S_controller.Overshoot;
    controller.undershoot = S_controller.Undershoot;
    controller.peak = S_controller.Peak;
    controller.peaktime = S_controller.PeakTime;
end


