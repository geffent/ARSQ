
function [response] = ARSQ_displayprompt(ARSQ_item, window, screenXpixels, screenYpixels)

ARSQ_modifyme;	% set the subject-specific experimental parameters

Screen('TextFont', window, 'Times');
x_locs = [screenXpixels*0.20, screenXpixels*0.40, screenXpixels*0.60, screenXpixels*0.80];

% i is the number of the current question
response = [];  % make sure we have a variable to store all answers in
for i = 1:length(ARSQ_item)

    a = ARSQ_item(i);
    Screen('TextSize', window, 80);
    DrawFormattedText(window, WrapString(a{1},30),'center',screenYpixels*0.3, [1 1 1]);
    DrawFormattedText(window,'1',x_locs(1),screenYpixels*0.75, [1 1 1]);
    DrawFormattedText(window,'2',x_locs(2),screenYpixels*0.75, [1 1 1]);
    DrawFormattedText(window,'3',x_locs(3),screenYpixels*0.75, [1 1 1]);
    DrawFormattedText(window,'4',x_locs(4),screenYpixels*0.75, [1 1 1]);
    Screen('TextSize', window, 50);
    if site == 'B'
        DrawFormattedText(window,'Trifft überhaupt nicht zu', ...
            x_locs(1)-screenXpixels*.15, screenYpixels*0.85, [1 1 1]);
        DrawFormattedText(window,'Trifft voll und ganz zu', ...
            x_locs(4)-screenXpixels*.075, screenYpixels*0.85, [1 1 1]);
    elseif site == 'G'
        DrawFormattedText(window,'Pas du tout', ...
            x_locs(1)-screenXpixels*.15, screenYpixels*0.85, [1 1 1]);
        DrawFormattedText(window,'Complètement', ...
            x_locs(4)-screenXpixels*.075, screenYpixels*0.85, [1 1 1]);        
    end
        
    Screen('Flip', window);
    
    while KbCheck; end % Wait until all keys are released.
    
    while 1 % This while loop ensures that the keyboard is continuously checked, it is a Psychtoolbox feature
        % Check the state of the keyboard.
        [keyIsDown,~,keyCode] = KbCheck;
        if keyIsDown
            v = find(keyCode);
            keyname = KbName(v);
                
            if strcmp(keyname, '1!') || strcmp(keyname, '2@') ...
                    || strcmp(keyname, '3#') || strcmp(keyname, '4$')

                response(i,:) = str2num(keyname(1)); %#ok

                % redraw the whole screen marking the chosen answer
                Screen('TextSize', window, 80);
                DrawFormattedText(window, WrapString(a{1},30),'center',screenYpixels*0.3, [1 1 1]);
                % paint the chosen number in green, the others in black
                for j = 1:4
                    if str2num(keyname(1)) == j
                        DrawFormattedText(window,num2str(j),x_locs(j),screenYpixels*0.75, [0 1 0]);
                    else
                        DrawFormattedText(window,num2str(j),x_locs(j),screenYpixels*0.75, [1 1 1]);
                    end
                end
                Screen('TextSize', window, 50);
                if site == 'B'
                    DrawFormattedText(window,'Trifft überhaupt nicht zu', ...
                        x_locs(1)-screenXpixels*.15, screenYpixels*0.85, [1 1 1]);
                    DrawFormattedText(window,'Trifft voll und ganz zu', ...
                        x_locs(4)-screenXpixels*.075, screenYpixels*0.85, [1 1 1]);
                elseif site == 'G'
                    DrawFormattedText(window,'Pas du tout', ...
                        x_locs(1)-screenXpixels*.15, screenYpixels*0.85, [1 1 1]);
                    DrawFormattedText(window,'Complètement', ...
                        x_locs(4)-screenXpixels*.075, screenYpixels*0.85, [1 1 1]);        
                end
                Screen('Flip', window);      
            end
            
            % Check if Return was pressed _and_ subject gave valid
            % answer
            numberOfQuestionsAsked = i;
            numberOfValidAnswersGiven = size(response, 1);
            if strcmp(keyname, 'Return') && ...
                numberOfValidAnswersGiven == numberOfQuestionsAsked
                res = response(i, :);
                if (res == 1 || res == 2 || res == 3 || res == 4)
                    break;
                end
            end
        end
    end
end

% put up ending instructions
if site == 'B'
    DrawFormattedText(window, ... 
        WrapString('Bitte bleiben Sie noch bis zum Ende des Scans ruhig liegen. \n\n Vielen Dank!', 50), ...
        'center','center', [1 1 1]);
elseif site == 'G'
    DrawFormattedText(window, WrapString('Merci beaucoup.',50), 'center','center', [1 1 1]);
end
Screen('Flip', window);
WaitSecs(1); % Delay before ending
