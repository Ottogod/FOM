function bin = ook_demod(s, Fs, fc, Tb)
tot_duration = length(s)/Fs;
t = 0 : 1/Fs : tot_duration - 1/Fs;
c = cos(2*pi*fc*t);
s1 = s.*c;
min_s = min(s1);
max_s = max(s1);
av = (max_s + min_s) / 2;
b = s1 >= av;
bin = [0 0 0 0];
for i=0:4
    bin(i) = b(i*Tb);
end

% Pour démoduler le signal, on le multiplie par le carrier et ensuite on
% construite un tableau contenant 1 si le signal était sur un front haut et
% 0 sinon. On construit finalement le signal démodulé en prenant une valeur
% tous les Tb du tableau précédent.
end

