function J = pida_test_dist(G,dt,parms)

s = tf('s');

K = parms(1)*(1 + 1/(parms(2)*s) + (parms(3)*s)/(1 + s*(0.0001)) + (parms(4)*s^2)/((1 + s*0.0001))^2)); 
ClosedLoop = minreal(feedback(G,K));

t = 0:dt:100;
[y,t] = step(ClosedLoop,t);
J=sum(abs(y)*dt); 
end