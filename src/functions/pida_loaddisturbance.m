function [analized, Disturb_PIDA, Loop_PIDA] = pida_loaddisturbance(PopSize, MaxGeneration, dt, G, Ms)

s=tf('s');
rng(1,'twister') % for reproducibility
population3 = rand(PopSize,6);

clear ms_gaoutfun

%lower bounds lb
lb_PIDA = [0.01 0.01 0.01 0.01 0.01 0.01];
%upper bounds ub
ub_PIDA = [12 1 0.3 10 100 15];

optionsdist3 = optimoptions(@ga,'Display','iter','PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'InitialPopulation',population3,'OutputFcn',@ms_gaoutfun);
[controldist3,~] = ga(@(K)ms_pida_test_dist(G,dt,K, Ms),6,-eye(6),zeros(6,1),[],[],[],[],[],optionsdist3);
record_PIDA_dist = ms_gaoutfun();
save 'ms_history_PIDA_dist.mat'  record_PIDA_dist ;


K_pidadist = controldist3(1)*(1 + 1/(controldist3(2)*s) + (controldist3(3)*s)/(1 + s*(controldist3(3)/controldist3(6))) + (controldist3(4)*s^2)/((1 + s*(controldist3(4)/controldist3(5)))^2));
Disturb_PIDA = feedback(G,K_pidadist);

t = 0:dt:100;
[y,~] = step(Disturb_PIDA,t);
IAEdist3=sum(abs(y)*dt);

analized.Controller.pida = K_pidadist;
Loop_PIDA = series(K_pidadist,G);
analized.Loop.pida = Loop_PIDA;
analized.Sensitivity.pida = peakgain_research_dist(feedback(1,Loop_PIDA));
analized.ClosedLoop.pida = Disturb_PIDA;
infodist3 = stepinfo(Disturb_PIDA);
analized.pida_dist = ms_ga_info_to_struct(IAEdist3,controldist3,infodist3,'pida');
analized.time = infodist3.SettlingTime;
end
