% Question 4

function s = BPSK(m, Amax, Fc, Fs, Tb)
    %{
    Fonction effectuant une modulation BPSK d'un signal.

    Paramètres
    m : signal à moduler
    Amax : amplitude de la porteuse
    Fc : fréquence de la porteuse
    Fs : fréquence d'échntillonnage
    Tb : durée d'émission d'un bit
    
    Retour
    s : signal modulé
    %}
    nb_motif = length(m);
    tot_duration = nb_motif *Tb;
    t = 0:1/Fs:tot_duration- 1/Fs;
    s = ones(length(t), 1)';
    
    j = 1;
    for i = 1:nb_motif
        T = (i - 1)*Tb;
        while t(j) <= T + Tb + 1e-6  
            if m(i) == 0
                s(j) = Amax*cos(2*pi*Fc*t(j));
            else
                s(j) = Amax*cos(2*pi*Fc*t(j) + pi);
            end

            if j == length(t)
                j = 1;
                break 
            else
                j = j + 1;
            end
        end
    end
end