function printFromWorkspace(dataStep, dataDist)
figure();
%% set point plote
        t_sim = 0:0.001:2*dataStep.time;
        subplot(2,2,1);
        plot(t_sim,step(dataStep.ClosedLoop.pid,t_sim),'r-',t_sim,step(dataStep.ClosedLoop.ipd,t_sim),'b-',t_sim,step(dataStep.ClosedLoop.dpi,t_sim),'k-',t_sim,step(dataStep.ClosedLoop.pida,t_sim),'g-');
        legend('PID','I-PD','PI-D','PIDA');
        title('reference traking');
        xlabel('time');
        ylabel('amplitude');
        grid on;
                

%% disturbance rejection plote
        t_sim = 0:0.001:2*dataStep.time;
        subplot(2,2,3);
        plot(t_sim,step(dataDist.Disturb.pid,t_sim),'r-',t_sim,step(dataDist.Disturb.pida,t_sim),'g-');
        legend('PID','PIDA');
        title('disturbance rejection');
        xlabel('time');
        ylabel('amplitude');
        grid on;
        
        
%% histograph set point
    subplot(2,2,2);
    Y = [dataStep.pid.IAE dataStep.ipd.IAE dataStep.dpi.IAE dataStep.pida.IAE];
    % The bar function uses a sorted list of the categories, so the bars might display in a different order than you expect. 
    % To preserve the order, call the reordercats function.
    
    X = categorical({'PID','I-PD','PI-D','PIDA'});
    X = reordercats(X,{'PID','I-PD','PI-D','PIDA'});
    
    bar(X,Y);
    title('IAE Trend reference traking');
    
%% histograph disturbance rejection
    subplot(2,2,4);
    Y_dist = [dataDist.pid_dist.IAE dataDist.pida_dist.IAE];
    % The bar function uses a sorted list of the categories, so the bars might display in a different order than you expect. 
    % To preserve the order, call the reordercats function.
    
    X_dist = categorical({'PID','PIDA'});
    X_dist = reordercats(X_dist,{'PID','PIDA'});
    
    
    bar(X_dist,Y_dist);    
    title('IAE Trend disturbance rejection');
 %% Save figure
    savefig('Figure');
end

