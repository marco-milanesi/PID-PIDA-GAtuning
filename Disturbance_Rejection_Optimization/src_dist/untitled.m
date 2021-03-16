%%  
s=tf('s');
dt = 0.0001;%time step
G = 1/(s+1)/(s^2+(2*0.1*1*s)+(1*1))
 
 %% Genetic Algorithm Paremeters
        %Population Size of each Iteration
        PopSize = 100;
        MaxGeneration = 1000;

%% PIDA genetic algorithm
        %{
        x(1) = Kp
        x(2) = Ti
        x(3) = Td
        x(4) = N
        x(5) = Ta
        x(6) = alfa
        %}
                    
        lb_PID_dist = [4 1 1 150];
        %upper bounds ub 
        ub_PID_dist = [6 3 3 300];

        optionsdist = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'OutputFcn',@myfundist);
        [controldist,IAEdist] = ga(@(K)pid_test_dist(G,dt,K),4,-eye(4),zeros(4,1),[],[],lb_PID_dist,ub_PID_dist,[],optionsdist);
        K_piddist = controldist(1)*(1 + 1/(controldist(2)*s) + (controldist(3)*s)/(1 + s*(controldist(3)/controldist(4))));
       
        global Disturb_PID;
        Disturb_PID = feedback(G,K_piddist);
        
        t=0:dt:100;
        plot(t,step(Disturb_PID,t))
        
        