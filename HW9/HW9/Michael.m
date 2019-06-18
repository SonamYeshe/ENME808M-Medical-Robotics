clear all;
img=imread('Screenshot_5.png');
img_gry=rgb2gray(img);
imshow(img_gry);
im_slice=imcrop(img_gry);
imshow(im_slice);
img_clean=medfilt2(im_slice,[3,3]);
imshow(img_clean)
img_c= imadjust(img_clean);
imshow(img_c)
imhist(img_c);

% shows the image
figure(1)
img_c= imsharpen(img_clean);
imshow(img_c)

% Find the (fiducial)phidusial marker
figure(2)
bw=img_c>180;
imshow(bw)
bw_2 = bwareaopen(bw, 15);
imshow(bw_2)
sructelem = strel('disk',5);
bw_4=imdilate(bw_2,sructelem);
imshow(bw_4);
stats = regionprops(logical(bw_4), 'Area', 'Centroid', 'Eccentricity');


bw_2 = 1 - bw;
imshow(bw_2)
blob_label = bwlabel(bw_2);
imshow(blob_label)



