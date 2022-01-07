function TraceTI(f0, duree, Fs)
    t = 0:1/Fs:duree-1/Fs
    x = cos(2*pi*f0*t)
    figure
    plot(t,x, 'b') 
    ylim([-1.5, 1.5])
    title("Spectre temporel") 
end

%{
RAS pour cette fonction. Mais doit-on la modifier à chaque fois que l'on
veut plot une fonction différente ?? On suppose ici qu'elle est de la forme
sin(2*pi*f0*t)
%}
   
