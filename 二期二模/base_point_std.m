%y,x轴相反
filename='C:\Users\leafpigbirds\Desktop\1803\DATA1.mat';
load(filename);
imshow(I);
hold on;
X=[];%1列为head 2列为tail
for i=1:420
    head=0;
    tail=0;
    for j=1:560
        if I(i,j)==0
            head=j ;
            break ;
        end
    end
    for j=560:-1:1
        if I(i,j)==0
            tail=j ;
            break ;
        end
    end
    X(i,:)=[head,tail];
end
%求head tail距离
for i=1:420
    distance_X(i,1)=X(i,2)-X(i,1);
end
MAX=0;
%定位坐标轴x
for i=1:420
    if MAX<distance_X(i,1)
        MAX=distance_X(i,1);
        head=i;
        tail=i;
    end
    if MAX==distance_X(i,1)
        tail=i;
    end
end
x=floor((tail+head)/2);

%--------------------------------------------------------------------------

Y=[];%1列为head 2列为tail
for i=1:560
    head=0;
    tail=0;
    for j=1:420
        if I(j,i)==0
            head=j;
            break;
        end
    end
    for j=420:-1:1
        if I(j,i)==0
            tail=j;
            break;
        end
    end
    Y(i,:)=[head,tail];
end
%求head tail距离
for i=1:560
    distance_Y(i,1)=Y(i,2)-Y(i,1);
end
MAX=0;
%求得Y=290
y=290;
plot(290,202,'r*');