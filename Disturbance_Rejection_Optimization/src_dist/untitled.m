
s=tf('s')
dt = 0.0001;%time step
G = (1/(1+2*s))*exp(-s);
%% Genetic Algorithm Paremeters
%Population Size of each Iteration
PopSize = 200;
MaxGeneration = 1800;
%lower bounds lb 
lb_PIDA_dist = [0.001 0.1 0.00001 3 0.0001 0.0001];
%upper bounds ub 
ub_PIDA_dist = [10 500 33 100 20 33];

optionsdist3 = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'OutputFcn',@myfunpidadist);
[controldist3,IAEdist3] = ga(@(K)pida_test_dist(G,dt,K),6,-eye(6),zeros(6,1),[],[],lb_PIDA_dist,ub_PIDA_dist,[],optionsdist3);
K = controldist3(1)*(1 + 1/(controldist3(2)*s) + (controldist3(3)*s)/(1 + s*(controldist3(3)/controldist3(4))) + (controldist3(5)*s^2)/((1 + s*controldist3(5)/controldist3(6))^2)); 

global Disturb_PIDA;
Disturb_PIDA = feedback(G,K);
infodist3 = stepinfo(Disturb_PIDA);
t=0:dt:100;
plot(t,step(Disturb_PIDA,t))