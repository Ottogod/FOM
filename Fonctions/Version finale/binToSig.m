% Fonction auxiliaire qui permet de convertir un message binaire en signal 
% pourvu que l'on connaisse la période de bit Tb et la fréquence
% d'échantillonnage Fs.
% Par exemple 1 0 1 0 sera transformée en un signal "carré" valant 1 sur 
% [0,Tb] et [2Tb, 3Tb], et -1 sur [Tb, 2Tb] et [3Tb, 4Tb]
% 
% Paramètres
% m_bin : tableau contenant une suite de bits
% Fs : fréquence d'échantillonnage
% Tb : durée d'émission d'un bit
% 
% Retour
% m : signal correspondant m_bin

function m = binToSig(m_bin, Fs, Tb)
    n_bit_m = length(m_bin);        % Nombre de bits dans m_bin
    tot_duration = n_bit_m*Tb;      % Total duration of signal
    t = 0: 1/Fs : tot_duration - 1/Fs;      % Time vector
    
    m = ones(1, length(t));

    for i = 1:length(t)
        ind = floor(n_bit_m*(i-1)/length(t))+1;
        m(i) = 2*m_bin(ind)-1;
    end
end
