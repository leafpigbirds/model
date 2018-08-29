angle=45.24;%所需太阳高度角
Ed=-23.43;%太阳赤纬
local=34.18;%地理纬度
w=0;%太阳时角
sum_angle=asind(sind(Ed)*sind(local)+cosd(Ed)*cosd(local)*cosd(-45))%9点太阳高度角
A=acosd( sind(sum_angle)*sind(local)-sind(Ed) ) / ( cosd(sum_angle)*cosd(local) )

%https://mip.d1xz.net/rili/jieqi/art134504.aspx   白昼黑夜计算