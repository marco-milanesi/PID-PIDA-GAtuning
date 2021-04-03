clear all, close all, clc

dt = 0.001;

popsize = 10;
MaxGenerations = 10;

s = tf('s');
G = (1/(1+5*s))*exp(-s)
rng(1,'twister') % for reproducibility

population_PID = rand(popsize,3);
population_I_PD = rand(popsize,3);
population_PI_D = rand(popsize,3);
population_PIDA = rand(popsize,4);

%% PID
options_PID = optimoptions(@ga,'PopulationSize',popsize,'MaxGenerations',MaxGenerations,'InitialPopulation',population_PID,'OutputFcn',@myfun_pid);
[x_PID,fval_PID,exitflag,output,population_PID,scores] = ga(@(K)pid_test(G,dt,K),3,-eye(3),zeros(3,1),[],[],[],[],[],options_PID);
clear myfun_pid

fval_PID

%% PI-D
options_PI_D = optimoptions(@ga,'PopulationSize',popsize,'MaxGenerations',MaxGenerations,'InitialPopulation',population_PI_D,'OutputFcn',@myfun_pi_d);
[x_PI_D,fval_PI_D,exitflag,output,population_PI_D,scores] = ga(@(K)pi_d_test(G,dt,K),3,-eye(3),zeros(3,1),[],[],[],[],[],options_PI_D);
clear myfun_pi_d

fval_PI_D

%% I-PD
options_I_PD = optimoptions(@ga,'PopulationSize',popsize,'MaxGenerations',MaxGenerations,'InitialPopulation',population_I_PD,'OutputFcn',@myfun_i_pd);
[x_I_PD,fval_I_PD,exitflag,output,population_I_PD,scores] = ga(@(K)i_pd_test(G,dt,K),3,-eye(3),zeros(3,1),[],[],[],[],[],options_I_PD);
clear myfun_ipd

fval_I_PD

%% PIDA
options_PIDA = optimoptions(@ga,'PopulationSize',popsize,'MaxGenerations',MaxGenerations,'InitialPopulation',population_PIDA,'OutputFcn',@myfun_pida);
[x_PIDA,fval_PIDA,exitflag,output,population_PIDA,scores] = ga(@(K)pida_test(G,dt,K),4,-eye(4),zeros(4,1),[],[],[],[],[],options_PIDA);
clear myfun_pida

fval_PIDA
