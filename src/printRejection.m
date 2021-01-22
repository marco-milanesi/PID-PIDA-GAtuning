function [outputArg1,outputArg2] = printRejection(inputArg1,inputArg2)
%PRINTFROMWORKSAPCE Summary of this function goes here
%   Detailed explanation goes here

%reference tracking plote
figure();
        
        dt=0.001;
        endTime=data.time;
        t_sim = 0:dt: endTime;

        plot(t_sim,step(data.Disturb.pid,t_sim),'r-',t_sim,step(data.Disturb.ipd,t_sim),'b-',t_sim,step(data.Disturb.dpi,t_sim),'k-',t_sim,step(data.Disturb.pida,t_sim),'m-');
        legend('PID','I-PD','PI-D','PIDA');
        title('disturbance rejection');
        xlabel('time');
        ylabel('amplitude');
        grid on;
        savefig('Figurerejection');