function dctImg = myDCT_Transform(input_image)
% input_image : input image (type: double)
% dctImg      : DCT transform of the input image (type: double)

%% implement your DCT transform here

input_image=imread('Leopard.jpg');
input_image = rgb2gray(input_image);%如果读入的是彩色图像则转化为灰度图像（灰度图像省略这一步）   
c
%对图像DCT变换    
dctgrayImage = dct2(input_image);  
figure(), imshow(log(abs(dctgrayImage)),[]),title('DCT变换灰度图像'), colormap(gray(4)), colorbar; 

%对灰度矩阵进行量化  
dctgrayImage(abs(dctgrayImage)<0.1)=0;   

%DCT逆变换    
I=idct2(dctgrayImage)/255;    
figure(), imshow(I), title('经过DCT变换，然后逆变换的灰度图像');   

%对比变换傅里叶变换前后的图像    
figure(), subplot(121), imshow(input_image), title('原灰度图像'),   
subplot(122), imshow(I), title('DCT逆变换图像');  

%% 通过矩阵形式实现离散余弦变换，Y=M*X*N'
%参数：X是二维图像矩阵，Y是变换后的系数矩阵
function Y = dct21(X)
[m,n] = size(X);
AM = zeros(m,m);    %DCT系数,当m=n=8时，AM（AN)就是JPEG中常用的8*8的变换矩阵
AN = zeros(n,n);
for i = 0:m-1
    for j = 0:m-1
        if i == 0
            AM(i+1,j+1) = sqrt(1/m)*cos(((2*j+1)*i*pi)/(2*m));
        else
            AM(i+1,j+1) = sqrt(2/m)*cos(((2*j+1)*i*pi)/(2*m));
        end
    end
end
for i = 0:n-1
    for j = 0:n-1
        if i == 0
            AN(i+1,j+1) = sqrt(1/n)*cos(((2*j+1)*i*pi)/(2*n));
        else
            AN(i+1,j+1) = sqrt(2/n)*cos(((2*j+1)*i*pi)/(2*n));
        end
    end
end
X = double(X);      %注意变换后的矩阵数据类型为double
Y = AM*X*AN';       %实现DCT逆变换仅仅将本行换为Y = AM'*AN即可

%%%%%%%%%%%%DCT变换函数完成后，读入图像，然后调用即可
img = imread('marog.bmp');
 
imgdct = dct21(img);        %DCT正向变换
imgidct = dct22(imgdct);    %DCT逆变换
figure (1)
subplot(131);
imshow(img);
title('原始图象')
subplot(132);
%imshow(imgdct,[]);
imshow(uint8(imgdct))
title('DCT变换图象');
subplot(133);
%imshow(imgidct,[]);
imshow(uint8(imgidct));
title('DCT逆变换图象');