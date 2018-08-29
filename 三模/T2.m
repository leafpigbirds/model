data1=xlsread('C:\Users\leafpigbirds\Desktop\data2.xlsx',1);
 N=50+1;
data=data1(2:N,:)';%前80回数据读取 80*55
Z=zscore(data);%标准化处理
% Z=data-mean(data);
cov_M=cov(Z);%协方差矩阵
[Vectors,Values]=eig(cov_M);%特征向量 特征根（值）
D=diag(Values);%提取特征根
eig1=sort(D,'descend');%贡献率从小到大
V=fliplr(Vectors);%依照D重新排列
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