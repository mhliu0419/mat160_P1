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
        else i > j
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

[V,D] = eig(PRM4)
