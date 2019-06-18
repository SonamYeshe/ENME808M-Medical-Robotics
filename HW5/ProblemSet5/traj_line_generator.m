function [points] = traj_line_generator(startPoint, endPoint, resolution)
% Function traj_line_generator.m generates points on a 
% straight line between start and end points at a specific resolution 
% Resolution is a fraction value between 0 and 1
points = zeros(floor(1 / resolution) + 1, 3);
for j = 1:3
    if startPoint(j) ~= endPoint(j)
        for i = 1 : floor(1 / resolution) + 1
            points(i,j) = startPoint(j) + (i - 1) * resolution * (endPoint(j) - startPoint(j));
        end
    else
        points(:,j) = startPoint(j);
    end
end
end