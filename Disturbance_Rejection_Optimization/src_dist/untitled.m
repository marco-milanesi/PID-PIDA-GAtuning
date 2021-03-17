%%  
s=tf('s');
dt = 0.0001;%time step
G = 1/(s+1)^4
 
 %% Genetic Algorithm Paremeters
        %Population Size of each Iteration
<<<<<<< HEAD
        PopSize = 200;
        MaxGeneration = 1800;
        dataDist.Controller.pida
        
=======
        PopSize = 50;
        MaxGeneration = 500;

>>>>>>> bd2f73f9a3c3be52790a74b76f8df12566f69910
%% PIDA genetic algorithm
        %{
        x(1) = Kp
        x(2) = Ti
        x(3) = Td
        x(4) = N
        x(5) = Ta
        x(6) = alfa
        %}
                    
        lb_PIDA_dist = [5 1 1.6 390 110 0.1];
        %upper bounds ub 
        ub_PIDA_dist = [5.5 1.3 2.5 600 140 1];

        optionsdist3 = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'OutputFcn',@myfunpidadist);
        [controldist3,IAEdist3] = ga(@(K)pida_test_dist(G,dt,K),6,-eye(6),zeros(6,1),[],[],lb_PIDA_dist,ub_PIDA_dist,[],optionsdist3);
        
        K_pidadist = controldist3(1)*(1 + 1/(controldist3(2)*s) + (controldist3(3)*s)/(1 + s*(controldist3(3)/controldist3(4))) + (controldist3(5)*s^2)/((1 + s*controldist3(5)/controldist3(6))^2)); 
      
        global Disturb_PIDA;
        Disturb_PIDA = feedback(G,K_pidadist);
        t=0:dt:100;
        plot(t,step(Disturb_PIDA,t))
        
        