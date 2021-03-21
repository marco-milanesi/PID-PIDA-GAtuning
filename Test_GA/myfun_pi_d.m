function [state_PI_D, options_PI_D,optchanged] = myfun_pi_d(options_PI_D,state_PI_D,flag_PI_D)
persistent history_dpi 
persistent cost_dpi
optchanged = false;

switch flag_PI_D;
 case 'init'
        history_dpi(:,:,1) = state_PI_D.Population;
        cost_dpi(:,1) = state_PI_D.Score;
    case {'iter','interrupt'}
        ss = size(history_dpi,1);
        history_dpi(:,:,ss+1) = state_PI_D.Population;
        cost_dpi(:,ss+1) = state_PI_D.Score;
    case 'done'
        ss = size(history_dpi,1);
        history_dpi(:,:,ss+1) = state_PI_D.Population;
        cost_dpi(:,ss+1) = state_PI_D.Score;
        save history_dpi.mat history_dpi cost_dpi
end
