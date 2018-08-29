Ed=-23.43;
local=34.18;
fid = fopen('quannianrizhao.txt','a+');
for i=0:182
    sun_rise=-acosd( -tand(34.18)*tand(-23.43+0.25676*i) )/15+12;
    sun_set=24-(-acosd( -tand(34.18)*tand(-23.43+0.25676*i) )/15+12);
    fprintf(fid,'day:%4d    %2.4f   %2.4f\n',i,sun_rise,sun_set);
end
Ed=23.43;
for i=0:182
    sun_rise=-acosd( -tand(34.18)*tand(23.43-0.25676*i) )/15+12;
    sun_set=24-(-acosd( -tand(34.18)*tand(23.43-0.25676*i) )/15+12);
    fprintf(fid,'day:%4d    %2.4f   %2.4f\n',182+i,sun_rise,sun_set);
end
