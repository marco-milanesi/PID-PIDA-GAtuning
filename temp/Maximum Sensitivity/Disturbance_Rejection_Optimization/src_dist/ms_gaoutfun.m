function [state,options,optchanged] = ms_gaoutfun(options,state,flag)
    persistent state_record 
    if isempty(state_record)
      state_record = struct('Population', {}, 'Best', {}, 'Score', {});
    end
    if nargin == 0
      state = state_record;
      options = [];
      optchanged = [];
    else
      state_record(end+1) = struct('Population', state.Population, 'Best', state.Best', 'Score', state.Score);
      optchanged = false;
    end

