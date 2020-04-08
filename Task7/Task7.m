clear all;
close all;
clc;

load RGBStretched;%Histogram stretch operation

load ClosedRB;
load ClosedGB;
load ClosedYB;
load ClosedOB;
load ClosedWB;

%area of each bean seperate
load  RArea;
load  GArea;
load YArea1;
load YArea2;
load OArea1;
load OArea2;
load OArea3;
load WArea1;
load WArea2;

load UB;%Union of beans
load UnionBest;%Best image union

%Euclidean Distance to calculate distance between orange beans to the beans
center = size(UnionBest) / 2;

centerR = size(RArea);
CRB=bwarea(center);

centerG = size(GArea) ;
CGB=bwarea(centerG);

centerY1 = size(YArea1);
CYB1=bwarea(centerY1);

centerY2 = size(YArea2);
CYB2=bwarea(center);

centerO1 = size(OArea1);
COB1=bwarea(centerO1);

centerO2 = size(OArea2);
COB2=bwarea(centerO2);

centerO3 = size(OArea3);
COB3=bwarea(centerO3);

centerW1 = size(WArea1);
CWB1=bwarea(centerW1);

centerW2 = size(WArea2);
CWB2=bwarea(centerW2);

EDChipR=norm(CRB - center, 2);
EDChipG=norm(CGB - center, 2);
EDChipY1=norm(CYB1 - center, 2);
EDChipY2=norm(CYB2 - center, 2);
EDChipO1=norm(COB1 - center, 2);
EDChipO2=norm(COB2 - center, 2);
EDChipO3=norm(COB3 - center, 2);
EDChipW1=norm(CWB1 - center, 2);
EDChipW2=norm(CWB2 - center, 2);

%city block distance of the centre of each bean based on the formula
[maxNum, maxIndex] = max(center(:));
[r, c] = ind2sub(size(center), maxIndex);
[maxNumR, maxIndexR] = max(CRB(:));
[rR, cR] = ind2sub(size(CRB), maxIndexR);
[maxNumG, maxIndexG] = max(CGB(:));
[rG, cG] = ind2sub(size(CGB), maxIndexG);
[maxNumY1, maxIndexY1] = max(CYB1(:));
[rY1, cY1] = ind2sub(size(CYB1), maxIndexY1);
[maxNumY2, maxIndexY2] = max(CYB2(:));
[rY2, cY2] = ind2sub(size(CYB2), maxIndexY2);
[maxNumO1, maxIndexO1] = max(COB1(:));
[rO1, cO1] = ind2sub(size(COB1), maxIndexO1);
[maxNumO2, maxIndexO2] = max(COB2(:));
[rO2, cO2 ]= ind2sub(size(COB2), maxIndexO2);
[maxNumO3, maxIndexO3] = max(COB3(:));
[rO3, cO3] = ind2sub(size(COB3), maxIndexO3);
[maxNumW1, maxIndexW1] = max(CWB1(:));
[rW1, cW1] = ind2sub(size(CWB1), maxIndexW1);
[maxNumW2, maxIndexW2] = max(CWB2(:));
[rW2, cW2] = ind2sub(size(CWB2), maxIndexW2);

CBDR=abs(r - rR) + abs(c -cR);
CBDG=abs(r - rG) + abs(c -cG);
CBDY1=abs(r - rY1) + abs(c -cY1);
CBDY2=abs(r - rY2) + abs(c -cY2);
CBDO1=abs(r - rO1) + abs(c -cO1);
CBDO2=abs(r - rO2) + abs(c -cO2);
CBDO3=abs(r - rO3) + abs(c -cO3);
CBDW1=abs(r - rW1) + abs(c -cW1);
CBDW2=abs(r - rW2) + abs(c -cW2);

fprintf('Estimated Euclidean Distance of the Red beans: %.2f\n',EDChipR);

fprintf('Estimated Euclidean Distance of the Green beans: %.2f\n',EDChipG);

fprintf('Estimated Euclidean Distance of the Yellow bean 1: %.2f\n',EDChipY1);

fprintf('Estimated Euclidean Distance of the Yellow bean 2: %.2f\n',EDChipY2);

fprintf('Estimated Euclidean Distance of the Orange bean 1: %.2f\n',EDChipO1);

fprintf('Estimated Euclidean Distance of the Orange bean 2: %.2f\n',EDChipO2);

fprintf('Estimated Euclidean Distance of the Orange bean 3: %.2f\n',EDChipO3);

fprintf('Estimated Euclidean Distance of the white bean 1: %.2f\n',EDChipW1);

fprintf('Estimated Euclidean Distance of the white bean 1: %.2f\n',EDChipW2);

fprintf('Estimated city block distance of the Red beans: %.2f\n',...
    size(CBDR));

fprintf('Estimated city block distance of the Green beans: %.2f\n',...
    size(CBDG));

fprintf('Estimated city block distance of the Yellow bean 1: %.2f\n',...
    size(CBDY1));

fprintf('Estimated city block distance of the Yellow bean 2: %.2f\n',...
    size(CBDY2));

fprintf('Estimated city block distance of the Orange bean 1: %.2f\n',...
    size(CBDO1));

fprintf('Estimated city block distance of the Orange bean 2: %.2f\n',...
    size(CBDO2));

fprintf('Estimated city block distance of the Orange bean 3: %.2f\n',...
    size(CBDO3));

fprintf('Estimated city block distance of the white bean 1: %.2f\n',...
    size(CBDW1));

fprintf('Estimated city block distance of the white bean 2: %.2f\n',...
    size(CBDW2));