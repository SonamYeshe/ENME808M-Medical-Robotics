clear all;
webcamlist;
cam = webcam('Logitech');
cam.Resolution = '1280x960';
preview(cam);