function plot_inverse_output_extra(robot, configSol, startPoint, endPoint)
% function plot_inverse_output displays the performance of inverse
% kinematics solution through animation
% robot - robot object as created by robotics system toolbox.
% startPoint - first point on the line
% endPoint - last point on the line
% configSol - (n+1)x6 struct array containing configuration solutions
%            to trace the points on the straight line              
n = size(configSol,1);

figure
h1 = axes;
framesPerSecond = 10;
r = robotics.Rate(framesPerSecond);
for i = 1:n
    show(robot,configSol(i,:)','PreservePlot',false);
    set(h1, 'Ydir', 'reverse')
    set(h1, 'Xdir', 'reverse')
    hold on
    plot3([startPoint(1), endPoint(1)]', [startPoint(2), endPoint(2)]', [startPoint(3), endPoint(3)]', 'g', 'linewidth', 1, 'LineStyle', '--')
    drawnow
    waitfor(r);
end
end

