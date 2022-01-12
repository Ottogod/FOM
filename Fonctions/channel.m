function s = channel(m)
%Canal de transmission, qui renvoie le signal émis (déjà modulé) auquel 
% du bruit gaussien blanc est ajouté
s = awgn(m, 25, 'measured')
%Un SNR de 25 peut être considéré comme un bon rapport pour une
%communication sans fil
end