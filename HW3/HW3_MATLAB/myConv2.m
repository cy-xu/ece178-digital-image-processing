function output_img = myConv2(input_image, myfilter, padding_method)
% input_image    : noisy input image (type: double)
% myfilter       : filter kernel to be used for convolution (type: double)
% padding_method : string that specifies the type of padding method to be used
% output_img     : output image (type: double)

%% implement your 2D convolution here
[m,n] = size(input_image);

[mf, nf] = size(myfilter);
%% First, perform appropriate padding on the input_image to get padded_input_image
if strcmp(padding_method,'repeating')
    % your code to implement padding using 'repeating' method
    long = [input_image(end-mf:end,:) ; input_image ; input_image(1:mf,:)];
    left = long(:,end-mf:end);
    right = long(:,1:mf);
    padded_input_image = [left long right];
    
elseif strcmp(padding_method,'mirroring')
    % your code to implement padding using 'mirroring' method
    long = [input_image(mf:-1:1,:) ; input_image ; input_image(end:-1:end-mf,:)];
    left = long(:,mf:-1:1);
    right = long(:,end-mf:end);
    padded_input_image = [left long right];
    
else 
    % default zero-padding
    long = [zeros(mf,n) ; input_image ; zeros(mf,n)];
    [p q] = size(long);
    side = zeros(p,mf);
    padded_input_image = [side long side];
end

%% perform convolution operation using the padded_input_image and myfilter to get the output_img
[paddedHeight, paddedWidth] = size(padded_input_image);

% define fiter zone, make sure filter doesn't start from edge
startHeight = mf;
startWidth = nf;
endHeight = paddedHeight - mf;
endWidth = paddedWidth - nf;

output_img = padded_input_image;

for i = startHeight : endHeight
    for j = startWidth : endWidth
        % i and j are location on the padded image
        sum = 0;
        % temprary variable used for store the value of i,j
        for p = -floor(mf/2) : floor(mf/2)
            for q = -floor(nf/2) : floor(nf/2)
                % p & q move around inside the filter mask
                sum = sum + myfilter(floor(mf/2) +p +1 , floor(nf/2) +q +1) * padded_input_image(i + p, j + q);
            end
        end
        output_img(i,j) = sum;
    end
end

output_img = output_img(startHeight+1:endHeight, startWidth+1:endWidth);
