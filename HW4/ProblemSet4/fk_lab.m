% This Lab deals with forward Kinematics of a 6DOF manipulator
%% Forward Kinematics
% This is the base configuration. You may change this to other values
theta_1 = 0;
theta_2 = pi/4;
theta_3 = -pi/3;
theta_4 = 0;
theta_5  = pi/4;
theta_6 = 0;

robot = plot_manip_frames(theta_1, theta_2, theta_3, theta_4, theta_5, theta_6);

pos = fanuc_m900_fk(theta_1, theta_2, theta_3, theta_4, theta_5, theta_6);

plot_fk(pos);

err = compare(robot, pos);

% plot_fk(fanuc_m900_fk(pi/2,-pi/4,-pi/2,0,pi/3,0)); for random
% figure