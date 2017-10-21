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
[paddedHeight, paddedWidth] = size(padded_input_image);

% define fiter zone, make sure filter doesn't start from edge
startHeight = filterHeight;
startWidth = filterWidth;
endHeight = paddedHeight - filterHeight;
endWidth = paddedWidth - filterWidth;

output_img = padded_input_image;

for i = startHeight : endHeight
    for j = startWidth : endWidth
        sum = 0;
        for p = -floor(filterHeight/2) : floor(filterHeight/2)
            for q = -floor(filterWidth/2) : floor(filterWidth/2)
                sum = sum + filter(floor(filterHeight/2) + 1 + p , floor(filterWidth/2) + 1 + q) * padded_input_image(i+p, j+q);
            end
        end
        output_img(i,j) = sum;
    end
end

figure
imshow(output_img);