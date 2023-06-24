function plot_closedloop_stepresponse(ClosedLoop, name)
    step(ClosedLoop);
    xlabel('Time (s)')
    ylabel('Amplitude')
    grid on
    title(name)
end