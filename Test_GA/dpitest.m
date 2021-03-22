% PI-D Controller
function J = dpitest(G,dt,parms)

s = tf('s');
% parms(1)Kp
% parms(2)Ti
% parms(3)Td
% parms(4) N

K1 = parms(1);
K2 = parms(1)/(s*parms(2));
K3 = parms(1)*((s*parms(3))/(1+(0.0001)));

ClosedLoop = ((G*(K1+K2))/(1+(G*K3)+(G*(K1+K2))));
Loop = series((K1+K2),feedback(G,K3));

t = 0:dt:100;
[y,t] = step(ClosedLoop,t);
J=sum(abs(1-y)*dt);


end