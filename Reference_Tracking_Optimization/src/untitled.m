          
s=tf('s');
        dt = 0.0001;%time step
 G = (1/(1+2*s))*exp(-s);
 %% Genetic Algorithm Paremeters
        %Population Size of each Iteration
        PopSize = 200;
        MaxGeneration = 1800;

   %% I-PD genetic algorithm      
        
        %{
        x(1) = Kp
        x(2) = Ti
        x(3) = Td
        x(4) = N
        %}         
        %lower bounds lb 
        lb_IPD = [0.001 0.1 8 3];
        %upper bounds ub 
        ub_IPD = [10 500 20 150];
        options1 = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'OutputFcn',@myfun);
        [control1,IAE1] = ga(@(K)ipdtest(G,dt,K),4,-eye(4),zeros(4,1),[],[],lb_IPD,ub_IPD,[],options1);
        

        K1 = control1(1)/(s*control1(2));
        K2 = control1(1)*(1+(s*control1(3))/(1 + s*(control1(3)/control1(4))));
        
        ClosedLoop1_IPD = feedback(G,K2);
        Loop_IPD = series(K1,ClosedLoop1_IPD);
        global ClosedLoop_IPD;
        ClosedLoop_IPD = feedback(Loop_IPD,1);
        t=0:dt:100;
        plot(t,step(ClosedLoop_IPD,t))
        