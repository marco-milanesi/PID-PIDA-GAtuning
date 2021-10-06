function W = pida_bandwith(G,dt,parms)
s = tf('s');
K = parms(1)*(1 + 1/(parms(2)*s) + (parms(3)*s)/(1 + s*(parms(3)/parms(6))) + (parms(4)*s^2)/((1 + s*(parms(4)/parms(5))))^2);
Loop = series(K,G);
S=allmargin(Loop);
W1=S.PMFrequency;

if S.Stable == 1
    S = feedback(1,Loop);
    peakGain = peakgain_research(S);
    bode(S)
    if peakGain > 1.40
        W1 = (peakGain - 1.40+1)*W1;
    end
    
else
    W1 = 10^-6;
end

W=1/W1;
end


