solar_alt=45.24;%������С̫���߶Ƚ�    ��Ϊ̫���߶Ƚ�  
solar_lati=-23.43;%̫�����γ�� �� Ϊ̫�����γ��
local_lati=34.18;%���ص���γ��     ��Ϊ����γ��
solar_time=0;%̫��ʱ��     t = arc cos(-tan�� tan�� ) 

% ans= acosd( ( sind(solar_alt)-sind(solar_lati)*sind(local_lati) )/ (cosd(solar_lati)*cosd(solar_lati) ) )
% sind(solar_alt)
% sind(solar_lati)*sind(local_lati)+cosd(solar_lati)*cosd(local_lati)*1
result=roots([1 -2*sind(solar_alt)*sind(local_lati) sind(solar_alt)^2-cosd(local_lati)^2]);%��̫�����γ�ȵ�sinֵ
result;
sin1=result(1);%���ø�
sin2=result(2);
a1=acosd(sin1/-0.398);
a2=acosd(sin2/-0.398);
day1=a1/0.9863;
day2=a2/0.9863;%�պ��յ�̫�����붬���յ����ڼ��

min_day_lati=-23.43+0.25*floor(day2);%��С̫�����γ��
solar_lati=min_day_lati;
% solar_lati=-23.43+20;
solar_time=acosd( ( sind(solar_alt)-sind(solar_lati)*sind(local_lati) )/( cosd(local_lati)*cosd(solar_lati) ) )
cnt_time=2*abs(solar_time)/15;
for i=floor(day2)+1:177
    solar_lati=solar_lati+0.25;
    solar_time=acosd( ( sind(solar_alt)-sind(solar_lati)*sind(local_lati) )/( cosd(local_lati)*cosd(solar_lati) ) );
    cnt_time=cnt_time+2*abs(solar_time)/15;
end
cnt_time*2;%�����ʱ��

cnt_day=0;
min_day_lati=-23.43+0.25*floor(day2);%��С̫�����γ��
solar_lati=min_day_lati;

for i=floor(day2)+1:177
    solar_lati=solar_lati+0.25;
    solar_time=acosd( ( sind(solar_alt)-sind(solar_lati)*sind(local_lati) )/( cosd(local_lati)*cosd(solar_lati) ) );
    if solar_time>45
        %i %�ӵ�154�쿪ʼ������200�����
        cnt_day=cnt_day+1;
    end
end
cnt_day*2;


% day1=asind(asind(sin1)/23.45)*365/360-284;
% day2=asind(asind(sin2)/23.45)*365/360-284;


% sind(solar_alt)=sind(solar_lati)*sind(local_lati)+cosd(solar_lati)*cosd(local_lati)*cosd(t);