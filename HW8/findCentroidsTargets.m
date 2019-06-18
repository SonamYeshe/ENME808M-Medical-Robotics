%% This script will segment the three circle of the target rings
% The pipeline here is just for reference. You can be creative and are free
% (encouraged) to try your own approach
%% Read the Image convert to grayscale 
%img = imread('img.png');
img = imread('target.png');
img_gry = rgb2gray(img);
%imshow(img_gry);
%% Crop the image to get just the slice
%im_slice = imcrop(img_g);
img_gry_slice = imcrop(img_gry);

%% Apply Noise Removal and contrast enhancement (if you like to)
%img_clean = medfilt2(im_slice,[3 3]);
%img_g_contrast = imadjust(img_clean);
img_gry_clean = medfilt2(img_gry_slice,[3 3]);
img_gry_contrast = imadjust(img_gry_clean);

%% You May sharpen the image for more sharp edges
%img_g = imsharpen(img_g_contrast);
img_g = imsharpen(img_gry_contrast);

%% Choose an appropriate threshold to segment the body of the target
%for binary pics, 0 = black, 1 = white.

%bw_1 = img_g < threshold;
%bw = imbinarize(img_g);
bw_1 = img_g > 110;
%imshowpair(bw,bw_1,'montage')

%% Remove any unwanted blobs by querying the area or some morphological cleaning
% see 'bwareaopen'
bw_2 = bwareaopen(bw_1, 500);
%imshowpair(bw_1,bw_2,'montage')

%% Invert the Image to get blobs corresponding to the internal circles of the target
%bw_2 = 1 - bw_1;

%% Query the region properties using properties that can isolate circular blobs
%label = bwlabel(bw_3);
%stats = regionprops(logical(bw_3), 'Area', 'Centroid', 'Eccentricity');
[m,n] = size(bw_2);
blob_label = bwlabel(bw_2);
stats = regionprops(logical(bw_2), 'Area', 'Centroid', 'Eccentricity');
bw_3 = false(m, n);
for i = 1 : length(stats)
    if stats(i).Eccentricity < 0.6
        bw_3(blob_label == i) = 1;
    end
end
% imshow(bw_3);
% Iterate over stats and pick only those blobs that fits the circularity 
% criteria
%% You may Process the image further using dilation to complete circularity
%structelem = strel('disk',1);
%bw_4 = imdilate(bw_3, structelem);
structelem = strel('disk',5);
bw_4 = imdilate(bw_3, structelem);
%imshowpair(bw_3,bw_4,'montage')

%% Get the centroids of the isolated circular blobs
%label2 = bwlabel(bw_4);
%stats2 = regionprops(logical(bw_5),'Centroid');
blob_label2 = bwlabel(bw_4);
stats2 = regionprops(logical(bw_4),'Centroid');
% Iterate over the centroids to gather the centroid positions. 

%% Plot the contour and centroid position on top of the image
% Check bwboundaries/bwperim
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
%bw_5 = bwperim(bw_4, 8);
