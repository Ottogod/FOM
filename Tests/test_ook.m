%Q3) TEST
function test_ook(bin)
    %{
    Cette fonction TEST ne prend en paramètre qu'un vecteur binaire bin
    déclaré avec bin = rbin(n), avec n le nombre de bits contenus. Par
    exemple on pourrait avoir rbin(5) = 1 0 0 1 1
    %}
    Ts = 0.1
    Fs = 1000
    fc = 26
    Amax = 3
    %{
    Exemple : Un symbole binaire a une période de Ts = 0.1s
    La fréquence d'échantillonnage de la porteuse est de 1000 Hz
    La fréquence de la porteuse est de fc = 26 Hz et son amplitude est 
    Amax = 3
    %}
    nb_motifs = length(bin)
    duree = nb_motifs*Ts
    T = 0:1/Fs:duree-1/Fs
    c = Amax*cos(2*pi*fc*T)
    s = ook(bin, Ts, Fs, fc, Amax)
    B = zeros(length(T),1)'
    j=1
    for i=1:nb_motifs
        t = (i-1)*Ts  
           while T(j)>=t && T(j)<= t+Ts 
                if bin(i)==1
                    B(1,j)=1
                end
                if j== length(T)
                    break 
                end
                if j< length(T)
                    j=j+1
                end
                
           end
    end
    figure;

    subplot(3,1,1);
    plot(T, B);
    xlabel("t")
    ylabel("bin(t)")
    title("bin(t)")

    subplot(3,1,2);
    plot(T, c);
    xlabel("t")
    ylabel("c(t)")
    title("c(t)")

    subplot(3,1,3);
    plot(T,s);
    xlabel("t")
    ylabel("s(t)")
    title("s(t)")
end