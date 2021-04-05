function J  = pid_test_dist(G,dt,parms)
s = tf('s');
global minimun_IAE;
K = parms(1)*(1 +1/(parms(2)*s) + (parms(3)*s)/(1 + s*(0.0001))); 
ClosedLoop = minreal(feedback(G,K));

stable = allmargin(G*K).Stable;
t = 0:dt:100;
[y,t] = step(ClosedLoop,t);
J=sum(abs(y)*dt);
        
switch stable
    case 1
    otherwise 
        if J< minimun_IAE
            costFunction = costFunctionAddition(G,K);
            J = J+1.05*costFunction;
        end
end
end


