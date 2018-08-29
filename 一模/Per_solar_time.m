angle=45.24;%����̫���߶Ƚ�
Ed=-23.43;%̫����γ
local=34.18;%����γ��
w=0;%̫��ʱ��
data=0;
% 14#
NUM=17;
Max_floor=34;%������¥¥��
Max_cover_floor=30;%�������¥¥��
Max_high=98.6;%������¥¥��
Max_cover_high=87;%�������¥¥��
building_dis=64.52;%¥���
per_floor=Max_high/Max_floor;%����¥ÿ��¥�߶�
per_cover_floor=Max_cover_high/Max_cover_floor;%����¥ÿ��¥�߶�
fid = fopen('T3_Per_solar_time.txt','a+');
% fprintf(fid,'%2d#\n',NUM);
for i=Max_floor:-1:1
    cur_cover_high=Max_cover_high-per_floor*i;%��ǰ����¥�߶�
    cur_cover_high;
    if cur_cover_high<0
        cur_cover_high=0;
    end
    angle=atand(cur_cover_high/building_dis);%��Ҫ��С��̫���߶Ƚ�
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