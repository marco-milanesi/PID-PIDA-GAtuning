function J = pida_test_dist(G,dt,parms)
s = tf('s');
global minimun_IAE;
K = parms(1)*(1 + 1/(parms(2)*s) + (parms(3)*s)/(1 + s*(0.0001)) + (parms(4)*s^2)/((1 + s*(parms(4)/parms(5))))^2); 
ClosedLoop = minreal(feedback(G,K));

stable = allmargin(G*K).Stable;
t = 0:dt:100;
[y,t] = step(ClosedLoop,t);
J1=sum(abs(y)*dt);
        
switch stable
    case 1
        if J1< minimun_IAE
           minimun_IAE=J1;
        end
    otherwise 
        if J1< minimun_IAE
            costFunction = costFunctionAddition(G,K);
            J1 = J1+0.1*costFunction;
        end
end

J=J1;


end


