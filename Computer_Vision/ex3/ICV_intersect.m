function result = ICV_intersect(f1,f2)
% ICV_INTERSECT return the histogram intersaction of the two histograms f1
% and f2
%
% RESULT  = ICV_INTERSECT(F1,F2) calculate histogram intersaction between
% Image F1 and model F2. RETURN, F1 and F2 are 3x256 matrices where the 3
% rows are the three channels

result = zeros(3,256);

%calculate histogram intersaction using the intersaction formula 
for c = 1:3
    for i = 1:256
        result(c,i) = min( f1(c,i), f2(c,i) );
    end
end

%Visualize the results 
figure(2), subplot(3,1,1), plot(f1(1,:), 'Red'), grid on, grid minor, title('Frame 1 Histogram');
                            hold on 
                        plot(f1(2,:), 'Green');
                            hold on
                        plot(f1(3,:), 'Blue');
                            hold off
                        
        subplot(3,1,2), plot(f2(1,:), 'Red'), grid on, grid minor, title('Frame 2 Histogram');
                           hold on 
                        plot(f2(2,:), 'Green');
                            hold on
                        plot(f2(3,:), 'Blue'); 
                            hold off
        
        subplot(3,1,3), plot(result(1,:), 'Red'), grid on, grid minor, title('Histogram Intersaction');
                            hold on 
                        plot(result(2,:), 'Green'); 
                            hold on
                        plot(result(3,:), 'Blue'); 
                            hold off  
end                            
                            