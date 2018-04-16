%Using SVD to analyze images

%part a
load mandril.mat; %load the matric into matlab
image(X); colormap(map) %display the matrix

%part b
[U,S,V]=svd(X); %compute SVD and return to 3 matrices
stem(diag(S)); grid %plot singular value

%part c
%rank 1 approximation of image X
subplot(2,2,1)
X_1 = U(:,1)*S(1,1)*V(:,1)'
image(X_1); colormap(map)
title('k = 1');

%rank 2 approximation of image X
subplot(2,2,2)
X_2 = X_1 + U(:,2)*S(2,2)*V(:,2)'
image(X_2); colormap(map)
title('k = 2');






