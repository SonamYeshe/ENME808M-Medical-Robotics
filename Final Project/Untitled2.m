clear all;
webcamlist;
cam = webcam('Logitech');
cam.Resolution = '1280x960';
preview(cam);
img_01 = snapshot(cam);
imwrite(img_01, 'im1.tif');
img_02 = snapshot(cam);
imwrite(img_02, 'im2.tif');
img_03 = snapshot(cam);
imwrite(img_03, 'im3.tif');
img_04 = snapshot(cam);
imwrite(img_04, 'im4.tif');
img_05 = snapshot(cam);
imwrite(img_05, 'im5.tif');
img_06 = snapshot(cam);
imwrite(img_06, 'im6.tif');
img_07 = snapshot(cam);
imwrite(img_07, 'im7.tif');
img_08 = snapshot(cam);
imwrite(img_08, 'im8.tif');
img_09 = snapshot(cam);
imwrite(img_09, 'im9.tif');
img_10 = snapshot(cam);
imwrite(img_10, 'im10.tif');
img_11 = snapshot(cam);
imwrite(img_11, 'im11.tif');
img_12 = snapshot(cam);
imwrite(img_12, 'im12.tif');
img_13 = snapshot(cam);
imwrite(img_13, 'im13.tif');
img_14 = snapshot(cam);
imwrite(img_14, 'im14.tif');
img_15 = snapshot(cam);
imwrite(img_15, 'im15.tif');
img_16 = snapshot(cam);
imwrite(img_16, 'im16.tif');
img_17 = snapshot(cam);
imwrite(img_17, 'im17.tif');

img_20 = snapshot(cam);
imwrite(img_20, 'im20.tif');
img_21 = snapshot(cam);
imwrite(img_21, 'im21.tif');
img_22 = snapshot(cam);
imwrite(img_22, 'im22.tif');
img_23 = snapshot(cam);
imwrite(img_23, 'im23.tif');