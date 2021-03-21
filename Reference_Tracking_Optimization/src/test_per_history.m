%% INSERIRE G   
s = tf('s');
strSelection = 'Multiple Equal Poles';
variable = 8;
G = 1/(s+1)^variable

        analized = struct;
        analized.systemTransferFunction = G;

        %time step
        dt = 0.001;
 
 %% Genetic Algorithm Paremeters
        
    
        %Population Size of each Iteration
        PopSize = 250;
        MaxGeneration = 2000;
        
        
%% PID genetic algorithm
       
        %{
        x(1) = Kp
        x(2) = Ti
        x(3)= Td 
        x(4)= N
        %} 

% 
%         %lower bounds lb
%         lb_PID = [0.001 0.1 0.00001 3];
%         %upper bounds ub 
%         ub_PID = [10 500 10 500];
%         options = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'OutputFcn',@myfun);
%         [control,IAE] = ga(@(K)pidtest(G,dt,K),4,-eye(4),zeros(4,1),[],[],lb_PID,ub_PID,[],options);
%         
%         K_pid = control(1)*(1 + 1/(s*control(2)) + (control(3)*s)/(1 + s*(control(3)/control(4))));
%         
        rng(1,'twister') % for reproducibility
        population = rand(PopSize,3);
        options = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'InitialPopulation',population,'OutputFcn',@myfunpid);
        [control,IAE] = ga(@(K)pidtest(G,dt,K),3,-eye(3),zeros(3,1),[],[],[],[],[],options);
        K_pid = control(1)*(1 + 1/(s*control(2)) + (control(3)*s)/(1 + s*(0.0001)));
 

