% Question 6
%
% Fonction effectuant une démodulation pour un signal ayant été modulé
% par une modulation de type OOK
% 
% Paramètres
% r : signal à démoduler
% Amax : amplitude de la porteuse
% Fc : fréquence de la porteuse
% Fs : fréquence d'échntillonnage
% Tb : durée d'émission d'un bit
% 
% Retour
% s : signal démodulé
% s_bin : tableau de bits correspondant au signal démodulé

function [s, s_bin] = OOK_demod(r, Amax, Fc, Fs, Tb)

    tot_duration = length(r)/Fs;        % Total duration of signal
    t = 0 : 1/Fs : tot_duration - 1/Fs;     % Time vector

    n_bit_m = tot_duration/Tb;      % Number of bits in m_bin
    
    c = Amax*cos(2*pi*Fc*t);        % Carrier
    s1 = r.*c;      % We multiply the signal by the carrier
    s1 = lowpass(s1, Fc/2, Fs);     % We apply a lowpass filter to the obtained signal
    
    min_s = min(s1);
    max_s = max(s1);
    av = (max_s + min_s) / 2;
  
    s = zeros(1, length(t));

    for i=1:n_bit_m
        s(((i-1)*Fs*Tb+1):((i)*Fs*Tb)) = mean(s1(((i-1)*Fs*Tb+1):((i)*Fs*Tb))) > av;
    end

    s_bin = zeros(1, n_bit_m);

    for i=1:n_bit_m
        s_bin(i) = s((i-1)*Fs*Tb+Fs*Tb/2);
    end
end
