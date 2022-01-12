%Analyse spectrale Q4, script test

m = [1, 0, 1]
fc = 50
Amax = 4
Tb = 0.1
Fs = 1000
p = [1, 0, 1, 0, 1]
s1 = BPSK(m, Tb, fc, Amax, Fs)
s2 = DSSS_BPSK(m, Tb, fc, Amax, p, Fs)

TraceTI(Time, s1)
title("Spectre temporel de s1 modulé par BPSK à partir de m [1 0 1]")
TraceTI(Time, s2)
title("Spectre temporel de s2 modulé par DSSS à partir de s1")

TraceFFT(Time, s1)
title("Spectre fréquentiel de s1 modulé par BPSK à partir de m [1 0 1]")
TraceFFT(Time, s2)
title("Spectre fréquentiel de s2 modulé par DSSS à partir de s1")