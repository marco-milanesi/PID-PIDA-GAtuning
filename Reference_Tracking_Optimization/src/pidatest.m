function J = pidatest(G,dt,parms)

s = tf('s');

K = parms(1)*(1 + 1/(s*parms(2)) + (parms(3)*s)/(1 + s*(0.0001)) + (parms(4)*s^2)/((1 + s*0.0001)^2)); 
Loop = series(K,G);
ClosedLoop = feedback(Loop,1);

t = 0:dt:100;
[y,t] = step(ClosedLoop,t);
J=sum(abs(1-y)*dt);

end


