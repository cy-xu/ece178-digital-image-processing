function rImg = myIDCT_Transform(dctImg)
% dctImg      : DCT transform of the input image (type: double)
% rImg        : recovered image after performing inverse DCT (type: double)

%% implement your inverse DCT transform here

dctImg(abs(dctImg)<0.1)=0;
rImg = idct2(dctImg);
