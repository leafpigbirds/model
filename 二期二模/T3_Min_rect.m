out2=imread('C:\Users\leafpigbirds\Desktop\不规则图形.bmp');
% t1=clock;
out2=filter2(fspecial('average',2),out2)/255;%DATA1
for i=1:420
    for j=1:560
        if out2(i,j)~=0
            out2(i,j)=1;
        end
    end
end
[r c]=find(out2==1);
[rectx,recty,area,perimeter]=minboundrect(c,r,'a');
figure(1);
imshow(out2);
line(rectx(:),recty(:),'color','r');
hold on;
% plot(rectx(1,1),recty(1,1),'r+',rectx(2,1),recty(2,1),'g+');
[wid hei]=minboxing(rectx(1:end-1),recty(1:end-1));
%Slope斜率判断方位
point=[];%1为x,2为y
for i=1:4
    point(i,1)=rectx(i,1);
    point(i,2)=recty(i,1);
end
plot(point(1,1),point(1,2),'g+',point(2,1),point(2,2),'b+',point(3,1),point(3,2),'y+',point(4,1),point(4,2),'r+');
%1-2
dis(1,1)=sqrt((point(1,1)-point(2,1))^2+(point(1,2)-point(2,2))^2);
%2-3
dis(2,1)=sqrt((point(2,1)-point(3,1))^2+(point(2,2)-point(3,2))^2);
%3-4
dis(3,1)=sqrt((point(3,1)-point(4,1))^2+(point(3,2)-point(4,2))^2);
%4-1
dis(4,1)=sqrt((point(4,1)-point(1,1))^2+(point(4,2)-point(1,2))^2);

%位置点计算
MID_X=floor(((point(1,1)+point(3,1))/2+(point(2,1)+point(4,1))/2)/2);
MID_Y=floor(((point(1,2)+point(3,2))/2+(point(2,2)+point(4,2))/2)/2);
plot(MID_X,MID_Y,'r.');
%斜率计算
cnt1=0;
cnt2=0;
cnt3=0;
cnt4=0;
cur=0;%当前位置
k12=(point(1,2)-point(2,2))/(point(1,1)-point(2,1));
k23=(point(2,2)-point(3,2))/(point(2,1)-point(3,1));
b12=-k12*rectx(1,1)+recty(1,1);
b23=-k23*rectx(2,1)+recty(2,1);
b34=-k12*rectx(3,1)+recty(3,1);
b41=-k23*rectx(4,1)+recty(4,1);

%切点个数计算
for i=floor(min(rectx(1,1),rectx(2,1))):floor(max(rectx(1,1),rectx(2,1)))
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
for i=floor(min(rectx(2,1),rectx(3,1))):floor(max(rectx(2,1),rectx(3,1)))
    cur=k23*i+b23;
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

for i=floor(min(rectx(3,1),rectx(4,1))):floor(max(rectx(3,1),rectx(4,1)))
    cur=k12*i+b34;
%     hold on;
%     plot(i,floor(cur),'b.',i,floor(cur+2),'b.');
    if out2(floor(cur),i)==1
        cnt3=cnt3+1;
    end
    if out2(floor(cur+2),i)==1
        cnt3=cnt3+1;
    end
    if out2(floor(cur-2),i)==1
        cnt3=cnt3+1;
    end
end

for i=floor(min(rectx(4,1),rectx(1,1))):floor(max(rectx(4,1),rectx(1,1)))
    cur=k23*i+b41;
%     hold on;
%     plot(i,floor(cur),'b.',i,floor(cur+2),'b.');
    if out2(floor(cur),i)==1
        cnt4=cnt4+1;
    end
    if out2(floor(cur+2),i)==1
        cnt4=cnt4+1;
    end
    if out2(floor(cur-2),i)==1
        cnt4=cnt4+1;
    end
end

%四个中心点绘制
mid_x=floor((rectx(1,1)+rectx(2,1))/2);
mid_y=floor((recty(1,1)+recty(2,1))/2);
% hold on;
% plot(mid_x,mid_y,'b*');
mid_x=floor((rectx(2,1)+rectx(3,1))/2);
mid_y=floor((recty(2,1)+recty(3,1))/2);
% hold on;
% plot(mid_x,mid_y,'b*');
mid_x=floor((rectx(3,1)+rectx(4,1))/2);
mid_y=floor((recty(3,1)+recty(4,1))/2);
% hold on;
% plot(mid_x,mid_y,'b*');
mid_x=floor((rectx(4,1)+rectx(1,1))/2);
mid_y=floor((recty(4,1)+recty(1,1))/2);
% hold on;
% plot(mid_x,mid_y,'b*');


Long=-point(4,2)+mid_y;
Short=point(4,1)-mid_x;
Ans_x=mid_x+Long;
Ans_y=mid_y+Short;
% hold on;
% plot(Ans_x,Ans_y,'b+');

% t2=clock;
% etime(t2,t1)
% [x,y]=solve( '(x-mid_x)^2+(y-mid_y)^2=(dis(1,1)/2)^2','(y-point(2,2))^2+(x-point(2,1))^2=(dis(1,1)/2)^2+(dis(2,1)-dis(1,1)/2)^2' );
% [x,y]=solve( '(x-157)^2+(y-102)^2=104^2','(x-261)^2+(y-282)^2=104^2+91^2' );

% k_xy=k23;%过中点垂线斜率
% b_xy=-k_xy*mid_x+mid_y;%过中点垂线常数
% R=dis(1,1)/2;%半径
% cur_x=mid_x;
% % cur_y=k_xy*cur_x+b_xy;
% % L=sqrt( (cur_y-mid_y)^2+(cur_x-mid_x)^2 )
% while cur_x<560
%     cur_y=k_xy*cur_x+b_xy;
%     L=sqrt((cur_y-mid_y)^2+(cur_x-mid_y)^2)
%     cur_x=cur_x+1;
% end

% %斜率计算
% k12=(point(1,2)-point(2,2))/(point(1,1)-point(2,1));
% k34=(point(3,2)-point(4,2))/(point(3,1)-point(4,1));
% b1=-k12*rectx(1)+recty(1);
% b2=-k12*rectx(2)+recty(2);
% b3=-k34*rectx(3)+recty(3);
% b4=-k34*rectx(4)+recty(4);
% k12=-k12;
% k34=-k34;
% b1=-b1;
% b2=-b2;
% b3=-b3;
% b4=-b4;
% %判断缺口
% cnt1=0;
% cnt2=0;
% cur=0;%当前位置
% 
% for i=floor(rectx(1)):ceil(rectx(2))
%     cur=floor(k12*i-b1);
%     if out2(cur,i)==1
%         cnt1=cnt1+1;
%     end
% end
% for i=floor(rectx(3)):ceil(rectx(4))
%     cur=floor(k34*i-b3);
%     if out2(cur,i)==1
%         cnt2=cnt2+1;
%     end
% end
