       
%%  
s=tf('s');
dt = 0.0001;%time step
variable = 2;
 G = (1-variable*s)/(s+1)^3

        PopSize = 100;
        MaxGeneration = 300;

        
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
%         lb_PIDA_dist = [20 0.1 0.01 150 0.00001 3];
%         %upper bounds ub 
%         ub_PIDA_dist = [100 10 30 250 100 33];
% 
%         optionsdist3 = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'OutputFcn',@myfunpidadist);
%         [controldist3,IAEdist3] = ga(@(K)pida_test_dist(G,dt,K),6,-eye(6),zeros(6,1),[],[],lb_PIDA_dist,ub_PIDA_dist,[],optionsdist3);

%         for k=1:PopSize
%             mat_PIDA(k,:)=[21.4166732623795 3.61413835410836 1.35535347663004 1.15168899327377 104.222112570915 3.63389423163309];       
%         end
%         
rng(1,'twister') % for reproducibility
mat_PIDA = rand(PopSize,6);
        clear ms_gaoutfun
        options3 = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'InitialPopulation',mat_PIDA,'OutputFcn',@ms_gaoutfun);
        [control3,IAE3] = ga(@(K)ms_pidatest(G,dt,K),6,-eye(6),zeros(6,1),[],[],[],[],[],options3);
        record_PIDA = ms_gaoutfun();
        save 'ms_history_PIDA.mat'  record_PIDA ;
        
        K_pida = control3(1)*(1 + 1/(s*control3(2)) + (control3(3)*s)/(1 + s*(control3(3)/control3(6))) + (control3(4)*s^2)/((1 + s*(control3(4)/control3(5)))^2)); 
       
        Loop_PIDA = series(K_pida,G);
        global ClosedLoop_PIDA;
        ClosedLoop_PIDA = feedback(Loop_PIDA,1);
        
        analized.Controller.pida = K_pida;
        analized.Loop.pida = Loop_PIDA;
        analized.Sensitivity.pida = getPeakGain(feedback(1,Loop_PIDA));
        analized.ClosedLoop.pida = ClosedLoop_PIDA;
        info = stepinfo(ClosedLoop_PIDA);     
        analized.pida = ms_ga_info_to_struct(IAE3,control3,info,'pida');
