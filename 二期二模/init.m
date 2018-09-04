filename='C:\Users\leafpigbirds\Desktop\1803\DATA1.mat';
load(filename);
figure(1);
for i=1:420
    for j=1:560
        if I(i,j)==1
            I(i,j)=0 ;
        else
            I(i,j)=1 ;
        end
    end
end
imshow(I);
filename='C:\Users\leafpigbirds\Desktop\1803\DATA2.mat';
load(filename);
figure(2);
% for i=1:420
%     for j=1:560
%         if D1(i,j)==0
%             D1(i,j)=1 ;
%         else
%             D1(i,j)=0 ;
%         end
%     end
% end
imshow(D1);
filename='C:\Users\leafpigbirds\Desktop\1803\DATA3.mat';
load(filename);
figure(3);
% for i=1:420
%     for j=1:560
%         if D2(i,j)==0
%             D2(i,j)=1 ;
%         else
%             D2(i,j)=0 ;
%         end
%     end
% end
imshow(D2);
%均值化
mean1Sample=filter2(fspecial('average',3),I)/255;%DATA1
figure(4);
mean1Sample=mean1Sample*1000;
imshow(mean1Sample,[0,0.5]);
hold on;
% plot(290,134,'r+',290,203,'r+',222,203,'r+',359,203,'r+');
plot(290,203,'g+',290,202,'r+');

mean2Sample=filter2(fspecial('average',3),D1)/255;%DATA2
figure(5);
mean2Sample=mean2Sample*1000;
imshow(mean2Sample,[0,0.5]);
hold on;
plot(266,80,'r+',299,140,'r+',243,173,'r+',333,200,'r+');

mean3Sample=filter2(fspecial('average',3),D2)/255;%DATA3
figure(6);
mean3Sample=mean3Sample*1000;
imshow(mean3Sample,[0,0.5]);
hold on;
plot(266,80,'r+',299,140,'r+',243,173,'r+',333,200,'r+',141,272,'r+',201,305,'r+',258,338,'r+',166,365,'r+');





%高斯·滤波
% prewittSample = uint8(filter2(fspecial('prewitt'),mean3Sample));
% figure;
% imshow(prewittSample,[0,0.5]);
% sobelSample = uint8(filter2(fspecial('sobel'),mean3Sample));
% figure;
% imshow(sobelSample,[0,1]);
% figure;
% gaussianSample=filter2(fspecial('gaussian'),I)/255;
% gaussianSample=gaussianSample*1000;
% imshow(gaussianSample,[3,4]);