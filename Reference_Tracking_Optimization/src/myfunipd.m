function [state, options,optchanged] = myfunipd(options,state,flag)
persistent historyipd 
persistent costipd 
optchanged = false;

switch flag
 case 'init'
        historyipd(:,:,1) = state.Population;
        costipd(:,1) = state.Score;
    case {'iter','interrupt'}
        ss = size(historyipd,1);
        historyipd(:,:,ss+1) = state.Population;
        costipd(:,ss+1) = state.Score;
    case 'done'
        ss = size(historyipd,1);
        historyipd(:,:,ss+1) = state.Population;
        costipd(:,ss+1) = state.Score;
        save history_ipd.mat historyipd costipd
end
