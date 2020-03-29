function [result similarity] = ICV_classify(imgDescriptor,n)
%given a image global descriptor, return 1 if the image is a car, 0 if it a face.
%return also the intersaction value;
%n is the number of sub-images into which the input image was divided in
%order to calculate its global description

%load sample images, 1 of a face and 1 of a car
car = imread('car-1.jpg');
face = imread('face-2.jpg');

%get normalized nxn local descriptors of the two sample image
[carLBP ~] = ICV_lbpDescriptor(car,n);
[faceLBP ~] = ICV_lbpDescriptor(face,n);

%convert them into global descriotion
carDescriptor = ICV_LtoG(carLBP);
faceDescriptor = ICV_LtoG(faceLBP);

%calculate intersaction of the input image global descriptor with the two
%samples
carSimilarity = ICV_intersection(carDescriptor, imgDescriptor);
faceSimilarity = ICV_intersection(faceDescriptor, imgDescriptor);

y = [carSimilarity faceSimilarity];
% bar(y)

%image classification prediction
if(carSimilarity>faceSimilarity)
    result = 1;
    similarity = carSimilarity;
else
    result = 2;
    similarity = faceSimilarity;

end