function print_articolo(dataStep, dataDist)
%% salvataggio
% 0 non salva
% 1     salva
    salva = 1;
    s ='P3_N8_14';

%% set parametri grafici 
%% SET RISPOSTA SETPOINT

temp1 = 50;%tempo per set point
ax_set=[0 temp1 -0.01 1.2];%limiti per set point step
ax_set_control=[0 temp1 -40 100];

%% SET RISPOSTA DISTURBO

temp2 = 60;%tempo per distrubo
ax_dist=[0 temp2 -0.2 0.8];%limiti per set point step
ax_dist_control=[0 temp2 -1.3 0.4];%limiti per variabile di controllo


%% SET BODE MS SET POINT

w1={10^-3,10^5};%omega per bode set point MS
x1=[0.001 100 0.01 5];%limite del grafico di bode set point MS [freqmin freqmax valmin valmax]


%% SET BODE MS DIST

w2={10^-3,10^5};%omega per bode disturbo  MS
x2=[0.001 100 0.001 5];%limite del grafico di bode disturbo MS [freqmin freqmax valmin valmax]


%% SET BODE LOOP SET POINT

w3={10^-3,10^5};%omega per bode set point LOOP
x3=[0.01 10 0.01 100];%limite del grafico di bode set point loop [freqmin freqmax valmin valmax]


%% SET BODE LOOP DIST

w4={10^-3,10^5};%omega per bode disturbo  LOOP
x4=[0.01 10 0.01 100];%limite del grafico di bode disturbo loop [freqmin freqmax valmin valmax]




%% LABEL GRAFICI BODE
y_ti=[0.000000001 0.00000001 0.0000001 0.000001 0.00001 0.0001 0.001 0.01 0.1 1 10 100 1000 10000 100000 1000000 10000000];
y_la={'-180','-120','-140','-120','-100','-80','-60','-40','-20','0','20','40','60','80','100','120','140'};

%% set point plote
F1 = figure('Name','set point');
t_sim = 0:0.0001:temp1;
subplot(2,1,1);
plot(t_sim,step(dataStep.ClosedLoop.pid,t_sim),'k--',t_sim,step(dataStep.ClosedLoop.pida,t_sim),'k-','LineWidth',2);
legend('PID','PIDA','FontSize',12,'FontName','Times New Roman','Location','southeast');
xlabel('time','FontSize',14,'FontName','Times New Roman');
ylabel('process variable','FontSize',14,'FontName','Times New Roman');
axis(ax_set);
grid on;

%% Step control variable plote
G = dataStep.systemTransferFunction;
K_pid = dataStep.Controller.pid;
K_pida = dataStep.Controller.pida;
K1 = dataStep.Controller.ipd.K1;
K2 = dataStep.Controller.ipd.K2;
c1 = dataStep.Controller.dpi.K1;
c2 = dataStep.Controller.dpi.K2;
c3 = dataStep.Controller.dpi.K3;
u_dpi = (c1+c2)/(1+G*(c1+c2+c3));
u_ipd = (K1)/(1+G*(K1+K2));
subplot(2,1,2);
t_cv = 0:0.0001:temp1;
plot(t_cv,step(K_pid/(1+K_pid*G),t_cv),'k--',t_cv,step(K_pida/(1+K_pida*G),t_cv),'k-','LineWidth',2);
legend('PID','PIDA','FontSize',12,'FontName','Times New Roman');
xlabel('time','FontSize',14,'FontName','Times New Roman');
ylabel('control variable','FontSize',14,'FontName','Times New Roman');
axis(ax_set_control);
grid on;



%% disturbance rejection plote
F2 = figure('Name','dist');
t_sim = 0:0.0001:temp2;
subplot(2,1,1);
plot(t_sim,step(dataDist.Disturb.pid,t_sim),'k--',t_sim,step(dataDist.Disturb.pida,t_sim),'k-','LineWidth',2);
legend('PID','PIDA','FontSize',12,'FontName','Times New Roman');
xlabel('time','FontSize',14,'FontName','Times New Roman');
ylabel('process variable','FontSize',14,'FontName','Times New Roman');
axis(ax_dist);
grid on;

%% Disturbance Control variable plote
subplot(2,1,2);
t_cv = 0:0.001:temp2;
plot(t_cv,step(t_cv,-feedback(dataDist.Loop.pid ,1)),'k--',t_cv,step(t_cv,-feedback(dataDist.Loop.pida ,1)),'k-','LineWidth',2);
legend('PID','PIDA','FontSize',12,'FontName','Times New Roman');
xlabel('time','FontSize',14,'FontName','Times New Roman');
ylabel('control variable','FontSize',14,'FontName','Times New Roman');
axis(ax_dist_control);
grid on;

