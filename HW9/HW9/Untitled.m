webcamlist;
cam = webcam('Logitech');
cam.Resolution = '1280x960';
preview(cam);
img_01 = snapshot(cam);
imwrite(img_01,'im1.tif');
imwrite(img_02,'im2.tif');
imwrite(img_03,'im3.tif');
imwrite(img_04,'im4.tif');
imwrite(img_05,'im5.tif');
imwrite(img_06,'im6.tif');
imwrite(img_07,'im7.tif');
imwrite(img_08,'im8.tif');
imwrite(img_09,'im9.tif');
imwrite(img_10,'im10.tif');
imwrite(img_11,'im11.tif');
imwrite(img_12,'im12.tif');
imwrite(img_13,'im13.tif');
imwrite(img_14,'im14.tif');
imwrite(img_15,'im15.tif');
imwrite(img_16,'im16.tif');
imwrite(img_17,'im17.tif');

% img_01 = snapshot(cam);
% imshow(img_01)

imwrite(img_01,'im3.tif');
imwrite(img_01,'im4.tif');
imwrite(img_01,'im5.tif');