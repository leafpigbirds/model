data=xlsread('C:\Users\leafpigbirds\Desktop\database2.xlsx',2);
data=data(2:56,1:80)';%ǰ80�����ݶ�ȡ 80*55
Z=zscore(data);%��׼������
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
W=100*eig1/sum(eig1);
pareto(W);