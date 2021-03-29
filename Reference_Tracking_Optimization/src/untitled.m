      
%%  
s=tf('s');
dt = 0.0001;%time step
variable=1;
G = (variable*variable)/(s+1)/(s^2+(2*0.1*variable*s)+(variable*variable))

 
 %% Genetic Algorithm Paremeters
        %Population Size of each Iteration
        PopSize = 200;
        MaxGeneration = 2000;

        rng(1,'twister') % for reproducibility
        population2 = rand(PopSize,3);
        options2 = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'InitialPopulation',population2,'OutputFcn',@myfundpi);
        [control2,IAE2] = ga(@(K)dpitest(G,dt,K),3,-eye(3),zeros(3,1),[],[],[],[],[],options2);
        

        K1_dpi = control2(1);
        K2_dpi = control2(1)/(s*control2(2));
        K3_dpi = control2(1)*((s*control2(3))/(1+(0.0001)));
                
        global ClosedLoop_DPI;
        ClosedLoop_DPI = minreal((G*(K1_dpi+K2_dpi))/(1+(G*K3_dpi)+(G*(K1_dpi+K2_dpi))));
        
        t=0:dt:100;
        plot(t,step(ClosedLoop_DPI,t))
        

