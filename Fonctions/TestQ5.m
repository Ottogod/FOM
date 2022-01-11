m = [1 0 1 1]
Tb = 0.1
p = rbin(8)
fc = 30
Amax = 3
Fs = 1000
tot_duration = length(m)*Tb
T = 0:1/Fs:tot_duration - 1/Fs

e_ook = ook(m, Tb, Fs, fc, Amax)
r_ook = channel(e_ook)

e_dsss = DSSS_BPSK(m, Tb, fc, Amax, p, Fs)
r_dsss = channel(e_dsss)

figure
subplot(2,2,1)
plot(T, e_ook)
xlabel('t')
ylabel('e ook(t)')
title('e ook (emitted)')

subplot(2,2,2)
plot(T, r_ook)
xlabel('t')
ylabel('r ook(t)')
title('r ook (received)')

subplot(2,2,3)
plot(T, e_dsss)
xlabel('t')
ylabel('e dsss(t)')
title('e dsss (emitted)')

subplot(2,2,4)
plot(T, r_dsss)
xlabel('t')
ylabel('r dsss(t)')
title('r dsss (received)')


TraceFFT(T, e_dsss)
xlabel('f')
ylabel('E dsss (f)')
title('PSD of e dsss (emitted)')

TraceFFT(T, r_dsss)
xlabel('f')
ylabel('R dsss (f)')
title('PSD of r dsss (received)')
