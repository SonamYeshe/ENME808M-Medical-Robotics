%% This script should find the centre locations of the fiducials
% Using pointers from Lecture slides and an idea on a example workflow 
% in findCentroidsTargets.m isolate the fiducial circles and find the
% centre position of these fiducial markers
clear all;
slice=154; % slice
thickOfEachSlice=1.4; % mm/slice
sizePerPixel=1.033; % mm/pixel
width=240; % pixel
length=(slice*thickOfEachSlice);
width=width*sizePerPixel;

% load image
img=imread('Screenshot_5.png');
img_gry=rgb2gray(img);
% extract region of interests
im_slice=imcrop(img_gry);
imshow(im_slice);
sizeOfim_slice=size(im_slice);
%  applied the median filter and sharpen the image 
img_clean=medfilt2(im_slice,[3,3]);
img_c= imsharpen(img_clean);
% threshold 
bw=img_c>180;
imshow(bw)
bw_2 = bwareaopen(bw, 15);
sructelem = strel('disk',5);
bw_4=imdilate(bw_2,sructelem);
imshow(bw_4);
hold on
stats = regionprops(logical(bw_4), 'Area', 'Centroid', 'Eccentricity');
plot(stats(1).Centroid(1),stats(1).Centroid(2),'r*');
plot(stats(2).Centroid(1),stats(2).Centroid(2),'r*');
plot(stats(3).Centroid(1),stats(3).Centroid(2),'r*');
%% position of centroid of fiducial marker
width_mm_per_pixel=width/sizeOfim_slice(1); % y 
length_mm_per_pixel=length/sizeOfim_slice(2); % x
firstFiducial=[stats(1).Centroid(1)*length_mm_per_pixel,stats(1).Centroid(2)*width_mm_per_pixel];
SecondFiducial=[stats(2).Centroid(1)*length_mm_per_pixel,stats(2).Centroid(2)*width_mm_per_pixel];
ThirdFiducial=[stats(3).Centroid(1)*length_mm_per_pixel,stats(3).Centroid(2)*width_mm_per_pixel];







