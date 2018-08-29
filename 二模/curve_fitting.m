% 1:企业编号                      
% 2:人数                     x1     
% 3:利税（元）               x2     	
% 4:人均产值（元/人）         x3    
% 5:单位产值能耗（吨/万元）    x4   
% 6:综合能耗（吨）             Y
filename='C:\Users\leafpigbirds\Desktop\T01.xls';
sheet=1;
data=xlsread(filename,sheet);
N=data(1,8);
n=4;
x(:,1)=data(:,2);
x(:,2)=data(:,3);
x(:,3)=data(:,4);
x(:,4)=data(:,5);
people=x(:,1);
profit=x(:,2);
per_profit=x(:,3);
per_energy=x(:,4);
Y=data(:,6);
X=[ones(N,1),people];
[b,bint,r,rint,stats]=regress(Y,X);
t=[1:N]';
y_fitting=X(t,:)*b;
figure(1);
plot(people,y_fitting,'-.',people,Y,'b.');