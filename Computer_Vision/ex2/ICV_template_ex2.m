clear all
close all
clc

image = imread('car-1.jpg');

%% Question 2 - Part A - UNCOMMENT BELOW

% C = [ 1/9 1/9 1/9
%        1/9 1/9 1/9
%        1/9 1/9 1/9];
% 
% img1 = ICV_convim(image,C);
% fig1 = figure(1); 
%                     subplot(1,2,1),   imshow(image), title('Original Image');
%                     subplot(1,2,2),   imshow(img1,[]), title('Image after filtering');
% saveas(fig1,'Average_filter','jpg')

%% Question 2 - Part A - UNCOMMENT BELOW
 
% A = 1/16*[ 1 2 1
%            2 4 2
%            1 2 1 ];
% 
% B = [ 0 1 0
%       1 -4 1
%       0 1 0 ];
%    
% img2 = ICV_convim(image,A);
% img3 = ICV_convim(image,B);  
% fig2 = figure(2);
%                     subplot(1,3,1), imshow(image), title('Original Image');
%                     subplot(1,3,2), imshow(img2,[]), title('After convolution with kernel A');
%                     subplot(1,3,3), imshow(img3,[]), title('After convolution with kernel B');
% saveas(fig2,'Kernel_A_B','jpg')

%% Question 3 - Part C - UNCOMMENT BELOW

% img4 = ICV_convim(image,A);
% img4 = ICV_convim(img4,A); 
% 
% img5 = ICV_convim(image,A);
% img5 = ICV_convim(img5,B);
% 
% img6 = ICV_convim(image,B);
% img6 = ICV_convim(img6,A);
% 
% fig3 = figure(3);
%                     subplot(1,4,1), imshow(image),  title('Original Image');
%                     subplot(1,4,2), imshow(img4,[]), title('A followed by A');
%                     subplot(1,4,3), imshow(img5,[]), title('A followed by B');
%                     subplot(1,4,4), imshow(img6,[]), title('B followed by A');
% saveas(fig3,'Consecutive_filtering_3X3','jpg')

%% Question 3 - Part D - UNCOMMENT BELOW

%  A5 = 1/52*[ 1 1 2 1 1 
%         1 2 4 2 1
%         2 4 8 4 2
%         1 2 4 2 1
%         1 1 2 1 1 ];
%     
%  A7 = 1/128* [ 1 1 1 2 1 1 1  
%         1 1 2 4 2 1 1 
%         1 2 4 8 4 2 1 
%         2 4 8 16 8 4 2 
%         1 2 4 8 4 2 1 
%         1 1 2 4 2 1 1 
%         1 1 1 2 1 1 1 ]; 
% 
%  B5 = [ 0 0 1 0 0
%         0 1 1 1 0
%         1 1 -12 1 1
%         0 1 1 1 0
%         0 0 1 0 0 ]; 
%  
%  B7 = [ 0 0 0 1 0 0 0
%         0 0 1 1 1 0 0
%         0 1 1 1 1 1 0
%         1 1 1 -24 1 1 1
%         0 1 1 1 1 1 0
%         0 0 1 1 1 0 0
%         0 0 0 1 0 0 0 ];
% 
% % Using Kernel A and B 5x5 
% img7 = ICV_convim(image,A5);
% img7 = ICV_convim(img7,A5); 
% 
% img8 = ICV_convim(image,A5);
% img8 = ICV_convim(img8,B5);
% 
% img9 = ICV_convim(image,B5);
% img9 = ICV_convim(img9,A5);
% 
% % Using Kernel A and B 7x7 
% img10 = ICV_convim(image,A7);
% img10 = ICV_convim(img10,A7); 
% 
% img11 = ICV_convim(image,A7);
% img11 = ICV_convim(img11,B7);
% 
% img12 = ICV_convim(image,B7);
% img12 = ICV_convim(img12,A7);
% 
% fig4 = figure(4);  
%                     subplot(3,3,1), imshow(img4,[]), title('A followed by A 3x3');
%                     subplot(3,3,2), imshow(img5,[]), title('A followed by B 3x3');
%                     subplot(3,3,3), imshow(img6,[]), title('B followed by A 3x3');
% 
%                     subplot(3,3,4), imshow(img7,[]), title('A followed by A 5x5');
%                     subplot(3,3,5), imshow(img8,[]), title('A followed by B 5x5');
%                     subplot(3,3,6), imshow(img9,[]), title('B followed by A 5x5');
% 
%                     subplot(3,3,7), imshow(img10,[]), title('A followed by A 7x7');
%                     subplot(3,3,8), imshow(img11,[]), title('A followed by B 7x7');
%                     subplot(3,3,9), imshow(img12,[]), title('B followed by A 7x7');
%                     
% saveas(fig4,'Consecutive_filtering_comparison','jpg')                     