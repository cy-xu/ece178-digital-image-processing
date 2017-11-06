function output_img = frequency_conv(input_img, conv_kernel)
% input_img: type double
% conv_kernel: type double
% output_img: type double, size same as input_img
%% Write your function here

[height,width] = size(input_img);
[k_height,k_width] = size(conv_kernel);
p_height = height - k_height;
p_width = width - k_width;
r = (k_height-1)/2;

k_padded = padarray(conv_kernel,[p_height p_width],'post');

input_conv = fft2(input_img);
kernel_conv = fft2(k_padded);

z1 = input_conv .* kernel_conv;
z2 = uint8(ifft2(z1));

output_img = circshift(z2,[-r,-r]);
figure
imshow(output_img)

end