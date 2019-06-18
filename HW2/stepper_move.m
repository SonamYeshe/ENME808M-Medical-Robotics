function stepper_move(dir, steps) 
%stepper_move is a utility function to move the linear stage attached to
%the stepper motor interfaced through arduino pins via MATLAB

%%%%% function needs a global arduino object initialized %%%%
%Make Sure setupSerialArduino function gets executed before calling this
%function

%stepper_move function takes in two arguments.
%dir - integer 1 or 2 specifying the rotation direction of the stepper motor 
%      this value is the clock_dir or anticlock_dir in the main script
%steps - positive integer in the range of 0 to 5000
%       specifing the number of steps required to take by the stepper motor
%       in order to reach a specified distance

global arduino

% 60 RPM is a good enough speed for the stepper. 
% If you want to play around. change the stepper_speed value in arduino script too 
% if changed here
stepper_speed = 60; 

buffer_pause = 3; % 3 seconds more buffer to allow the stage to reach at a specified position

if dir ~=1 && dir ~=2
    error('Invalid Input for the direction value. Specify 1 or 2 for valid clockwise or anticlockwise rotation');
end

if steps < 0 || steps > 5000 || (floor(steps) - steps ~= 0)
    error('Invalid Input to the function for the distance value. The steps value should be a integer in the range of 0-5000 for a 200mm stage');
end

fprintf(arduino, '%s', char(dir)); 
fprintf(arduino, '%u', floor(steps));

% Wait till the motor achieves the mentioned number of steps
pause(steps * 60/(200 * stepper_speed) + buffer_pause); 
end