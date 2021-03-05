function printFromWorkspace(data2,data1)
figure();
%% set point plote
        t_sim = 0:0.001:data2.time;
        subplot(2,2,1);
        plot(t_sim,step(data2.ClosedLoop.pid,t_sim),'r-',t_sim,step(data2.ClosedLoop.ipd,t_sim),'b-',t_sim,step(data2.ClosedLoop.dpi,t_sim),'k-',t_sim,step(data2.ClosedLoop.pida,t_sim),'m-');
        legend('PID','I-PD','PI-D','PIDA');
        title('reference traking');
        xlabel('time');
        ylabel('amplitude');
        grid on;
                

%% disturbance rejection plote
        t_sim = 0:0.001:data1.time;
        subplot(2,2,3);
        plot(t_sim,step(data1.Disturb.pid,t_sim),'r-',t_sim,step(data1.Disturb.ipd,t_sim),'b-',t_sim,step(data1.Disturb.dpi,t_sim),'k-',t_sim,step(data1.Disturb.pida,t_sim),'m-');
        legend('PID','I-PD','PI-D','PIDA');
        title('disturbance rejection');
        xlabel('time');
        ylabel('amplitude');
        grid on;
        
        
%% histograph set point
    subplot(2,2,2);
    Y = [data2.pid.IAE data2.ipd.IAE data2.dpi.IAE data2.pida.IAE];
    % The bar function uses a sorted list of the categories, so the bars might display in a different order than you expect. 
    % To preserve the order, call the reordercats function.
    
    X = categorical({'PID','I-PD','PI-D','PIDA'});
    X = reordercats(X,{'PID','I-PD','PI-D','PIDA'});
    
    bar(X,Y);
    title('IAE Trend reference traking');
    
%% histograph disturbance rejection
    subplot(2,2,4);
    Y_dist = [data1.pid_dist.IAE data1.ipd_dist.IAE data1.dpi_dist.IAE data1.pida_dist.IAE];
    % The bar function uses a sorted list of the categories, so the bars might display in a different order than you expect. 
    % To preserve the order, call the reordercats function.
    
    X_dist = categorical({'PID','I-PD','PI-D','PIDA'});
    X_dist = reordercats(X_dist,{'PID','I-PD','PI-D','PIDA'});
    
    
    bar(X_dist,Y_dist);    
    title('IAE Trend disturbance rejection');
 %% Save figure
  savefig('Figure');
end

