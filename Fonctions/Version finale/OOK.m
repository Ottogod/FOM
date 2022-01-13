% Question 3

function s = OOK(m_bin, Amax, Fc, Fs, Ts)
    %{
    Fonction effectuant une modulation de type OOK

    Paramètres
    m_bin : tableau contenant une suite de bits à moduler
    Amax : amplitude de la porteuse
    Fc : fréquence de la porteuse
    Fs : fréquence d'échntillonnage
    Tb : durée d'émission d'un bit
    
    Retour
    s : signal modulé
    %}
    nb_motifs = length(m_bin);

    tot_duration = nb_motifs*Ts;
    t = 0:1/Fs:tot_duration-1/Fs;

    c = Amax*cos(2*pi*Fc*t);
    s = zeros(1, length(t));

    j=1;
    for i=1:nb_motifs
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

%{
Impémentation d'une modulation OOK. On regarde le vecteur binaire bin, aux
endroits où sont placés des 1, le signal modulé va prendre les valeurs de
la porteuse pendant une période Ts
%}

