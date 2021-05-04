function J = ms_pida_test_dist(G,dt,parms)
s = tf('s');
global minimum_IAE;
K = parms(1)*(1 + 1/(parms(2)*s) + (parms(3)*s/(1 + s*(parms(3)/parms(6)))) + (parms(4)*s^2)/(1 + s*(parms(4)/parms(5)))^2); 
ClosedLoop = minreal(feedback(G,K));

stable = allmargin(G*K).Stable;
t = 0:dt:100;
[y,t] = step(ClosedLoop,t);
J1=sum(abs(y)*dt);
Loop = series(K,G);
switch stable
    case 1
        S = feedback(1,Loop);
        peakGain = getPeakGain(S);
        if peakGain > 2 && peakGain < 1.4
            J1 = J1 + 0.1*peakGain;
        end
        
        if J1< minimum_IAE
            minimum_IAE=J1;
        end
        
    otherwise
        if J1< minimum_IAE
            costFunction = ms_costFunctionAddition(Loop);
            J1 = J1+0.1*costFunction;
        end
end

J=J1;


end


