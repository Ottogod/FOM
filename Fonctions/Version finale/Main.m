% Question 8

clc, clear all, close all;

% --------------Binary information and corresponding signal----------------

m_bin = [1 0 1 0 0 1 1 0];

Tb = 0.1;       % Duration of m_bin's binary symbols
Fs = 1000;      % Sampling frequency

m = binToSig(m_bin, Fs, Tb);

tot_duration = length(m_bin)*Tb;        % Total duration of emitted signal
t = 0 : 1/Fs : tot_duration - 1/Fs;     % Time vector

figure;
subplot(1, 4, 1)
plot(t, m)
xlabel('t (s)')
ylabel('amplitude (V)')
title('Inforation to be tranmitted')

% ---------------Coeficient for modulation and transmission----------------

Amax = 2;       % Amplitude of carrier signal
Fc = 35;        % Frequency of the carrier

SNR = 0.001;

% ---------------------------OOK modulation--------------------------------

m_ook = OOK(m_bin, Amax, Fc, Fs, Tb);

% --------------------------DSSS modulation--------------------------------

p = rbin(8);    % Pseudo random sequence of 8 bits

m_dsss = DSSS_BPSK(m_bin, p, Amax, Fc, Fs, Tb);        

% -------------------------OOK emited signal-------------------------------

e_ook = m_ook;

subplot(2, 4, 2)
plot(t, e_ook)
xlabel('t (s)')
ylabel('amplitude (V)')
title('Emited signal (OOK modulation)')

% ------------------------DSSS emited signal-------------------------------

e_dsss = m_dsss;

subplot(2, 4, 6)
plot(t, e_dsss)
xlabel('t (s)')
ylabel('amplitude (V)')
title('Emited signal (DSSS modulation)')

% ------------------------OOK received signal------------------------------

r_ook = channel(e_ook, SNR);

subplot(2, 4, 3)
plot(t, r_ook)
xlabel('t (s)')
ylabel('amplitude (V)')
title('Recieved signal (OOK modulation)')


% -----------------------DSSS received signal------------------------------

r_dsss = channel(e_dsss, SNR);

subplot(2, 4, 7)
plot(t, r_dsss)
xlabel('t (s)')
ylabel('amplitude (V)')
title('Recieved signal (DSSS modulation)')

% -------------------------OOK demodulation--------------------------------

[s_ook, s_bin_ook] = OOK_demod(r_ook, Amax, Fc, Fs, Tb);
ber_ook = ber(m_bin, s_bin_ook);

subplot(2, 4, 4)
plot(t, s_ook)
xlabel('t (s)')
ylabel('amplitude (V)')
title('Demodulated signal (OOK modulation)')


% ------------------------DSSS demodulation--------------------------------

[s_dsss, s_bin_dsss] = DSSS_BPSK_demod(r_dsss, p, Amax, Fc, Fs, Tb);
ber_dsss = ber(m_bin, s_bin_dsss);

subplot(2, 4, 8)
plot(t, s_dsss)
xlabel('t (s)')
ylabel('amplitude (V)')
title('Demodulated signal (DSSS modulation)')

% ---------Figure of the differents signals in frequency domaine-----------

figure;

subplot(2, 2, 1)
TraceFFT(t, e_ook)
title('Emited signal (OOK modulation)')

subplot(2, 2, 2)
TraceFFT(t, e_dsss)
title('Emited signal (DSSS modulation)')

subplot(2, 2, 3)
TraceFFT(t, r_ook)
title('Recieved signal (OOK modulation)')

subplot(2, 2, 4)
TraceFFT(t, r_dsss)
title('Recieved signal (DSSS modulation)')