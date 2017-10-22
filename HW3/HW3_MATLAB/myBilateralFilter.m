%function outImage = myBilateralFilter(A,w,sigma_d,sigma_r)
% A        : noisy input image (type: double)
% w        : window size for bilateral filter
% sigma_s  : spatial standard deviation for bilateral filter
% sigma_r  : range standar deviation for bilateral filter
% outImage : bilateral filtered output image (type: double)

%% implement bilateral filter here
clear all;
close all;
clc;

A=imread('Leopard.jpg');
A=rgb2gray(A);

[m,n]=size(A);
figure
imshow(A);
w = 20; % filter window size
r = w/2;  % radius of the fliter

%% zero padding
long = [zeros(r,n) ; A ; zeros(r,n)];
[mm, nn] = size(long);
side = zeros(mm, r);
An = [side long side];
figure
imshow(An)
An=double(An);
%% 
sigma_d = 3;
sigma_r = 30;
[x,y] = meshgrid(-r:r,-r:r);
wd = exp(-(x.^2 + y.^2)/(2 * sigma_d^2)); % gaussian filter based on distance
% x^2 + y^2 is the distance to center

A_filtered = zeros(size(An));
for i = r+1 : m+r
    for j = r+1 : n+r
        wr = exp(-((An(i-r:i+r,j-r:j+r) - An(i,j)).^2 / (2 * sigma_r^2)));
        % gaussian filter based on range of sorrunding pixels
        w = wd .* wr;
        
        s = An(i-r:i+r, j-r:j+r) .* w;
        A_filtered(i,j) = sum(s(:)) / sum(w(:));
    end
end

A_filtered=uint8(A_filtered);
figure;
imshow(A_filtered(r+1:m+r , r+1:n+r));