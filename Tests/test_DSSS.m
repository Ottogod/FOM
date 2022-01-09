%Q4) TEST

function test_DSSS(p)
%Fonction TEST, ne prend en argument qu'un vecteur binaire (à priori le
%code pseudo aléatoire). Ex : p = rbin(n)
    m = [1, 0, 1]
    Tb = 0.1
    Fs = 1000
    ns_m= length(m)
    tot_duration = ns_m*Tb
    ns_p = length(p)
    Tc = Tb/ns_p
    Time = 0:1/Fs:tot_duration-1/Fs
    m_ = ones(length(Time),1)'
    np = repmat(p, 1, ns_m)
    p_ = ones(length(Time),1)'
    s = DSSS(m, Tb, Fs, p)
    j=1
    for i=1:ns_m
        t = (i-1)*Tb  
           while Time(j)<= t+Tb + 1e-6
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
           while Time(j)<= t+Tc+1e-6
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
    %p__=repmat(p_,1, ns_m)

    figure;

    subplot(3,1,1);
    plot(Time, m_);
    xlabel("t")
    ylabel("m(t)")
    title("m(t)")

    subplot(3,1,2);
    plot(Time, p_);
    xlabel("t")
    ylabel("p(t)")
    title("p(t)")

    subplot(3,1,3);
    plot(Time,s);
    xlabel("t")
    ylabel("s(t)")
    title("s(t)")
end