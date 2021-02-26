s = tf('s');
G = (1/(1+5*s))*exp(-s);
PopSize = 100;
MaxGeneration = 2000;
options = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'OutputFcn',@myfun);
        
lb_PID = [0.001 0.1 0 3];
%upper bounds ub 
ub_PID = [10 500 10 33];
        
[control,IAE] = ga(@(K)pidtest(G,dt,K),4,-eye(4),zeros(4,1),[],[],lb_PID,ub_PID,[],options);
        
K = control(1)*(1 + control(2)/s + (control(3)*s)/(1 + s*(control(3)/control(4))));
K = parms(1)*(1 + parms(2)/s + (parms(3)*s)/(1 + s*(parms(3)/parms(4)))); 
