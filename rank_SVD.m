% Q2 using SVD

%load examscores.dat

%get_data = fopen('examscore.dat','r'); % load the data into matlab
%M = textscan(get_data,'%s %s %s %s %s %s %s','Delimiter',','); % get the name in the data 
A = importdata('examscores.dat');
B = A';
M = A * B;
[U,S,V] = svd(M);
matrix_s = U * S;
s1 = matrix_s(:,1);
qT1 = V(:,1)';
M1 = s1 * qT1;
disp(x1);
%rank_A = nnz(s);
%disp(rank_A);
%disp(V);