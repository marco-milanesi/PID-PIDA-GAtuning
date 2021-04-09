       
%%  
s=tf('s');
dt = 0.0001;%time step
variable = 5;
G = (1/(1+variable*s))*exp(-s)
        PopSize = 100;
        MaxGeneration = 250;
        rng(1,'twister') % for reproducibility
        population = rand(PopSize,4);
        clear gaoutfun
        options = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'InitialPopulation',population,'OutputFcn',@gaoutfun);
        [control,IAE] = ga(@(K)pidtest(G,dt,K),4,-eye(4),zeros(4,1),[],[],[],[],[],options);
        record_PID = gaoutfun();
        save 'history_PID.mat'  record_PID ;
        K_pid = control(1)*(1 + 1/(s*control(2)) + (control(3)*s)/(1 + s*(control(3)/control(4))));
 


        Loop_PID = series(K_pid,G);
        global ClosedLoop_PID;
        ClosedLoop_PID = feedback(Loop_PID,1);
        t=0:dt:50;
        step(ClosedLoop_PID,t);
