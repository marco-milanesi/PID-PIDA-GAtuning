function J = dpitest(G,dt,parms)

s = tf('s');
% parms(1)Kp
% parms(2)Ti
% parms(3)Td
% parms(4) N

K1 = parms(1);
K2 = parms(1)/(s*parms(2));
K3 = parms(1)*((s*parms(3))/(1+(parms(3)*s/parms(4))));

ClosedLoop = minreal((G*(K1+K2))/(1+(G*K3)+(G*(K1+K2))));

a = allmargin(Loop).Stable
p =int8(a);
if (p == 0) 
    J = 1000000;
else
    t = 0:dt:50;
    [y,t] = step(ClosedLoop,t);
    J=sum(abs(1-y)*dt); 
end