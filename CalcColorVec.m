%>@ HAVELSAN A.Þ. (ODTU distribution.)
%>@ HASAT SIMULATOR
%>@ File name: CalcColorVec.m version 1.0/November 2010
%>@ Author: Cem Baykal
function CalcColorVec;
global imgRGB;
global imgR;
global imgG;
global imgB;
global imgI;
global labels;
global colorvec;

maxlabels=max(max(labels()))+1;
colorvec=double(zeros(maxlabels,3));
colorcount=zeros(maxlabels,1);
sz=size(labels);
for x = 1:sz(1);
    for y=1:sz(2);
        i=labels(x,y)+1;
        colorvec(i,1) =  colorvec(i,1)+double(imgR(x,y));
        colorvec(i,2) =  colorvec(i,2)+double(imgG(x,y));
        colorvec(i,3) =  colorvec(i,3)+double(imgB(x,y));
%         colorvec(i,4) =  colorvec(i,4)+double(imgI(x,y));
        colorcount(i)=colorcount(i)+1;
    end
end
colorvec(:,1)=colorvec(:,1)./colorcount;
colorvec(:,2)=colorvec(:,2)./colorcount;
colorvec(:,3)=colorvec(:,3)./colorcount;
% colorvec(:,4)=colorvec(:,4)./colorcount;
clear colorcount;
colorvec(1,:)=max(colorvec);
colorvec=uint16(colorvec);
save colorvec colorvec
