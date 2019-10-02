function ARSQ(subectID, handedness)
%% -------- DESCRIPTION --------
% Master function for the Amsterdam Resting State Questionnaire (ARSQ).
% Link to publication:
% https://www.frontiersin.org/articles/10.3389/fnhum.2013.00446/full.

%% -------- INPUTS --------
% subectID = subject ID [string, full path]
% handedness = 'left' or 'right' handed; determines which glove is used in MR scanner [string]

%% -------- OUTPUTS --------
% A table with ratings for each item as well as a .mat file with the domain
% scores as defined in the paper.

%% -------- EXAMPLE --------
% ARSQ('900723', 'right');

%% -------- FUNCTION --------
% show directions
[window, screenXpixels, screenYpixels] = ARSQ_directions;

% open prompts file
mid = fopen('ARSQ_prompts.txt');
M = textscan(mid, '%s', 'delimiter', '\n');
ARSQ_item = M{1};
fclose(mid);

% display prompt and get responses
[Rating] = ARSQ_displayprompt(ARSQ_item,window,screenXpixels,screenYpixels,handedness);

% get ratings and generate table
results_table = table(ARSQ_item,(1:length(ARSQ_item))',Rating);
results_table.Properties.VariableNames{2} = 'Item';

filename = strcat(fileparts(which('ARSQ')),'/ARSQ_',subectID,'_',strrep(strrep(strrep(datestr(datetime),' ','_'),'-','_'),':','_'),'.xlsx');
writetable(results_table,filename,'Sheet',1,'Range','A1');

% calculate scores
DOM = Rating(2)*0.77 + Rating(18)*0.84 + (5 - Rating(23) + 1)*0.51 + Rating(27)*0.77 + Rating(34)*0.55;
TOM = Rating(20)*0.86 + Rating(35)*0.8 + Rating(45)*0.8;
Self = Rating(1)*0.66 + Rating(16)*0.74 + Rating(21)*0.5;
Plan = Rating(15)*0.68 + Rating(24)*0.71 + Rating(29)*0.61 + Rating(31)*0.71 + Rating(32)*0.67 + Rating(38)*0.61;
Sleep = Rating(3)*0.93 + Rating(4)*0.84 + Rating(26)*0.69;
Comf = Rating(5)*0.83 + Rating(6)*0.97 + Rating(7)*0.66;
SomA = Rating(14)*0.87 + Rating(39)*0.21 + Rating(42)*0.49 + Rating(43)*0.18;

% save scores
fname = strcat('ARSQ_','scores_',subectID,'_',char(datetime('now','Format','yyyy_MM_dd_HH_mm')),'.mat');
save(fname, 'DOM','TOM','Self','Plan','Sleep','Comf', 'SomA', 'Rating');
sca;