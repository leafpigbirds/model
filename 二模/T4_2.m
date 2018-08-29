% 1:能源总耗          x1     
% 3:一次项系数a       x2     	
% 5:常数项b           x3    
clear;
clc;
% fid = fopen('T2_Function.txt','a+');
filename='C:\Users\leafpigbirds\Desktop\Q2,3.xlsx';
sheet=2;
data=xlsread(filename,sheet);
ax=[];
ax(:,1)=data(:,1);
ax(:,2)=data(:,3);
ax(:,3)=data(:,5);
ax(:,4)=data(:,7);
e1=ax(1,1);
e2=ax(2,1);
e3=ax(3,1);
e4=ax(4,1);
e5=ax(5,1);
e6=ax(6,1);
sumE=sum(ax(:,1));
a1=ax(1,2);
a2=ax(2,2);
a3=ax(3,2);
a4=ax(4,2);
a5=ax(5,2);
a6=ax(6,2);
b1=ax(1,3);
b2=ax(2,3);
b3=ax(3,3);
b4=ax(4,3);
b5=ax(5,3);
b6=ax(6,3);
x1=ax(1,4);
x2=ax(2,4);
x3=ax(3,4);
x4=ax(4,4);
x5=ax(5,4);
x6=ax(6,4);
sumX=sum(ax(:,4));
f=@(x)( ( ( x1-x(1) )/x1 )^2+( ( x2-x(2) )/x2 )^2+( ( x3-x(3) )/x3 )^2+( ( x4-x(4) )/x4 )^2+( ( x5-x(5) )/x5 )^2+( ( x6-x(6) )/x6 )^2 );
x0=ones(6,1);
% A=[-a1 0 0 0 0 0 
%    0 -a2 0 0 0 0 
%    0 0 -a3 0 0 0
%    0 0 0 -a4 0 0
%    0 0 0 0 -a5 0
%    0 0 0 0 0 -a6
%    -1 -1 -1 -1 -1 -1
%     1 1 1 1 1 1];
% b=[b1;b2;b3;b4;b5;b6;-1.08*sumX;1.08001*sumX];
% A=[-1 -1 -1 -1 -1 -1
%     1 1 1 1 1 1];
% b=[-1.08*sumX;1.09*sumX];
A=[-a1 -a2 -a3 -a4 -a5 -a6];
b=[-sumX];
Aeq=[a1 a2 a3 a4 a5 a6];
beq=[0.95*sumE-b1-b2-b3-b4-b5-b6];
lb=[0;0;0;0;0;0];
[y,fval]=fmincon(f,x0,A,b,Aeq,beq,lb,[]);