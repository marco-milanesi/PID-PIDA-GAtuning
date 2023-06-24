function peakgain = peakgain_research(S)
% w_v = [10^5:1:10^8];
% [mag,phs,Frequency] = bode(S, w_v);
% Magnitude = squeeze(mag);
% peakgain = max(Magnitude);
peakgain = getPeakGain(S);

end

