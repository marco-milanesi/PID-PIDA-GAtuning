       
%%  
s=tf('s');
dt = 0.0001;%time step

G = 1/(s+1)^4

 
 %% Genetic Algorithm Paremeters
        %Population Size of each Iteration
        PopSize = 100;
        MaxGeneration = 2500;
        rng(1,'twister') % for reproducibility
        population3 = rand(PopSize,4);
        options3 = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'InitialPopulation',population3,'OutputFcn',@myfunpida);
        [control3,IAE3] = ga(@(K)pidatest(G,dt,K),4,-eye(4),zeros(4,1),[],[],[],[],[],options3);
        
        K_pida = control3(1)*(1 + 1/(s*control3(2)) + (control3(3)*s)/(1 + s*(0.0001)) + (control3(4)*s^2)/((1 + s*0.0001)^2)); 
       
        Loop_PIDA = series(K_pida,G);
        global ClosedLoop_PIDA;
        ClosedLoop_PIDA = feedback(Loop_PIDA,1);

