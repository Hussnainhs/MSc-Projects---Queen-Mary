function grayscale = ICV_rgb2gray(img)
%Check if the image 'img' is RGB, if yes, then return the converted
%grayscale image

if size(img,3)==3
    grayscale = 0.299 * img(:,:,1) + 0.587 * img(:,:,2) + 0.114 * img(:,:,3);
else
    grayscale = img;
end

end