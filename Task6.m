clear all;
close all;
clc;

load ClosedRB;%Red Bean
load ClosedGB;%Green Bean
load ClosedYB;%Yellow Beans
load ClosedOB;%Orange Beans
load ClosedWB;%White Beans
load UB;%Union of beans
load UnionBest;%Best image union

chipImage = bwareafilt(UnionBest,1);%this obtains the chip makes the other pixels black
chipOnlyArea=round(bwarea(chipImage));%the calibration chip area of each bean in mm2

%this extracts the area of the image
RArea = regionprops(ClosedRB);
GArea = regionprops(ClosedGB);
%find each bean Yellow
Ycc = bwconncomp(ClosedYB);
ll = labelmatrix(Ycc);
YArea1 = regionprops(ll==2, 'Area');
YArea2 = regionprops(ll==9, 'Area');
%find each bean Orange
Occ = bwconncomp(ClosedOB);
llO = labelmatrix(Occ);
OArea1 = regionprops(llO==6, 'Area');
OArea2 = regionprops(llO==19, 'Area');
OArea3 = regionprops(llO==20, 'Area');
chipArea = regionprops(llO==10, 'Area');
%find each bean White
Wcc = bwconncomp(ClosedWB);
llW = labelmatrix(Wcc);
WArea1 = regionprops(llW==189, 'Area');
WArea2 = regionprops(llW==311, 'Area');

save RArea  RArea;
save GArea  GArea;
save YArea1 YArea1;
save YArea2 YArea2;
save OArea1 OArea1;
save OArea2 OArea2;
save OArea3 OArea3;
save chipArea chipArea;
save WArea1 WArea1;
save WArea2 WArea2;

%Dividing it  allows to find the pixel value in mm
pixelArea = 490.87 / chipOnlyArea ;
save pixelArea pixelArea
%multyply by each region with the pixel erea mm2
CA=(size(chipArea).* (2.^pixelArea));
RA=(size(RArea).* (2.^pixelArea));
GA=(size(GArea) .* (2.^pixelArea));
YA1=(size(YArea1) .* (2.^pixelArea));
YA2=(size(YArea2) .* (2.^pixelArea));
OA1=(size(OArea3) .* (2.^pixelArea));
OA2=(size(OArea2).* (2.^pixelArea));
OA3=(size(OArea3).* (2.^pixelArea));
WA1=(size(WArea1) .* (2.^pixelArea));
WA2=(size(WArea2).* (2.^pixelArea));

% area of each bean in mm2
fprintf('Estimated area through the calibration chip to find Red bean in mm2: %.2f\n',...
    RA);

fprintf('Estimated area through the calibration chip to find Green bean in mm2: %.2f\n',...
    GA);

fprintf('Estimated area through the calibration chip to find Yellow bean 1 in mm2: %.2f\n',...
    YA1);

fprintf('Estimated area through the calibration chip to find Yellow bean 2 in mm2: %.2f\n',...
    YA2);

fprintf('Estimated area through the calibration chip to find Orange bean 1 in mm2: %.2f\n',...
    OA1);

fprintf('Estimated area through the calibration chip to find Orange bean 2 in mm2: %.2f\n',...
    OA2);

fprintf('Estimated area through the calibration chip to find Orange beans 3 in mm2: %.2f\n',...
    OA3);

fprintf('Estimated area through the calibration chip to find white bean 1 in mm2: %.2f\n',...
    WA1);

fprintf('Estimated area through the calibration chip to find white bean 2 in mm2: %.2f\n',...
    WA2);