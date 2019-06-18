%% This Lab deals with Inverse Kinematics of a 6DOF manipulator
close all
theta_1 = 0;
theta_2 = pi/4;
theta_3 = -pi/3;
theta_4 = 0;
theta_5  = pi/4;
theta_6 = 0;

% Get our Fanuc Manipulator from the last problem set
robot = plot_manip_sol(theta_1, theta_2, theta_3, theta_4, theta_5, theta_6);

% Start and End Points for the line 
% startPoint = [0.3, -0.1, -0.2];
% endPoint = [2.1, 1.7, 0.9];


% Start and End radian for my own trajectory
startRadian = -pi/5;
endRadian = 1.8*pi;
startPoint = [2*sin(startRadian) 2*cos(startRadian) 1/(endRadian-startRadian)*startRadian];
endPoint = [2*sin(startRadian) 2*cos(startRadian) 1/(endRadian-startRadian)*endRadian];


%% Inverse Kinematics
% for the line trajectory 
% [posArray, totalTime, error] = ik_fanuc_m900(robot, startPoint, endPoint);

% for my own trajectory
[posArray, totalTime, error] = ik_fanuc_m900(robot, startRadian, endRadian);

%% Show the Inverse Kinematics solution
% for the line trajectory 
% plot_inverse_output(posArray, startPoint, endPoint);

% for my own trajectory
plot_inverse_output(posArray, startRadian, endRadian);