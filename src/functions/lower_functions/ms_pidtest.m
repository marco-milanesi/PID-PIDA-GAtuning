function J = ms_pidtest(G,dt,parms,Ms)
global minimum_IAE
s = tf('s');
K = parms(1)*(1 + 1/(parms(2)*s) + (parms(3)*s)/(1 + s*(parms(3)/parms(4))));
Loop = series(K,G);
ClosedLoop = feedback(Loop,1);

stable = allmargin(G*K).Stable;
t = 0:dt:100;

[y,t] = step(ClosedLoop,t);
J1=sum(abs(1-y)*dt);

switch stable
    case 1
        S = feedback(1,Loop);
        peakGain =peakgain_research(S);

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
            J1 = 10+0.1*costFunction;
        end
end
J=J1;

end

