function [analized, ClosedLoop_PIDA, Loop_PIDA] = pida_setpoint(PopSize, MaxGeneration, dt, G, Ms)

rng(1,'twister') % for reproducibility
population3 = rand(PopSize,6);

% Set lower bounds and upper bounds
lb_PIDA = [0.01, 0.01, 0.01, 0.01, 0.01, 0.01];

% Configure GA options and run the optimization
clear ms_gaoutfun
options3 = optimoptions(@ga,'Display','iter','PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'InitialPopulation',population3,'OutputFcn',@ms_gaoutfun);
[control3,~] = ga(@(K)ms_pidatest(G,dt,K,Ms),6,-eye(6),zeros(6,1),[],[],[],[],[],options3);
record_PIDA = ms_gaoutfun();
save 'ms_history_PIDA.mat'  record_PIDA ;

% Compute K_pida, the PIDA controller transfer function
s = tf('s');
K_pida = control3(1)*(1 + 1/(s*control3(2)) + (control3(3)*s)/(1 + s*(control3(3)/control3(6))) + (control3(4)*s^2)/((1 + s*(control3(4)/control3(5)))^2));

% Compute closed-loop and loop transfer functions
Loop_PIDA = series(K_pida,G);
ClosedLoop_PIDA = feedback(Loop_PIDA,1);

% Compute analysis parameters and populate the struct
t = 0:dt:100;
[y1,~] = step(ClosedLoop_PIDA,t);
IAE3=sum(abs(1-y1)*dt);
analized.Controller.pida = K_pida;
analized.Loop.pida = Loop_PIDA;
analized.Sensitivity.pida = peakgain_research(feedback(1,Loop_PIDA));
analized.ClosedLoop.pida = ClosedLoop_PIDA;
info = stepinfo(ClosedLoop_PIDA);
analized.pida = ms_ga_info_to_struct(IAE3,control3,info,'pida');
analized.time = info.SettlingTime;

end
