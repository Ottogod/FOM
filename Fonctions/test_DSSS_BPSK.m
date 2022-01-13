m = [1, 0, 1]
p = rbin(3)
    Tb = 0.1
    Fs = 1000
    ns_m= length(m)
    tot_duration = ns_m*Tb
    ns_p = length(p)
    Tc = Tb/ns_p
    Time = 0:1/Fs:tot_duration-1/Fs
    Amax = 3
    fc = 9/0.3
    m_ = ones(length(Time),1)'
    np = repmat(p, 1, ns_m)
    p_ = ones(length(Time),1)'
    c = Amax*cos(2*pi*fc*Time)
    s = DSSS_BPSK(m, Tb, fc, Amax, p, Fs)
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
    

    subplot(2,2,1);
    plot(Time, m_);
    grid on;
    xlabel("t")
    ylabel("m(t)")
    title("m(t)")

    subplot(2,2,2);
    plot(Time, p_);
    grid on;
    xlabel("t")
    ylabel("p(t)")
    title("p(t)")

    subplot(2,2,3);
    plot(Time, c);
    grid on;
    xlabel("t")
    ylabel("c(t)")
    title("c(t)")

    subplot(2,2,4);
    plot(Time,s);
    grid on;
    xlabel("t")
    ylabel("s(t)")
    title("s(t)")