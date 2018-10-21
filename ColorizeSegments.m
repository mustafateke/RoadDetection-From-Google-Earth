%>@ HAVELSAN A.Þ. (ODTU distribution.)
%>@ HASAT SIMULATOR
%>@ File name: ColorizeSegments.m version 1.0/November 2010
%>@ Author: Cem Baykal
function ColorizeSegments;
%paints segments using RGB values in color vector.
global imgRGB;
global labels;
global colorvec;

sz=size(labels);
maxRGB=double(max(colorvec));
minRGB=double(min(colorvec));
maxRGB(1)=255.0/(maxRGB(1)-minRGB(1));
maxRGB(2)=255.0/(maxRGB(2)-minRGB(2));
maxRGB(3)=255.0/(maxRGB(3)-minRGB(3));
for x = 1:sz(1);
    for y=1:sz(2);
        i=labels(x,y)+1;
        imgRGB(x,y,1)=(colorvec(i,1)-minRGB(1))*maxRGB(1);
        imgRGB(x,y,2)=(colorvec(i,2)-minRGB(2))*maxRGB(2);
        imgRGB(x,y,3)=(colorvec(i,3)-minRGB(3))*maxRGB(3);        
    end
end