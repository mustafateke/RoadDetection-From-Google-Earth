%skeleton test
yol = zeros(size(BW));
imSkeleton = zeros(size(BW));
% imMainSkeleton = zeros(size(BW));
for segment = 1:imgRegionCount
    
    area = statsR(segment).Area;
    color = colorvec(segment+1, :);
    hsv = 255*rgb2hsv(color);
    if(area > 100)
        tyol = zeros(size(imgB));
        tyol(labels == segment) = 255;
%         yol = yol + tyol;
%         major = statsR(segment).MajorAxisLength;
%         minor = statsR(segment).MinorAxisLength;
        [skg, rad] = skeleton(tyol);
        orgRad=rad;
        rad = sqrt(rad);
%         BWM = (skg > 50);
        wsk = bwmorph( (skg > 50), 'skel', inf);

%         BW3 = bwmorph(BWM,'skel',Inf);
%         BW4 = bwmorph(BW3,'spur',10);  % 10=delete noise branchs Inf=Extract Main branch
%         BW5 = bwmorph(BW3,'spur',Inf); % 10=delete noise branchs Inf=Extract Main branch
%         [dmap, e_xy, j_xy] = anaskel(wsk);
%         figure, imshow(BW4);
%         hold on
%         plot(e_xy(1,:),e_xy(2,:),'go') % green dots
%         plot(j_xy(1,:),j_xy(2,:),'ro') % red dots
%         
%         len = length (j_xy(1,:));
%                
%         for i=1:len % 'len' is count of junction
%             BW4(j_xy(2,i),j_xy(1,i))=0; % [i,j] = 0
%             
%             BW4(j_xy(2,i)-1,j_xy(1,i))=0;
%             BW4(j_xy(2,i)+1,j_xy(1,i))=0;
%             BW4(j_xy(2,i),j_xy(1,i)-1)=0;
%             BW4(j_xy(2,i),j_xy(1,i)+1)=0;
%             
%             BW4(j_xy(2,i)-1,j_xy(1,i)-1)=0;
%             BW4(j_xy(2,i)+1,j_xy(1,i)+1)=0;
%             BW4(j_xy(2,i)-1,j_xy(1,i)+1)=0;
%             BW4(j_xy(2,i)+1,j_xy(1,i)-1)=0;
%         end
%         figure, imshow(BW4);
%         figure, imshow(BW5);
%         branchs = BW4 - BW5;
%         sm = bwmorph(BW5,'dilate',3); 
%         imMainSkeleton = imMainSkeleton + BW5;
        skelRad = rad.*wsk;
        nonZeroVals = nonzeros(skelRad);         
        meanVal = mean(nonZeroVals);
        imSkeleton = imSkeleton + wsk;

        
        if(meanVal > 5 && meanVal < 25)
            tyol = zeros(size(imgB));
            tyol(labels == segment) = 255;
            yol = yol + tyol;
        end

        
    end
end
imwrite(yol, '4_SkeletonTest.tif');
imwrite(imSkeleton, '4_SkeletonTest_skeleton.tif');
resultSkeleton = yol;
% imwrite(imMainSkeleton, '4_SkeletonTest_main_skel.tif');