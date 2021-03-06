function pr_MeanShiftSeg

global imgRGB; % color image for displayżng 8 bit for each channel.
global imgR;
global imgG;
global imgB;
global labels;

global msg;    % Contents of this string is displayed when EkranGuncelle
               % is called.
global filename;

global hEdit1; % hS ; spatial bandwidth
global hEdit2; % hR ; range bandwidth
global hEdit3; % M ; min. region

sigmaS = 5.0;
sigmaR = 7.0;
minRegion = 20;

fid = fopen('parameters.dat', 'wt');
fprintf(fid, '%12.8f\n%12.8f\n%12.8f\n', sigmaS, sigmaR, minRegion);
fclose(fid);

tempImg = zeros(size(imgRGB));
tempImg(:,:,1) = imgR;
tempImg(:,:,2) = imgG;
tempImg(:,:,3) = imgB;
tempImg = convertTo3Bands(tempImg);
imwrite(tempImg, 'temp.tif', 'compression', 'none');
clear tempImg;
!mean_shift_segmentation.exe temp.tif parameters.dat labels.mat

delete('temp.tif');
delete('parameters.dat');

load('labels.mat', '-ascii');
labels=uint16(labels);

tmp=sprintf('\nMAT-file saved to labels.mat in ASCII format');
msg=strcat(filename,tmp);
CalcColorVec;
ColorizeSegments;

return;
