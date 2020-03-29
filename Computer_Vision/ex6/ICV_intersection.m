function intersection = ICV_intersection(h1, h2)
% Given two histogram h1 and h2, return the scalar intersection value

n = size(h1,2);
intersection = 0;

for j = 1: n
    intersection = intersection + min(h1(1,j),h2(1,j));   
end

intersection =intersection/255;

end