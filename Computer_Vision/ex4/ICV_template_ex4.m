clc
close all
clear all

%Read dataset video
video = VideoReader('DatasetC.mpg');
video_frames = read(video);
f1rgb = video_frames(:,:,:,8);
f2rgb = video_frames(:,:,:,9);

%% Ex. 4 Part A and B -- 

% blockW = zeros(16,16);
% searchW = zeros(20,20);
% 
% [vectors pF time] = ICV_fullSearch(f1rgb, f2rgb, blockW, searchW);
% 
% % % Display the motion vectors superimposed on f2
% figure(1), imshow(f2rgb); 
% hold on
% quiver(vectors(1,:),vectors(2,:),vectors(3,:),vectors(4,:),'linewidth',2); 
% hold off
% 
% % % Display the predicted frame f2 built by using the motion vectors
% figure(2), subplot(1,2,1), imshow(f2rgb,[]), title('Frame It+1'); 
%            subplot(1,2,2), imshow(pF,[]), title('Prediction of Frame It+1'); 
%% Ex 4. Part C -- Uncomment Below and run 

% % 4x4 block size and 16x16 search window size
% blockW = zeros(4,4);
% searchW = zeros(16,16);
% [vectors pF1 time] = ICV_fullSearch(f1rgb, f2rgb, blockW, searchW);
% 
% % 8x8 block size and 16x16 search window size
% blockW = zeros(8,8);
% searchW = zeros(16,16);
% [vectors pF2 time] = ICV_fullSearch(f1rgb, f2rgb, blockW, searchW);
% 
% % 16x16 block size and 16x16 search window size
% blockW = zeros(16,16);
% searchW = zeros(16,16);
% [vectors pF3 time] = ICV_fullSearch(f1rgb, f2rgb, blockW, searchW);
% 
% figure(3), subplot(1,3,1), imshow(pF1,[]), title('4x4 block size and 16x16 search window size');
%            subplot(1,3,2), imshow(pF2,[]), title('8x8 block size and 16x16 search window size');
%            subplot(1,3,3), imshow(pF3,[]), title('16x16 block size and 16x16 search window size');

%% Ex 5. Part D -- Uncomment Below and run 

% % 8x8 block size and 16x16 search window size
% blockW = zeros(8,8);
% searchW = zeros(8,8);
% [vectors pF4 time] = ICV_fullSearch(f1rgb, f2rgb, blockW, searchW);
% 
% % 8x8 block size and 16x16 search window size
% blockW = zeros(8,8);
% searchW = zeros(16,16);
% [vectors pF5 time] = ICV_fullSearch(f1rgb, f2rgb, blockW, searchW);
% 
% % 8x8 block size and 16x16 search window size
% blockW = zeros(8,8);
% searchW = zeros(32,32);
% [vectors pF6 time] = ICV_fullSearch(f1rgb, f2rgb, blockW, searchW);
% 
% figure(4), subplot(1,3,1), imshow(pF4,[]), title('8x8 block size and 8x8 search window size');
%            subplot(1,3,2), imshow(pF5,[]), title('8x8 block size and 16x16 search window size');
%            subplot(1,3,3), imshow(pF6,[]), title('8x8 block size and 32x32 search window size');

%% Ex. 4 Part E -- Uncomment Below and run

% blockW = zeros(4,4);
% searchW = zeros(32,32); 
% [vectors pF time] = ICV_fullSearch(f1rgb, f2rgb, blockW, searchW);
% time1 = time;
% 
% % % % % % % % % % % % % % % % % % % % % % 
% 
% blockW = zeros(8,8);
% searchW = zeros(32,32);
% [vectors pF time] = ICV_fullSearch(f1rgb, f2rgb, blockW, searchW);
% time2 = time;
% % % % % % % % % % % % % % % % % % % % % % 
% 
% blockW = zeros(16,16);
% searchW = zeros(32,32);
% [vectors pF time] = ICV_fullSearch(f1rgb, f2rgb, blockW, searchW);
% time3 = time;
% % % % % % % % % % % % % % % % % % % % % %
% 
% blockW = zeros(32,32);
% searchW = zeros(32,32);
% [vectors pF time] = ICV_fullSearch(f1rgb, f2rgb, blockW, searchW);
% time4 = time;
% % % % % % % % % % % % % % % % % % % % % 
% 
% x = [0 8 12 14];
% y = [time4 time3 time2 time1];
% 
% figure(5), subplot(2,1,1), plot(x,y), title('Execution time against window size variation'), xlabel('Maximum displacement'), ylabel('Time (s)');
% 
% % % % -----------------------------------------
% 
% blockW = zeros(8,8);
% searchW = zeros(36,36); 
% [vectors pF time] = ICV_fullSearch(f1rgb, f2rgb, blockW, searchW);
% time1 = time;
% % % % % % % % % % % % % % % % % % % % % % 
% 
% blockW = zeros(8,8);
% searchW = zeros(32,32);
% [vectors pF time] = ICV_fullSearch(f1rgb, f2rgb, blockW, searchW);
% time2 = time;
% % % % % % % % % % % % % % % % % % % % % % 
% 
% blockW = zeros(8,8);
% searchW = zeros(24,24);
% [vectors pF time] = ICV_fullSearch(f1rgb, f2rgb, blockW, searchW);
% time3 = time;
% % % % % % % % % % % % % % % % % % % % % %
% 
% blockW = zeros(8,8);
% searchW = zeros(8,8);
% [vectors pF time] = ICV_fullSearch(f1rgb, f2rgb, blockW, searchW);
% time4 = time;
% 
% 
% x = [0 8 12 14];
% y = [time4 time3 time2 time1];
% 
% figure(5), subplot(2,1,2), plot(x,y), title('Execution time against window size variation'), xlabel('Maximum displacement'), ylabel('Time (s)');