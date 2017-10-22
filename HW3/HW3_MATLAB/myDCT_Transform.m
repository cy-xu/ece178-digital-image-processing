function dctImg = myDCT_Transform(input_image)
% input_image : input image (type: double)
% dctImg      : DCT transform of the input image (type: double)

%% implement your DCT transform here

input_image=imread('Leopard.jpg');
input_image = rgb2gray(input_image);%���������ǲ�ɫͼ����ת��Ϊ�Ҷ�ͼ�񣨻Ҷ�ͼ��ʡ����һ����   
c
%��ͼ��DCT�任    
dctgrayImage = dct2(input_image);  
figure(), imshow(log(abs(dctgrayImage)),[]),title('DCT�任�Ҷ�ͼ��'), colormap(gray(4)), colorbar; 

%�ԻҶȾ����������  
dctgrayImage(abs(dctgrayImage)<0.1)=0;   

%DCT��任    
I=idct2(dctgrayImage)/255;    
figure(), imshow(I), title('����DCT�任��Ȼ����任�ĻҶ�ͼ��');   

%�Աȱ任����Ҷ�任ǰ���ͼ��    
figure(), subplot(121), imshow(input_image), title('ԭ�Ҷ�ͼ��'),   
subplot(122), imshow(I), title('DCT��任ͼ��');  

%% ͨ��������ʽʵ����ɢ���ұ任��Y=M*X*N'
%������X�Ƕ�άͼ�����Y�Ǳ任���ϵ������
function Y = dct21(X)
[m,n] = size(X);
AM = zeros(m,m);    %DCTϵ��,��m=n=8ʱ��AM��AN)����JPEG�г��õ�8*8�ı任����
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
X = double(X);      %ע��任��ľ�����������Ϊdouble
Y = AM*X*AN';       %ʵ��DCT��任���������л�ΪY = AM'*AN����

%%%%%%%%%%%%DCT�任������ɺ󣬶���ͼ��Ȼ����ü���
img = imread('marog.bmp');
 
imgdct = dct21(img);        %DCT����任
imgidct = dct22(imgdct);    %DCT��任
figure (1)
subplot(131);
imshow(img);
title('ԭʼͼ��')
subplot(132);
%imshow(imgdct,[]);
imshow(uint8(imgdct))
title('DCT�任ͼ��');
subplot(133);
%imshow(imgidct,[]);
imshow(uint8(imgidct));
title('DCT��任ͼ��');