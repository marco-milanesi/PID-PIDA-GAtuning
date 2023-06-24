function printFromWorkspace(dataStep1, dataDist1, dataStep2, dataDist2)


%% set point plote
figure()
t_sim = 0:0.001:50;

x1= step(dataStep1.ClosedLoop.pid,t_sim);
plot(t_sim,x1,'Color','#000000')
x2=step(dataStep1.ClosedLoop.pida,t_sim);
hold on
plot(t_sim,x2,'Color','#1C8EF4')
x3=step(dataStep2.ClosedLoop.pid,t_sim);
hold on
plot(t_sim,x3,'Color','#000000')
x4= step(dataStep2.ClosedLoop.pida,t_sim);
hold on
plot(t_sim,x4,'Color','#1C8EF4')
title('Reference Tracking');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
              

    
%% disturbance rejection plote
figure()
t_sim = 0:0.001:50;

x1= step(dataDist1.Disturb.pid,t_sim);
plot(t_sim,x1,'Color','#000000')
x2=step(dataDist1.Disturb.pida,t_sim);
hold on
plot(t_sim,x2,'Color','#1C8EF4')
x3=step(dataDist2.Disturb.pid,t_sim);
hold on
plot(t_sim,x3,'Color','#000000')
x4= step(dataDist2.Disturb.pida,t_sim);
hold on
plot(t_sim,x4,'Color','#1C8EF4')
title('Disturbance Rejection');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

    
end
