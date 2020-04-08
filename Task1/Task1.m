clear all;
close all;
clc;

RGB= imread('jellybeanImage.bmp');%read jellybean image

M=size(RGB,1);%size rows
N=size(RGB,2);%size column

R=RGB(:,:,1); % Red channel
G=RGB(:,:,2);% Green channel
B=RGB(:,:,3);% Blue channel

H_normR= imhist(R);
H_normG= imhist(G);
H_normB= imhist(B);

%RMS contrast before stretch calculation
RGBD=double(RGB);
CRMSBefore=sqrt(1/M*N.*(sum(RGBD(length(1:M),length(1:N)).^2)));

%Histogram stretch operation
RGBMin=min(min(min(RGB)));%minumum values for stretch
RGBMax=max(max(max(RGB)));%minumum values for stretch
RGBStretched=round((RGB-RGBMin)*(255/(RGBMax-RGBMin)));

save RGBStretched RGBStretched;

%perform histogram stretch on red , green , blue
RStretched=RGBStretched(:,:,1); % Red channel
GStretched=RGBStretched(:,:,2);% Green channel
BStretched=RGBStretched(:,:,3);% Blue channel

H_normRStretched= imhist(RStretched);
H_normGStretched= imhist(GStretched);
H_normBStretched= imhist(BStretched);

%RMS contrast  calculation stretched
RGBStretchedD=double(RGBStretched);

CRMSAfter=sqrt(1/M*N.*(sum(RGBStretchedD(length(1:M),length(1:N)).^2)));

figure;% normaliesed histogram
subplot(2,3,1);
bar([0:255], H_normR, 'Red');
xlabel('Luminance','FontSize' ,14);
ylabel('Normalised Count','FontSize' ,14);
xlim([0 255]);ylim([0 max(H_normR)]);
title('Normalised RGB histogram Red');
axis square;

subplot(2,3,2);
bar([0:255] , H_normG,'Green');
xlabel('Luminance','FontSize' ,14);
ylabel('Normalised Count','FontSize' ,14);
xlim([0 255]);ylim([0 max(H_normG)]);
title('Normalised RGB histogram Green');
axis square;

subplot(2,3,3);
bar([0:255] , H_normB,'Blue');
xlabel('Luminance ','FontSize' ,14);
ylabel('Normalised Count','FontSize' ,14);
xlim([0 255]);ylim([0 max(H_normB)]);
title('Normalised RGB histogram Blue');
axis square;

subplot(2,3,4);
bar([0:255], H_normRStretched, 'Red');
xlabel('Luminance ','FontSize' ,14);
ylabel('Normalised Count','FontSize' ,14);
xlim([0 255]);ylim([0 max(H_normRStretched)]);
title('Normalised RGB histogram Stretched Red');
axis square;

subplot(2,3,5);
bar([0:255] , H_normGStretched,'Green');
xlabel('Luminance','FontSize' ,14);
ylabel('Normalised Count','FontSize' ,14);
xlim([0 255]);ylim([0 max(H_normGStretched)]);
title('Normalised RGB histogram Stretched Green');
axis square;

subplot(2,3,6);
bar([0:255] , H_normBStretched,'Blue');
xlabel('Luminance','FontSize' ,14);
ylabel('Normalised Count','FontSize' ,14);
xlim([0 255]);ylim([0 max(H_normBStretched)]);
title('Normalised RGB histogram Stretched Blue');
axis square;

figure;
subplot(1,2,1);% original image
imagesc(RGB);
title('The image before stretch');
axis image;
axis off;

subplot(1,2,2);% the stretched image
imagesc(RGBStretched);
title('The image after stretch');
axis image;
axis off;

fprintf('RMS Contrast Before value is: %.2f\n',CRMSBefore);

fprintf('RMS Contrast After value is: %.2f\n',CRMSAfter);