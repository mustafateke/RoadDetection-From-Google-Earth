% imgRegionCount = max(labels(:));
numBands=3;
imgMeans=zeros(imgRegionCount, numBands);
imgVars=zeros(imgRegionCount, numBands);
imgStds=zeros(imgRegionCount, numBands);
imgColorVar = zeros(imgRegionCount);
yolColorStd = zeros(size(BW));
yolStds = zeros(size(BW));
% imgSkews=zeros(imgRegionCount, numBands);
% imgFirstMoment=zeros(imgRegionCount, numBands);
% imgSecondMoment=zeros(imgRegionCount, numBands);
% imgThirdMoment =zeros(imgRegionCount, numBands);
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
        pixelcolor(row,1)=imgR(y,x);
        pixelcolor(row,2)=imgG(y,x);
        pixelcolor(row,3)=imgB(y,x);
%         pixelcolor(row,4)=imgI(x,y);
        
    end
    val=mean(double(pixelcolor));
    imgMeans(segment,:)=val;
    meanColor = mean(val);
    imgColorVar(segment,1) = var(val);
    
    val2=std(double(pixelcolor));
    imgStds(segment,:)=val2;  
    imgVars(segment,:)=sqrt(val2);
    
    if(imgColorVar(segment,1) < 40)
            close all;
%     figure, imshow(imgRGB);
       tyol = zeros(size(imgB));
       tyol(labels == segment) = 255;
       yolColorStd = yolColorStd + tyol;
 
    end  
    
    if(mean(imgStds(segment,:)) < 30)

%     figure, imshow(imgRGB);
       tyol = zeros(size(imgB));
       tyol(labels == segment) = 255;
       yolStds = yolStds + tyol;
 
    end     
    
%     val3=mean(double(pixelcolor));
%     imgSkews(segment,:)=val3;        
    
    %imgFirstMoment(segment,:)=moment(pixelcolor,1);
%     imgSecondMoment(segment,:)=moment(pixelcolor,2);
%     imgThirdMoment(segment,:)=moment(pixelcolor,3);
end

imwrite(yolColorStd, '5_VarTest.tif');
imwrite(yolStds, '5_VarTestColor.tif');
resultMoments = yolColorStd;