fprintf('............ Setting basic parameters according to \n')
fprintf('............            MODIFYME.M\n'); 
fprintf('............ \n')

doinstr     = 0; % 0: no instructions, just the experiment inside or outside the scanner
                 % 1: instructions and training 
             
debug       = 0;

%----------------------------------------------------------------------------
%        If set doscanner=1 exp will wait for the first trigger 
%        of the MR scanner and keys are different
%        If set doscanner=0, then do training + instructions 
%----------------------------------------------------------------------------
doscanner = 1; % 0: outside scanner the scanner 
               % 1: inside the scanner 
              
%----------------------------------------------------------------------------
%        To save or not to save
%        This should ALWAYS be set to 1 when doing experiments obviously
%----------------------------------------------------------------------------
dosave = 1;      % save output? 

%----------------------------------------------------------------------------
%        Patient Information 
%--------------------------------------------------------------------------
site         = 'G'; % 'B' for Berlin, 'G' for Geneva 

Task_Version = 'B'; % Task Version 'A' or 'B', choose another one for Retest!     

type = 'pilot';      % 'C' for controls, and 'S' for patients; 'RLP' for pilot 

subjn = 'x8x';       % Subject Number.; Pilot start with 041

session = 'T1';    % Session Number: T1 for first assessment, T2 for 2nd assessment

payment = 1;      % is this subject being paid / should payment info be displayed
                  % at the end? Set this to zero for training!

%----------------------------------------------------------------------------
%        DISPLAY SETTINGS
%
%----------------------------------------------------------------------------
% display settings (multiple screens and mirror-inverted display)
% only necessary in Berlin at MRT 1
if site == 'B' && doscanner == 0; 
       screenNumber  = 0; % BCAN Berlin MRT1: split screen setting with monitor
       MirrorDisplay = 0; % display needs to be mirror-inverted
elseif site == 'B' && doscanner == 1; 
       screenNumber  = 0; % BCAN Berlin MRT1: split screen setting with monitor
       MirrorDisplay = 1; % display needs to be mirror-inverted     
elseif site == 'G' && doscanner == 0;
       screenNumber  = 0; % default display: 0
       MirrorDisplay = 0; % normal display: 0; mirror-inverted: 1
elseif site == 'G' && doscanner == 1;
       screenNumber  = 0; % default display: 0
       MirrorDisplay = 1; % normal display: 0; mirror-inverted: 1
end
