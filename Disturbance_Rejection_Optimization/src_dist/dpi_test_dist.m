function J = dpi_test_dist(G,dt,parms)

s = tf('s');
% parms(1)Kp
% parms(2)Ti
% parms(3)Td
% parms(4) N

K1 = parms(1);
K2 = parms(1)/(s*parms(2));
K3 = parms(1)*((s*parms(3))/(1+(parms(3)*s/parms(4))));
ClosedLoop =minreal(feedback(G,K1+K2+K3));
ClosedLoop1 = feedback(G,K3);
t = 0:dt:100;
[y,t] = step(ClosedLoop,t);
J=sum(abs(y)*dt); 
end

