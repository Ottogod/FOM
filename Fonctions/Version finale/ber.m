% Question 7

function bit_error_rate = ber(m_bin, s_bin)
    %{

    Fonction calculant le taux d'erreur entre deuxà la transmission.

    Paramètres
    m_bin : tableau contenant une suite de bits
    S_bin : tableau contenant une suite de bits

    Retour
    bit_error_rate : taux d'erreur
    %}
    n_bits = length(m_bin);
    n_err = 0;
    
    for i=1:n_bits
        if s_bin(i) ~= m_bin(i)
            n_err = n_err + 1;
        end
    end
    
    bit_error_rate = n_err/n_bits;
end

