%% This script should find the centre locations of the fiducials
% Using pointers from Lecture slides and an idea on a example workflow 
% in findCentroidsTargets.m isolate the fiducial circles and find the
% centre position of these fiducial markers
%% Read the Image convert to grayscale 
img = imread('fiducial.png');
img_gry = rgb2gray(img);
%% Crop the image to get just the slice
img_gry_slice = imcrop(img_gry);
%% Apply Noise Removal and contrast enhancement (if you like to)
img_gry_clean = medfilt2(img_gry_slice,[3 3]);
img_gry_contrast = imadjust(img_gry_clean);
%% You May sharpen the image for more sharp edges
img_g = imsharpen(img_gry_contrast);
%% Choose an appropriate threshold to segment the body of the target
bw_1 = img_g > 254;
%% Remove any unwanted blobs by querying the area or some morphological cleaning
bw_2 = bwareaopen(bw_1, 700);
%% Query the region properties using properties that can isolate circular blobs
[m,n] = size(bw_2);
blob_label = bwlabel(bw_2);
stats = regionprops(logical(bw_2), 'Area', 'Centroid', 'Eccentricity');
bw_3 = false(m, n);
for i = 1 : length(stats)
    if stats(i).Eccentricity < 0.8
        bw_3(blob_label == i) = 1;
    end
end
%% You may Process the image further using dilation to complete circularity
structelem = strel('disk',5);
bw_4 = imdilate(bw_3, structelem);
%% Get the centroids of the isolated circular blobs
blob_label2 = bwlabel(bw_4);
stats2 = regionprops(logical(bw_4),'Centroid');
%% Plot the contour and centroid position on top of the image
[B, L] = bwboundaries(bw_4, 8);
imshow(L);
hold on;
for k = 1 : length(B)
    boundary = B{k};
    plot(boundary(:,2), boundary(:,1), 'r', 'LineWidth', 2)
end
for i = 1 : length(stats2)
    plot(stats2(i).Centroid(1), stats2(i).Centroid(2), 'b*');
end