% For the line trajectory 
% function [posArray, totalTime, error] = ik_fanuc_m900(robot, startPoint, endPoint)
% For my own trajectory
% function [posArray, totalTime, error] = ik_fanuc_m900(robot, startRadian, endRadian)


function [posArray, totalTime, error] = ik_fanuc_m900(robot, startRadian, endRadian)
% Use the Inverse Kinematics Solver from Robotics System Toolbox and
% generate a solution for joint positions to trace a straight line in
% cartesian space or the trajectory of your choice

% You can neglect the gripper points we had in the Problem Set 4 and hence
% the end-effector point corresponds with the origin of the end-effector
% frame (O6)

% Input - robot - a rigidBodyTree Object
%         startPoint - a 1 x 3 vector for first point on the line
%         endpoint - a 1 x 3 vector for end point of the line

% Output - posArray - 7x3xn matrix containing joint positions as obtained by
%                     the inverse kinematics solver across all the
%                     steps
%          where n is the number of points we are choosing to discretize
%          our trajectory
%       -  time - time it takes to generate the configuration solutions for the end
%          effector poses

%https://www.mathworks.com/help/robotics/ref/robotics.inversekinematics-class.html

% Choosing a fixed orientation for the endeffector. End-effector pose is
% expressed with reference to the base frame. 
% We are using Euler Angles with 'ZYX' convention to get the orientation of
% the end-effector. We chose an upside down configuration for the end-effector
% orientation. This will be fixed and you do not have to modify this
% value. you should only change the positon vector (d) in the tform
tform = trvec2tform([0 0 0]) * eul2tform([0 0 pi], 'ZYX');
% tform value is the homogeneous transformation between end-effector
% frame and the base frame.
% time = 0;
error = 0;
%%%%%%%%%%%%%%%%%%%%%%%%% Your code below this line %%%%%%%%%%%%%%%%%%%%%%%
stepsize = 0.01; % Resolution between two points on the straight line.
                 % change this to a coarser value if you want to test your implementation real quick.
sz = floor(1 / stepsize);
posArray = zeros(7, 3, sz + 1); % Change this size for your custom trajectory. 
                            % It will depend on number of lines you choose
                            % or the type of curved trajectory.
%%
% Example code for creating inverse kinematics solver with control over the
% parameteres of the solver. You may play around with these values to obtain
% better accuracy
field1 = 'MaxIterations';  value1 = 1500;
field2 = 'SolutionTolerance'; value2 = 0.01;
s = struct(field1, value1, field2, value2);
ik = robotics.InverseKinematics('RigidBodyTree', robot, 'SolverParameters', s, 'SolverAlgorithm', 'LevenbergMarquardt');
% Weight for pose tolerances, specified as a 6-element vector. The first three 
% elements correspond to the weights on the error in orientation for the desired 
% pose. The last three elements correspond to the weights on the error in xyz 
% position for the desired pose.
weights = [1 1 1 1 1 1];

%{
field3 = 'JointName'; 
value3 = {'jnt1', 'jnt2', 'jnt3', 'jnt4', 'jnt5', 'jnt6'};
field4 = 'JointPosition';
value4 = {-0.3218, -0.2821, -1.0148, -1.8629e-08, 1.2969, -0.3218};
initialguess = struct(field3, value3, field4, value4);
%}
initialguess = robot.homeConfiguration;

%%
% Get the points on the straight line trajectory using
% line_trajectory_generator or points on custom trajectory using 
% my_trajectory_generator

% points = line_trajectory_generator(startpoint, endpoint);
% points = traj_line_generator(startPoint, endPoint, stepsize);

% This is for my own trajectory
points = my_trajectory_generator(startRadian, endRadian, stepsize);
%%
% Construct the 4x4 homogeneous matrix for each of the path points in base frame
% You can assume that we are not changing the orientation of the
% end-effector frame, just the position vector is changed. Change the tform
% array's d value

% For each of the poses, solve the inverse kinematics problem using
% the subfunction solve_ik at the bottom of this file
totalTime = 0;
for i = 1 : sz + 1
    tform(1 : 3, 4) = points(i, 1 : 3);
    [configSol, time] = solve_ik(ik, tform, weights, initialguess);
%    disp(configSol(1).JointPosition);
    totalTime = totalTime + time;
    [pos] = fanuc_m900_fk(configSol(1).JointPosition, configSol(2).JointPosition, configSol(3).JointPosition, configSol(4).JointPosition, configSol(5).JointPosition, configSol(6).JointPosition);
    for j = 1 : 7
        posArray(j,:,i) = pos(j,:); 
    end
end
%{
tform(1 : 3, 4) = points(1, 1 : 3);
[configSol] = solve_ik(ik, tform, weights, initialguess);
for i = 1:6
    disp(configSol(i).JointPosition);
end
%}
%%
% Perform Forward Kinematics using the joint values you get from the solver
% Use the fanuc_m900_fk function to get the position value for each joint
% populate the posArray accordingly

%%
% Also, compute the root mean square error between points you get using forward
% kinematics and the points on the ideal straight line
for i = 1 : sz +1
    error = error + ( posArray(7, 1, i) - points(i, 1) )^2 + ( posArray(7, 2, i) - points(i, 2) )^2 + ( posArray(7, 3, i) - points(i, 3) )^2;
end
error = sqrt(error / (sz + 1));

end

function [configSol, time] = solve_ik(ik, tform, weights, initialguess)
% solve_ik takes the inverse kinematics solver class object ik, the
% end-effector pos tform, weights on joint positions and intial guess.
% The function outputs configSols for the end-effectorpose as obtained from the
% inverse kinematics solver and the time it took to solve this particular problem

% Example to check the time it takes to solve for inverse kinematics for a single point - 
% tic
% [configSol,~] = step(ik,'endeffector',tform,weights,initialguess);
% time(t) = toc;
% You will have to sum up the total time it takes for all the points
% outside the function

%%%%%%%%%%%%%%%%%%%%%% Your Code Below this line %%%%%%%%%%%%%%%%%%%%%%%%%%
% Do we need this define?? time = 0;
tic
% [configSol] = ik('endeffector', tform, weights, initialguess);
[configSol,~] = step(ik, 'endeffector', tform, weights, initialguess);
time = toc;

end