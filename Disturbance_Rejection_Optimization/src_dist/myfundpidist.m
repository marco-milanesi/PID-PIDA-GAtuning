function [state, options,optchanged] = myfundpidist(options,state,flag)
persistent history 
persistent cost
optchanged = false;

switch flag
 case 'init'
        history(:,:,1) = state.Population;
        cost(:,1) = state.Score;
    case {'iter','interrupt'}
        ss = size(history,1);
        history(:,:,ss+1) = state.Population;
        cost(:,ss+1) = state.Score;
    case 'done'
        ss = size(history,1);
        history(:,:,ss+1) = state.Population;
        cost(:,ss+1) = state.Score;
        save history_dpi_dist.mat history cost
end
