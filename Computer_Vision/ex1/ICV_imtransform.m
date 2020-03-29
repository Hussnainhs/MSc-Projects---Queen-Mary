function result_im = ICV_imtransform(I, theta_1, theta_2)
% ICV_IMTRANSFORM Rotate an image with the first angle and
% horizontally skew it with the second angle 
% 
% RESULTIM = ICV_IMTRANSFORM(IMG, THETA1, THETA2) rotate IMG with angle
% THETA1 and then horizontally skew it with angle THETA2

if ~(theta_1 == 0)

    %calculate middle x and y of the image (center of the image)
    x_mid=round(size(I,1)/2);                                                            
    y_mid=round(size(I,2)/2);
    
    %calculate the new image size according to the angle theta_1   
    r=round(size(I,1)*abs(cosd(theta_1))+size(I,2)*abs(sind(theta_1)));                      
    c=round(size(I,1)*abs(sind(theta_1))+size(I,2)*abs(cosd(theta_1)));  

    %define and pre-allocate space in memory for the rotated image using the new
    %dimensions calculated
    result_im = zeros(r,c,3,'uint8');

    %calculate middle x and y of the new image (center of the image)
    rx_mid=round(size(result_im,1)/2);
    ry_mid=round(size(result_im,2)/2);

    %for each pixel of the new image, calculate the corresponding pixel of the
    %original image applying the 2D rotation matrix with respect to the image
    %center point 
    for i=1:size(result_im,1)
        for j=1:size(result_im,2)
 
             %apply 2D Rotation Matrix with respect to the image center
             x = round((i-rx_mid) * cosd(theta_1) - (j-ry_mid) * sind(theta_1))+x_mid;
             y = round((i-rx_mid) * sind(theta_1) + (j-ry_mid) * cosd(theta_1))+y_mid;
             
             %check if the calculated location is positive and within the original image
             %boundaries 
             if (x> 0 && y> 0 && x<=size(I,1) && y<=size(I,2))
                result_im(i,j,:) = I(x,y,:);
             end

        end  
    end
else 
    result_im = I;
end

if ~(theta_2 == 0)
    %calculate middle x and y of the image (center of the image)
    x_mid=ceil(size(result_im,1)/2);                                                            
    y_mid=ceil(size(result_im,2)/2);

    %calculate the shear factor    
    sh = 1/tand(90-theta_2);

    %calculate the new image length size according to the angle theta_2
    c = round(size(result_im,2)+(abs(cosd(90-theta_2))*size(result_im,1)));  
    
    %define and pre-allocate space in memory for the skewed image using the new
    %dimensions calculated    
    shear_img = zeros(size(result_im,1),c,3,'uint8');

    %calculate middle x and y of the new image (center of the image)    
    sr_mid=round(size(shear_img,1)/2);
    sy_mid=round(size(shear_img,2)/2);

    %for each pixel of the new image, calculate the corresponding pixel of the
    %original image applying the shear matrix with respect to the image
    %center point     
    for i=1:size(shear_img,1)
        for j=1:size(shear_img,2)
            
             %apply shear Matrix with respect to the image center            
             x = round((i-sr_mid) )+x_mid;
             y = round((i-sr_mid)*sh + (j-sy_mid))+y_mid;
    
             %check if the calculated location is positive and within the original image
             %boundaries
             if (x> 0 && y> 0 && x<=size(result_im,1) && y<=size(result_im,2))
                shear_img(i,j,:) = result_im(x,y,:);
             end        
        end
    end
    result_im = shear_img;
end

end