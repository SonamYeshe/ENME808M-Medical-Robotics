function [points] = my_trajectory_generator(startRadian, endRadian, resolution)
% Helix line is my chosen trajectory with radius equals 1, height euqals 3.
% Input arguments should be startRadian, endRadian, resolution.
% (startRadian, endRadian, resolution)

% points will be a N x 3 matrix where N is the number of points in the
% trajectory.
% startRadian = 0;
% endRadian = 2*pi;
% resolution = 0.01;



r = 2;
h = 1;
t = startRadian : (endRadian - startRadian) * resolution : endRadian;
points(:,1) = r * sin(t);
points(:,2) = r * cos(t);
points(:,3) = h / (endRadian - startRadian) * t;
plot3(points(:,1),points(:,2),points(:,3));
hold on;
end