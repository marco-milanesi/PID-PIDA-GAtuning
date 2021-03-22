function [state, options,optchanged] = myfun_pid(options,state,flag)
persistent history_pid 
persistent cost_pid
optchanged = false;

switch flag
 case 'init'
        history_pid(:,:,1) = state.Population;
        cost_pid(:,1) = state.Score;
    case {'iter','interrupt'}
        ss = size(history_pid,3);
        history_pid(:,:,ss+1) = state.Population;
        cost_pid(:,ss+1) = state.Score;
    case 'done'
        ss = size(history_pid,3);
        history_pid(:,:,ss+1) = state.Population;
        cost_pid(:,ss+1) = state.Score;
        save history_pid.mat history_pid cost_pid
end