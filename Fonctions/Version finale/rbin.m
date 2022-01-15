% Question 2
%
% Fonction générant un suite aléatoire de bits
% Avec randn on génère un vecteur ligne de n colonnes de réels aléatoires 
% suivant une loi normale. On transforme chaque nombre en booléen (0 ou 1)
% suivant s'ils sont positifs ou non. Par exemple on pourrait avoir 
% rbin(5) = 1 0 0 1 1.
% 
% Parametre
% n : taille du tableau à construire
% 
% Retour
% X : vecteur ligne contenant une suite de bits aléatoires

function X = rbin(n)
    X = randn(1, n) >= 0;
end
