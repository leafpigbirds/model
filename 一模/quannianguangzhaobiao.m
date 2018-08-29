Ed=-23.43;
local=34.18;
fid = fopen('quannianguangzhaobiao.txt','a+');
for i=0:182
    w=-acosd(-sind(Ed+0.25676*i)*sind(local)/(cosd(Ed+0.25676*i)*cosd(local)));
    t=w/15+12;
    T=(12-t)*2;%全天日照总时间
    fprintf(fid,'day:%4d    %2.4f\n',i,T);
end
Ed=23.43;
for i=0:182
    w=-acosd(-sind(Ed-0.25676*i)*sind(local)/(cosd(Ed-0.25676*i)*cosd(local)));
    t=w/15+12;
    T=(12-t)*2;%全天日照总时间
    fprintf(fid,'day:%4d    %2.4f\n',182+i,T);
end
fclose(fid);