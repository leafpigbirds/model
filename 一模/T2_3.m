angle=45.24;%所需太阳高度角
Ed=-23.43;%太阳赤纬
local=34.18;%地理纬度
w=0;%太阳时角
sin_angle=sind(angle);
for i=0:182
    i
   acosd( ( sin_angle - sind( Ed+0.25*i )*sind( local ) )/ ( cosd( Ed+0.25*i )*cosd( local ) ) ) %太阳时角
end
Ed=23.43;
for i=0:182
    i
   acosd( ( sin_angle - sind( Ed-0.25*i )*sind( local ) )/ ( cosd( Ed-0.25*i )*cosd( local ) ) ) %太阳时角
end

Ed=-23.43;
cnt_time=0 ;
for i=52:182
    t=acosd( ( sin_angle - sind( Ed+0.25*i )*sind( local ) )/ ( cosd( Ed+0.25*i )*cosd( local ) ) );
    cnt_time = cnt_time + 2*abs(t)/15 ;
end
Ed=23.43;
for i=0:136
    t=acosd( ( sin_angle - sind( Ed-0.25*i )*sind( local ) )/ ( cosd( Ed-0.25*i )*cosd( local ) ) );
    cnt_time = cnt_time + 2*abs(t)/15 ;
end
cnt_time