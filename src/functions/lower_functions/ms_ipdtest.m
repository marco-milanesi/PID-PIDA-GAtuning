function J = ms_ipdtest(G,dt,parms,Ms)
global minimum_IAE;
s = tf('s');
% parms(1)kp
% parms(2)ti
% parms(3)td
% parms(4) N
% formula presa da https://www.sciencedirect.com/science/article/pii/S2405896318304543


K1 = parms(1)/(s*parms(2));
K2 = parms(1)*(1+(s*parms(3))/(1 + s*(parms(3)/parms(4))));
 
ClosedLoop1 = feedback(G,K2);
Loop = series(K1,ClosedLoop1);
ClosedLoop = feedback(Loop,1);

stable = allmargin(Loop).Stable;
t = 0:dt:100;
[y,t] = step(ClosedLoop,t);
J1=sum(abs(1-y)*dt);
        
switch stable
    case 1
        S = feedback(1,Loop);
        peakGain = peakgain_research(S);
        
        if peakGain > Ms
            if peakGain > Ms + 0.05
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

