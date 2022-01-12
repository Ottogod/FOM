function s = BPSK(m, Tb, fc, Amax, Fs )
%Modulation BPSK
    ns_m= length(m)
    tot_duration = ns_m*Tb
    Time = 0:1/Fs:tot_duration- 1/Fs
    s = ones(length(Time),1)'
    j=1
    for i=1:ns_m
        t = (i-1)*Tb  
           while Time(j)<= t+Tb+1e-6  
                if m(i)==0
                    s(j)=Amax*cos(2*pi*fc*Time(j))
                end
                if m(i)==1
                    s(j)=Amax*cos(2*pi*fc*Time(j) + pi)
                end
                if j== length(Time)
                    j = 1
                    break 
                end
                j = j+1
           end
    end
end