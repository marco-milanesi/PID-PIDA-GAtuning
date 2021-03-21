function [state, options,optchanged] = myfunpiddist(options,state,flag)
persistent historypiddist
persistent costpiddist
optchanged = false;

switch flag
 case 'init'
        historypiddist(:,:,1) = state.Population;
        costpiddist(:,1) = state.Score;
    case {'iter','interrupt'}
        ss = size(historypiddist,1);
        historypiddist(:,:,ss+1) = state.Population;
        costpiddist(:,ss+1) = state.Score;
    case 'done'
        ss = size(historypiddist,1);
        historypiddist(:,:,ss+1) = state.Population;
        costpiddist(:,ss+1) = state.Score;
        save history_pid_dist.mat historypiddist costpiddist
end
