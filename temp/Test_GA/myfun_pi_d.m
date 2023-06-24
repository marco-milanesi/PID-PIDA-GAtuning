function [state_PI_D, options_PI_D,optchanged] = myfun_pi_d(options_PI_D,state_PI_D,flag_PI_D)
persistent history_pi_d 
persistent cost_pi_d
optchanged = false;

switch flag_PI_D;
 case 'init'
        history_pi_d(:,:,1) = state_PI_D.Population;
        cost_pi_d(:,1) = state_PI_D.Score;
    case {'iter','interrupt'}
        ss = size(history_pi_d,1);
        history_pi_d(:,:,ss+1) = state_PI_D.Population;
        cost_pi_d(:,ss+1) = state_PI_D.Score;
    case 'done'
        ss = size(history_pi_d,1);
        history_pi_d(:,:,ss+1) = state_PI_D.Population;
        cost_pi_d(:,ss+1) = state_PI_D.Score;
        save history_pi_d.mat history_pi_d cost_pi_d
end
