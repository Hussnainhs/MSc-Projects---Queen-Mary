clc
clear all
close all

img = imread('face-3.jpg');

%% Ex. 6 - Part A -- UNCOMMENT FIGURE TO SEE RESULTS

n = 4; %divide image into NxN windows
[N_norm N subIm] = ICV_lbpDescriptor(img,n);

% figure,  subplot(3,3,1), imshow(subIm{1},[]), title('Sub-Image LBP'); subplot(3,3,2), plot(N_norm{1}), xlim([0 260]), title('LBB Normalized Histogram'); subplot(3,3,3), plot(N{1}), xlim([0 260]), title('LBB Non-Normalized Histogram');
%          subplot(3,3,4), imshow(subIm{2},[]), title('Sub-Image LBP'); subplot(3,3,5), plot(N_norm{2}), xlim([0 260]), title('LBB Normalized Histogram'); subplot(3,3,6), plot(N{2}), xlim([0 260]), title('LBB Non-Normalized Histogram');
%          subplot(3,3,7), imshow(subIm{3},[]), title('Sub-Image LBP'); subplot(3,3,8), plot(N_norm{3}), xlim([0 260]), title('LBB Normalized Histogram'); subplot(3,3,9), plot(N{3}), xlim([0 260]), title('LBB Non-Normalized Histogram');
%         

%% Ex. 6 - Part B -- UNCOMMENT FIGURE TO SEE RESULTS

% normalized global descriptor
globalDescriptorNorm = ICV_LtoG(N_norm);
% non-normalized global descriptor
globalDescriptor = ICV_LtoG(N);
 
% figure, plot(globalDescriptor,'Red'), title('Global Descriptor');
% figure, plot(globalDescriptorNorm,'Blue'), title('Normalized Global Descriptor');

%% Ex. 6 - Part C -- for part D and E change 'n' at the top of the function

[prediction similarity] = ICV_classify(globalDescriptorNorm,n);

if(prediction == 1)
    disp('The Image is a Car');    
else
    disp('The Image is a Face');
end

fprintf('Intersection similarity = %f \n', similarity);
