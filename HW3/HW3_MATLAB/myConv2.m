function output_img = myConv2(input_image, myfilter, padding_method)
% input_image    : noisy input image (type: double)
% myfilter       : filter kernel to be used for convolution (type: double)
% padding_method : string that specifies the type of padding method to be used
% output_img     : output image (type: double)

%% implement your 2D convolution here
[m,n] = size(input_image);

[filterHeight, filterWidth] = size(myfilter);
%% First, perform appropriate padding on the input_image to get padded_input_image
if strcmp(padding_method,'repeating')
    % your code to implement padding using 'repeating' method
    long = [input_image(end-filterHeight:end,:) ; input_image ; input_image(1:filterHeight,:)];
    left = long(:,end-filterHeight:end);
    right = long(:,1:filterHeight);
    padded_input_image = [left long right];
    
elseif strcmp(padding_method,'mirroring')
    % your code to implement padding using 'mirroring' method
    long = [input_image(filterHeight:-1:1,:) ; input_image ; input_image(end:-1:end-filterHeight,:)];
    left = long(:,filterHeight:-1:1);
    right = long(:,end-filterHeight:end);
    padded_input_image = [left long right];
    
else 
    % default zero-padding
    long = [zeros(filterHeight,n) ; input_image ; zeros(filterHeight,n)];
    [p q] = size(long);
    side = zeros(p,filterHeight);
    padded_input_image = [side long side];
end

%% perform convolution operation using the padded_input_image and myfilter to get the output_img
[paddedHeight, paddedWidth] = size(padded_input_image);

% define fiter zone, make sure filter doesn't start from edge
startHeight = filterHeight;
startWidth = filterWidth;
endHeight = paddedHeight - filterHeight;
endWidth = paddedWidth - filterWidth;

output_img = padded_input_image;

for i = startHeight : endHeight
    for j = startWidth : endWidth
        % i and j are location on the padded image
        sum = 0;
        % temprary variable used for store the value of i,j
        for p = -floor(filterHeight/2) : floor(filterHeight/2)
            for q = -floor(filterWidth/2) : floor(filterWidth/2)
                sum = sum + myfilter(floor(filterHeight/2) + p +1 , floor(filterWidth/2) + q +1) * padded_input_image(i + p, j + q);
            end
        end
        output_img(i,j) = sum;
    end
end

output_img = output_img(startHeight+1:endHeight, startWidth+1:endWidth);
