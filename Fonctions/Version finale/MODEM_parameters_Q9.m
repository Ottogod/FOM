%Q9

clc, clear all, close all;

% -------------- Parameters of channel ----------------

M = 100      %characterizes M-ary message
m_bin = rbin(M);

Tb = 0.1;       % Duration of m_bin's binary symbols
Fs = 1000;      % Sampling frequency

Amax = 10;       % Amplitude of carrier signal
Fc = 100 ;        % Frequency of the carrier
Fcr = Fc;   %Frequency of the carrier at the receiver

SNR = 10;        % SNR

% ----------------------Transforming msg into signal -----------------

tot_duration = length(m_bin)*Tb;        % Total duration of emitted signal
t = 0 : 1/Fs : tot_duration - 1/Fs;     % Time vector
m = binToSig(m_bin, Fs, Tb);        % Signal corresponding to the binary information

% ---------------------------OOK modulation--------------------------------

m_ook = OOK(m_bin, Amax, Fc, Fs, Tb);       % Modulated signal (OOK)

% --------------------------DSSS modulation--------------------------------

p = rbin(8);    % Pseudo random sequence of 8 bits

m_dsss = DSSS_BPSK(m_bin, p, Amax, Fc, Fs, Tb);     % Modulated signal (DSSS)

% -------------------------OOK emitted signal-------------------------------

e_ook = m_ook;      % Emitted signal (OOK)


% ------------------------DSSS emitted signal-------------------------------

e_dsss = m_dsss;        % Emitted signal (DSSS)


% ------------------------OOK received signal------------------------------

r_ook = channel(e_ook, SNR);        % Received signal (OOK)


% -----------------------DSSS received signal------------------------------

r_dsss = channel(e_dsss, SNR);      % Received signal (DSSS)


% -------------------------OOK demodulation--------------------------------

[s_ook, s_bin_ook] = OOK_demod(r_ook, Amax, Fcr, Fs, Tb);        % Demodulated signal an bits sequence (OOK)
ber_ook = ber(m_bin, s_bin_ook);        % BER for OOK modulation



% ------------------------DSSS demodulation--------------------------------

[s_dsss, s_bin_dsss] = DSSS_BPSK_demod(r_dsss, p, Amax, Fcr, Fs, Tb);        % Demodulated signal an bits sequence (DSSS)
ber_dsss = ber(m_bin, s_bin_dsss);      % Ber for DSSS modulation


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
