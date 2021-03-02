function printFromWorkspace(data)
%PRINTFROMWORKSAPCE Summary of this function goes here
%   Detailed explanation goes here


figure();
        
%% reference tracking plote
        dt=0.001;
        endTime=data.time;
        t_sim = 0:dt: endTime;
        subplot(2,2,1);
        plot(t_sim,step(data.ClosedLoop.pid,t_sim),'r-',t_sim,step(data.ClosedLoop.ipd,t_sim),'b-',t_sim,step(data.ClosedLoop.dpi,t_sim),'k-',t_sim,step(data.ClosedLoop.pida,t_sim),'m-');
        legend('PID','I-PD','PI-D','PIDA');
        title('reference tracking');
        xlabel('time');
        ylabel('amplitude');
        grid on;
        
% %% disturbance rejection plote
%         subplot(2,2,3);
%         plot(t_sim,step(data.Disturb.pid,t_sim),'r-',t_sim,step(data.Disturb.ipd,t_sim),'b-',t_sim,step(data.Disturb.dpi,t_sim),'k-',t_sim,step(data.Disturb.pida,t_sim),'m-');
%         legend('PID','I-PD','PI-D','PIDA');
%         title('disturbance rejection');
%         xlabel('time');
%         ylabel('amplitude');
%         grid on;
        
        
%% histograph
    subplot(2,2,[2,4]);
    Y = [data.pid.IAE data.ipd.IAE data.dpi.IAE data.pida.IAE];
    % The bar function uses a sorted list of the categories, so the bars might display in a different order than you expect. 
    % To preserve the order, call the reordercats function.
    
    X = categorical({'PID','I-PD','PI-D','PIDA'});
    X = reordercats(X,{'PID','I-PD','PI-D','PIDA'});
    title('IAE Trend');
    
    bar(X,Y);
 
    
 %% Save figure
  savefig('Figure');
end

