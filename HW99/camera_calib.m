%% Camera Calibration Lab
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Make sure you have your webcamera calibrated and the markers are 
% clearly visible in the field of view of the camera before starting to complete
% this lab

%%
% Insert your Calibration Matrix and depth to the fiducials using extrinsics here
KK = zeros(3,3);
% KK=[1382.1,0,658.5731;0,1381.3,471.8988;0,0,1];
KK=[1383.384,0,658.5731;0,1383.1,471.8988;0,0,1];
Z = 372.9482;

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

img = imread('im1.tif');
centroids = compute_marker_location(img);

%% 
% Convert the Pixel co-ordinates to the camera reference frame
markers_cam = pixel_to_world(centroids, KK, Z);


        