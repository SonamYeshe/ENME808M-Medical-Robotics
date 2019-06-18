function [robot] = plot_manip_sol(theta_1, theta_2, theta_3, theta_4, theta_5, theta_6)
% Function plot_manip will plot the manipulator based of DH parameters
% using functions from Robotics System toolbox. 
% The function essentially helps in the visualization of the frames
robot = robotics.RigidBodyTree;
%% Pass some dummy params
l_1_x = 0.41;
l_1_z = 1; 
l_2 = 1.12;
l_3 = 0.25;
l_4 = 1.285;
l_5 = 0;
l_6 = 0.3;
%% DH Params
dhparams = [ l_1_x      pi/2    l_1_z     0;
             l_2      0          0        0;
             l_3     pi/2        0        0;
             0      -pi/2        l_4        0;
             0      pi/2         l_5        0;
             0      0            l_6      0];


%% Create the Rigid body chain
% Example code for creating a body using Robotics System Toolbox
% body0 = robotics.RigidBody('body0');
% jnt0 = robotics.Joint('jnt0','revolute');
% setFixedTransform(jnt0,eye(4));
% body0.Joint = jnt0;

body1 = robotics.RigidBody('body1');
jnt1 = robotics.Joint('jnt1','revolute');
setFixedTransform(jnt1,dhparams(1,:),'dh');
body1.Joint = jnt1;

body2 = robotics.RigidBody('body2');
jnt2 = robotics.Joint('jnt2','revolute');
body3 = robotics.RigidBody('body3');
jnt3 = robotics.Joint('jnt3','revolute');
body4 = robotics.RigidBody('body4');
jnt4 = robotics.Joint('jnt4','revolute');
body5 = robotics.RigidBody('body5');
jnt5 = robotics.Joint('jnt5','revolute');
bodyEndEffector = robotics.RigidBody('endeffector');
jnt6 = robotics.Joint('jnt6','revolute');

setFixedTransform(jnt2,dhparams(2,:),'dh');
setFixedTransform(jnt3,dhparams(3,:),'dh');
setFixedTransform(jnt4,dhparams(4,:),'dh');
setFixedTransform(jnt5,dhparams(5,:),'dh');
setFixedTransform(jnt6,dhparams(6,:),'dh');

body2.Joint = jnt2;
body3.Joint = jnt3;
body4.Joint = jnt4;
body5.Joint = jnt5;
bodyEndEffector.Joint = jnt6;

addBody(robot,body1,'base')
addBody(robot,body2,'body1')
addBody(robot,body3,'body2')
addBody(robot,body4,'body3')
addBody(robot,body5,'body4')
addBody(robot,bodyEndEffector,'body5')

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
config(6).JointPosition = theta_6;

show(robot, config);

% Flip the axes to make our frame assignment consistent with the MATLAB
% convention
set(h1, 'Ydir', 'reverse')
set(h1, 'Xdir', 'reverse')
hold on