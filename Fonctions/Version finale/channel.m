% Question 5
%
% Fonction simulant un canal de transmission, qui renvoie le signal émis
% (déjà modulé) auquel du bruit gaussien blanc est ajouté.
% Un SNR de 25 peut être considéré comme un bon rapport pour une
% communication sans fil.
% 
% Paramètres:
% e : signal en entrée du canal de transmission
% SNR : SNR
% 
% Retour
% r : siganl en sortie du canal de transmission

function r = channel(e, SNR)
    r = awgn(e, SNR, 'measured');
end
