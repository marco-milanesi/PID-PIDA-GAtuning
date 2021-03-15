function J = ipd_test_dist(G,dt,parms)
%I-PD
s = tf('s');
% parms(1)kp
% parms(2)ti
% parms(3)td
% parms(4) N
% formula presa da https://www.sciencedirect.com/science/article/pii/S2405896318304543

K1 = parms(1)/(s*parms(2));
K2 = parms(1)*(1+(s*parms(3))/(1 + s*(parms(3)/parms(4))));

ClosedLoop = minreal(feedback(G,(K1+K2)));

t = 0:dt:100;
[y,t] = step(ClosedLoop,t);
J = sum(abs(y)*dt); 
end

