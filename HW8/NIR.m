img_gry = imread('Image__2017-12-17__22-51-43.bmp');
img_gry_clean = medfilt2(img_gry,[3 3]);
img_gry_contrast = imadjust(img_gry_clean,[0.1 0.7],[]);
img_g = imsharpen(img_gry_contrast);
bw_1 = img_g > 140;

imshowpair(img_gry, bw_1, 'montage');

bw_2 = bwareaopen(bw_1, 700);
[m,n] = size(bw_2);
blob_label = bwlabel(bw_2);
stats = regionprops(logical(bw_2), 'Area', 'Centroid', 'Eccentricity');
bw_3 = false(m, n);
for i = 1 : length(stats)
    if stats(i).Eccentricity < 0.8
        bw_3(blob_label == i) = 1;
    end
end
% imshow(bw_3);