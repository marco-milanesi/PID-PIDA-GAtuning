tempo = transpose(e)
i = length(tempo)
for h=1:1:i
    data(1,h)=f(1,1,h)
end
loglog(tempo,data)
grid on