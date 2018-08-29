solar_alt=45.24;%所需最小太阳高度角    α为太阳高度角  
solar_lati=0;%太阳赤道纬度 δ 为太阳赤道纬度
local_lati=34.18;%当地地理纬度     φ为地理纬度
solar_time=0;%太阳时角     t = arc cos(-tanδ tanφ ) 
day=;
%太阳赤道纬度
solar_lati=23.45*sind((284+day)/365*360);
%太阳时角
t=acosd(-tan(solar_lati)*tand(local_lati));
%太阳高度角
% sind(solar_alt)=sind(solar_lati)*sind(local_lati)+cosd(solar_lati)*cosd(local_lati)*cosd(t);