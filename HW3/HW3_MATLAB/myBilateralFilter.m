function outImage = myBilateralFilter(A,w,sigma_d,sigma_r)
% A        : noisy input image (type: double)
% w        : half window size for bilateral filter. window size = 2*w+1
% sigma_s  : spatial standard deviation for bilateral filter
% sigma_r  : range standar deviation for bilateral filter
% outImage : bilateral filtered output image (type: double)

%% implement bilateral filter here
% clear all;
% close all;
% clc;
% 
% A=imread('Leopard.jpg');
% A=rgb2gray(A);
% 
% 
% figure
% imshow(A);
% w = 20; % filter window size

%% zero padding a new image An

[m,n] = size(A);

long = [zeros(w,n) ; A ; zeros(w,n)];
[mm, nn] = size(long);
side = zeros(mm, w);
An = [side long side];
% figure
% imshow(An)

An = double(An);

%% conform the gaussian filter first
% sigma_d = 3;
% sigma_r = 30;

[x,y] = meshgrid(-w:w,-w:w);
wd = exp(-(x.^2 + y.^2)/(2 * sigma_d^2)); % gaussian filter based on distance
% x^2 + y^2 is the distance to center

%% now calculate the range difference

outImage = zeros(size(An));

for i = w+1 : m+w
    for j = w+1 : n+w
        wr = exp(-((An(i-w:i+w,j-w:j+w) - An(i,j)).^2) / (2 * sigma_r^2));
        % gaussian filter based on range of sorrunding pixels
        wb = wd .* wr;
        s = An(i-w:i+w, j-w:j+w) .* wb;
        outImage(i,j) = sum(s(:)) / sum(wb(:));
    end
end

outImage=uint8(outImage(w+1:w+m,w+1:w+n));
%  figure;
%  imshow(outImage);