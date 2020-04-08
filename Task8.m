clear all;
close all;
clc;

load RGBStretched;%Histogram stretch operation

%area of each bean seperate
load  RArea;
load  GArea;
load YArea1;
load YArea2;
load OArea1;
load OArea2;
load OArea3;
load ChipArea;
load WArea1;
load WArea2;
load UnionBest;%Best image union

%Count Red Beans
countR = bwconncomp(size(RArea),4);
objectCountR  = countR.NumObjects;
%Count Green Beans
countG = bwconncomp(size(GArea),4);
objectCountG  = countG.NumObjects;
%Count Yellow Beans
countY1 = bwconncomp(size(YArea1),4);
objectCountY1  = countY1.NumObjects;
countY2 = bwconncomp(size(YArea2),4);
objectCountY2  = countY2.NumObjects;
objectCountY=sum(objectCountY1+objectCountY2);
%Count Orange Beans
countO1 = bwconncomp(size(OArea1),4);
objectCountO1  = countO1.NumObjects;
countO2 = bwconncomp(size(OArea2),4);
objectCountO2  = countO2.NumObjects;
countO3 = bwconncomp(size(OArea3),4);
objectCountO3  = countO3.NumObjects;
objectCountO=sum(objectCountO1+objectCountO2+objectCountO3);
%Count White Beans
countW1 = bwconncomp(size(WArea1),4);
objectCountW1  = countW1.NumObjects;
countW2 = bwconncomp(size(WArea2),4);
objectCountW2  = countW2.NumObjects;
objectCountW=sum(objectCountW1+objectCountW2);
%total Bean count
totalBeans=sum(objectCountR+objectCountG+objectCountY+objectCountO+objectCountW);
if totalBeans==9
    disp('Correct Amount of Beans!');
else
    disp('Error not enough Beans Please scrap the Batch!');
end
figure;
I=(RGBStretched.*uint8(UnionBest));
imagesc(I);
title(['Total number of Beans : ' num2str(totalBeans)]);
colormap gray;
axis image;
axis off;

fprintf('Total Red Beans: %.2f\n',objectCountR);

fprintf('Total Green Beans: %.2f\n',objectCountG);

fprintf('Total Yellow Beans: %.2f\n',objectCountY);

fprintf('Total Orange Beans: %.2f\n',objectCountO);

fprintf('Total White Beans: %.2f\n',objectCountW);

fprintf('Total Beans: %.2f\n',totalBeans);