function printFromWorkspace(dataStep, dataDist)
figure('NumberTitle', 'off', 'Name', dataDist.name);

%% set point plote
        t_sim = 0:0.001:2*dataStep.time;
        subplot(2,3,1);
        plot(t_sim,step(dataStep.ClosedLoop.pid,t_sim),'r-',t_sim,step(dataStep.ClosedLoop.ipd,t_sim),'b-',t_sim,step(dataStep.ClosedLoop.dpi,t_sim),'k-',t_sim,step(dataStep.ClosedLoop.pida,t_sim),'m-');
        legend('PID','I-PD','PI-D','PIDA');
        title('reference traking');
        xlabel('time');
        ylabel('amplitude');
        grid on;
                

%% disturbance rejection plote
        t_sim = 0:0.001:2*dataStep.time;
        subplot(2,3,4);
        plot(t_sim,step(dataDist.Disturb.pid,t_sim),'r-',t_sim,step(dataDist.Disturb.pida,t_sim),'m-');
        legend('PID','PIDA');
        title('disturbance rejection');
        xlabel('time');
        ylabel('amplitude');
        grid on;
        
        
%% histograph set point
    subplot(2,3,3);
    Y = [dataStep.pid.IAE dataStep.ipd.IAE dataStep.dpi.IAE dataStep.pida.IAE];
    % The bar function uses a sorted list of the categories, so the bars might display in a different order than you expect. 
    % To preserve the order, call the reordercats function.
    
    X = categorical({'PID','I-PD','PI-D','PIDA'});
    X = reordercats(X,{'PID','I-PD','PI-D','PIDA'});
    
    bar(X,Y);
    title('IAE Trend reference traking');
    
%% histograph disturbance rejection
    subplot(2,3,6);
    Y_dist = [dataDist.pid_dist.IAE dataDist.pida_dist.IAE];
    % The bar function uses a sorted list of the categories, so the bars might display in a different order than you expect. 
    % To preserve the order, call the reordercats function.
    
    X_dist = categorical({'PID','PIDA'});
    X_dist = reordercats(X_dist,{'PID','PIDA'});
    
    
    bar(X_dist,Y_dist);    
    title('IAE Trend disturbance rejection');
    
    
%% Step control variable

    [y_PID,t] = step(dataStep.ClosedLoop.pid,t_sim);
    u_PID = lsim(dataStep.Controller.pid,1-y_PID,t);
    
%     [y_I_PD,t] = step(dataStep.ClosedLoop.ipd,t_sim);
%     u_I_PD = lsim(dataStep.Controller.ipd,1-y_I_PD,t);
%     
%     [y_PI_D,t] = step(dataStep.ClosedLoop.dpi,t_sim);
%     u_PI_D = lsim(dataStep.Controller.dpi,1-y_PI_D,t);
    
    [y_PIDA,t] = step(dataStep.ClosedLoop.pida,t_sim);
    u_PIDA = lsim(dataStep.Controller.pida,1-y_PIDA,t);
    
    subplot(2,3,2);
    plot(t_sim,u_PID,'r-',t_sim,u_PIDA,'m-');
    legend('PID','I-PD','PI-D','PIDA');
    title('Control variable');
    xlabel('time');
    ylabel('amplitude');
    grid on;

%% Disturbance Control variable
   
    subplot(2,3,5);
    plot(t_sim,step(t_sim,-feedback(dataDist.Loop.pid ,1)),'r-',t_sim,step(t_sim,-feedback(dataDist.Loop.pida ,1)),'m-');
    legend('PID','PIDA');
    title('Control variable');
    xlabel('time');
    ylabel('amplitude');
    grid on;
    
 %% Save figure

    savefig(dataDist.name);
end

