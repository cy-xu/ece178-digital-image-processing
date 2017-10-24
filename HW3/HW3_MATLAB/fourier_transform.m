image = double(rgb2gray(imread('Leopard.jpg'))) / 255.0;
fourier1 = ifftshift(image);
fourier2 = fft2(fourier1);
fourier3 = fftshift(fourier2);
fourier4 = log(max(real(fourier3),0.0))/20.0;

subplot(2,2,1);
imshow(fourier1);
title('ifftshift(image)');

subplot(2,2,2);
imshow(fourier2);
title('fft2(fourier1)')

subplot(2,2,3);
imshow(fourier3);
title('fftshift(fourier2)')

subplot(2,2,4);
imshow(fourier4);
title('log(max(real(fourier3),0.0))/20.0')

