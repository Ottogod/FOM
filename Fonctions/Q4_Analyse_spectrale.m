%Analyse spectrale Q4, script test

m = [1, 0, 1]
Tb = 0.1
Fs = 1000
p = [1, 0, 1, 0, 1]
s = DSSS(m, Tb, Fs, p)

ns_m= length(m)
tot_duration = ns_m*Tb
Time = 0:1/Fs:tot_duration-1/Fs
m_ = ones(length(Time),1)'

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

s = DSSS(m, Tb, Fs, p)


TraceFFT(Time, m_)
title("Spectre fréquentiel de m")
TraceFFT(Time, s)
title("Spectre fréquentiel de s")