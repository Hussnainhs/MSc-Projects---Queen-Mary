function ext_im = ICV_extend(img, h)
% ICV_EXTEND extent the image boundaries by zero padding
% h = number of column/row to extend

[r,c] = size(img);

%preallocate space for extended Image
ext_im = zeros(r+(h*2),c+(h*2)); 

[re,ce] = size(ext_im);
ext_im(1+h:re-h,1+h:ce-h) = img;

% top-left corner
ext_im(1:h,1:h) = 0;

% top-right corner
ext_im(1:1+h,ce-(h-1):ce) = 0;

% bottom-left corner
ext_im(re-(h-1):re,1:h) = 0;

% bottom-right corner
ext_im(re-(h-1):re,ce-(h-1):ce) = 0;

% Top Boundary and Left Boandary
for i = 1:h
    ext_im(i,1+h:ce-h) = 0;
    ext_im(1+h:re-h,i) = 0;
end

% Bottom Boundary and Right Boundary
for i = re-(h-1):re
    ext_im(i,1+h:ce-h) = 0;
end

% Right Boundary
for i = ce-(h-1):ce
    ext_im(1+h:re-h,i) = 0;
end

end