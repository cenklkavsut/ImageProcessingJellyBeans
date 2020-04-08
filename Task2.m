clear all;
close all;
clc;

load RGBStretched;

R=RGBStretched(:,:,1); % Red channel
G=RGBStretched(:,:,2);% Green channel
B=RGBStretched(:,:,3);% Blue channel

%Threshhold the image
RB= B<20 & G<20 & R>100;%Red channel
GB= B<70 & G>30 & R<70;%Green channel
OB = B<40 & G<110 & R>150;%Orange channel
YB = B<80 & G>130 & G<=230  & R>100;%Yellow channel
WB = B>130 & G>200 & R>130;%White channel

save RB RB;
save GB GB;
save OB OB;
save YB YB;
save WB WB;

figure;% Channels

subplot(2,3,1)% Channels Red
imagesc(RB)
title('Binary Mask Image Red');
colormap gray;
axis image;
axis off;

subplot(2,3,2)% Channels Green
imagesc(GB)
title('Binary Mask Image Green');
colormap gray;
axis image;
axis off;

subplot(2,3,3)% Channels Orange
imagesc(OB);
title('Binary Mask Image Orange');
colormap gray;
axis image;
axis off;

subplot(2,3,4)% Channels Yellow
imagesc(YB);
title('Binary Mask Image Yellow');
colormap gray;
axis image;
axis off;

subplot(2,3,5)% Channels White
imagesc(WB);
title('Binary Mask Image White');
colormap gray;
axis image;
axis off;