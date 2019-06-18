clear all
close all
%%
% Create the Manipulator
robot = create_rigid_body_chain(0,0,0,0,0,0);
figure
h1 = axes;
show(robot)
% Flip the axes to make our frame assignment consistent with the MATLAB
% convention
set(h1, 'Ydir', 'reverse')
set(h1, 'Xdir', 'reverse')
% Start and End Points for the line 

% Simple case
startPoint = [0.6, -0.5, 0];
endPoint = [0.6, 0.5, 0];
%% Inverse Kinematics
[configSols, time, error] = ik_kuka_iiwa(robot, startPoint, endPoint);
%% Show the Inverse Kinematics solution
plot_inverse_output_extra(robot, configSols, startPoint, endPoint);