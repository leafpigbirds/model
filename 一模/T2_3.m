angle=45.24;%����̫���߶Ƚ�
Ed=-23.43;%̫����γ
local=34.18;%����γ��
w=0;%̫��ʱ��
sin_angle=sind(angle);
for i=0:182
    i
   acosd( ( sin_angle - sind( Ed+0.25*i )*sind( local ) )/ ( cosd( Ed+0.25*i )*cosd( local ) ) ) %̫��ʱ��
end
Ed=23.43;
for i=0:182
    i
   acosd( ( sin_angle - sind( Ed-0.25*i )*sind( local ) )/ ( cosd( Ed-0.25*i )*cosd( local ) ) ) %̫��ʱ��
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