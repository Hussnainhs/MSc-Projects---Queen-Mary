clear all
close all
clc
%% EXERCISE 3 - PART A -- Image Histogram -- UNCOMMENT BELOW 

% img = imread('face-1.jpg');
% histogram = ICV_imhist(img);

%% EXERCISE 3 - PART A -- Video Sequence Histogram -- UNCOMMENT BELOW 

% video = VideoReader('DatasetB.avi');
% video_frames = read(video);
% 
% for iFrame = 1:video.NumberOfFrames
% 
%     histogram = ICV_imhist(video_frames(:,:,:,iFrame));
% 
% end

%% EXERCISE 3 - PART B -- Video Sequence Histogram -- UNCOMMENT BELOW

% video = VideoReader('DatasetB.avi');
% video_frames = read(video);
% 
% for iFrame = 1:video.NumberOfFrames-1
% 
%     f1 = ICV_imhist(video_frames(:,:,:,iFrame));
%     f2 = ICV_imhist(video_frames(:,:,:,iFrame+1));
%     intersection = ICV_intersect(f1,f2);
%     norm = ICV_normHist(intersection);
% 
% end