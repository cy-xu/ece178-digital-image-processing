function [R] = get_recon_image(M,N,F,B,p,q)
% This function weighs the basis with its corresponding fourier
% coefficient.

F = abs(F);

R = 1/M*N * F(p,q) * B;

end