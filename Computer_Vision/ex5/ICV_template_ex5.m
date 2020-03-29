clc
clear all
close all

video = VideoReader('DatasetC.mpg');
nFrame=video.NumberOfFrames; 
 
%% Ex.5 Part A -- Uncomment Below

%Set 1st frame as reference frame

ref = read(video,1); 
ref = ICV_rgb2gray(ref); 
threshold = 25;

for iFrame=2:nFrame 

    f = read(video,iFrame); 
    f_gray = ICV_rgb2gray(f); 

    %Calculate frame differencing
    f_diff = abs(double(f_gray)-double(ref));
    f_diff = uint8(f_diff);
    
    figure(1), imshow(f_diff);

    %Binarize the image using the threshold value
    result = ICV_binarize(f_diff, threshold);
    
    fig1 = figure(2), imshow(result,[]);
    saveas(fig1,'result','jpg')
end

%% Ex. 5 Part B -- Uncomment Below


% threshold = 25;
% 
% for iFrame=2:nFrame
%     
%     % Set frame-1 pf the current frame as reference frame
%     ref = read(video,iFrame-1); 
%     ref = ICV_rgb2gray(ref);
%     
%     f = read(video,iFrame); 
%     f_gray = ICV_rgb2gray(f); 
%     
%     %Calculate frame differencing
%     f_diff = abs(double(f_gray)-double(ref));
%     f_diff = uint8(f_diff);
%     
%     figure(3), imshow(f_diff);
%     
%     %Binarize the image using the threshold value
%     result = ICV_binarize(f_diff, threshold);
%     
%     figure(4), imshow(result,[]);
%     
% end

%% Ex. 5 Part C -- Uncomment Below

%Generate BAckground reference frame using frame differencing and weighted
%temporal averaging algorithm

% background = ICV_background(video);
% figure(5), imshow(background);
