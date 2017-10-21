clear all

input_image = rgb2gray(imread('Leopard.jpg'));
m_mask = 3;
height = 3;
width = 3;
sigma = 5;

%% zero
[m n] = size(input_image);
long = [zeros(m_mask,n) ; input_image ; zeros(m_mask,n)];
[p q] = size(long);
side = zeros(p,m_mask);
padded_input_image = [side long side];
figure
imshow(padded_input_image)

%% implement your Gaussian filter here
filter = ones(height, width);

for i = -fix(height/2) : 1 : fix(height/2)
    for j = -fix(width/2) : 1 : fix(width/2)
        filter(i + ceil(height/2),j + ceil(width/2)) = exp(-(i*i + j*j)/(2 * sigma * sigma));
        % +ceil(height/2) because matrix start from 1
    end
end

filter = filter / sum(filter(:));

%% Conv2
[filterHeight, filterWidth] = size(filter);
padded_input_image = im2double(padded_input_image);
output_img = padded_input_image;

[paddedHeight, paddedWidth] = size(padded_input_image);

for i = filterHeight : paddedHeight - filterHeight
    for j = filterWidth : paddedWidth - filterWidth
        % make sure filter doesn't start from edge
        output_img(i,j) = padded_input_image(i - filterHeight, j - filterWidth) * filter;
    end
end