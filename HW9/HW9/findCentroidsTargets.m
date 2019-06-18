%% This script will segment the three circle of the target rings
% The pipeline here is just for reference. You can be creative and are free
% (encouraged) to try your own approach
clear all;
slice=154; % slice
thickOfEachSlice=1.4; % mm/slice
sizePerPixel=1.033; % mm/pixel
width=240; % pixel
length=(slice*thickOfEachSlice);
width=width*sizePerPixel;
% load image
img=imread('Screenshot_6.png');
img_gry=rgb2gray(img);
% extract region of interests
im_slice=imcrop(img_gry);
imshow(im_slice);
sizeOfim_slice=size(im_slice);
%  applied the median filter and sharpen the image 
img_clean=medfilt2(im_slice,[3,3]);
img_c= imsharpen(img_clean);
% threshold 
bw=img_c>100;
imshow(bw)
[m,n]=size(bw);
label=bwlabel(bw);
stats = regionprops(logical(bw), 'Area', 'Centroid', 'Eccentricity');
sizeStats=size(stats);
bw_3=false(m,n);
ii=1;
width_mm_per_pixel=width/sizeOfim_slice(1); % y 
length_mm_per_pixel=length/sizeOfim_slice(2); % x

for i=1:sizeStats(1)
    if(stats(i).Eccentricity<0.4 && stats(i).Eccentricity>0.1)
    target(ii,:)=[stats(i).Centroid(1)*length_mm_per_pixel,stats(i).Centroid(2)*width_mm_per_pixel];
    bw_3(label==i)=1;
    ii=ii+1;
    end
end
imshow(bw_3);
hold on
for i=1:sizeStats(1)
    if(stats(i).Eccentricity<0.4 && stats(i).Eccentricity>0.1)
    plot(stats(i).Centroid(1),stats(i).Centroid(2),'r*'); 
    end
end

