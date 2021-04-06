% PI-D Controller
function J = dpitest(G,dt,parms)
global minimum_IAE;
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
stable = allmargin(Loop).Stable;
t = 0:dt:100;
[y,t] = step(ClosedLoop,t);
J1=sum(abs(y)*dt);
        
switch stable
    case 1
        if J1< minimum_IAE
           minimum_IAE=J1;
        end
    otherwise 
        if J1< minimum_IAE
            costFunction = costFunctionAddition(Loop);
            J1 = J1+0.1*costFunction;
        end
end

J=J1;


end