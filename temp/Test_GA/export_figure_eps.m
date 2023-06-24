hfig = openfig('3dplot.fig');
set(hfig,'InvertHardcopy','off');
print('-depsc2', '-loose','Filename.eps');