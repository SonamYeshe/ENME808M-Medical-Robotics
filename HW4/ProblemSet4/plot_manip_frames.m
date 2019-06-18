function [robot] = plot_manip_frames(theta_1, theta_2, theta_3, theta_4, theta_5, theta_6)
% Function plot_manip_frames will plot the manipulator based of DH parameters
% using functions from Robotics System toolbox. The functions takes in the
% joint positions as the input arguments

% The function essentially helps in the visualization of the DH frames
% R-G-B is convention in MATLAB for XYZ frames
%% YOUR CODE BELOW THIS LINE
% Construct the full DH parameter table in the home configuration (should be size 6x4)

dhparams = zeros(6,4);
dhparams(:,:) = [0.410      pi/2    1.000       theta_1;
                 1.120      0       0           theta_2;
                 0.250      pi/2    0           theta_3;
                 0          -pi/2   1.285       theta_4;
                 0          pi/2    0           theta_5;
                 0          0       0.300       theta_6];


%% Create the Rigid body chain
%%%%%%%%%%%%%% Create the Links(bodies) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Example code for creating a body using DH support in Robotics System Toolbox
% body1 = robotics.RigidBody('body1');
% jnt1 = robotics.Joint('jnt1','revolute');
% setFixedTransform(jnt1,dhparams(1,:),'dh');
% body1.Joint = jnt1;

body1 = robotics.RigidBody('body1');
jnt1 = robotics.Joint('jnt1','revolute');
setFixedTransform(jnt1,dhparams(1,:),'dh');
body1.Joint = jnt1;

body2 = robotics.RigidBody('body2');
jnt2 = robotics.Joint('jnt2','revolute');
setFixedTransform(jnt2,dhparams(2,:),'dh');
body2.Joint = jnt2;

body3 = robotics.RigidBody('body3');
jnt3 = robotics.Joint('jnt3','revolute');
setFixedTransform(jnt3,dhparams(3,:),'dh');
body3.Joint = jnt3;

body4 = robotics.RigidBody('body4');
jnt4 = robotics.Joint('jnt4','revolute');
setFixedTransform(jnt4,dhparams(4,:),'dh');
body4.Joint = jnt4;

body5 = robotics.RigidBody('body5');
jnt5 = robotics.Joint('jnt5','revolute');
setFixedTransform(jnt5,dhparams(5,:),'dh');
body5.Joint = jnt5;

body6 = robotics.RigidBody('body6');
jnt6 = robotics.Joint('jnt6','revolute');
setFixedTransform(jnt6,dhparams(6,:),'dh');
body6.Joint = jnt6;


%%%%%%%%%%%%% Add the created Links to the Robot Object %%%%%%%%%%%%%%%%%%
robot = robotics.RigidBodyTree;
% First link is added to 'base', add the other five links
% Example code to add the body
%addBody(robot,body1,'base')

addBody(robot,body1,'base');
addBody(robot,body2,'body1');
addBody(robot,body3,'body2');
addBody(robot,body4,'body3');
addBody(robot,body5,'body4');
addBody(robot,body6,'body5');


%% Display
figure
h1 = axes;
% Create the configuration for the Robot
config = homeConfiguration(robot);

% Assign the theta parameters to the config struct
config(1).JointPosition = theta_1;
config(2).JointPosition = theta_2;
config(3).JointPosition = theta_3;
config(4).JointPosition = theta_4;
config(5).JointPosition = theta_5;
config(6).JointPosition = theta_6;ct

show(robot, config);

% Adjust the limits of the figure if you like


% Flip the axes to make our frame assignment consistent with the MATLAB
% convention
set(h1, 'Ydir', 'reverse')
set(h1, 'Xdir', 'reverse')
hold on