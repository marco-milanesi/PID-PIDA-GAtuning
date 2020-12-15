function save_plot_to_png(file,name,tipo)
filename = strcat(name,tipo,'.png');
saveas(file,filename);
end

