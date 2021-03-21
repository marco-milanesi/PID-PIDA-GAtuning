function [state, options,optchanged] = myfundpidist(options,state,flag)
persistent historydpidist 
persistent costdpidist
optchanged = false;

switch flag
 case 'init'
        historydpidist(:,:,1) = state.Population;
        costdpidist(:,1) = state.Score;
    case {'iter','interrupt'}
        ss = size(historydpidist,1);
        historydpidist(:,:,ss+1) = state.Population;
        costdpidist(:,ss+1) = state.Score;
    case 'done'
        ss = size(historydpidist,1);
        historydpidist(:,:,ss+1) = state.Population;
        costdpidist(:,ss+1) = state.Score;
        save history_dpi_dist.mat historydpidist costdpidist
end
