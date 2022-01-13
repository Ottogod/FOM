% Fichier testant la modulation DSSS. Il affiche les graphiques
% représentant le signal a moduler, le code pseudo-aléatoire, la porteuse 
% et le signal modulé.

m_bin = [1, 0, 1, 0];       % Binary message
p_bin = rbin(8);        % Pseudo-random code
Amax = 3;       % Carrier amplitude
Fc = 35;        % Carrier frequency
Fs = 1000;      % Sampling frequency
Tb = 0.1;       % Duration of m_bin's binary symbols

n_bit_m= length(m_bin);     % Number of bits in m_bin
n_bit_p = length(p_bin);        % Number of bits in p_bin
Tp = Tb/n_bit_p;        % Duration of p_bin's binary symbols
tot_duration = n_bit_m*Tb;      % Total duration of signal
t = 0:1/Fs:tot_duration-1/Fs;       % Time vector

m = binToSig(m_bin, Fs, Tb);        % Signal corresponding to the binary information

p_bin_extanded = repmat(p_bin, 1, n_bit_m);
p = binToSig(p_bin_extanded, Fs, Tp);       % Signal corresponding to the pseudo-random code

c = Amax*cos(2*pi*Fc*t);        % Carrier

s = DSSS_BPSK(m_bin, p_bin, Amax, Fc, Fs, Tb);       % Modulated signal

figure;

subplot(2,2,1);
plot(t, m);
grid on;
xlabel("t")
ylabel("m(t)")
title("m(t)")

subplot(2,2,2);
plot(t, p);
grid on;
xlabel("t")
ylabel("p(t)")
title("p(t)")

subplot(2,2,3);
plot(t, c);
grid on;
xlabel("t")
ylabel("c(t)")
title("c(t)")

subplot(2,2,4);
plot(t, s);
grid on;
xlabel("t")
ylabel("s(t)")
title("s(t)")