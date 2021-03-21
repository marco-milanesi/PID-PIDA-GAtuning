function [state, options,optchanged] = myfunipddist(options,state,flag)
persistent historyipddist 
persistent costipddist 
optchanged = false;

switch flag
 case 'init'
        historyipddist(:,:,1) = state.Population;
        costipddist (:,1) = state.Score;
    case {'iter','interrupt'}
        ss = size(historyipddist,1);
        historyipddist(:,:,ss+1) = state.Population;
        costipddist (:,ss+1) = state.Score;
    case 'done'
        ss = size(historyipddist,1);
        historyipddist(:,:,ss+1) = state.Population;
        costipddist (:,ss+1) = state.Score;
        save history_ipd_dist.mat historyipddist costipddist 
end
