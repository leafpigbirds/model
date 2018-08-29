% 企业编号                      NONE
% 人数                          正
% 利税（元）                    正	
% 人均产值（元/人）             正	
% 单位产值能耗（吨/万元）       负
clear;
clc;
filename='C:\Users\leafpigbirds\Desktop\Qcalc.xlsx';
sheet=1;
N=2545;
data=xlsread(filename,sheet);
data(:,2)=round(data(:,2));
%获取最大值 最小值
for i=2:5   
    Min(i)=min(data(:,i));
    Max(i)=max(data(:,i));
end
%数据标准化处理
Union=[];
for i=2:4
    union(:,i) = ( data(:,i)-Min(i) )./( Max(i)-Min(i) );
end
union(:,5) = ( Max(5)-data(:,5) )./ ( Max(5)-Min(5) ); %逆指标
% union(:,5) = ( data(:,5)-Min(5) )./( Max(5)-Min(5) );%正指标
k=1/log(N);
Sum=[];
for i=2:5
    cur=0;
    for j=1:N
        cur=cur+union(j,i);
    end
    Sum(i)=cur;
end
F=[];
for i=2:5
    F(:,i)=union(:,i)./Sum(i) ;
end
FF=[];
for i=2:5
    for j=1:N
        if F(j,i)==0 || F(j,i)==1
            FF(j,i)=0;
            continue;
        end
        FF(j,i)=F(j,i).*log(F(j,i));
    end
end
H=[];
for i=2:5
    H(i)=sum(FF(:,i));
end
W=[];
for i=2:5
    W(i)=(1-H(1,i))./(4-sum(H));
end