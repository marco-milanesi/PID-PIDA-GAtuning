function W = pid_bandwith(G,dt,parms)
s = tf('s');
K = parms(1)*(1 + 1/(parms(2)*s) + (parms(3)*s)/(1 + s*(parms(3)/parms(4)))); 
Loop = series(K,G);
S=allmargin(Loop);
W1=S.PMFrequency;
w_crossover = getGainCrossover(Loop,1);
switch length(w_crossover)
    case 1
        S = feedback(1,Loop);
        peakGain =peakgain_research(S);
        if peakGain > 1.40
            if peakGain > 1.45
                W1 = 0.5* W1;
            else
                W1 = 0.8*W1;
            end
        end
    otherwise
        W1 = 0.01;
end
W=1/W1;
end