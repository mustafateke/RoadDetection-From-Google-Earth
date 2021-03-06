%% Segment Size Test
yol = zeros(size(BW));
for segment = 1:imgRegionCount

    area = statsR(segment).Area;
    color = colorvec(segment+1, :);
    hsv = 255*rgb2hsv(color);
    if(area > 3000)
            close all;
%     figure, imshow(imgRGB);
       tyol = zeros(size(imgB));
       tyol(labels == segment) = 255;
       yol = yol + tyol;
    end
end
imwrite(yol, '1_largeSegments.tif');
resultSegmentSize = yol;