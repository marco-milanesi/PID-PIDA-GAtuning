function peakgain = peakgain_research(S)
global Delay

if Delay == 0
    peakgain = getPeakGain(S);
else
    w_v = [10^-1:10:10^5];
    [mag,~,~] = bode(S, w_v);
    Magnitude = squeeze(mag);
    peakgain = max(Magnitude);

end

