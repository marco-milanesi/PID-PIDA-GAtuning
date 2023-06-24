function [analized, ClosedLoop_IPD, Loop_IPD] = ipd_setpoint(PopSize, MaxGeneration, dt, G, Ms)

s=tf('s');
% I-PD genetic algorithm
population1 = rand(PopSize,4);

clear ms_gaoutfun
options1 = optimoptions(@ga,'Display','iter','PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'InitialPopulation',population1,'OutputFcn',@ms_gaoutfun);
[control1,IAE1] = ga(@(K)ms_ipdtest(G,dt,K,Ms),4,-eye(4),zeros(4,1),[],[],[],[],[],options1);
record_PI_D = ms_gaoutfun();
save 'ms_history_PI_D.mat'  record_PI_D ;

K1_ipd = control1(1)/(s*control1(2));
K2_ipd = control1(1)*(1+(s*control1(3))/(1 + s*(control1(3)/control1(4))));

ClosedLoop1_IPD = feedback(G,K2_ipd);
Loop_IPD = series(K1_ipd,ClosedLoop1_IPD);

ClosedLoop_IPD = feedback(Loop_IPD,1);

analized.Controller.ipd.K1 = K1_ipd;
analized.Controller.ipd.K2 = K2_ipd;

analized.Loop.ipd = Loop_IPD;
analized.Sensitivity.ipd = peakgain_research(feedback(1,Loop_IPD));
analized.ClosedLoop.ipd = ClosedLoop_IPD;
info = stepinfo(ClosedLoop_IPD);

analized.ipd = ms_ga_info_to_struct(IAE1,control1,info,'i_pd');
analized.time = info.SettlingTime;

    

end
