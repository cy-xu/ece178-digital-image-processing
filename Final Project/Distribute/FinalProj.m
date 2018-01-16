clear;
clc;
close all;

%%% Declaring parameters for the retargeting
minImgSize = 30;                % lowest scale resolution size for min(w, h)
outSizeFactor = [1, 0.65];		% the ration of output image
numScales = 10;                 % number of scales (distributed logarithmically)

%% Preparing data for the retargeting
image = imread('SimakovFarmer.png');
[h, w, ~] = size(image);

targetSize = outSizeFactor .* [h, w];
imageLab = rgb2lab(image); % Convert the source and target Images
imageLab = double(imageLab)/255;


% Gradual Scaling - iteratively icrease the relative resizing scale between the input and
% the output (working in the coarse level).
%% STEP 1 - do the retargeting at the coarsest level

%% STEP 2 - do resolution refinment 
% (upsample for numScales times to get the desired resolution)

%% STEP 3 - do final scale iterations
% (refine the result at the last scale)
