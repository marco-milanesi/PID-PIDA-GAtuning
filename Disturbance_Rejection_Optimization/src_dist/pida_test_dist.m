function J = pida_test_dist(G,dt,parms)

s = tf('s');
global minimun_IAE;
global minimun_Stable;

K = parms(1)*(1 + 1/(parms(2)*s) + (parms(3)*s)/(1 + s*(0.0001)) + (parms(4)*s^2)/((1 + s*0.0001))^2); 
ClosedLoop = minreal(feedback(G,K));


stable = allmargin(G*K).Stable;
switch stable
    case 1
        t = 0:dt:100;
        [y,t] = step(ClosedLoop,t);
        J=sum(abs(y)*dt);
        if J< minimun_IAE
            minimun_IAE = J;
            minimun_Stable = stable;
        end
    otherwise 
        t = 0:dt:100;
        [y,t] = step(ClosedLoop,t);
        J=sum(abs(y)*dt);
        if J< minimun_IAE
            costFunction = costFunctionAddition(G,K);
            J = J+costFunction;
        end
end
end