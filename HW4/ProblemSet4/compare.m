function err = compare(robot, pos)
% function compare.m takes the rigid body tree robot and 12x3 position
% array that was computed in fanuc_m900_fk.m. 
% function will compute the error between the positions of frame o_6 that
% is computed through robotics system toolbox and the position array. 
configuration = randomConfiguration(robot);
theta_1 = 0;
theta_2 = pi/4;
theta_3 = -pi/3;
theta_4 = 0;
theta_5  = pi/4;
theta_6 = 0;

% Modify this to other than the base configuration 
configuration(1).JointPosition = theta_1;
configuration(2).JointPosition = theta_2;
configuration(3).JointPosition = theta_3;
configuration(4).JointPosition = theta_4;
configuration(5).JointPosition = theta_5;
configuration(6).JointPosition = theta_6;

%%%%%%%%%% Your Code Below this Line %%%%%%%%%%%%%%%%%%%%%%%%%%
err = 0;
o_0 = [0; 0; 0; 1];
transform = getTransform(robot,configuration,'body6');
o_6_1_pesudo = transform * o_0;
o_6_1(1,:) = o_6_1_pesudo(1:3);

o_6_2 = pos(7,:);

err = sqrt(sum((o_6_1 - o_6_2).^2));

end
%compare(plot_manip_frames(0, pi/4, -pi/3, 0, pi/4, 0), fanuc_m900_fk(0, pi/4, -pi/3, 0, pi/4, 0))