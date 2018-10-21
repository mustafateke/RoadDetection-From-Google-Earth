%% Feature Test%% Segment Feature Count Test
yol = zeros(size(BW));
c9 = fast9(I, 10,1);
% plot(c9(:,1), c9(:,2), 'r.')
featureCount = zeros(imgRegionCount, 1);
if size(c9, 1) < 3*size(featureCount, 1)
    yol = 255*ones(size(BW));
else
for pt = 1:size(c9, 1);
    x = c9( pt, 1);
    y = c9( pt, 2);
    val = labels(y, x);
    featureCount(val) = 1 + featureCount(val);
    
end    
for segment = 1:imgRegionCount

    if(featureCount(segment) > 5)
            close all;
%     figure, imshow(imgRGB);
       tyol = zeros(size(imgB));
       tyol(labels == segment) = 255;
       yol = yol + tyol;

    end
end
end
imwrite(yol, '3_FeatureCountTest.tif');
resultFeatures = yol;