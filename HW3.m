clear all
close all
clc

A = imread('Siamese_twins_full.jpg');
% Credit Nordic Optical Telescope
% NGC 6946
size_A = size(A)
imshow(A)
title('Orignal image')

A_grey = rgb2gray(A);
imshow(A_grey)
title('Grey scale image')
size_A_grey = size(A_grey);

A_grey  = double(A_grey);
[U S V]=svd(A_grey);

%plot of singular values
s=diag(S);
figure()
semilogy(s)
title('singular values semilog scale')
A_grey100 = U(:,1:100)*S(1:100,1:100)*V(:,1:100)';
A_grey50 = U(:,1:50)*S(1:50,1:50)*V(:,1:50)';
A_grey25 = U(:,1:25)*S(1:25,1:25)*V(:,1:25)';
A_grey12 = U(:,1:12)*S(1:12,1:12)*V(:,1:12)';


%spectral norm
r_spectral_norm_100 = s(101)/s(1)
r_spectral_norm_50 = s(51)/s(1)
r_spectral_norm_25 = s(26)/s(1)
r_spectral_norm_12 = s(13)/s(1)




%normalize the matrix (between 0 and 1)
m = max(max(A_grey100));
A_grey100 = A_grey100/m;

m = max(max(A_grey50));
A_grey50 = A_grey50/m;

m = max(max(A_grey25));
A_grey25 = A_grey25/m;

m = max(max(A_grey12));
A_grey12 = A_grey12/m;

figure
subplot(2,2,1)

imshow(A_grey100)
title('100')

subplot(2,2,2)
imshow(A_grey50)
title('50')

subplot(2,2,3)
imshow(A_grey25)
title('25')

subplot(2,2,4)
imshow(A_grey12)
title('12')



%relative spectral norm
for n =10:100
    r_spectral_norm(n-9) = s(n+1)/s(1);    
end
figure
plot(10:100,r_spectral_norm,'b*-')
title('Relative spectral norm')
