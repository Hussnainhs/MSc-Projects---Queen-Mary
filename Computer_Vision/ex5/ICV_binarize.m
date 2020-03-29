function result = ICV_binarize(img, threshold)
% Given a grayscale image 'img', generate its binary corresponding image
% according to the threshold value
   
[r c] = size(img);

for i=1:r 
     for j=1:c     
         
            % if pixels value is below threshold set it to 0 as bavkground
            if (img(i,j)<threshold) 
                  result(i,j)=0; 
            else
                  result(i,j)=1;
            end
     end
end 

end