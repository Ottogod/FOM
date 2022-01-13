% Question 6

function [s, s_bin] = OOK_demod(r, Amax, Fc, Fs, Tb)
    %{
    Fonction effectuant une démodulation pour un signal ayant été modulé
    par une modulation de type OOK

    Paramètres
    r : signal à démoduler
    Amax : amplitude de la porteuse
    Fc : fréquence de la porteuse
    Fs : fréquence d'échntillonnage
    Tb : durée d'émission d'un bit
    
    Retour
    s : signal démodulé
    s_bin : tableau de bits correspondant au signal démodulé
    %}
    tot_duration = length(r)/Fs;
    t = 0 : 1/Fs : tot_duration - 1/Fs;

    nb_motif = tot_duration/Tb;
    
    c = Amax*cos(2*pi*Fc*t);
    s1 = r.*c;
    s1 = lowpass(s1, Fc/2, Fs);
    
    min_s = min(s1);
    max_s = max(s1);
    av = (max_s + min_s) / 2;
  
    s = zeros(1, length(t));

    for i = 1:length(s1)
        if s1(i) < av
            s(i) = 0;
        else
            s(i) = 1;
        end
    end

    s_bin = zeros(1, nb_motif);

    for i=1:nb_motif
        s_bin(i) = s((i-1)*Fs*Tb+Fs*Tb/2);
    end
    
    % Pour démoduler le signal, on le multiplie par le carrier et ensuite on
    % construite un tableau contenant 1 si le signal était sur un front haut et
    % 0 sinon. On construit finalement le signal démodulé en prenant une valeur
    % tous les Tb du tableau précédent.
end

