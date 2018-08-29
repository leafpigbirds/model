angle=45.24;%所需太阳高度角
Ed=-23.43;%太阳赤纬
local=34.18;%地理纬度
w=0;%太阳时角
result=roots([1 -2*sind(angle)*sind(local) (sind(angle))^2-(cosd(local))^2] );
sinx_Ed=result(2);
a_Ed=acosd(sinx_Ed/-0.398);
day_Ed=a_Ed/0.9863+356;
day_Ed-365;
%有光照时间区域——————————————————————————————————————
Ed=-23.43;
for i=0:182
    i%第52天
    asind (sind( Ed+0.25*i ) * sind( local ) + cosd( Ed+0.25*i ) * cosd( local ) )%当日最大太阳高度角
end
Ed=23.43
for i=0:182
    i%有136天
    asind (sind( Ed-0.25*i ) * sind( local ) + cosd( Ed-0.25*i ) * cosd( local ) )%当日最大太阳高度角
end
%—————————————————————————————————————————————
%共267天