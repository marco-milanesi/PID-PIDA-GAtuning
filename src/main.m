function varargout = main(varargin)
% MAIN MATLAB code for main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main

% Last Modified by GUIDE v2.5 11-Apr-2023 12:58:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_OpeningFcn, ...
                   'gui_OutputFcn',  @main_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before main is made visible.
function main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main (see VARARGIN)

% Choose default command line output for main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main wait for user response (see UIRESUME)
% uiwait(handles.figure1);

global Ms_selected
global popmenu_choice
global Task_selected
global popmenuPopSize_choice
global popmenuMaxGen_choice
global Numerator
global Denominator
global NoErrorCheck
global minimum_IAE;
global Delay

minimum_IAE=100;
Ms_selected = 1.4;
popmenu_choice = 0;
Task_selected = 1;
popmenuPopSize_choice = 0;
popmenuMaxGen_choice = 0;
Numerator = NaN;
Denominator = NaN;
Delay = NaN;
NoErrorCheck = 0;

% --- Outputs from this function are returned to the command line.
function varargout = main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu_Controller.
function popupmenu_Controller_Callback(hObject, eventdata, handles)
global popmenuController_choice
contents=cellstr(get(hObject,'String'));
pop_choice_temp=contents(get(hObject,'Value'));
if(strcmp(pop_choice_temp,'PID'))
    popmenuController_choice = 1;
elseif (strcmp(pop_choice_temp,'I-PD'))
    popmenuController_choice = 2;
elseif (strcmp(pop_choice_temp,'PI-D'))
    popmenuController_choice = 3;
elseif (strcmp(pop_choice_temp,'PIDA'))
    popmenuController_choice = 4;
else
    popmenuController_choice = 0;
end

