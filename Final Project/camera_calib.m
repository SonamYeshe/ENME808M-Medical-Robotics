%% Camera Calibration Lab
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Make sure you have your webcamera calibrated and the markers are 
% clearly visible in the field of view of the camera before starting to complete
% this lab
img_26 = snapshot(cam);
imwrite(img_26, 'im26.tif');
img = imread('im26.tif');
%%
% Insert your Calibration Matrix and depth to the fiducials using extrinsics here
KK = zeros(3,3);
KK = [1428.4,0,631.7628; 0,1421.1,463.2122; 0,0,1];
Z = 370.4846-16.5;
% ZZ = Z - 15;
% KK=[1383.384,0,658.5731;0,1383.1,471.8988;0,0,1];
% Z = 372.9482;

%%
% Enter the correct integer to the webcam function as per the connection
% on your computer.
% if ~exist('cam','var')
%     cam = webcam(2); 
% end
%%
% Acquire an image and locate the centroids. You should complete the
% function compute_marker_location.m

% img = snapshot(cam);


centroids2 = compute_marker_location(img);
centroids=zeros(3,2);
tmp1 = 0;
for i=1:3
    if (centroids2(i,1)>tmp1)
        tmp1 = centroids2(i,1);
        num1 = i;
    end
end
centroids(3,:) = centroids2(num1,:);

tmp2 = 10000;
for i=1:3
    if (centroids2(i,2)<tmp2)
        tmp2 = centroids2(i,2);
        num2 = i;
    end
end
centroids(1,:) = centroids2(num2,:);

for i=1:3
    if (num1 ~= i && num2 ~= i)
        num3 = i;
    end
end
centroids(2,:) = centroids2(num3,:);

%% 
% Convert the Pixel co-ordinates to the camera reference frame
markers_cam = pixel_to_world(centroids, KK, Z);


        