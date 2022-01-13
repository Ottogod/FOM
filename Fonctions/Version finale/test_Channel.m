% Fichier testant le canal de transmission. Pour chacune des modulation, un
% graphique du signal en entré et en sortie du canal de transmission est
% affiché.

m_bin = [1 0 1 0 0 1 1 0];      % Binary message
p_bin = rbin(8);        % Pseudo random sequence of 8 bits
Amax = 3;       % Carrier amplitude
Fc = 35;        % Carrier frequency
Fs = 1000;      % Sampling frequency
Tb = 0.1;       % Duration of m's binary symbols

SNR = 25;       % SNR

tot_duration = length(m_bin)*Tb;        % Total duration of emitted signal
t = 0 : 1/Fs : tot_duration - 1/Fs;     % Time vector

e_ook = OOK(m_bin, Amax, Fc, Fs, Tb);       % OOK modulation emitted signal
r_ook = channel(e_ook, SNR);        % Received signal from ideal channel (ook modulated)

e_dsss = DSSS_BPSK(m_bin, p_bin, Amax, Fc, Fs, Tb);     % DSSS modulation emitted signal
r_dsss = channel(e_dsss, SNR);      % Received signal from channel (dsss modulated)

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

figure
grid on 

subplot(2,2,1)
TraceFFT(t, e_ook)
ylabel('E ook(f)')
title('DSP de E ook (idéal)')

subplot(2,2,2)
TraceFFT(t, r_ook)
ylabel('R ook(f)')
title('DSP de R ook (awgn)')

subplot(2,2,3)
TraceFFT(t, e_dsss)
ylabel('E dsss(f)')
title('DSP de E dsss (idéal)')

subplot(2,2,4)
TraceFFT(t, r_dsss)
ylabel('R dsss(f)')
title('DSP de R dsss (awgn)')
