function output_img = spatial_conv(input_img, conv_kernel)
% input_img: type double
% conv_kernel: type double
% output_img: type double, size same as input_img
%% Write your function here

k_size = size(conv_kernel);
r = (k_size(1) - 1)/2;

I = padarray(input_img,[r r],'circular','both');

I_conv = uint8(conv2(I,conv_kernel,'valid'));

output_img = I_conv;
end
