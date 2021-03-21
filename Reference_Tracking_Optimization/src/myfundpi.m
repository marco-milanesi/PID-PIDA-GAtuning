function [state, options,optchanged] = myfundpi(options,state,flag)
persistent historydpi 
persistent costdpi 
optchanged = false;

switch flag
 case 'init'
        historydpi(:,:,1) = state.Population;
        costdpi (:,1) = state.Score;
    case {'iter','interrupt'}
        ss = size(historydpi,1);
        historydpi(:,:,ss+1) = state.Population;
        costdpi (:,ss+1) = state.Score;
    case 'done'
        ss = size(historydpi,1);
        historydpi(:,:,ss+1) = state.Population;
        costdpi (:,ss+1) = state.Score;
        save history_dpi.mat historydpi costdpi 
end

