data1=xlsread('C:\Users\leafpigbirds\Desktop\data2.xlsx',1);
 N=50+1;
data=data1(2:N,:)';%ǰ80�����ݶ�ȡ 80*55
Z=zscore(data);%��׼������
% Z=data-mean(data);
cov_M=cov(Z);%Э�������
[Vectors,Values]=eig(cov_M);%�������� ��������ֵ��
D=diag(Values);%��ȡ������
eig1=sort(D,'descend');%�����ʴ�С����
V=fliplr(Vectors);%����D��������
S=0;
i=0;
while S/sum(eig1)<0.85
    i=i+1;
    S=S+eig1(i);
end
NEW=Z*V(:,1:i);
figure(2);
W=100*eig1/sum(eig1);
pareto(W);
figure(1);
% plot(NEW(1:80,1),NEW(1:80,2),'b*');
scatter3(NEW(1:40,1),NEW(1:40,2),NEW(1:40,3),'b*');
hold on;
% plot(NEW(81:120,1),NEW(81:120,2),'r+');
scatter3(NEW(41:80,1),NEW(41:80,2),NEW(41:80,3),'b*');
hold on;
scatter3(NEW(81:120,1),NEW(81:120,2),NEW(81:120,3),'r+');