% PI-D Controller
function J = ms_dpitest(G,dt,parms,Ms)
global minimum_IAE;
s = tf('s');
% parms(1)Kp
% parms(2)Ti
% parms(3)Td
% parms(4) N

K1 = parms(1);
K2 = parms(1)/(s*parms(2));
K3 = parms(1)*((s*parms(3))/(1+(parms(3)/parms(4))*s));

ClosedLoop = ((G*(K1+K2))/(1+(G*K3)+(G*(K1+K2))));
Loop = series((K1+K2),feedback(G,K3));
stable = allmargin(Loop).Stable;
t = 0:dt:100;
[y,t] = step(ClosedLoop,t);
J1=sum(abs(1-y)*dt);
        
switch stable
    case 1
        S = feedback(1,Loop);
        peakGain = peakgain_research(S);

        if peakGain > Ms
            if peakGain > Ms+0.05
                J1 = J1 + 100*peakGain;
            else
                J1 = J1 + 10*peakGain;
            end
        end
        if J1< minimum_IAE
            minimum_IAE=J1;
        end
        
    otherwise
        if J1< minimum_IAE
            costFunction = ms_costFunctionAddition(Loop);
            J1 = 100*J1+0.1*costFunction;
        end
end

J=J1;


end