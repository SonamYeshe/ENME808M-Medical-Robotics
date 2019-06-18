function task()
%%
% Punch in the correct value for the stepper and the leadscrew
% specifications
stepsPerRevolution = 200;
pitchLeadscrew = 2;
%%
% Write a logic to make stage move by 50 mm then further 30 mm and back to
% zero. You should call the stepper_move function in your implementation
% Make sure you update your current position after each call to
% stepper_move function
global curr_pos_x
global clock_dir
global anticlock_dir
%%%%%%%%%%%%%%%%%%%%%%% Your Code Below this Line %%%%%%%%%%%%%%%%%%%%%

stepper_move(clock_dir, (stepsPerRevolution/4*(50/pitchLeadscrew)));
curr_pos_x = 50;
stepper_move(clock_dir, (stepsPerRevolution/4*(30/pitchLeadscrew)));
curr_pos_x = 80;
stepper_move(anticlock_dir, (stepsPerRevolution/4*(curr_pos_x/pitchLeadscrew)));
curr_pos_x = 0;

end