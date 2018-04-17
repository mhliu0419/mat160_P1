% Problem 3 SVD

A = importdata('examscores.dat');

[U,S,V] = svd(A);
matrix_s = U * S;
s1 = matrix_s(:,1); %p_1 * sigma_1
qT1 = V(:,1)'; % tanspose of q_1
M1 = s1 * qT1;
%disp(M1);

M1_row1 = M1(1,:);
fprintf('The difficulty score of question 1 to 7: \n')
disp(M1_row1);

[sorted_value,ranked] = sort(M1_row1, 'ascend');
fprintf('\n')

fprintf('The difficulty score of question 1 to 7 in ascending order: \n')
disp(sorted_value);
%disp(ranked);

fprintf('The difficulty rank of these 7 questions is %d %d %d %d %d %d %d. \n', ranked(1), ranked(2), ranked(3), ranked(4), ranked(5), ranked(6), ranked(7))
fprintf('Second question is the most difficult and first question is the easiest.')
fprintf('\n\n')
fprintf('The possible meaning of vector s is the rank of 31 students.')