%% bode diagram plote
% figure()
% opts = bodeoptions;
% opts.Title.String =' ';
% bodeplot(feedback(1,dataStep.Loop.pid),'k--',feedback(1,dataStep.Loop.pida),'k-',opts);
% legend('PID','PIDA');
% grid on;
% 
% figure()
% bodeplot(feedback(1,dataDist.Loop.pid),'k--',feedback(1,dataDist.Loop.pida),'k-',opts);
% legend('PID','PIDA');
% grid on;

F3 = figure('Name','bode_set_ms');
[f,d,e]= bode(feedback(1,dataStep.Loop.pid),w1);
[f1,d1,e1]= bode(feedback(1,dataStep.Loop.pida),w1);

tempo = transpose(e);
tempo1 = transpose(e1);
i = length(tempo);
i1 = length(tempo1);
for h=1:1:i
    data(1,h)=f(1,1,h);
end
for h1=1:1:i1
    data1(1,h1)=f1(1,1,h1);
end
loglog(tempo,data,'k--',tempo1,data1,'k-','LineWidth',2)
legend('PID','PIDA','FontSize',12,'FontName','Times New Roman','Location','southeast');
yticks(y_ti)
yticklabels(y_la)
xlabel('frequency (rad/s)','FontSize',14,'FontName','Times New Roman');
ylabel('magnitude (dB)','FontSize',14,'FontName','Times New Roman');
axis(x1);
grid on
ax = gca;
ax.YGrid = 'on';
ax.YMinorGrid = 'off';

F4 = figure('Name','bode_dist_ms');
[f2,d2,e2]= bode(feedback(1,dataDist.Loop.pid),w2);
[f3,d3,e3]= bode(feedback(1,dataDist.Loop.pida),w2);
tempo2 = transpose(e2);
tempo3 = transpose(e3);
i2 = length(tempo2);
i3 = length(tempo3);
for h2=1:1:i2
    data2(1,h2)=f2(1,1,h2);
end

for h3=1:1:i3
    data3(1,h3)=f3(1,1,h3);
end   

loglog(tempo2,data2,'k--',tempo3,data3,'k-','LineWidth',2)
legend('PID','PIDA','FontSize',12,'FontName','Times New Roman','Location','southeast');
yticks(y_ti)
yticklabels(y_la)
xlabel('frequency (rad/s)','FontSize',14,'FontName','Times New Roman');
ylabel('magnitude (dB)','FontSize',14,'FontName','Times New Roman');
axis(x2);
ax = gca;
grid on
ax.YGrid = 'on';
ax.YMinorGrid = 'off';


F5 = figure('Name','bode_set_loop');
[f4,d4,e4]= bode(dataStep.Loop.pid,w3);
[f5,d5,e5]= bode(dataStep.Loop.pida,w3);
tempo4 = transpose(e4);
tempo5 = transpose(e5);
i4 = length(tempo4);
i5 = length(tempo5);
for h4=1:1:i4
    data4(1,h4)=f4(1,1,h4);
end
for h5=1:1:i5
    data5(1,h5)=f5(1,1,h5);
end
loglog(tempo4,data4,'k--',tempo5,data5,'k-','LineWidth',2)
legend('PID','PIDA','FontSize',12,'FontName','Times New Roman');
yticks(y_ti)
yticklabels(y_la)
xlabel('frequency (rad/s)','FontSize',14,'FontName','Times New Roman');
ylabel('magnitude (dB)','FontSize',14,'FontName','Times New Roman');
axis(x3);
grid on
ax = gca;
ax.YGrid = 'on';
ax.YMinorGrid = 'off';

F6 = figure('Name','bode_dist_loop');
[f6,d6,e6]= bode(dataDist.Loop.pid,w4);
[f7,d7,e7]= bode(dataDist.Loop.pida,w4);
tempo6 = transpose(e6);
tempo7 = transpose(e7);
i6 = length(tempo6);
i7 = length(tempo7);
for h6=1:1:i6
    data6(1,h6)=f6(1,1,h6);
end
for h7=1:1:i7
    data7(1,h7)=f7(1,1,h7);
end

loglog(tempo6,data6,'k--',tempo7,data7,'k-','LineWidth',2)
yticks(y_ti)
yticklabels(y_la)
legend('PID','PIDA','FontSize',12,'FontName','Times New Roman');
xlabel('frequency (rad/s)','FontSize',14,'FontName','Times New Roman');
ylabel('magnitude (dB)','FontSize',14,'FontName','Times New Roman');
axis(x4);
grid on
ax = gca;
ax.YGrid = 'on';
ax.YMinorGrid = 'off';

    if salva == 1
        saveas(F1,strcat(s,'_setpoint'),'epsc');
        saveas(F2,strcat(s,'_disturbance'),'epsc');
        saveas(F3,strcat(s,'_setpointMS'),'epsc');
        saveas(F4,strcat(s,'_disturbanceMS'),'epsc');
        saveas(F5,strcat(s,'_setpointLOOP'),'epsc');
        saveas(F6,strcat(s,'_disturbanceLOOP'),'epsc');
        clear all
        clc
    end
end
