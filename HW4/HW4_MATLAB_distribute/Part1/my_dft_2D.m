function [F] = my_dft_2D(input_img)
% %% Calculate the Fourier coefficients for the input image
% clear all
% clc
% 
% input_img = imread('../test_img.png');
% input_img = imresize(input_img, [100 100]);
input_img = im2double(input_img);

[N1,N2] = size(input_img);
F = zeros(N1,N2);

for k1 = 1:N1
    for k2 = 1:N2
        % k1, k2 are for coefficient loop F[k1,k2]
        sum = 0;
        for n1 = 1:N1
            for n2 = 1:N2
                % n1, n2 are for loop for image[n1,n2]
                sum = sum + input_img(n1,n2) .* exp(-j.*2*pi*((k1-1).*(n1-1)/N1 + (k2-1).*(n2-1)/N2));
            end
        end
        F(k1,k2) = sum;
    end
end

imshow(F)