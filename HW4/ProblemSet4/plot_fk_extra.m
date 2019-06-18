function plot_fk_extra(pos)
% Function plot_fk takes the Forward Kinematics solution(pos - 8 x 3 matrix) computed and plots
% these positions it like a stick figure for the manipulator using plot3
% function

% Plot the manipulator body using plot3 and your solution for the pos

plot3(pos(1:8,1),pos(1:8,2),pos(1:8,3),'-k*');
hold on
% Plot the Gripper using plot3 function and your solution for the pos

plot3(pos(9:13,1),pos(9:13,2),pos(9:13,3),'-go');

xlabel('x_0');
ylabel('y_0');
zlabel('z_0');
hold on

end