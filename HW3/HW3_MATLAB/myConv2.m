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
    long = [input_image(m_mask:-1:1,:) ; input_image ; input_image(end:-1:end-m_mask,:)];
    left = long(:,m_mask:-1:1);
    right = long(:,end-m_mask:end);
    padded_input_image = [left long right];
else 
    % default zero-padding
    long = [zeros(m_mask,n) ; input_image ; zeros(m_mask,n)];
    [p q] = size(long);
    side = zeros(p,m_mask);
    padded_input_image = [side long side];
end

%% perform convolution operation using the padded_input_image and myfilter to get the output_img
output_img = padded_input_image;
[paddedHeight, paddedWidth] = size(padded_input_image);

for i = filterHeight : paddedHeight - filterHeight
    for j = filterWidth : paddedWidth - filterWidth
        % make sure filter doesn't start from edge
        output_img(i,j) = padded_input_image(i,j) * myfilter;
    end
end

%(filterSizeM:end-filterSizeM,filterSizeN:end-filterSizeN));


