function costFunctionAddition = costFunctionAddition(Loop)

wc = getGainCrossover(Loop,1); %Find the 0dB crossover frequencies

switch length(wc)
    case 1
        costFunctionAddition = 0; 
    otherwise
        w_v = [10^-2:10^-1:10^6];    % Vector Of Frequencies
        [mag,phs,Frequency] = bode(Loop, w_v);
        Magnitude = squeeze(mag);
        Phase = squeeze(phs);
        T = table(Frequency,Magnitude,Phase);

         for i = 1:length(Frequency)-1
            if Frequency(i) > wc(2)
                costFunctionAddition=max(Magnitude(i:length(Magnitude)));
                break
            end
         end
end
end

