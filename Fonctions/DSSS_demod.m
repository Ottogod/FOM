function [b, bin] = DSSS_demod(s, Tb, Fs, p)
    tot_duration = length(s)/Fs;
    nb_motif = tot_duration/Tb;
    t = 0 : 1/Fs : tot_duration - 1/Fs;
    
    s_p = zeros(1, Fs*Tb);

    for i = 1:length(t)/nb_motif
        ind = floor(8*(i-1)/(length(t)/nb_motif))+1;
        s_p(i) = 2*p(ind)-1;
    end

    s_p = repmat(s_p, 1, nb_motif);
    plot(t, s_p);

    b = s.*s_p;

    for i=1:nb_motif
        b(((i-1)*Fs*Tb+1):((i)*Fs*Tb)) = mean(b(((i-1)*Fs*Tb+1):((i)*Fs*Tb))) > 0;
    end

    bin = zeros(1, nb_motif);

    for i=1:nb_motif
        bin(i) = b((i-1)*Fs*Tb+Fs*Tb/2) > 0;
    end
end

