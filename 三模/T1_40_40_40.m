data1=xlsread('C:\Users\leafpigbirds\Desktop\database2.xlsx',4);
N=18+1;
data=data1(2:N,1:40)';%��80�����ݶ�ȡ 40*55
% Z=zscore(data);%��׼������
Z=data-mean(data);
cov_M=cov(Z);%Э�������
[Vectors,Values]=eig(cov_M);%�������� ��������ֵ��
D=diag(Values);%��ȡ������
eig1=sort(D,'descend');%�����ʴ�С����
V=fliplr(Vectors);%����D��������
NEW=Z*V(:,1:2);
plot(NEW(:,1),NEW(:,2),'b*');
hold on;

data=data1(2:N,41:80)';%��40�����ݶ�ȡ 40*55
% Z=zscore(data);%��׼������
Z=data-mean(data);
cov_M=cov(Z);%Э�������
[Vectors,Values]=eig(cov_M);%�������� ��������ֵ��
D=diag(Values);%��ȡ������
eig1=sort(D,'descend');%�����ʴ�С����
V=fliplr(Vectors);%����D��������
NEW=Z*V(:,1:2);
plot(NEW(:,1),NEW(:,2),'g.');
hold on;

data=data1(2:N,81:120)';%��40�����ݶ�ȡ 40*55
% Z=zscore(data);%��׼������
Z=data-mean(data);
cov_M=cov(Z);%Э�������
[Vectors,Values]=eig(cov_M);%�������� ��������ֵ��
D=diag(Values);%��ȡ������
eig1=sort(D,'descend');%�����ʴ�С����
V=fliplr(Vectors);%����D��������
NEW=Z*V(:,1:2);
plot(NEW(:,1),NEW(:,2),'r+');
