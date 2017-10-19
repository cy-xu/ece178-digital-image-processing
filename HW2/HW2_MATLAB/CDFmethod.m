function scaled_img = CDFmethod(input_img)
%% Implement your CDF scaling here
I = input_img;

figure
subplot(2,2,1);
imshow(I);
subplot(2,2,2);
histogram(I);

%% Count number of each grayscale
[m,n] = size(I);
pixel_num = zeros(1,256);

for i = 1:m
    for j = 1:n
        pixel_num(I(i,j) + 1) = pixel_num(I(i,j) + 1) + 1;
    end
end 

%% check if total number of grayscale counts equal to the number of total pixels
% total_pixel_num = 0;
% 
% for i = 1:256
%     total_pixel_num = total_pixel_num + pixel_num(i);
% end

%% calculate the probability of each grayscale bin
pixel_total = m * n;
pixel_prob(1,:) = pixel_num(1,:) / pixel_total;

%% check if pixel_prob adds up to 1
% one = 0;
% 
% for i = 1:256
%     one = one + pixel_prob(i);
% end

%% the CDF
pixel_cum = zeros(1,256);

for i = 1:256
    if i == 1
        pixel_cum(i) = pixel_prob(i);
    else
        pixel_cum(i) = pixel_cum(i - 1) + pixel_prob(i);
    end
end

%% make CDF integer
pixel_cum_int = uint8(255 * pixel_cum + 0.5 );

%% make the new image
scaled_img = uint8(zeros(m,n));

for i = 1:m
    for j = 1:n
        scaled_img(i,j) = pixel_cum_int(I(i,j)+1);
    end
end

subplot(2,2,3);
imshow(scaled_img);
subplot(2,2,4);
histogram(scaled_img);