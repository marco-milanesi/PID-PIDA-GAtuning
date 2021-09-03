function peakgain = peakgain_research(S)



w_v = [0.1:10^-1:10^5];
[mag,phs,Frequency] = bode(S, w_v);
Magnitude = squeeze(mag);
peakgain = max(Magnitude);

end

