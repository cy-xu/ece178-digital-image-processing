function dctImg = myDCT_Transform(input_image)
% input_image : input image (type: double)
% dctImg      : DCT transform of the input image (type: double)

%% implement your DCT transform here
%input_image = double(rgb2gray(imread('Leopard2.jpg')));

[m,n] = size(input_image);

for k1 = 0:m-1
    for k2 = 0:n-1
        sum = 0;
        for n1 = 0:m-1
            sum2 = 0;
            for n2 = 0:n-1
                sum2 = sum2 + input_image(n1+1, n2+1) * cos((pi/n)*(n2+1/2)*(k2+1/2));
            end
            sum = sum + sum2 * cos((pi/m)*(n1+1/2)*(k1+1/2));
        end
        dctImg(k1+1, k2+1) = 2 * sqrt(1/n)*sqrt(1/m) * sum;
    end
end

% figure
% imshow(dctImg)