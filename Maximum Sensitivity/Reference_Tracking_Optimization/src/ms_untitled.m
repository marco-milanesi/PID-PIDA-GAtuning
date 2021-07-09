       
%%  
s=tf('s');
dt = 0.0001;%time step
variable =0.2
G = 1/(s+1)/(1+variable*s)/(1+variable^2*s)/(1+variable^3*s)
        PopSize = 200;
        MaxGeneration = 300;

        
        rng(1,'twister') % for reproducibility
         population3 = rand(PopSize,6);

        
       for k=1:PopSize
        %   population3=[1.0019909, 2.489697, 0.86382, 0, 0, 16.9448];       
       end
        
        clear ms_gaoutfun
        options3 = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'InitialPopulation',population3,'OutputFcn',@ms_gaoutfun);
        [control3,IAE3] = ga(@(K)ms_pidatest(G,dt,K),6,-eye(6),zeros(6,1),[],[],[],[],[],options3);
        record_PIDA = ms_gaoutfun();
        save 'ms_history_PIDA.mat'  record_PIDA ;
        
        K_pida = control3(1)*(1 + 1/(s*control3(2)) + (control3(3)*s)/(1 + s*(control3(3)/control3(6))) + (control3(4)*s^2)/((1 + s*(control3(4)/control3(5)))^2)); 
       
        Loop_PIDA = series(K_pida,G);
        global ClosedLoop_PIDA;
        ClosedLoop_PIDA = feedback(Loop_PIDA,1);
        
        analized.Controller.pida = K_pida;
        analized.Loop.pida = Loop_PIDA;
        analized.Sensitivity.pida = getPeakGain(feedback(1,Loop_PIDA));
        analized.ClosedLoop.pida = ClosedLoop_PIDA;
        info = stepinfo(ClosedLoop_PIDA);     
        analized.pida = ms_ga_info_to_struct(IAE3,control3,info,'pida');
        if analized.time < info.SettlingTime
            analized.time = info.SettlingTime;
        end       
