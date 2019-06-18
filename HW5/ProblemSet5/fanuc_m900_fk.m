function [pos] = fanuc_m900_fk( theta_1, theta_2, theta_3, theta_4, theta_5, theta_6, l)
%kuka_FK The input to the function will be the joint
%    angles of the robot in radians, and the distance between the gripper pads in inches.
%    The output must contain 10 positions of various points along the robot arm as specified
%    in the question.
%% Pass dimensional params
l_1_x = 0.41;
l_1_z = 1; 
l_2 = 1.12;
l_3 = 0.25;
l_4 = 1.285;
l_5 = 0;
l_6 = 0.3;

home_theta = 0;
%% DH Params
dhparams = [ l_1_x      pi/2    l_1_z     home_theta;
             l_2      0          0        home_theta;
             l_3     pi/2        0        home_theta;
             0      -pi/2        l_4        home_theta;
             0      pi/2         l_5        home_theta;
             0      0            l_6      home_theta];
%% YOUR CODE GOES HERE
% Extract the ai, alphai, di and thetai from the dhparams matrix
if nargin < 8
   l = 0.2;
end
w = 0.1;

grip_1 = [-l/2 0 0];
grip_2 = [-l/2 0 -w];
grip_3 = [0 0 -w] ;
grip_4 = [l/2 0 -w]; 
grip_5 = [l/2 0 0];


link_1 = dhparams(1,:);
link_2 = dhparams(2,:);
link_3 = dhparams(3,:);
link_4 = dhparams(4,:);
link_5 = dhparams(5,:);
link_6 = dhparams(6,:);

a_1 = link_1(1); alpha_1 = link_1(2); d_1 = link_1(3); theta1 = link_1(4);
a_2 = link_2(1); alpha_2 = link_2(2); d_2 = link_2(3); theta2 = link_2(4);
a_3 = link_3(1); alpha_3 = link_3(2); d_3 = link_3(3); theta3 = link_3(4);
a_4 = link_4(1); alpha_4 = link_4(2); d_4 = link_4(3); theta4 = link_4(4);
a_5 = link_5(1); alpha_5 = link_5(2); d_5 = link_5(3); theta5 = link_5(4);
a_6 = link_6(1); alpha_6 = link_6(2); d_6 = link_6(3); theta6 = link_6(4);

% Compute the Ai realtive frames from one joint to other
A01 = compute_dh_matrix(a_1, alpha_1, d_1, theta_1 + theta1);
A12 = compute_dh_matrix(a_2, alpha_2, d_2, theta_2 + theta2);
A23 = compute_dh_matrix(a_3, alpha_3, d_3, theta_3 + theta3);
A34 = compute_dh_matrix(a_4, alpha_4, d_4, theta_4 + theta4);
A45 = compute_dh_matrix(a_5, alpha_5, d_5, theta_5 + theta5);
A56 = compute_dh_matrix(a_6, alpha_6, d_6, theta_6 + theta6);

% Compute position of each frame w.r.t the ground frame
pos = zeros(12, 3);
A02 = A01 * A12;
A03 = A02 * A23;
A04 = A03 * A34;
A05 = A04 * A45;
A06 = A05 * A56;

pos(1,:) = [0;0;0];
pos(2,:) = A01(1:3,4);
pos(3,:) = A02(1:3,4);
pos(4,:) = A03(1:3,4);
pos(5,:) = A04(1:3,4);
pos(6,:) = A05(1:3,4);
pos(7,:) = A06(1:3,4);

grip_1_pos = (A06 * [grip_1'; 1])';
grip_2_pos = (A06 * [grip_2'; 1])';
grip_3_pos = (A06 * [grip_3'; 1])';
grip_4_pos = (A06 * [grip_4'; 1])';
grip_5_pos = (A06 * [grip_5'; 1])';

%
pos(8,:) = grip_1_pos(1:3);
pos(9,:) = grip_2_pos(1:3);
pos(10,:) = grip_3_pos(1:3);
pos(11,:) = grip_4_pos(1:3);
pos(12,:) = grip_5_pos(1:3);
    

end

function A = compute_dh_matrix(a, alpha, d, theta)

A = [cos(theta) -sin(theta)*cos(alpha) sin(theta)*sin(alpha) a*cos(theta);...
    sin(theta) cos(theta)*cos(alpha) -cos(theta)*sin(alpha) a*sin(theta);...
    0 sin(alpha) cos(alpha) d;...
    0 0 0 1];
     
end