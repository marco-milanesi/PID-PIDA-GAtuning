function [analized, Loop_PID, Disturb_PID] = pid_loaddisturbance(PopSize, MaxGeneration, dt, G, Ms)

s = tf('s');
rng(1,'twister') % for reproducibility
population = rand(PopSize,4);
%lower bounds lb
lb_PID = [0.01 0.01 0.01 0.01];
%upper bounds ub
ub_PID = [12 1 0.3 15];
clear ms_gaoutfun

optionsdist = optimoptions(@ga,'Display','iter','PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'InitialPopulation',population,'OutputFcn',@ms_gaoutfun);
[controldist,~] = ga(@(K)ms_pid_test_dist(G,dt,K,Ms),4,-eye(4),zeros(4,1),[],[],[],[],[],optionsdist);
record_PID_dist = ms_gaoutfun();
save 'ms_history_PID_dist.mat' record_PID_dist;
K_piddist = controldist(1)*(1 + 1/(controldist(2)*s) + (controldist(3)*s)/(1 + s*(controldist(3)/controldist(4))));

Disturb_PID = feedback(G, K_piddist);
t = 0:dt:100;
[y, ~] = step(Disturb_PID, t);
IAEdist = sum(abs(y)*dt);
analized.Controller.pid = K_piddist;
Loop_PID = series(G, K_piddist);
analized.Loop.pid = Loop_PID;
analized.ClosedLoop.pid = Disturb_PID;
analized.Sensitivity.pid = peakgain_research_dist(feedback(1, Loop_PID));
infodist = stepinfo(Disturb_PID);
analized.pid_dist = ms_ga_info_to_struct(IAEdist, controldist, infodist, 'pid');
analized.time = infodist.SettlingTime;
end
