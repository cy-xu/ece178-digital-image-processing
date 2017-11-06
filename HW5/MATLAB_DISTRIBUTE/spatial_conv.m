function output_img = spatial_conv(input_img, conv_kernel)
% input_img: type double
% conv_kernel: type double
% output_img: type double, size same as input_img
%% Write your function here
% clear all
% close all
% load('kernel4.mat'); 
% input_img = imread('elaine_512.png');
kernalsize = size(conv_kernel);

I = padarray(input_img,[13 13],'circular','both');
% subplot(1,4,1);
% imshow(I)

I_conv = uint8(conv2(I,conv_kernel,'valid'));
% subplot(1,4,2);
% imshow(I_conv)

output_img = I_conv;
end
