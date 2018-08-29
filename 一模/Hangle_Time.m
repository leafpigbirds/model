angle=45.24;%所需太阳高度角
Ed=-23.43;
local=34.18;
fid = fopen('Hangle_Time.txt','a+');
for i=0:182
    w=-acosd((sind(angle)-sind(Ed+0.25676*i)*sind(local))/(cosd(Ed+0.25676*i)*cosd(local)));
    t=w/15+12;
    T=(12-t)*2;%全天日照总时间
    if isreal(w)==false
        t=0;
    end
    fprintf(fid,'day:%4d    %2.4f   %2.4f\n',i,t,24-t);
end
Ed=23.43;
for i=0:182
    w=-acosd((sind(angle)-sind(Ed-0.25676*i)*sind(local))/(cosd(Ed-0.25676*i)*cosd(local)));
    t=w/15+12;
    T=(12-t)*2;%全天日照总时间
    if isreal(w)==false
        t=0;
    end
    fprintf(fid,'day:%4d    %2.4f  %2.4f\n',182+i,t,24-t);
end
fclose(fid);