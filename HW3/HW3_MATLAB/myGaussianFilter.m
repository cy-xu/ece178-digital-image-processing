function filter = myGaussianFilter(height,width,mu,sigma)
% height   : height of the filter kernel matrix
% width    : width of the filter kernel matrix
% mu       : mean 
% sigma    : standard deviation
% filter   : output filter kernel matrix of type double

%% implement your Gaussian filter here
filter = ones(height, width);

for i = -fix(height/2) : 1 : fix(height/2)
    for j = -fix(width/2) : 1 : fix(width/2)
        filter(i + ceil(height/2),j + ceil(width/2)) = exp(-(i^2 + j^2)/(2 * sigma^2)); % +ceil(height/2) because matrix start from 1
    end
end

filter = filter / sum(filter(:));

%% try meshgrid as your second solution
