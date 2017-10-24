function dctImg = myDCT_Transform(input_image)
% input_image : input image (type: double)
% dctImg      : DCT transform of the input image (type: double)

%% implement your DCT transform here

% I understood how DCT works but couldn't figure out the matlab
% implementation.

dctImg = dct2(input_image);  
