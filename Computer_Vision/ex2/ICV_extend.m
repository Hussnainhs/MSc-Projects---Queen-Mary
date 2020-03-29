function ext_im = ICV_extend(img, kernel)
% ICV_EXTEND extent the image boundaries by copying the intensity value of
% the first and last column and row
%


h= floor((size(kernel,1)/2));
[r,c] = size(img);

%preallocate space for extended Image
ext_im = zeros(r+(h*2),c+(h*2)); 

[re,ce] = size(ext_im);
ext_im(1+h:re-h,1+h:ce-h) = img;

% top-left corner
ext_im(1:h,1:h) = img(1,1);

% top-right corner
ext_im(1:1+h,ce-(h-1):ce) = img(1,c);

% bottom-left corner
ext_im(re-(h-1):re,1:h) = img(r,1);

% bottom-right corner
ext_im(re-(h-1):re,ce-(h-1):ce) = img(r,c);

% Top Boundary and Left Boandary
for i = 1:h
    ext_im(i,1+h:ce-h) = img(1,:);
    ext_im(1+h:re-h,i) = img(:,1);
end

% Bottom Boundary and Right Boundary
for i = re-(h-1):re
    ext_im(i,1+h:ce-h) = img(r,:);
end

% Right Boundary
for i = ce-(h-1):ce
    ext_im(1+h:re-h,i) = img(:,c);
end

end