clear; close all;

% Load image
TestImage = imread('TestImage.png');

% Threshold image as instructed in question
TestImage(TestImage > 125) = 255;
TestImage(TestImage < 125) = 0;

% Save thresholded image
imwrite(TestImage,'ThresholdedImage.png');