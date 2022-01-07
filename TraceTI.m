function TraceTI(f0, nb_points, Fs)
    t = (0:nb_points-1)/Fs
    x = sin(2*pi*f0*t)
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
   
