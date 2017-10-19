function scaled_img = linearStretching(input_img, start_intensity, end_intensity, stretching_x)
%% Implement your linear stretching  here 
scaled_img = (input_img - start_intensity) * stretching_x;