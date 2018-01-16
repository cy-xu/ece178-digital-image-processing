

sexer = zeros(size(input_img_gray,1), 512);
%% 
for k = 1:size(input_img_gray,1)

    sexer(k,:) = ifft(input_img_gray(k, :) ,512);

end
df =  linspace(1,1000,48000);
sex = .5* sin(df);
%%
audiowrite('sex.wav',sex,8000);