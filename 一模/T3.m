angle=45.24;%����̫���߶Ƚ�
Ed=-23.43;%̫����γ
local=34.18;%����γ��
w=0;%̫��ʱ��
% 14#
NUM=4;
Max_floor=34;%������¥¥��
Max_cover_floor=3;%�������¥¥��
Max_high=98.6;%������¥¥��
Max_cover_high=11.25;%�������¥¥��
building_dis=23.86;%¥���
per_floor=Max_high/Max_floor;%����¥ÿ��¥�߶�
per_cover_floor=Max_cover_high/Max_cover_floor;%����¥ÿ��¥�߶�
fid = fopen('T3.txt','a+');
fprintf(fid,'%2d#\n',NUM);
for i=Max_floor:-1:1
    cur_cover_high=Max_cover_high-per_floor*i;%��ǰ����¥�߶�
    cur_cover_high
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
%     fprintf(fid,'Floor:%2d  Time:%6.3f  Angle:%6.3f\n',i,cur_time,angle);
    fprintf(fid,'Floor:%2d  Time:%6.3f\n',i,cur_time);
end
fclose(fid);