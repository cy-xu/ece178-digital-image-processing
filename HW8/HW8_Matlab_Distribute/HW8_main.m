clear,
close all
clc
%% load the image and calculate the energy map
img = imread('fly.jpg');
Img_d = double(img)/255;
EMap = myEnergyFunc(Img_d);
figure,
imshow(EMap)
title('Energy Map')

%% resize the image
[m,n,z] = size(img);
if m > n
    rR = m - n;
    rC = 0;
elseif m < n
    rR = 0;
    rC = n - m;
else
    return;
end

rImg = mySeamCarveResize(Img_d,rC,rR);
figure,
imshow(rImg)
