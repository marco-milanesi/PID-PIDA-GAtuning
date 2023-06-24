function str_fraction = print_sym_fraction(in_sym_fraction);
% function str_fraction = print_sym_fraction(in_sym_fraction);
%
% This function prints out a symbolic transfer function
%    in proper form as a text output. Proper form
%    is with a coefficient of 1 in the highest order
%    term in the denominator.
%
%    Brad Sutton,  bsutton@illinois.edu  
%    2020-04-01


[num_init, denom_init] = numden(in_sym_fraction);

[num_coef, num_term] = coeffs(num_init);
[den_coef, den_term] = coeffs(denom_init);
 
% Making sure that the first term of the denominator has a 1 coefficient
num_coef = num_coef./(den_coef(1));
den_coef = den_coef./(den_coef(1));

str_fraction = [];
for ii = 1:(length(num_coef))
    if (ii == 1)
        str_fraction = sprintf('(');
    else
        str_fraction = sprintf('%s +',str_fraction);
    end
    
    if (ii == length(num_coef))
        str_fraction = sprintf('%s %s',str_fraction, string(num_coef(ii)));  % Last term is 1
    else 
        if (num_coef(ii) == 1)
            str_fraction = sprintf('%s %s',str_fraction,string(num_term(ii)));
        else
            str_fraction = sprintf('%s %s%s',str_fraction,string(num_coef(ii)),string(num_term(ii)));
        end    
    end
end

str_fraction = sprintf('%s)',str_fraction);

% for ii = 1:(length(den_coef))
%     if (ii == 1)
%         str_fraction = sprintf('%s(',str_fraction);
%     else
%         str_fraction = sprintf('%s +',str_fraction);
%     end
%     if (ii == length(den_coef))
%         str_fraction = sprintf('%s %s)',str_fraction, string(den_coef(ii)));  % Last term is 1
%     else 
%         if (den_coef(ii) == 1)
%             str_fraction = sprintf('%s %s',str_fraction,string(den_term(ii)));
%         else
%             str_fraction = sprintf('%s %s%s',str_fraction,string(den_coef(ii)),string(den_term(ii)));
%         end    
%     end
% end



