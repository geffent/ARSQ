function [window, screenXpixels, screenYpixels] = ARSQ_directions
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

% put up instructions
Screen('TextSize', window, 60);
Screen('TextFont', window, 'Times');
DrawFormattedText(window, [WrapString('Several statements will follow regarding potential feelings and thoughts you may have experienced during the resting period. \n\n Please indicate the extent to which you agree with each statement.',50)  '\n\n\n'], 'center', 'center', white);
Screen('Flip', window);

WaitSecs(10); % Delay before start
DrawFormattedText(window, [WrapString('Several statements will follow regarding potential feelings and thoughts you may have experienced during the resting period. \n\n Please indicate the extent to which you agree with each statement.',50) '\n\n\nPress any key to begin'], 'center', 'center', white);
Screen('Flip', window);

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