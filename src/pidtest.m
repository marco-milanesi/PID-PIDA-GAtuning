function J = pidtest(G,dt,parms)

s = tf('s');

K = parms(1)*(1 + parms(2)/s + (parms(3)*s)/(1 + s*(parms(3)/parms(4)))); 
Loop = series(K,G)
ClosedLoop = feedback(Loop,1)
a = allmargin(Loop).Stable
p =int8(a);
if (p == 0) 
    J = 1000000;
else
    t = 0:dt:50;
    [y,t] = step(ClosedLoop,t);
    J=sum(abs(1-y)*dt); 
end

