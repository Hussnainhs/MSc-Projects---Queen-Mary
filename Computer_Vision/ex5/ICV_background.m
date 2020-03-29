function background = ICV_background(video)
% Given an object video, generate the reference background sing frame differencing and weighted
% temporal averaging algorithm. Pixel values n the frame differencing above a set threshold 
% are given weight 0 and the pixels below the threshold are given full
% weight 1

weight_1 = 1;
weight_2 = 0;

nFrame=video.NumberOfFrames; 
ref = read(video,1); 
ref = ICV_rgb2gray(ref);
[r,c] =size(ref);
%Pre-allocate space for background image to speedup the process
result = zeros(r,c,3);

for iFrame= 2:nFrame 
    
    ref = read(video,iFrame-1); 
    ref = ICV_rgb2gray(ref);
    
    %Read reference frame as previous frame
    f =read(video,iFrame); 
    f_gray=ICV_rgb2gray(f); 
    
    %Calculate frame differencing 
    f_diff = abs(double(f_gray) - double(ref));
    
    f = im2double(f);
    
    % for each pixel in the frame check if above or below threshold old and
    % add the weighted intesnity.
    for i = 1:r
        for j = 1:c
             if(f_diff(i,j) < 25)
                result(i,j,:) = result(i,j,:) + f(i,j,:)*weight_1; 
             else
                result(i,j,:) = result(i,j,:) + (f(i,j,:)*weight_2);
             end
        end
    end
    
end

% Divide all pixels intesity value by the number of frame in order to
% calculate the average intensity value
background = result./nFrame;

end