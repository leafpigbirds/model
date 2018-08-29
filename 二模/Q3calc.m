% ����                          1
% ��˰��Ԫ��                    2
% �˾���ֵ��Ԫ/�ˣ�             3
% ��λ��ֵ�ܺģ���/��Ԫ��       4
clear;
clc;
filename='C:\Users\leafpigbirds\Desktop\Q3.xlsx';
sheet=1;
N=2545;
data=xlsread(filename,sheet);
data(:,1)=round(data(:,1));
%��ȡ���ֵ ��Сֵ
for i=1:3   
    Min(i)=min(data(:,i));
    Max(i)=max(data(:,i));
end
%���ݱ�׼������
Union=[];
for i=1:3
    union(:,i) = ( data(:,i)-Min(i) )./( Max(i)-Min(i) );
end
% union(:,5) = ( Max(5)-data(:,5) )./ ( Max(5)-Min(5) ); %��ָ��
% union(:,5) = ( data(:,5)-Min(5) )./( Max(5)-Min(5) );%��ָ��
k=1/log(N);
Sum=[];
for i=1:3
    cur=0;
    for j=1:N
        cur=cur+union(j,i);
    end
    Sum(i)=cur;
end
F=[];
for i=1:3
    F(:,i)=union(:,i)./Sum(i) ;
end
FF=[];
for i=1:3
    for j=1:N
        if F(j,i)==0 || F(j,i)==1
            FF(j,i)=0;
            continue;
        end
        FF(j,i)=F(j,i).*log(F(j,i));
    end
end
H=[];
for i=1:3
    H(i)=sum(FF(:,i));
end
W=[];
for i=1:3
    W(i)=(1-H(1,i))./(3-sum(H));
end