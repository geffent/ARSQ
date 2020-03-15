function ARSQ()

ARSQ_modifyme;	% import subject-specific experiment parameters

% show directions
[window, screenXpixels, screenYpixels] = ARSQ_directions;

% open prompts file
if site == 'B'
    mid = fopen('ARSQ_prompts_B.txt');
elseif site == 'G'
    mid = fopen('ARSQ_prompts_G.txt');
end
M = textscan(mid, '%s', 'delimiter', '\n');
ARSQ_item = M{1};
fclose(mid);

% display prompt and get responses
[Rating] = ARSQ_displayprompt(ARSQ_item, window, screenXpixels, screenYpixels);

% get ratings and generate table
results_table = table(ARSQ_item,(1:length(ARSQ_item))',Rating);
results_table.Properties.VariableNames{2} = 'Item';

% generate file name and save to file
filename = strcat(fileparts(which('ARSQ')), filesep, 'results', filesep, ...
    site, group, subjn, session, '_', datestr(now,'yymmdd_HHMM'), '.xlsx');
writetable(results_table, filename, 'Sheet', 1, 'Range', 'A1');

sca;
