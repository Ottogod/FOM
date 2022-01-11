function [b, bin] = ook_demod(s, Tb, Fs, fc, Amax)
    tot_duration = length(s)/Fs;
    nb_motif = tot_duration/Tb;
    t = 0 : 1/Fs : tot_duration - 1/Fs;
    c = Amax*cos(2*pi*fc*t);
    s1 = s.*c;
    b = lowpass(s1, fc/2, Fs);
    min_s = min(b);
    max_s = max(b);
    av = (max_s + min_s) / 2;
  
    for i = 1:length(b)
        if b(i) < av
            b(i) = 0;
        else
            b(i) = 1;
        end
    end

    bin = zeros(1, nb_motif);

    for i=1:nb_motif
        bin(i) = b((i-1)*Fs*Tb+Fs*Tb/2);
    end
    
    % Pour démoduler le signal, on le multiplie par le carrier et ensuite on
    % construite un tableau contenant 1 si le signal était sur un front haut et
    % 0 sinon. On construit finalement le signal démodulé en prenant une valeur
    % tous les Tb du tableau précédent.
end

