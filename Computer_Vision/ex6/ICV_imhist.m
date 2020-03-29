function histMat = ICV_imhist(img)
% ICV_imhist return the histogram of the input image
% img.


R = size(img,1);
C = size(img,2);

%Pre-allocate space for outout matrix
histMat = zeros(1,256);
result=1:256; 
count=0;

%For each pixel of the three channels, check how many times an intensity value repreats 
    for i=1:256
        for a =1:R 
            for b = 1:C
                if img(a, b) == i
                      count = count+1;
                end 
            end
        end  
        result(i)=count;
        count=0; 
    end  
    
histMat = result;

%Displays results
% figure,     subplot(1,2,1), imshow(img,[]), title('Original Image'); 
%             subplot(1,2,2),  plot(histMat), grid on, grid minor,xlim([1 256]), title('Image Histogram');

  %save result histogram(s)              
%   saveas(hist,'Image_Histogram','jpg')                           
                             
end