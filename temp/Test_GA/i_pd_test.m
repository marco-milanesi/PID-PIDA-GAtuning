function J = i_pd_test(G,dt,parms)

s = tf('s');
% parms(1)kp
% parms(2)ti
% parms(3)td
% parms(4) N
% formula presa da https://www.sciencedirect.com/science/article/pii/S2405896318304543


K1 = parms(1)/(s*parms(2));
K2 = parms(1)*(1+parms(3)*s/(1+.001*s));
 
ClosedLoop1 = feedback(G,K2);
Loop = series(K1,ClosedLoop1);
ClosedLoop = feedback(Loop,1);


t = 0:dt:100;
[y,t] = step(ClosedLoop,t);
J=sum(abs(1-y)*dt);


end

