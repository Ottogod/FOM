% Question 6

function [s, s_bin] = DSSS_BPSK_demod(r, p_bin, Amax, Fc, Fs, Tb)
    %{
    Fonction effectuant une démodulation pour un signal ayant été modulé
    par une modulation de type DSSS

    Paramètres
    r : signal à démoduler
    p_bin : tableau de bits pseudo-aléatoires
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

    n_bit_m = tot_duration/Tb;
    n_bit_p = length(p_bin);
    Tp = Tb/n_bit_p;
    
    p_bin_extanded = repmat(p_bin, 1, n_bit_m);
    p = binToSig(p_bin_extanded, Fs, Tp);
    
    c = -Amax*cos(2*pi*Fc*t);

    s1 = r.*p;
    s2 = s1.*c;

    s = zeros(1, length(t));

    for i=1:n_bit_m
        s(((i-1)*Fs*Tb+1):((i)*Fs*Tb)) = mean(s2(((i-1)*Fs*Tb+1):((i)*Fs*Tb))) > 0;
    end

    s_bin = zeros(1, n_bit_m);
    for i = 1:n_bit_m
        s_bin(i) = s((i-1)*Fs*Tb+Fs*Tb/2) > 0;
    end
end

