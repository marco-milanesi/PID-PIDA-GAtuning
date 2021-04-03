function [state, options,optchanged] = myfun_i_pd(options,state,flag)
persistent history_i_pd 
persistent cost_i_pd
optchanged = false;

switch flag
 case 'init'
        history_i_pd(:,:,1) = state.Population;
        cost_i_pd(:,1) = state.Score;
    case {'iter','interrupt'}
        ss = size(history_i_pd,3);
        history_i_pd(:,:,ss+1) = state.Population;
        cost_i_pd(:,ss+1) = state.Score;
    case 'done'
        ss = size(history_i_pd,3);
        history_i_pd(:,:,ss+1) = state.Population;
        cost_i_pd(:,ss+1) = state.Score;
        save history_ipd.mat history_i_pd cost_i_pd
end