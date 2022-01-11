function bit_error_rate = ber(bin_1, bin_2)
n_bits = length(bin_1);
n_err = 0;

for i=1:n_bits
    if bin_1(i) ~= bin_2(i)
        n_err = n_err + 1;
    end
end

bit_error_rate = n_err/n_bits;

end

