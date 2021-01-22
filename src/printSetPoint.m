function [outputArg1,outputArg2] = printSetPoint(inputArg1,inputArg2)
%PRINTFROMWORKSAPCE Summary of this function goes here
%   Detailed explanation goes here

%reference tracking plote
figure();
        
        dt=0.001;
        endTime=data.time;
        t_sim = 0:dt: endTime;
        plot(t_sim,step(data.ClosedLoop.pid,t_sim),'r-',t_sim,step(data.ClosedLoop.ipd,t_sim),'b-',t_sim,step(data.ClosedLoop.dpi,t_sim),'k-',t_sim,step(data.ClosedLoop.pida,t_sim),'m-');
        legend('PID','I-PD','PI-D','PIDA');
        title('reference tracking');
        xlabel('time');
        ylabel('amplitude');
        grid on;

        savefig('Figuresetpoint');