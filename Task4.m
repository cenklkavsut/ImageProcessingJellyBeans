clear all;
close all;
clc;

load RGBStretched;%Histogram stretch operation

load M;%size rows
load N;%size column

load RB;%Red channel
load GB;%Green channel
load OB;%Orange channel
load YB;%Yellow channel
load WB;%White channel
load UB;%union of beans

%Entry-wise multiplication of each binary image and the union of it
load maskedRgbImage;

% morphological open 
SE = strel('disk',1);

%Close
CRB = imclose(RB , SE);
CGB= imclose(GB , SE);
CYB= imclose(YB , SE);
COB = imclose(OB , SE);
CWB = imclose(xor(WB,bwareafilt(WB, 1)) , SE);

%Dilate
DIRB = imdilate(CRB , SE);
DIGB= imdilate(CGB , SE);
DIYB= imdilate(CYB , SE);
DIOB = imdilate(COB , SE);
DIWB = imdilate(CWB , SE);

%Open
ORB = imopen(DIRB , SE);
OGB= imopen(DIGB , SE);
OYB= imopen(DIYB , SE);
OOB = imopen(DIOB , SE);
OWB = imopen(DIWB , SE);

%Close
ClosedRB = imclose(ORB , SE);
ClosedGB= imclose(OGB , SE);
ClosedYB= imclose(OYB , SE);
ClosedOB = imclose(OOB , SE);
ClosedWB = imclose(OWB , SE);

save ClosedRB ClosedRB;
save ClosedGB ClosedGB;
save ClosedYB ClosedYB;
save ClosedOB ClosedOB;
save ClosedWB ClosedWB;

UnionB = ClosedRB|ClosedGB|ClosedWB|ClosedOB|ClosedYB;

%allows filing the holes in the image
UF=imfill(UnionB,'holes');

UnionBest=UF|(UnionB> 0.10);

figure;%morphological Close

subplot(2,3,1)% Channels Red
imagesc(ClosedRB)
title('morphological Closed Red');
colormap gray;
axis image;
axis off;

subplot(2,3,2)% Channels Green
imagesc(ClosedGB)
title('morphological Closed Green');
colormap gray;
axis image;
axis off;

subplot(2,3,3)% Channels Orange
imagesc(ClosedOB);
title('morphological Open Orange');
colormap gray;
axis image;
axis off;

subplot(2,3,4)% Channels Yellow
imagesc(ClosedYB);
title('morphological Closed Yellow');
colormap gray;
axis image;
axis off;

subplot(2,3,5)% Channels White
imagesc(ClosedWB);
title('morphological Closed White');
colormap gray;
axis image;
axis off;

subplot(2,3,6)%Fills the holes of the union
I=(RGBStretched.*uint8(UnionBest));
imagesc(I);
title('morphological Closed Union');
colormap gray;
save UnionBest UnionBest;
axis image;
axis off;
