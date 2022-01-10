m = [1 0 1 0]             %Binary message
p = rbin(8)        %pseudo random sequence of 10 chips
Tb = 0.1        %Duration of m's binary symbols
tot_duration = length(m)*Tb     %total duration of emitted signal
Fs = 1000                       %sampling frequency
t = 0 : 1/Fs : tot_duration - 1/Fs %time vector

e_ook = binToSig(m, Tb, Fs)            %ook modulation emitted signal
r_ook = channel(e_ook)  %received signal from ideal channel (ook modulated)

e_dsss = DSSS(m, Tb, Fs, p)             %dsss modulation emitted signal
r_dsss = channel(e_dsss)  %received signal from channel (dsss modulated)

figure
grid on 

subplot(2,2,1)
plot(t, e_ook)
xlabel('t')
ylabel('e ook(t)')
title('e ook(t) (ideal)')

subplot(2,2,2)
plot(t, r_ook)
xlabel('t')
ylabel('r ook(t)')
title('r ook(t) (awgn added)')

subplot(2,2,3)
plot(t, e_dsss)
xlabel('t')
ylabel('e dsss(t)')
title('e dsss(t) (ideal)')

subplot(2,2,4)
plot(t, r_dsss)
xlabel('t')
ylabel('r dsss(t)')
title('r dsss(t) (awgn added)')

TraceFFT(t, e_ook)
ylabel('E ook(f)')
title('DSP of E ook (ideal)')

TraceFFT(t, r_ook)
ylabel('R ook(f)')
title('DSP of R ook (awgn added)')

TraceFFT(t, e_dsss)
ylabel('E dsss(f)')
title('DSP of E dsss (ideal)')

TraceFFT(t, r_dsss)
ylabel('R dsss(f)')
title('DSP of R dsss (awgn added)')






