%% Chengyuan Xu, ECE178, perm# 6407068

%% Reading image using imread is allowed
I = imread('colorImg.jpg');
imshow(I)
title('Original')

%% Convert image to gray (using rgb2gray is allowed)
I_gray = rgb2gray(I);

%% Flip in horizontal direction

I_flip_horizontal = I_gray(:,end:-1:1,:);

imwrite(I_flip_horizontal,'output_flip_horizontal.bmp');

%% Flip in vertical direction

I_flip_vertical = I_gray(end:-1:1,:,:);

imwrite(I_flip_vertical,'output_flip_vertical.bmp');

%% Inverse the image

I_gray_double = im2double(I_gray);
I_gray_double_inverse = 1 - I_gray_double;
imwrite(I_gray_double_inverse,'output_inverse.bmp');

%I_gray_inverse = 255 - I_gray;

%% Horizontal gradient 

I_gray_double = im2double(I_gray); 

% I_hor_gradient_double = zeros(size(I_gray));
% for y = 1:size(I_gray,1)
%     for x = 2:size(I_gray,2)-1
%         I_hor_gradient_double(y,x) = I_gray_double(y,x+1) - I_gray_double(y,x-1);
%     end
% end

I_hor_gradient_double = I_gray_double(:,3:end) - I_gray_double(:,1:end-2);

% compute the absolute value of gradients
I_hor_gradient_double_abs = abs(I_hor_gradient_double);

% convert to unint to write 
I_hor_gradient_uint8_abs = uint8(I_hor_gradient_double_abs * 255);

% write to memory
imwrite(I_hor_gradient_uint8_abs,'output_hor_grad.bmp');

%% Vertical gradient 

% I_ver_gradient_double = zeros(size(I_gray));
% for x = 1:size(I_gray,2)
%     for y = 2:size(I_gray,1)-1
%         I_ver_gradient_double(y,x) = I_gray_double(y+1,x) - I_gray_double(y-1,x);
%     end
% end

I_ver_gradient_double = I_gray_double(3:end,:) - I_gray_double(1:end-2,:);

% compute the absolute value of gradients
I_ver_gradient_double_abs = abs(I_ver_gradient_double);

% convert to unint to write 
I_ver_gradient_uint8_abs = uint8(I_ver_gradient_double_abs * 255);

% write to memory
imwrite(I_ver_gradient_uint8_abs,'output_ver_grad.bmp');

%% Combine horizontal and vertical gradient

I_gradient_unit8_abs = I_hor_gradient_uint8_abs(2:end-1,:) + I_ver_gradient_uint8_abs(:,2:end-1);
imwrite(I_gradient_unit8_abs,'I_gradient_unit8_abs.bmp')