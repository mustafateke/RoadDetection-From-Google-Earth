
function [precision,recall,F] = performance_566(gt_file, test_data_file)

%%
% test_data_file='test2.mat';
% gt_file='original_image_7-GroundTruth.mat';

predicted=load(test_data_file);
gt=load(gt_file);

predicted_v=single(reshape(predicted.groundTruth,size(predicted.groundTruth,1)*size(predicted.groundTruth,2),1));
gt_v = single(reshape(gt.groundTruth,size(gt.groundTruth,1)*size(gt.groundTruth,2),1));

clear predicted;
clear gt;

[confus,numcorrect,precision,recall,F] = getcm (gt_v,predicted_v,1:2);