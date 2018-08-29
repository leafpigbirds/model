Ed=-23.43;%Ì«Ñô³àÎ³
local=34.18;%µØÀíÎ³¶È
w=-46;%Ì«ÑôÊ±½Ç
H=98.6;
H1=0;
data=[];
for i=0:45
    w=w+1;
    angle=asind( sind(Ed)*sind(local)+cosd(Ed)*cosd(local)*cos(w) );
    Fangle=cosd( sind(Ed)-sind(angle)*sind(local) )/( cosd(angle)*cosd(local) );
    L=74.78/cosd(Fangle);
    H1=H-L*tand(angle);
    data(i+1,1)=w;
    data(i+1,2)=H1;
    data(i+1,3)=angle;
    data(i+1,4)=Fangle;
    data(i+1,5)=L;
end
plot(data(:,1),data(:,2),'-r');
