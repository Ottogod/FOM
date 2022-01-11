%Q4)
function s = DSSS(m, Tb, Fs, p)
    %{
    On considère que m et p sont des vecteurs binaires, ex : m = 1 0 1 et
    p = 1 0 1 1 0
    Tb est la période ou durée d'émission d'un bit
    %}
    ns_m= length(m)
    tot_duration = ns_m*Tb
    ns_p = length(p)
    Tc = Tb/ns_p
    Time = 0:1/Fs:tot_duration- 1/Fs
    m_ = ones(length(Time),1)'
    np = repmat(p, 1, ns_m)
    p_ = ones(length(Time),1)'
    j=1
    for i=1:ns_m
        t = (i-1)*Tb  
           while Time(j)<= t+Tb+1e-6 
                if m(i)==0
                    m_(j)=-1
                end
                if j== length(Time)
                    j = 1
                    break 
                end
                if j< length(Time)
                    j=j+1
                end
                
           end
    end
    for i=1:length(np)
        t = (i-1)*Tc
           while Time(j)<= t+Tc+ 1e-6
                if np(i)==0
                    p_(j)=-1
                end
                if j== length(Time)
                    j = 1
                    break 
                end
                if j< length(Time)
                    j=j+1
                end
                
           end
    end

    

    s = m_.*p_
end 