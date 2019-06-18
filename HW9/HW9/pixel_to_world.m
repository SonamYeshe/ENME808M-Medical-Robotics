function markers_cam = pixel_to_world(centroids, KK, Z)
% Function pixel_to_world converts the pixel co-ordinates to the camera
% co-ordinates. 
% It takes in centroids of the three markers as a 3x2 matrix, the camera
% instrinsic KK and actual distance from the camera to the markers Z and 
% returns the position of the markers in a 3x2 matrix

%%%%%%%%%%%%%%%%%%% YOUR CODE BELOW THIS LINE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
markers_cam = zeros(3,2);

for i=1:3
markers_cam(i,1)=Z*centroids(i,1)/KK(1,1);
markers_cam(i,2)=Z*centroids(i,2)/KK(2,2);
end



end