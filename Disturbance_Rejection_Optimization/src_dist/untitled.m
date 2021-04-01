%%  
s=tf('s');
dt = 0.0001;%time step
variable =5;
G = (1/(1+variable*s))*exp(-s)
 
 %% Genetic Algorithm Paremeters
        %Population Size of each Iteration
        PopSize = 10;
        MaxGeneration = 100;
        
%% PID genetic algorithm
        %{
        x(1) = Kp
        x(2) = Ti
        x(3)= Td 
        x(4)= N
        %} 

        rng(1,'twister') % for reproducibility
        population = rand(PopSize,3);
        optionsdist = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'InitialPopulation',population,'OutputFcn',@myfunpiddist);
        [controldist,IAEdist] = ga(@(K)pid_test_dist(G,dt,K),3,-eye(3),zeros(3,1),[],[],[],[],[],optionsdist);
        
        K_piddist = controldist(1)*(1 + 1/(controldist(2)*s) + (controldist(3)*s)/(1 + s*(0.0001)));
        
        global Disturb_PID;
        Disturb_PID = feedback(G,K_piddist);
        
        
        
        %%
        t=0:0.001:50;
        step(Disturb_PID,t);