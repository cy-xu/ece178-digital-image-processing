function outImg = myRichardsonLucy(Img,PSF,iter)
n = 0;
Img = double(Img);
PSF_flipped = PSF(end:-1:1,end:-1:1);
Img_new = Img;

while n <= iter
    %u = conv2(Img,PSF,'same');
    Img_new = Img_new .* (conv2(Img./conv2(Img_new,PSF,'same'),PSF_flipped,'same'));
    n = n+1;
end

outImg = Img_new;

end