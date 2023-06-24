function peakgain = peakgain_research_dist(S)

% w_v = [10^-2:10:10^6];
% [mag,phs,Frequency] = bode(S, w_v);
% Magnitude = squeeze(mag);
% peakgain = max(Magnitude);
peakgain = getPeakGain(S);
end

