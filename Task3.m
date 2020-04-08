clear all;
close all;
clc;

load RGBStretched;%Histogram stretch operation

M=size(RGBStretched,1);%size rows
N=size(RGBStretched,2);%size column

save M M;
save N N;

%Threshhold the image
load RB;%Red channel
load GB;%Green channel
load OB;%Orange channel
load YB;%Yellow channel
load WB;%White channel

%The union of Binary images
UB = RB|GB|WB|OB|YB;

save UB UB;

%Entry-wise multiplication of each binary image and the union of it
maskedRgbImage = bsxfun(@times, RGBStretched, cast(UB,'like',RGBStretched));
save maskedRgbImage maskedRgbImage ;

%Masking the RGB image with the regular
for i=1:M
    for j=1:N
        if RB(i,j)==1%for red beans
            BIRB(i,j)=RB(i,j);
        else
           BIRB(i,j)=RGBStretched(i,j);
        end%end if
        
        if GB(i,j)==1%for Green beans
            BIGB(i,j)=GB(i,j);
        else
            BIGB(i,j)=RGBStretched(i,j);
        end%end if
        
        if OB(i,j)==1%for orange beans
            BIO(i,j)=OB(i,j);
        else
            BIO(i,j)=RGBStretched(i,j);
        end%end if
        
        if YB(i,j)==1%for yellow beans
            BIY(i,j)=YB(i,j);
        else
            BIY(i,j)=RGBStretched(i,j);
        end%end if
        
        if WB(i,j)==1%for white beans
            BIW(i,j)=WB(i,j);
        else
           BIW(i,j)=RGBStretched(i,j);
        end%end if
    end%end for
end%end for

figure;% binary images

subplot(2,3,1)% Channels Red
imagesc(RB)
title('Binary Image Red');
colormap gray;
axis image;
axis off;

subplot(2,3,2)% Channels Green
imagesc(GB)
title('Binary Image Green');
colormap gray;
axis image;
axis off;

subplot(2,3,3)% Channels Orange
imagesc(OB);
title('Binary Image Orange');
colormap gray;
axis image;
axis off;

subplot(2,3,4)% Channels Yellow
imagesc(YB);
title('Binary Image Yellow');
colormap gray;
axis image;
axis off;

subplot(2,3,5)% Channels White
imagesc(WB);
title('Binary Image White');
colormap gray;
axis image;
axis off;

figure;

subplot(1,3,1)% Image Regular
imagesc(RGBStretched);
title('RGB Image');
colormap gray;
axis image;
axis off;

subplot(1,3,2)% Union of binary images
imagesc(UB);
title('Union of Binary Images');
colormap gray;
axis image;
axis off;

subplot(1,3,3)%Entry-wise multiplication
imagesc(maskedRgbImage);
title('Entry-wise multiplication Image with the union');
colormap gray;
axis image;
axis off;

figure;

subplot(2,3,1)% binary Red
imagesc(BIRB)
title('binary Image Red bean');
colormap gray;
axis image;
axis off;

subplot(2,3,2)% binary Green
imagesc(BIGB)
title('binary Image Green bean');
colormap gray;
axis image;
axis off;

subplot(2,3,3)% binary Orange
imagesc(BIO);
title('binary Image Orange bean');
colormap gray;
axis image;
axis off;

subplot(2,3,4)% binary Yellow
imagesc(BIY);
title('binary Image Yellow bean');
colormap gray;
axis image;
axis off;

subplot(2,3,5)% binary White
imagesc(BIW);
title('binary Image White bean');
colormap gray;
axis image;
axis off;