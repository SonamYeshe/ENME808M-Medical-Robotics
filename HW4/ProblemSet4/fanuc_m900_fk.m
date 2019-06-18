function [pos] = fanuc_m900_fk( theta_1, theta_2, theta_3, theta_4, theta_5, theta_6, l)
%    fanuc_m900_fk The input to the function will be the joint
%    angles of the robot in radians, and the distance between the gripper pads in m.
%    The output must contain 12 positions of various points along the robot arm and the gripper as specified
%    in the question in the base frame.
%    pos - 12 x 3 matrix with position of different frames and the position of
%    the gripper.
if nargin < 8
   l = 0.2;
end
w = 0.1;

% 5 points on the gripper expressed in the gripper frame
% Also return the position of these points as expressed in the world frame
grip_1 = [-l/2 0 0];
grip_2 = [-l/2 0 -w];
grip_3 = [0 0 -w] ;
grip_4 = [l/2 0 -w]; 
grip_5 = [l/2 0 0];

%% YOUR CODE GOES BELOW THIS LINE (for Assignment 4)

% Construct the full DH parameter table (should be size 6x4)

dhparams = zeros(6,4);
dhparams(:,:) = [0.410      pi/2    1.000       theta_1;
                 1.120      0       0           theta_2;
                 0.250      pi/2    0           theta_3;
                 0          -pi/2   1.285       theta_4;
                 0          pi/2    0           theta_5;
                 0          0       0.300       theta_6];
       
% Compute the forward kinematics using DH

A1 =      compute_dh_matrix(dhparams(1,1), dhparams(1,2), dhparams(1,3), dhparams(1,4));
A2 = A1 * compute_dh_matrix(dhparams(2,1), dhparams(2,2), dhparams(2,3), dhparams(2,4));
A3 = A2 * compute_dh_matrix(dhparams(3,1), dhparams(3,2), dhparams(3,3), dhparams(3,4));
A4 = A3 * compute_dh_matrix(dhparams(4,1), dhparams(4,2), dhparams(4,3), dhparams(4,4));
A5 = A4 * compute_dh_matrix(dhparams(5,1), dhparams(5,2), dhparams(5,3), dhparams(5,4));
A6 = A5 * compute_dh_matrix(dhparams(6,1), dhparams(6,2), dhparams(6,3), dhparams(6,4));

% Compute the joint frame and gripper positions in the base frame

pos = zeros(12,3);
pos(1,:) = [0;0;0];

% Fill the rest 11 rows
% Move the base origin to different positions

pseudoPos = ones(12,4);
pseudoPos(1,1:3) = pos(1,:);
pseudoPos(2,:) = A1 * [0;0;0;1];
pos(2,:) = pseudoPos(2,1:3);

pseudoPos(3,:) = A2 * [0;0;0;1];
pos(3,:) = pseudoPos(3,1:3);

pseudoPos(4,:) = A3 * [0;0;0;1];
pos(4,:) = pseudoPos(4,1:3);

pseudoPos(5,:) = A4 * [0;0;0;1];
pos(5,:) = pseudoPos(5,1:3);

pseudoPos(6,:) = A5 * [0;0;0;1];
pos(6,:) = pseudoPos(6,1:3);

pseudoPos(7,:) = A6 * [0;0;0;1];
pos(7,:) = pseudoPos(7,1:3);

% Represent the gripper points in different frames

pseudoPos(8,:) = A6 * [grip_1(1);grip_1(2);grip_1(3);1];
pos(8,:) = pseudoPos(8,1:3);

pseudoPos(9,:) = A6 * [grip_2(1);grip_2(2);grip_2(3);1];
pos(9,:) = pseudoPos(9,1:3);

pseudoPos(10,:) = A6 * [grip_3(1);grip_3(2);grip_3(3);1];
pos(10,:) = pseudoPos(10,1:3);

pseudoPos(11,:) = A6 * [grip_4(1);grip_4(2);grip_4(3);1];
pos(11,:) = pseudoPos(11,1:3);

pseudoPos(12,:) = A6 * [grip_5(1);grip_5(2);grip_5(3);1];
pos(12,:) = pseudoPos(12,1:3);


end


function A = compute_dh_matrix(a, alpha, d, theta)

% Compute Matrix from DH Parameters (for Assignment 3)
A = zeros(4,4);

Theta = theta / pi * 180;
Alpha = alpha / pi * 180;

Rotz = [cosd(Theta)  -sind(Theta) 0   0;
        sind(Theta)  cosd(Theta)  0   0;
        0            0            1   0;
        0            0            0   1];
    
Transz = [1   0   0   0;
          0   1   0   0;
          0   0   1   d;
          0   0   0   1];
      
Transx = [1   0   0   a;
          0   1   0   0;
          0   0   1   0;
          0   0   0   1];
      
Rotx = [1   0            0              0;
        0   cosd(Alpha)  -sind(Alpha)   0;
        0   sind(Alpha)  cosd(Alpha)    0;
        0   0            0              1];
    
A = Rotz * Transz * Transx * Rotx;
     
end
