%{
Fonction auxiliaire qui permet de convertir un message binaire en signal 
pourvu que l'on connaisse la période de bit Tb et la fréquence
d'échantillonnage Fs.
Par exemple 1 0 1 0 sera transformée en un signal "carré" valant 1 sur 
[0,Tb] et [2Tb, 3Tb], et -1 sur [Tb, 2Tb] et [3Tb, 4Tb]
%}

function m_ = binToSig(m,Tb, Fs)
    ns_m = length(m)
    tot_duration = ns_m*Tb
    T = 0: 1/Fs : tot_duration - 1/Fs
    m_ = ones(length(T),1)'
    j=1
    for i=1:ns_m
        t = (i-1)*Tb  
           while T(j)<= t+Tb + 1e-6
                if m(i)==0
                    m_(j)=-1
                end
                if j== length(T)
                    j = 1
                    break 
                end
                if j< length(T)
                    j=j+1
                end
           end
    end
end