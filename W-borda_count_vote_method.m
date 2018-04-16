% This is the ranking using W borda count vote method 

get_data = fopen('rankingcandidates.dat','r'); % load the data into matlab
M = textscan(get_data,'%s %s %s %s %s','Delimiter',','); % get the name in the data 

W_1=[10000;1000;100;10;0];
W_2=[10000;1000;100;10;9];
W_3=[10000;1000;100;99;0];
W_4=[10000;1000;999;10;0];
W_5=[10000;9999;100;10;0];

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

fprintf('For borda ranking matrix, first row to fifth row represent 1st place to 5th place\n') 
fprintf('first column to fifth column represent in the order of HC, BS, JK, TC, DT\n\n')
disp(BRM)

borda_points_1 = BRM*W_1;

Voters_counts = [borda_points_1(1),borda_points_1(2),borda_points_1(3),borda_points_1(4),borda_points_1(5)];
particpent_name = {'HC','BS','JK','TC','DT'};
[maximum,index] = max(Voters_counts);
[sorted_value,ranked] = sort(Voters_counts, 'descend');

fprintf('The W-Borda count method with W_1 rank five candidates in the order of %s %s %s %s %s\n',particpent_name{ranked(1)},particpent_name{ranked(2)},particpent_name{ranked(3)},particpent_name{ranked(4)},particpent_name{ranked(5)})
fprintf('With corresponding W-borda points %d %d %d %d %d\n',Voters_counts(ranked(1)),Voters_counts(ranked(2)),Voters_counts(ranked(3)),Voters_counts(ranked(4)),Voters_counts(ranked(5)))
show_winner_name_text = [particpent_name{index},' wins in the election'];
disp(show_winner_name_text);
show_winner_votes_text = [particpent_name{index},' has won with maximum Borda points: '];
fprintf('\n');

borda_points_2 = BRM*W_2;

Voters_counts = [borda_points_2(1),borda_points_2(2),borda_points_2(3),borda_points_2(4),borda_points_2(5)];
particpent_name = {'HC','BS','JK','TC','DT'};
[maximum,index] = max(Voters_counts);
[sorted_value,ranked] = sort(Voters_counts, 'descend');

fprintf('The W-Borda count method with W_2 rank five candidates in the order of %s %s %s %s %s\n',particpent_name{ranked(1)},particpent_name{ranked(2)},particpent_name{ranked(3)},particpent_name{ranked(4)},particpent_name{ranked(5)})
fprintf('With corresponding W-borda points %d %d %d %d %d\n',Voters_counts(ranked(1)),Voters_counts(ranked(2)),Voters_counts(ranked(3)),Voters_counts(ranked(4)),Voters_counts(ranked(5)))
show_winner_name_text = [particpent_name{index},' wins in the election'];
disp(show_winner_name_text);
show_winner_votes_text = [particpent_name{index},' has won with maximum Borda points: '];
fprintf('\n');

borda_points_3 = BRM*W_3;

Voters_counts = [borda_points_3(1),borda_points_3(2),borda_points_3(3),borda_points_3(4),borda_points_3(5)];
particpent_name = {'HC','BS','JK','TC','DT'};
[maximum,index] = max(Voters_counts);
[sorted_value,ranked] = sort(Voters_counts, 'descend');

fprintf('The W-Borda count method with W_3 rank five candidates in the order of %s %s %s %s %s\n',particpent_name{ranked(1)},particpent_name{ranked(2)},particpent_name{ranked(3)},particpent_name{ranked(4)},particpent_name{ranked(5)})
fprintf('With corresponding W-borda points %d %d %d %d %d\n',Voters_counts(ranked(1)),Voters_counts(ranked(2)),Voters_counts(ranked(3)),Voters_counts(ranked(4)),Voters_counts(ranked(5)))
show_winner_name_text = [particpent_name{index},' wins in the election'];
disp(show_winner_name_text);
show_winner_votes_text = [particpent_name{index},' has won with maximum Borda points: '];
fprintf('\n');

borda_points_4 = BRM*W_4;

Voters_counts = [borda_points_4(1),borda_points_4(2),borda_points_4(3),borda_points_4(4),borda_points_4(5)];
particpent_name = {'HC','BS','JK','TC','DT'};
[maximum,index] = max(Voters_counts);
[sorted_value,ranked] = sort(Voters_counts, 'descend');

fprintf('The W-Borda count method with W_4 rank five candidates in the order of %s %s %s %s %s\n',particpent_name{ranked(1)},particpent_name{ranked(2)},particpent_name{ranked(3)},particpent_name{ranked(4)},particpent_name{ranked(5)})
fprintf('With corresponding W-borda points %d %d %d %d %d\n',Voters_counts(ranked(1)),Voters_counts(ranked(2)),Voters_counts(ranked(3)),Voters_counts(ranked(4)),Voters_counts(ranked(5)))
show_winner_name_text = [particpent_name{index},' wins in the election'];
disp(show_winner_name_text);
show_winner_votes_text = [particpent_name{index},' has won with maximum Borda points: '];
fprintf('\n');

borda_points_5 = BRM*W_5;

Voters_counts = [borda_points_5(1),borda_points_5(2),borda_points_5(3),borda_points_5(4),borda_points_5(5)];
particpent_name = {'HC','BS','JK','TC','DT'};
[maximum,index] = max(Voters_counts);
[sorted_value,ranked] = sort(Voters_counts, 'descend');

fprintf('The W-Borda count method with W_5 rank five candidates in the order of %s %s %s %s %s\n',particpent_name{ranked(1)},particpent_name{ranked(2)},particpent_name{ranked(3)},particpent_name{ranked(4)},particpent_name{ranked(5)})
fprintf('With corresponding fW-borda points %d %d %d %d %d\n',Voters_counts(ranked(1)),Voters_counts(ranked(2)),Voters_counts(ranked(3)),Voters_counts(ranked(4)),Voters_counts(ranked(5)))
show_winner_name_text = [particpent_name{index},' wins in the election'];
disp(show_winner_name_text);
show_winner_votes_text = [particpent_name{index},' has won with maximum Borda points: '];
