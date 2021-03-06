            
s=tf('s')
        dt = 0.0001;%time step
 G = (1/(1+2*s))*exp(-s);
 %% Genetic Algorithm Paremeters
        %Population Size of each Iteration
        PopSize = 200;
        MaxGeneration = 1800;
        %lower bounds lb 
        lb_PIDA_dist = [0.001 0.1 0.00001 3 0.0001 3];
        %upper bounds ub 
        ub_PIDA_dist = [10 500 30 50 20 50];

        optionsdist3 = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'OutputFcn',@myfunpidadist);
        [controldist3,IAEdist3] = ga(@(K)pida_test_dist(G,dt,K),6,-eye(6),zeros(6,1),[],[],lb_PIDA_dist,ub_PIDA_dist,[],optionsdist3);
        