function [state, options,optchanged] = myfunpida(options,state,flag)
persistent historypida 
persistent costpida
optchanged = false;

switch flag
 case 'init'
        historypida(:,:,1) = state.Population;
        costpida(:,1) = state.Score;
    case {'iter','interrupt'}
        ss = size(historypida,1);
        historypida(:,:,ss+1) = state.Population;
        costpida(:,ss+1) = state.Score;
    case 'done'
        ss = size(historypida,1);
        historypida(:,:,ss+1) = state.Population;
        costpida(:,ss+1) = state.Score;
        save history_pida.mat historypida costpida
end
