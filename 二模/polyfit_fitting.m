% 1:人数                     x1     
% 2:利税（元）               x2     	
% 3:现价产值（元）           x3    
clear;
clc;
fid = fopen('T2_Function.txt','a+');
filename='C:\Users\leafpigbirds\Desktop\T02.xls';
sheet=1;
fprintf(fid,'Sheet:%d\n',sheet);
data=xlsread(filename,sheet);
N=data(1,6);
n=4;
x(:,1)=data(:,1);
x(:,2)=data(:,2);
x(:,3)=data(:,3);
people=x(:,1);
profit=x(:,2);
sum=x(:,3);
Y=data(:,4);
p1=polyfit(people,Y,1);
figure(1);
plot(people,Y,'r.',people,polyval(p1,people),'-.');
% fprintf(fid,'%.6f   %.6f\n',p1(1),p1(2));
p1=polyfit(profit,Y,1);
figure(2);
plot(profit,Y,'r.',profit,polyval(p1,profit),'-.');
% fprintf(fid,'%.6f   %.6f\n',p1(1),p1(2));
p1=polyfit(sum,Y,1);
figure(3);
plot(sum,Y,'r.',sum,polyval(p1,sum),'-.');
% fprintf(fid,'%.6f   %.6f\n\n',p1(1),p1(2));
% p2=p1(1)*people+p1(2);
% figure(2);
fclose(fid);