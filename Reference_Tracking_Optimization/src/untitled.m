       
%%  
s=tf('s');
dt = 0.0001;%time step
<<<<<<< HEAD
variable=1;
G = (variable*variable)/(s+1)/(s^2+(2*0.1*variable*s)+(variable*variable))
=======

G = 1/(s+1)^4
>>>>>>> 2e807e664ce61aa854457fd6df0f2fc4fdd31ad1

 
 %% Genetic Algorithm Paremeters
        %Population Size of each Iteration
<<<<<<< HEAD
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
=======
        PopSize = 100;
        MaxGeneration = 2500;
        rng(1,'twister') % for reproducibility
        population3 = rand(PopSize,4);
        options3 = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'InitialPopulation',population3,'OutputFcn',@myfunpida);
        [control3,IAE3] = ga(@(K)pidatest(G,dt,K),4,-eye(4),zeros(4,1),[],[],[],[],[],options3);
>>>>>>> 2e807e664ce61aa854457fd6df0f2fc4fdd31ad1
        
        K_pida = control3(1)*(1 + 1/(s*control3(2)) + (control3(3)*s)/(1 + s*(0.0001)) + (control3(4)*s^2)/((1 + s*0.0001)^2)); 
       
        Loop_PIDA = series(K_pida,G);
        global ClosedLoop_PIDA;
        ClosedLoop_PIDA = feedback(Loop_PIDA,1);

