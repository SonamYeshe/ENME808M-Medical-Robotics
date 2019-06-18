function robot = create_rigid_body_chain(theta_1, theta_2, theta_3, theta_4, theta_5, theta_6)
% create_rigid_body_chain creates the kuka iiwa robot manipulator using Robotics 
% System Toolbox

link0 = robotics.RigidBody('link0');
jnt1 = robotics.Joint('jnt1','revolute');
jnt1.HomePosition = 0;
tform1 = eul2tform([0, 0, 0])* trvec2tform([0, 0, 0]);
setFixedTransform(jnt1,tform1);
link0.Joint = jnt1;

%%%%%%%%%%%%%%%%%%%%%%% Your code below this line %%%%%%%%%%%%%%%%%%%%%%%%%%
% Create other five links with revolute joints

link1 = robotics.RigidBody('link1');
jnt2 = robotics.Joint('jnt2','revolute');
jnt2.HomePosition = 0;
tform2 = eul2tform([theta_1, 0, pi/2])* trvec2tform([0, 0.15, 0]);
setFixedTransform(jnt2,tform2);
link1.Joint = jnt2;

link2 = robotics.RigidBody('link2');
jnt3 = robotics.Joint('jnt3','revolute');
jnt3.HomePosition = 0;
tform3 = eul2tform([theta_2, 0, 0])* trvec2tform([0, 0.45, 0]);
setFixedTransform(jnt3,tform3);
link2.Joint = jnt3;

link3 = robotics.RigidBody('link3');
jnt4 = robotics.Joint('jnt4','revolute');
jnt4.HomePosition = 0;
tform4 = eul2tform([theta_3, pi/2, 0])* trvec2tform([0, 0, 0.15]);
setFixedTransform(jnt4,tform4);
link3.Joint = jnt4;

link4 = robotics.RigidBody('link4');
jnt5 = robotics.Joint('jnt5','revolute');
jnt5.HomePosition = 0;
tform5 = eul2tform([theta_4, -pi/2, 0])* trvec2tform([0.2, 0, 0]);
setFixedTransform(jnt5,tform5);
link4.Joint = jnt5;

link5 = robotics.RigidBody('link5');
jnt6 = robotics.Joint('jnt6','revolute');
jnt6.HomePosition = 0;
tform6 = eul2tform([theta_5, 0, pi/2])* trvec2tform([0, 0, 0.15]);
setFixedTransform(jnt6,tform6);
link5.Joint = jnt6;

% create the end-effector
% bodyEndEffector = robotics.RigidBody('endeffector');
% tform8 = eul2tform([0, 0, 0])* trvec2tform([0, 0, 0.1]);
% setFixedTransform(bodyEndEffector.Joint,tform8);

bodyEndEffector = robotics.RigidBody('endeffector');
tform7 = eul2tform([theta_6, 0, 0])* trvec2tform([0, 0, 0.1]);
setFixedTransform(bodyEndEffector.Joint,tform7);

%% create the robot and add the links created previously
robot = robotics.RigidBodyTree;
addBody(robot,link0,'base');

%%%%%%%%%%%%%%%%%%% Your code below this line %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Add other links to the robot structure

addBody(robot,link1,'link0');
addBody(robot,link2,'link1');
addBody(robot,link3,'link2');
addBody(robot,link4,'link3');
addBody(robot,link5,'link4');

% Add end-effector to the link
%addBody(robot,bodyEndEffector,'link6')
addBody(robot,bodyEndEffector,'link5');


% config = homeConfiguration(robot);
% disp(config(5).JointPosition);
% figure
% show(robot);
% hold on
end