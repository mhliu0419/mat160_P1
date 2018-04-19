% Problem 3 Colley's method

A = importdata('examscores.dat');

Q = zeros(1,7);

% get the students' point differentials
for i = 1:7
    for j = 1:31
        if A(j,i) >= 3
            Q(1,i) = Q(1,i) + 1;
        else
            Q(1,i) = Q(1,i);
        end
    end
end

c = 1;
X = zeros(21,7);
Y = zeros(21,1);
for a = 1:7
    for b = (a + 1):7
        if Q(a) < Q(b)
            X(c,a) = -1;
            X(c,b) = 1;
            Y(c,1) = Q(b) - Q(a);
            c = c + 1;
        elseif Q(a) > Q(b)
            X(c,b) = -1;
            X(c,a) = 1;
            Y(c,1) = Q(a) - Q(b);
            c = c + 1;
        elseif Q(a) == Q(b)
            X(c,a) = 0;
            X(c,b) = 0;
            Y(c,1) = 0;
            c = c + 1;
        end
    end    
end

Point_Matrix = zeros(2,7);

for e = 1:7
    for f = 1:21
        if X(f,e) == 1
            Point_Matrix(1,e) = Point_Matrix(1,e) + 1; %每道题赢的次数
        elseif X(f,e) == -1
            Point_Matrix(2,e) = Point_Matrix(2,e) + 1; %每道题输的次数
        end
    end
end     

% get the Massey Matrix with diagonal is the total games they played
% and the others is the -1* (#question i played against j)

tans_X = X';
M = tans_X * X;

% get diag(M) = ti + 2
v = [2,2,2,2,2,2,2];
Any_matrix_diag = diag(v);
A = Any_matrix_diag + M;

% get the # of Win
W = zeros(7,1);
for f = 1:7
    W(f) = Point_Matrix(1,f);
end

% get the # of lose
L = zeros(7,1);
for g = 1:7
    L(g) = Point_Matrix(2,g);
end

% get b_i = 1 + 1/2(W - L)
B = zeros(7,1);
for h = 1:7
    B(h) = 1 + (1/2) * (W(h) - L(h));
end

% get r_i
r = A \ B;

[sorted_value,ranked] = sort(r,'ascend');
fprintf('\n');

fprintf('The unique solution of question 1 to 7: \n')
disp(r);

fprintf('The difficulty rank of these 7 questions is %d %d %d %d %d %d %d. \n', ranked(1), ranked(2), ranked(3), ranked(4), ranked(5), ranked(6), ranked(7))
fprintf('Second question is the most difficult and Fifth and Sixth question is the easiest.')
fprintf('\n')
