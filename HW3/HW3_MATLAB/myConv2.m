function output_img = myConv2(input_image, myfilter, padding_method)
% input_image    : noisy input image (type: double)
% myfilter       : filter kernel to be used for convolution (type: double)
% padding_method : string that specifies the type of padding method to be used
% output_img     : output image (type: double)

%% implement your 2D convolution here


%% First, perform appropriate padding on the input_image to get padded_input_image
if strcmp(padding_method,'repeating')
    % your code to implement padding using 'repeating' method
elseif strcmp(padding_method,'mirroring')
    % your code to implement padding using 'mirroring' method
else 
    % default zero-padding
end

%% perform convolution operation using the padded_input_image and myfilter to get the output_img
