function dec = ICV_bin2dec(bin)

dec = 0;
msb = size(bin,2);

for i=1:msb
     dec = dec + (bin(i) * 2^(i-1));
end

end