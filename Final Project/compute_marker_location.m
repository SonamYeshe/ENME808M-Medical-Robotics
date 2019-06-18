function target = compute_marker_location(img)
% Function compute_marker_location takes in a img(uint8 format) as an input argument 
% and returns the centroids of the three markers as a 3x2 array.
% Perform necessary image processing operations to get the location of the
% centroids

%%%%%%%%%%%%%%%%%%%% YOUR CODE BELOW THIS LINE %%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
	coloredObjectsMask = uint8(hueMask & saturationMask);
	subplot(3, 4, 9);
	imshow(coloredObjectsMask, []);
	caption = sprintf('Mask of Only Regions\nof The Specified Color');
	title(caption, 'FontSize', fontSize);
    
    subplot(3, 4, 5);
    img_clean = medfilt2(hueMask & saturationMask, [3 3]);
%  img_clean = hueMask & saturationMask;
    imshow(img_clean);
img_clean=img_clean-1;
% bw_2 = bwareaopen(img_clean, 15);
% sructelem = strel('disk',5);
% bw_4=imdilate(bw_2,sructelem);
% imshow(bw_4);
% hold on
% stats = regionprops(logical(bw_4), 'Area', 'Centroid', 'Eccentricity');
[m,n]=size(img_clean);
    stats = regionprops(logical(img_clean), 'Area', 'Centroid', 'Eccentricity');
sizeStats=size(stats);
bw_3=false(m,n);
ii=1;
subplot(3, 4, 6);
hold on
    label=bwlabel(img_clean);
    for i=1:sizeStats(1)
    if(stats(i).Eccentricity<0.5 && stats(i).Eccentricity>0.1 && stats(i).Area>15)
    target(ii,:)=[stats(i).Centroid(1),stats(i).Centroid(2)];
    bw_3(label==i)=1;
    ii=ii+1;
    end
end
imshow(bw_3);
hold on
for i=1:sizeStats(1)
    if(stats(i).Eccentricity<0.5 && stats(i).Eccentricity>0.1  && stats(i).Area>15)
    plot(stats(i).Centroid(1),stats(i).Centroid(2),'r*'); 
    end
end


figure
imshow(img)
% Plot the contours and the centroids of the markers on the image

end