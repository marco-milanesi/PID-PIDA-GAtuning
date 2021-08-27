function peakgain = peakgain_research_dist(S)


<<<<<<< HEAD
w_v = [0.1:10^-1:10^5];
=======
w_v = [10^-2:10^-1:10^5];
>>>>>>> 24efd043710472ca73c6f47b66e8426e84f7c74d
[mag,phs,Frequency] = bode(S, w_v);
Magnitude = squeeze(mag);
peakgain = max(Magnitude);

end

