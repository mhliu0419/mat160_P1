% This is the ranking using borda count vote method 

get_data = fopen('rankingcandidates.dat','r'); % load the data into matlab
M = textscan(get_data,'%s %s %s %s %s','Delimiter',','); % get the name in the data 

%get the initial value of the first place
HC = 0;
BS = 0;
JK = 0;
TC = 0;
DT = 0;

% borda ranking matrix

BRM = zeros(5,5); % for borda ranking matrix, first row to fifth row represent 
                 % 1st place to 5th place,
                 % first column to fifth column represent in the order of 
                 % HC, BS, JK, TC, DT

                 
                 
for i = 1:240
    for j = 1:5
        if M{j}{i} == 'HC'
            BRM(j,1) = BRM(j,1) + 1;
        elseif M{j}{i} == 'BS'
            BRM(j,2) = BRM(j,2) + 1;
        elseif M{j}{i} == 'JK'
            BRM(j,3) = BRM(j,3) + 1;
        elseif M{j}{i} == 'TC'
            BRM(j,4) = BRM(j,4) + 1;
        elseif M{j}{i} == 'DT'
            BRM(j,5) = BRM(j,5) + 1;
        end
    end
end

HC_bp = BRM(1,1)*4+BRM(2,1)*3+BRM(3,1)*2+BRM(4,1)*1+BRM(5,1)*0;

BS_bp = BRM(1,2)*4+BRM(2,2)*3+BRM(3,2)*2+BRM(4,2)*1+BRM(5,2)*0;

JK_bp = BRM(1,3)*4+BRM(2,3)*3+BRM(3,3)*2+BRM(4,3)*1+BRM(5,3)*0;

TC_bp = BRM(1,4)*4+BRM(2,4)*3+BRM(3,4)*2+BRM(4,4)*1+BRM(5,4)*0;

DT_bp = BRM(1,5)*4+BRM(2,5)*3+BRM(3,5)*2+BRM(4,5)*1+BRM(5,5)*0;

fprintf('For borda ranking matrix, first row to fifth row represent 1st place to 5th place\n') 
fprintf('first column to fifth column represent in the order of HC, BS, JK, TC, DT\n\n')
disp(BRM)

Voters_counts = [HC_bp,BS_bp,JK_bp,TC_bp,DT_bp];
particpent_name = {'HC','BS','JK','TC','DT'};
[maximum,index] = max(Voters_counts);
[sorted_value,ranked] = sort(Voters_counts, 'descend');

fprintf('The Borda count method rank five candidates in the order of %s %s %s %s %s\n',particpent_name{ranked(1)},particpent_name{ranked(2)},particpent_name{ranked(3)},particpent_name{ranked(4)},particpent_name{ranked(5)})
fprintf('With corresponding borda points %d %d %d %d %d\n',Voters_counts(ranked(1)),Voters_counts(ranked(2)),Voters_counts(ranked(3)),Voters_counts(ranked(4)),Voters_counts(ranked(5)))

show_winner_name_text = [particpent_name{index},' wins in the election'];
disp(show_winner_name_text);
show_winner_votes_text = [particpent_name{index},' has won with maximum Borda points: '];
