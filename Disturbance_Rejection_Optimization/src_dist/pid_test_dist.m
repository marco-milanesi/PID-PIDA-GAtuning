function J  = pid_test_dist(G,dt,parms)
s = tf('s');

K = parms(1)*(1 +1/(parms(2)*s) + (parms(3)*s)/(1 + s*(0.0001))); 
ClosedLoop = minreal(feedback(G,K));


t = 0:dt:100;
[y,t] = step(ClosedLoop,t);

costFunction = costFunctionAddition(G,K);
switch costFunction
    case 0
        J=sum(abs(y)*dt);
    otherwise
        J=costFunction*1.2;
end

end


