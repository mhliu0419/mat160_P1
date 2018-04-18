% Problem 3 Massey's network method

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
b = 2;
X = zeros(21,7);
Y = zeros(21,1);
for a = 1:7
    %b = a + 1;
    while b <= 7
        if Q(a) < Q(b)
            X(c,a) = -1;
            X(c,b) = 1;
            c = c + 1;
            b = b + 1;
        elseif Q(a) > Q(b)
            X(c,b) = -1;
            X(c,a) = 1;
            c = c + 1;
            b = b + 1;
        end
        b = a + 1;
    end
    
end

disp(X);

%for a = 1:7
    %b = a+1
    %c = 1
    %for b <= 7
        %if Q(a) < Q(b)
         %   X(c,a) = -1;
          %  X(c,b) = 1;
           % c = c + 1;
           % b = b + 1;
        %elseif Q(1,a) > Q(1,b)    
         %   X(c,a) = 1;
          %  X(c,b) = -1;
           % c = c + 1;
            %b = b + 1
        %end
    %end
%end
%diap(X);
% get the Massey Matrix with diagonal is the total games they played
% and the others is the -1* (#question i played against j)
%M = zeros(7,7);
%for a = 1:7
 %   for b = 1:7
  %      M(a,b) = -31;
   %     M(a,a) = 6*31;
   % end
%end

% get d from students' point differentials
%D = zeros(7,1);

%for c = 1:7
 %      D(c,1) = D(c,1) + S(d,c);
  %  end
%end

% since M is not a full rank, we replace the last element with 1
% and replace the last element of D with 0
%M(7,:) = 1;
%D(7) = 0;

%r = M \ D;
%[sorted_value,ranked] = sort(r,'ascend');
%fprintf('\n');

%fprintf('The unique solution of question 1 to 7: \n')
%disp(r);

%fprintf('The difficulty rank of these 7 questions is %d %d %d %d %d %d %d. \n', ranked(1), ranked(2), ranked(3), ranked(4), ranked(5), ranked(6), ranked(7))
%fprintf('Seventh question is the most difficult and first question is the easiest.')
fprintf('\n')
