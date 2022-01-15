% Question 3
%
% Fonction effectuant d'une modulation OOK. On regarde le vecteur binaire 
% bin, aux endroits où sont placés des 1, le signal modulé va prendre les 
% valeurs de la porteuse pendant une période Ts.
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

function s = OOK(m_bin, Amax, Fc, Fs, Ts)

    n_bit_m = length(m_bin);        % Number of bits in m_bin

    tot_duration = n_bit_m*Ts;        % Total duration of signal
    t = 0 : 1/Fs : tot_duration - 1/Fs;     % Time vector

    c = Amax*cos(2*pi*Fc*t);        % Carrier

    s = zeros(1, length(t));

    j=1;
    for i=1:n_bit_m
        T = (i-1)*Ts;
        while t(j)<= T+Ts 
            if m_bin(i)==1
                s(j)=c(j);
            end
            if j == length(t)
                break
            else
                j=j+1;
            end
        end
    end
end
