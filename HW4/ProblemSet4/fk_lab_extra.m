% This question for Grad Students and it deals with forward kinematics of a 7DOF manipulator
%% Forward Kinematics
% This is the base configuration. You may change this to other values
theta_1 = 0;
theta_2 = pi/4;
theta_3 = -pi/3;
theta_4 = 0;
theta_5  = pi/4;
theta_6 = 0;
theta_7 = 0;

pos = kuka_iiwa_fk(theta_1, theta_2, theta_3, theta_4, theta_5, theta_6, theta_7);

plot_fk_extra(pos);


% plot_fk_extra(kuka_iiwa_fk(pi/3,-pi/4,0,pi,pi/2,pi/4,0)) for random
% figure