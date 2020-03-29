clc
clear all
close all

img = imread('name.png');

%% Question 1 - PART A -- Image Rotation and Shear -- UNCOMMENT BELOW 

% new_img1 = ICV_imtransform(img,30,0);
% new_img2 = ICV_imtransform(img,60,0);
% new_img3 = ICV_imtransform(img,120,0);
% new_img4 = ICV_imtransform(img,-50,0);
% 
% figure(1)
%             subplot(3,2,1), imshow(img), title('Original');
%             subplot(3,2,3), imshow(new_img1), title('30 Degree Rotation');
%             subplot(3,2,4), imshow(new_img2), title('60 Degree Rotation');
%             subplot(3,2,5), imshow(new_img3), title('120 Degree Rotation');
%             subplot(3,2,6), imshow(new_img4), title('-50 Degree Rotation');
% 
% shear1 = ICV_imtransform(img,0,10);
% shear2 = ICV_imtransform(img,0,40);
% shear3 = ICV_imtransform(img,0,60);
% 
% figure(2)
%             subplot(2,2,1), imshow(img), title('Original');
%             subplot(2,2,2), imshow(shear1), title('10 Degree Shear');
%             subplot(2,2,3), imshow(shear2), title('40 Degree Shear');
%             subplot(2,2,4), imshow(shear3), title('60 Degree Shear');

%% Question 1 - PART B -- Image Rotation+Shear -- UNCOMMENT BELOW

% img8 = ICV_imtransform(img,20,50);
% img9 = ICV_imtransform(img,0,50);
% img9 = ICV_imtransform(img9,20,0);
% 
% figure(3)
%             subplot(2,2,1), imshow(img), title('Original');
%             subplot(2,2,3), imshow(img8), title('Rotation -> Shear');
%             subplot(2,2,4), imshow(img9), title('Shear -> Rotation');
