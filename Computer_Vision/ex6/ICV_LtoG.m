function gDes = ICV_LtoG(lDes)
% Receive in input a cell-array of histograms and return a global
% description as the concatenation of all the histograms in the cell-array

gDes = [];

 for i = 1 : size(lDes,2)
         gDes = [gDes lDes{i}];
 end
 
end