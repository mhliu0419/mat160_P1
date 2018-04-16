% This is the ranking using average rank method

get_data = fopen('rankingcandidates.dat','r'); % load the data into matlab
M = textscan(get_data,'%s %s %s %s %s','Delimiter',','); % get the name in the data 

%get the initial value of the first place
HC = 0;
BS = 0;
JK = 0;
TC = 0;
DT = 0;

for j = 1:240
    for i = 1:5
        if M{i}{j} == 'HC'
            HC = HC + 6 - i;
        elseif M{i}{j} == 'BS'
            BS = BS + 6 - i;
        elseif M{i}{j} == 'JK'
            JK = JK + 6 - i;
        elseif M{i}{j} == 'TC'
            TC = TC + 6 - i;
        elseif M{i}{j} == 'DT'
            DT = DT + 6 - i;
        end
    end
end

% create these numbers as a matrix

HC = HC / 240;
BS = BS / 240;
JK = JK / 240;
TC = TC / 240;
DT = DT / 240;

Voters_counts = [HC,BS,JK,TC,DT];
particpent_name = {'HC','BS','JK','TC','DT'};
[maximum,index] = max(Voters_counts);
[sorted_value,ranked] = sort(Voters_counts, 'descend');

fprintf('The Plurality vote method rank five candidates in the order of %s %s %s %s %s\n',particpent_name{ranked(1)},particpent_name{ranked(2)},particpent_name{ranked(3)},particpent_name{ranked(4)},particpent_name{ranked(5)})
fprintf('With corresponding average rank points %f %f %f %f %f\n',Voters_counts(ranked(1)),Voters_counts(ranked(2)),Voters_counts(ranked(3)),Voters_counts(ranked(4)),Voters_counts(ranked(5)))
show_winner_name_text = [particpent_name{index},' wins in the election'];
disp(show_winner_name_text);
show_winner_votes_text = [particpent_name{index},' has won with maximum number of Votes in the first place: '];

        


