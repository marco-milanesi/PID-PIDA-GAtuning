function printFromWorkspace(dataStep, dataDist)

%% set point plote
figure()
t_sim = 0:0.0001:2*dataStep.time;
subplot(2,1,1);
plot(t_sim,step(dataStep.ClosedLoop.pid,t_sim),'k--',t_sim,step(dataStep.ClosedLoop.pida,t_sim),'k-');
legend('PID','PIDA');
xlabel('time');
ylabel('process variable');
axis([0 10 0 2]);
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
grid on;


%% disturbance rejection plote
figure()
t_sim = 0:0.0001:10;
subplot(2,1,1);
plot(t_sim,step(dataDist.Disturb.pid,t_sim),'k--',t_sim,step(dataDist.Disturb.pida,t_sim),'k-');
legend('PID','PIDA');

legend('PID','PIDA');
xlabel('time');
ylabel('process variable');
grid on;

%% Disturbance Control variable

subplot(2,1,2);
t_cv = 0:0.001:10;
plot(t_cv,step(t_cv,-feedback(dataDist.Loop.pid ,1)),'k--',t_cv,step(t_cv,-feedback(dataDist.Loop.pida ,1)),'k-');
legend('PID','PIDA');
legend('PID','PIDA');
xlabel('time');
ylabel('control variable');
axis([0 10 -1 1]);
grid on;



end
