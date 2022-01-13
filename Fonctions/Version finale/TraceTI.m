% Question 1

function TraceTI(t, x)
    %{
    Fonction affichant un signal.

    Paramètres
    t : vecteur temps
    x : vecteur amplitude
    %}
    plot(t,x, 'b') 
    xlabel('t (s)')
    ylabel('s(t)')
    title("Spectre temporel") 
end
