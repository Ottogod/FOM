% Question 8
%
% Ce fichier traite un message binaire et simule une chaine de transmission

clc, clear all, close all;

% --------------Binary information and corresponding signal----------------

m_bin = rbin(8);

Tb = 0.1;       % Duration of m_bin's binary symbols
Fs = 2*499;      % Sampling frequency

m = binToSig(m_bin, Fs, Tb);        % Signal corresponding to the binary information

tot_duration = length(m_bin)*Tb;        % Total duration of emitted signal
t = 0 : 1/Fs : tot_duration - 1/Fs;     % Time vector

figure;
subplot(1, 4, 1)
plot(t, m)
xlabel('t (s)')
ylabel('amplitude (V)')
title('Information to be transmitted')

% ---------------Coeficient for modulation and transmission----------------

Amax = 2;       % Amplitude of carrier signal
Fc = 50;        % Frequency of the carrier
Fcr = Fc;        % Frequency of the carrier at receiver

SNR = 10;        % SNR

% ---------------------------OOK modulation--------------------------------

m_ook = OOK(m_bin, Amax, Fc, Fs, Tb);       % Modulated signal (OOK)

% --------------------------DSSS modulation--------------------------------

p = rbin(3);    % Pseudo random sequence of 8 bits

m_dsss = DSSS_BPSK(m_bin, p, Amax, Fc, Fs, Tb);     % Modulated signal (DSSS)

% -------------------------OOK emitted signal-------------------------------

e_ook = m_ook;      % Emitted signal (OOK)

subplot(2, 4, 2)
plot(t, e_ook)
xlabel('t (s)')
ylabel('amplitude (V)')
title('Emitted signal (OOK modulation)')

% ------------------------DSSS emitted signal-------------------------------

e_dsss = m_dsss;        % Emitted signal (DSSS)

subplot(2, 4, 6)
plot(t, e_dsss)
xlabel('t (s)')
ylabel('amplitude (V)')
title('Emitted signal (DSSS modulation)')

% ------------------------OOK received signal------------------------------

r_ook = channel(e_ook, SNR);        % Received signal (OOK)

subplot(2, 4, 3)
plot(t, r_ook)
xlabel('t (s)')
ylabel('amplitude (V)')
title('Received signal (OOK modulation)')


% -----------------------DSSS received signal------------------------------

r_dsss = channel(e_dsss, SNR);      % Received signal (DSSS)

subplot(2, 4, 7)
plot(t, r_dsss)
xlabel('t (s)')
ylabel('amplitude (V)')
title('Received signal (DSSS modulation)')

% -------------------------OOK demodulation--------------------------------

[s_ook, s_bin_ook] = OOK_demod(r_ook, Amax, Fcr, Fs, Tb);        % Demodulated signal an bits sequence (OOK)
ber_ook = ber(m_bin, s_bin_ook);        % BER for OOK modulation

subplot(2, 4, 4)
plot(t, s_ook)
xlabel('t (s)')
ylabel('amplitude (V)')
title('Demodulated signal (OOK modulation)')


% ------------------------DSSS demodulation--------------------------------

[s_dsss, s_bin_dsss] = DSSS_BPSK_demod(r_dsss, p, Amax, Fcr, Fs, Tb);        % Demodulated signal an bits sequence (DSSS)
ber_dsss = ber(m_bin, s_bin_dsss);      % Ber for DSSS modulation

subplot(2, 4, 8)
plot(t, s_dsss)
xlabel('t (s)')
ylabel('amplitude (V)')
title('Demodulated signal (DSSS modulation)')

% ---------Figure of the different signals in frequency domain-----------

figure;

subplot(2, 2, 1)
TraceFFT(t, e_ook)
title('Emitted signal (OOK modulation)')

subplot(2, 2, 2)
TraceFFT(t, e_dsss)
title('Emitted signal (DSSS modulation)')

subplot(2, 2, 3)
TraceFFT(t, r_ook)
title('Received signal (OOK modulation)')

subplot(2, 2, 4)
TraceFFT(t, r_dsss)
title('Received signal (DSSS modulation)')

%-----------Printing Bit Error Rates -----------------------------------
fprintf("Transmitted message :  [")
fprintf("%g", m_bin(1:end))
fprintf("] \n")
fprintf("Received message via OOK :  [")
fprintf("%g", s_bin_ook(1:end))
fprintf("] \n")
fprintf("Received message via DSSS :  [")
fprintf("%g", s_bin_dsss(1:end))
fprintf("] \n")

fprintf("OOK demodulation's Bit Error Rate = %d \n", ber_ook)
fprintf("DSSS demodulation's Bit Error Rate = %d \n", ber_dsss)

