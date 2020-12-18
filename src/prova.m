clear all
s =tf('s');
variable = 0.1;
G = 1/(s+1)/(1+variable*s)/(1+variable^2*s)/(1+variable^3*s);
dt = 0.001;
PopSize = 150;
options = optimoptions(@ga,'PopulationSize',PopSize,'TolFun',1e-3,'useparallel',true);
lb_PID = [0.001 0.1 0.1 5];
ub_PID = [10 500 50 20];
[control,IAE] = ga(@(K)ipdtest(G,dt,K),4,[],[],[],[],lb_PID,ub_PID,[],options);
K1 = control(1);
K2 = control(1)/(s*control(2));
K3 = control(1)*((s*control(3))/(1+(control(3)*s/control(4))));
ClosedLoop_DPI = (G*(K1+K2))/(1+(G*K3)+(G*(K1+K2)));
t = 0:dt:50;
plot(t,step(ClosedLoop_DPI,t));