%         Loop_PID = series(K_pid,G);
%         global ClosedLoop_PID;
%         ClosedLoop_PID = feedback(Loop_PID,1);
%         
%         analized.Controller.pid = K_pid;
%         
%         analized.Loop.pid = Loop_PID;
%         analized.ClosedLoop.pid = ClosedLoop_PID;
%         
%         info = stepinfo(ClosedLoop_PID);
%         analized.pid = ga_info_to_struct(IAE,control,info,'pid');
%         analized.time = info.SettlingTime;
%         
%         
%  %% I-PD genetic algorithm      
%         
%         %{
%         x(1) = Kp
%         x(2) = Ti
%         x(3) = Td
%         x(4) = N
%         %}         
% %         %lower bounds lb 
% %         lb_IPD = [0.001 0.1 0.1 3];
% %         %upper bounds ub 
% %         ub_IPD = [10 500 20 150];
% %         options1 = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'OutputFcn',@myfun);
% %         [control1,IAE1] = ga(@(K)ipdtest(G,dt,K),4,-eye(4),zeros(4,1),[],[],lb_IPD,ub_IPD,[],options1);
% %         
%         rng(1,'twister') % for reproducibility
%         population1 = rand(PopSize,3);
%         options1 = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'InitialPopulation',population1,'OutputFcn',@myfunipd);
%         [control1,IAE1] = ga(@(K)ipdtest(G,dt,K),3,-eye(3),zeros(3,1),[],[],[],[],[],options1);
%         
%         
%         K1_ipd = control1(1)/(s*control1(2));
%         K2_ipd = control1(1)*(1+(s*control1(3))/(1 + s*(0.0001)));
%         
%         ClosedLoop1_IPD = feedback(G,K2_ipd);
%         Loop_IPD = series(K1_ipd,ClosedLoop1_IPD);
%         global ClosedLoop_IPD;
%         ClosedLoop_IPD = feedback(Loop_IPD,1);
%         
%         analized.Controller.ipd.K1 = K1_ipd;
%         analized.Controller.ipd.K2 = K2_ipd;
%         
%         analized.Loop.ipd = Loop_IPD;
%         analized.ClosedLoop.ipd = ClosedLoop_IPD;
%         info = stepinfo(ClosedLoop_IPD); 
%         
%         analized.ipd = ga_info_to_struct(IAE1,control1,info,'i_pd');
%         if analized.time < info.SettlingTime
%             analized.time = info.SettlingTime;
%         end
%         
%  %%   PI-D genetic algorithm 
%  
%         %{
%         x(1) = Kp
%         x(2) = Ti
%         x(3) = Td
%         x(4) = N
%         %}
%  
% %         %lower bounds lb 
% %         lb_DPI = [0.001 0.1 0.00001 3];
% %         %upper bounds ub 
% %         ub_DPI = [50 500 10 500];
% %         options2 = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'OutputFcn',@myfun);
% %         [control2,IAE2] = ga(@(K)dpitest(G,dt,K),4,-eye(4),zeros(4,1),[],[],lb_DPI,ub_DPI,[],options2);
%         rng(1,'twister') % for reproducibility
%         population2 = rand(PopSize,3);
%         options2 = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'InitialPopulation',population2,'OutputFcn',@myfundpi);
%         [control2,IAE2] = ga(@(K)dpitest(G,dt,K),3,-eye(3),zeros(3,1),[],[],[],[],[],options2);
%         
% 
%         K1_dpi = control2(1);
%         K2_dpi = control2(1)/(s*control2(2));
%         K3_dpi = control2(1)*((s*control2(3))/(1+(0.0001)));
%                 
%         global ClosedLoop_DPI;
%         ClosedLoop_DPI = minreal((G*(K1_dpi+K2_dpi))/(1+(G*K3_dpi)+(G*(K1_dpi+K2_dpi))));
%         
%         analized.Controller.dpi.K1 = K1_dpi;
%         analized.Controller.dpi.K2 = K2_dpi;
%         analized.Controller.dpi.K3 = K3_dpi;
%         
%         analized.Loop.dpi =(K1_dpi+K2_dpi)*(G/(1+(G*K3_dpi)));
%         analized.ClosedLoop.dpi = ClosedLoop_DPI;
%         
%         info = stepinfo(ClosedLoop_DPI); 
%         analized.dpi = ga_info_to_struct(IAE2,control2,info,'pi_d');
%         if analized.time < info.SettlingTime
%             analized.time = info.SettlingTime;
%         end
%         
% %% PIDA genetic algorithm
%         %{
%         
%         x(1) = Kp
%         x(2) = Ti
%         x(3) = Td
%         x(4) = N
%         x(5) = Ta
%         x(6) = alfa
%         %}
%                     
% %         %lower bounds lb 
% %         lb_PIDA = [0.001 0.1 0.00001 0.1 10 3];
% %         %upper bounds ub 
% %         ub_PIDA = [10 500 10 600 600 33];
% %         options3 = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'OutputFcn',@myfunpida);
% %         [control3,IAE3] = ga(@(K)pidatest(G,dt,K),6,-eye(6),zeros(6,1),[],[],lb_PIDA,ub_PIDA,[],options3);
% %         
%         rng(1,'twister') % for reproducibility
%         population3 = rand(PopSize,4);
%         options3 = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'InitialPopulation',population3,'OutputFcn',@myfunpida);
%         [control3,IAE3] = ga(@(K)pidatest(G,dt,K),4,-eye(4),zeros(4,1),[],[],[],[],[],options3);
%         
%         K_pida = control3(1)*(1 + 1/(s*control3(2)) + (control3(3)*s)/(1 + s*(0.0001)) + (control3(4)*s^2)/((1 + s*0.0001)^2)); 
%        
%         Loop_PIDA = series(K_pida,G);
%         global ClosedLoop_PIDA;
%         ClosedLoop_PIDA = feedback(Loop_PIDA,1);
%         
%         analized.Controller.pida = K_pida;
%         analized.Loop.pida = Loop_PIDA;
%         
%         analized.ClosedLoop.pida = ClosedLoop_PIDA;
%         info = stepinfo(ClosedLoop_PIDA);     
%         analized.pida = ga_info_to_struct(IAE3,control3,info,'pida');
%         if analized.time < info.SettlingTime
%             analized.time = info.SettlingTime;
%         end       
%           
% %% export to Excel
%         print_excel(analized,strSelection,variable);