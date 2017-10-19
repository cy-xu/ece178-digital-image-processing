function [] = plotMyHistogram(input_img, num_bins)
%% Implement your code to plot the histogram of an image here 
N = zeros(1,num_bins);
[m,n] = size(input_img);

for i = 1:m
    for j = 1:n
        N(input_img(i,j) + 1) = N(input_img(i,j) + 1) + 1;
    end
end
figure
bar(N)
        
% 
% N = histcounts(input_img, 0:num_bins);
% figure;
% bar(N);