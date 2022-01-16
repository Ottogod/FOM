% Question 6
%
% Fonction effectuant une démodulation pour un signal ayant été modulé
% par une modulation de type DSSS
% 
% Paramètres
% r : signal à démoduler
% p_bin : tableau de bits pseudo-aléatoires
% Amax : amplitude de la porteuse
% Fc : fréquence de la porteuse
% Fs : fréquence d'échntillonnage
% Tb : durée d'émission d'un bit
% 
% Retour
% s : signal démodulé
% s_bin : tableau de bits correspondant au signal démodulé

function [s, s_bin] = DSSS_BPSK_demod(r, p_bin, Amax, Fc, Fs, Tb)


    tot_duration = length(r)/Fs;        % Total duration of signal
    t = 0 : 1/Fs : tot_duration - 1/Fs;     % Time vector

    n_bit_m = ceil(tot_duration/Tb);      % Number of bits in m_bin
    n_bit_p = length(p_bin);        % Number of bits in p_bin
    Tp = Tb/n_bit_p;        % Duration of p_bin's binary symbols
    
    p_bin_extanded = repmat(p_bin, 1, n_bit_m);
    p = binToSig(p_bin_extanded, Fs, Tp);       % Signal corresponding to the pseudo-random code
    
    c = -Amax*cos(2*pi*Fc*t);       % Carrier

    s1 = r.*p;      % We multiply the signal by the signal corresponding to the pseudo random code
    s2 = s1.*c;     % We multiply the obtained signal by the carrier to obtain the demodulated signal
    s = lowpass(s2, Fc/2, Fs);     % We apply a lowpass filter to the obtained signal

    s3 = zeros(1, length(t));

    for i=1:n_bit_m
        s3(((i-1)*Fs*Tb+1):((i)*Fs*Tb)) = mean(s(((i-1)*Fs*Tb+1):((i)*Fs*Tb))) > 0;
    end

    s_bin = zeros(1, n_bit_m);
    for i = 1:n_bit_m
        s_bin(i) = s3(floor((i-1)*Fs*Tb+Fs*Tb/2)) > 0;
    end
end
