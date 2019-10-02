% Master function for the Amsterdam Resting State Questionnaire (ARSQ).
% Link to publication:
% https://www.frontiersin.org/articles/10.3389/fnhum.2013.00446/full.

% Written by Matt Rosenblatt (mattrosenblatt7@gmail.com) and Tom Skoff
% (tomrskoff@gmail.com) in collaboratoin with Helmet Karim (hek26@pitt.edu) 
% and the Geriatric Psychiatry Neuroimaging (GPN Lab, 
% contact aizen@pit.edu/andrcx@upmc.edu) at the University of Pittsburgh.

% Last updated 2019/08/16

% To launch the task, write ARSQ('subjID','right') - the first argument is the
% subject ID (can be any string) and the second one is either 'right' or 'left'
% for the hand they will be using to answer their questions. 

% Participants are asked a series of 50 questions and are asked to rate to
% the degree they agree or disagree with each statement with respect to
% their resting state experience. 

% The output is a set of dimensions (see paper) that are related to resting
% state experience. An excel spreadsheet of their answers is output along
% with the scores on the domains from the publication. 

% The different factors are:
% Discontinuity of Mind (DOM) - 'I felt restless, busy thoughts, rapidly
% switching thoughts, had thoughts under control'

% Theory of Mind (TOM) - 'I thought about others, I thought about people I
% like, I placed myself in other people's shoes'

% Self (Self) - 'I thought about my feelings, my behavior, and myself'

% Planning (Plan) - 'I thought about work, studying, solving problems, the
% future, the past, I had deep thoughts and thought about things I needed
% to do'

% Sleepiness (Sleep) - 'I felt tired, sleep, and had difficulty staying
% awake'

% Comfort (Comf) - 'I felt comfortable, relaxed, and happy'

% Somatic Awareness (SomA) - 'I thought about my health, I was conscious of
% my body, I thought about my heartbeat and my breathing'