img = imread('fiducial.tif');
img_clean_R = medfilt2(img(:,:,1), [3 3]);
img_clean_G = medfilt2(img(:,:,2), [3 3]);
img_clean_B = medfilt2(img(:,:,3), [3 3]);
img_contrast_R = imadjust(img_clean_R);
img_contrast_G = imadjust(img_clean_G);
img_contrast_B = imadjust(img_clean_B);
img_rgb_R = imsharpen(img_contrast_R);
img_rgb_G = imsharpen(img_contrast_G);
img_rgb_B = imsharpen(img_contrast_B);
imgFiltered(:,:,1)=img_rgb_R;
imgFiltered(:,:,2)=img_rgb_G;
imgFiltered(:,:,3)=img_rgb_B;
figure, imshow(imgFiltered);
%30-35
load regioncoordinates;

nColors = 6;
sample_regions = false([size(imgFiltered,1) size(imgFiltered,2) nColors]);

for count = 1:nColors
  sample_regions(:,:,count) = roipoly(imgFiltered,region_coordinates(:,1,count),...
                                      region_coordinates(:,2,count));
end

imshow(sample_regions(:,:,2)),title('sample region for red');

lab_imgFiltered = rgb2lab(imgFiltered);

a = lab_imgFiltered(:,:,2);
b = lab_imgFiltered(:,:,3);
color_markers = zeros([nColors, 2]);

for count = 1:nColors
  color_markers(count,1) = mean2(a(sample_regions(:,:,count)));
  color_markers(count,2) = mean2(b(sample_regions(:,:,count)));
end

fprintf('[%0.3f,%0.3f] \n',color_markers(2,1),color_markers(2,2));

color_labels = 0:nColors-1;
a = double(a);
b = double(b);
distance = zeros([size(a), nColors]);
for count = 1:nColors
  distance(:,:,count) = ( (a - color_markers(count,1)).^2 + ...
                      (b - color_markers(count,2)).^2 ).^0.5;
end

[~, label] = min(distance,[],3);
label = color_labels(label);
clear distance;
rgb_label = repmat(label,[1 1 3]);
segmented_images = zeros([size(imgFiltered), nColors],'uint8');

for count = 1:nColors
  color = imgFiltered;
  color(rgb_label ~= color_labels(count)) = 0;
  segmented_images(:,:,:,count) = color;
end 

imshow(segmented_images(:,:,:,2)), title('red objects');