% --- Executes during object creation, after setting all properties.
function popupmenu_Controller_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_Controller (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Ms14.
function Ms14_Callback(hObject, eventdata, handles)
global Ms_selected
Ms_selected = 1.4;


% --- Executes on button press in Ms2.
function Ms2_Callback(hObject, eventdata, handles)
global Ms_selected
Ms_selected = 2;


% --- Executes on button press in SetPoint.
function SetPoint_Callback(hObject, eventdata, handles)
global Task_selected
Task_selected = 1;


% --- Executes on button press in LoadDisturbance.
function LoadDisturbance_Callback(hObject, eventdata, handles)
global Task_selected
Task_selected = 2;


% --- Executes on selection change in PopSize_popmenu.
function PopSize_popmenu_Callback(hObject, eventdata, handles)
global popmenuPopSize_choice
contents=cellstr(get(hObject,'String'));
pop_choice_temp1=contents(get(hObject,'Value'));
if(strcmp(pop_choice_temp1,'10'))
    popmenuPopSize_choice = 10;
elseif (strcmp(pop_choice_temp1,'50'))
    popmenuPopSize_choice = 50;
elseif (strcmp(pop_choice_temp1,'100'))
    popmenuPopSize_choice = 100;
elseif (strcmp(pop_choice_temp1,'200'))
    popmenuPopSize_choice = 200;
elseif (strcmp(pop_choice_temp1,'500'))
    popmenuPopSize_choice = 500;
else
    popmenuPopSize_choice = 0;
end


% --- Executes during object creation, after setting all properties.
function PopSize_popmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PopSize_popmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in MaxGeneration_popmenu.
function MaxGeneration_popmenu_Callback(hObject, eventdata, handles)
global popmenuMaxGen_choice
contents=cellstr(get(hObject,'String'));
pop_choice_temp2=contents(get(hObject,'Value'));
if(strcmp(pop_choice_temp2,'10'))
    popmenuMaxGen_choice = 10;
elseif (strcmp(pop_choice_temp2,'200'))
    popmenuMaxGen_choice = 200;
elseif (strcmp(pop_choice_temp2,'500'))
    popmenuMaxGen_choice = 500;
elseif (strcmp(pop_choice_temp2,'1000'))
    popmenuMaxGen_choice = 1000;
else
    popmenuMaxGen_choice = 0;
end




% --- Executes during object creation, after setting all properties.
function MaxGeneration_popmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MaxGeneration_popmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Numerator_Callback(hObject, eventdata, handles)
global Numerator
userNumeratorInput = string(get(handles.edit_Numerator,'String'));
tmp = strsplit(userNumeratorInput,',');
Numerator = str2double(tmp);


% --- Executes during object creation, after setting all properties.
function edit_Numerator_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Numerator (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_Denominator_Callback(hObject, eventdata, handles)
global Denominator
userDenominatorInput = string(get(handles.edit_Denominator,'String'));
tmp = strsplit(userDenominatorInput,',');
Denominator = str2double(tmp);

function edit_Delay_Callback(hObject, eventdata, handles)
global Delay
tmp_delay = string(get(handles.edit_Delay,'String'));
Delay = str2double(tmp_delay);

% --- Executes during object creation, after setting all properties.
function edit_Denominator_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Denominator (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushButton_Start.
function pushButton_Start_Callback(hObject, eventdata, handles)
global Numerator
global Denominator
global popmenuController_choice
global Ms_selected
global Task_selected
global popmenuPopSize_choice
global popmenuMaxGen_choice
global Delay

NoErrorCheck = checkInputValidity(Numerator, Denominator, popmenuController_choice, popmenuMaxGen_choice, popmenuPopSize_choice, Delay);

analized = struct;


%time step
dt = 0.0001;
global minimum_IAE;
minimum_IAE = 1000; 
% If no error are encountered
if NoErrorCheck
   % Process Transfer Function
   G = tf(Numerator,Denominator)
   analized.systemTransferFunction = G;
   PopSize = popmenuPopSize_choice;
   MaxGeneration = popmenuMaxGen_choice;
   Ms = Ms_selected;

   % Process Transfer Function
   Gnum = tf(Numerator,1);
   str_Gnum = printout_TF(Gnum); str_Gnum = erase(str_Gnum,"/ ( 1)");
   str_Gnum=regexprep(str_Gnum,'[()]','');
   set(handles.Gnum_text,'String',str_Gnum);
   Gden = tf(Denominator,1);
   str_Gden = printout_TF(Gden); str_Gden = erase(str_Gden,"/ ( 1)");
   str_Gden=regexprep(str_Gden,'[()]','');
   set(handles.Gden_text,'String',str_Gden);

   switch popmenuController_choice
       case 1
           % PID Controller
           switch Task_selected
               case 1
                   % Set Point Following
                   set(handles.task_selected_text,'String','PID - Setpoint Following')
                   [analized, ClosedLoop_PID_sp, Loop_PID_sp] = pid_setpoint(PopSize, MaxGeneration, dt, G, Ms);
                   analized.Name = 'PID - Setpoint Following';
                   axes(handles.stepResponse_plot); plot_closedloop_stepresponse(ClosedLoop_PID_sp,analized.Name);
                   axes(handles.bode_plot); plot_bodeplot(Loop_PID_sp);
                   axes(handles.sensitivity_plot); plot_sensitivity(Loop_PID_sp);
                   % Controller parameter text plot
                   set(handles.Kp_text,'String',string(analized.pid.Kp))
                   set(handles.Ti_text,'String',string(analized.pid.Ti))
                   set(handles.Td_text,'String',string(analized.pid.Td))
                   set(handles.N_text,'String',string(analized.pid.N))
                   set(handles.Ta_text,'String',"/")
                   set(handles.alpha_text,'String',"/")
                   % Controller Transfer Function text plot
                   [str_NumPID,str_DenPID] = tf2string(analized.Controller.pid.Numerator,analized.Controller.pid.Denominator);
                   set(handles.Cnum_text,'String',str_NumPID);
                   set(handles.Cden_text,'String',str_DenPID);
                   set(handles.C2num_text,'String',"[/]");
                   set(handles.C2den_text,'String',"[/]");
                   set(handles.C3num_text,'String',"[/]");
                   set(handles.C3den_text,'String',"[/]");
                   % Frequency characteristics text plot
                   [pid_gainMargin,pid_phaseMargin] = margin(analized.Loop.pid);
                   set(handles.Ms_text,'String',string(analized.Sensitivity.pid));
                   set(handles.Gm_text,'String',string(pid_gainMargin));
                   set(handles.Pm_text,'String',string(pid_phaseMargin));
                   % Step Response characteristics text plot
                   set(handles.IAE_text,'String',string(analized.pid.IAE));
                   set(handles.undershoot_text,'String',string(analized.pid.undershoot));
                   set(handles.settlingtime_text,'String',string(analized.pid.settlingtime));
                   set(handles.overshoot_text,'String',string(analized.pid.overshoot));
                   set(handles.risetime_text,'String',string(analized.pid.Risetime));
                   % Disable
                   set(handles.insert_tf_button,'Enable','off')
                   set(handles.pushButton_Start,'Enable','off') 
                   set(handles.popupmenu_Controller,'Enable','off')
                   set(handles.edit_Numerator,'Enable','off')
                   set(handles.edit_Denominator,'Enable','off')
                   set(handles.edit_Delay,'Enable','off')
                   set(handles.Ms14,'Enable','off')
                   set(handles.Ms2,'Enable','off')
                   set(handles.SetPoint,'Enable','off')
                   set(handles.LoadDisturbance,'Enable','off')
                   set(handles.PopSize_popmenu,'Enable','off')
                   set(handles.MaxGeneration_popmenu,'Enable','off')      
               case 2
                   % Load Disturbance Rejection
                   set(handles.task_selected_text,'String','PID - Load Disturbance Rejection')
                   [analized, Loop_PID_ld, Disturb_PID_ld] = pid_loaddisturbance(PopSize, MaxGeneration, dt, G, Ms);
                   analized.Name = 'PID - Load Disturbance Rejection';
                   axes(handles.stepResponse_plot); plot_closedloop_stepresponse(Disturb_PID_ld,analized.Name);
                   axes(handles.bode_plot); plot_bodeplot(Loop_PID_ld);
                   axes(handles.sensitivity_plot); plot_sensitivity(Loop_PID_ld);
                   % Controller parameter text plot
                   set(handles.Kp_text,'String',string(analized.pid_dist.Kp))
                   set(handles.Ti_text,'String',string(analized.pid_dist.Ti))
                   set(handles.Td_text,'String',string(analized.pid_dist.Td))
                   set(handles.N_text,'String',string(analized.pid_dist.N))
                   set(handles.Ta_text,'String',"/")
                   set(handles.alpha_text,'String',"/")
                   % Controller Transfer Function text plot
                   [str_NumPID,str_DenPID] = tf2string(analized.Controller.pid.Numerator,analized.Controller.pid.Denominator);
                   set(handles.Cnum_text,'String',str_NumPID);
                   set(handles.Cden_text,'String',str_DenPID);
                   set(handles.C2num_text,'String',"[/]");
                   set(handles.C2den_text,'String',"[/]");
                   set(handles.C3num_text,'String',"[/]");
                   set(handles.C3den_text,'String',"[/]");
                   % Frequency characteristics text plot
                   [pid_gainMargin,pid_phaseMargin] = margin(analized.Loop.pid);
                   set(handles.Ms_text,'String',string(analized.Sensitivity.pid));
                   set(handles.Gm_text,'String',string(pid_gainMargin));
                   set(handles.Pm_text,'String',string(pid_phaseMargin));
                   % Load disturbance characteristics text plot
                   set(handles.IAE_text,'String',string(analized.pid_dist.IAE));
                   set(handles.undershoot_text,'String',string(analized.pid_dist.undershoot));
                   set(handles.settlingtime_text,'String',string(analized.pid_dist.settlingtime));
                   set(handles.overshoot_text,'String',string(analized.pid_dist.overshoot));
                   set(handles.risetime_text,'String',string(analized.pid_dist.Risetime));
                   % Disable
                   set(handles.insert_tf_button,'Enable','off')
                   set(handles.pushButton_Start,'Enable','off') 
                   set(handles.popupmenu_Controller,'Enable','off')
                   set(handles.edit_Numerator,'Enable','off')
                   set(handles.edit_Denominator,'Enable','off')
                   set(handles.edit_Delay,'Enable','off')
                   set(handles.Ms14,'Enable','off')
                   set(handles.Ms2,'Enable','off')
                   set(handles.SetPoint,'Enable','off')
                   set(handles.LoadDisturbance,'Enable','off')
                   set(handles.PopSize_popmenu,'Enable','off')
                   set(handles.MaxGeneration_popmenu,'Enable','off') 
           end
       case 2
           % I-PD Controller
           switch Task_selected
               case 1
                   % Set Point Following
                   set(handles.task_selected_text,'String','I-PD - Setpoint Following')
                   [analized, ClosedLoop_IPD_sp, Loop_IPD_sp] = ipd_setpoint(PopSize, MaxGeneration, dt, G, Ms);
                   analized.Name = 'I-PD - Setpoint Following';
                   axes(handles.stepResponse_plot); plot_closedloop_stepresponse(ClosedLoop_IPD_sp,analized.Name);
                   axes(handles.bode_plot); plot_bodeplot(Loop_IPD_sp);
                   axes(handles.sensitivity_plot); plot_sensitivity(Loop_IPD_sp);
                   % Controller parameter text plot
                   set(handles.Kp_text,'String',string(analized.ipd.Kp))
                   set(handles.Ti_text,'String',string(analized.ipd.Ti))
                   set(handles.Td_text,'String',string(analized.ipd.Td))
                   set(handles.N_text,'String',string(analized.ipd.N))
                   set(handles.Ta_text,'String',"/")
                   set(handles.alpha_text,'String',"/")
                   % Controller Transfer Function text plot
                   [str_NumI_PD1,str_DenI_PD1] = tf2string(analized.Controller.ipd.K1.Numerator,analized.Controller.ipd.K1.Denominator);
                   set(handles.Cnum_text,'String',str_NumI_PD1);
                   set(handles.Cden_text,'String',str_DenI_PD1);
                   [str_NumI_PD2,str_DenI_PD2] = tf2string(analized.Controller.ipd.K2.Numerator,analized.Controller.ipd.K2.Denominator);
                   set(handles.C2num_text,'String',str_NumI_PD2);
                   set(handles.C2den_text,'String',str_DenI_PD2);
                   set(handles.C3num_text,'String',"[/]");
                   set(handles.C3den_text,'String',"[/]");
                   % Frequency characteristics text plot
                   [ipd_gainMargin,ipd_phaseMargin] = margin(analized.Loop.ipd);
                   set(handles.Ms_text,'String',string(analized.Sensitivity.ipd));
                   set(handles.Gm_text,'String',string(ipd_gainMargin));
                   set(handles.Pm_text,'String',string(ipd_phaseMargin));
                   % Step Response characteristics text plot
                   set(handles.IAE_text,'String',string(analized.ipd.IAE));
                   set(handles.undershoot_text,'String',string(analized.ipd.undershoot));
                   set(handles.settlingtime_text,'String',string(analized.ipd.settlingtime));
                   set(handles.overshoot_text,'String',string(analized.ipd.overshoot));
                   set(handles.risetime_text,'String',string(analized.ipd.Risetime));
                   % Disable
                   set(handles.insert_tf_button,'Enable','off')
                   set(handles.pushButton_Start,'Enable','off') 
                   set(handles.popupmenu_Controller,'Enable','off')
                   set(handles.edit_Numerator,'Enable','off')
                   set(handles.edit_Denominator,'Enable','off')
                   set(handles.edit_Delay,'Enable','off')
                   set(handles.Ms14,'Enable','off')
                   set(handles.Ms2,'Enable','off')
                   set(handles.SetPoint,'Enable','off')
                   set(handles.LoadDisturbance,'Enable','off')
                   set(handles.PopSize_popmenu,'Enable','off')
                   set(handles.MaxGeneration_popmenu,'Enable','off') 
               case 2
                   % Load Disturbance Rejection
                   set(handles.task_selected_text,'String','I-PD - Load Disturbance Rejection')
                   [analized, Loop_I_PD_ld, Disturb_I_PD_ld] = pid_loaddisturbance(PopSize, MaxGeneration, dt, G, Ms);
                   analized.Name = 'I-PD - Load Disturbance Rejection';
                   axes(handles.stepResponse_plot); plot_closedloop_stepresponse(Disturb_I_PD_ld,analized.Name);
                   axes(handles.bode_plot); plot_bodeplot(Loop_I_PD_ld);
                   axes(handles.sensitivity_plot); plot_sensitivity(Loop_I_PD_ld);
                   % Controller parameter text plot
                   set(handles.Kp_text,'String',string(analized.pid_dist.Kp))
                   set(handles.Ti_text,'String',string(analized.pid_dist.Ti))
                   set(handles.Td_text,'String',string(analized.pid_dist.Td))
                   set(handles.N_text,'String',string(analized.pid_dist.N))
                   set(handles.Ta_text,'String',"/")
                   set(handles.alpha_text,'String',"/")
                   % Controller Transfer Function text plot
                   [str_NumPID,str_DenPID] = tf2string(analized.Controller.pid.Numerator,analized.Controller.pid.Denominator);
                   set(handles.Cnum_text,'String',str_NumPID);
                   set(handles.Cden_text,'String',str_DenPID);
                   set(handles.C2num_text,'String',"[/]");
                   set(handles.C2den_text,'String',"[/]");
                   set(handles.C3num_text,'String',"[/]");
                   set(handles.C3den_text,'String',"[/]");
                   % Frequency characteristics text plot
                   [pid_gainMargin,pid_phaseMargin] = margin(analized.Loop.pid);
                   set(handles.Ms_text,'String',string(analized.Sensitivity.pid));
                   set(handles.Gm_text,'String',string(pid_gainMargin));
                   set(handles.Pm_text,'String',string(pid_phaseMargin));
                   % Disable
                   set(handles.insert_tf_button,'Enable','off')
                   set(handles.pushButton_Start,'Enable','off') 
                   set(handles.popupmenu_Controller,'Enable','off')
                   set(handles.edit_Numerator,'Enable','off')
                   set(handles.edit_Denominator,'Enable','off')
                   set(handles.edit_Delay,'Enable','off')
                   set(handles.Ms14,'Enable','off')
                   set(handles.Ms2,'Enable','off')
                   set(handles.SetPoint,'Enable','off')
                   set(handles.LoadDisturbance,'Enable','off')
                   set(handles.PopSize_popmenu,'Enable','off')
                   set(handles.MaxGeneration_popmenu,'Enable','off') 
           end
       case 3
           % PI-D Controller
           switch Task_selected
               case 1
                   % Set Point Following
                   set(handles.task_selected_text,'String','PI-D - Setpoint Following')
                   [analized, ClosedLoop_PI_D_sp, Loop_PI_D_sp] = pi_d_setpoint(PopSize, MaxGeneration, dt, G, Ms);
                   analized.Name = 'PI-D - Setpoint Following';
                   axes(handles.stepResponse_plot); plot_closedloop_stepresponse(ClosedLoop_PI_D_sp,analized.Name);
                   axes(handles.bode_plot); plot_bodeplot(Loop_PI_D_sp);
                   axes(handles.sensitivity_plot); plot_sensitivity(Loop_PI_D_sp);
                   % Controller parameter text plot
                   set(handles.Kp_text,'String',string(analized.dpi.Kp))
                   set(handles.Ti_text,'String',string(analized.dpi.Ti))
                   set(handles.Td_text,'String',string(analized.dpi.Td))
                   set(handles.N_text,'String',string(analized.dpi.N))
                   set(handles.Ta_text,'String',"/")
                   set(handles.alpha_text,'String',"/")
                   % Controller Transfer Function text plot
                   [str_NumPI_D1,~] = tf2string(analized.Controller.dpi.K1,analized.Controller.dpi.K1);
                   set(handles.Cnum_text,'String',str_NumPI_D1);
                   set(handles.Cden_text,'String',"1");
                   [str_NumPI_D2,str_DenPI_D2] = tf2string(analized.Controller.dpi.K2.Numerator,analized.Controller.dpi.K2.Denominator);
                   set(handles.C2num_text,'String',str_NumPI_D2);
                   set(handles.C2den_text,'String',str_DenPI_D2);
                   [str_NumPI_D3,str_DenPI_D3] = tf2string(analized.Controller.dpi.K3.Numerator,analized.Controller.dpi.K3.Denominator);
                   set(handles.C3num_text,'String',str_NumPI_D3);
                   set(handles.C3den_text,'String',str_DenPI_D3);
                   % Frequency characteristics text plot
                   [pi_d_gainMargin,pi_d_phaseMargin] = margin(analized.Loop.dpi);
                   set(handles.Ms_text,'String',string(analized.Sensitivity.dpi));
                   set(handles.Gm_text,'String',string(pi_d_gainMargin));
                   set(handles.Pm_text,'String',string(pi_d_phaseMargin));
                   % Step Response characteristics text plot
                   set(handles.IAE_text,'String',string(analized.dpi.IAE));
                   set(handles.undershoot_text,'String',string(analized.dpi.undershoot));
                   set(handles.settlingtime_text,'String',string(analized.dpi.settlingtime));
                   set(handles.overshoot_text,'String',string(analized.dpi.overshoot));
                   set(handles.risetime_text,'String',string(analized.dpi.Risetime));
                   % Disable
                   set(handles.insert_tf_button,'Enable','off')
                   set(handles.pushButton_Start,'Enable','off') 
                   set(handles.popupmenu_Controller,'Enable','off')
                   set(handles.edit_Numerator,'Enable','off')
                   set(handles.edit_Denominator,'Enable','off')
                   set(handles.edit_Delay,'Enable','off')
                   set(handles.Ms14,'Enable','off')
                   set(handles.Ms2,'Enable','off')
                   set(handles.SetPoint,'Enable','off')
                   set(handles.LoadDisturbance,'Enable','off')
                   set(handles.PopSize_popmenu,'Enable','off')
                   set(handles.MaxGeneration_popmenu,'Enable','off') 
               case 2
                   % Load Disturbance Rejection
                   set(handles.task_selected_text,'String','PI-D  - Load Disturbance Rejection')
                   [analized, Loop_PI_D_ld, Disturb_PI_D_ld] = pid_loaddisturbance(PopSize, MaxGeneration, dt, G, Ms);
                   analized.Name = 'PI-D - Load Disturbance Rejection';
                   axes(handles.stepResponse_plot); plot_closedloop_stepresponse(Disturb_PI_D_ld,analized.Name);
                   axes(handles.bode_plot); plot_bodeplot(Loop_PI_D_ld);
                   axes(handles.sensitivity_plot); plot_sensitivity(Loop_PI_D_ld);
                   % Controller parameter text plot
                   set(handles.Kp_text,'String',string(analized.pid_dist.Kp))
                   set(handles.Ti_text,'String',string(analized.pid_dist.Ti))
                   set(handles.Td_text,'String',string(analized.pid_dist.Td))
                   set(handles.N_text,'String',string(analized.pid_dist.N))
                   set(handles.Ta_text,'String',"/")
                   set(handles.alpha_text,'String',"/")
                   % Controller Transfer Function text plot
                   [str_NumPID,str_DenPID] = tf2string(analized.Controller.pid.Numerator,analized.Controller.pid.Denominator);
                   set(handles.Cnum_text,'String',str_NumPID);
                   set(handles.Cden_text,'String',str_DenPID);
                   set(handles.C2num_text,'String',"[/]");
                   set(handles.C2den_text,'String',"[/]");
                   set(handles.C3num_text,'String',"[/]");
                   set(handles.C3den_text,'String',"[/]");
                   % Frequency characteristics text plot
                   [pid_gainMargin,pid_phaseMargin] = margin(analized.Loop.pid);
                   set(handles.Ms_text,'String',string(analized.Sensitivity.pid));
                   set(handles.Gm_text,'String',string(pid_gainMargin));
                   set(handles.Pm_text,'String',string(pid_phaseMargin));
                   % Disable
                   set(handles.insert_tf_button,'Enable','off')
                   set(handles.pushButton_Start,'Enable','off') 
                   set(handles.popupmenu_Controller,'Enable','off')
                   set(handles.edit_Numerator,'Enable','off')
                   set(handles.edit_Denominator,'Enable','off')
                   set(handles.edit_Delay,'Enable','off')
                   set(handles.Ms14,'Enable','off')
                   set(handles.Ms2,'Enable','off')
                   set(handles.SetPoint,'Enable','off')
                   set(handles.LoadDisturbance,'Enable','off')
                   set(handles.PopSize_popmenu,'Enable','off')
                   set(handles.MaxGeneration_popmenu,'Enable','off') 
           end
       case 4
           % PIDA Controller
           switch Task_selected
               case 1
                   % Set Point Following
                   set(handles.task_selected_text,'String','PIDA - Setpoint Following')
                   [analized, ClosedLoop_PIDA_sp, Loop_PIDA_sp] = pida_setpoint(PopSize, MaxGeneration, dt, G, Ms);
                   analized.Name = 'PIDA  Setpoint Following';
                   axes(handles.stepResponse_plot); plot_closedloop_stepresponse(ClosedLoop_PIDA_sp,analized.Name);
                   axes(handles.bode_plot); plot_bodeplot(Loop_PIDA_sp);
                   axes(handles.sensitivity_plot); plot_sensitivity(Loop_PIDA_sp);
                   % Controller parameter text plot
                   set(handles.Kp_text,'String',string(analized.pida.Kp))
                   set(handles.Ti_text,'String',string(analized.pida.Ti))
                   set(handles.Td_text,'String',string(analized.pida.Td))
                   set(handles.N_text,'String',string(analized.pida.N))
                   set(handles.Ta_text,'String',string(analized.pida.Ta))
                   set(handles.alpha_text,'String',string(analized.pida.alfa))
                   % Controller Transfer Function text plot
                   [str_NumPIDA,str_DenPIDA] = tf2string(analized.Controller.pida.Numerator,analized.Controller.pida.Denominator);
                   set(handles.Cnum_text,'String',str_NumPIDA);
                   set(handles.Cden_text,'String',str_DenPIDA);
                   set(handles.C2num_text,'String',"[/]");
                   set(handles.C2den_text,'String',"[/]");
                   set(handles.C3num_text,'String',"[/]");
                   set(handles.C3den_text,'String',"[/]");
                   % Frequency characteristics text plot
                   [pida_gainMargin,pida_phaseMargin] = margin(analized.Loop.pida);
                   set(handles.Ms_text,'String',string(analized.Sensitivity.pida));
                   set(handles.Gm_text,'String',string(pida_gainMargin));
                   set(handles.Pm_text,'String',string(pida_phaseMargin));
                   % Step Response characteristics text plot
                   set(handles.IAE_text,'String',string(analized.pida.IAE));
                   set(handles.undershoot_text,'String',string(analized.pida.undershoot));
                   set(handles.settlingtime_text,'String',string(analized.pida.settlingtime));
                   set(handles.overshoot_text,'String',string(analized.pida.overshoot));
                   set(handles.risetime_text,'String',string(analized.pida.Risetime));
                   % Disable
                   set(handles.insert_tf_button,'Enable','off')
                   set(handles.pushButton_Start,'Enable','off') 
                   set(handles.popupmenu_Controller,'Enable','off')
                   set(handles.edit_Numerator,'Enable','off')
                   set(handles.edit_Denominator,'Enable','off')
                   set(handles.edit_Delay,'Enable','off')
                   set(handles.Ms14,'Enable','off')
                   set(handles.Ms2,'Enable','off')
                   set(handles.SetPoint,'Enable','off')
                   set(handles.LoadDisturbance,'Enable','off')
                   set(handles.PopSize_popmenu,'Enable','off')
                   set(handles.MaxGeneration_popmenu,'Enable','off') 
               case 2
                   % Load Disturbance Rejection
                   set(handles.task_selected_text,'String','PIDA  - Load Disturbance Rejection')
                   [analized, Disturb_PIDA_ld, Loop_PIDA_ld] = pida_loaddisturbance(PopSize, MaxGeneration, dt, G, Ms);
                   analized.Name = 'PIDA - Load Disturbance Rejection';
                   axes(handles.stepResponse_plot); plot_closedloop_stepresponse(Disturb_PIDA_ld,analized.Name);
                   axes(handles.bode_plot); plot_bodeplot(Loop_PIDA_ld);
                   axes(handles.sensitivity_plot); plot_sensitivity(Loop_PIDA_ld);
                   % Controller parameter text plot
                   set(handles.Kp_text,'String',string(analized.pida_dist.Kp))
                   set(handles.Ti_text,'String',string(analized.pida_dist.Ti))
                   set(handles.Td_text,'String',string(analized.pida_dist.Td))
                   set(handles.N_text,'String',string(analized.pida_dist.N))
                   set(handles.Ta_text,'String',string(analized.pida_dist.Ta))
                   set(handles.alpha_text,'String',string(analized.pida_dist.alfa))
                   [str_NumPIDA,str_DenPIDA] = tf2string(analized.Controller.pida.Numerator,analized.Controller.pida.Denominator);
                   set(handles.Cnum_text,'String',str_NumPIDA);
                   set(handles.Cden_text,'String',str_DenPIDA);
                   set(handles.C2num_text,'String',"[/]");
                   set(handles.C2den_text,'String',"[/]");
                   set(handles.C3num_text,'String',"[/]");
                   set(handles.C3den_text,'String',"[/]");
                   % Frequency characteristics text plot
                   [pida_gainMargin,pida_phaseMargin] = margin(analized.Loop.pida);
                   set(handles.Ms_text,'String',string(analized.Sensitivity.pida));
                   set(handles.Gm_text,'String',string(pida_gainMargin));
                   set(handles.Pm_text,'String',string(pida_phaseMargin));
                   % Disable
                   set(handles.insert_tf_button,'Enable','off')
                   set(handles.pushButton_Start,'Enable','off') 
                   set(handles.popupmenu_Controller,'Enable','off')
                   set(handles.edit_Numerator,'Enable','off')
                   set(handles.edit_Denominator,'Enable','off')
                   set(handles.edit_Delay,'Enable','off')
                   set(handles.Ms14,'Enable','off')
                   set(handles.Ms2,'Enable','off')
                   set(handles.SetPoint,'Enable','off')
                   set(handles.LoadDisturbance,'Enable','off')
                   set(handles.PopSize_popmenu,'Enable','off')
                   set(handles.MaxGeneration_popmenu,'Enable','off')                    
           end
   end

ms_print_excel(analized, popmenuController_choice, Ms, Task_selected);

end


% --- Executes on button press in insert_tf_button.
function insert_tf_button_Callback(hObject, eventdata, handles)
global Numerator
global Denominator
global Delay


if isnan(Numerator)
    msgbox('Please insert the numerator', 'Error', 'error');
    return;
elseif isnan(Denominator)
    msgbox('Please insert the denominator', 'Error', 'error');
    return;
elseif isnan(Delay)
    msgbox('Please insert the delay, (0 = no delay)', 'Error', 'error');
    return;
else
    % Process Transfer Function
    [str_NumProcess,str_DenProcess] = tf2string(Numerator,Denominator);
    set(handles.Gnum_text,'String',str_NumProcess);
    set(handles.Gden_text,'String',str_DenProcess);
    set(handles.delay_text,'String',strcat("-",string(Delay),"s"));
end







% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function edit_Delay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Delay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
