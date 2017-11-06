function [B] = gen_fourier_basis(input_img,p,q)
% This function generates the (p,q)th basis for image I

[M,N] = size(input_img);

B = 0;

for n1 = 0:M-1
    for n2 = 0:N-1
        B = B + input_img(n1,n2) * exp(j*2*pi*((p*n1/M)+(q*n2/N)));
    end
end

end