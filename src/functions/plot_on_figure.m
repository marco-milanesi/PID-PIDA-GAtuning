function plot_on_figure(ClosedLoop, Loop, name)
    axes(handles.stepResponse_plot);
    step(ClosedLoop);
    xlabel('Time (s)')
    ylabel('Amplitude')
    grid on
    title(name)

    axes(handles.bode_plot);

end
