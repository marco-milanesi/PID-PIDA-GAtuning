%%  
clear all
s=tf('s');
dt = 0.0001;%time step
variable =2;
G = (1/(1+variable*s))*exp(-s)


global minimun_IAE;
minimun_IAE = 100;
 %% Genetic Algorithm Paremeters
        %Population Size of each Iteration
        PopSize = 100;
        MaxGeneration = 500;
        
%% PIDA genetic algorithm
        %{
        x(1) = Kp
        x(2) = Ti
        x(3) = Td
        x(4) = N
        x(5) = Ta
        x(6) = alfa
        %}
                    
        %lower bounds lb 

        rng(1,'twister') % for reproducibility
        population3 = rand(PopSize,5);
        clear gaoutfun
        optionsdist3 = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'InitialPopulation',population3,'OutputFcn',@gaoutfun);
        [controldist3,IAEdist3] = ga(@(K)pida_test_dist(G,dt,K),5,-eye(5),zeros(5,1),[],[],[],[],[],optionsdist3);
        record_PIDA_dist = gaoutfun();
        
        
        K_pidadist = controldist3(1)*(1 + 1/(controldist3(2)*s) + (controldist3(3)*s)/(1 + s*(0.0001)) + (controldist3(4)*s^2)/((1 + s*(controldist3(4)/controldist3(5)))^2)); 
      
        global Disturb_PIDA;
        Disturb_PIDA = feedback(G,K_pidadist);
        %%
        t=0:0.001:50;
        step(Disturb_PIDA,t);