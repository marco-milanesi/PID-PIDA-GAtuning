function [analized, ClosedLoop_DPI, Loop_DPI] = pi_d_setpoint(PopSize, MaxGeneration, dt, G, Ms)


s = tf('s');
population2 = rand(PopSize, 4);

% lower bounds lb
lb_PI_D = [4.4 7 0.4 36];
% upper bounds ub
ub_PI_D = [4.5 7.2 0.5 36.2];

clear ms_gaoutfun
options2 = optimoptions(@ga,'Display','iter', 'PopulationSize', PopSize, 'MaxGeneration', MaxGeneration, 'InitialPopulation', population2, 'OutputFcn', @ms_gaoutfun);
[control2, IAE2] = ga(@(K)ms_dpitest(G, dt, K, Ms), 4, -eye(4), zeros(4,1), [], [], [], [], [], options2);
record_I_PD = ms_gaoutfun();
save 'ms_history_I_PD.mat' record_I_PD ;

K1_dpi = control2(1);
K2_dpi = control2(1)/(s*control2(2));
K3_dpi = control2(1)*((s*control2(3))/(1+s*(control2(3)/control2(4))));


ClosedLoop_DPI = minreal((G*(K1_dpi+K2_dpi))/(1+(G*K3_dpi)+(G*(K1_dpi+K2_dpi))));

analized.Controller.dpi.K1 = K1_dpi;
analized.Controller.dpi.K2 = K2_dpi;
analized.Controller.dpi.K3 = K3_dpi;
Loop_DPI = (K1_dpi+K2_dpi)*(G/(1+(G*K3_dpi)));
analized.Loop.dpi = Loop_DPI;
analized.ClosedLoop.dpi = ClosedLoop_DPI;
analized.Sensitivity.dpi = peakgain_research(feedback(1,Loop_DPI));
info = stepinfo(ClosedLoop_DPI);
analized.dpi = ms_ga_info_to_struct(IAE2, control2, info, 'pi_d');
analized.time = info.SettlingTime;

end
