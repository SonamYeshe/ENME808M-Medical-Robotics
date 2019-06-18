% clear all;
% img = imread('fiducial.tif');
% img_clean_R = medfilt2(img(:,:,1), [3 3]);
% img_clean_G = medfilt2(img(:,:,2), [3 3]);
% img_clean_B = medfilt2(img(:,:,3), [3 3]);
% imgFiltered(:,:,1)=img_clean_R;
% imgFiltered(:,:,2)=img_clean_G;
% imgFiltered(:,:,3)=img_clean_B;
% figure, imshow(imgFiltered)

%%

clear all;
img = imread('fiducial.tif');

% Convert RGB image to HSV
hsvImage = rgb2hsv(img);
% Extract out the H, S, and V images individually
hImage = hsvImage(:,:,1);
sImage = hsvImage(:,:,2);
vImage = hsvImage(:,:,3);

% Yellow
hueThresholdLow = 0.1;
hueThresholdHigh = 0.5;
saturationThresholdLow = 0.7;
saturationThresholdHigh = 1;
valueThresholdLow = 0.8;
valueThresholdHigh = 1.0;


fontSize = 16;

% Display the original image.
	subplot(3, 4, 1);
	hRGB = imshow(img);
    
    % Display the hue image.
	subplot(3, 4, 2);
	h1 = imshow(hImage);
	title('Hue Image', 'FontSize', fontSize);
	% Set up an infor panel so you can mouse around and inspect the hue values.
	hHuePI = impixelinfo(h1);
	set(hHuePI, 'Units', 'Normalized', 'Position',[.34 .69 .15 .02]);
	
	% Display the saturation image.
	h2 = subplot(3, 4, 3);
	imshow(sImage);
	title('Saturation Image', 'FontSize', fontSize);
	% Set up an infor panel so you can mouse around and inspect the saturation values.
	hSatPI = impixelinfo(h2);
	set(hSatPI, 'Units', 'Normalized', 'Position',[.54 .69 .15 .02]);
	
	% Display the value image.
	h3 = subplot(3, 4, 4);
	imshow(vImage);
	title('Value Image', 'FontSize', fontSize);
	% Set up an infor panel so you can mouse around and inspect the value values.
	hValuePI = impixelinfo(h3);
	set(hValuePI, 'Units', 'Normalized', 'Position',[.75 .69 .15 .02]);
    
    	% Display the thresholded binary images.
        
        % Now apply each color band's particular thresholds to the color band
hueMask = (hImage >= hueThresholdLow) & (hImage <= hueThresholdHigh);
saturationMask = (sImage >= saturationThresholdLow) & (sImage <= saturationThresholdHigh);
valueMask = (vImage >= valueThresholdLow) & (vImage <= valueThresholdHigh);        
hueMask=1-hueMask;
valueMask=1-valueMask;

	fontSize = 16;
	subplot(3, 4, 10);
	imshow(hueMask, []);
	title('=   Hue Mask', 'FontSize', fontSize);
	subplot(3, 4, 11);
	imshow(saturationMask, []);
	title('&   Saturation Mask', 'FontSize', fontSize);
	subplot(3, 4, 12);
	imshow(valueMask, []);
	title('&   Value Mask', 'FontSize', fontSize);
	% Combine the masks to find where all 3 are "true."
	% Then we will have the mask of only the red parts of the image.
	coloredObjectsMask = uint8(hueMask & saturationMask & valueMask);
	subplot(3, 4, 9);
	imshow(coloredObjectsMask, []);
	caption = sprintf('Mask of Only Regions\nof The Specified Color');
	title(caption, 'FontSize', fontSize);
    
    