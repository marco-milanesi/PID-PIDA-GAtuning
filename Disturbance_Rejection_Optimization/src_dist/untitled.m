%%  
s=tf('s');
dt = 0.0001;%time step
variable =5;
G = (1/(1+variable*s))*exp(-s)
 
 %% Genetic Algorithm Paremeters
        %Population Size of each Iteration
        PopSize = 30;
        MaxGeneration = 200;
        
%% PIDA genetic algorithm
        %{
        x(1) = Kp
        x(2) = Ti
        x(3) = Td
        x(4) = N
        x(5) = Ta
        x(6) = alfa
        %}
                    
        rng(1,'twister') % for reproducibility
        population3 = rand(PopSize,4);
        optionsdist3 = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'InitialPopulation',population3,'OutputFcn',@myfunpidadist);
        [controldist3,IAEdist3] = ga(@(K)pida_test_dist(G,dt,K),4,-eye(4),zeros(4,1),[],[],[],[],[],optionsdist3);

        K_pidadist = controldist3(1)*(1 + 1/(controldist3(2)*s) + (controldist3(3)*s)/(1 + s*(0.0001)) + (controldist3(4)*s^2)/((1 + s*0.0001)^2)); 
      
        global Disturb_PIDA;
        Disturb_PIDA = feedback(G,K_pidadist);
        
        
        %%
        t=0:0.001:100;
        figure()
        step(Disturb_PIDA,t);
        figure()
        bode(K_pidadist*G)