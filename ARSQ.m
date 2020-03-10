function ARSQ(subectID)
%% -------- DESCRIPTION --------
% Function for the Amsterdam Resting State Questionnaire (ARSQ) implemented
% in PsychToolbox in MatLab for use in the MRI scanner. Link to
% publication:
% https://www.frontiersin.org/articles/10.3389/fnhum.2013.00446/full.

%% -------- INPUTS --------
% subectID = subject ID [string, full path]

%% -------- EXAMPLE --------
% ARSQ('900723', 'right');

ARSQ_modifyme;	% set the subject-specific experimental parameters

%% -------- FUNCTION --------
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

filename = strcat(fileparts(which('ARSQ')),'/ARSQ_',subectID,'_',strrep(strrep(strrep(datestr(datetime),' ','_'),'-','_'),':','_'),'.xlsx');
writetable(results_table,filename,'Sheet',1,'Range','A1');
sca;
