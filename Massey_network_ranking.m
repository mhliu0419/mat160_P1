% Problem 3 Massey's network method

A = importdata('examscores.dat');
S = zeros(31,7);

% get the students' point differentials
for i = 1:31
    for j = 1:7
        if A(i,j) == 6
            S(i,j) = 15;
        elseif A(i,j) == 5
            S(i,j) = 10;
        elseif A(i,j) == 4
            S(i,j) = 5;
        elseif A(i,j) == 3
            S(i,j) = 0;
        elseif A(i,j) == 2
            S(i,j) = -5;
        elseif A(i,j) == 1 
            S(i,j) = -10;
        elseif A(i,j) == 0
            S(i,j) = -15;
        end
    end
end

% get the Massey Matrix with diagonal is the total games they played
% and the others is the -1* (#question i played against j)
M = zeros(7,7);
for a = 1:7
    for b = 1:7
        M(a,b) = -31;
        M(a,a) = 6*31;
    end
end

% get d from students' point differentials
D = zeros(7,1);

for c = 1:7
    for d = 1:31
        D(c,1) = D(c,1) + S(d,c);
    end
end

% since M is not a full rank, we replace the last element with 1
% and replace the last element of D with 0
M(7,:) = 1;
D(7) = 0;

r = M \ D;
[sorted_value,ranked] = sort(r,'ascend');
fprintf('\n');

fprintf('The unique solution of question 1 to 7: \n')
disp(r);

fprintf('The difficulty rank of these 7 questions is %d %d %d %d %d %d %d. \n', ranked(1), ranked(2), ranked(3), ranked(4), ranked(5), ranked(6), ranked(7))
fprintf('Seventh question is the most difficult and first question is the easiest.')
fprintf('\n')

        
        




