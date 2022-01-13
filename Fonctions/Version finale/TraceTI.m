% Question 1
%
% Fonction affichant un signal.
% 
% Paramètres
% t : vecteur temps
% x : vecteur amplitude

function TraceTI(t, x)

    plot(t,x, 'b') 
    xlabel('t (s)')
    ylabel('s(t)')
    title("Spectre temporel") 
end
