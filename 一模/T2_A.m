Ed=-23.43;
local=34.18;
A=atand(263/553);
B=atand(60/592);
C=atand(179/568);
D=atand(504/439);
angle=D;
fid = fopen('T2_D.txt','a+');
for i=0:182
    Ed=23.43-0.25676*i;
    result=roots( [sind(local)^2+cosd(angle)^2*cosd(local)^2 -2*sind(Ed)*sind(local) sind(Ed)^2-cosd(angle)^2*cosd(local)^2 ] );
    angle1=asind(result(1));%无用根
    angle2=asind(result(2));
%     w=acosd( ( result(1)-sind(Ed)*sind(local) )/ ( cosd(Ed)*cosd(local) ) );%无用时角
%     w=acosd( ( result(2)-sind(Ed)*sind(local) )/ ( cosd(Ed)*cosd(local) ) );
    data(i+1,1)=acosd( ( result(1)-sind(Ed)*sind(local) )/ ( cosd(Ed)*cosd(local) ) );
    data(i+1,2)=acosd( ( result(2)-sind(Ed)*sind(local) )/ ( cosd(Ed)*cosd(local) ) );
    w=min( data(i+1,1) , data(i+1,2) );%A角为-w
    t=w/15+12;
    data(i+1,3)=t;
%     Ed=-23.43;
%     local=34.18;
%     w=-acosd(-sind(Ed)*sind(local)/(cosd(Ed)*cosd(local)));
%     t=w/15+12;
%     T=(12-t)*2;%冬至日照总时间
end
for i=1:183
    fprintf(fid,'%2.4f %2.4f %2.4f\n',data(i,1),data(i,2),data(i,3));
end
fclose(fid);