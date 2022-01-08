# Rapport du Mini Projet de FOM, par GUEGANNO Gabriel et KHA Alexandre

Le principal but de ce sujet est la modélisation sous MATLAB d'une simple chaîne de transmission numérique, en se basant sur des formes d'ondes et modulations numériques récentes. 
Il nous permet d'expliquer des notions simples mais essentielles en communication numérique. Les parties sur les codages source et canal ne seront pas considérées ici (le codage canal ou codage source seront développées ultérieurement dans le module traitement et protection de l'information).
Le canal de transmission est considéré comme un canal idéal avec un bruit additif blanc gaussien (AWGN : Additive White Gaussian Noise). Dans ce cas, la non linéarité , la sélectivité fréquentielle et les multi-trajets du canal seront négligés. Ainsi l'inter=férence entre symboles n'est pas considérée. Donc on suppose que le débit respecte le critère de Nyquist-Shannon et un filtre de mise en forme ne sera pas nécessaire.
La synchronisation entre l'émetteur et le récepteur est supposée parfaite. Finalement, le simple cas d'un seul émetteur-récepteur est considéré, le multiplexage ne sera pas pris en considération.

## Affichage et analyse spectrale
1. Il n'y a rien à signaler dans cette question qui ne consiste qu'à implémenter un plot dans des fonctions.
On notera que TraceTI prend en argument un vecteur des temps t et un signal x dépendant de t, et trace x(t). On a considéré que le vecteur des temps était déjà échantillonné selon une fréquence d'échantillonnage Fs.
TraceFFT prend en argument également un vecteur des temps t et un  un signal x. On fait bien attention à utiliser fftshift et non pas fft pour centrer le spectre féquentiel en 0.

