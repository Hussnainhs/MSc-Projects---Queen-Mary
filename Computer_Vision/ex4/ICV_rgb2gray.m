function grayscale = ICV_rgb2gray(img)
% ICV_rgb2gray convert a rgb image into grayscale
%

%check if the image has 3 channels
if size(img,3)==3
    grayscale = 0.299 * img(:,:,1) + 0.587 * img(:,:,2) + 0.114 * img(:,:,3);
else
    grayscale = img;
end

end
