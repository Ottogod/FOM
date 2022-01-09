%Q3)
function s = ook(bin, Ts, Fs, fc, Amax)
    nb_motifs = length(bin)
    duree = nb_motifs*Ts
    T = 0:1/Fs:duree-1/Fs
    c = Amax*cos(2*pi*fc*T)
    s = zeros(length(T),1)'
    j=1
    for i=1:nb_motifs
        t = (i-1)*Ts  
           while T(j)<= t+Ts 
                if bin(i)==1
                    s(1,j)=c(1,j)
                end
                if j== length(T)
                    break 
                end
                if j< length(T)
                    j=j+1
                end
                
           end
    end
end

%{
Impémentation d'une modulation OOK. On regarde le vecteur binaire bin, aux
endroits où sont placés des 1, le signal modulé va prendre les valeurs de
la porteuse pendant une période Ts
%}

