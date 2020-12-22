clear all;
s=tf('s');
variable = 0.2;
G = 1/(s+1)/(1+variable*s)/(1+variable^2*s)/(1+variable^3*s);

dt = 0.001;
PopSize = 10;
options = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',50,'OutputFcn',@myfun);

lb_PID = [0.001 0.1 0.1 5];
%upper bounds ub
ub_PID = [10 500 50 20];
        [control3,IAE3] = ga(@(K)pidatest(G,dt,K),6,-eye(6),zeros(6,1),[],[],lb_PID,ub_PID,[],options);
        
        K = control3(1) + control3(2)/s + (control3(3)*s)/(1 + s*(control3(3)/control3(4))) + (control3(5)*s^2)/((1 + s*control3(5)/control3(6))^2); 
       
        Loop_PIDA = series(K,G);
        ClosedLoop_PIDA = feedback(Loop_PIDA,1);
t = 0:dt:100;
plot(t,step(minreal(ClosedLoop_PIDA),t));
