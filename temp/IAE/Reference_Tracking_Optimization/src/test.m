function [] = test()

s = tf('s');
G = (1/(1+0.1*s))*exp(-s);
parms(1)=1;
parms(2)=1;
parms(3)=0;
parms(4)=1;
K = parms(1)*(1 + parms(2)/s + (parms(3)*s)/(1 + s*(parms(3)/parms(4)))); 
Loop = series(K,G)
ClosedLoop = feedback(Loop,1)

end

