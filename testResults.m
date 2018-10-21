result = logical(resultSegmentSize) & ...
    logical(resultFeatures) &...
    logical(resultHue) &...
    logical(resultMoments) &...
    logical(resultSkeleton);% & ...
%     logical(resultEdges);
close all;
se = strel('disk',3);
result = imclose(result,se);
result = imopen(result,se);

groundTruth = 2-result;
figure, imshow(255*(groundTruth-1));
imwrite(255*(groundTruth-1), '6_Result.tif');
save ('true_prediction.mat',  'groundTruth') ;
%%

gt_file=groundTruthFile;

drawnGT = load(gt_file);
realGT = drawnGT.groundTruth;
figure, imshow(255*(realGT-1));

% Test with true prediction

test_data_file='true_prediction.mat';

[precision_true,recall_true,F_true] = performance_566(gt_file, test_data_file)

% Test with false prediction

% test_data_file='false_prediction.mat';
%
% [precision_false,recall_false,F_false] = performance_566(gt_file, test_data_file);
