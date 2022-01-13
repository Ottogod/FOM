% Question 1

function TraceFFT(t,  x)
    %{
    Fonction affichant le spectre d'un signal
    fftshift recentre le spectre fréquetiel en zéro. La valeur absolue est
    là pour permettre d'obtenir une amplitude et non un nombre complexe.

    t : vecteur temps
    x : vecteur amplitude
    %}
    Fs = length(t)/((t(length(t)-t(1))))
    n = length(x)
    X = fft(x)
    Y = fftshift(X)
    fshift = (-n/2:n/2-1)*(Fs/n)
    power = abs(Y).^2/n
    plot(fshift, power, 'r') 
    xlabel('f (Hz)')
    ylabel('X(f)')
    title('DSP')

end
