function [str_Num,str_Den] = tf2string(Numerator,Denominator)
    Gnum = tf(Numerator,1);
    str_Num = printout_TF(Gnum); 
    str_Num=regexprep(str_Num,'[()]','');

    Gden = tf(Denominator,1);
    str_Den = printout_TF(Gden);
    str_Den = erase(str_Den,"/ (1.0)");
    str_Den=regexprep(str_Den,'[()]','');
end

