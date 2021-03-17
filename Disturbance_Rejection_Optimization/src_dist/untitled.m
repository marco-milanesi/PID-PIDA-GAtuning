%%  
s=tf('s');
dt = 0.0001;%time step
G = 1/(s+1)/(s^2+(2*0.1*1*s)+(1*1))
 
 %% Genetic Algorithm Paremeters
        %Population Size of each Iteration
        PopSize = 200;
        MaxGeneration = 1800;
        dataDist.Controller.pida
        
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
        lb_PIDA_dist = [0.1 0.1 0.001 50 0.1 0.0001];
        %upper bounds ub 
        ub_PIDA_dist = [50 50 20 100 300 33];

        optionsdist3 = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'OutputFcn',@myfunpidadist);
        [controldist3,IAEdist3] = ga(@(K)pida_test_dist(G,dt,K),6,-eye(6),zeros(6,1),[],[],lb_PIDA_dist,ub_PIDA_dist,[],optionsdist3);
        
        K_pidadst = controldist3(1)*(1 + 1/(controldist3(2)*s) + (controldist3(3)*s)/(1 + s*(controldist3(3)/controldist3(4))) + (controldist3(5)*s^2)/((1 + s*controldist3(5)/controldist3(6))^2)); 
      
        global Disturb_PIDA;
        Disturb_PIDA = feedback(G,K_pidadst);
        t=0:dt:100;
        plot(t,step(Disturb_PIDA,t))
        
        