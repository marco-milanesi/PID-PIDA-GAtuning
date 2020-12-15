function J = dpitest(G,dt,parms)

s = tf('s');
% parms(1)Kp
% parms(2)Ti
% parms(3)Td
% parms(4) N

K1 = parms(1);
K2 = parms(1)/(s*parms(2));
K3 = parms(1)*(1+((s*parms(3))/(1+(parms(3)*s/parms(4)))));
ClosedLoop = (G*(K1+K2))/(1+G*(K2+K3));

t = 0:dt:20;
[y,t] = step(ClosedLoop,t);

% CTRLtf = K/(1+K*G);
% u = lsim(K,1-y,t);

%  Q = 1;
%  R = .001;
%  J = dt*sum(Q*(1-y(:)).^2 + R*u(:).^2)

J=sum(abs(1-y)*dt);