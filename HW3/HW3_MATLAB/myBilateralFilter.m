function outImage = myBilateralFilter(A,w,sigma_s,sigma_r)
% A        : noisy input image (type: double)
% w        : window size for bilateral filter
% sigma_s  : spatial standard deviation for bilateral filter
% sigma_r  : range standar deviation for bilateral filter
% outImage : bilateral filtered output image (type: double)

%% implement bilateral filter here


%% for bw image
function out_img = bilateral_filter(in_img,w,sigma_c,sigma_s);
% matlab code for bilateral filter
% Pre-compute Gaussian distance weights.
[X,Y] = meshgrid(-w:w,-w:w);
C = exp(-(X.^2+Y.^2)/(2*sigma_c^2));
% Apply bilateral filter.
[m,n,c] = size(in_img);
out_img = zeros(m,n,c);
for i = 1:m
   for j = 1:n
       % Extract local region.
       I = in_img(max(i-w,1):min(i+w,m),max(j-w,1):min(j+w,n));
       % Compute Gaussian intensity weights.
       S = exp(-(I-in_img(i,j)).^2/(2*sigma_s^2));
       % Calculate bilateral filter response.
       F = S.*C((max(i-w,1):min(i+w,m))-i+w+1,(max(j-w,1):min(j+w,n))-j+w+1);
       out_img(i,j) = sum(F(:).*I(:))/sum(F(:));         
   end
end

%% for color image

function out_img = bilateral_filter(in_img,w,sigma_c,sigma_s);
% matlab code for bilateral filter]
% Convert input sRGB image to CIELab color space.
% in_img = colorspace('Lab<-RGB',in_img);
% Pre-compute Gaussian distance weights.
[X,Y] = meshgrid(-w:w,-w:w);
C = exp(-(X.^2+Y.^2)/(2*sigma_c^2));
% Rescale range variance (using maximum luminance).
sigma_s = 100*sigma_s;
% Apply bilateral filter.
[m,n,c] = size(in_img);
out_img = zeros(m,n,c);
for i = 1:m
   for j = 1:n
       % Extract local region.
       I = in_img(max(i-w,1):min(i+w,m),max(j-w,1):min(j+w,n),:);
       % Compute Gaussian intensity weights.
       dL = I(:,:,1)-in_img(i,j,1);
       da = I(:,:,2)-in_img(i,j,2);
       db = I(:,:,3)-in_img(i,j,3);
       S = exp(-(dL.^2+da.^2+db.^2)/(2*sigma_s^2));
       
       % Calculate bilateral filter response.
       F = S.*C((max(i-w,1):min(i+w,m))-i+w+1,(max(j-w,1):min(j+w,n))-j+w+1);  
       out_img(i,j,1) = sum(sum(F.*I(:,:,1)))/sum(F(:));
       out_img(i,j,2) = sum(sum(F.*I(:,:,2)))/sum(F(:));
       out_img(i,j,3) = sum(sum(F.*I(:,:,3)))/sum(F(:));
   end
end
% Convert filtered image back to sRGB color space.
% out_img = colorspace('RGB<-Lab',out_img); 

%% third solution

clear all;
close all;
clc;

img=imread('lena.jpg');
img=mat2gray(img);
[m n]=size(img);
imshow(img);

r=10;        %模板半径
imgn=zeros(m+2*r+1,n+2*r+1);
imgn(r+1:m+r,r+1:n+r)=img;
imgn(1:r,r+1:n+r)=img(1:r,1:n);                 %扩展上边界
imgn(1:m+r,n+r+1:n+2*r+1)=imgn(1:m+r,n:n+r);    %扩展右边界
imgn(m+r+1:m+2*r+1,r+1:n+2*r+1)=imgn(m:m+r,r+1:n+2*r+1);    %扩展下边界
imgn(1:m+2*r+1,1:r)=imgn(1:m+2*r+1,r+1:2*r);       %扩展左边界

sigma_d=2;
sigma_r=0.1;
[x,y] = meshgrid(-r:r,-r:r);
w1=exp(-(x.^2+y.^2)/(2*sigma_d^2));     %以距离作为自变量高斯滤波器

h=waitbar(0,'wait...');
for i=r+1:m+r
    for j=r+1:n+r        
        w2=exp(-(imgn(i-r:i+r,j-r:j+r)-imgn(i,j)).^2/(2*sigma_r^2)); %以周围和当前像素灰度差值作为自变量的高斯滤波器
        w=w1.*w2;
        
        s=imgn(i-r:i+r,j-r:j+r).*w;
        imgn(i,j)=sum(sum(s))/sum(sum(w));
    
    end
    waitbar(i/m);
end
close(h)

figure;
imshow(mat2gray(imgn(r+1:m+r,r+1:n+r)));