function varargout = UserInterface(varargin)
% USERINTERFACE MATLAB code for UserInterface.fig
%      USERINTERFACE, by itself, creates a new USERINTERFACE or raises the existing
%      singleton*.
%
%      H = USERINTERFACE returns the handle to a new USERINTERFACE or the handle to
%      the existing singleton*.
%
%      USERINTERFACE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in USERINTERFACE.M with the given input arguments.
%
%      USERINTERFACE('Property','Value',...) creates a new USERINTERFACE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before UserInterface_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to UserInterface_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help UserInterface

% Last Modified by GUIDE v2.5 08-Dec-2020 22:19:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @UserInterface_OpeningFcn, ...
                   'gui_OutputFcn',  @UserInterface_OutputFcn, ...
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


% --- Executes just before UserInterface is made visible.
function UserInterface_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to UserInterface (see VARARGIN)

% Choose default command line output for UserInterface
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes UserInterface wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = UserInterface_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1





% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5


% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton6


% --- Executes on button press in radiobutton7.
function radiobutton7_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton7


% --- Executes on button press in radiobutton8.
function radiobutton8_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton8


% --- Executes on button press in radiobutton9.
function radiobutton9_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton9


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

        

        analized = struct;
        s = tf('s');
        elementSelection = get(handles.uibuttongroup,'SelectedObject');
        global strSelection
        strSelection = get(elementSelection,'String');
        
                %System Transfer Function Selection
        switch strSelection
            case 'Multiple Equal Poles'
                G = 1/(s+1);
            case 'Fourth Order System'
                G = 1/(s+1)/(1+0.1*s)/(1+0.1^2*s)/(1+0.1^3*s);
            case 'Right Half Plane Zero'
                G = 1-0.1*s/(s+1)^3; 
            case 'Time Delay and Lag'
                G = (1/(1+0.1*s))*exp(-s);
            case 'Time Delay and Double Lag'
                G = (1/(1+0.1*s)^2)*exp(-s);
            case 'Fast and Slow Modes'
                G = (100/(s+10)^2)*((1/s+1)+(0.5/s+0.05));
            case 'Oscillatory System'
                G = 1/(s+1)/(s^2+0.2*s+1);
            case 'Unstable Pole'
                G = 1/(s^2-1);
            case 'Multiple Equal Poles Integral'
                G = s/(s+1);
            case 'Fourth Order System Integral'
                G = s/(s+1)/(1+0.1*s)/(1+0.1^2*s)/(1+0.1^3*s);
            case 'Right Half Plane Zero Integral'
                G = (1-0.1*s)*s/(s+1)^3; 
            case 'Time Delay and Lag Integral'
                G = (s/(1+0.1*s))*exp(-s);
            case 'Time Delay and Double Lag Integral'
                G = (1/(1+0.1*s)^2)*exp(-s);
            %case 'custom'
            %   G leggere da una matrice come esempio del profe
            otherwise
                G = [];
        end

        %time step
        dt = 0.001;
        %Genetic Algorithm Paremeters
        %Population Size of each Iteration
        PopSize = 1;
        options = optimoptions(@ga,'PopulationSize',PopSize,'TolFun',10,'useparallel',true);

        %{
        PID genetic algorithm
        x(1) = Kp
        x(2) = Ti
        x(3)= Td
        x(4)= N
        %}         
        %lower bounds lb 
        lb_PID = [0.001 0.1 0.1 5];
        %upper bounds ub 
        ub_PID = [10 500 50 20];
        
        [control,IAE] = ga(@(K)pidtest(G,dt,K),4,[],[],[],[],lb_PID,ub_PID,[],options);
        
        K = control(1) + control(2)/s + (control(3)*s)/(1 + s*(control(3)/control(4)));
        
        Loop_PID = series(K,G);
        ClosedLoop_PID = feedback(Loop_PID,1);
        info = stepinfo(ClosedLoop_PID);
        analized.pid = ga_info_to_struct(IAE,control,info,'pid');
        analized.time = info.SettlingTime;
        
        Disturb_PID = feedback(G,K);
        info = stepinfo(Disturb_PID);
        
        analized.pid_dist =  ga_info_to_struct(IAE,control,info,'pid');
        if analized.time < info.SettlingTime
            analized.time = info.SettlingTime;
        end
        
        
        
        %{
        I-PD genetic algorithm
        x(1) = Kp
        x(2) = Ti
        x(3) = Td
        x(4) = N
        %}         
        %lower bounds lb 
        lb_PID = [0.001 0.1 0.1 5];
        %upper bounds ub 
        ub_PID = [10 500 50 20];
        [control,IAE] = ga(@(K)ipdtest(G,dt,K),4,[],[],[],[],lb_PID,ub_PID,[],options);
        
        K1 = control(1)/(s*control(2));
        K2 = control(1)*(1+(s*control(2)))/(1 + s*(control(3)/control(4)));
        
        ClosedLoop1_IPD = feedback(G,K2);
        Loop_IPD = series(K1,ClosedLoop1_IPD);
        ClosedLoop_IPD = feedback(Loop_IPD,1);
        info = stepinfo(ClosedLoop_IPD); 
        analized.ipd = ga_info_to_struct(IAE,control,info,'i_pd');
        if analized.time < info.SettlingTime
            analized.time = info.SettlingTime;
        end
        
        Disturb_IPD = feedback(G,(K1+K2));
        info = stepinfo(Disturb_IPD);
        analized.ipd_dist =  ga_info_to_struct(IAE,control,info,'i_pd');
        if analized.time < info.SettlingTime
            analized.time = info.SettlingTime;
        end
        
        
        
        %{
        PI-D genetic algorithm
        x(1) = Kp
        x(2) = Ti
        x(3) = Td
        x(4) = N
        %}         
        %lower bounds lb 
        lb_PID = [0.001 0.1 0.1 5];
        %upper bounds ub 
        ub_PID = [10 500 50 20];
        [control,IAE] = ga(@(K)ipdtest(G,dt,K),4,[],[],[],[],lb_PID,ub_PID,[],options);
        
        K1 = control(1);
        K2 = control(1)/(s*control(2));
        K3 = control(1)*(1+((s*control(3))/(1+(control(3)*s/control(4)))));
        
        ClosedLoop_DPI = (G*(K1+K2))/(1+G*(K2+K3));
        info = stepinfo(ClosedLoop_DPI); 
        analized.dpi = ga_info_to_struct(IAE,control,info,'pi_d');
        if analized.time < info.SettlingTime
            analized.time = info.SettlingTime;
        end
        
        Disturb_DPI = feedback(G,K2+K3);
        info = stepinfo(Disturb_DPI); 
        analized.dpi_dist =  ga_info_to_struct(IAE,control,info,'pi_d');
        if analized.time < info.SettlingTime
            analized.time = info.SettlingTime;
        end
        
        

        %{
        PIDA genetic algorithm
        x(1) = Kp
        x(2) = Ti
        x(3) = Td
        x(4) = N
        x(5) = Ta
        x(6) = alfa
        %}
                    
        %lower bounds lb 
        lb_PIDA = [0.001 0.1 0.1 5 0.1 5];
        %upper bounds ub 
        ub_PIDA = [10 500 50 20 50 20];
        
        [control,IAE] = ga(@(K)pidatest(G,dt,K),6,[],[],[],[],lb_PIDA,ub_PIDA,[],options);
        
        K = control(1) + control(2)/s + (control(3)*s)/(1 + s*(control(3)/control(4))) + (control(5)*s^2)/((1 + s*control(5)/control(6))^2); 
       
        Loop_PIDA = series(K,G);
        ClosedLoop_PIDA = feedback(Loop_PIDA,1);
        info = stepinfo(ClosedLoop_PIDA);     
        analized.pida = ga_info_to_struct(IAE,control,info,'pida');
        if analized.time < info.SettlingTime
            analized.time = info.SettlingTime;
        end       
        
        Disturb_PIDA = feedback(G,K);
        info = stepinfo(Disturb_PIDA);
        analized.pida_dist = ga_info_to_struct(IAE,control,info,'pida');
        if analized.time < info.SettlingTime
            analized.time = info.SettlingTime;
        end           
        
        
        
        %time array simulation
        t_sim =0:dt:analized.time*2;
        
        %reference traking graf
        subplot(2,2,[1,2]);
        plot(t_sim,step(ClosedLoop_PID,t_sim),'r-',t_sim,step(ClosedLoop_IPD,t_sim),'b-',t_sim,step(ClosedLoop_DPI,t_sim),'k-',t_sim,step(ClosedLoop_PIDA,t_sim),'m-');
        legend('PID','I-PD','PD-I','PIDA');
        title('reference tracking');
        xlabel('time');
        ylabel('amplitude');
        grid on;
        
        %disturbance rejection graf
        subplot(2,2,[3,4]);
        plot(t_sim,step(Disturb_PID,t_sim),'r-',t_sim,step(Disturb_IPD,t_sim),'b-',t_sim,step(Disturb_DPI,t_sim),'k-',t_sim,step(Disturb_PIDA,t_sim),'m-');
        legend('PID','I-PD','PD-I','PIDA');
        title('disturbance rejection');
        xlabel('time');
        ylabel('amplitude');
        grid on;

        % export to Excel
        print_excel(analized,strSelection);

        
        
