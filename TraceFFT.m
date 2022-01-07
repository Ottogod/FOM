function TraceFFT(f0, nb_points, Fs)
    t = (0:nb_points-1)/Fs
    x = cos(2*pi*f0*t)
    Xf = abs(fftshift(fft(x))) 
    figure
    plot(t, Xf, 'r') 
    title('Spectre fréquentiel en amplitude de x')

end

%{
fftshift recentre le spectre fréquetiel en zéro. La valeur absolue est là 
pour permettre d'obtenir une amplitude et non un nombre complexe
%}