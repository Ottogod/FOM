% Question 4
%
% Fonction effectuant une modulation BPSK d'un signal.
% 
% Paramètres
% m_bin : tableau contenant une suite de bits à moduler
% Amax : amplitude de la porteuse
% Fc : fréquence de la porteuse
% Fs : fréquence d'échntillonnage
% Tb : durée d'émission d'un bit
% 
% Retour
% s : signal modulé

function s = BPSK(m_bin, Amax, Fc, Fs, Tb)
    n_bit_m = length(m_bin);        % Nombre de bits dans m_bin
    tot_duration = n_bit_m *Tb;     % Total duration of signal
    t = 0:1/Fs:tot_duration- 1/Fs;      % Time vector
    s = ones(length(t), 1)';
    
    j = 1;
    for i = 1:n_bit_m
        T = (i - 1)*Tb;
        while t(j) <= T + Tb + 1e-6  
            if m_bin(i) == 0
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
