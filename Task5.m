clear all;
close all;
clc;

load RGBStretched;%Histogram stretch operation

%Entry-wise multiplication of each binary image and the union of it
load maskedRgbImage;

load ClosedRB;
load ClosedGB;
load ClosedYB;
load ClosedOB;
load ClosedWB;
load UnionBest;
load UB;

%report pixels before
RGBPixels=nnz(RGBStretched);

UnionPixels=nnz(UB);

maskedRgbImagePixels=nnz(maskedRgbImage);

%Entry-wise multiplication of each binary image and the union of it
maskedRgbImageU = bsxfun(@times, RGBStretched, cast(UnionBest,'like',RGBStretched));
save maskedRgbImageU maskedRgbImageU;
%report pixels After
UnionPixelsC=nnz(UnionBest);

EntryWiseU=nnz(maskedRgbImageU);

ClosedRBCalculation=nnz(ClosedRB);
ClosedGBCalculation=nnz(ClosedGB);
ClosedYBCalculation=nnz(ClosedYB);
ClosedOBCalculation=nnz(ClosedOB);
ClosedWBCalculation=nnz(ClosedWB);
save ClosedRBCalculation ClosedRBCalculation;
save ClosedGBCalculation ClosedGBCalculation;
save ClosedYBCalculation ClosedYBCalculation;
save ClosedOBCalculation ClosedOBCalculation;
save ClosedWBCalculation ClosedWBCalculation;

figure;%morphological Open

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
title('morphological Closed Orange');
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

figure;%Fills the holes of the union

subplot(1,2,1)
I=(RGBStretched.*uint8(UnionBest));
imagesc(I);
title('Union image Best fuction');
colormap gray;
axis image;
axis off;

subplot(1,2,2)% Channels Red
imagesc(maskedRgbImageU);
title('Union image Best fuction Entry-wise multiplication');
colormap gray;
axis image;
axis off;

fprintf('Value of pixels RGB Before: %.2f\n',RGBPixels);

fprintf('Value of pixels Union Before : %.2f\n',UnionPixels);

fprintf('Value of pixels Entry-wise multiplication Before: %.2f\n',maskedRgbImagePixels);

fprintf('Value of pixels Union After: %.2f\n',UnionPixelsC);

fprintf('Value of pixels Entry-wise multiplication After: %.2f\n',EntryWiseU);

fprintf('Value of pixels red open After: %.2f\n',ClosedRBCalculation);

fprintf('Value of pixels green open After: %.2f\n',ClosedGBCalculation);

fprintf('Value of pixels yellow open After: %.2f\n',ClosedYBCalculation);

fprintf('Value of pixels Orange open After: %.2f\n',ClosedOBCalculation);

fprintf('Value of pixels white open After: %.2f\n',ClosedWBCalculation);
