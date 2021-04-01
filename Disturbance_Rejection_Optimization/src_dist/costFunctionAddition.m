function costFunctionAddition = costFunctionAddition(G,C)

wc = getGainCrossover(C*G,1); %Find the 0dB crossover frequencies

switch length(wc)
    case 1
        costFunctionAddition=0; % C*G is stable
    otherwise
        % C*G is unstable
        w_v = [10^-1:10^-1:10^6];    % Vector Of Frequencies
        [mag,phs,Frequency] = bode(C*G, w_v);
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

