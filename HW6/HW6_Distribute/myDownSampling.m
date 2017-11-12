function downsampled_img = myDownSampling(input_img, downsampling_rate, method)

double_img = double(input_img);
filter = double(ones(17,17));
sigma = 5;

if strcmp(method,'No Filtering')
    downsampled_img = input_img(1:downsampling_rate:end,1:downsampling_rate:end);

elseif strcmp(method,'Box filter')
    box = filter * (1/17^2);
    conv_img = uint8(conv2(double_img,box,'same'));
    downsampled_img = conv_img(1:downsampling_rate:end,1:downsampling_rate:end);

else %'Gaussian Filter'
    filter2 = filter;
    for i = -8:1:8
        for j = -8:1:8
            filter2(i + 9,j + 9) = exp(-(i^2 + j^2)/(2 * sigma^2));
            % +9 because matrix start from 1 and kernel size is 17
        end
    end
    
    gauss_filter = filter2 / sum(filter2(:));
    conv_img = uint8(conv2(double_img,gauss_filter,'same'));
    downsampled_img = conv_img(1:downsampling_rate:end,1:downsampling_rate:end);
end

end
