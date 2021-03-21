function [state, options,optchanged] = myfunpidadist(options,state,flag)
persistent historypidadist 
persistent costpidadist
optchanged = false;

switch flag
 case 'init'
        historypidadist (:,:,1) = state.Population;
        costpidadist(:,1) = state.Score;
    case {'iter','interrupt'}
        ss = size(historypidadist ,1);
        historypidadist (:,:,ss+1) = state.Population;
        costpidadist(:,ss+1) = state.Score;
    case 'done'
        ss = size(historypidadist ,1);
        historypidadist (:,:,ss+1) = state.Population;
        costpidadist(:,ss+1) = state.Score;
        save history_pida_dist.mat historypidadist costpidadist
end
