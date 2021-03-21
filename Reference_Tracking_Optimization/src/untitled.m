      
%%  
s=tf('s');
dt = 0.0001;%time step

G = 1/(s+1)^8

 
 %% Genetic Algorithm Paremeters
        %Population Size of each Iteration
        PopSize = 20;
        MaxGeneration = 100;

        rng(1,'twister') % for reproducibility
        population1 = rand(PopSize,3);
        options1 = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'InitialPopulation',population1,'OutputFcn',@myfunipd);
        [control1,IAE1] = ga(@(K)pidtest(G,dt,K),3,-eye(3),zeros(3,1),[],[],[],[],[],options1);
        
        
        K1_ipd = control1(1)/(s*control1(2));
        K2_ipd = control1(1)*(1+(s*control1(3))/(1 + s*(0.0001)));
        
        ClosedLoop1_IPD = feedback(G,K2_ipd);
        Loop_IPD = series(K1_ipd,ClosedLoop1_IPD);
        global ClosedLoop_IPD;
        ClosedLoop_IPD = feedback(Loop_IPD,1);
        
        t=0:dt:100;
        plot(t,step(ClosedLoop_PID,t))
        

