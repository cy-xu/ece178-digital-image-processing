function rImg = myIDCT_Transform(dctImg)
% dctImg      : DCT transform of the input image (type: double)
% rImg        : recovered image after performing inverse DCT (type: double)

%% implement your inverse DCT transform here
[m,n] = size(dctImg);

for k1 = 0:m-1
    for k2 = 0:n-1
        sum = 0;
        for n1 = 0:m-1
            sum2 = 0;
            for n2 = 0:n-1
                %sum2 = sum2 + input_image(x+1,y+1) * cos((((2*y)+1)*pi*((2*j)+1))/(4*n));
                sum2 = sum2 + dctImg(n1+1, n2+1) * cos((pi/n)*(n2+1/2)*(k2+1/2));
            end
            sum = sum + sum2 * cos((pi/m)*(n1+1/2)*(k1+1/2));
        end
        rImg(k1+1, k2+1) = 2*sqrt(1/n)*sqrt(1/m) * sum;
    end
end
