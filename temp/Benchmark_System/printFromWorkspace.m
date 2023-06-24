function printFromWorkspace(dataStep, dataDist)

%% set point plote

figure()
t_sim = 0:0.01:2*dataStep.time;
subplot(2,1,1);
plot(t_sim,step(dataStep.ClosedLoop.pid,t_sim),'k--',t_sim,step(dataStep.ClosedLoop.pida,t_sim),'k-');
legend('PID','PIDA');
xlabel('time');
ylabel('process variable');
axis([0 10 0 2]);
grid on;
                

figure()
t_sim = 0:0.01:2*dataStep.time;
subplot(2,2,1);
plot(t_sim,step(dataStep.ClosedLoop.pid,t_sim),t_sim,step(dataStep.ClosedLoop.ipd,t_sim),t_sim,step(dataStep.ClosedLoop.dpi,t_sim),t_sim,step(dataStep.ClosedLoop.pida,t_sim));
legend('PID','I-PD','PI-D','PIDA');
title('Reference Tracking');
xlabel('Time (s)');
ylabel('Amplitude');
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
t_cv = 0:0.0001:80;
plot(t_cv,step(K_pid/(1+K_pid*G),t_cv),'k--',t_cv,step(K_pida/(1+K_pida*G),t_cv),'k-');
legend('PID','PIDA');
xlabel('time');
ylabel('control variable');

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


subplot(2,2,2);
t_cv = 0:0.0001:80;
plot(t_cv,step(K_pid/(1+K_pid*G),t_cv),t_cv,step(u_ipd,t_cv),t_cv,step(u_dpi,t_cv),t_cv,step(K_pida/(1+K_pida*G),t_cv));
legend('PID','I-PD','PI-D','PIDA');
title('Control Variable');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

%% histograph set point
% subplot(2,2,3);
% Y = [dataStep.pid.IAE dataStep.ipd.IAE dataStep.dpi.IAE dataStep.pida.IAE];
% % The bar function uses a sorted list of the categories, so the bars might display in a different order than you expect.
% % To preserve the order, call the reordercats function.
% 
% X = categorical({'PID','I-PD','PI-D','PIDA'});
% X = reordercats(X,{'PID','I-PD','PI-D','PIDA'});
% 
% bar(X,Y);
% title('IAE Trend Reference Tracking');

% %% Maximum Sensitivity Set point
% figure()
% %subplot(2,2,4);
% 
% bodemag(feedback(1,dataStep.Loop.pid),'k--',feedback(1,dataStep.Loop.pida),'k-');
% legend('PID','PIDA');
% grid on;


% %% disturbance rejection plote
% figure()
% t_sim = 0:0.0001:10;
% subplot(2,1,1);
% plot(t_sim,step(dataDist.Disturb.pid,t_sim),'k--',t_sim,step(dataDist.Disturb.pida,t_sim),'k-');
% legend('PID','PIDA');
% 
% legend('PID','PIDA');
% xlabel('time');
% ylabel('process variable');
% grid on;

%% Disturbance Control variable
% 
% subplot(2,1,2);
% t_cv = 0:0.001:10;
% plot(t_cv,step(t_cv,-feedback(dataDist.Loop.pid ,1)),'k--',t_cv,step(t_cv,-feedback(dataDist.Loop.pida ,1)),'k-');
% legend('PID','PIDA');
% legend('PID','PIDA');
% xlabel('time');
% ylabel('control variable');
% axis([0 10 -1 1]);
% grid on;
% 
% 
% 
% bodemag(feedback(1,dataDist.Loop.pid),feedback(1,dataDist.Loop.pida))
% legend('PID','PIDA');
% grid on;
%     

% %% disturbance rejection plote
% figure()
% t_sim = 0:0.0001:100;
% subplot(2,2,1);
% plot(t_sim,step(dataDist.Disturb.pid,t_sim),t_sim,step(dataDist.Disturb.pida,t_sim));
% legend('PID','PIDA');
% title('Disturbance Rejection');
% xlabel('Time (s)');
% ylabel('Amplitude');
% grid on;
% 
% %% histograph disturbance rejection
% subplot(2,2,3);
% Y_dist = [dataDist.pid_dist.IAE dataDist.pida_dist.IAE];
% % The bar function uses a sorted list of the categories, so the bars might display in a different order than you expect.
% % To preserve the order, call the reordercats function.
% 
% X_dist = categorical({'PID','PIDA'});
% X_dist = reordercats(X_dist,{'PID','PIDA'});
% 
% 
% bar(X_dist,Y_dist);
% title('IAE Trend Disturbance Rejection');
% 
% %% Disturbance Control variable
% 
% subplot(2,2,2);
% t_cv = 0:0.0001:100;
% plot(t_cv,step(t_cv,-feedback(dataDist.Loop.pid ,1)),t_cv,step(t_cv,-feedback(dataDist.Loop.pida ,1)));
% legend('PID','PIDA');
% title('Control variable');
% xlabel('Time (s)');
% ylabel('Amplitude');
% grid on;
% 
% %% Maximum Sensitivity Disturbance
% figure()
% %subplot(2,2,4);
% 
% bodemag(feedback(1,dataDist.Loop.pid),'k--',feedback(1,dataDist.Loop.pida),'k-')
% legend('PID','PIDA');
% grid on;
% % font 14 times new romans togliere titoli
% %sia L che S
% %     
end
