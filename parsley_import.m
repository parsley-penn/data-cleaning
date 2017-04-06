% Imports data from csv files for graphing

% Format of the response files
formatSpec = '%f%C';

% Read in all response files
csvDir = 'new-data/';
csvFiles = dir(fullfile(csvDir,'*.csv'));

% Output vectors
percentages = [];
groups = [];

% Indices for slicing later.
% Following index - 1 is the last value for the current index.
% e.g. all Japanese data is from 1:purina_index-1 in both output vectors.
japanese_index = 1;
purina_index = 1;
thomas_index = 1;
veraldi_index = 1;
waertsilae_index = 1;
watches_index = 1;

for i = 1:length(csvFiles)
    % Read in groups of 3 for hand/machine/plain
    % Read in the data as a table
    csv_table = readtable(strcat(csvDir,csvFiles(i).name),'Delimiter',',',...
                   'Format',formatSpec);
    percentage = csv_table.Var1;
    group = csv_table.Var2;
    
    percentages = [percentages; percentage];
    groups = [groups; group];
    
    if (i == 3)
        purina_index = length(percentages) + 1;
    elseif (i == 6)
        thomas_index = length(percentages) + 1;
    elseif (i == 9)
        veraldi_index = length(percentages) + 1;
    elseif (i == 12)
        waertsilae_index = length(percentages) + 1;
    elseif (i == 15)
        watches_index = length(percentages) + 1;
    end
end

% Create a final vector identifying the surveys
% Pre-allocation
surveys = cell(length(percentages),1); 

for i = 1:length(surveys)
   if (i < purina_index)
       surveys(i) = cellstr('japanese');
   elseif (i < thomas_index)
       surveys(i) = cellstr('thomas');
   elseif (i < veraldi_index)
       surveys(i) = cellstr('veraldi');
   elseif (i < waertsilae_index)
       surveys(i) = cellstr('waertsilae');
   else
       surveys(i) = cellstr('watches');
   end
end