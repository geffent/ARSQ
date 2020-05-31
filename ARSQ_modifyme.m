fprintf('............ Setting basic parameters according to \n')
fprintf('............            MODIFYME.M\n'); 
fprintf('............ \n')

debug = 0;

%--------------------------------------------------------------------------
% some things are different inside the scanner, e.g., text is mirrored
doscanner = 1; % 0: outside scanner the scanner 
               % 1: inside the scanner 

%--------------------------------------------------------------------------
%        Patient Information 
%--------------------------------------------------------------------------
site = 'B'; % 'B' for Berlin, 'G' for Geneva 
group = 'pilot';      % 'C' for controls, and 'S' for patients; 'pilot' for pilot 
subjn = 'x8x'; % Subject Number.; Pilot start with 041
session = 'T2'; % Session Number: T1 for first assessment, T2 for 2nd assessment

%--------------------------------------------------------------------------
% KEY SETTINGS - no need to change!
%--------------------------------------------------------------------------
% define keys to press for answering the questions
% there's a scale from 1 to 4, and 6 for confirming the choice
one = '1';  % on the MRI buttons this is the top right button (blue)
two = '2';
three = '3';
four = '4';
confirm = '6';  % when using the MRI button tool, this is the top left

%--------------------------------------------------------------------------
% DISPLAY SETTINGS - set automatically according to site and doscanner!
%--------------------------------------------------------------------------
% display settings (multiple screens and mirror-inverted display)
% only necessary in Berlin at MRT 1
if site == 'B' && doscanner == 0
   screenNumber  = 0; % BCAN Berlin MRT1: split screen setting with monitor
   MirrorDisplay = 0; % display needs to be mirror-inverted
elseif site == 'B' && doscanner == 1
   screenNumber  = 0; % BCAN Berlin MRT1: split screen setting with monitor
   MirrorDisplay = 1; % display needs to be mirror-inverted     
elseif site == 'G' && doscanner == 0
   screenNumber  = 0; % default display: 0
   MirrorDisplay = 0; % normal display: 0; mirror-inverted: 1
elseif site == 'G' && doscanner == 1
   screenNumber  = 0; % default display: 0
   MirrorDisplay = 1; % normal display: 0; mirror-inverted: 1
end

