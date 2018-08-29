solar_alt=45.24;%所需最小太阳高度角    α为太阳高度角  
solar_lati=-23.43;%太阳赤道纬度 δ 为太阳赤道纬度
local_lati=34.18;%当地地理纬度     φ为地理纬度
solar_time=0;%太阳时角     t = arc cos(-tanδ tanφ ) 

% ans= acosd( ( sind(solar_alt)-sind(solar_lati)*sind(local_lati) )/ (cosd(solar_lati)*cosd(solar_lati) ) )
% sind(solar_alt)
% sind(solar_lati)*sind(local_lati)+cosd(solar_lati)*cosd(local_lati)*1
result=roots([1 -2*sind(solar_alt)*sind(local_lati) sind(solar_alt)^2-cosd(local_lati)^2]);%求太阳赤道纬度的sin值
result;
sin1=result(1);%无用根
sin2=result(2);
a1=acosd(sin1/-0.398);
a2=acosd(sin2/-0.398);
day1=a1/0.9863;
day2=a2/0.9863;%刚好照到太阳距离冬至日的日期间隔

min_day_lati=-23.43+0.25*floor(day2);%最小太阳赤道纬度
solar_lati=min_day_lati;
% solar_lati=-23.43+20;
solar_time=acosd( ( sind(solar_alt)-sind(solar_lati)*sind(local_lati) )/( cosd(local_lati)*cosd(solar_lati) ) )
cnt_time=2*abs(solar_time)/15;
for i=floor(day2)+1:177
    solar_lati=solar_lati+0.25;
    solar_time=acosd( ( sind(solar_alt)-sind(solar_lati)*sind(local_lati) )/( cosd(local_lati)*cosd(solar_lati) ) );
    cnt_time=cnt_time+2*abs(solar_time)/15;
end
cnt_time*2;%最后总时长

cnt_day=0;
min_day_lati=-23.43+0.25*floor(day2);%最小太阳赤道纬度
solar_lati=min_day_lati;

for i=floor(day2)+1:177
    solar_lati=solar_lati+0.25;
    solar_time=acosd( ( sind(solar_alt)-sind(solar_lati)*sind(local_lati) )/( cosd(local_lati)*cosd(solar_lati) ) );
    if solar_time>45
        %i %从第154天开始，到第200天结束
        cnt_day=cnt_day+1;
    end
end
cnt_day*2;


% day1=asind(asind(sin1)/23.45)*365/360-284;
% day2=asind(asind(sin2)/23.45)*365/360-284;


% sind(solar_alt)=sind(solar_lati)*sind(local_lati)+cosd(solar_lati)*cosd(local_lati)*cosd(t);