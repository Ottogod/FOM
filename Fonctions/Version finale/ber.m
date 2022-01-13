% Question 7
%
% Fonction calculant le taux d'erreur entre deux chaines binaires à la 
% transmission.
% 
% Paramètres
% m_bin : tableau contenant une suite de bits
% S_bin : tableau contenant une suite de bits
% 
% Retour
% bit_error_rate : taux d'erreur

function bit_error_rate = ber(m_bin, s_bin)
    n_bits = length(m_bin);     % Nombre de bits dans m_bin
    n_err = 0;      % Nombre de bits éronnés
    
    for i=1:n_bits
        if s_bin(i) ~= m_bin(i)
            n_err = n_err + 1;
        end
    end
    
    bit_error_rate = n_err/n_bits;      % BER
end
