dataStep = ms_dataStep;
dataDist = ms_dataDist;
%% set point plote
figure('Name','set point')
t_sim = 0:0.0001:2*dataStep.time;
subplot(2,1,1);
plot(t_sim,step(dataStep.ClosedLoop.pid,t_sim),'k--',t_sim,step(dataStep.ClosedLoop.pida,t_sim),'k-','LineWidth',2);
legend('PID','PIDA');
xlabel('time','FontSize',14,'FontName','Times New Roman');
ylabel('process variable','FontSize',14,'FontName','Times New Roman');
axis([0 10 -0.5 2]);

grid on;

%% Step control variable
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
t_cv = 0:0.0001:10;
plot(t_cv,step(K_pid/(1+K_pid*G),t_cv),'k--',t_cv,step(K_pida/(1+K_pida*G),t_cv),'k-','LineWidth',2);
legend('PID','PIDA');
xlabel('time','FontSize',14,'FontName','Times New Roman');
ylabel('control variable','FontSize',14,'FontName','Times New Roman');
axis([0 10 -2 2]);
grid on;

%% disturbance rejection plote
figure('Name','dist')
t_sim = 0:0.0001:10;
subplot(2,1,1);
plot(t_sim,step(dataDist.Disturb.pid,t_sim),'k--',t_sim,step(dataDist.Disturb.pida,t_sim),'k-','LineWidth',2);
legend('PID','PIDA');
legend('PID','PIDA');
xlabel('time','FontSize',14,'FontName','Times New Roman');
ylabel('process variable','FontSize',14,'FontName','Times New Roman');
axis([0 10 -0.5 2]);
grid on;

%% Disturbance Control variable
subplot(2,1,2);
t_cv = 0:0.001:10;
plot(t_cv,step(t_cv,-feedback(dataDist.Loop.pid ,1)),'k--',t_cv,step(t_cv,-feedback(dataDist.Loop.pida ,1)),'k-','LineWidth',2);legend('PID','PIDA');
xlabel('time','FontSize',14,'FontName','Times New Roman');
ylabel('control variable','FontSize',14,'FontName','Times New Roman');
axis([0 10 -2 1]);
grid on;

%% bode diagram


% figure()
% opts = bodeoptions;
% opts.Title.String =' ';
% bodeplot(feedback(1,dataStep.Loop.pid),'k--',feedback(1,dataStep.Loop.pida),'k-',opts);
% legend('PID','PIDA');
% grid on;


figure('Name','bode set')
w={10^-3,10^5}
[f,d,e]= bode(feedback(1,dataStep.Loop.pid),w);
[f1,d1,e1]= bode(feedback(1,dataStep.Loop.pida),w);

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
legend('PID','PIDA');
xlabel('Frequency (rad/s)','FontSize',14,'FontName','Times New Roman');
ylabel('Magnitude','FontSize',14,'FontName','Times New Roman');
axis([0 1000 0.001 10]);
grid on
% figure()
% 
% bodeplot(feedback(1,dataDist.Loop.pid),'k--',feedback(1,dataDist.Loop.pida),'k-',opts);
% legend('PID','PIDA');
% grid on;


figure('Name','bode_dist')
[f2,d2,e2]= bode(feedback(1,dataDist.Loop.pid),w);
[f3,d3,e3]= bode(feedback(1,dataDist.Loop.pida),w);
,w
tempo2 = transpose(e2);
tempo3= transpose(e3);
i2 = length(tempo2);
i3 = length(tempo3);
for h2=1:1:i2
    data2(1,h2)=f2(1,1,h2);
end
for h3=1:1:i3
    data3(1,h3)=f3(1,1,h3);
end
loglog(tempo2,data2,'k--',tempo3,data3,'k-','LineWidth',2)
legend('PID','PIDA');
xlabel('Frequency (rad/s)','FontSize',14,'FontName','Times New Roman');
ylabel('Magnitude','FontSize',14,'FontName','Times New Roman');
axis([0 1000 0.001 10]);
grid on
