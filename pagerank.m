% This is the ranking using pagerank method 

get_data = fopen('rankingcandidates.dat','r'); % load the data into matlab
M = textscan(get_data,'%s %s %s %s %s','Delimiter',','); % get the name in the data 

%get the initial value of the first place
HC = 0;
BS = 0;
JK = 0;
TC = 0;
DT = 0;

%pagerank matrix

PRM = zeros(240,5); % for borda ranking matrix, first row to fifth row represent 
                 % 1st place to 5th place,
                 % first column to fifth column represent in the order of 
                 % HC, BS, JK, TC, DT
                 

                 
for i = 1:240
    for j = 1:5
        if M{j}{i} == 'HC'
            PRM(i,1) = PRM(i,1) + 6 - j;
        elseif M{j}{i} == 'BS'
            PRM(i,2) = PRM(i,2) + 6 - j;
        elseif M{j}{i} == 'JK'
            PRM(i,3) = PRM(i,3) + 6 - j;
        elseif M{j}{i} == 'TC'
            PRM(i,4) = PRM(i,4) + 6 - j;
        elseif M{j}{i} == 'DT'
            PRM(i,5) = PRM(i,5) + 6 - j;
        end
    end
end

PRM2 = zeros(5,5);


for i = 1:240
    for j = 1:5
        for k = j+1:5
            if PRM(i,j) > PRM(i,k)
                PRM2(j,k) = PRM2(j,k) + 1;
            end
        end
    end
end


for i = 1:5
    for j = 1:5
        if i < j
            PRM2(i,j) = PRM2(i,j);
        elseif i == j
            PRM2(i,j) = 0;
        else
            PRM2(i,j) = 240 - PRM2(j,i);
        end
    end
end


PRM3 = zeros(5,1);

for i = 1:240
    for j = 1:5
        PRM3(j) = PRM3(j) + 5 - PRM(i,j);
    end
end

PRM4 = zeros(5,5);

for i = 1:5
    for j = 1:5
        PRM4(i,j) = PRM2(i,j)/PRM3(j);
    end
end

fprintf('For pagerank matrix, first row to fifth row represent 1st place to 5th place\n') 
fprintf('first column to fifth column represent in the order of HC, BS, JK, TC, DT\n\n')
disp(PRM4)

[V,D] = eig(PRM4);

%eigenvector of the stochatistic matrix corresponding to eigenvalue 1 
%shows the rank
Eigv = V(:,1);

            
Rank = [Eigv(1),Eigv(2),Eigv(3),Eigv(4),Eigv(5)];
particpent_name = {'HC','BS','JK','TC','DT'};
[maximum,index] = max(Rank);
[sorted_value,ranked] = sort(Rank, 'descend');

fprintf('The pagerank method rank five candidates in the order of %s %s %s %s %s\n',particpent_name{ranked(1)},particpent_name{ranked(2)},particpent_name{ranked(3)},particpent_name{ranked(4)},particpent_name{ranked(5)})

show_winner_name_text = [particpent_name{index},' wins in the election'];
disp(show_winner_name_text);
show_winner_votes_text = [particpent_name{index},' has won with maximum Borda points: '];

