%% Segment Size Test
yol = zeros(size(BW));
edgeCount = zeros(imgRegionCount, 1);
for segment=1:imgRegionCount%her bir segment için loop
    %o segmentin alan?
    
    rows =size(statsR(segment).PixelList, 1);
    if(rows==0)
        stop=0;
    end
    pixelcolor=zeros(rows, 3);
    for row=1:rows
        x = statsR(segment).PixelList(row,1);
        y = statsR(segment).PixelList(row,2);
        edge = BW(y, x);
        if(edge)
           edgeCount(segment, 1) = edgeCount(segment, 1) + 1;
        end
        
    end
    
    if(edgeCount(segment,1) > 40)

%     figure, imshow(imgRGB);
       tyol = zeros(size(imgB));
       tyol(labels == segment) = 255;
       yol = yol + tyol;
 
    end  

end
imwrite(yol, '0_edgeTest.tif');
resultEdges = yol;