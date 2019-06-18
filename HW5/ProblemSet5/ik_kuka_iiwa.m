function [configSols, totalTime, error] = ik_kuka_iiwa(robot, startPoint, endPoint)
% Use the Inverse Kinematics Solver from Robotics System Toolbox and
% generate a solution for joint positions to trace a straight line in
% cartesian space 

% You can neglect the gripper points we had in the Problem Set 4 and hence
% the end-effector point corresponds with the origin of the end-effector
% frame (O6)

% Input - robot - a rigidBodyTree Object
%         startPoint - a 1 x 3 vector for first point on the line
%         endpoint - a 1 x 3 vector for end point of the line

% Output - configSols - (n+1)x6 struct array containing joint positions as obtained by
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
size = floor(1 / stepsize);
configSols = []; 

%%
% Example code for creating inverse kinematics solver with control over the
% parameteres of the solver. You may play around with these values to obtain
% better accuracy
% field1 = 'MaxIterations';  value1 = 1500;
% field2 = 'SolutionTolerance'; value2 = 0.01;
% s = struct(field1, value1, field2, value2);
% ik = robotics.InverseKinematics('RigidBodyTree',robot, 'SolverParameters', s);
%weights = ones(1,7);

field1 = 'MaxIterations';  value1 = 1500;
field2 = 'SolutionTolerance'; value2 = 0.01;
s = struct(field1, value1, field2, value2);
ik = robotics.InverseKinematics('RigidBodyTree', robot, 'SolverParameters', s, 'SolverAlgorithm', 'LevenbergMarquardt');
weights = [1 1 1 1 1 1];
field3 = 'JointName'; 
value3 = {'jnt1', 'jnt2', 'jnt3', 'jnt4', 'jnt5', 'jnt6'};
field4 = 'JointPosition';
value4 = {0, 0, 0, 0, 0, 0};
initialguess = struct(field3, value3, field4, value4);

%%
% Get the points on the straight line trajectory using
% line_trajectory_generator or points on custom trajectory using 
% my_trajectory_generator
%points = line_trajectory_generator(startpoint, endpoint)
%points = my_trajectory_generator()

points = traj_line_generator(startPoint, endPoint, stepsize);
% disp(points);
%%
% Construct the 4x4 homogeneous matrix for each of the path points in base frame
% You can assume that we are not changing the orientation of the
% end-effector frame, just the position vector is changed. Change the tform
% array's d value

%%
% For each of the poses, solve the inverse kinematics problem using
% the subfunction solve_ik at the bottom of this file. 
% Populate your configSols array accordingly
posArray = zeros(7, 3, size + 1);
totalTime = 0;
for i = 1 : size + 1
    tform(1 : 3, 4) = points(i, 1 : 3);
    [configSol, time] = solve_ik(ik, tform, weights, initialguess);
%    disp(configSol(1).JointPosition);
%    configSols(i, :) = configSol(:).JointPosition;
    configSols = [configSols; configSol];
    totalTime = totalTime + time;
    [pos] = fanuc_m900_fk(configSol(1).JointPosition, configSol(2).JointPosition, configSol(3).JointPosition, configSol(4).JointPosition, configSol(5).JointPosition, configSol(6).JointPosition);
    for j = 1 : 7
        posArray(j,:,i) = pos(j,:); 
    end
end

%%
% Also, compute the root mean square error between points you get using forward
% kinematics and the points on the ideal straight line

for i = 1 : size +1
    error = error + ( posArray(7, 1, i) - points(i, 1) )^2 + ( posArray(7, 2, i) - points(i, 2) )^2 + ( posArray(7, 3, i) - points(i, 3) )^2;
end
error = sqrt(error / (size + 1));

end

function [configSol, time] = solve_ik(ik, tform, weights, initialguess)
% solve_ik takes the inverse kinematics solver class object ik, the
% end-effector pos tform, weights on joint positions and intial guess.
% The function outputs jointValues for the end-effectorpose and the time it
% took to solve this particular problem

% Example to check the time it takes to solve for inverse kinematics for a single point - 
% tic
% [configSol,~] = step(ik,'endeffector',tform,weights,initialguess);
% time(t) = toc
% You will have to sum up the total time it takes for all the points
% outside the function

%%%%%%%%%%%%%%%%%%%%%% Your Code Below this line %%%%%%%%%%%%%%%%%%%%%%%%%%
% jointValues = zeros(1,7);
tic
% [configSol] = ik('endeffector', tform, weights, initialguess);
[configSol,~] = step(ik, 'endeffector', tform, weights, initialguess);
time = toc;

end