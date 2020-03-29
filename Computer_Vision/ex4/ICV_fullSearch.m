function [motionVectors predictedFrame time] = ICV_fullSearch(f1rgb, f2rgb, blockW, searchW)
% Return a matrix Loc 5xn where the first and second row are the x and y
% coordinate of the center of each block as origin of the motion arrow, the
% 3rd and 4th row contains the motion vectors and the 5th row contain the
% MSE error
% also return the predicted frame pF and the execution itme of the
% algorithm


% Convert frame f1 into grayscale and then into double
f1 = ICV_rgb2gray(f1rgb);
f1 = im2double(f1);

% Convert frame f2 into grayscale and then into double
f2 = ICV_rgb2gray(f2rgb);
f2 = im2double(f2);


% Calculate the size of the block and the pixels displacement for the search
% window w.r.t the block size 
blockSize = size(blockW,1);
dS = (size(searchW,1)-blockSize)/2;

% Zero pad f1 in order to detect motion on the borders
f1 = ICV_extend(f1,dS);
f1 = im2double(f1);

[row col] = size(f2);

%initialize index for motion vector matrix 
iLoc = 0;

tic
for i=1:blockSize:row
    for j=1:blockSize:col
        
        iLoc = iLoc +1;
        MSE_min = blockSize^2;
                
        for dR=-dS:dS
            for dL=-dS:dS
                
                      
                f1Row = i + (dR + dS);   % row of reference block
                f1Col = j + (dL + dS);   % col of reference block
                
                % calculate MSE error between the two block of the frames
                MSE = ICV_MSE(f1(f1Row:f1Row+blockSize-1,f1Col:f1Col+blockSize-1),f2(i:i+blockSize-1,j:j+blockSize-1),blockSize);

                    if(MSE < MSE_min)
                        MSE_min = MSE;
                        dy = dR;
                        dx = dL;
                        % save motion vectors and origin of the arrow in the middle of the
                        % current block
                        loc(1, iLoc) = j + blockSize/2 -1;
                        loc(2, iLoc) = i + blockSize/2 -1;
                        loc(3, iLoc) = -dx;
                        loc(4, iLoc) = -dy;
                        loc(5, iLoc) =  MSE_min;
                    end
                    
                
            end
        end
        
        % Use motion vectors found to calculate the predicted frame Pt+1
         pF(i:i+blockSize-1,j:j+blockSize-1,:) = f1rgb(i+dy:i+dy+blockSize-1,j+dx:j+dx+blockSize-1,:);
        
    end
end
time = toc;
motionVectors = loc;
predictedFrame = pF;
end