function [H_norm H N] = ICV_lbpDescriptor(img,n)
% Calculate the LBP image of the first argument 'img', divide it into 'n'
% by 'n' windows and return the normalized feature descriptor of each
% window (H_norm) the non-normalized histogram feature description (H) and the LBP for each window

% Convert image into grayscale
img = ICV_rgb2gray(img);

% Extend image boundaries in order to apply 3x3 LBP
img_ext = ICV_extend(img);

% Pre-allocate space for extended boundaries image
res = ones(size(img_ext,1),size(img_ext,2));

mat = zeros(3,3);

% Calculate LBP of the image using 3x3 window
for r = 2:size(img_ext,1)-1
    for c = 2:size(img_ext,2)-1
        %save current 3x3 imagw window into a matrix and calculate LBP of
        %the center pixel
        mat = [img_ext(r-1,c-1) img_ext(r-1,c) img_ext(r-1,c+1)
               img_ext(r,c-1) img_ext(r,c) img_ext(r,c+1)
               img_ext(r+1,c-1) img_ext(r+1,c) img_ext(r+1,c+1)]; 
        res(r,c) = ICV_lbp(mat);
    end
end

% remove the extended boundary to convert back to the original dimensions
[r c] = size(res);
res = res(2:r-1,2:c-1);

% figure, subplot(1,2,1), imshow(img);
%         subplot(1,2,2), imshow(res,[]);
           
% divide image into nxn equally sized windows

%Pre-allocate space of cell array of nxn windows
for i=1:n*n
     N{i} = zeros(size(img,1)/n,size(img,1)/n);
end

% pixel length of each window
h = (size(res,1)/n);

% starting pixel location for each window: 't' for columns and 'b' for rows
t = 1;
b = 1;

%number of window index
i =1;

for index=1:n   
    for a=1:n
         % "Cut" the image and save as "i" 's window
         N{i} = res(b:b+h-1,t:t+h-1); 
         t = t + h;
         %increment window number 
         i = i+1;
    end
    %Update starting pixel location for the windows
    t = 1;
    b = b + h;    
end

% Calculate Histogram of each window
for i = 1:size(N,2)
    H{i} = ICV_imhist(N{i});
end

% Normalize all windows' histogram
for i = 1:size(H,2)
    H_norm{i} = ICV_normHist(H{i});
end
            
end