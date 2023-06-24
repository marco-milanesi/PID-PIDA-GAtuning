function out_text = printout_TF(H)
% function out_text = printout_TF(H);
% 
% This function prints out as text the 
%    transfer function H that is passed 
%    to it. This is useful for printing 
%    transfer functions to a file for printing
%    or an answer list. It uses a function 
%    print_sym_fraction that will make sure to 
%    keep the highest order parameter in the 
%    denominator with a coefficient 1, for 
%    a proper transfer function. 
%
%    Brad Sutton,  bsutton@illinois.edu  
%    2020-04-01

syms s
[num_P,den_P] = tfdata(H);
Hsym = vpa(poly2sym((num_P),s)/poly2sym((den_P),s),2);
out_text = string((Hsym));