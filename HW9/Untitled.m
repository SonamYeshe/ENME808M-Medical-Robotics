webcamlist;
cam = webcam('Logitech');
cam.Resolution = '1280x960';
preview(cam);
img_01 = snapshot(cam);
imwrite(img_01, 'im1.tif');