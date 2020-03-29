function lbp_dec = ICV_lbp(mat)
% generate bit-code of the 3x3 pixel matrix
% compare the center pixel to the sorrounding pixels in clockwise manner 
% starting from the top-left. The bit-code is then converted into decimal

lbp_bin = zeros(1,8);
C = mat(2,2);
% Compare center pixel to all sorround pixel in followind order:
% [1 8 7 
%  2 X 6
%  3 4 5]

%-------mat[1,1]-------%
if mat(1,1) >= C 
   lbp_bin(8) = 1; 
else
   lbp_bin(8) = 0;
end
%-------mat[2,1]-------%
if mat(2,1) >= C 
   lbp_bin(7) = 1;
else
   lbp_bin(7) = 0;
end
%-------mat[3,1]-------%
if mat(3,1) >= C 
   lbp_bin(6) = 1; 
else
   lbp_bin(6) = 0;
end
%-------mat[3,2]-------%
if mat(3,2) >= C 
   lbp_bin(5) = 1;
else
   lbp_bin(5) = 0;
end
%-------mat[3,3]-------%
if mat(3,3) >= C 
    lbp_bin(4) = 1;
else
   lbp_bin(4) = 0;
end
%-------mat[2,3]-------%
if mat(2,3) >= C 
   lbp_bin(3) = 1; 
else
   lbp_bin(3) = 0;
end
%-------mat[1,3]-------%
if mat(1,3) >= C 
   lbp_bin(2) = 1;
else
   lbp_bin(2) = 0;
end
%-------mat[1,2]-------%
if mat(1,2) >= C 
    lbp_bin(1) = 1;
else
    lbp_bin(1) = 0;
end
% Convert 8-bit-code into decimal 
lbp_dec = ICV_bin2dec(lbp_bin);

end