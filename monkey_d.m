%Problem 3 part d
%Using SVD to analyze images

%part a
load mandril.mat; %load the matric into matlab
image(X); colormap(map) %display the matrix

%part b
[U,S,V]=svd(X); %compute SVD and return to 3 matrices
stem(diag(S)); grid %plot singular value

%part d
%residue of rank 1
subplot(2,2,1)
X_1 = U(:,1)*S(1,1)*V(:,1)'
image(X-X_1); colormap(map)
title('Residue k = 1');


subplot(2,2,2)
Xk = X_1
%residue of rank 6
for k = 2:6
    Xk = Xk + U(:,k)*S(k,k)*V(:,k)';
end
image(X-Xk); colormap(map)
title('Residue k = 6');

%residue of rank 16
subplot(2,2,3)
for k = 2:16
    Xk = Xk + U(:,k)*S(k,k)*V(:,k)';
end
image(X-Xk); colormap(map)
title('Residue k = 16');

%residue of rank 31
subplot(2,2,4)
for k = 2:31
    Xk = Xk + U(:,k)*S(k,k)*V(:,k)';
end
image(X-Xk); colormap(map)
title('Residue k = 31');

