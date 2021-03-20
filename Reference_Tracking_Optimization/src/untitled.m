      
%%  
s=tf('s');
dt = 0.0001;%time step
<<<<<<< HEAD
G = (1/(1+2*s))*exp(-s)
=======
G = 1/(s+1)^8
>>>>>>> 905316edfb0abd77991bdd5c9e3a5b862bd97250
 
 %% Genetic Algorithm Paremeters
        %Population Size of each Iteration
        PopSize = 20;
        MaxGeneration = 100;

%% PID genetic algorithm
       
        %{
        x(1) = Kp
        x(2) = Ti
<<<<<<< HEAD
        x(3)= Td 
        x(4)= N
        %} 


        %lower bounds lb
        lb_PID = [0.1 0.1 0.001 60];
        %upper bounds ub 
        ub_PID = [5 10 10 150];
        
        options= optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'OutputFcn',@myfun);
        [control,IAE] = ga(@(K)pidtest(G,dt,K),4,-eye(4),zeros(4,1),[],[],lb_PID,ub_PID,[],options);
        
        K_pid = control(1)*(1 + 1/(s*control(2)) + (control(3)*s)/(1 + s*(control(3)/control(4))));
        
        Loop_PID = series(K_pid,G);
        global ClosedLoop_PID;
        ClosedLoop_PID = feedback(Loop_PID,1);
     
        t=0:dt:100;
        plot(t,step(ClosedLoop_PID,t))
=======
        x(3) = Td
        x(4) = N
        x(5) = Ta
        x(6) = alfa
        %}
        lb_PIDA = [0.1 3 0.1 30 100 0.1];
        %upper bounds ub 
        ub_PIDA = [10 10 10 100 150 5];
        options3 = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'OutputFcn',@myfunpida);
        [control3,IAE3] = ga(@(K)pidatest(G,dt,K),6,-eye(6),zeros(6,1),[],[],lb_PIDA,ub_PIDA,[],options3);
        
        K_pida = control3(1)*(1 + 1/(s*control3(2)) + (control3(3)*s)/(1 + s*(control3(3)/control3(4))) + (control3(5)*s^2)/((1 + s*control3(5)/control3(6))^2)); 
       
        Loop_PIDA = series(K_pida,G);
        global ClosedLoop_PIDA;
        ClosedLoop_PIDA = feedback(Loop_PIDA,1);
        losedLoop_DPI = minreal((G*(K1_dpi+K2_dpi))/(1+(G*K3_dpi)+(G*(K1_dpi+K2_dpi))));
        
        t=0:dt:100;
        plot(t,step(ClosedLoop_PID,t))
        
>>>>>>> 905316edfb0abd77991bdd5c9e3a5b862bd97250
