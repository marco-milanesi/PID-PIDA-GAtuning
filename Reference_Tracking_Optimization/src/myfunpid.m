function [state, options,optchanged] = myfunpid(options,state,flag)
persistent historypid
persistent costpid
optchanged = false;

switch flag
 case 'init'
        historypid(:,:,1) = state.Population;
        costpid(:,1) = state.Score;
    case {'iter','interrupt'}
        ss = size(historypid,1);
        historypid(:,:,ss+1) = state.Population;
        costpid(:,ss+1) = state.Score;
    case 'done'
        ss = size(historypid,1);
        historypid(:,:,ss+1) = state.Population;
        costpid(:,ss+1) = state.Score;
        save history_pid.mat historypid costpid
end
