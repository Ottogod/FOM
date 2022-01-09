%Q1)
function TraceFFT(t,  x)
    %{
    t = (0:nb_points-1)/Fs
    x = cos(2*pi*f0*t)
    %}
    Fs = length(t)/((t(length(t)-t(1))))
    n = length(x)
    X = fft(x)
    Y = fftshift(X)
    fshift = (-n/2:n/2-1)*(Fs/n)
    power = abs(Y).^2/n
    figure
    plot(fshift, power, 'r') 
    xlabel('f (Hz)')
    ylabel('X(f)')
    title('DSP')

end

%{
fftshift recentre le spectre fréquetiel en zéro. La valeur absolue est là 
pour permettre d'obtenir une amplitude et non un nombre complexe
%}