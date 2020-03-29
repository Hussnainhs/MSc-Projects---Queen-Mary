function histMat = ICV_imhist(img)
% ICV_imhist return and visualize the colour histogram of the input image
% img.
%
% HISTMAT = ICV_IMHIST(IMG) calculate the histogram of the RGB channels of
% the image IMG. HISTMAT is a 3x256 matrix where the rows are the three
% channels Red, Green and Blue and the columns the rispective histograms.

R = size(img,1);
C = size(img,2);

%Pre-allocate space for outout matrix
histMat = zeros(3,256);

result=1:256; 
count=0;

%For each pixel of the three channels, check how many times an intensity value repreats 
for h = 1:3
    for i=1:256
        for a =1:R 
            for b = 1:C
                if img(a, b, h) == i
                      count = count+1;
                end 
            end
        end  
        result(i)=count;
        count=0; 
    end  
    histMat(h,:) = result;
end

%Displays results
 hist = figure(1);
                subplot(3,2,1), imshow(img), title('Original Image');
                subplot(3,2,3),  plot(histMat(1,:), 'Red'), grid on, grid minor, title('Red Channel Histogram');           
                subplot(3,2,4),  plot(histMat(2,:), 'Green'), grid on, grid minor, title('Green Channel Histogram'); 
                subplot(3,2,5),  plot(histMat(3,:), 'Blue'), grid on, grid minor, title('Blue Channel Histogram'); 
                subplot(3,2,6),  plot(histMat(1,:), 'Red'), grid on, grid minor, title('Combined Histogram');
                                 hold on
                                 plot(histMat(2,:), 'Green');
                                 hold on
                                 plot(histMat(3,:), 'Blue');
                                 hold off 
  %save result histogram(s)              
  saveas(hist,'Image_Histogram','jpg')                           
                             
end