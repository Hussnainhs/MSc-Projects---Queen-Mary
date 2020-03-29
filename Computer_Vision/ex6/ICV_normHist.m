function result = ICV_normHist(histo)
% ICV_NORMHIST(histo) return the normalized histogram 'histo'
%

result = zeros(1,256);

%find maximum intensity value in each channel
maxv = max(histo);

%normalize the three channels
result = histo(1,:)/maxv;

%Visualize the results 
% figure, subplot(2,1,1), plot(histo,'Red'), grid on, grid minor, title('Histogram');                           
%            subplot(2,1,2), plot(result,'Blue'), grid on, grid minor, title('Normalized Histogram');

end                            