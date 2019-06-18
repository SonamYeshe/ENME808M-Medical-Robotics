% First Lab for ENME489C/ENME808M.
% The goal of this lab is to assemble the linear stage and command the steppers appropriately,
% so as to achieve a linear positioning for the stage.
clear all;
%% Specify some global variables - You need not modify this section
% Variable for absolute position of the stage. You have to update this
% variable based on how you command your stepper motor to move 
global curr_pos_x


% The Arduino object dealing with the serial communication 
global arduino

% Communication Flags for the rotation direction
global clock_dir
global anticlock_dir

%Setting some communication flags to specify the direction of rotation to
%arduino
clock_dir = 1;
anticlock_dir = 2;

% Cleanup any serial connections before not closed using fclose()
delete(instrfindall);

%%
% Initialize the arduino connection - specify the port_name
port_name = 'COM4';
if ~exist('serial_flag','var') || serial_flag == 0
    serial_flag = setupSerialArduino(port_name);
end

%% 
% This is where we specify the home position (or the zero position) of the
% stage. After you manually bring back the stage to your zero position,
% you would realize that curr_pos_x is set to zero.

% You need not modify anything here
% If the value of curr_pos_x in the workspace does not correspond to
% the actual position of the stage. clear all the variables, bring your stage 
% back to zero position(either programmatically or manually) and run the entire script again

if isempty(curr_pos_x)
    curr_pos_x = 0;
end

fprintf('Make sure you have defined your zero and brought your stage to that position\n');
fprintf('Program paused. Press enter to continue.\n');
pause;
%% Problem - The code you write inside the task function will be called here
% Make it travel 100 mm of stage length, then further 50mm and then bring it
% back to home position. Absolute-Incremental-Zero
% Fill the task() function before running this section

task();

%% Close the Serial Connection
fclose(arduino);
serial_flag = 0;