function NoErrorCheck = checkInputValidity(Numerator, Denominator, popmenuController_choice, popmenuMaxGen_choice, popmenuPopSize_choice, Delay)
% This function checks the validity of the input arguments
% and returns NoErrorCheck = 1 if all inputs are valid, and NoErrorCheck = 0 otherwise.

    if isnan(Numerator)
        NoErrorCheck = 0;
        msgbox('Please insert the numerator', 'Error', 'error');
        return;
    elseif isnan(Denominator)
        NoErrorCheck = 0;
        msgbox('Please insert the denominator', 'Error', 'error');
        return;
    elseif popmenuController_choice == 0
        NoErrorCheck = 0;
        msgbox('Please choose the controller', 'Error', 'error');
        return;
    elseif popmenuMaxGen_choice == 0
        NoErrorCheck = 0;
        msgbox('Please select Maximum Generation', 'Error', 'error');
        return;
    elseif popmenuPopSize_choice == 0
        NoErrorCheck = 0;
        msgbox('Please select Population Size', 'Error', 'error');
        return;
    elseif isnan(Delay)
        NoErrorCheck = 0;
        msgbox('Please insert the delay, (0 = no delay)', 'Error', 'error');
        return;
    else
        NoErrorCheck = 1;
    end
end