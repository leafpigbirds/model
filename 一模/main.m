solar_alt=45.24;%������С̫���߶Ƚ�    ��Ϊ̫���߶Ƚ�  
solar_lati=0;%̫�����γ�� �� Ϊ̫�����γ��
local_lati=34.18;%���ص���γ��     ��Ϊ����γ��
solar_time=0;%̫��ʱ��     t = arc cos(-tan�� tan�� ) 
day=;
%̫�����γ��
solar_lati=23.45*sind((284+day)/365*360);
%̫��ʱ��
t=acosd(-tan(solar_lati)*tand(local_lati));
%̫���߶Ƚ�
% sind(solar_alt)=sind(solar_lati)*sind(local_lati)+cosd(solar_lati)*cosd(local_lati)*cosd(t);