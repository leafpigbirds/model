% 1:��ҵ���                      
% 2:����                     x1     
% 3:��˰��Ԫ��               x2     	
% 4:�˾���ֵ��Ԫ/�ˣ�         x3    
% 5:��λ��ֵ�ܺģ���/��Ԫ��    x4   
% 6:�ۺ��ܺģ��֣�             Y
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