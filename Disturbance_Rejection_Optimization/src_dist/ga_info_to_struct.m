function controller = ga_info_to_struct(favl,x,S_controller,type)
    %funzione per convertire i dati riguardanti un controllore in una sotto
    %struttura
    controller = struct ;

    %switch che in base al tipo di controllore asssegna i vari paremetri
    switch type
        case 'pid'
                controller.IAE = favl;
                controller.Kp = x(1) ;
                controller.Ti = x(2);
                controller.Td = x(3);
                controller.N = x(3)/0.0001;
                controller.Ta = [];
                controller.b = 1;
                controller.c = 1;
                controller.alfa = [];
        case 'i_pd'
                controller.IAE = favl;
                controller.Kp = x(1) ;
                controller.Ti = x(2);
                controller.Td = x(3);
                controller.N = x(3)/0.0001;
                controller.Ta = [];
                controller.b = 0;
                controller.c = 0;
                controller.alfa = [];
        case 'pi_d'
                controller.IAE = favl;
                controller.Kp = x(1) ;
                controller.Ti = x(2);
                controller.Td = x(3);
                controller.N = x(3)/0.0001;
                controller.Ta=[];
                controller.b=1;
                controller.c=0;
                controller.alfa=[];
        case 'pida'
                controller.IAE = favl;
                controller.Kp = x(1) ;
                controller.Ti = x(2);
                controller.Td = x(3);
                controller.N = x(3)/0.0001;
                controller.Ta = x(4);
                controller.b = 1;
                controller.c = 1;
                controller.alfa = x(4)/0.0001;
        case 'pi'
                controller.IAE = favl;
                controller.Kp = x(1) ;
                controller.Ti = x(2);
                controller.Td = [];
                controller.N = [];
                controller.Ta = [];
                controller.b = x(3);
                controller.c = [];
                controller.alfa = [];
        otherwise
                controller.IAE = [];
                controller.Kp = [];
                controller.Ti = [];
                controller.Td = [];
                controller.N = [];
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


