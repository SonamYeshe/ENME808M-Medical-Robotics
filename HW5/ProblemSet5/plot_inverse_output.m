% For the line trajectory   
% function plot_inverse_output(posArray, startPoint, endPoint)
% For my own trajectory
% function plot_inverse_output(posArray, startRadian, endRadian)




function plot_inverse_output(posArray, startRadian, endRadian)
% function plot_inverse_output displays the performance of inverse
% kinematics solution through animation
% startPoint - first point on the line
% endPoint - last point on the line
% posArray - 7x3xn matrix containing position of all the seven points on
% the manipulator across all the n steps

[~, ~, m] = size(posArray);
pause on;  % Set this to on if you want to watch the animation
GraphingTimeDelay = 0.05; % The length of time that Matlab should pause between positions when graphing, if at all, in seconds.

% Setup plot
figure(2)
scale_f = 1;
axis vis3d
axis(scale_f*[-4 4 -4 4 -4 4])
grid on
view(70,10)
xlabel('X (m.)')
ylabel('Y (m.)')
zlabel('Z (m.)')

% Plot robot initially
hold on
hrobot = plot3([posArray(1, 1,1) posArray(2, 1,1) posArray(3, 1,1) posArray(4, 1,1) posArray(5, 1,1) posArray(6, 1,1), posArray(7, 1,1)]',...
      [posArray(1, 2, 1) posArray(2, 2,1) posArray(3, 2,1) posArray(4, 2,1) posArray(5, 2,1) posArray(6, 2,1), posArray(7, 2,1)]',... 
      [posArray(1, 3, 1) posArray(2, 3, 1) posArray(3, 3, 1) posArray(4, 3, 1) posArray(5, 3, 1) posArray(6, 3, 1), posArray(7, 3, 1)]', 'k.-','linewidth',1,'markersize',20);
  hold on

% For the line trajectory   
%plot3([startPoint(1), endPoint(1)]', [startPoint(2), endPoint(2)]', [startPoint(3), endPoint(3)]', 'g', 'linewidth', 1, 'LineStyle', '--')
% For my own trajectory
points = my_trajectory_generator(startRadian, endRadian, 0.01);
plot3(points(:,1), points(:,2), points(:,3), 'g', 'linewidth', 1, 'LineStyle', '--');



pause(GraphingTimeDelay);

actualPose = posArray(7,:,1);
for i = 2 : m
    cla(hrobot)
    set(hrobot,'xdata',[posArray(1, 1,i) posArray(2, 1, i) posArray(3, 1, i) posArray(4, 1, i) posArray(5, 1, i) posArray(6, 1, i) posArray(7, 1, i)]',...
        'ydata',[posArray(1, 2, i) posArray(2, 2, i) posArray(3, 2, i) posArray(4, 2, i) posArray(5, 2, i) posArray(6, 2, i) posArray(7, 2, i)]',...
        'zdata',[posArray(1, 3, i) posArray(2, 3, i) posArray(3, 3) posArray(4, 3, i) posArray(5, 3, i) posArray(6, 3, i) posArray(7, 3, i)]');
    actualPose = [actualPose;posArray(7,:,i)];
    hold on
% For the line trajectory 
%    plot3([startPoint(1), endPoint(1)]', [startPoint(2), endPoint(2)]', [startPoint(3), endPoint(3)]', 'g', 'linewidth', 1, 'LineStyle', '--')
% For my own trajectory
    plot3(points(:,1), points(:,2), points(:,3), 'g', 'linewidth', 1, 'LineStyle', '--');



    plot3(actualPose(:,1), actualPose(:,2), actualPose(:,3))
    pause(GraphingTimeDelay);
end