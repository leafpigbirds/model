clc;
clear;
out2=imread('C:\Users\leafpigbirds\Desktop\不规则图形.bmp');
tic;
% t1=clock;
[r c]=find(out2==1);
[rectx,recty,area,perimeter]=minboundrect(c,r,'a');
figure(1);
imshow(out2);
line(rectx(:),recty(:),'color','r');
hold on;
plot(rectx(1,1),recty(1,1),'r+',rectx(2,1),recty(2,1),'g+');
[wid hei]=minboxing(rectx(1:end-1),recty(1:end-1));
%Slope斜率判断方位
point=[];%1为x,2为y
for i=1:4
    point(i,1)=rectx(i,1);
    point(i,2)=recty(i,1);
end
%1-2
dis(1,1)=sqrt((point(1,1)-point(2,1))^2+(point(1,2)-point(2,2))^2);
%2-3
dis(2,1)=sqrt((point(2,1)-point(3,1))^2+(point(2,2)-point(3,2))^2);
%3-4
dis(3,1)=sqrt((point(3,1)-point(4,1))^2+(point(3,2)-point(4,2))^2);
%4-1
dis(4,1)=sqrt((point(4,1)-point(1,1))^2+(point(4,2)-point(1,2))^2);

%斜率计算
cnt1=0;
cnt2=0;
cur=0;%当前位置
k12=(point(1,2)-point(2,2))/(point(1,1)-point(2,1));
k23=(point(2,2)-point(3,2))/(point(2,1)-point(3,1));
b12=-k12*rectx(1,1)+recty(1,1);
b34=-k12*rectx(3,1)+recty(3,1);
for i=floor(rectx(1,1)):floor(rectx(2,1))
    cur=k12*i+b12;
%     hold on;
%     plot(i,floor(cur),'b.',i,floor(cur+2),'b.');
    if out2(floor(cur),i)==1
        cnt1=cnt1+1;
    end
    if out2(floor(cur+2),i)==1
        cnt1=cnt1+1;
    end
    if out2(floor(cur-2),i)==1
        cnt1=cnt1+1;
    end
end
for i=floor(rectx(3,1)):-1:floor(rectx(4,1))
    cur=k12*i+b34;
%     hold on;
%     plot(i,floor(cur),'b.',i,floor(cur+2),'b.');
    if out2(floor(cur),i)==1
        cnt2=cnt2+1;
    end
    if out2(floor(cur+2),i)==1
        cnt2=cnt2+1;
    end
    if out2(floor(cur-2),i)==1
        cnt2=cnt2+1;
    end
end
mid_x=floor((rectx(3,1)+rectx(4,1))/2);
mid_y=floor((recty(3,1)+recty(4,1))/2);
% hold on;
% plot(mid_x,mid_y,'b*');
Long=-point(4,2)+mid_y;
Short=point(4,1)-mid_x;
Ans_x=mid_x+Long;
Ans_y=mid_y+Short;
toc;
disp(['运行时间: ',num2str(toc)]);
