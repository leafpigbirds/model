angle=45.24;%所需太阳高度角
Ed=-23.43;%太阳赤纬
local=34.18;%地理纬度
w=0;%太阳时角
% 14#
NUM=4;
Max_floor=34;%最大计算楼楼层
Max_cover_floor=3;%最大遮阳楼楼层
Max_high=98.6;%最大计算楼楼高
Max_cover_high=11.25;%最大遮阳楼楼高
building_dis=23.86;%楼间距
per_floor=Max_high/Max_floor;%计算楼每层楼高度
per_cover_floor=Max_cover_high/Max_cover_floor;%遮阳楼每层楼高度
fid = fopen('T3.txt','a+');
fprintf(fid,'%2d#\n',NUM);
for i=Max_floor:-1:1
    cur_cover_high=Max_cover_high-per_floor*i;%当前遮阳楼高度
    cur_cover_high
    if cur_cover_high<0
        cur_cover_high=0;
    end
    angle=atand(cur_cover_high/building_dis);%需要最小的太阳高度角
    sin_angle=sind(angle);
    t=acosd( ( sin_angle - sind( Ed )*sind( local ) )/ ( cosd( Ed )*cosd( local ) ) );
    cur_time = 2*abs(t)/15 ;
    if isreal(t)==false
        cur_time=0 ;
    end
%     fprintf(fid,'Floor:%2d  Time:%6.3f  Angle:%6.3f\n',i,cur_time,angle);
    fprintf(fid,'Floor:%2d  Time:%6.3f\n',i,cur_time);
end
fclose(fid);