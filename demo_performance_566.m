%%

gt_file='original_image_7-GroundTruth.mat';


% Test with true prediction

test_data_file='true_prediction.mat';

[precision_true,recall_true,F_true] = performance_566(gt_file, test_data_file);

% Test with false prediction

test_data_file='false_prediction.mat';

[precision_false,recall_false,F_false] = performance_566(gt_file, test_data_file);


