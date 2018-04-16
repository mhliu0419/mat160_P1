%Problem 3 part d
%Using SVD to analyze images

%part a

load mandril.mat; %load the matric into matlab

%part b
[U,S,V]=svd(X); %compute SVD and return to 3 matrices

%part d
%residue of rank 1
X1 = U(:,1)*S(1,1)*V(:,1)';
s2 = S(2,2);
norm1 = norm(X-X1);
abs1 = abs(s2 - norm1);
Compare1 = abs1/norm1;
fprintf('The norm when k = 1 is %.2f\n', norm1);
fprintf('The relative error with is %.2f\n', Compare1);

Xk = X1;
%residue of rank 6
for k = 2:6
    Xk = Xk + U(:,k)*S(k,k)*V(:,k)';
end
s7 = S(7,7);
norm6 = norm(X - Xk);
abs6 = abs(s7 - norm6);
Compare6 = abs6/norm6;
fprintf('The norm when k = 6 is %.2f\n', norm6);
fprintf('The relative error with is %.2f\n', Compare6);

%residue of rank 16
for k = 2:16
    Xk = Xk + U(:,k)*S(k,k)*V(:,k)';
end
s17 = S(17,17);
norm16 = norm(X - Xk);
abs16 = abs(s17 - norm16);
Compare16 = abs16/norm16;
fprintf('The norm when k = 16 is %.2f\n', norm16);
fprintf('The relative error with is %.2f\n', Compare16);


%residue of rank 31
for k = 2:31
    Xk = Xk + U(:,k)*S(k,k)*V(:,k)';
end
s32 = S(32,32);
norm31 = norm(X - Xk);
abs31 = abs(s32 - norm31);
Compare31 = abs31/norm31;
fprintf('The norm when k = 31 is %.2f\n', norm31);
fprintf('The relative error with is %.2f\n', Compare31);



