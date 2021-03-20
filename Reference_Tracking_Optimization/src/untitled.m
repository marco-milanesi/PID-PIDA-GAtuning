      
%%  
s=tf('s');
dt = 0.0001;%time step
G = (1/(1+2*s))*exp(-s)
 
 %% Genetic Algorithm Paremeters
        %Population Size of each Iteration
        PopSize = 20;
        MaxGeneration = 100;

%% PID genetic algorithm
       
        %{
        x(1) = Kp
        x(2) = Ti
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