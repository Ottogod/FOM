m = [1 0 1 0 1]             %Binary message
p = rbin(10)        %pseudo random sequence of 10 chips
Tb = 0.1        %Duration of m's binary symbols
tot_duration = length(m)*Tb     %total duration of emitted signal
Fs = 1000                       %sampling frequency
t = 0 : 1/Fs : tot_duration - 1/Fs %time vector

e_ook = binToSig(m, Tb, Fs)            %ook modulation emitted signal
r_ook = channel(e_ook)  %received signal from ideal channel (ook modulated)

e_dsss = DSSS(m, Tb, Fs, p)             %dsss modulation emitted signal
r_DSSS = channel(e_dsss)  %received signal from channel (dsss modulated)

figure
subplot(2,1,1)
plot(t, e_ook)
plot(t, r_ook)
xabel('t')
ylabel('r_ook(t)')
title('r_ook(t)')
legend('e_ook (ideal)', 'r_ook (awgn added)')

subplot(2,1,2)
plot(t, e_dsss)
plot(t, r_dsss)
xabel('t')
ylabel('r_dsss(t)')
title('r_dsss(t)')
legend('e_dsss (ideal)', 'r_dsss (awgn added)')



