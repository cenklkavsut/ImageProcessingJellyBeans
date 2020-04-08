clear all;
close all;
clc;

%Closed Bean images
load ClosedRB;%Red Bean
load ClosedGB;%Green Bean
load ClosedYB;%Yellow Beans
load ClosedOB;%Orange Beans
load ClosedWB;%White Beans
load UnionBest;%Best image union
load pixelArea;%the area in mm obtained by the chip
%extracts the beans and obtain the bounding box and area of each bean
llR = labelmatrix(bwconncomp(ClosedRB));%label matrix for Red bean
llG = labelmatrix(bwconncomp(ClosedGB));%label matrix for green bean
llY = labelmatrix(bwconncomp(ClosedYB));%label matrix for Yellow beans
llO = labelmatrix(bwconncomp(ClosedOB));%find each bean Orange
llW = labelmatrix(bwconncomp(ClosedWB));%find each bean White

%Rotated sub images towards the longest dimension (Vertical)
RBBox=imrotate(llR==1, 160,'bilinear','crop');
GBBox=imrotate(llG==6, 15,'bilinear','crop');
OBBox1=imrotate(llO==6, 170,'bilinear','crop');
OBBox2=imrotate(llO==19, 83,'bilinear','crop');
OBBox3=imrotate(llO==20, 9,'bilinear','crop');
YBBox1=imrotate(llY==2, 150,'bilinear','crop');
YBBox2=imrotate(llY==9, 5,'bilinear','crop');
WBBox1=imrotate(llW==189, 135,'bilinear','crop');
WBBox2=imrotate(llW==311, 323,'bilinear','crop');
%obtain bounding box for each bean
RBB = regionprops(RBBox, 'Area','BoundingBox');
GBB = regionprops(GBBox,'Area','BoundingBox');
OBB1 = regionprops(OBBox1, 'Area','BoundingBox');
OBB2 = regionprops(OBBox2, 'Area','BoundingBox');
OBB3 = regionprops(OBBox3, 'Area','BoundingBox');
YBB1 = regionprops(YBBox1, 'Area','BoundingBox');
YBB2 = regionprops(YBBox2, 'Area','BoundingBox');
WBB1 = regionprops(WBBox1, 'Area','BoundingBox');
WBB2 = regionprops(WBBox2, 'Area','BoundingBox');

% Calculate the length, in mm
lengthRB=pixelArea.*size(RBBox);
lengthGB=pixelArea*size(GBBox);
lengthYB1=pixelArea*size(YBBox1);
lengthYB2=pixelArea*size(YBBox2);
lengthOB1=pixelArea*size(OBBox1);
lengthOB2=pixelArea*size(OBBox2);
lengthOB3=pixelArea*size(OBBox3);
lengthWB1=pixelArea*size(WBBox1);
lengthWB2=pixelArea*size(WBBox2);

figure;%Extracted Images BoundingBox

subplot(3,3,1)% Extracted Red
imshow(RBBox)
title('Extracted Bean Red');
hold on
rectangle('position',RBB.BoundingBox,'Edgecolor','g','LineWidth',1 );
hold off
colormap gray;
axis square;
axis off;

subplot(3,3,2)% Extracted Green
imshow(GBBox)
title('Extracted Bean Green');
hold on
rectangle('position',GBB.BoundingBox,'Edgecolor','g','LineWidth',1 );
hold off
colormap gray;
axis square;
axis off;

subplot(3,3,3)% Extracted Orange
imshow(OBBox1)
title('Extracted Bean Orange 1');
hold on
rectangle('position',OBB1.BoundingBox,'Edgecolor','g','LineWidth',1 );
hold off
colormap gray;
axis square;
axis off;

subplot(3,3,4)% Extracted Orange
imshow(OBBox2)
title('Extracted Bean Orange 2');
hold on
rectangle('position',OBB2.BoundingBox,'Edgecolor','g','LineWidth',1 );
hold off
colormap gray;
axis square;
axis off;

subplot(3,3,5)% Extracted Orange
imshow(OBBox3)
title('Extracted Bean Orange 3');
hold on
rectangle('position',OBB3.BoundingBox,'Edgecolor','g','LineWidth',1 );
hold off
colormap gray;
axis square;
axis off;

subplot(3,3,6)% Extracted Yellow
imshow(YBBox1)
title('Extracted Bean Yellow 1');
hold on
rectangle('position',YBB1.BoundingBox,'Edgecolor','g','LineWidth',1 );
hold off
colormap gray;
axis square;
axis off;

subplot(3,3,7)% Extracted Yellow
imshow(YBBox2)
title('Extracted Bean Yellow 2');
hold on
rectangle('position',YBB2.BoundingBox,'Edgecolor','g','LineWidth',1 );
hold off
colormap gray;
axis square;
axis off;

subplot(3,3,8)% Extracted White
imshow(WBBox1)
title('Extracted Bean White 1');
hold on
rectangle('position',WBB1.BoundingBox,'Edgecolor','g','LineWidth',1 );
hold off
colormap gray;
axis square;
axis off;

subplot(3,3,9)% Extracted White
imshow(WBBox2)
title('Extracted Bean White 2');
hold on
rectangle('position',WBB2.BoundingBox,'Edgecolor','g');
hold off
colormap gray;
axis square;
axis off;

figure;%Mosiac Rotated Image union
unionI=(RBBox|GBBox|YBBox1|YBBox2|OBBox1|OBBox2|OBBox3|WBBox1|WBBox2);
imshow(unionI);
title('Rotated Beans Union Image Mosiac Image!');
hold on
imageValues = regionprops(logical(unionI),'BoundingBox');
for i = 1 : length(imageValues)
    BBImage = imageValues(i).BoundingBox;
    rectangle('Position',[BBImage(1),BBImage(2),BBImage(3),BBImage(4)]...
        ,'EdgeColor','b','LineWidth',1);
end
hold off;
colormap gray;
axis square;
axis off;

figure;%Mosiac Rotated Image side by side
unionX=imtile({RBBox,GBBox,YBBox1,YBBox2,OBBox1,OBBox2,OBBox3,WBBox1,WBBox2});
imshow(unionX);
title('Rotated Beans side by side Image Mosiac Image!');
hold on
imageValues = regionprops(logical(unionX), 'BoundingBox');
for i = 1 : length(imageValues)
    BBImage = imageValues(i).BoundingBox;
    rectangle('Position',[BBImage(1),BBImage(2),BBImage(3),BBImage(4)]...
        ,'EdgeColor','r','LineWidth',1);
end
hold off
colormap gray;
axis square;
axis off;

%Display the result of the calculation
fprintf('Length of Red Bean: %.2f\n',lengthRB);
fprintf('Length of Green Bean: %.2f\n',lengthGB);
fprintf('Length of Yellow Bean 1: %.2f\n',lengthYB1);
fprintf('Length of Yellow Bean 2: %.2f\n',lengthYB2);
fprintf('Length of Orange Bean 1: %.2f\n',lengthOB1);
fprintf('Length of Orange Bean 2: %.2f\n',lengthOB2);
fprintf('Length of Orange Bean 3: %.2f\n',lengthOB3);
fprintf('Length of white bean 1: %.2f\n',lengthWB1);
fprintf('Length of white bean 1: %.2f\n',lengthWB2);