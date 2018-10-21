%>@ HAVELSAN A.Þ. (ODTU distribution.)
%>@ HASAT SIMULATOR
%>@ File name: convertTo3Bands.m version 1.0/November 2010
%>@ Author: Bari$ Yuksel
function threeBands = convertTo3Bands(I)
%Reduce 16 bit image to 8 bit.
%

%input arguments:
%   I : 4-band image(16 bit x 4)  
%
%output arguments:
%   threeBands : 3-band image(8 bit x 3)  
I = double(I);

dim1 = size(I, 1);
dim2 = size(I, 2);

rImage = I(:,:,1);
gImage = I(:,:,2);
bImage = I(:,:,3);

meanRImage = mean(rImage(:));
stdevRImage = std2(rImage);
minRImage = meanRImage - 2 * stdevRImage;
maxRImage = meanRImage + 2 * stdevRImage;

RstretchedImage = (rImage - minRImage) / maxRImage;
RstretchedImage(RstretchedImage > 1) = 1;
RstretchedImage(RstretchedImage < 0) = 0;

meanGImage = mean(gImage(:));
stdevGImage = std2(gImage);
minGImage = meanGImage - 2 * stdevGImage;
maxGImage = meanGImage + 2 * stdevGImage;

GstretchedImage = (gImage - minGImage) / maxGImage;
GstretchedImage(GstretchedImage > 1) = 1;
GstretchedImage(GstretchedImage < 0) = 0;

meanBImage = mean(bImage(:));
stdevBImage = std2(bImage);
minBImage = meanBImage - 2 * stdevBImage;
maxBImage = meanBImage + 2 * stdevBImage;

BstretchedImage = (bImage - minBImage) / maxBImage;
BstretchedImage(BstretchedImage > 1) = 1;
BstretchedImage(BstretchedImage < 0) = 0;

threeBands = zeros(dim1, dim2, 3);
threeBands(:,:,1) = RstretchedImage;
threeBands(:,:,2) = GstretchedImage;
threeBands(:,:,3) = BstretchedImage;

threeBands = uint8(threeBands * 255);
