function [window, screenXpixels, screenYpixels] = ARSQ_directions

ARSQ_modifyme;  % import the variables from modifyme

% setup
Screen('Preference', 'SkipSyncTests', 1);
sca;
PsychDefaultSetup(2);
screens = Screen('Screens'); % Get the screen numbers and screen setup
screenNumber = max(screens);
white = WhiteIndex(screenNumber);
black = [0 0 0];

[window, ~] = PsychImaging('OpenWindow', screenNumber, black); % Open black window
Screen('BlendFunction', window, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');
[screenXpixels, screenYpixels] = Screen('WindowSize', window);

[wdw, wdh] = Screen('WindowSize', window);	% Get screen size 

if MirrorDisplay  % from DrawMirroredTextDemo.m
    % Make a backup copy of the current transformation matrix for later
    % use/restoration of default state:
    % Screen('glPushMatrix', wd); % not needed 

    % Translate origin into the geometric center of text:
    Screen('glTranslate', window, wdw/2, wdh/2, 0);

    % Apply a scaling transform which flips the direction of x-Axis,
    % thereby mirroring the drawn text horizontally:
    upsideDown = 0;
    if upsideDown
        Screen('glScale', window, 1, -1, 1);
    else
        Screen('glScale', window, -1, 1, 1);
    end
    % We need to undo the translations...
    Screen('glTranslate', window, -wdw/2, -wdh/2, 0);
end

% put up instructions
Screen('TextSize', window, 60);
Screen('TextFont', window, 'Times');

if site == 'B'

    DrawFormattedText(window, [WrapString('Es folgen mehrere Sätze über mögliche Gedanken, die Sie in den letzten 10 Minuten erlebt haben. \n\n Bitte geben Sie an, inwieweit Sie mit jedem Satz einverstanden sind.',50)  '\n\n\n'], 'center', 'center', white);
    Screen('Flip', window);

    WaitSecs(2); % Delay before start
    DrawFormattedText(window, [WrapString('Es folgen mehrere Sätze über mögliche Gedanken, die Sie in den letzten 10 Minuten erlebt haben. \n\n Bitte geben Sie an, inwieweit Sie mit jedem Satz einverstanden sind.',50) '\n\n\n Drücken Sie eine beliebige Taste, um zu beginnen'], 'center', 'center', white);
    Screen('Flip', window);

elseif site == 'G'
    
    DrawFormattedText(window, [WrapString('Ensuite... \n\n Sil vous plait...',50)  '\n\n\n'], 'center', 'center', white);
    Screen('Flip', window);

    WaitSecs(2); % Delay before start
    DrawFormattedText(window, [WrapString('Ensuite... \n\n Sil vous plait...',50) '\n\n\n Press'], 'center', 'center', white);
    Screen('Flip', window);
end

% select any key to go forward
KbName('UnifyKeyNames');
while KbCheck; end  % Wait until all keys are released.
while 1
    [keyIsDown,~,~] = KbCheck;
    if keyIsDown
        break;
    end
end

% placeholder page
if site == 'B'
    DrawFormattedText(window, [WrapString('Klicken Sie auf die Schaltflächen im rechten Bereich, um eine Antwort auszuwählen. \n\n Bestätigen Sie diese mit der oberen Taste links.',50)  '\n\n\n'], 'center', 'center', white);
    Screen('Flip', window); 
elseif site == 'G'
    DrawFormattedText(window, [WrapString('Cliquez sur les boutons dans le volet droit pour choisir une réponse. \n\n Confirmez avec le bouton du haut à gauche. ',50)  '\n\n\n'], 'center', 'center', white);
    Screen('Flip', window);
end

% select any key to go forward
KbName('UnifyKeyNames');
while KbCheck; end % Wait until all keys are released.
while 1
    [keyIsDown,~,~] = KbCheck;
    if keyIsDown
        break;
    end
end
WaitSecs(0.5); % Delay before start
