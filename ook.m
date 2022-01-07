function s = ook(bin, Ts, Fs, fc, Amax)
    nb_motifs = length(bin)
    duree = nb_motifs*Ts
    t = 0:1/Fs:duree-1/Fs
    c = Amax*cos(2*pi*fc*t)
    s = zeros(nb_points,1)'
    for i=1:nb_motifs
        t = (i-1)*Ts + 1 %tricky les indices
        if bin(i)==1
            for j=t:t+Ts -1 %tricky les indices 2
                s(j)=c(j)
            end
        end
    end
end
