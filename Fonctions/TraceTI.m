%Q1)
function TraceTI(t, x)
    %{
    t = 0:1/Fs:duree-1/Fs
    x = cos(2*pi*f0*t)
    %}
    figure
    plot(t,x, 'b') 
    xlabel('t (s)')
    ylabel('s(t)')
    title("Spectre temporel") 
end

%{
RAS pour cette fonction
%}
   
