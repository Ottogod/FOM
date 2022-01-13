% Question 4

function s = DSSS_BPSK(m_bin, p_bin, Amax, Fc, Fs, Tb)
    %{
    Fonction effectuant une modulation DSSS suivie d'une modulation 
    BPSK d'un signal.

    Paramètres
    m_bin : tableau contenant une suite de bits à moduler
    p_bin : tableau de bits pseudo-aléatoires
    Amax : amplitude de la porteuse
    Fc : fréquence de la porteuse
    Fs : fréquence d'échntillonnage
    Tb : durée d'émission d'un bit
    
    Retour
    s : signal modulé
    %}
    n_bit_m = length(m_bin);
    n_bit_p = length(p_bin);

    Tp = Tb/n_bit_p;
    p_bin_extended = repmat(p_bin, 1, n_bit_m);
    
    p = binToSig(p_bin_extended, Fs, Tp);

    m = BPSK(m_bin, Amax ,Fc, Fs, Tb);
    
    s = m.*p;
end 