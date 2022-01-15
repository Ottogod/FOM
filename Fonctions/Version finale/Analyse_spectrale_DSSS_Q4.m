% Analyse spectrale Q4, script test
%
% Fichier utilisé pour l'analyse spectrale de la modulation DSSS.

m_bin = [1, 0, 1];
p = [1, 0, 1, 0, 1];
Amax = 4;
Fc = 50;
Fs = 1000;
Tb = 0.1;

s1 = BPSK(m_bin, Amax, Fc, Fs, Tb);
s2 = DSSS_BPSK(m_bin, p, Amax, Fc, Fs, Tb);

tot_duration = length(m_bin)*Tb;        % Total duration of emitted signal
t = 0 : 1/Fs : tot_duration - 1/Fs;     % Time vector

figure
TraceTI(t, s1)
title("Spectre temporel de s1 modulé par BPSK à partir de m [1 0 1]")

figure
TraceTI(t, s2)
title("Spectre temporel de s2 modulé par DSSS à partir de s1")

figure
TraceFFT(t, s1)
title("Spectre fréquentiel de s1 modulé par BPSK à partir de m [1 0 1]")

figure
TraceFFT(t, s2)
title("Spectre fréquentiel de s2 modulé par DSSS à partir de s1")
