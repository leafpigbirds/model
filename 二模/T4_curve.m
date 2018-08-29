% 1:企业编号                      
% 2:人数                     x1     
% 3:利税（元）               x2     	
% 4:人均产值（元/人）         x3    
% 5:单位产值能耗（吨/万元）    x4   
% 6:综合能耗（吨）             Y
filename='C:\Users\leafpigbirds\Desktop\T43.xlsx';
sheet=1;
data=xlsread(filename,sheet);
N=2545;
profit=data(:,1);
Y=data(:,2);
X=[ones(N,1),profit];
[b,bint,r,rint,stats]=regress(Y,X);
t=[1:N]';
y_fitting=X(t,:)*b;
figure(1);
plot(profit,y_fitting,'-.',profit,Y,'r.');