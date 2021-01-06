clear all
s =tf('s');
variable = 1;
G = 1/(s+1)^variable;
dt = 0.001;
PopSize = 100;
MaxGeneration = 1800;
options = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'OutputFcn',@myfun);
lb_PID = [0.001 0.1 0.1 5];
ub_PID = [10 500 50 20];
[control,IAE] = ga(@(K)pidtest(G,dt,K),4,[],[],[],[],lb_PID,ub_PID,[],options);
K = control(1) + control(2)/s + (control(3)*s)/(1 + s*(control(3)/control(4)));
Loop_PID = series(K,G);
global ClosedLoop_PID;
ClosedLoop_PID = feedback(Loop_PID,1);
info = stepinfo(ClosedLoop_PID);
t = 0:dt:50;
plot(t,step(ClosedLoop_PID,t));