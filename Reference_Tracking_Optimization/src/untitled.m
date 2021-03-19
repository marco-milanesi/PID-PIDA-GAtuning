%%  
s=tf('s');
dt = 0.0001;%time step
G = 1/(s+1)^8
 
 %% Genetic Algorithm Paremeters
        %Population Size of each Iteration
        PopSize = 200;
        MaxGeneration = 1800;

%% PIDA genetic algorithm
        %{
        x(1) = Kp
        x(2) = Ti
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
        