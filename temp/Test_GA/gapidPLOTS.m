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
clear gaoutfun
options_PID = optimoptions(@ga,'PopulationSize',popsize,'MaxGenerations',MaxGenerations,'InitialPopulation',population_PID,'OutputFcn',@gaoutfun);
[x_PID,fval_PID,exitflag,output,population_PID,scores] = ga(@(K)pid_test(G,dt,K),3,-eye(3),zeros(3,1),[],[],[],[],[],options_PID);
record_PID = gaoutfun();
fval_PID

%% PI-D
clear gaoutfun
options_PI_D = optimoptions(@ga,'PopulationSize',popsize,'MaxGenerations',MaxGenerations,'InitialPopulation',population_PI_D,'OutputFcn',@gaoutfun);
[x_PI_D,fval_PI_D,exitflag,output,population_PI_D,scores] = ga(@(K)pi_d_test(G,dt,K),3,-eye(3),zeros(3,1),[],[],[],[],[],options_PI_D);
record_PI_D = gaoutfun();

fval_PI_D

%% I-PD
clear gaoutfun
options_I_PD = optimoptions(@ga,'PopulationSize',popsize,'MaxGenerations',MaxGenerations,'InitialPopulation',population_I_PD,'OutputFcn',@gaoutfun);
[x_I_PD,fval_I_PD,exitflag,output,population_I_PD,scores] = ga(@(K)i_pd_test(G,dt,K),3,-eye(3),zeros(3,1),[],[],[],[],[],options_I_PD);
record_I_PD = gaoutfun();

fval_I_PD

%% PIDA
clear gaoutfun
options_PIDA = optimoptions(@ga,'PopulationSize',popsize,'MaxGenerations',MaxGenerations,'InitialPopulation',population_PIDA,'OutputFcn',@gaoutfun);
[x_PIDA,fval_PIDA,exitflag,output,population_PIDA,scores] = ga(@(K)pida_test(G,dt,K),4,-eye(4),zeros(4,1),[],[],[],[],[],options_PIDA);
record_PIDA = gaoutfun();

fval_PIDA
