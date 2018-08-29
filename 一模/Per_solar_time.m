angle=45.24;%所需太阳高度角
Ed=-23.43;%太阳赤纬
local=34.18;%地理纬度
w=0;%太阳时角
data=0;
% 14#
NUM=17;
Max_floor=34;%最大计算楼楼层
Max_cover_floor=30;%最大遮阳楼楼层
Max_high=98.6;%最大计算楼楼高
Max_cover_high=87;%最大遮阳楼楼高
building_dis=64.52;%楼间距
per_floor=Max_high/Max_floor;%计算楼每层楼高度
per_cover_floor=Max_cover_high/Max_cover_floor;%遮阳楼每层楼高度
fid = fopen('T3_Per_solar_time.txt','a+');
% fprintf(fid,'%2d#\n',NUM);
for i=Max_floor:-1:1
    cur_cover_high=Max_cover_high-per_floor*i;%当前遮阳楼高度
    cur_cover_high;
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
    data=data+cur_time;
end
    fprintf(fid,'NUM:%d\nPer_solar_time:%2.4f\n',NUM,data/Max_floor);
fclose(fid);