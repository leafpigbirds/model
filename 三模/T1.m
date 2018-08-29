data=xlsread('C:\Users\leafpigbirds\Desktop\database2.xlsx',2);
data=data(2:56,1:80)';%前80回数据读取 80*55
Z=zscore(data);%标准化处理
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
W=100*eig1/sum(eig1);
pareto(W);