function [analized, ClosedLoop_PID, Loop_PID] = pid_setpoint(PopSize, MaxGeneration, dt, G, Ms)

s = tf('s');

% PID genetic algorithm
rng(1,'twister') % for reproducibility
population = rand(PopSize,4);

%lower bounds lb
lb_PID = [0.01 0.01 0.01 0.01];
%upper bounds ub 
ub_PID = [4.1 5.46 2 50];

clear ms_gaoutfun

options = optimoptions(@ga,'Display','iter','PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'InitialPopulation',population,'OutputFcn',@ms_gaoutfun);
[control,~] = ga(@(K)ms_pidtest(G,dt,K,Ms),4,-eye(4),zeros(4,1),[],[],[],[],[],options);
record_PID = ms_gaoutfun();
save 'ms_history_PID.mat'  record_PID ;
K_pid = control(1)*(1 + 1/(s*control(2)) + (control(3)*s)/(1 + s*(control(3)/control(4))));        

Loop_PID = series(K_pid,G);
ClosedLoop_PID = feedback(Loop_PID,1);
t = 0:dt:100;
[y,~] = step(ClosedLoop_PID,t);
IAE=sum(abs(1-y)*dt);
analized.Sensitivity.pid = peakgain_research(feedback(1,Loop_PID));
analized.Controller.pid = K_pid;

analized.Loop.pid = Loop_PID;
analized.ClosedLoop.pid = ClosedLoop_PID;

info = stepinfo(ClosedLoop_PID);
analized.pid = ms_ga_info_to_struct(IAE,control,info,'pid');
analized.time = info.SettlingTime;

end


