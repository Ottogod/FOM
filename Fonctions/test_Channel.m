m = [1 0 1 0 0 1 1 0];      %Binary message
p = rbin(8);        %Pseudo random sequence of 10 chips
Tb = 0.1;       %Duration of m's binary symbols
tot_duration = length(m)*Tb;        %total duration of emitted signal
Fs = 1000;      %sampling frequency
t = 0 : 1/Fs : tot_duration - 1/Fs; %time vector

e_ook = ook(m, Tb, Fs, 35, 3);      %ook modulation emitted signal
r_ook = channel(e_ook);     %received signal from ideal channel (ook modulated)
[s_ook_demod, bin_ook_demod] = ook_demod(r_ook, Tb, Fs, 35, 3);
ber_ook = ber(m, bin_ook_demod);

e_dsss = DSSS(m, Tb, Fs, p);        %dsss modulation emitted signal
r_dsss = channel(e_dsss);       %received signal from channel (dsss modulated)
[s_dsss_demod, bin_dsss_demod] = DSSS_demod(r_dsss, Tb, Fs, p);
ber_dsss = ber(m, bin_dsss_demod);

figure
grid on 

subplot(2,3,1)
plot(t, e_ook)
xlabel('t')
ylabel('e ook(t)')
title('e ook(t) (ideal)')

subplot(2,3,2)
plot(t, r_ook)
xlabel('t')
ylabel('r ook(t)')
title('r ook(t) (awgn added)')

subplot(2,3,3)
plot(t, s_ook_demod)
xlabel('t')
ylabel('s ook(t)')
title('s ook(t) (demodulated)')

subplot(2,3,4)
plot(t, e_dsss)
xlabel('t')
ylabel('e dsss(t)')
title('e dsss(t) (ideal)')

subplot(2,3,5)
plot(t, r_dsss)
xlabel('t')
ylabel('r dsss(t)')
title('r dsss(t) (awgn added)')

subplot(2,3,6)
plot(t, s_dsss_demod)
xlabel('t')
ylabel('s dsss(t)')
title('s dsss(t) (demodulated)')

TraceFFT(t, e_ook)
ylabel('E ook(f)')
title('DSP de E ook (idéal)')

TraceFFT(t, r_ook)
ylabel('R ook(f)')
title('DSP de R ook (awgn)')

TraceFFT(t, e_dsss)
ylabel('E dsss(f)')
title('DSP de E dsss (idéal)')

TraceFFT(t, r_dsss)
ylabel('R dsss(f)')
title('DSP de R dsss (awgn)')






