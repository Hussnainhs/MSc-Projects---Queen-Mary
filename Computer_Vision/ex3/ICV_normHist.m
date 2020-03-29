function result = ICV_normHist(intersaction)
% ICV_NORMHIST(INTERSACTION) return the normalized histogram intersaction 
%
% RESULT = ICV_NORMHIST(INTERSACTION) normalize the input histogram inersaction INTERSACTION, RESULT store the normalized histogram

result = zeros(3,256);

%find maximum intensity value in each channel
redMax = max(intersaction(1,:));
greenMax = max(intersaction(2,:));
blueMax = max(intersaction(3,:));

%normalize the three channels
result(1,:) = intersaction(1,:)/redMax;
result(2,:) = intersaction(2,:)/greenMax;
result(3,:) = intersaction(3,:)/blueMax;

%Visualize the results 
figure(3), subplot(2,1,1), plot(intersaction(1,:), 'Red'), grid on, grid minor, title('Histogram Intersaction');
                            hold on 
                            plot(intersaction(2,:), 'Green'); 
                            hold on
                            plot(intersaction(3,:), 'Blue'); 
                            hold off
                            
           subplot(2,1,2), plot(result(1,:), 'Red'), grid on, grid minor, title('Normalized Histogram Intersaction');
                            hold on 
                            plot(result(2,:), 'Green'); 
                            hold on
                            plot(result(3,:), 'Blue'); 
                            hold off
end                            