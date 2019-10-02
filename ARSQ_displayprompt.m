function [response] = ARSQ_displayprompt(ARSQ_item,window,screenXpixels,screenYpixels,handedness)
Screen('TextFont', window, 'Times');
if strcmp(handedness, 'left') % 5-1 for left handed
    x_locs = [screenXpixels*0.90, screenXpixels*0.70, screenXpixels*0.50, screenXpixels*0.30,screenXpixels*0.10];
elseif strcmp (handedness, 'right') % 1-5 for right handed
    x_locs = [screenXpixels*0.10, screenXpixels*0.30, screenXpixels*0.50, screenXpixels*0.70,screenXpixels*0.90];
end
for i = 1:length(ARSQ_item)
    a = ARSQ_item(i);
    Screen('TextSize', window, 80);
    DrawFormattedText(window, WrapString(a{1},30),'center',screenYpixels*0.5, [1 1 1]);
    DrawFormattedText(window,'1',x_locs(1),screenYpixels*0.75, [1 1 1]);
    DrawFormattedText(window,'2',x_locs(2),screenYpixels*0.75, [1 1 1]);
    DrawFormattedText(window,'3',x_locs(3),screenYpixels*0.75, [1 1 1]);
    DrawFormattedText(window,'4',x_locs(4),screenYpixels*0.75, [1 1 1]);
    DrawFormattedText(window,'5',x_locs(5),screenYpixels*0.75, [1 1 1]);
    Screen('TextSize', window, 50);
    DrawFormattedText(window,'Strongly\nDisagree',x_locs(1)-screenXpixels*.05,screenYpixels*0.85, [1 1 1]);
    DrawFormattedText(window,'Neutral','center',screenYpixels*0.85, [1 1 1]);
    DrawFormattedText(window,'Strongly\nAgree',x_locs(5)-screenXpixels*.05,screenYpixels*0.85, [1 1 1]);
    
    Screen('Flip', window);
    
    while KbCheck; end % Wait until all keys are released.
    
    while 1 % This while loop ensures that the keyboard is continuously checked, it is a Psychtoolbox feature
        % Check the state of the keyboard.
        [keyIsDown,~,keyCode] = KbCheck;
        if keyIsDown
            v = find(keyCode);
            keyname = KbName(v);
            if strcmp(handedness, 'right') % checks keys for right-handed participants
                if strcmp(keyname, '1!') || strcmp(keyname, '2@') || strcmp(keyname, '3#') || strcmp(keyname, '4$') || strcmp(keyname, '5%')
                    response(i,:) = str2num(keyname(1)); %#ok
                    break;
                end
            elseif strcmp(handedness ,'left') % checks keys for left-handed participants
                if strcmp(keyname, '6^') || strcmp(keyname, '7&') || strcmp(keyname, '8*') || strcmp(keyname, '9(') || strcmp(keyname, 'a')
                    if strcmp(keyname, '6^')
                        response(i,:) = 1; %#ok
                    elseif strcmp(keyname, '7&')
                        response(i,:) = 2; %#ok
                    elseif strcmp(keyname, '8*')
                        response(i,:) = 3; %#ok
                    elseif strcmp(keyname, '9(')
                        response(i,:) = 4; %#ok
                    elseif strcmp(keyname, 'a')
                        response(i,:) = 5; %#ok
                    end
                    break;
                end
            end
        end
    end
end

% put up ending instructions
DrawFormattedText(window, WrapString('Please continue to stay still for the remainder of the scan. \n\nThank you.',50),'center','center', [1 1 1]);
Screen('Flip', window);
WaitSecs(10); % Delay before ending