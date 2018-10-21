%demo 566
close all;
clear all;

global imgRGB; % color image for displayýng 8 bit for each channel.
global imgR;
global imgG;
global imgB;
global filename;
global labels;
global colorvec;

filename = 'project_im/original_image_26.jpg';
groundTruthFile = 'project_im/original_image_26-GroundTruth.mat';
load(groundTruthFile);

I = imread(filename);

imgRGB = I;
imgR = I(:, :, 1);
imgG = I(:, :, 2);
imgB = I(:, :, 3);

figure, imshow(I);
BW = edge(rgb2gray(I),'canny');
figure, imshow(BW);
imwrite(BW, '0_edges.tif');

[H,theta,rho] = hough(BW);

resultSegmentSize = zeros(size(BW));
resultFeatures = zeros(size(BW));
resultHue = zeros(size(BW));
resultMoment = zeros(size(BW));
resultSkeleton = zeros(size(BW));
resultEdges = zeros(size(BW));
% LUVIm = RGB2Luv(I);

% [fimage labels modes regSize grad conf] = ...
%     edison_wrapper(I,@RGB2Luv, 'SpatialBandWidth' ,3,  ...
%     'RangeBandWidth', 3, ...
%     'MinimumRegionArea', 7,...
%     'steps', 1,...
%     'synergistic', false);

pr_MeanShiftSeg
imgRegionCount = max(labels(:));
hsv = rgb2hsv(imgRGB);
imwrite(hsv, '0_HSVSegments.tif');
imwrite(imgRGB, '0_RGBSegments.tif');
% figure, imshow(imgRGB);


%%segment statistics

statsR = ...
    regionprops(labels, 'Area', 'PixelIdxList', 'PixelList','MajorAxisLength','MinorAxisLength');

testSize;
testFeature;
testHue;
testMoments;
testSkeleton;
testHough;
testEdges;


testResults;