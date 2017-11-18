%% UCSB ECE178 (2017 Fall)
% HW8 MATLAB - Radon transform
%% Clean up the variables
clear
clc
close all

%% Radon transform
% Create phantom image
img_size = 256;
P = phantom(img_size);
xp_axis_len = ceil(sqrt(img_size*img_size*2));
xp = (-floor(xp_axis_len/2):1:floor(xp_axis_len/2))';
% Show the original image
figure
imshow(P);
title('Phantom image')

PR_cell = cell(3);
theta_cell = cell(3);

% Define the degrees for the transform
theta_cell{1} = 0:10:170;
theta_cell{2} = 0:5:175;
theta_cell{3} = 0:2:178;

% Radon transform
for i=1:3
    PR_cell{i} = myRadon(P, theta_cell{i});
end

% Visualize the first Radon transform
% Check your result with the one shown in pdf file
figure
imagesc(theta_cell{1},xp,PR_cell{1});
colormap(hot);
colorbar;
xlabel('Parallel Rotation Angle - \theta (degrees)');
ylabel('Parallel Sensor Position - x\prime (pixels)');
title('Sinogram')


%% Filtered back projection (different kinds of filter)
filter_cell = cell(3);
filter_cell{1} = 'Ram-Lak';
filter_cell{2} = 'Shepp-logan';
filter_cell{3} = 'Cosine';

output_filters_cell = cell(3);
for i = 1:3
    output_filters_cell{i} = myInvRadon(PR_cell{2},theta_cell{2},filter_cell{i});
end
display3images(output_filters_cell, 'Output of different filters', filter_cell);


%% Filtered back projection (different number of projections)
filter_ramp_cell = cell(3);
filter_ramp_cell{1} = 'ramp';
filter_ramp_cell{2} = 'ramp';
filter_ramp_cell{3} = 'ramp';

output_thetas_cell = cell(3);
proj_cell = cell(3);
proj_cell{1} = '18';
proj_cell{2} = '36';
proj_cell{3} = '90';

output_proj_cell = cell(3);
for i = 1:3
    output_filters_cell{i} = myInvRadon(PR_cell{i},theta_cell{i}, filter_ramp_cell{i});
end
display3images(output_filters_cell, 'Output of different number of projections (ramp filtered)', proj_cell);
