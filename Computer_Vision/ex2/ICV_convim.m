function result_im = ICV_convim(img, kernel)
% ICV_CONVIM performs convolution bewtween two arrays of numbers
%
% RESULT_IM = ICV_CONVIM(IMG,KERNEL) performs convolution on the image IMG
% using the given KERNEL and return the resulting array RESULT_IM 

% convert image into grayscale
img = ICV_rgb2gray(img);

% Extend image boundaries 
imgext = ICV_extend(img,kernel);

%convert matrix to vextor
kernel_vec = kernel(:);

% Calculate rows and columns starting point offset
h = floor(size(kernel,1)/2);

% pre-allocate space for the new image
result_im = zeros(size(imgext,1),size(imgext,2));

x = 1;
conv = 0;

% pass the kernel through each image pixel and calculate the corrisponding
% convolution 
for i= 1 + h: size(imgext,1)-h
    for j= 1 + h: size(imgext,2)-h
        for a = i-h:i+h
            for b = j-h:j+h
                 %convert the unsigned intensity value into signed to allow
                 %negative sums
                 temp = int32(imgext(a,b)) * kernel_vec(x);
                 conv = temp + conv;
                 x = x + 1;
            end
        end
        
        %Check if the new intensity values does not exceed the intensity
        %range [0, 255]
        if(conv<0)
            result_im(i,j) = 0;
        else
            if(conv>255)
                result_im(i,j) = 255;
            else
                result_im(i,j) = conv;
            end
        end
        conv = 0;
        x = 1;
    end
end

h = round(size(kernel,1)/2);
[r c] = size(result_im);

%return the result image after removing the extended boundaries
result_im = result_im(h:r-h,h:c-h);
end