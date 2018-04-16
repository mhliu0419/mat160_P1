% Problem 3 SVD

A = importdata('examscores.dat');

[U,S,V] = svd(A);
matrix_s = U * S;
s1 = matrix_s(:,1); %p_1 * sigma_1
qT1 = V(:,1)'; % tanspose of q_1
M1 = s1 * qT1;
disp(M1);
