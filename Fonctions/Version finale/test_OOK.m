% Fichier testant la modulation OOK. Il affiche les graphiques
% représentant le signal a moduler, la porteuse et le signal modulé.

m_bin = [1, 0, 1, 0];       % Binary message
Amax = 3;       % Carrier amplitude
Fc = 35;        % Carrier frequency
Fs = 1000;      % Sampling frequency
Tb = 0.1;       % Duration of m's binary symbols

n_bit_m= length(m_bin);     % Number of bits in m_bin
tot_duration = n_bit_m*Tb;      % Total duration of signal
t = 0:1/Fs:tot_duration-1/Fs;       % Time vector

m = binToSig(m_bin, Fs, Tb);        % Signal corresponding to the binary information

c = Amax*cos(2*pi*Fc*t);        % Carrier

s = OOK(m_bin, Amax, Fc, Fs, Tb);       % Modulated signal

figure;

subplot(3,1,1);
plot(t, m);
xlabel("t")
ylabel("bin(t)")
title("bin(t)")

subplot(3,1,2);
plot(t, c);
xlabel("t")
ylabel("c(t)")
title("c(t)")

subplot(3,1,3);
plot(t,s);
xlabel("t")
ylabel("s(t)")
title("s(t)")
