clc;
clear;
load big_out.txt;
a=big_out;
dx=[1;1;1;0;0;-1;-1;-1;2;2;2;0;0;-2;-2;-2];
dy=[1;-1;0;1;-1;1;-1;0;2;-2;0;2;-2;2;-2;0];
for i=1:4200
    for j=1:5600
        v(i,j)=0;
    end
end
tic;
point=[];% 1为序号 2为个数
for i=1:20
    point(i,1)=i;
end
id=0;
for i=1:4200
    for j=1:5600
        if a(i,j)==1&&v(i,j)==0
            id=id+1;
            tail=1;
            head=0;
            queue(tail,1)=i;
            queue(tail,2)=j;
            while head~=tail
                head=head+1;
                for k=1:16
                    cur_x=queue(head,1)+dx(k,1);%移动x
                    cur_y=queue(head,2)+dy(k,1);%移动y
                    if a(cur_x,cur_y)~=1||v(cur_x,cur_y)~=0
                        continue ;%可以访问 已经访问
                    end
                    if cur_x<0||cur_x>420||cur_y<0||cur_y>560
                        continue ;%当前坐标是否超出界线
                    end
                    v(cur_x,cur_y)=id;
                    tail=tail+1;
                    queue(tail,1)=cur_x;
                    queue(tail,2)=cur_y;
                end
            end
        end
    end
end
cnt=[zeros(20,1)];
for i=1:4200
    for j=1:5600
        if v(i,j)~=0
            cur=v(i,j);
            cnt(cur)=cnt(cur)+1;
        end
    end
end
toc;
disp(['运行时间: ',num2str(toc)]);