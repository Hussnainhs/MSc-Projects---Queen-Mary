function finalError = ICV_MSE(f1,f2, n)
% Calculate the MSE (Mean Square Error) for the given two blocks
% n = size of the block

error = 0;
for i = 1:n
    for j = 1:n
         error = double(error + (f1(i,j) - f2(i,j))^2);

    end
end
finalError = error / (n*n);

